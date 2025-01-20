@interface AFSamplingUtilities
+ (BOOL)isFileNameValid:(id)a3;
+ (BOOL)isFileOlderThanAgeInSeconds:(double)a3 filePath:(id)a4 samplingComponent:(id)a5;
+ (id)component;
+ (id)createSamplingDirectory;
+ (id)dateFormatter;
+ (id)deleteItemAtFilePath:(id)a3;
+ (id)sampledCachesSubDirectoryPath;
+ (id)sampledCurrentSamplingDateKey;
+ (id)sampledLibraryDirectoryPath;
+ (id)sampledPlistFileName;
+ (id)sampledSubDirectoryNameFormat;
+ (id)sampledSubDirectoryPath;
+ (id)samplingDateAsString;
+ (id)timezone;
+ (int64_t)calculateFileNameAgeInDays:(id)a3;
+ (void)deleteAllSamplingData;
@end

@implementation AFSamplingUtilities

+ (id)dateFormatter
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)MEMORY[0x1E4F1CAF0];
  v5 = [a1 timezone];
  v6 = [v4 timeZoneWithAbbreviation:v5];
  [v3 setTimeZone:v6];

  v7 = [a1 sampledSubDirectoryNameFormat];
  [v3 setDateFormat:v7];

  return v3;
}

+ (int64_t)calculateFileNameAgeInDays:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() dateFormatter];
  v5 = [v4 dateFromString:v3];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] date];
    v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v8 = [v7 components:16 fromDate:v5 toDate:v6 options:0];
    int64_t v9 = [v8 day];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

+ (BOOL)isFileNameValid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v5 = [(id)objc_opt_class() sampledSubDirectoryNameFormat];
  uint64_t v6 = [v5 length];

  if (v4 == v6)
  {
    v7 = [(id)objc_opt_class() dateFormatter];
    v8 = [v7 dateFromString:v3];

    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isFileOlderThanAgeInSeconds:(double)a3 filePath:(id)a4 samplingComponent:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  v10 = [v9 attributesOfItemAtPath:v7 error:&v20];
  id v11 = v20;

  if (!v10)
  {
    v16 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      BOOL v15 = 0;
      goto LABEL_8;
    }
    *(_DWORD *)buf = 136315906;
    v22 = "+[AFSamplingUtilities isFileOlderThanAgeInSeconds:filePath:samplingComponent:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = (uint64_t)v11;
    v17 = "%s %@ Sampling: No attributes for file at path: %@, error: %@";
LABEL_10:
    _os_log_error_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x2Au);
    goto LABEL_7;
  }
  v12 = [v10 fileCreationDate];
  [v12 timeIntervalSinceNow];
  double v14 = fabs(v13);

  if (v14 <= a3)
  {
    v16 = AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    float v19 = v14 / 60.0;
    *(_DWORD *)buf = 136315906;
    v22 = "+[AFSamplingUtilities isFileOlderThanAgeInSeconds:filePath:samplingComponent:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = (uint64_t)rintf(v19);
    v17 = "%s %@ Sampling: File at path: %@ is ineligible for upload as it is only %ld minutes old.";
    goto LABEL_10;
  }
  BOOL v15 = 1;
LABEL_8:

  return v15;
}

+ (id)samplingDateAsString
{
  return 0;
}

+ (void)deleteAllSamplingData
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v3;
    v5 = [a1 component];
    uint64_t v6 = [a1 component];
    int v18 = 136315650;
    float v19 = "+[AFSamplingUtilities deleteAllSamplingData]";
    __int16 v20 = 2112;
    v21 = v5;
    __int16 v22 = 2112;
    __int16 v23 = v6;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %@ Sampling: Deleting all the %@ sampling data", (uint8_t *)&v18, 0x20u);
  }
  id v7 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v8 = [v7 firstObject];

  BOOL v9 = [a1 sampledCachesSubDirectoryPath];
  v10 = [v8 stringByAppendingPathComponent:v9];

  id v11 = (id)[a1 deleteItemAtFilePath:v10];
  v12 = [a1 sampledLibraryDirectoryPath];
  id v13 = (id)[a1 deleteItemAtFilePath:v12];

  double v14 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = v14;
    v16 = [a1 component];
    v17 = [a1 sampledLibraryDirectoryPath];
    int v18 = 136315906;
    float v19 = "+[AFSamplingUtilities deleteAllSamplingData]";
    __int16 v20 = 2112;
    v21 = v16;
    __int16 v22 = 2112;
    __int16 v23 = v10;
    __int16 v24 = 2112;
    __int16 v25 = v17;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s %@ Sampling: Done with deleting all the sampling data. Deleted - %@, %@", (uint8_t *)&v18, 0x2Au);
  }
}

+ (id)deleteItemAtFilePath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v6 = [v5 removeItemAtPath:v4 error:&v14];
  id v7 = v14;
  id v8 = v7;
  if ((v6 & 1) != 0 || AFIsFileNotFoundError(v7))
  {
    BOOL v9 = (void *)AFSiriLogContextUtility;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v10 = v9;
    id v11 = [a1 component];
    *(_DWORD *)buf = 136315650;
    v16 = "+[AFSamplingUtilities deleteItemAtFilePath:]";
    __int16 v17 = 2112;
    int v18 = v11;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s %@ Sampling: Successfully deleted %@", buf, 0x20u);
    goto LABEL_5;
  }
  v12 = (void *)AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v10 = v12;
    id v11 = [a1 component];
    *(_DWORD *)buf = 136315906;
    v16 = "+[AFSamplingUtilities deleteItemAtFilePath:]";
    __int16 v17 = 2112;
    int v18 = v11;
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    __int16 v22 = v8;
    _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error deleting item at %@ - %@", buf, 0x2Au);
LABEL_5:
  }
LABEL_7:

  return v8;
}

+ (id)createSamplingDirectory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 sampledLibraryDirectoryPath];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v7 = v3;
  }
  else
  {
    id v8 = (void *)AFSiriLogContextUtility;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      v10 = v8;
      id v11 = [a1 component];
      *(_DWORD *)buf = 136315906;
      id v14 = "+[AFSamplingUtilities createSamplingDirectory]";
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      int v18 = v3;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s %@ Sampling: Error creating directory %@ - %@", buf, 0x2Au);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)sampledLibraryDirectoryPath
{
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v4 = [v3 firstObject];

  char v5 = [a1 sampledSubDirectoryPath];
  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (id)sampledCurrentSamplingDateKey
{
  return @"currentSamplingDate";
}

+ (id)sampledSubDirectoryNameFormat
{
  return @"yyyyMMdd";
}

+ (id)timezone
{
  return @"UTC";
}

+ (id)sampledPlistFileName
{
  return 0;
}

+ (id)sampledCachesSubDirectoryPath
{
  return 0;
}

+ (id)sampledSubDirectoryPath
{
  return 0;
}

+ (id)component
{
  return 0;
}

@end