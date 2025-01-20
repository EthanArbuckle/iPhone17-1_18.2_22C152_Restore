@interface PDFCTLDDelegateForTables
- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4;
@end

@implementation PDFCTLDDelegateForTables

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] == 6) {
    uint64_t v7 = [v5 groupID];
  }
  else {
    uint64_t v7 = -1;
  }
  if ([v6 type] == 6) {
    uint64_t v8 = [v6 groupID];
  }
  else {
    uint64_t v8 = -1;
  }
  uint64_t v9 = 1;
  if (v7 == v8) {
    uint64_t v9 = 2;
  }
  if ((v7 & v8) == 0xFFFFFFFFFFFFFFFFLL) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v9;
  }

  return v10;
}

@end