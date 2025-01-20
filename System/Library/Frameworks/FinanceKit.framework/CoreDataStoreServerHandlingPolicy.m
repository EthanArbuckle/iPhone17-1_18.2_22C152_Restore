@interface CoreDataStoreServerHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (_TtC10FinanceKit33CoreDataStoreServerHandlingPolicy)init;
- (id)allowableClassesForClientWithContext:(id)a3;
@end

@implementation CoreDataStoreServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_2434F2CEC(v4);

  return v6 & 1;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  if (sub_2434F2ED0())
  {
    v3 = (void *)sub_2439588B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (_TtC10FinanceKit33CoreDataStoreServerHandlingPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreDataStoreServerHandlingPolicy();
  return [(CoreDataStoreServerHandlingPolicy *)&v3 init];
}

@end