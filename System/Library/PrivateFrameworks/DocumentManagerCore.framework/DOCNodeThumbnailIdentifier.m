@interface DOCNodeThumbnailIdentifier
- (BOOL)isActionable;
- (BOOL)isDownloaded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTopLevelSharedItem;
- (NSDate)modificationDate;
- (NSString)fileExtension;
- (id)contentVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nodeIdentifier;
- (unint64_t)folderType;
- (unint64_t)hash;
- (void)setContentVersion:(id)a3;
- (void)setFileExtension:(id)a3;
- (void)setFolderType:(unint64_t)a3;
- (void)setIsActionable:(BOOL)a3;
- (void)setIsDownloaded:(BOOL)a3;
- (void)setIsTopLevelSharedItem:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setNodeIdentifier:(id)a3;
@end

@implementation DOCNodeThumbnailIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong(&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong(&self->_nodeIdentifier, 0);
}

- (unint64_t)hash
{
  v3 = [(DOCNodeThumbnailIdentifier *)self nodeIdentifier];
  uint64_t v4 = [v3 hash];

  v5 = [(DOCNodeThumbnailIdentifier *)self modificationDate];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  v7 = [(DOCNodeThumbnailIdentifier *)self contentVersion];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  unint64_t v9 = [(DOCNodeThumbnailIdentifier *)self folderType] - v8 + 32 * v8;
  if ([(DOCNodeThumbnailIdentifier *)self isTopLevelSharedItem]) {
    uint64_t v10 = 37;
  }
  else {
    uint64_t v10 = 41;
  }
  uint64_t v11 = v10 - v9 + 32 * v9;
  if ([(DOCNodeThumbnailIdentifier *)self isDownloaded]) {
    uint64_t v12 = 37;
  }
  else {
    uint64_t v12 = 41;
  }
  uint64_t v13 = v12 - v11 + 32 * v11;
  v14 = [(DOCNodeThumbnailIdentifier *)self fileExtension];
  uint64_t v15 = [v14 hash] - v13 + 32 * v13;

  if ([(DOCNodeThumbnailIdentifier *)self isActionable]) {
    uint64_t v16 = 37;
  }
  else {
    uint64_t v16 = 41;
  }
  return v16 - v15 + 32 * v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (DOCNodeThumbnailIdentifier *)a3;
  if (v5 == self)
  {
    LOBYTE(v7) = 1;
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    uint64_t v8 = [(DOCNodeThumbnailIdentifier *)self nodeIdentifier];
    unint64_t v9 = [(DOCNodeThumbnailIdentifier *)v5 nodeIdentifier];
    if (v8 != v9)
    {
      uint64_t v10 = [(DOCNodeThumbnailIdentifier *)self nodeIdentifier];
      v3 = [(DOCNodeThumbnailIdentifier *)v5 nodeIdentifier];
      if (![v10 isEqual:v3])
      {
        LOBYTE(v7) = 0;
        goto LABEL_27;
      }
      v32 = v10;
    }
    uint64_t v11 = [(DOCNodeThumbnailIdentifier *)self modificationDate];
    uint64_t v12 = [(DOCNodeThumbnailIdentifier *)v5 modificationDate];
    if (v11 != v12)
    {
      uint64_t v13 = [(DOCNodeThumbnailIdentifier *)self modificationDate];
      v14 = [(DOCNodeThumbnailIdentifier *)v5 modificationDate];
      if (![v13 isEqual:v14])
      {
        LOBYTE(v7) = 0;
LABEL_25:

LABEL_26:
        uint64_t v10 = v32;
        if (v8 == v9)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:

        goto LABEL_28;
      }
      v30 = v14;
      v31 = v13;
    }
    uint64_t v15 = [(DOCNodeThumbnailIdentifier *)self contentVersion];
    uint64_t v16 = [(DOCNodeThumbnailIdentifier *)v5 contentVersion];
    if (v15 != v16)
    {
      v17 = [(DOCNodeThumbnailIdentifier *)self contentVersion];
      v29 = [(DOCNodeThumbnailIdentifier *)v5 contentVersion];
      if (!objc_msgSend(v17, "isEqual:"))
      {
        LOBYTE(v7) = 0;
        goto LABEL_23;
      }
      v28 = v17;
    }
    unint64_t v18 = [(DOCNodeThumbnailIdentifier *)self folderType];
    if (v18 != [(DOCNodeThumbnailIdentifier *)v5 folderType]
      || (BOOL v19 = [(DOCNodeThumbnailIdentifier *)self isTopLevelSharedItem],
          v19 != [(DOCNodeThumbnailIdentifier *)v5 isTopLevelSharedItem])
      || (BOOL v20 = [(DOCNodeThumbnailIdentifier *)self isDownloaded],
          v20 != [(DOCNodeThumbnailIdentifier *)v5 isDownloaded]))
    {
      LOBYTE(v7) = 0;
      goto LABEL_20;
    }
    v27 = [(DOCNodeThumbnailIdentifier *)self fileExtension];
    v26 = [(DOCNodeThumbnailIdentifier *)v5 fileExtension];
    if (v27 == v26
      || ([(DOCNodeThumbnailIdentifier *)self fileExtension],
          v22 = objc_claimAutoreleasedReturnValue(),
          [(DOCNodeThumbnailIdentifier *)v5 fileExtension],
          v24 = objc_claimAutoreleasedReturnValue(),
          v25 = v22,
          objc_msgSend(v22, "isEqualToString:")))
    {
      BOOL v23 = [(DOCNodeThumbnailIdentifier *)self isActionable];
      BOOL v7 = v23 ^ [(DOCNodeThumbnailIdentifier *)v5 isActionable] ^ 1;
      if (v27 == v26)
      {

LABEL_20:
        v17 = v28;
        if (v15 == v16) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
    v17 = v28;

    if (v15 == v16)
    {
LABEL_24:

      v14 = v30;
      uint64_t v13 = v31;
      if (v11 == v12) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v7) = 0;
LABEL_29:

  return v7;
}

- (id)nodeIdentifier
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setNodeIdentifier:(id)a3
{
}

- (void)setModificationDate:(id)a3
{
}

- (void)setIsTopLevelSharedItem:(BOOL)a3
{
  self->_isTopLevelSharedItem = a3;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

- (void)setIsActionable:(BOOL)a3
{
  self->_isActionable = a3;
}

- (void)setFolderType:(unint64_t)a3
{
  self->_folderType = a3;
}

- (void)setFileExtension:(id)a3
{
}

- (void)setContentVersion:(id)a3
{
}

- (NSString)fileExtension
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isTopLevelSharedItem
{
  return self->_isTopLevelSharedItem;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (BOOL)isActionable
{
  return self->_isActionable;
}

- (unint64_t)folderType
{
  return self->_folderType;
}

- (id)contentVersion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[DOCNodeThumbnailIdentifier allocWithZone:a3] init];
  v5 = [(DOCNodeThumbnailIdentifier *)self nodeIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [(DOCNodeThumbnailIdentifier *)v4 setNodeIdentifier:v6];

  BOOL v7 = [(DOCNodeThumbnailIdentifier *)self modificationDate];
  uint64_t v8 = (void *)[v7 copy];
  [(DOCNodeThumbnailIdentifier *)v4 setModificationDate:v8];

  unint64_t v9 = [(DOCNodeThumbnailIdentifier *)self contentVersion];
  uint64_t v10 = (void *)[v9 copy];
  [(DOCNodeThumbnailIdentifier *)v4 setContentVersion:v10];

  [(DOCNodeThumbnailIdentifier *)v4 setFolderType:[(DOCNodeThumbnailIdentifier *)self folderType]];
  [(DOCNodeThumbnailIdentifier *)v4 setIsTopLevelSharedItem:[(DOCNodeThumbnailIdentifier *)self isTopLevelSharedItem]];
  [(DOCNodeThumbnailIdentifier *)v4 setIsDownloaded:[(DOCNodeThumbnailIdentifier *)self isDownloaded]];
  uint64_t v11 = [(DOCNodeThumbnailIdentifier *)self fileExtension];
  uint64_t v12 = (void *)[v11 copy];
  [(DOCNodeThumbnailIdentifier *)v4 setFileExtension:v12];

  [(DOCNodeThumbnailIdentifier *)v4 setIsActionable:[(DOCNodeThumbnailIdentifier *)self isActionable]];
  return v4;
}

@end