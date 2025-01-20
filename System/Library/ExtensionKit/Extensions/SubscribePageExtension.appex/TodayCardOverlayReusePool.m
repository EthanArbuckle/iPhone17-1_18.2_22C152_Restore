@interface TodayCardOverlayReusePool
- (void)clearStackFor:(id)a3;
@end

@implementation TodayCardOverlayReusePool

- (void)clearStackFor:(id)a3
{
  uint64_t v4 = sub_100755B70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  swift_beginAccess();
  *(void *)self->stack = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

@end