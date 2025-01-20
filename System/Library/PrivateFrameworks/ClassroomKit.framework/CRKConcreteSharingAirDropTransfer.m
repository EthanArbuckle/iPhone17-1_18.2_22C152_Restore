@interface CRKConcreteSharingAirDropTransfer
+ (id)UTIForURL:(id)a3;
+ (id)infoForFileURL:(id)a3;
+ (int64_t)transferStateForState:(int64_t)a3;
- (BOOL)autoAccept;
- (BOOL)hideProgress;
- (CRKConcreteSharingAirDropTransfer)initWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11;
- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasAccepted:(id)a3;
- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3;
- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4;
- (NSArray)destFileURLs;
- (NSData)previewImageData;
- (NSSet)fileURLs;
- (NSString)bundleID;
- (NSString)description;
- (NSString)identifier;
- (NSString)itemsDescription;
- (NSString)senderName;
- (NSString)sourceBundleID;
- (SFAirDropClassroomTransferManager)manager;
- (id)resultHandler;
- (id)transferInfoDictionary;
- (void)dealloc;
- (void)invalidate;
- (void)propagateResultForIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (void)setDestFileURLs:(id)a3;
- (void)updateWithState:(int64_t)a3 completion:(id)a4;
@end

@implementation CRKConcreteSharingAirDropTransfer

- (void)dealloc
{
  v3 = [(CRKConcreteSharingAirDropTransfer *)self manager];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRKConcreteSharingAirDropTransfer;
  [(CRKConcreteSharingAirDropTransfer *)&v4 dealloc];
}

- (CRKConcreteSharingAirDropTransfer)initWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11
{
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v47.receiver = self;
  v47.super_class = (Class)CRKConcreteSharingAirDropTransfer;
  v24 = [(CRKConcreteSharingAirDropTransfer *)&v47 init];
  v25 = v24;
  if (v24)
  {
    v24->_autoAccept = a3;
    v24->_hideProgress = a4;
    uint64_t v26 = [v17 copy];
    senderName = v25->_senderName;
    v25->_senderName = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    previewImageData = v25->_previewImageData;
    v25->_previewImageData = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    bundleID = v25->_bundleID;
    v25->_bundleID = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    sourceBundleID = v25->_sourceBundleID;
    v25->_sourceBundleID = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    itemsDescription = v25->_itemsDescription;
    v25->_itemsDescription = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    fileURLs = v25->_fileURLs;
    v25->_fileURLs = (NSSet *)v36;

    uint64_t v38 = MEMORY[0x22A620AF0](v23);
    id resultHandler = v25->_resultHandler;
    v25->_id resultHandler = (id)v38;

    uint64_t v40 = objc_opt_new();
    manager = v25->_manager;
    v25->_manager = (SFAirDropClassroomTransferManager *)v40;

    [(SFAirDropClassroomTransferManager *)v25->_manager setDelegate:v25];
    [(SFAirDropClassroomTransferManager *)v25->_manager activate];
    destFileURLs = v25->_destFileURLs;
    v25->_destFileURLs = (NSArray *)MEMORY[0x263EFFA68];

    v43 = [MEMORY[0x263F08C38] UUID];
    uint64_t v44 = [v43 UUIDString];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v44;
  }
  return v25;
}

- (void)invalidate
{
  id v2 = [(CRKConcreteSharingAirDropTransfer *)self manager];
  [v2 invalidate];
}

- (void)updateWithState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v10 = [(CRKConcreteSharingAirDropTransfer *)self manager];
  v7 = [(CRKConcreteSharingAirDropTransfer *)self identifier];
  uint64_t v8 = [(id)objc_opt_class() transferStateForState:a3];
  v9 = [(CRKConcreteSharingAirDropTransfer *)self transferInfoDictionary];
  [v10 updateTransferWithIdentifier:v7 withState:v8 information:v9 completionHandler:v6];
}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasAccepted:(id)a3
{
  return (CRKConcreteSharingAirDropTransfer *)[(CRKConcreteSharingAirDropTransfer *)self propagateResultForIdentifier:a3 withSuccess:1 error:0];
}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3 withFailureReason:(unint64_t)a4
{
  if (a4 == 2) {
    uint64_t v5 = 115;
  }
  else {
    uint64_t v5 = 18;
  }
  id v6 = a3;
  CRKErrorWithCodeAndUserInfo(v5, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(CRKConcreteSharingAirDropTransfer *)self propagateResultForIdentifier:v6 withSuccess:0 error:v8];

  return result;
}

- (CRKConcreteSharingAirDropTransfer)transferWithIdentifierWasDeclined:(id)a3
{
  id v4 = a3;
  CRKErrorWithCodeAndUserInfo(1, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CRKConcreteSharingAirDropTransfer *)self propagateResultForIdentifier:v4 withSuccess:0 error:v6];

  return result;
}

