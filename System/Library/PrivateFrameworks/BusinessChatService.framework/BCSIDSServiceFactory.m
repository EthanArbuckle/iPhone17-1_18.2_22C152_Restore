@interface BCSIDSServiceFactory
- (id)makeIDSService;
@end

@implementation BCSIDSServiceFactory

- (id)makeIDSService
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.biz"];

  return v2;
}

@end