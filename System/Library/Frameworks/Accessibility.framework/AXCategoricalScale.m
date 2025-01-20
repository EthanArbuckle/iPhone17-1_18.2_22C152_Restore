@interface AXCategoricalScale
- (AXCategoricalScale)init;
- (AXCategoricalScale)initWithDomain:(id)a3;
- (void)init;
@end

@implementation AXCategoricalScale

- (AXCategoricalScale)init
{
  v3 = AXAudioGraphLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[AXCategoricalScale init](v3);
  }

  return [(AXCategoricalScale *)self initWithDomain:MEMORY[0x263EFFA68]];
}

- (AXCategoricalScale)initWithDomain:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXCategoricalScale;
  v5 = [(AXCategoricalScale *)&v19 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[AXDataPointValue valueWithCategory:](AXDataPointValue, "valueWithCategory:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
    [(AXScale *)v5 setDomain:v13];
  }
  return v5;
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213B3D000, log, OS_LOG_TYPE_ERROR, "Don't call -[AXCategoricalScale init], use -initWithDomain: instead", v1, 2u);
}

@end