@interface HKAudiogramAverageSensitivityDataSource
- (HKAudiogramAverageSensitivityDataSource)init;
- (HKAudiogramAverageSensitivityDataSource)initWithAudiogramSample:(id)a3 isLeftEar:(BOOL)a4;
- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
@end

@implementation HKAudiogramAverageSensitivityDataSource

- (HKAudiogramAverageSensitivityDataSource)initWithAudiogramSample:(id)a3 isLeftEar:(BOOL)a4
{
  id v7 = objc_allocWithZone((Class)HKGraphSeriesDataBlock);
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v7, sel_init);
  sub_1E0E79084(v8, a4);
  sub_1E0E425C4(0, (unint64_t *)&qword_1EAD6DBE0);
  v11 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setChartPoints_, v11);

  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR___HKAudiogramAverageSensitivityDataSource_dataBlock) = (Class)v10;
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for AudiogramAverageSensitivityDataSource();
  v12 = [(HKGraphSeriesDataSource *)&v14 init];

  return v12;
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  swift_unknownObjectRetain();
  id v8 = self;
  sub_1E0ECD760();

  swift_unknownObjectRelease();
  result = (HKGraphSeriesDataBlockPath *)__swift_destroy_boxed_opaque_existential_0((uint64_t)&v10);
  *(_OWORD *)&retstr->index = xmmword_1E0F099D0;
  retstr->resolution = 0;
  return result;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  int64_t index = a3->index;
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1E0ECD760();
    swift_unknownObjectRelease();
    if (index)
    {
LABEL_3:
      id v7 = objc_msgSend(self, sel_emptyDataBlock);
      goto LABEL_6;
    }
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    id v8 = self;
    if (index) {
      goto LABEL_3;
    }
  }
  id v7 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR___HKAudiogramAverageSensitivityDataSource_dataBlock);
LABEL_6:
  v9 = v7;

  sub_1E0B32EE4((uint64_t)v11);
  return v9;
}

- (HKAudiogramAverageSensitivityDataSource)init
{
  result = (HKAudiogramAverageSensitivityDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end