@interface FBKDraftModelSnapshotRow
- (FBKDraftModelSnapshotRow)initWithSection:(id)a3 object:(id)a4;
- (FBKDraftModelSnapshotSection)section;
- (NSObject)object;
- (id)description;
- (void)setObject:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation FBKDraftModelSnapshotRow

- (FBKDraftModelSnapshotRow)initWithSection:(id)a3 object:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FBKDraftModelSnapshotRow;
  v9 = [(FBKDraftModelSnapshotRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_section, a3);
    objc_storeStrong((id *)&v10->_object, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [(FBKDraftModelSnapshotRow *)self section];
  uint64_t v4 = [v3 type];

  if (v4 == 1)
  {
    v5 = [(FBKDraftModelSnapshotRow *)self object];
    uint64_t v6 = [v5 displayName];
    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = [(FBKDraftModelSnapshotRow *)self object];
    uint64_t v6 = [v5 role];
LABEL_5:
    id v7 = (__CFString *)v6;

    goto LABEL_7;
  }
  id v7 = @"Unknown object for DraftModelSnapshotRow";
LABEL_7:

  return v7;
}

- (FBKDraftModelSnapshotSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);

  objc_storeStrong((id *)&self->_section, 0);
}

@end