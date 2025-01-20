@interface AlishaSPAKE2ProverConfirmed
- (NSData)KEnc;
- (NSData)KMac;
- (NSData)KRMac;
- (NSData)Kble_intro;
- (NSData)Kble_oob_master;
- (NSData)M2;
- (NSData)SymmetricLTS;
- (NSData)alishaKey;
- (_TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed)init;
@end

@implementation AlishaSPAKE2ProverConfirmed

- (NSData)alishaKey
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_alishaKey));
}

- (NSData)KEnc
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_KEnc));
}

- (NSData)KMac
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_KMac));
}

- (NSData)KRMac
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_KRMac));
}

- (NSData)SymmetricLTS
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_SymmetricLTS));
}

- (NSData)Kble_intro
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_Kble_intro));
}

- (NSData)Kble_oob_master
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_Kble_oob_master));
}

- (NSData)M2
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_M2));
}

- (_TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed)init
{
  result = (_TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_alishaKey));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_SymmetricLTS));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_Kble_intro));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_Kble_oob_master));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate27AlishaSPAKE2ProverConfirmed_M2);
}

@end