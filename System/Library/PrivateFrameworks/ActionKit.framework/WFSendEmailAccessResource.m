@interface WFSendEmailAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
- (unint64_t)status;
@end

@implementation WFSendEmailAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (unint64_t)status
{
  return 4;
}

- (id)associatedAppIdentifier
{
  return (id)*MEMORY[0x263F85510];
}

@end