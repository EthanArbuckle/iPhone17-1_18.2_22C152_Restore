@interface IMSPIAttachment
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isOutgoing;
- (BOOL)isSticker;
- (IMSPIAttachment)initWithGuid:(id)a3 fileUrl:(id)a4 transferState:(int64_t)a5 uti:(id)a6 isSticker:(BOOL)a7 isOutgoing:(BOOL)a8 stickerUserInfo:(id)a9 attributionInfo:(id)a10 creationDate:(id)a11 adaptiveImageGlyphContentIdentifier:(id)a12 adaptiveImageGlyphContentDescription:(id)a13;
- (NSDate)creationDate;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSString)adaptiveImageGlyphContentDescription;
- (NSString)adaptiveImageGlyphContentIdentifier;
- (NSString)guid;
- (NSString)uti;
- (NSURL)fileUrl;
- (id)bundleID;
- (id)description;
- (int64_t)fileTransferState;
- (void)setAttributionInfo:(id)a3;
- (void)setFileTransferState:(int64_t)a3;
- (void)setFileUrl:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsOutgoing:(BOOL)a3;
- (void)setIsSticker:(BOOL)a3;
- (void)setUti:(id)a3;
@end

@implementation IMSPIAttachment

- (IMSPIAttachment)initWithGuid:(id)a3 fileUrl:(id)a4 transferState:(int64_t)a5 uti:(id)a6 isSticker:(BOOL)a7 isOutgoing:(BOOL)a8 stickerUserInfo:(id)a9 attributionInfo:(id)a10 creationDate:(id)a11 adaptiveImageGlyphContentIdentifier:(id)a12 adaptiveImageGlyphContentDescription:(id)a13
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v69.receiver = self;
  v69.super_class = (Class)IMSPIAttachment;
  v28 = [(IMSPIAttachment *)&v69 init];
  if (v28)
  {
    uint64_t v29 = objc_msgSend_copy(v17, v25, v26, v27);
    guid = v28->_guid;
    v28->_guid = (NSString *)v29;

    uint64_t v34 = objc_msgSend_copy(v18, v31, v32, v33);
    fileUrl = v28->_fileUrl;
    v28->_fileUrl = (NSURL *)v34;

    v28->_fileTransferState = a5;
    uint64_t v39 = objc_msgSend_copy(v19, v36, v37, v38);
    uti = v28->_uti;
    v28->_uti = (NSString *)v39;

    v28->_isSticker = a7;
    v28->_isOutgoing = a8;
    uint64_t v44 = objc_msgSend_copy(v20, v41, v42, v43);
    stickerUserInfo = v28->_stickerUserInfo;
    v28->_stickerUserInfo = (NSDictionary *)v44;

    uint64_t v49 = objc_msgSend_copy(v21, v46, v47, v48);
    attributionInfo = v28->_attributionInfo;
    v28->_attributionInfo = (NSDictionary *)v49;

    uint64_t v54 = objc_msgSend_copy(v22, v51, v52, v53);
    creationDate = v28->_creationDate;
    v28->_creationDate = (NSDate *)v54;

    uint64_t v59 = objc_msgSend_copy(v23, v56, v57, v58);
    adaptiveImageGlyphContentIdentifier = v28->_adaptiveImageGlyphContentIdentifier;
    v28->_adaptiveImageGlyphContentIdentifier = (NSString *)v59;

    uint64_t v64 = objc_msgSend_copy(v24, v61, v62, v63);
    adaptiveImageGlyphContentDescription = v28->_adaptiveImageGlyphContentDescription;
    v28->_adaptiveImageGlyphContentDescription = (NSString *)v64;
  }
  return v28;
}

- (id)bundleID
{
  return (id)objc_msgSend_objectForKey_(self->_attributionInfo, a2, *MEMORY[0x1E4F6D3E0], v2);
}

- (id)description
{
  v3 = @"YES";
  if (self->_isSticker) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (!self->_isOutgoing) {
    v3 = @"NO";
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"IMSPIAttachment: %p [guid: %@ FileUrl: %@ TransferState: %tu uti: %@ isSticker: %@ isOutgoing: %@ attributionInfo: %@ creationDate: %@]", v2, self, self->_guid, self->_fileUrl, self->_fileTransferState, self->_uti, v4, v3, self->_attributionInfo, self->_creationDate);
}

- (BOOL)isAdaptiveImageGlyph
{
  return objc_msgSend_length(self->_adaptiveImageGlyphContentIdentifier, a2, v2, v3) != 0;
}

- (NSURL)fileUrl
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileUrl:(id)a3
{
}

- (int64_t)fileTransferState
{
  return self->_fileTransferState;
}

- (void)setFileTransferState:(int64_t)a3
{
  self->_fileTransferState = a3;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGuid:(id)a3
{
}

- (NSString)uti
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUti:(id)a3
{
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (BOOL)isOutgoing
{
  return self->_isOutgoing;
}

- (void)setIsOutgoing:(BOOL)a3
{
  self->_isOutgoing = a3;
}

- (NSDictionary)stickerUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)attributionInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAttributionInfo:(id)a3
{
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)adaptiveImageGlyphContentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)adaptiveImageGlyphContentDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentDescription, 0);
  objc_storeStrong((id *)&self->_adaptiveImageGlyphContentIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_stickerUserInfo, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_guid, 0);

  objc_storeStrong((id *)&self->_fileUrl, 0);
}

@end