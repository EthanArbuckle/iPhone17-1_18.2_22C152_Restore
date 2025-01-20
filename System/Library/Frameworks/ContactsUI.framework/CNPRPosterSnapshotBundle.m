@interface CNPRPosterSnapshotBundle
- (CNPRPosterSnapshotBundle)initWithWrappedBundle:(id)a3;
- (PRPosterSnapshotBundle)wrappedSnapshotBundle;
- (id)snapshotForLevelSet:(id)a3;
@end

@implementation CNPRPosterSnapshotBundle

- (void).cxx_destruct
{
}

- (PRPosterSnapshotBundle)wrappedSnapshotBundle
{
  return self->_wrappedSnapshotBundle;
}

- (id)snapshotForLevelSet:(id)a3
{
  wrappedSnapshotBundle = self->_wrappedSnapshotBundle;
  v4 = [a3 wrappedLevelSet];
  v5 = [(PRPosterSnapshotBundle *)wrappedSnapshotBundle snapshotForLevelSet:v4];

  return v5;
}

- (CNPRPosterSnapshotBundle)initWithWrappedBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRPosterSnapshotBundle;
  v6 = [(CNPRPosterSnapshotBundle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedSnapshotBundle, a3);
  }

  return v7;
}

@end