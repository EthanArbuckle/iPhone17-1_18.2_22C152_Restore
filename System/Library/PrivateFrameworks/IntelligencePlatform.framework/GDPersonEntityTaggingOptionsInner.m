@interface GDPersonEntityTaggingOptionsInner
- (GDPersonEntityTaggingOptionsInner)init;
- (GDPersonEntityTaggingOptionsInner)initWithTagNameThresholds:(id)a3;
- (NSDictionary)tagNameThresholds;
@end

@implementation GDPersonEntityTaggingOptionsInner

- (GDPersonEntityTaggingOptionsInner)initWithTagNameThresholds:(id)a3
{
  uint64_t v3 = sub_1B2E820F8();
  return (GDPersonEntityTaggingOptionsInner *)PersonEntityTaggingService.PersonEntityTaggingOptions.init(tagNameThresholds:)(v3);
}

- (NSDictionary)tagNameThresholds
{
  v2 = self;
  sub_1B2AFF550();

  uint64_t v3 = (void *)sub_1B2E820D8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (GDPersonEntityTaggingOptionsInner)init
{
}

- (void).cxx_destruct
{
}

@end