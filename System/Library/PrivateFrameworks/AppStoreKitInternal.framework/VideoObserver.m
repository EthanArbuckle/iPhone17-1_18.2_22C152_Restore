@interface VideoObserver
- (_TtC19AppStoreKitInternal13VideoObserver)init;
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
    uint64_t v10 = sub_1E1D5BE58();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_1E1D5CDD8();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1E163A57C((unint64_t *)&unk_1EBF408F8, type metadata accessor for NSKeyValueChangeKey);
  v15 = (void *)sub_1E1D5BCB8();

LABEL_8:
  sub_1E172339C(v10, v12, (uint64_t)v18, v15, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E1639AD8((uint64_t)v18);
}

- (void)videoDidPlayToEnd
{
  v2 = self;
  sub_1E1723C38();
}

- (void)videoPlaybackDidStall
{
  v2 = self;
  sub_1E1723D34();
}

- (void)playbackErrorOccurredWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E17241A8(v4);
}

- (_TtC19AppStoreKitInternal13VideoObserver)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_playerItemObserversAdded) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_playerObserversAdded) = 0;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_timeBoundaryObserver);
  id v4 = (objc_class *)type metadata accessor for VideoObserver();
  _OWORD *v3 = 0u;
  v3[1] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return [(VideoObserver *)&v6 init];
}

- (void).cxx_destruct
{
  sub_1E15F6A98((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal13VideoObserver_timeBoundaryObserver;
  sub_1E1639AD8((uint64_t)v3);
}

@end