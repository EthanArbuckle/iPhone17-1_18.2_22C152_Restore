@interface AudiogramDetectorModel
- (CGSize)modelInputSize;
- (MLModel)model;
- (NSURL)url;
- (_TtC18AudiogramIngestion22AudiogramDetectorModel)init;
- (_TtC18AudiogramIngestion22AudiogramDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5;
- (float)confidenceThreshold;
- (void)setModel:(id)a3;
@end

@implementation AudiogramDetectorModel

- (MLModel)model
{
  return (MLModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model));
}

- (void)setModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_model) = (Class)a3;
  id v3 = a3;
}

- (NSURL)url
{
  v2 = (void *)sub_23F120C80();
  return (NSURL *)v2;
}

- (CGSize)modelInputSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize);
  double v3 = *(double *)&self->model[OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_modelInputSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)confidenceThreshold
{
  return *(float *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_confidenceThreshold);
}

- (_TtC18AudiogramIngestion22AudiogramDetectorModel)initWithModelUrl:(id)a3 modelInputSize:(CGSize)a4 confidenceThreshold:(float)a5
{
  double height = a4.height;
  double width = a4.width;
  sub_23F120CA0();
  MEMORY[0x270FA5388]();
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F120C90();
  return (_TtC18AudiogramIngestion22AudiogramDetectorModel *)AudiogramDetectorModel.init(modelUrl:modelInputSize:confidenceThreshold:)((uint64_t)v9, width, height, a5);
}

- (_TtC18AudiogramIngestion22AudiogramDetectorModel)init
{
  CGSize result = (_TtC18AudiogramIngestion22AudiogramDetectorModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_url;
  uint64_t v4 = sub_23F120CA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC18AudiogramIngestion22AudiogramDetectorModel_logger;
  uint64_t v6 = sub_23F120D30();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end