@interface HapticMusicSiriActionSource
- (_TtC19AXHapticMusicServer27HapticMusicSiriActionSource)init;
- (_TtC19AXHapticMusicServer27HapticMusicSiriActionSource)initWithDelegate:(id)a3;
- (void)activeChangedToValue:(id)a3;
@end

@implementation HapticMusicSiriActionSource

- (_TtC19AXHapticMusicServer27HapticMusicSiriActionSource)initWithDelegate:(id)a3
{
  *(void *)&self->SiriDirectActionSource_opaque[OBJC_IVAR____TtC19AXHapticMusicServer27HapticMusicSiriActionSource_hmDelegate] = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HapticMusicSiriActionSource();
  swift_unknownObjectRetain_n();
  v4 = [(HapticMusicSiriActionSource *)&v6 initWithDelegate:a3];
  swift_unknownObjectRelease();
  return v4;
}

- (void)activeChangedToValue:(id)a3
{
  id value = a3;
  v4 = self;
  HapticMusicSiriActionSource.activeChangedTo(value:)((NSNumber)value);
}

- (_TtC19AXHapticMusicServer27HapticMusicSiriActionSource)init
{
  result = (_TtC19AXHapticMusicServer27HapticMusicSiriActionSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end