@interface SRError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (SRError)initWithCode:(int64_t)a3;
- (SRError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
- (SRError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation SRError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithCode:a3 userInfo:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithCode:a3 localizedFailureReason:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3
{
  return _[a1 errorWithCode:a3 userInfo:0];
}

- (SRError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return [(SRError *)self initWithDomain:@"com.apple.siri.ErrorDomain" code:a3 userInfo:a4];
}

- (SRError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
  id v11 = a4;
  id v6 = a4;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  v8 = [(SRError *)self initWithCode:a3 userInfo:v7];
  return v8;
}

- (SRError)initWithCode:(int64_t)a3
{
  return [(SRError *)self initWithCode:a3 userInfo:0];
}

@end