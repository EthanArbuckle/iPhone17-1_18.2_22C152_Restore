@interface VCPSmartStyleMetaAnalyzer
- (VCPSmartStyleMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4;
- (id)privateResults;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
@end

@implementation VCPSmartStyleMetaAnalyzer

- (VCPSmartStyleMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VCPSmartStyleMetaAnalyzer;
  v4 = [(VCPSmartStyleMetaAnalyzer *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    results = v4->_results;
    v4->_results = (NSMutableArray *)v5;

    if (v4->_results) {
      v7 = v4;
    }
    else {
      v7 = 0;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return -50;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [a3 items];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = [v8 dataType];
        int v10 = [v9 isEqualToString:@"com.apple.metadata.datatype.raw-data"];

        if (v10)
        {
          results = self->_results;
          v24 = @"attributes";
          v22 = @"MetaSSInfoResults";
          v12 = [v8 value];
          v23 = v12;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v25 = v13;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          [(NSMutableArray *)results addObject:v14];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }

  return 0;
}

- (id)privateResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_results count];
  if (v3)
  {
    results = self->_results;
    uint64_t v6 = @"MetaSSResults";
    v7[0] = results;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end