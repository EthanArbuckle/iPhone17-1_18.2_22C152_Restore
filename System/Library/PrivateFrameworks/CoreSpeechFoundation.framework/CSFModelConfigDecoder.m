@interface CSFModelConfigDecoder
+ (id)decodeJsonFromFile:(id)a3;
+ (id)getAftmCheckerConfigFromConfigDict:(id)a3;
+ (id)getAftmRecognizerRelativeConfigFromConfigDict:(id)a3;
+ (id)getNCModelFileFromConfigDict:(id)a3 resourcePath:(id)a4;
+ (id)getOdldModelFileFromConfigDict:(id)a3 resourcePath:(id)a4;
+ (id)getOdldValueForKey:(id)a3 categoryKey:(id)a4 configDict:(id)a5;
@end

@implementation CSFModelConfigDecoder

+ (id)getOdldValueForKey:(id)a3 categoryKey:(id)a4 configDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  v11 = [v9 objectForKeyedSubscript:v8];
  if (!v11) {
    goto LABEL_6;
  }
  v12 = [v10 objectForKeyedSubscript:v8];
  v13 = [v12 objectForKeyedSubscript:v7];

  if (v13)
  {
    v14 = [v10 objectForKeyedSubscript:v8];
    v11 = [v14 objectForKeyedSubscript:v7];
  }
  else
  {
LABEL_5:
    v11 = 0;
  }
LABEL_6:

  return v11;
}

+ (id)decodeJsonFromFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3];
  if (v3)
  {
    id v10 = 0;
    v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v10];
    id v5 = v10;
    if (v5)
    {
      v6 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v12 = "+[CSFModelConfigDecoder decodeJsonFromFile:]";
        __int16 v13 = 2114;
        v14 = v3;
        __int16 v15 = 2114;
        id v16 = v5;
        _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x20u);
      }
      id v7 = 0;
    }
    else
    {
      id v7 = v4;
    }
  }
  else
  {
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[CSFModelConfigDecoder decodeJsonFromFile:]";
      __int16 v13 = 2114;
      v14 = 0;
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)getNCModelFileFromConfigDict:(id)a3 resourcePath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5)
  {
    if (v6)
    {
      id v8 = [v5 objectForKeyedSubscript:@"ModelFile"];

      if (v8)
      {
        id v9 = [v5 objectForKeyedSubscript:@"ModelFile"];
        id v8 = [v7 stringByAppendingPathComponent:v9];
      }
    }
  }

  return v8;
}

+ (id)getOdldModelFileFromConfigDict:(id)a3 resourcePath:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0;
  if (a3 && v5)
  {
    id v8 = +[CSFModelConfigDecoder getOdldValueForKey:@"model" categoryKey:@"pipeline" configDict:a3];
    id v7 = [v8 objectForKeyedSubscript:@"modelFile"];

    if (v7)
    {
      id v9 = [v8 objectForKeyedSubscript:@"modelFile"];
      id v7 = [v6 stringByAppendingPathComponent:v9];
    }
  }

  return v7;
}

+ (id)getAftmCheckerConfigFromConfigDict:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKeyedSubscript:@"checkerConfig"];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)getAftmRecognizerRelativeConfigFromConfigDict:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"checkerConfig"];

    if (v5)
    {
      id v6 = [v4 objectForKeyedSubscript:@"checkerConfig"];
      id v5 = [v6 objectForKeyedSubscript:@"recognizerConfigs"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end