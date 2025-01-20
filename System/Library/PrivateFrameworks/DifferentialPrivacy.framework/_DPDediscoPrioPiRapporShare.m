@interface _DPDediscoPrioPiRapporShare
- (_DPDediscoPrioPiRapporShare)init;
- (_DPDediscoPrioPiRapporShare)initWithPrioShare:(id)a3 numberOfEncodedIndices:(unint64_t)a4 piRapporOtherPhi:(id)a5;
- (_DPDediscoPrioPiRapporShare)initWithSerializedData:(id)a3 error:(id *)a4;
- (id)getPiRapporOtherPhi;
- (id)getPrioShare;
- (id)serializeAndReturnError:(id *)a3;
- (unint64_t)getNumberOfEncodedIndices;
@end

@implementation _DPDediscoPrioPiRapporShare

- (_DPDediscoPrioPiRapporShare)initWithPrioShare:(id)a3 numberOfEncodedIndices:(unint64_t)a4 piRapporOtherPhi:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_1DC5BFAC0();
  uint64_t v12 = v11;

  uint64_t v13 = sub_1DC5BFAC0();
  uint64_t v15 = v14;

  v16 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  uint64_t *v16 = v10;
  v16[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices) = (Class)a4;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  uint64_t *v17 = v13;
  v17[1] = v15;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return [(_DPDediscoPrioPiRapporShare *)&v19 init];
}

- (_DPDediscoPrioPiRapporShare)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_1DC5BFAC0();
  unint64_t v7 = v6;

  return (_DPDediscoPrioPiRapporShare *)_DPDediscoPrioPiRapporShare.init(serializedData:)(v5, v7);
}

- (id)getPrioShare
{
  return sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
}

- (unint64_t)getNumberOfEncodedIndices
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
}

- (id)getPiRapporOtherPhi
{
  return sub_1DC5B3C3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
}

- (id)serializeAndReturnError:(id *)a3
{
  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1F4188790]();
  uint64_t v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = self;
  sub_1DC5B39CC();
  unint64_t v6 = self;
  sub_1DC5BFBC0();
  uint64_t v7 = sub_1DC5BFB90();
  unint64_t v9 = v8;
  sub_1DC5B3A7C((uint64_t)v5);

  uint64_t v10 = (void *)sub_1DC5BFAB0();
  sub_1DC5B3A24(v7, v9);
  return v10;
}

- (_DPDediscoPrioPiRapporShare)init
{
  result = (_DPDediscoPrioPiRapporShare *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DC5B3A24(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare), *(void *)&self->prioShare[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  unint64_t v4 = *(void *)&self->prioShare[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi];
  sub_1DC5B3A24(v3, v4);
}

@end