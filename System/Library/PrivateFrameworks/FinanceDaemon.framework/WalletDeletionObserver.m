@interface WalletDeletionObserver
- (_TtC13FinanceDaemon22WalletDeletionObserver)init;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
@end

@implementation WalletDeletionObserver

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FinanceDaemon22WalletDeletionObserver_applicationWorkspace);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(WalletDeletionObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FinanceDaemon22WalletDeletionObserver_applicationWorkspace);
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (_TtC13FinanceDaemon22WalletDeletionObserver)init
{
  result = (_TtC13FinanceDaemon22WalletDeletionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end