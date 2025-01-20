@interface ApplicationWorkspaceObserver
- (_TtC7imagent28ApplicationWorkspaceObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation ApplicationWorkspaceObserver

- (_TtC7imagent28ApplicationWorkspaceObserver)init
{
  return (_TtC7imagent28ApplicationWorkspaceObserver *)sub_10003D2A8();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultWorkspace];
  if (v5)
  {
    v6 = v5;
    [v5 removeObserver:v4];

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for ApplicationWorkspaceObserver();
    [(ApplicationWorkspaceObserver *)&v7 dealloc];
  }
  else
  {
    __break(1u);
  }
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  v4 = self;
  if ((v2() & 1) != 0 || [self completedSystemAppMigration]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_10003BFE0();
  }
  sub_10003D6CC(v3 & 1);
}

@end