@interface HKAudiogramAnnotationViewDataSource
- (BOOL)reverseColumnsInRightToLeftLayoutDirection;
- (BOOL)showSeparators;
- (HKAudiogramAnnotationViewDataSource)init;
- (HKAudiogramAnnotationViewDataSource)initWithApplicationItems:(id)a3;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (void)updateWithPointSelectionContexts:(id)a3 date:(id)a4 isAverage:(BOOL)a5;
@end

@implementation HKAudiogramAnnotationViewDataSource

- (HKAudiogramAnnotationViewDataSource)initWithApplicationItems:(id)a3
{
  id v3 = a3;
  v4 = (HKAudiogramAnnotationViewDataSource *)sub_1E0E422EC(v3);

  return v4;
}

- (void)updateWithPointSelectionContexts:(id)a3 date:(id)a4 isAverage:(BOOL)a5
{
  uint64_t v7 = sub_1E0ECB980();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6EA60);
  unint64_t v12 = sub_1E0ECD330();
  sub_1E0ECB940();
  v13 = self;
  sub_1E0E41710(v12, (uint64_t)v11, a5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_currentDateView));
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  unint64_t v3 = *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_keyValuePairs);
  if (!(v3 >> 62)) {
    return *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v6 = a3;
  uint64_t v7 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1E0ECD910();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  id v6 = self;
  uint64_t v7 = *(void *)((char *)self + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_keyValuePairs);
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v12 = self;
    swift_bridgeObjectRetain();
    id v10 = (id)MEMORY[0x1E4E3EF00](a3, v7);
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v11 = 1;
    goto LABEL_8;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a3)
  {
LABEL_12:
    __break(1u);
    return self;
  }
  int64_t v8 = *(void **)(v7 + 8 * a3 + 32);
  id v9 = self;
  id v10 = v8;
  if (!a4) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v11 = 0;
LABEL_8:
  objc_msgSend(v10, sel_setOrientation_, v11);

  return v10;
}

- (BOOL)showSeparators
{
  return 0;
}

- (BOOL)reverseColumnsInRightToLeftLayoutDirection
{
  return 0;
}

- (HKAudiogramAnnotationViewDataSource)init
{
  result = (HKAudiogramAnnotationViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_hearingSensitivityFormatter));
  unint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKAudiogramAnnotationViewDataSource_averageSensitivityFormatter);
}

@end