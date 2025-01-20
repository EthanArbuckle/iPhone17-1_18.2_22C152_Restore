@interface CLMInterfaceHelper
+ (UIEdgeInsets)separatorInsetsWith:(UIEdgeInsets)a3 traitCollection:(id)a4;
+ (id)makePlaylistRowCellContentForPlaylistEntry:(id)a3;
- (NSMutableArray)playlists;
- (_TtC22ClarityUIMusicSettings18CLMInterfaceHelper)init;
- (uint64_t)openMusicApp;
- (void)loadPlaylistsWithCompletionHandler:(id)a3;
- (void)setPlaylists:(id)a3;
@end

@implementation CLMInterfaceHelper

- (NSMutableArray)playlists
{
  return (NSMutableArray *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists));
}

- (void)setPlaylists:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists) = (Class)a3;
  id v3 = a3;
}

- (void)loadPlaylistsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_6E04(&qword_14E28);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_C730();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_14E38;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_14E48;
  v12[5] = v11;
  v13 = self;
  sub_AC58((uint64_t)v7, (uint64_t)&unk_14E58, (uint64_t)v12);
  swift_release();
}

+ (id)makePlaylistRowCellContentForPlaylistEntry:(id)a3
{
  id v4 = objc_allocWithZone((Class)UITableViewCell);
  id v5 = a3;
  id v6 = [v4 init];
  v8[3] = sub_6E04(&qword_14E70);
  v8[4] = sub_93EC(&qword_14E78, &qword_14E70);
  sub_BE1C(v8);
  type metadata accessor for PlaylistRow(0);
  sub_BE80(&qword_14E80, (void (*)(uint64_t))type metadata accessor for PlaylistRow);
  sub_C430();
  sub_C780();

  return v6;
}

+ (UIEdgeInsets)separatorInsetsWith:(UIEdgeInsets)a3 traitCollection:(id)a4
{
  double left = a3.left;
  id v5 = a4;
  id v6 = [v5 preferredContentSizeCategory];
  char v7 = sub_C790();

  if (v7)
  {
  }
  else
  {
    if (qword_14A98 != -1) {
      swift_once();
    }
    double v8 = left + *(double *)&xmmword_152A0;
    if (qword_14AA0 != -1) {
      swift_once();
    }
    double v9 = *(double *)&qword_152B0;

    double left = v8 + v9;
  }
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = left;
  result.right = v12;
  result.bottom = v11;
  result.double left = v13;
  result.top = v10;
  return result;
}

- (_TtC22ClarityUIMusicSettings18CLMInterfaceHelper)init
{
  uint64_t v3 = OBJC_IVAR____TtC22ClarityUIMusicSettings18CLMInterfaceHelper_playlists;
  id v4 = objc_allocWithZone((Class)NSMutableArray);
  id v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CLMInterfaceHelper();
  return [(CLMInterfaceHelper *)&v7 init];
}

- (void).cxx_destruct
{
}

- (uint64_t)openMusicApp
{
  uint64_t v0 = sub_6E04(&qword_14E10);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_C2C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C2B0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_9430((uint64_t)v2, &qword_14E10);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  double v8 = self;
  id v9 = [v8 sharedApplication];
  sub_C2A0(v10);
  double v12 = v11;
  unsigned int v13 = [v9 canOpenURL:v11];

  if (v13)
  {
    id v14 = [v8 sharedApplication];
    sub_C2A0(v15);
    v17 = v16;
    sub_A3B8((uint64_t)&_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_BE80(&qword_14D78, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = sub_C670().super.isa;
    swift_bridgeObjectRelease();
    [v14 openURL:v17 options:isa completionHandler:0];
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end