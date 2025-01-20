@interface FBKDraftModelSnapshotDiff
- (BOOL)containsAnyAdditionsOrRemovals;
- (BOOL)hasRemovedAllDevices;
- (FBKDraftModelSnapshot)currentSnapshot;
- (FBKDraftModelSnapshot)previousSnapshot;
- (FBKDraftModelSnapshotDiff)initWithPreviousSnapshot:(id)a3 newSnapshot:(id)a4;
- (NSArray)addedRows;
- (NSArray)addedSections;
- (NSArray)removedRows;
- (NSArray)removedSections;
- (NSString)description;
- (NSString)descriptionString;
- (unint64_t)indexOfRowInNewSnapshot:(id)a3;
- (unint64_t)indexOfSectionInNewSnapshot:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setPreviousSnapshot:(id)a3;
@end

@implementation FBKDraftModelSnapshotDiff

- (FBKDraftModelSnapshotDiff)initWithPreviousSnapshot:(id)a3 newSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKDraftModelSnapshotDiff;
  v9 = [(FBKDraftModelSnapshotDiff *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previousSnapshot, a3);
    objc_storeStrong((id *)&v10->_currentSnapshot, a4);
  }

  return v10;
}

- (FBKDraftModelSnapshot)previousSnapshot
{
  return self->_previousSnapshot;
}

- (void)setPreviousSnapshot:(id)a3
{
}

- (FBKDraftModelSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);

  objc_storeStrong((id *)&self->_previousSnapshot, 0);
}

- (NSArray)removedSections
{
  return (NSArray *)sub_22A4A0194(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.removedSections.getter, &qword_268377828);
}

- (NSArray)addedSections
{
  return (NSArray *)sub_22A4A0194(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.addedSections.getter, &qword_268377828);
}

- (NSArray)addedRows
{
  return (NSArray *)sub_22A4A0194(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.addedRows.getter, &qword_268377820);
}

- (NSArray)removedRows
{
  return (NSArray *)sub_22A4A0194(self, (uint64_t)a2, (void (*)(void))FBKDraftModelSnapshotDiff.removedRows.getter, &qword_268377820);
}

- (unint64_t)indexOfRowInNewSnapshot:(id)a3
{
  v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  Swift::UInt v6 = FBKDraftModelSnapshotDiff.indexOfRowInNewSnapshot(_:)(v8);

  return v6;
}

- (BOOL)containsAnyAdditionsOrRemovals
{
  v2 = self;
  BOOL v3 = FBKDraftModelSnapshotDiff.containsAnyAdditionsOrRemovals.getter();

  return v3;
}

- (BOOL)hasRemovedAllDevices
{
  v2 = self;
  BOOL v3 = [(FBKDraftModelSnapshotDiff *)v2 previousSnapshot];
  unsigned int v4 = [(FBKDraftModelSnapshot *)v3 hasAnyDevices];

  if (v4)
  {
    v5 = [(FBKDraftModelSnapshotDiff *)v2 currentSnapshot];
    unsigned __int8 v6 = [(FBKDraftModelSnapshot *)v5 hasAnyDevices];

    return v6 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)indexOfSectionInNewSnapshot:(id)a3
{
  unsigned int v4 = (objc_class *)a3;
  v5 = self;
  v8.super.isa = v4;
  Swift::UInt v6 = FBKDraftModelSnapshotDiff.indexOfSectionInNewSnapshot(_:)(v8);

  return v6;
}

- (NSString)descriptionString
{
  v2 = self;
  sub_22A4A1350();

  BOOL v3 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)description
{
  v2 = self;
  BOOL v3 = [(FBKDraftModelSnapshotDiff *)v2 descriptionString];
  sub_22A4B3458();

  unsigned int v4 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

@end