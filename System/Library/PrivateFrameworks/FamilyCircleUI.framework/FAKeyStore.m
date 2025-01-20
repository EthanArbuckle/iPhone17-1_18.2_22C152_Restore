@interface FAKeyStore
+ (id)keyStoreForChecklist;
@end

@implementation FAKeyStore

+ (id)keyStoreForChecklist
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C40]) initWithStoreIdentifier:@"com.apple.familycircle.checklist" type:2];
  return v2;
}

@end