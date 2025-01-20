@interface DBGSnapshotPropertyGroup
- (DBGSnapshot)snapshot;
- (void)setSnapshot:(id)a3;
@end

@implementation DBGSnapshotPropertyGroup

- (DBGSnapshot)snapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshot);

  return (DBGSnapshot *)WeakRetained;
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end