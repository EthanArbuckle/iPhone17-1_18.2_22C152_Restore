@interface CKRecordZone
+ (id)chsh_transactionRecordZone;
@end

@implementation CKRecordZone

+ (id)chsh_transactionRecordZone
{
  id v2 = [objc_alloc((Class)CKRecordZone) initWithZoneName:@"Transactions"];
  return v2;
}

@end