@interface PFCloudKitMetadataMigrationContext
- (PFCloudKitMetadataMigrationContext)init;
- (void)addConstrainedEntityToPreflight:(id)a3;
- (void)dealloc;
@end

@implementation PFCloudKitMetadataMigrationContext

- (PFCloudKitMetadataMigrationContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitMetadataMigrationContext;
  v2 = [(PFCloudKitMetadataMigrationContext *)&v4 init];
  if (v2)
  {
    v2->_migrationStatements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_sqlEntitiesToCreate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(_WORD *)&v2->_hasWorkToDo = 0;
    v2->_constrainedEntitiesToPreflight = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v2;
}

- (void)dealloc
{
  self->_migrationStatements = 0;
  self->_sqlEntitiesToCreate = 0;

  self->_currentModel = 0;
  self->_sqlModel = 0;

  self->_storeMetadataModel = 0;
  self->_storeSQLModel = 0;

  self->_storeMetadataVersionHashes = 0;
  self->_storeMetadataVersion = 0;

  self->_storeMetadataVersionHashes = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitMetadataMigrationContext;
  [(PFCloudKitMetadataMigrationContext *)&v3 dealloc];
}

- (void)addConstrainedEntityToPreflight:(id)a3
{
}

@end