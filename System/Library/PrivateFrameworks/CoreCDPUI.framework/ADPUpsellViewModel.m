@interface ADPUpsellViewModel
- (_TtC9CoreCDPUI18ADPUpsellViewModel)init;
- (void)showErrorAlertTitled:(id)a3 message:(id)a4;
@end

@implementation ADPUpsellViewModel

- (_TtC9CoreCDPUI18ADPUpsellViewModel)init
{
  result = (_TtC9CoreCDPUI18ADPUpsellViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_21882FDE8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__alertState), *(void *)&self->_isWalrusEnabled[OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__alertState]);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel_urlBag);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel_reachabilityProvider);
  sub_21880E860((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel___observationRegistrar;
  uint64_t v4 = sub_218860F20();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)showErrorAlertTitled:(id)a3 message:(id)a4
{
  sub_218861F40();
  sub_218861F40();
  swift_getKeyPath();
  sub_218830358((unint64_t *)&unk_267BDD110, (void (*)(uint64_t))type metadata accessor for ADPUpsellViewModel);
  v5 = self;
  sub_218860ED0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end