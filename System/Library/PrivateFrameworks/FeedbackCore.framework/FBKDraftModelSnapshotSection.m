@interface FBKDraftModelSnapshotSection
- (BOOL)isEqual:(id)a3;
- (FBKDraftModelSnapshotSection)initWithType:(int64_t)a3 object:(id)a4;
- (NSObject)object;
- (id)description;
- (int64_t)type;
- (void)setObject:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation FBKDraftModelSnapshotSection

- (FBKDraftModelSnapshotSection)initWithType:(int64_t)a3 object:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKDraftModelSnapshotSection;
  v8 = [(FBKDraftModelSnapshotSection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

- (id)description
{
  int64_t v3 = [(FBKDraftModelSnapshotSection *)self type];
  if (v3 == 1)
  {
    v4 = [(FBKDraftModelSnapshotSection *)self object];
    uint64_t v5 = [v4 displayName];
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [(FBKDraftModelSnapshotSection *)self object];
    uint64_t v5 = [v4 title];
LABEL_5:
    v6 = (__CFString *)v5;

    goto LABEL_7;
  }
  v6 = @"Unknown object for DraftModelSnapshotSection";
LABEL_7:

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(FBKDraftModelSnapshotSection *)self type];
    if (v6 == [v5 type])
    {
      int64_t v7 = [(FBKDraftModelSnapshotSection *)self type];
      if (v7 == 1)
      {
        v8 = [(FBKDraftModelSnapshotSection *)self object];
        v9 = [v8 identifier];
        objc_super v11 = [v5 object];
        v12 = [v11 identifier];
        char v13 = [v9 isEqualToString:v12];
        goto LABEL_9;
      }
      if (!v7)
      {
        v8 = [(FBKDraftModelSnapshotSection *)self object];
        v9 = [v8 ID];
        int v10 = [v9 intValue];
        objc_super v11 = [v5 object];
        v12 = [v11 ID];
        char v13 = v10 == [v12 intValue];
LABEL_9:

        goto LABEL_10;
      }
    }
    char v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  char v13 = 0;
LABEL_11:

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
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
}

@end