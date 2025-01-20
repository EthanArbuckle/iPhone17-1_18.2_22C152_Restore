@interface HomesStore.CoreData.XPCStoreServer
- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4;
@end

@implementation HomesStore.CoreData.XPCStoreServer

- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4
{
  id v4 = a4;
  id v6 = a4;
  swift_retain();
  id v7 = a3;
  LOBYTE(v4) = sub_236D2B9C0(a3, v4);

  swift_release();
  return v4 & 1;
}

@end