@interface _DPBAACertificateChain
- (_DPBAACertificateChain)init;
- (_DPBAACertificateChain)initWithIntermediateCertificate:(id)a3 leafCertificate:(id)a4;
@end

@implementation _DPBAACertificateChain

- (_DPBAACertificateChain)initWithIntermediateCertificate:(id)a3 leafCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100058D80();
  uint64_t v10 = v9;

  uint64_t v11 = sub_100058D80();
  uint64_t v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR____DPBAACertificateChain_intermediateCertificate);
  uint64_t *v14 = v8;
  v14[1] = v10;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____DPBAACertificateChain_leafCertificate);
  uint64_t *v15 = v11;
  v15[1] = v13;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for _DPBAACertificateChain();
  return [(_DPBAACertificateChain *)&v17 init];
}

- (_DPBAACertificateChain)init
{
  result = (_DPBAACertificateChain *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100016B2C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPBAACertificateChain_intermediateCertificate), *(void *)&self->intermediateCertificate[OBJC_IVAR____DPBAACertificateChain_intermediateCertificate]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____DPBAACertificateChain_leafCertificate);
  unint64_t v4 = *(void *)&self->intermediateCertificate[OBJC_IVAR____DPBAACertificateChain_leafCertificate];
  sub_100016B2C(v3, v4);
}

@end