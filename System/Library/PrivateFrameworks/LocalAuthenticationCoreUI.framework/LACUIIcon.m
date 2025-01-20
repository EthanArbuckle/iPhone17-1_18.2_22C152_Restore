@interface LACUIIcon
+ (UIImage)genericIcon;
+ (id)imageForBundleIdentifier:(id)a3;
+ (id)imageForPath:(id)a3;
- (LACUIIcon)init;
@end

@implementation LACUIIcon

+ (UIImage)genericIcon
{
  id v2 = objc_msgSend(self, sel_genericApplicationIcon);
  result = (UIImage *)LACUIImageWithIcon(v2);
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)imageForBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_getObjCClassMetadata();
  id v6 = static LACUIIcon.image(forBundleIdentifier:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)imageForPath:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  id v7 = specialized static LACUIIcon.icon(forPath:)(v4, v6);
  if (v7)
  {
    v8 = v7;
    id result = LACUIImageWithIcon(v7);
    if (!result)
    {
      __break(1u);
      return result;
    }
    id v10 = result;
  }
  else
  {
    id v10 = objc_msgSend(a1, sel_genericIcon);
  }
  swift_bridgeObjectRelease();
  return v10;
}

- (LACUIIcon)init
{
  v3.receiver = self;
  v3.super_class = (Class)LACUIIcon;
  return [(LACUIIcon *)&v3 init];
}

@end