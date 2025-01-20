@interface AudiogramGraphDetectorModel
- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5;
- (id)getGraphDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4;
@end

@implementation AudiogramGraphDetectorModel

- (id)getGraphDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = a3;
  v7 = self;
  uint64_t v8 = sub_23F114714((uint64_t)v6, v4);

  if (v8)
  {
    type metadata accessor for AudiogramGraphDetectorResult();
    v9 = (void *)sub_23F120E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v8 = sub_23F120CA0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v17 - v13;
  sub_23F120C90();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v15 = (_TtC18AudiogramIngestion27AudiogramGraphDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v12, width, height, a5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  return v15;
}

@end