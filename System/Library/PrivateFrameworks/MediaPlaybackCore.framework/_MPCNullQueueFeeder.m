@interface _MPCNullQueueFeeder
- (BOOL)containsLiveStream;
- (BOOL)containsTransportableContentWithReason:(id *)a3;
- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4;
- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4;
- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4;
- (_MPCNullQueueFeeder)init;
- (id)accountIDForItem:(id)a3 inSection:(id)a4;
- (id)identifiersForItem:(id)a3 inSection:(id)a4;
- (id)itemForItem:(id)a3 inSection:(id)a4;
- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4;
- (id)uniqueIdentifier;
- (void)loadPlaybackContext:(id)a3 completion:(id)a4;
- (void)reloadSection:(id)a3 completion:(id)a4;
@end

@implementation _MPCNullQueueFeeder

- (void).cxx_destruct
{
}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)section:(id)a3 supportsShuffleType:(int64_t)a4
{
  return 1;
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  v7 = (void (**)(id, void))a4;
  id v8 = a3;
  v9 = [v8 sectionIdentifier];
  uniqueIdentifier = self->_uniqueIdentifier;
  self->_uniqueIdentifier = v9;

  v11 = [v8 itemIdentifiers];
  v12 = objc_msgSend(MEMORY[0x263F11D58], "changeDetailsWithPreviousCount:finalCount:isEqualBlock:isUpdatedBlock:", objc_msgSend(v11, "count"), 0, &__block_literal_global_28999, &__block_literal_global_45_29000);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_3;
  v15[3] = &unk_2643C51C0;
  v17 = self;
  SEL v18 = a2;
  id v16 = v12;
  id v13 = v12;
  [(_MPCNullQueueFeeder *)self identifierRegistryWithExclusiveAccess:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48___MPCNullQueueFeeder_reloadSection_completion___block_invoke_5;
  v14[3] = &unk_2643C51E8;
  v14[4] = self;
  v14[5] = a2;
  [v8 applyChanges:v13 itemLookupBlock:v14];

  v7[2](v7, 0);
}

- (id)itemForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)identifiersForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (id)modelPlayEventForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (void)loadPlaybackContext:(id)a3 completion:(id)a4
{
}

- (id)accountIDForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (BOOL)isExportableMediaTypeForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (BOOL)supportsAutoPlayForItem:(id)a3 inSection:(id)a4
{
  return 0;
}

- (BOOL)containsTransportableContentWithReason:(id *)a3
{
  return 1;
}

- (BOOL)containsLiveStream
{
  return 0;
}

- (_MPCNullQueueFeeder)init
{
  v7.receiver = self;
  v7.super_class = (Class)_MPCNullQueueFeeder;
  v2 = [(_MPCNullQueueFeeder *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    uniqueIdentifier = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v4;
  }
  return v2;
}

@end