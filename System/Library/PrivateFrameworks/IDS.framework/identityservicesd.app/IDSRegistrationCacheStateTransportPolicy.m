@interface IDSRegistrationCacheStateTransportPolicy
+ (BOOL)shouldHandleMessageWithUpdateHash:(id)a3 command:(id)a4;
+ (BOOL)shouldQueryUpdateOfParams:(id)a3;
@end

@implementation IDSRegistrationCacheStateTransportPolicy

+ (BOOL)shouldQueryUpdateOfParams:(id)a3
{
  v3 = [a3 command];
  BOOL v4 = [v3 integerValue] == (id)101;

  return v4;
}

+ (BOOL)shouldHandleMessageWithUpdateHash:(id)a3 command:(id)a4
{
  return a3 || objc_msgSend(a4, "unsignedIntegerValue", v4, v5) == (id)130;
}

@end