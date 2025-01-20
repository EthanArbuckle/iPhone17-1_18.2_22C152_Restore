@interface GEOSessionUserActionMetadata
- (GEOPDSSessionUserActionMetadata)sessionUserActionMetadata;
- (GEOSessionUserActionMetadata)init;
- (void)captureSearchAction:(int)a3 searchTarget:(int)a4 maxCountToMaintain:(unint64_t)a5;
@end

@implementation GEOSessionUserActionMetadata

- (GEOSessionUserActionMetadata)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOSessionUserActionMetadata;
  v2 = [(GEOSessionUserActionMetadata *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEOPDSSessionUserActionMetadata);
    actionMetadata = v2->_actionMetadata;
    v2->_actionMetadata = v3;

    v5 = +[GEOUserSession sharedInstance];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__GEOSessionUserActionMetadata_init__block_invoke;
    v7[3] = &unk_1E53DC588;
    v8 = v2;
    [v5 shortSessionValues:v7];
  }
  return v2;
}

uint64_t __36__GEOSessionUserActionMetadata_init__block_invoke(uint64_t result, double a2, double a3)
{
  *(double *)(*(void *)(result + 32) + 16) = a3;
  return result;
}

- (GEOPDSSessionUserActionMetadata)sessionUserActionMetadata
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v3 = +[GEOUserSession sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__GEOSessionUserActionMetadata_sessionUserActionMetadata__block_invoke;
  v8[3] = &unk_1E53DC5B0;
  v8[4] = self;
  v8[5] = &v9;
  [v3 shortSessionValues:v8];

  actionMetadata = self->_actionMetadata;
  if (*((unsigned char *)v10 + 24))
  {
    v5 = actionMetadata;
  }
  else
  {
    v6 = [(GEOPDSSessionUserActionMetadata *)actionMetadata userActionMetadataElements];
    [v6 removeAllObjects];

    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __57__GEOSessionUserActionMetadata_sessionUserActionMetadata__block_invoke(uint64_t result, double a2, double a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(*(void *)(result + 32) + 16) == a3;
  return result;
}

- (void)captureSearchAction:(int)a3 searchTarget:(int)a4 maxCountToMaintain:(unint64_t)a5
{
  uint64_t v9 = objc_alloc_init(GEOPDSUserActionMetadataElement);
  if (v9)
  {
    *(unsigned char *)&v9->_flags |= 1u;
    v9->_uiAction = a3;
    *(unsigned char *)&v9->_flags |= 2u;
    v9->_uiTarget = a4;
  }
  uint64_t v11 = v9;
  if ([(GEOPDSSessionUserActionMetadata *)self->_actionMetadata userActionMetadataElementsCount] == a5)
  {
    v10 = [(GEOPDSSessionUserActionMetadata *)self->_actionMetadata userActionMetadataElements];
    [v10 removeObjectAtIndex:0];
  }
  [(GEOPDSSessionUserActionMetadata *)self->_actionMetadata addUserActionMetadataElement:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUserActionMetadata, 0);

  objc_storeStrong((id *)&self->_actionMetadata, 0);
}

@end