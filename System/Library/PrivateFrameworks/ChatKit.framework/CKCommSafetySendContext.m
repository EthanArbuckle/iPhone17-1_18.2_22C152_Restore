@interface CKCommSafetySendContext
+ (NSString)contextKey;
@end

@implementation CKCommSafetySendContext

+ (NSString)contextKey
{
  return (NSString *)@"CKCommSafetyContextKeySend";
}

@end