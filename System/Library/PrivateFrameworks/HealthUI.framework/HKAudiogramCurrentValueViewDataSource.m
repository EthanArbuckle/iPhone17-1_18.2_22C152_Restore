@interface HKAudiogramCurrentValueViewDataSource
- (BOOL)showSeparators;
- (HKAudiogramCurrentValueViewDataSource)init;
- (HKAudiogramCurrentValueViewDataSource)initWithApplicationItems:(id)a3;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)updateWithAudiogram:(id)a3;
@end

@implementation HKAudiogramCurrentValueViewDataSource

- (HKAudiogramCurrentValueViewDataSource)initWithApplicationItems:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource____lazy_storage___chartFormatter) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_applicationItems) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels) = (Class)MEMORY[0x1E4FBC860];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiogramCurrentValueViewDataSource();
  id v4 = a3;
  return [(HKAudiogramCurrentValueViewDataSource *)&v6 init];
}

- (void)updateWithAudiogram:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram) = (Class)a3;
  id v5 = a3;
  objc_super v6 = self;

  sub_1E0E16E70();
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  v3 = self;
  id v4 = (void *)sub_1E0E182B0();

  return v4;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  id v5 = (unint64_t *)((char *)self + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v9 = a3;
  v10 = self;
  swift_bridgeObjectRetain();
  int64_t v7 = sub_1E0ECD910();

  swift_bridgeObjectRelease();
  return v7;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  int64_t v7 = (uint64_t *)((char *)self + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_keyValueLabels);
  id result = (id)swift_beginAccess();
  uint64_t v9 = *v7;
  if ((v9 & 0xC000000000000001) != 0)
  {
    v14 = self;
    swift_bridgeObjectRetain();
    id v12 = (id)MEMORY[0x1E4E3EF00](a3, v9);
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v13 = 1;
    goto LABEL_8;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a3)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  v10 = *(void **)(v9 + 8 * a3 + 32);
  v11 = self;
  id v12 = v10;
  if (!a4) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v13 = 0;
LABEL_8:
  objc_msgSend(v12, sel_setOrientation_, v13);

  return v12;
}

- (BOOL)showSeparators
{
  return 0;
}

- (HKAudiogramCurrentValueViewDataSource)init
{
  id result = (HKAudiogramCurrentValueViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource____lazy_storage___chartFormatter));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramCurrentValueViewDataSource_audiogram);
}

@end