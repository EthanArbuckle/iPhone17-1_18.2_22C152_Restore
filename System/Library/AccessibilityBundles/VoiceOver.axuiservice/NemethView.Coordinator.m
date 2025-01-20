@interface NemethView.Coordinator
- (_TtCV9VoiceOver10NemethView11Coordinator)init;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation NemethView.Coordinator

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_20B98((uint64_t)v11, "Error during provisional navigation... %s");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_20908(v8);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_20B98((uint64_t)v11, "Error navigating to URL... %s");
}

- (_TtCV9VoiceOver10NemethView11Coordinator)init
{
  result = (_TtCV9VoiceOver10NemethView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->parent[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 40];
  unint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 48];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 72];
  unint64_t v5 = *(void *)&self->parent[OBJC_IVAR____TtCV9VoiceOver10NemethView11Coordinator_parent + 80];
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  sub_1DAFC(v2, v3);
  swift_release();
  swift_release();
  sub_1DAFC(v4, v5);

  swift_bridgeObjectRelease();
}

@end