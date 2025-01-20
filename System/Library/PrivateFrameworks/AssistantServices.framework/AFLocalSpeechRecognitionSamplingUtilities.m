@interface AFLocalSpeechRecognitionSamplingUtilities
+ (BOOL)isFileNameValid:(id)a3;
+ (id)component;
+ (id)dateFromFileName:(id)a3;
+ (id)sampledCachesSubDirectoryPath;
+ (id)sampledSubDirectoryNameFormat;
+ (id)sampledSubDirectoryPath;
+ (id)samplingDateAsString;
+ (int64_t)calculateFileNameAgeInDays:(id)a3;
@end

@implementation AFLocalSpeechRecognitionSamplingUtilities

+ (id)dateFromFileName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28FD8];
  id v5 = a3;
  v6 = [v4 regularExpressionWithPattern:@"^\\D+-" options:0 error:0];
  v7 = objc_msgSend(v6, "stringByReplacingMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_1EEE35D28);

  v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\.\\d+(\\.\\w+)?$" options:0 error:0];
  v9 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), &stru_1EEE35D28);
  v10 = [a1 dateFormatter];
  v11 = [v10 dateFromString:v9];

  return v11;
}

+ (int64_t)calculateFileNameAgeInDays:(id)a3
{
  v3 = [a1 dateFromFileName:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = [v5 components:16 fromDate:v3 toDate:v4 options:0];
    int64_t v7 = [v6 day];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (BOOL)isFileNameValid:(id)a3
{
  v3 = [a1 dateFromFileName:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)samplingDateAsString
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [a1 dateFormatter];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (id)sampledSubDirectoryNameFormat
{
  return @"yyyyMMdd-HHmmss";
}

+ (id)sampledCachesSubDirectoryPath
{
  return @"com.apple.speech.localspeechrecognition/lsr_audio_dumps";
}

+ (id)sampledSubDirectoryPath
{
  return @"/Caches/com.apple.speech.localspeechrecognition/lsr_audio_dumps";
}

+ (id)component
{
  return @"LocalSpeechRecognition";
}

@end