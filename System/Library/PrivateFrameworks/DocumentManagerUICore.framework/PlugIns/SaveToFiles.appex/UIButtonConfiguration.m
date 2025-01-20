@interface UIButtonConfiguration
+ (id)plainGazeableConfiguration;
+ (id)plainNonGazeableConfiguration;
- (void)configureWithZeroInsetsIfAllowed;
@end

@implementation UIButtonConfiguration

+ (id)plainGazeableConfiguration
{
  uint64_t v2 = sub_1004D27E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);

  sub_1004D2680();
  v6.super.isa = sub_1004D2750().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6.super.isa;
}

+ (id)plainNonGazeableConfiguration
{
  uint64_t v2 = sub_1004D27E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004D2680();
  v6.super.isa = sub_1004D2750().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6.super.isa;
}

- (void)configureWithZeroInsetsIfAllowed
{
  uint64_t v3 = self;
  uint64_t v4 = self;

  -[UIButtonConfiguration setContentInsets:](v4, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
}

@end