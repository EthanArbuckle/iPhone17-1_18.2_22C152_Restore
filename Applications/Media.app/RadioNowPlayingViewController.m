@interface RadioNowPlayingViewController
- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3;
- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4;
- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7;
- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3;
- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3;
- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3;
- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3;
- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3;
- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3;
- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3;
- (_TtC5Media29RadioNowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (_TtC5Media29RadioNowPlayingViewController)initWithCoder:(id)a3;
- (_TtC5Media29RadioNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)albumTextForNowPlayingController:(id)a3;
- (id)artistTextForNowPlayingController:(id)a3;
- (id)backgroundArtForNowPlayingController:(id)a3;
- (id)badgeAnnotationViewForNowPlayingViewController:(id)a3;
- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3;
- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3;
- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3;
- (id)titleForNowPlayingController:(id)a3;
- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3;
- (uint64_t)nowPlayingService:(uint64_t)a3 didUpdateJumpBackwardInterval:(uint64_t)a4;
- (void)invalidate;
- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4;
- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4;
- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4;
- (void)nowPlayingServiceDidUpdatePlay:(id)a3;
- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4;
- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5;
- (void)setArtistSongNotification;
- (void)showSoundSettings;
- (void)showSourcePickerWithSender:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RadioNowPlayingViewController

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100072ABC();
}

- (void)invalidate
{
  v2 = self;
  sub_100072D84();
}

- (id)titleForNowPlayingController:(id)a3
{
  return sub_100073A7C(self, (uint64_t)a2, a3, (void (*)(void))sub_1000784E4);
}

- (id)artistTextForNowPlayingController:(id)a3
{
  return sub_100073A7C(self, (uint64_t)a2, a3, sub_100078B54);
}

- (id)albumTextForNowPlayingController:(id)a3
{
  return sub_100073A7C(self, (uint64_t)a2, a3, sub_100078E4C);
}

- (id)backgroundArtForNowPlayingController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100079144();

  return v6;
}

- (BOOL)nowPlayingViewControllerIsShowingExplicitTrack:(id)a3
{
  return 0;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshotForNowPlayingViewController:(SEL)a3
{
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&retstr->var5 = _D0;
  *(_WORD *)&retstr->var7 = 1;
  retstr->var9 = 0;
  return self;
}

- (BOOL)nowPlayingViewControllerIsPlaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10007958C();

  return self & 1;
}

- (int64_t)placeholderTypeForNowPlayingViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_100079718();

  return v6;
}

- (id)progressBarLocalizedDurationStringForNowPlayingViewController:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int64_t v6 = (void *)Strong;
    uint64_t v7 = *(void *)(Strong + OBJC_IVAR____TtC5Media15RadioCarManager_nowPlayingManager);
    swift_retain();
    id v8 = a3;
    v9 = self;

    if (v7)
    {
      sub_100041880();
      uint64_t v11 = v10;

      swift_release();
      if (v11)
      {
        NSString v12 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  NSString v12 = 0;
LABEL_7:

  return v12;
}

- (id)badgeAnnotationViewForNowPlayingViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = (void *)sub_100079810();

  return v6;
}

- (BOOL)nowPlayingViewControllerShouldOverrideRightBarButtons:(id)a3
{
  return 1;
}

- (BOOL)nowPlayingViewController:(id)a3 buttonShouldBeActive:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  LOBYTE(a4) = sub_10007A488(a4);

  return a4 & 1;
}

- (BOOL)nowPlayingViewController:(id)a3 shouldDisplayButton:(int64_t)a4 withImage:(id *)a5 existingIdentifier:(id)a6 tinted:(BOOL *)a7
{
  id v10 = a3;
  uint64_t v11 = self;
  sub_10007A5B8(a4, a5);
  LOBYTE(a5) = v12;

  return a5 & 1;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumArt:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10007ACD0();

  return self & 1;
}

- (BOOL)nowPlayingViewControllerIsRightHandDrive:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_10007AD8C();

  return self & 1;
}

- (BOOL)nowPlayingViewControllerCanShuffle:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanRepeat:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanShowUpNext:(id)a3
{
  return 0;
}

- (BOOL)nowPlayingViewControllerCanShowAlbumLink:(id)a3
{
  return 0;
}

- (id)nowPlayingViewControllerGetPlaybackRate:(id)a3
{
  id v3 = [objc_allocWithZone((Class)NSNumber) initWithDouble:1.0];

  return v3;
}

- (void)nowPlayingViewController:(id)a3 didSelectButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10007AE3C();
}

- (id)customPlaybackControlButtonsForNowPlayingViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10007B168();

  sub_100005DA8(0, &qword_1000AF1D8);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)nowPlayingViewController:(id)a3 didSendAction:(int64_t)a4 state:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_10007BBBC(a4, a5);
}

- (void)showSourcePickerWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100076C1C((uint64_t)v4);
}

- (void)showSoundSettings
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (id)Strong;
    id v4 = self;
    sub_10000A48C(1);
  }
}

- (void)setArtistSongNotification
{
  v2 = self;
  sub_1000773C4();
}

- (_TtC5Media29RadioNowPlayingViewController)initWithBundleIdentifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC5Media29RadioNowPlayingViewController *)sub_100077554(v7, v9, (uint64_t)a4, (uint64_t)a5);
}

- (_TtC5Media29RadioNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Media29RadioNowPlayingViewController *)sub_10007776C(v5, v7, a4);
}

- (_TtC5Media29RadioNowPlayingViewController)initWithCoder:(id)a3
{
  return (_TtC5Media29RadioNowPlayingViewController *)sub_100077964(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (void)nowPlayingService:(id)a3 didUpdateCurrentMediaSourceIdentifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100072F70();
}

- (void)nowPlayingService:(id)a3 didUpdateAlbum:(id)a4
{
}

- (void)nowPlayingService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  uint64_t v7 = self;
  [(RadioNowPlayingViewController *)v7 reloadData];

  swift_bridgeObjectRelease();
}

- (void)nowPlayingService:(id)a3 didUpdateArtwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  [(RadioNowPlayingViewController *)v11 reloadData];
  sub_100052100(v8, v10);
}

- (uint64_t)nowPlayingService:(uint64_t)a3 didUpdateJumpBackwardInterval:(uint64_t)a4
{
  uint64_t v6 = sub_10000463C(&qword_1000AF198);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_100005DA8(0, (unint64_t *)&unk_1000AF1A8);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = sub_10000463C(&qword_1000AF1A0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_10000463C(&qword_1000AF1A0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  [a1 reloadData];
  return sub_100005D4C((uint64_t)v8, &qword_1000AF198);
}

- (void)nowPlayingService:(id)a3 didUpdatePlaybackState:(unsigned __int8)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10007C8C0(a4);
}

- (void)nowPlayingServiceDidUpdatePlay:(id)a3
{
}

@end