@interface MSPContainerPersister
- (MSPContainerPersisterDelegate)delegate;
- (int64_t)duplicatesPolicy;
- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5;
- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6;
- (void)eraseWithCompletion:(id)a3;
- (void)fetchStateSnapshotWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSPContainerPersister

- (void)fetchStateSnapshotWithCompletion:(id)a3
{
}

- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6
{
}

- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5
{
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = a5;
    id v8 = [v6 errorWithDomain:@"com.apple.MapsSupport.MSPContainer" code:6 userInfo:0];
    (*((void (**)(id, void, void, id))a5 + 2))(v7, 0, 0, v8);
  }
}

- (void)eraseWithCompletion:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F281F8];
    id v6 = a3;
    id v7 = [v4 errorWithDomain:v5 code:3072 userInfo:0];
    (*((void (**)(id, id))a3 + 2))(v6, v7);
  }
}

- (MSPContainerPersisterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPContainerPersisterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)duplicatesPolicy
{
  return self->_duplicatesPolicy;
}

- (void).cxx_destruct
{
}

@end