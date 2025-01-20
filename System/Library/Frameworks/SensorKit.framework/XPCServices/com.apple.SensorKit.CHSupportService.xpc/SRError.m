@interface SRError
+ (id)authorizationError;
+ (id)authorizationErrorWithStatus:(int64_t)a3;
+ (id)connectionNotFoundError;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)invalidEntitlementError;
+ (id)invalidInfoPlistErrorWithMissingKey:(id)a3 code:(int64_t)a4;
@end

@implementation SRError

+ (id)errorWithCode:(int64_t)a3
{
  CFStringRef v5 = sub_1000023B0(a3);
  v6 = sub_100002714(a3);

  return [a1 errorWithCode:a3 description:v5 recoverySuggestion:v6];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5
{
  return [a1 errorWithCode:a3 description:a4 recoverySuggestion:a5 underlyingError:0];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  CFStringRef v7 = sub_1000023B0(a3);
  v8 = sub_100002714(a3);

  return [a1 errorWithCode:a3 description:v7 recoverySuggestion:v8 underlyingError:a4];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6
{
  v10 = +[NSMutableDictionary dictionaryWithCapacity:3];
  v11 = v10;
  if (a4) {
    [(NSMutableDictionary *)v10 setObject:a4 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (a5) {
    [(NSMutableDictionary *)v11 setObject:a5 forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
  }
  if (a6) {
    [(NSMutableDictionary *)v11 setObject:a6 forKeyedSubscript:NSUnderlyingErrorKey];
  }

  return +[NSError errorWithDomain:@"SRErrorDomain" code:a3 userInfo:v11];
}

+ (id)connectionNotFoundError
{
  return [a1 errorWithCode:8193];
}

+ (id)invalidEntitlementError
{
  return [a1 errorWithCode:0];
}

+ (id)authorizationErrorWithStatus:(int64_t)a3
{
  CFStringRef v5 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"SRErrorNoAuthorization" value:&stru_1000041B0 table:0];
  v6 = [+[NSBundle bundleForClass:objc_opt_class()] localizedStringForKey:@"SRErrorNoAuthorizationRecovery" value:&stru_1000041B0 table:0];
  id v7 = [a1 errorWithCode:a3];

  return [a1 errorWithCode:1 description:v5 recoverySuggestion:v6 underlyingError:v7];
}

+ (id)authorizationError
{
  return [a1 errorWithCode:1];
}

+ (id)invalidInfoPlistErrorWithMissingKey:(id)a3 code:(int64_t)a4
{
  v6 = +[NSString stringWithFormat:@"Your bundle's Info.plist must have an %@ key", a3];

  return [a1 errorWithCode:a4 description:v6 recoverySuggestion:0];
}

@end