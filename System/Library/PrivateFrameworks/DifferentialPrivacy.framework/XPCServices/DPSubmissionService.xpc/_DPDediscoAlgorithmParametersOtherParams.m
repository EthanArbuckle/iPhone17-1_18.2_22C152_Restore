@interface _DPDediscoAlgorithmParametersOtherParams
- (_DPDediscoAlgorithmParametersOtherParams)init;
- (_DPDediscoAlgorithmParametersOtherParams)initWithCohortSize:(int64_t)a3 sigma:(double)a4;
- (_DPDediscoAlgorithmParametersOtherParams)initWithCohortSize:(int64_t)a3 sigma:(double)a4 piRapporPrime:(unsigned int)a5 piRapporAlpha0:(double)a6 piRapporAlpha1:(double)a7;
- (_DPDediscoAlgorithmParametersOtherParams)initWithPiRapporPrime:(unsigned int)a3 piRapporAlpha0:(double)a4 piRapporAlpha1:(double)a5;
- (id)serializeAndReturnError:(id *)a3;
@end

@implementation _DPDediscoAlgorithmParametersOtherParams

- (_DPDediscoAlgorithmParametersOtherParams)initWithCohortSize:(int64_t)a3 sigma:(double)a4
{
  return [(_DPDediscoAlgorithmParametersOtherParams *)self initWithCohortSize:a3 sigma:0 piRapporPrime:a4 piRapporAlpha0:0.0 piRapporAlpha1:0.0];
}

- (_DPDediscoAlgorithmParametersOtherParams)initWithPiRapporPrime:(unsigned int)a3 piRapporAlpha0:(double)a4 piRapporAlpha1:(double)a5
{
  return [(_DPDediscoAlgorithmParametersOtherParams *)self initWithCohortSize:0 sigma:*(void *)&a3 piRapporPrime:0.0 piRapporAlpha0:a4 piRapporAlpha1:a5];
}

- (_DPDediscoAlgorithmParametersOtherParams)initWithCohortSize:(int64_t)a3 sigma:(double)a4 piRapporPrime:(unsigned int)a5 piRapporAlpha0:(double)a6 piRapporAlpha1:(double)a7
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParametersOtherParams_cohortSize) = (Class)a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParametersOtherParams_sigma) = a4;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParametersOtherParams_piRapporPrime) = a5;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParametersOtherParams_piRapporAlpha0) = a6;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoAlgorithmParametersOtherParams_piRapporAlpha1) = a7;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _DPDediscoAlgorithmParametersOtherParams();
  return [(_DPDediscoAlgorithmParametersOtherParams *)&v8 init];
}

- (id)serializeAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for DediscoAlgorithmParametersOtherParams();
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = self;
  sub_10003ADA8();
  v7 = self;
  sub_100058F60();
  uint64_t v8 = sub_100058F30();
  unint64_t v10 = v9;
  sub_10003AE00((uint64_t)v6);

  v11.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v8, v10);
  return v11.super.isa;
}

- (_DPDediscoAlgorithmParametersOtherParams)init
{
  result = (_DPDediscoAlgorithmParametersOtherParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end