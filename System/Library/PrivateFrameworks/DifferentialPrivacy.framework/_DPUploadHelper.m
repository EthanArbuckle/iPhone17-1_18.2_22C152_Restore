@interface _DPUploadHelper
+ (id)ipsFilePathForDate:(id)a3 useGMT:(BOOL)a4;
+ (id)submissionFilePathInDirectory:(id)a3 uploadName:(id)a4 forDate:(id)a5 useGMT:(BOOL)a6 suffix:(id)a7;
+ (id)writeDediscoSubmission:(id)a3 withReportName:(id)a4 inDirectory:(id)a5;
+ (id)writeFileForDA:(id)a3;
+ (id)writeFileForDedisco:(id)a3 withReportName:(id)a4;
+ (id)writeFileForParsec:(id)a3;
+ (id)writeFileForParsec:(id)a3 inDirectory:(id)a4;
@end

@implementation _DPUploadHelper

+ (id)ipsFilePathForDate:(id)a3 useGMT:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[_DPStrings ipsDirectoryPath];
  v8 = [a1 submissionFilePathInDirectory:v7 uploadName:@"DifferentialPrivacy" forDate:v6 useGMT:v4 suffix:@"diff_privacy.anon"];

  return v8;
}

+ (id)writeFileForDA:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [a1 ipsFilePathForDate:v5 useGMT:0];

  if (v6)
  {
    if ([v4 writeToFile:v6 atomically:1 encoding:4 error:0]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)writeFileForParsec:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a4;
  v9 = [v7 date];
  v10 = [a1 submissionFilePathInDirectory:v8 uploadName:@"DifferentialPrivacy" forDate:v9 useGMT:1 suffix:@"json.anon"];

  if (v10)
  {
    uint64_t v14 = 0;
    if ([v6 writeToFile:v10 atomically:1 encoding:4 error:&v14]) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)writeFileForParsec:(id)a3
{
  id v4 = a3;
  v5 = +[_DPStrings reportsDirectoryPath];
  id v6 = [a1 writeFileForParsec:v4 inDirectory:v5];

  return v6;
}

+ (id)writeDediscoSubmission:(id)a3 withReportName:(id)a4 inDirectory:(id)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a5;
  id v11 = a4;
  id v12 = [v9 date];
  v13 = [a1 submissionFilePathInDirectory:v10 uploadName:v11 forDate:v12 useGMT:0 suffix:@"json.anon"];

  if (v13)
  {
    if ([v8 writeToFile:v13 atomically:1 encoding:4 error:0]) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)writeFileForDedisco:(id)a3 withReportName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_DPStrings transparencyLogDirectoryPath];
  v9 = [a1 writeDediscoSubmission:v7 withReportName:v6 inDirectory:v8];

  return v9;
}

+ (id)submissionFilePathInDirectory:(id)a3 uploadName:(id)a4 forDate:(id)a5 useGMT:(BOOL)a6 suffix:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x1E019F810]();
  v16 = objc_opt_new();
  [v16 setDateFormat:@"yyyy'-'MM'-'dd'-'HHmmss"];
  if (v8)
  {
    v17 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v16 setTimeZone:v17];
  }
  v18 = [v16 stringFromDate:v13];
  v19 = [NSString stringWithFormat:@"%@/%@_%@.%@", v11, v12, v18, v14];

  return v19;
}

@end