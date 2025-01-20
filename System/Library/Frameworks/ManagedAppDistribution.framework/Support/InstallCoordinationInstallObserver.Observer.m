@interface InstallCoordinationInstallObserver.Observer
- (BOOL)isEqual:(id)a3;
- (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer)init;
- (int64_t)hash;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
@end

@implementation InstallCoordinationInstallObserver.Observer

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  uint64_t v7 = sub_1000172F8(&qword_100660E60);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v11 = a4;
    id v12 = a3;
    v13 = self;
    id v14 = [v12 identity];
    v17[0] = a3;
    v17[1] = v14;
    v17[3] = 0;
    v17[4] = 0;
    v17[2] = a4;
    char v18 = 2;
    id v15 = v11;
    id v16 = v12;
    sub_1000172F8(&qword_100660E68);
    AsyncStream.Continuation.yield(_:)();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  uint64_t v11 = sub_1000172F8(&qword_100660E60);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a3;
  id v16 = self;
  id v17 = [v15 identity];
  v19[0] = a3;
  v19[1] = v17;
  *(double *)&v19[2] = a4;
  v19[3] = a5;
  *(double *)&v19[4] = a6;
  char v20 = 1;
  id v18 = v15;
  sub_1000172F8(&qword_100660E68);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_10034063C((uint64_t)v8);

  sub_100016E7C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Hasher.init()();
  uint64_t v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer_coordinator);
  uint64_t v8 = self;
  id v9 = [v7 uniqueIdentifier];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10034174C((unint64_t *)&unk_100660E70, (void (*)(uint64_t))&type metadata accessor for UUID);
  dispatch thunk of Hashable.hash(into:)();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  long long v19 = v14;
  long long v20 = v15;
  uint64_t v21 = v16;
  long long v17 = *(_OWORD *)&v12[8];
  long long v18 = v13;
  Swift::Int v10 = Hasher.finalize()();

  return v10;
}

- (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer)init
{
  result = (_TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer_coordinator));
  uint64_t v3 = (char *)self
     + OBJC_IVAR____TtCC28ManagedAppDistributionDaemon34InstallCoordinationInstallObserverP33_B8C0BD49E46B9356C2E4FA5F73F7501B8Observer_continuation;
  uint64_t v4 = sub_1000172F8(&qword_100660E68);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end