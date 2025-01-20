@interface AudiogramSymbolDetectorModel
- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5;
- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5 classNames:(id)a6 collisionMitigationClassNames:(id)a7;
- (id)getSymbolDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4 in:(id)a5;
@end

@implementation AudiogramSymbolDetectorModel

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5 classNames:(id)a6 collisionMitigationClassNames:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v11 = sub_23F120CA0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v17 = (char *)&v22 - v16;
  sub_23F120C90();
  v18 = (objc_class *)sub_23F120E60();
  v19 = (objc_class *)sub_23F120E60();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_classNames) = v18;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC18AudiogramIngestion28AudiogramSymbolDetectorModel_collisionMitigationClassNames) = v19;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v20 = (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v15, width, height, a5);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return v20;
}

- (id)getSymbolDetectorResult:(CGImage *)a3 orientation:(unsigned int)a4 in:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v8 = a3;
  id v9 = a5;
  v10 = self;
  uint64_t v11 = sub_23F113480(v8, v6, (uint64_t)v9);

  if (v11)
  {
    type metadata accessor for AudiogramSymbolDetectorResult();
    uint64_t v12 = (void *)sub_23F120E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  uint64_t v5 = sub_23F120CA0();
  MEMORY[0x270FA5388](v5 - 8);
  sub_23F120C90();
  result = (_TtC18AudiogramIngestion28AudiogramSymbolDetectorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end