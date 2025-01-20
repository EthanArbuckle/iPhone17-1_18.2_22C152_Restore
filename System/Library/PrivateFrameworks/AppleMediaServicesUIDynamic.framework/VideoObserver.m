@interface VideoObserver
- (_TtC27AppleMediaServicesUIDynamic13VideoObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playbackErrorOccurredWithNotification:(id)a3;
- (void)videoDidPlayToEnd;
- (void)videoPlaybackDidStall;
@end

@implementation VideoObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_1BF465FA8();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1BF4665E8();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1BF44CEE8(&qword_1EA147948, type metadata accessor for NSKeyValueChangeKey);
    sub_1BF465EA8();
  }
LABEL_7:
  sub_1BF44AA8C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BF3A7DB8((uint64_t)v13);
}

- (void)videoDidPlayToEnd
{
  v2 = self;
  sub_1BF44B2C4();
}

- (void)videoPlaybackDidStall
{
  v2 = self;
  sub_1BF44B3C0();
}

- (void)playbackErrorOccurredWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BF44B6D8();
}

- (_TtC27AppleMediaServicesUIDynamic13VideoObserver)init
{
  return (_TtC27AppleMediaServicesUIDynamic13VideoObserver *)sub_1BF44BE10();
}

- (void).cxx_destruct
{
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic13VideoObserver_timeBoundaryObserver;

  sub_1BF3A7DB8((uint64_t)v3);
}

@end