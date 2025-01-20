@interface AXLTAudioHistogramViewGenerator
- (NSArray)histogram;
- (_TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator)init;
- (double)height;
- (id)viewController;
- (void)setHeight:(double)a3;
- (void)setHistogram:(id)a3;
@end

@implementation AXLTAudioHistogramViewGenerator

- (double)height
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  swift_release();
  return v5;
}

- (void)setHeight:(double)a3
{
}

- (NSArray)histogram
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  swift_retain();
  static Published.subscript.getter();

  swift_release();
  swift_release();
  swift_release();
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setHistogram:(id)a3
{
}

- (_TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator)init
{
  uint64_t v3 = OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_config;
  type metadata accessor for AudioHistogramConfig();
  NSArray v4 = (objc_class *)swift_allocObject();
  double v5 = self;
  sub_10004DFE0();
  *(Class *)((char *)&self->super.isa + v3) = v4;
  swift_retain();
  sub_1000508DC((uint64_t *)v11);
  v6 = (_OWORD *)((char *)v5 + OBJC_IVAR____TtC19LiveTranscriptionUI31AXLTAudioHistogramViewGenerator_audioHistogramView);
  long long v7 = v11[3];
  v6[2] = v11[2];
  v6[3] = v7;
  v6[4] = v11[4];
  long long v8 = v11[1];
  _OWORD *v6 = v11[0];
  v6[1] = v8;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for AXLTAudioHistogramViewGenerator();
  return [(AXLTAudioHistogramViewGenerator *)&v10 init];
}

- (id)viewController
{
  objc_allocWithZone((Class)sub_100006380(&qword_10006C800));
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v2 = (void *)UIHostingController.init(rootView:)();

  return v2;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end