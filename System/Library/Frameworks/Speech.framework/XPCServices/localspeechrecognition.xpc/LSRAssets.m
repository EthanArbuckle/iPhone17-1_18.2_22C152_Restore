@interface LSRAssets
- (_TtC22localspeechrecognition9LSRAssets)init;
- (void)getContextualNamedEntitySourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5;
- (void)getContextualRankedContactSourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5;
- (void)getGeoLMRegionIDForLatitude:(double)a3 longitude:(double)a4 reply:(id)a5;
- (void)getModelPropertiesWithReply:(id)a3;
@end

@implementation LSRAssets

- (void)getModelPropertiesWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100016110((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)getContextualNamedEntitySourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5
{
}

- (void)getContextualRankedContactSourcesForApplication:(id)a3 taskName:(id)a4 reply:(id)a5
{
}

- (void)getGeoLMRegionIDForLatitude:(double)a3 longitude:(double)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = self;
  sub_1000173EC((uint64_t)v9, (void (**)(void, NSString))v8, a3, a4);
  _Block_release(v8);
}

- (_TtC22localspeechrecognition9LSRAssets)init
{
}

- (void).cxx_destruct
{
  sub_100040FF0();
  sub_1000192D0();
  sub_100019374();
  v3();
  sub_100019380();
  sub_100019380();
  sub_100019154((uint64_t)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelOverridePath, &qword_1000641E0);
  v4 = (char *)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_configurationFile;
  uint64_t v5 = sub_100040E80();
  sub_1000192D0();
  v7 = *(void (**)(char *, uint64_t))(v6 + 8);
  v7(v4, v5);
  v7((char *)self + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets_modelRoot, v5);
  sub_100019380();
  sub_100019380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100018708(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___contextualData));
  v8 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22localspeechrecognition9LSRAssets____lazy_storage___geoLMHelper);

  sub_100018708(v8);
}

@end