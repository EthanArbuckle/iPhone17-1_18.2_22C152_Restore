@interface SPError
+ (BOOL)isValidationErrorCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 additionalDescription:(id)a4;
@end

@implementation SPError

+ (id)errorWithCode:(int64_t)a3
{
  v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
  if ((unint64_t)a3 > 0x1C) {
    v5 = @"SPErrorUnknownMessage";
  }
  else {
    v5 = *(&off_100046228 + a3);
  }
  uint64_t v6 = spUtils_localizedStringForSystemLanguage(v5, @"/System/Library/Frameworks/WatchKit.framework");
  if (v6) {
    v5 = (__CFString *)v6;
  }
  [v4 setObject:v5 forKeyedSubscript:NSLocalizedDescriptionKey];
  v7 = +[NSError errorWithDomain:@"com.apple.watchkit.errors" code:a3 userInfo:v4];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 additionalDescription:(id)a4
{
  id v6 = a4;
  v7 = [a1 errorWithCode:a3];
  v8 = [v7 userInfo];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v6 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];
  v10 = [v7 domain];
  v11 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, [v7 code], v9);

  return v11;
}

+ (BOOL)isValidationErrorCode:(int64_t)a3
{
  return a3 == 5;
}

@end