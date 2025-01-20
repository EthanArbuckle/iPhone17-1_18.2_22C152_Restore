@interface APDaemonPersistentContainer
- (_TtC13AppProtection27APDaemonPersistentContainer)init;
- (_TtC13AppProtection27APDaemonPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4;
@end

@implementation APDaemonPersistentContainer

- (_TtC13AppProtection27APDaemonPersistentContainer)init
{
  v3 = (void *)sub_247DD2BF0();
  sub_247D99D68();
  v5 = v4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for APDaemonPersistentContainer();
  v6 = [(NSPersistentContainer *)&v8 initWithName:v3 managedObjectModel:v5];

  return v6;
}

- (_TtC13AppProtection27APDaemonPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  id v4 = a4;
  result = (_TtC13AppProtection27APDaemonPersistentContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end