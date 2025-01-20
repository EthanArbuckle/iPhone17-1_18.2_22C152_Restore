@interface MapsSyncDaemon
- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4;
- (id)identifierForConnection:(id)a3;
@end

@implementation MapsSyncDaemon

- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4
{
  id v5 = a4;
  swift_retain();
  id v6 = a3;
  LOBYTE(a3) = _s9mapssyncd14MapsSyncDaemonC19willPerformRecovery8forError4fromSbs0I0_pSg_So33NSXPCStoreServerConnectionContextCSgtF_0();

  swift_release();
  return a3 & 1;
}

- (id)identifierForConnection:(id)a3
{
  NSString v3 = sub_10002E8E8();
  return v3;
}

@end