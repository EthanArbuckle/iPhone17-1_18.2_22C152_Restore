@interface CAMVideoDepthDataEnabledCommand
- (BOOL)_isEnabled;
- (CAMVideoDepthDataEnabledCommand)initWithCoder:(id)a3;
- (CAMVideoDepthDataEnabledCommand)initWithEnabled:(BOOL)a3;
- (CAMVideoDepthDataEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoDepthDataEnabledCommand

- (CAMVideoDepthDataEnabledCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoDepthDataEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMVideoDepthDataEnabledCommand *)self initWithEnabled:0];
}

- (CAMVideoDepthDataEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMVideoDepthDataEnabledCommandKey"];
  return [(CAMVideoDepthDataEnabledCommand *)self initWithEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoDepthDataEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMVideoDepthDataEnabledCommandKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMVideoDepthDataEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 currentMovieFileOutput];
  objc_super v6 = [v4 currentVideoDeviceInput];
  uint64_t v7 = [v4 currentCaptureSession];
  objc_super v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    v9 = (void *)*MEMORY[0x263EF9CF8];
    v10 = [v5 connectionWithMediaType:*MEMORY[0x263EF9CF8]];
    BOOL v11 = [(CAMVideoDepthDataEnabledCommand *)self _isEnabled];
    int v12 = [v10 isEnabled];
    if (v11 || !v10)
    {
      if (((!v11 | v12) & 1) == 0)
      {
        v24 = v10;
        id v26 = v4;
        if (objc_opt_respondsToSelector()) {
          [v5 setDepthCaptureEnabled:1];
        }
        v25 = v6;
        v13 = [v6 ports];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v19 = [v18 mediaType];

              if (v19 == v9)
              {
                v20 = (void *)MEMORY[0x263EFA560];
                v32 = v18;
                v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
                v22 = [v20 connectionWithInputPorts:v21 output:v5];

                if (v22 && [v8 canAddConnection:v22])
                {
                  [v8 addConnection:v22];
                }
                else
                {
                  v23 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "Unable to add depth connection to capture session", buf, 2u);
                  }
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }
          while (v15);
        }

        objc_super v6 = v25;
        id v4 = v26;
        v10 = v24;
      }
    }
    else
    {
      [v8 removeConnection:v10];
      if (objc_opt_respondsToSelector()) {
        [v5 setDepthCaptureEnabled:0];
      }
    }
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end