@interface AAAccessSessionManager
- (AAAccessSessionManager)init;
- (BOOL)isActive;
- (BOOL)isDiagnosticSubmissionAllowed;
- (void)pushSessionData:(id)a3;
- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4;
- (void)pushSessionData:(id)a3 traits:(id)a4;
- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5;
@end

@implementation AAAccessSessionManager

- (BOOL)isActive
{
  v2 = self;
  char v3 = BridgedAccessSessionManager.isActive.getter();

  return v3 & 1;
}

- (void)pushSessionData:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_init);
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v6);
}

- (void)pushSessionData:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v6);
}

- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4
{
  id v6 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  id v7 = a3;
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_init);
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v7);
}

- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  BridgedAccessSessionManager.push(_:traits:)((uint64_t)v7);
}

- (BOOL)isDiagnosticSubmissionAllowed
{
  v2 = self;
  sub_1A9095B68((char *)&v6);
  int v3 = v6;

  return (v3 & 1) == 0 && v3 != 2;
}

- (AAAccessSessionManager)init
{
  result = (AAAccessSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end