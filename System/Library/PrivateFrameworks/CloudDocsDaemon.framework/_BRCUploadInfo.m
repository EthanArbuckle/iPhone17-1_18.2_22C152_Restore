@interface _BRCUploadInfo
- (BOOL)allUploadsPendingQuota;
- (NSMutableSet)outOfQuotaObjIDs;
- (_BRCUploadInfo)init;
- (id)description;
- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4;
- (void)updateLocalizedDescriptionWithOptions:(char)a3;
@end

@implementation _BRCUploadInfo

- (BOOL)allUploadsPendingQuota
{
  v3 = [(_BRCUploadInfo *)self outOfQuotaObjIDs];
  if ([v3 count])
  {
    v4 = [(_BRCUploadInfo *)self outOfQuotaObjIDs];
    uint64_t v5 = [v4 count];
    v6 = [(_BRCTransferInfo *)self versionSizes];
    BOOL v7 = v5 == [v6 count];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (_BRCUploadInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BRCUploadInfo;
  v2 = [(_BRCTransferInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(_BRCTransferInfo *)v2 progress];
    [v4 setUserInfoObject:*MEMORY[0x1E4F28880] forKey:*MEMORY[0x1E4F28868]];

    uint64_t v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    outOfQuotaObjIDs = v3->_outOfQuotaObjIDs;
    v3->_outOfQuotaObjIDs = v5;
  }
  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)_BRCUploadInfo;
  v3 = [(_BRCTransferInfo *)&v8 description];
  if ([v3 hasSuffix:@">"])
  {
    v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    uint64_t v5 = [(_BRCUploadInfo *)self outOfQuotaObjIDs];
    uint64_t v6 = objc_msgSend(v4, "stringByAppendingFormat:", @" ooq:%lu>", objc_msgSend(v5, "count"));

    v3 = (void *)v6;
  }
  return v3;
}

- (void)updateLocalizedDescriptionWithOptions:(char)a3
{
  uint64_t v5 = @"GLOBAL_PROGRESS_UPLOADS_WAITING_DESCRIPTION";
  if ((a3 & 4) == 0) {
    uint64_t v5 = @"GLOBAL_PROGRESS_UPLOADING_CAPITALIZE_DESCRIPTION";
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  BOOL v7 = v5;
  objc_super v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = [(_BRCTransferInfo *)self progress];
  v10 = [v9 userInfo];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28888]];
  uint64_t v19 = [v11 unsignedLongValue];
  v12 = _BRLocalizedStringWithFormat();

  v13 = [(_BRCTransferInfo *)self progress];
  [v13 setLocalizedDescription:v12];

  if ((a3 & 2) != 0)
  {
    v14 = [(_BRCTransferInfo *)self progress];
    [v14 totalUnitCount];

    v15 = [(_BRCTransferInfo *)self progress];
    [v15 completedUnitCount];

    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v17 = BRLocalizedFileSizeDescription();
    BRLocalizedFileSizeDescription();
    v21 = v20 = v17;
    _BRLocalizedStringWithFormat();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = &stru_1F2AC7720;
  }
  v18 = [(_BRCTransferInfo *)self progress];
  [v18 setLocalizedAdditionalDescription:v22];
}

- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4
{
  uint64_t v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)_BRCUploadInfo;
  id v6 = a3;
  [(_BRCTransferInfo *)&v9 copyProgressInfoToProgress:v6 options:v4];
  BOOL v7 = [(BRCProgress *)self->super._progress localizedDescription];
  [v6 setLocalizedDescription:v7];

  objc_super v8 = [(BRCProgress *)self->super._progress localizedAdditionalDescription];
  [v6 setLocalizedAdditionalDescription:v8];
}

- (NSMutableSet)outOfQuotaObjIDs
{
  return self->_outOfQuotaObjIDs;
}

- (void).cxx_destruct
{
}

@end