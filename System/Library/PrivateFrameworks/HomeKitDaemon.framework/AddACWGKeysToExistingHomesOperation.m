@interface AddACWGKeysToExistingHomesOperation
+ (NSPredicate)predicate;
- (BOOL)mainWithError:(id *)a3;
- (HMFFlow)flow;
- (_TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9;
- (int64_t)qualityOfService;
- (void)setFlow:(id)a3;
@end

@implementation AddACWGKeysToExistingHomesOperation

+ (NSPredicate)predicate
{
  id v2 = objc_msgSend(self, sel_predicateWithValue_, 1);
  return (NSPredicate *)v2;
}

- (int64_t)qualityOfService
{
  return 17;
}

- (BOOL)mainWithError:(id *)a3
{
  v4 = self;
  AddACWGKeysToExistingHomesOperation.main()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_2302DD050();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (HMFFlow)flow
{
  id v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow);
  swift_beginAccess();
  return (HMFFlow *)*v2;
}

- (void)setFlow:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow);
  swift_beginAccess();
  v5 = *v4;
  _TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation *v4 = a3;
  id v6 = a3;
}

- (_TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9
{
  v25[1] = self;
  uint64_t v11 = (uint64_t)a9;
  uint64_t v12 = sub_2302DD220();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v17 = (char *)v25 - v16;
  uint64_t v18 = sub_2302DD2B0();
  MEMORY[0x270FA5388](v18 - 8);
  v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  uint64_t v21 = sub_2302DDB00();
  sub_2302DD200();
  sub_2302DD200();
  if (a9) {
    uint64_t v11 = sub_2302DDF70();
  }
  id v22 = a5;
  swift_unknownObjectRetain();
  v23 = (_TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation *)sub_22F555F54((uint64_t)v20, v21, (uint64_t)v22, (uint64_t)v17, (uint64_t)v15, (uint64_t)a8, v11);
  swift_unknownObjectRelease();

  return v23;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HomeKitDaemon35AddACWGKeysToExistingHomesOperation_flow));
}

@end