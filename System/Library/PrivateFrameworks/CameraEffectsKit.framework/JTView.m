@interface JTView
+ (Class)layerClass;
- (BOOL)debuggingUIEnabled;
- (void)enableDebugMode:(id)a3;
- (void)layoutSubviews;
- (void)setDebuggingUIEnabled:(BOOL)a3;
@end

@implementation JTView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)JTView;
  [(JTView *)&v3 layoutSubviews];
  if ([(JTView *)self debuggingUIEnabled]) {
    [(JTView *)self enableDebugMode:self];
  }
}

- (void)enableDebugMode:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [v4 subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        [(JTView *)self enableDebugMode:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = objc_msgSend(v4, "layer", 0);
  v11 = [v10 sublayers];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v12)
  {

LABEL_20:
    v19 = [[JTLayer alloc] initWithDebugEnabled];
    [v4 bounds];
    -[JTLayer setFrame:](v19, "setFrame:");
    v20 = [v4 layer];
    [v20 addSublayer:v19];

    goto LABEL_21;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v22;
  do
  {
    for (uint64_t j = 0; j != v13; ++j)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        char v14 = [v18 debuggingUIEnabled];
        [v4 bounds];
        objc_msgSend(v18, "setFrame:");
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
  }
  while (v13);

  if ((v14 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_21:
}

- (BOOL)debuggingUIEnabled
{
  return self->_debuggingUIEnabled;
}

- (void)setDebuggingUIEnabled:(BOOL)a3
{
  self->_debuggingUIEnabled = a3;
}

@end