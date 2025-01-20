@interface VCPVideoMetaSegmentAnalyzer
- (VCPVideoMetaSegmentAnalyzer)init;
- (id)privateResults;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
@end

@implementation VCPVideoMetaSegmentAnalyzer

- (VCPVideoMetaSegmentAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPVideoMetaSegmentAnalyzer;
  v2 = [(VCPVideoMetaSegmentAnalyzer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    results = v2->_results;
    v2->_results = (NSMutableArray *)v3;

    if (v2->_results) {
      v5 = v2;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v17 = v5;
  if (v5)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = objc_msgSend(v5, "items", v5);
    id obj = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          results = self->_results;
          v25[0] = @"start";
          if (v10) {
            [v10 time];
          }
          else {
            memset(&v19[1], 0, sizeof(CMTime));
          }
          CMTime time = v19[1];
          CFDictionaryRef v12 = CMTimeCopyAsDictionary(&time, 0);
          v25[1] = @"duration";
          v26[0] = v12;
          if (v10) {
            [v10 duration];
          }
          else {
            memset(v19, 0, 24);
          }
          CMTime time = v19[0];
          CFDictionaryRef v13 = CMTimeCopyAsDictionary(&time, 0);
          v26[1] = v13;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
          [(NSMutableArray *)results addObject:v14];
        }
        v6 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
      }
      while (v7);
    }

    int v15 = 0;
  }
  else
  {
    int v15 = -50;
  }

  return v15;
}

- (id)privateResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_results count];
  if (v3)
  {
    results = self->_results;
    v6 = @"MetaSegmentResults";
    v7[0] = results;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end