@interface _DPDediscoAlgorithmParameters
- (_DPDediscoAlgorithmParameters)init;
- (_DPDediscoAlgorithmParameters)initWithDimension:(int64_t)a3 epsilon:(double)a4;
- (_DPDediscoAlgorithmParameters)initWithDimension:(int64_t)a3 epsilon:(double)a4 otherParams:(id)a5;
@end

@implementation _DPDediscoAlgorithmParameters

- (_DPDediscoAlgorithmParameters)initWithDimension:(int64_t)a3 epsilon:(double)a4 otherParams:(id)a5
{
  id v8 = a5;
  uint64_t v9 = sub_100058D80();
  uint64_t v11 = v10;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParameters_dimension) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParameters_epsilon) = a4;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoAlgorithmParameters_otherParams);
  uint64_t *v12 = v9;
  v12[1] = v11;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for _DPDediscoAlgorithmParameters();
  return [(_DPDediscoAlgorithmParameters *)&v14 init];
}

- (_DPDediscoAlgorithmParameters)initWithDimension:(int64_t)a3 epsilon:(double)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParameters_dimension) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParameters_epsilon) = a4;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParameters_otherParams) = xmmword_10005EF00;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _DPDediscoAlgorithmParameters();
  return [(_DPDediscoAlgorithmParameters *)&v5 init];
}

- (_DPDediscoAlgorithmParameters)init
{
  result = (_DPDediscoAlgorithmParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end