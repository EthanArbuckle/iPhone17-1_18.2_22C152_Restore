@interface SPError
+ (BOOL)isValidationErrorCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 additionalDescription:(id)a4;
@end

@implementation SPError

+ (id)errorWithCode:(int64_t)a3
{
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  if ((unint64_t)a3 > 0x1C) {
    v5 = @"SPErrorUnknownMessage";
  }
  else {
    v5 = off_264598958[a3];
  }
  uint64_t v6 = spUtils_localizedStringForSystemLanguage(v5, @"/System/Library/Frameworks/WatchKit.framework");
  if (v6) {
    v5 = (__CFString *)v6;
  }
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08320]];
  v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.watchkit.errors" code:a3 userInfo:v4];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 additionalDescription:(id)a4
{
  id v6 = a4;
  v7 = [a1 errorWithCode:a3];
  v8 = [v7 userInfo];
  v9 = (void *)[v8 mutableCopy];

  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08338]];
  v10 = (void *)MEMORY[0x263F087E8];
  v11 = [v7 domain];
  v12 = objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(v7, "code"), v9);

  return v12;
}

+ (BOOL)isValidationErrorCode:(int64_t)a3
{
  return a3 == 5;
}

@end