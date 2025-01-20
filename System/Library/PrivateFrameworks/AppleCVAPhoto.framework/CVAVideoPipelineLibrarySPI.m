@interface CVAVideoPipelineLibrarySPI
+ (BOOL)updateRequestWithLiveData:(id)a3 mattingRequest:(id)a4 faceKitProcessOutput:(id)a5 error:(id *)a6;
+ (id)identifyGPU:(id)a3;
+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 isTmpConfig:(BOOL)a6 error:(id *)a7;
@end

@implementation CVAVideoPipelineLibrarySPI

+ (id)identifyGPU:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  if ([v4 containsString:@"Apple"])
  {
    NSSelectorFromString(&cfstr_Architecture.isa);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      v7 = &stru_1F142F608;
      goto LABEL_14;
    }
    v4 = [v3 architecture];
    v6 = [v4 name];
    v7 = [v6 stringByReplacingOccurrencesOfString:@"applegpu_" withString:&stru_1F142F608];
    v8 = [v4 revision];
    if ([v8 containsString:@"A"])
    {
      int v9 = 1;
    }
    else if ([(__CFString *)v7 containsString:@"g16p"])
    {
      v10 = [v4 revision];
      int v9 = [v10 containsString:@"B0"];
    }
    else
    {
      int v9 = 0;
    }

    if ((v9 & ([(__CFString *)v7 containsString:@"g17p"] ^ 1)) == 1)
    {
      v11 = NSString;
      v12 = [v4 revision];
      v13 = [v12 lowercaseString];
      uint64_t v14 = [v11 stringWithFormat:@"%@_%@", v7, v13];

      v7 = (__CFString *)v14;
    }
  }
  else
  {
    v7 = &stru_1F142F608;
  }

LABEL_14:

  return v7;
}

+ (BOOL)updateRequestWithLiveData:(id)a3 mattingRequest:(id)a4 faceKitProcessOutput:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v12 = v8;
    v13 = v12;
    if (v9)
    {
      uint64_t v14 = [v12 background];

      if (v14)
      {
        v15 = [v13 background];
        [v15 setMattingRequest:v9];
      }
    }
    if (v10)
    {
      v16 = [v13 light];

      if (v16)
      {
        v17 = [v13 light];
        [v17 setFaceKitProcessOutput:v10];
      }
    }
  }
  return isKindOfClass & 1;
}

+ (id)portraitRequestWithBackground:(id)a3 light:(id)a4 post:(id)a5 isTmpConfig:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  id v8 = +[CVAVideoPipelineLibrary portraitRequestWithBackground:a3 light:a4 post:a5 error:a7];
  [v8 setIsTmpConfig:v7];

  return v8;
}

@end