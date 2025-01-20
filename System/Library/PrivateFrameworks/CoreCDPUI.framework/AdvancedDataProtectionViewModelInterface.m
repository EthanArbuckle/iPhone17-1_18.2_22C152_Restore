@interface AdvancedDataProtectionViewModelInterface
- (_TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface)init;
@end

@implementation AdvancedDataProtectionViewModelInterface

- (_TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface)init
{
  result = (_TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_cdpContext));
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__progressViewIsDisplayed;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BDCE68);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__isWalrusEnabled, v4);
  v5((char *)self+ OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__isWalrusAvailableForPrimaryAccount, v4);
  v6 = (char *)self
     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__localizedWalrusUnavailableMessage;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BDCE70);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__walrusStatusMismatchDetected, v4);
  v8 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface__adpState;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BDCE78);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_accountRecoveryRowViewModel));
  swift_release();
  swift_release();
  v10 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI40AdvancedDataProtectionViewModelInterface_walrusStatePublisher;
  uint64_t v11 = sub_2188621D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();

  swift_release();
}

@end