- (NSString)description
{
  id v2 = [(CRKConcreteSharingAirDropTransfer *)self transferInfoDictionary];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = *MEMORY[0x263F6C3D8];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F6C3D8]];
  id v6 = v5;
  if (v5)
  {
    v7 = NSString;
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "length"));
    v9 = [v7 stringWithFormat:@"<Data with length %@>", v8];
    [v3 setObject:v9 forKeyedSubscript:v4];
  }
  id v10 = [v3 description];

  return (NSString *)v10;
}

- (void)propagateResultForIdentifier:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  v9 = [(CRKConcreteSharingAirDropTransfer *)self identifier];
  if ([v11 isEqualToString:v9])
  {
    id v10 = [(CRKConcreteSharingAirDropTransfer *)self resultHandler];

    if (!v10) {
      goto LABEL_5;
    }
    v9 = [(CRKConcreteSharingAirDropTransfer *)self resultHandler];
    ((void (**)(void, id, BOOL, id))v9)[2](v9, v11, v6, v8);
  }

LABEL_5:
}

+ (int64_t)transferStateForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 4) {
    return 1;
  }
  else {
    return a3;
  }
}

- (id)transferInfoDictionary
{
  v3 = objc_opt_new();
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKConcreteSharingAirDropTransfer autoAccept](self, "autoAccept"));
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F6C398]];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKConcreteSharingAirDropTransfer hideProgress](self, "hideProgress"));
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x263F6C3F8]];

  BOOL v6 = [(CRKConcreteSharingAirDropTransfer *)self senderName];

  if (v6)
  {
    v7 = [(CRKConcreteSharingAirDropTransfer *)self senderName];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F6C440]];
  }
  id v8 = [(CRKConcreteSharingAirDropTransfer *)self bundleID];

  v9 = (void *)MEMORY[0x263F6C3A0];
  if (v8)
  {
    id v10 = [(CRKConcreteSharingAirDropTransfer *)self bundleID];
    [v3 setObject:v10 forKeyedSubscript:*v9];
  }
  id v11 = [(CRKConcreteSharingAirDropTransfer *)self destFileURLs];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [(CRKConcreteSharingAirDropTransfer *)self destFileURLs];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x263F6C408]];
  }
  v15 = [(CRKConcreteSharingAirDropTransfer *)self fileURLs];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    id v17 = [(CRKConcreteSharingAirDropTransfer *)self fileURLs];
    id v18 = [v17 allObjects];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __59__CRKConcreteSharingAirDropTransfer_transferInfoDictionary__block_invoke;
    v28[3] = &unk_2646F5418;
    v28[4] = self;
    id v19 = objc_msgSend(v18, "crk_mapUsingBlock:", v28);
    [v3 setObject:v19 forKeyedSubscript:*MEMORY[0x263F6C3F0]];
  }
  id v20 = [(CRKConcreteSharingAirDropTransfer *)self previewImageData];

  if (v20)
  {
    id v21 = [(CRKConcreteSharingAirDropTransfer *)self previewImageData];
    [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x263F6C3D8]];
  }
  id v22 = [(CRKConcreteSharingAirDropTransfer *)self sourceBundleID];

  if (v22)
  {
    id v23 = [(CRKConcreteSharingAirDropTransfer *)self sourceBundleID];
    [v3 setObject:v23 forKeyedSubscript:*v9];
  }
  v24 = [(CRKConcreteSharingAirDropTransfer *)self itemsDescription];

  if (v24)
  {
    v25 = [(CRKConcreteSharingAirDropTransfer *)self itemsDescription];
    [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x263F6C400]];
  }
  uint64_t v26 = (void *)[v3 copy];

  return v26;
}

id __59__CRKConcreteSharingAirDropTransfer_transferInfoDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(id)objc_opt_class() infoForFileURL:v2];

  return v3;
}

+ (id)infoForFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  BOOL v6 = [v4 lastPathComponent];
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F6C3E0]];
  }
  v7 = [a1 UTIForURL:v4];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F6C3E8]];
  }
  if ([v5 count]) {
    id v8 = (void *)[v5 copy];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)UTIForURL:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v15[0] = *MEMORY[0x263EFF608];
  uint64_t v4 = v15[0];
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  BOOL v6 = [v3 resourceValuesForKeys:v5 error:0];
  v7 = [v6 objectForKey:v4];

  if (v7)
  {
    id v8 = [v7 identifier];
  }
  else
  {
    uint64_t v9 = [v3 pathExtension];
    id v10 = (void *)v9;
    id v11 = &stru_26D7E7B00;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    uint64_t v12 = v11;

    v13 = [MEMORY[0x263F1D920] typeWithFilenameExtension:v12];

    id v8 = [v13 identifier];
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)fileURLs
{
  return self->_fileURLs;
}

- (NSArray)destFileURLs
{
  return self->_destFileURLs;
}

- (void)setDestFileURLs:(id)a3
{
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (BOOL)hideProgress
{
  return self->_hideProgress;
}

- (NSString)senderName
{
  return self->_senderName;
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)itemsDescription
{
  return self->_itemsDescription;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (SFAirDropClassroomTransferManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_itemsDescription, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_destFileURLs, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end