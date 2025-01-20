@interface TodayCardOverlayReusePool
- (void)clearStackFor:(id)a3;
@end

@implementation TodayCardOverlayReusePool

- (void)clearStackFor:(id)a3
{
  uint64_t v4 = sub_100769D10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100769CE0();
  swift_beginAccess();
  *(void *)self->stack = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end