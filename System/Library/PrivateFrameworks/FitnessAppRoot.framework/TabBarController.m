@interface TabBarController
- (_TtC14FitnessAppRoot16TabBarController)init;
- (_TtC14FitnessAppRoot16TabBarController)initWithCoder:(id)a3;
- (_TtC14FitnessAppRoot16TabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC14FitnessAppRoot16TabBarController)initWithTabs:(id)a3;
- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4;
- (void)didMoveToParentViewController:(id)a3;
@end

@implementation TabBarController

- (_TtC14FitnessAppRoot16TabBarController)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TabBarController *)&v3 initWithNibName:0 bundle:0];
}

- (_TtC14FitnessAppRoot16TabBarController)initWithCoder:(id)a3
{
  result = (_TtC14FitnessAppRoot16TabBarController *)sub_24EA06E48();
  __break(1u);
  return result;
}

- (void)_setSelectedViewController:(id)a3 performUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v6 = a3;
  id v7 = v8.receiver;
  [(TabBarController *)&v8 _setSelectedViewController:v6 performUpdates:v4];
  sub_24E9DB2E0();
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TabBarController *)&v6 didMoveToParentViewController:v4];
  sub_24E9DB2E0();
}

- (_TtC14FitnessAppRoot16TabBarController)initWithTabs:(id)a3
{
  result = (_TtC14FitnessAppRoot16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14FitnessAppRoot16TabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14FitnessAppRoot16TabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end