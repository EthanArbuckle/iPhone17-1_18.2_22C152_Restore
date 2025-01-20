@interface EDPTokenSpyglassViewModel
- (_TtC9CoreCDPUI25EDPTokenSpyglassViewModel)init;
@end

@implementation EDPTokenSpyglassViewModel

- (_TtC9CoreCDPUI25EDPTokenSpyglassViewModel)init
{
  result = (_TtC9CoreCDPUI25EDPTokenSpyglassViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_218814700((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI25EDPTokenSpyglassViewModel__request, &qword_267BDDD58);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreCDPUI25EDPTokenSpyglassViewModel_presentingViewController));
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI25EDPTokenSpyglassViewModel___observationRegistrar;
  uint64_t v4 = sub_218860F20();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end