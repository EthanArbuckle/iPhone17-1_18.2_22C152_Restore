@interface IMAttachment
- (BOOL)isSticker;
- (BOOL)isTransferComplete;
- (IMAttachment)initWithPath:(id)a3 guid:(id)a4;
- (IMAttachment)initWithPath:(id)a3 guid:(id)a4 createdDate:(id)a5 isSticker:(BOOL)a6 isTransferComplete:(BOOL)a7;
- (NSDate)createdDate;
- (NSString)guid;
- (NSString)path;
- (id)description;
- (id)fileTransfer;
- (void)setCreatedDate:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsSticker:(BOOL)a3;
- (void)setIsTransferComplete:(BOOL)a3;
- (void)setPath:(id)a3;
@end

@implementation IMAttachment

- (IMAttachment)initWithPath:(id)a3 guid:(id)a4
{
  return (IMAttachment *)objc_msgSend_initWithPath_guid_createdDate_isSticker_isTransferComplete_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, 0, 1);
}

- (IMAttachment)initWithPath:(id)a3 guid:(id)a4 createdDate:(id)a5 isSticker:(BOOL)a6 isTransferComplete:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMAttachment;
  v18 = [(IMAttachment *)&v27 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v12, v15, v16, v17);
    path = v18->_path;
    v18->_path = (NSString *)v19;

    uint64_t v24 = objc_msgSend_copy(v13, v21, v22, v23);
    guid = v18->_guid;
    v18->_guid = (NSString *)v24;

    v18->_isSticker = a6;
    objc_storeStrong((id *)&v18->_createdDate, a5);
    v18->_isTransferComplete = a7;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)IMAttachment;
  v4 = [(IMAttachment *)&v18 description];
  guid = self->_guid;
  v9 = objc_msgSend_path(self, v6, v7, v8);
  id v13 = objc_msgSend_fileTransfer(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v3, v14, @"%@ - guid: %@ path: %@ fileTransfer: %@, createdDate = %@, isSticker = %d", v15, v4, guid, v9, v13, self->_createdDate, self->_isSticker);

  return v16;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)path
{
  path = self->_path;
  if (path)
  {
    v5 = path;
  }
  else
  {
    v6 = objc_msgSend_fileTransfer(self, a2, v2, v3);
    objc_msgSend_localPath(v6, v7, v8, v9);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)isTransferComplete
{
  return self->_isTransferComplete;
}

- (id)fileTransfer
{
  v5 = objc_msgSend_sharedInstance(IMFileTransferCenter, a2, v2, v3);
  uint64_t v8 = objc_msgSend_transferForGUID_(v5, v6, (uint64_t)self->_guid, v7);

  return v8;
}

- (void)setGuid:(id)a3
{
}

- (void)setPath:(id)a3
{
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (void)setIsTransferComplete:(BOOL)a3
{
  self->_isTransferComplete = a3;
}

- (void)setCreatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end