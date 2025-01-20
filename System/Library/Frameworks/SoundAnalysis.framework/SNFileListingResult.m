@interface SNFileListingResult
- (NSArray)fileItems;
- (SNFileListingResult)init;
- (SNFileListingResult)initWithFileItems:(id)a3;
@end

@implementation SNFileListingResult

- (NSArray)fileItems
{
  sub_1DCB2F6AC();
  sub_1DCABDF08();
  v2 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (SNFileListingResult)initWithFileItems:(id)a3
{
  sub_1DCABDF08();
  uint64_t v3 = sub_1DCB87C38();
  return (SNFileListingResult *)sub_1DCB2F6BC(v3);
}

- (SNFileListingResult)init
{
}

- (void).cxx_destruct
{
}

@end