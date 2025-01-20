@interface SHManagedSessionWrapperDelegate
- (_TtC9ShazamKit31SHManagedSessionWrapperDelegate)init;
- (void)didCalculateSpectralData:(id)a3;
- (void)finishedManagedSession:(id)a3;
@end

@implementation SHManagedSessionWrapperDelegate

- (void)finishedManagedSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_224B739B0();
}

- (void)didCalculateSpectralData:(id)a3
{
  sub_224B734BC();
  unint64_t v4 = sub_224BBF0B0();
  v5 = self;
  sub_224B72214(v4);

  swift_bridgeObjectRelease();
}

- (_TtC9ShazamKit31SHManagedSessionWrapperDelegate)init
{
  result = (_TtC9ShazamKit31SHManagedSessionWrapperDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_224B73E2C((uint64_t)self + OBJC_IVAR____TtC9ShazamKit31SHManagedSessionWrapperDelegate_multipleResultsContinuation, &qword_268097008);
  sub_224B73E2C((uint64_t)self + OBJC_IVAR____TtC9ShazamKit31SHManagedSessionWrapperDelegate_spectralDataContinuation, &qword_268097010);
  swift_release();

  swift_release();
}

@end