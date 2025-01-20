@interface ShazamKitRecognizer
- (_TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer)init;
- (void)finishedManagedSession:(id)a3;
- (void)session:(id)a3 didFindMatch:(id)a4;
- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5;
@end

@implementation ShazamKitRecognizer

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_EC968(v7);
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_ED3B8((uint64_t)a5);
}

- (void)finishedManagedSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_EAFF4(v4);
}

- (_TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer)init
{
  result = (_TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer_managedSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer_dispatchGroup));
  sub_23A44((uint64_t)self + OBJC_IVAR____TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer_result, &qword_310760);
  v3 = (char *)self + OBJC_IVAR____TtC23AudioFlowDelegatePlugin19ShazamKitRecognizer_nowPlayingProvider;

  sub_7184((uint64_t)v3);
}

@end