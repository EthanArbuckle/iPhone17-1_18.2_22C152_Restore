@interface VSPluginTTSForwardStreamHandler
- (SATTSSpeechSynthesisStreaming)streamObject;
- (VSPluginTTSForwardStreamHandler)initWithDictionary:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)setStreamObject:(id)a3;
@end

@implementation VSPluginTTSForwardStreamHandler

- (void).cxx_destruct
{
}

- (void)setStreamObject:(id)a3
{
}

- (SATTSSpeechSynthesisStreaming)streamObject
{
  return self->_streamObject;
}

- (void)performWithCompletion:(id)a3
{
  v7 = (void (**)(id, void))a3;
  v4 = [(VSPluginTTSForwardStreamHandler *)self streamObject];

  if (v4)
  {
    v5 = [MEMORY[0x263F84EA0] sharedInstance];
    v6 = [(VSPluginTTSForwardStreamHandler *)self streamObject];
    [v5 forwardStreamObject:v6];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (VSPluginTTSForwardStreamHandler)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VSPluginTTSForwardStreamHandler;
  v5 = [(VSPluginTTSForwardStreamHandler *)&v18 init];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F646F8];
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F646F8]];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F65CC8]];

    if (v8)
    {
      v9 = (objc_class *)MEMORY[0x263F64EA0];
    }
    else
    {
      v10 = [v4 objectForKeyedSubscript:v6];
      int v11 = [v10 isEqualToString:*MEMORY[0x263F65CD0]];

      if (v11)
      {
        v9 = (objc_class *)MEMORY[0x263F64EA8];
      }
      else
      {
        v12 = [v4 objectForKeyedSubscript:v6];
        int v13 = [v12 isEqualToString:*MEMORY[0x263F65CD8]];

        if (!v13)
        {
          streamObject = VSGetLogDefault();
          if (os_log_type_enabled(streamObject, OS_LOG_TYPE_ERROR))
          {
            v17 = [v4 objectForKeyedSubscript:*MEMORY[0x263F65150]];
            *(_DWORD *)buf = 136315394;
            v20 = "-[VSPluginTTSForwardStreamHandler initWithDictionary:]";
            __int16 v21 = 2112;
            v22 = v17;
            _os_log_error_impl(&dword_229253000, streamObject, OS_LOG_TYPE_ERROR, "%s Unknown class %@", buf, 0x16u);
          }
          goto LABEL_9;
        }
        v9 = (objc_class *)MEMORY[0x263F64EB0];
      }
    }
    uint64_t v14 = [[v9 alloc] initWithDictionary:v4];
    streamObject = v5->_streamObject;
    v5->_streamObject = (SATTSSpeechSynthesisStreaming *)v14;
LABEL_9:
  }
  return v5;
}

@end