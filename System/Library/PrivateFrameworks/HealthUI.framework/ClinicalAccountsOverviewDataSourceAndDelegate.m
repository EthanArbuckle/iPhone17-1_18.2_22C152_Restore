@interface ClinicalAccountsOverviewDataSourceAndDelegate
- (_TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ClinicalAccountsOverviewDataSourceAndDelegate

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1E0ECBD30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ECBCE0();
  id v11 = a3;
  v12 = self;
  sub_1E0E6291C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = sub_1E0E65F30();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1E0ECBD30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ECBCE0();
  id v11 = a3;
  v12 = self;
  uint64_t v13 = (void *)sub_1E0E65FA4((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
  }
  else
  {
    if (*(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate_accounts) >> 62)
    {
      id v7 = a3;
      uint64_t v8 = self;
      swift_bridgeObjectRetain();
      sub_1E0ECD910();

      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

- (_TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate)init
{
  result = (_TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI45ClinicalAccountsOverviewDataSourceAndDelegate_context));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end