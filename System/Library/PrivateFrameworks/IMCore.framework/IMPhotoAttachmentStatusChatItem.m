@interface IMPhotoAttachmentStatusChatItem
+ (id)_guidForItem:(id)a3;
- (BOOL)_isEqualToGuid:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6;
- (id)_initWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfPhotos;
- (unint64_t)numberOfSavedAssets;
- (unint64_t)numberOfVideos;
@end

@implementation IMPhotoAttachmentStatusChatItem

+ (id)_guidForItem:(id)a3
{
  v4 = objc_msgSend_guid(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)sub_1A4C4EEE8();

  return v5;
}

- (id)_initWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMPhotoAttachmentStatusChatItem;
  v11 = [(IMChatItem *)&v19 _initWithItem:v10];
  if (v11)
  {
    v12 = objc_opt_class();
    v15 = objc_msgSend__guidForItem_(v12, v13, (uint64_t)v10, v14);
    objc_msgSend__setGUID_(v11, v16, (uint64_t)v15, v17);
    v11[7] = a4;
    v11[8] = a5;
    v11[9] = a6;
  }
  return v11;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_guid(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);

  return v9 ^ (4 * self->_numberOfPhotos) ^ (16 * self->_numberOfVideos) ^ (self->_numberOfSavedAssets << 6);
}

- (BOOL)_isEqualToGuid:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10 = a3;
  objc_msgSend_guid(self, v11, v12, v13);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v10;
  v18 = v15;
  if (v14 == v15)
  {
  }
  else
  {
    if (!v15 || !v14)
    {

LABEL_11:
      BOOL v20 = 0;
      goto LABEL_12;
    }
    int isEqualToString = objc_msgSend_isEqualToString_(v14, v16, (uint64_t)v15, v17);

    if (!isEqualToString) {
      goto LABEL_11;
    }
  }
  if (self->_numberOfPhotos != a4 || self->_numberOfVideos != a5) {
    goto LABEL_11;
  }
  BOOL v20 = self->_numberOfSavedAssets == a6;
LABEL_12:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend_guid(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_numberOfPhotos(v4, v9, v10, v11);
    uint64_t v16 = objc_msgSend_numberOfVideos(v4, v13, v14, v15);
    uint64_t v20 = objc_msgSend_numberOfSavedAssets(v4, v17, v18, v19);
    char isEqualToGuid_numberOfPhotos_numberOfVideos_numberOfSavedAssets = objc_msgSend__isEqualToGuid_numberOfPhotos_numberOfVideos_numberOfSavedAssets_(self, v21, (uint64_t)v8, v12, v16, v20);
  }
  else
  {
    char isEqualToGuid_numberOfPhotos_numberOfVideos_numberOfSavedAssets = 0;
  }

  return isEqualToGuid_numberOfPhotos_numberOfVideos_numberOfSavedAssets;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMPhotoAttachmentStatusChatItem;
  id v4 = [(IMTranscriptChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] numberOfPhotos: %tu, numberOfVideos: %tu, numberOfSavedAssets: %tu]", v6, v4, self->_numberOfPhotos, self->_numberOfVideos, self->_numberOfSavedAssets);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend__initWithItem_numberOfPhotos_numberOfVideos_numberOfSavedAssets_(v4, v9, (uint64_t)v8, self->_numberOfPhotos, self->_numberOfVideos, self->_numberOfSavedAssets);

  return v10;
}

- (BOOL)isFromMe
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 numberOfPhotos:(unint64_t)a4 numberOfVideos:(unint64_t)a5 numberOfSavedAssets:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend__guidForItem_(v11, v12, (uint64_t)v10, v13);

  LOBYTE(a6) = objc_msgSend__isEqualToGuid_numberOfPhotos_numberOfVideos_numberOfSavedAssets_(self, v15, (uint64_t)v14, a4, a5, a6);
  return a6;
}

- (unint64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (unint64_t)numberOfVideos
{
  return self->_numberOfVideos;
}

- (unint64_t)numberOfSavedAssets
{
  return self->_numberOfSavedAssets;
}

@end