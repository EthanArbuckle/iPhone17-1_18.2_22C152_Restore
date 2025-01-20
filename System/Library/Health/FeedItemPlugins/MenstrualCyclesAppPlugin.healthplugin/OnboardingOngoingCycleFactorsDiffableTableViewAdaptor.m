@interface OnboardingOngoingCycleFactorsDiffableTableViewAdaptor
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
@end

@implementation OnboardingOngoingCycleFactorsDiffableTableViewAdaptor

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_24126F174(0, (unint64_t *)&qword_268CFBBC0, MEMORY[0x263F81F50]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v9 = (char *)&v10 - v8;
  sub_24162F408();
  swift_retain();
  sub_24126F1E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end