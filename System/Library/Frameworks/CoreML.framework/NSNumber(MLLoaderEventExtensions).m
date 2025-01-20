@interface NSNumber(MLLoaderEventExtensions)
+ (void)modelOriginNumberFromUserDefinedDictionary:()MLLoaderEventExtensions;
@end

@implementation NSNumber(MLLoaderEventExtensions)

+ (void)modelOriginNumberFromUserDefinedDictionary:()MLLoaderEventExtensions
{
  id v3 = a3;
  v4 = [v3 allKeys];
  v5 = v4;
  if (!v4 || ![v4 count]) {
    goto LABEL_32;
  }
  if (([v5 containsObject:@"com.apple.createml.app.version"] & 1) == 0)
  {
    if ([v5 containsObject:@"com.apple.createml.version"])
    {
      v6 = &unk_1EF11A3A0;
      goto LABEL_33;
    }
    if ([v5 containsObject:@"com.github.apple.turicreate.version"])
    {
      v6 = &unk_1EF11A3B8;
      goto LABEL_33;
    }
    if ([v5 containsObject:@"com.apple.developer.machine-learning.models.version"])
    {
      v6 = &unk_1EF11A3D0;
      goto LABEL_33;
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v7 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v8 = [v7 containsString:@"keras"];

      if (v8)
      {
        v6 = &unk_1EF11A3E8;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v9 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v10 = [v9 containsString:@"torch"];

      if (v10)
      {
        v6 = &unk_1EF11A400;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v11 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v12 = [v11 containsString:@"tensorflow"];

      if (v12)
      {
        v6 = &unk_1EF11A418;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v13 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v14 = [v13 containsString:@"onnx"];

      if (v14)
      {
        v6 = &unk_1EF11A430;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v15 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v16 = [v15 containsString:@"scikit-learn"];

      if (v16)
      {
        v6 = &unk_1EF11A448;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v17 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v18 = [v17 containsString:@"xgboost"];

      if (v18)
      {
        v6 = &unk_1EF11A460;
        goto LABEL_33;
      }
    }
    if ([v5 containsObject:@"com.github.apple.coremltools.source"])
    {
      v19 = [v3 objectForKeyedSubscript:@"com.github.apple.coremltools.source"];
      char v20 = [v19 containsString:@"libsvm"];

      if (v20)
      {
        v6 = &unk_1EF11A478;
        goto LABEL_33;
      }
    }
LABEL_32:
    v6 = &unk_1EF11A370;
    goto LABEL_33;
  }
  v6 = &unk_1EF11A388;
LABEL_33:

  return v6;
}

@end