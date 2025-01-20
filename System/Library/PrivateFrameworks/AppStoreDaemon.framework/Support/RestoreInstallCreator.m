@interface RestoreInstallCreator
+ (id)createRestoreFromCoordinatorWithCoordinator:(id)a3 policy:(id)a4 error:(id *)a5;
- (_TtC9appstored21RestoreInstallCreator)init;
@end

@implementation RestoreInstallCreator

+ (id)createRestoreFromCoordinatorWithCoordinator:(id)a3 policy:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_10001B6E0(v6, v7);
  v9 = v8;

  return v9;
}

- (_TtC9appstored21RestoreInstallCreator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RestoreInstallCreator();
  return [(RestoreInstallCreator *)&v3 init];
}

@end