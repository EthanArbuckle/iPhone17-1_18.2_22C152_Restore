@interface MGenre
- (NSString)name;
@end

@implementation MGenre

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2289DEB90();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14BookFoundation6MGenre_url;
  uint64_t v4 = sub_2289DE880();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end