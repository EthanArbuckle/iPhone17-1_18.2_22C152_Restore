@interface BRCApplyJobIdentifier
- (BRCApplyJobIdentifier)initWithItemDBRowID:(int64_t)a3;
- (int64_t)rank;
- (int64_t)rejectedRowID;
- (int64_t)serverItemRank;
@end

@implementation BRCApplyJobIdentifier

- (BRCApplyJobIdentifier)initWithItemDBRowID:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return [(BRCItemDBRowIDJobIdentifier *)&v4 initWithItemDBRowID:a3];
}

- (int64_t)rank
{
  v3.receiver = self;
  v3.super_class = (Class)BRCApplyJobIdentifier;
  return [(BRCItemDBRowIDJobIdentifier *)&v3 itemDBRowID];
}

- (int64_t)rejectedRowID
{
  v5.receiver = self;
  v5.super_class = (Class)BRCApplyJobIdentifier;
  if (([(BRCItemDBRowIDJobIdentifier *)&v5 itemDBRowID] & 0x8000000000000000) == 0) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return -[(BRCItemDBRowIDJobIdentifier *)&v4 itemDBRowID];
}

- (int64_t)serverItemRank
{
  v5.receiver = self;
  v5.super_class = (Class)BRCApplyJobIdentifier;
  if ([(BRCItemDBRowIDJobIdentifier *)&v5 itemDBRowID] < 1) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCApplyJobIdentifier;
  return [(BRCItemDBRowIDJobIdentifier *)&v4 itemDBRowID];
}

@end