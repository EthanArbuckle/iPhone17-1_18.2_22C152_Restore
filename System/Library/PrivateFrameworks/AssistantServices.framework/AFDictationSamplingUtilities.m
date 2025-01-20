@interface AFDictationSamplingUtilities
+ (id)component;
+ (id)sampledCachesSubDirectoryPath;
+ (id)sampledPlistFileName;
+ (id)sampledSubDirectoryPath;
+ (id)samplingDateAsString;
@end

@implementation AFDictationSamplingUtilities

+ (id)samplingDateAsString
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [a1 sampledLibraryDirectoryPath];
  v5 = [a1 sampledPlistFileName];
  v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  id v21 = 0;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7 error:&v21];
  id v9 = v21;
  if (v9)
  {
    v10 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v17 = v10;
      v18 = [a1 component];
      *(_DWORD *)buf = 136315906;
      v23 = "+[AFDictationSamplingUtilities samplingDateAsString]";
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v6;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_error_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error while reading plist at location %@ - %@", buf, 0x2Au);
    }
    v11 = 0;
  }
  else
  {
    v12 = [a1 sampledCurrentSamplingDateKey];
    v13 = [v8 objectForKey:v12];

    if (v13)
    {
      v14 = [(id)objc_opt_class() dateFormatter];
      v11 = [v14 stringFromDate:v13];
    }
    else
    {
      v15 = (void *)AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        v19 = v15;
        v20 = [a1 component];
        *(_DWORD *)buf = 136315394;
        v23 = "+[AFDictationSamplingUtilities samplingDateAsString]";
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_error_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_ERROR, "%s %@ Sampling: currentSamplingDate is nil. Check if ADDictationOnDeviceSampling is getting initialized.", buf, 0x16u);
      }
      v11 = 0;
    }
  }
  return v11;
}

+ (id)sampledPlistFileName
{
  return @"DictationSampled.plist";
}

+ (id)sampledCachesSubDirectoryPath
{
  return @"com.apple.assistantd/DictationSampled";
}

+ (id)sampledSubDirectoryPath
{
  return @"/Assistant/DictationSampled";
}

+ (id)component
{
  return @"Dictation";
}

@end