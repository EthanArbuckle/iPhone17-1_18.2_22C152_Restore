@interface GradientUpdatingDelegate
- (_TtC23GradientPosterExtension24GradientUpdatingDelegate)init;
- (void)updateConfiguration:(id)a3 completion:(id)a4;
- (void)updateDescriptors:(id)a3 completion:(id)a4;
@end

@implementation GradientUpdatingDelegate

- (void)updateDescriptors:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_100007CF4(0, (unint64_t *)&unk_1000192A0);
  uint64_t v6 = sub_100010D08();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_100006CFC(v6, (void (*)(void, void))sub_1000059F4, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)updateConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void (*)(void *, id, void))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6, v8, 0);
  _Block_release(v6);
}

- (_TtC23GradientPosterExtension24GradientUpdatingDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23GradientPosterExtension24GradientUpdatingDelegate_currentDescriptorsVersion) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GradientUpdatingDelegate();
  return [(GradientUpdatingDelegate *)&v3 init];
}

@end