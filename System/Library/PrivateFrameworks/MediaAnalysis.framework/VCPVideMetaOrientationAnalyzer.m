@interface VCPVideMetaOrientationAnalyzer
- (VCPVideMetaOrientationAnalyzer)init;
- (id)privateResults;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
@end

@implementation VCPVideMetaOrientationAnalyzer

- (VCPVideMetaOrientationAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPVideMetaOrientationAnalyzer;
  v2 = [(VCPVideMetaOrientationAnalyzer *)&v8 init];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19 = v4;
  if (!v4)
  {
    int v17 = -50;
    goto LABEL_22;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v4 items];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (!v5) {
    goto LABEL_20;
  }
  uint64_t v21 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v25 != v21) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      objc_super v8 = [v7 numberValue];
      v9 = [v7 numberValue];
      if ([v9 integerValue] <= 0)
      {

LABEL_11:
        objc_super v8 = &unk_1F15ED0B0;
        goto LABEL_12;
      }
      v10 = [v7 numberValue];
      BOOL v11 = [v10 integerValue] > 8;

      if (v11) {
        goto LABEL_11;
      }
LABEL_12:
      results = self->_results;
      v31[0] = @"start";
      if (v7) {
        [v7 time];
      }
      else {
        memset(&v23[1], 0, sizeof(CMTime));
      }
      CMTime time = v23[1];
      CFDictionaryRef v13 = CMTimeCopyAsDictionary(&time, 0);
      v32[0] = v13;
      v31[1] = @"duration";
      if (v7) {
        [v7 duration];
      }
      else {
        memset(v23, 0, 24);
      }
      CMTime time = v23[0];
      CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, 0);
      v32[1] = v14;
      v31[2] = @"attributes";
      v29 = @"orientation";
      v30 = v8;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v32[2] = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
      [(NSMutableArray *)results addObject:v16];
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v33 count:16];
  }
  while (v5);
LABEL_20:

  int v17 = 0;
LABEL_22:

  return v17;
}

- (id)privateResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_results count];
  if (v3)
  {
    results = self->_results;
    v6 = @"OrientationResults";
    v7[0] = results;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end