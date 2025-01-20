@interface GMAssetsBypass
+ (BOOL)gmAssetsBypass;
+ (void)setGMEligibilityBypass:(BOOL)a3;
- (_TtC25CloudSubscriptionFeatures14GMAssetsBypass)init;
@end

@implementation GMAssetsBypass

+ (BOOL)gmAssetsBypass
{
  if ((sub_1A8D419C0() & 1) == 0) {
    return 0;
  }
  if (qword_1EB5E9F80 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB5E9F70;
  v3 = (void *)sub_1A8D59BC0();
  LOBYTE(v2) = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return (char)v2;
}

+ (void)setGMEligibilityBypass:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1A8D419C0())
  {
    if (qword_1EB5E9F80 != -1) {
      swift_once();
    }
    v4 = (void *)qword_1EB5E9F70;
    id v5 = (id)sub_1A8D59BC0();
    objc_msgSend(v4, sel_setBool_forKey_, v3, v5);
  }
}

- (_TtC25CloudSubscriptionFeatures14GMAssetsBypass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMAssetsBypass();
  return [(GMAssetsBypass *)&v3 init];
}

@end