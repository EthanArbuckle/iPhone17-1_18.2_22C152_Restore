@interface IMDAttachmentRecord
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)keyPathsToColumns;
- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3;
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isCommSafetySensitive;
- (BOOL)isHidden;
- (IMDAttachmentRecord)init;
- (IMDAttachmentRecord)initWithRecordRef:(_IMDAttachmentRecordStruct *)a3;
- (IMDMessageRecord)messageRecord;
- (NSData)cloudServerChangeToken;
- (NSDictionary)attributionInfo;
- (NSDictionary)stickerUserInfo;
- (NSDictionary)transferUserInfo;
- (NSString)cloudRecordID;
- (NSString)emojiImageContentIdentifier;
- (NSString)emojiImageShortDescription;
- (NSString)path;
- (NSString)utiString;
- (_IMDAttachmentRecordStruct)cfAttachmentRecord;
- (__CFArray)_localCache;
- (int)_propertyIDForProperty:(int64_t)a3;
- (int64_t)cloudSyncState;
- (int64_t)previewGenerationState;
- (int64_t)rowID;
- (void)_fetchUpdatedRecord;
- (void)_write;
- (void)_writeIfNeededForPreviewGenerationStateMigration;
@end

@implementation IMDAttachmentRecord

- (IMDAttachmentRecord)initWithRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  v4 = a3;

  return (IMDAttachmentRecord *)v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  IMDAttachmentRecordGetTypeID();
  return (id)_CFRuntimeCreateInstance();
}

- (_IMDAttachmentRecordStruct)cfAttachmentRecord
{
  CFTypeID v3 = CFGetTypeID(self);
  if (v3 == IMDAttachmentRecordGetTypeID()) {
    return (_IMDAttachmentRecordStruct *)self;
  }
  else {
    return 0;
  }
}

- (void)_fetchUpdatedRecord
{
  uint64_t v2 = [(IMDAttachmentRecord *)self rowID];
  return (void *)IMDAttachmentRecordCopyAttachmentRecordUnlocked(v2);
}

- (__CFArray)_localCache
{
  return (__CFArray *)[(IMDAttachmentRecord *)self cfAttachmentRecord][24];
}

- ($D74441D9C91B16CDC5819CDB031DB0B5)_propertyDescriptorForProperty:(SEL)a3
{
  v4 = &(&off_1E5F99BE0)[5 * a4];
  long long v5 = *((_OWORD *)v4 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v4;
  *(_OWORD *)&retstr->var2 = v5;
  retstr->var4 = v4[4];
  return self;
}

- (int)_propertyIDForProperty:(int64_t)a3
{
  return sub_1AFBE7C4C(a3);
}

- (int64_t)rowID
{
  return (uint64_t)[(IMDAttachmentRecord *)self cfAttachmentRecord][16];
}

- (NSString)path
{
  uint64_t v2 = [(IMDAttachmentRecord *)self filename];
  CFTypeID v3 = [v2 stringByExpandingTildeInPath];
  v4 = objc_msgSend(v3, "__im_apfsCompatibleFilename");

  return (NSString *)v4;
}

- (NSString)utiString
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 4);
  return (NSString *)v2;
}

- (BOOL)isHidden
{
  return MEMORY[0x1F4181798](self, sel_hideAttachment);
}

- (BOOL)isCommSafetySensitive
{
  return IMDBridgedRecordGetPropertyBool(self, 19);
}

- (BOOL)isAdaptiveImageGlyph
{
  uint64_t v2 = [(IMDAttachmentRecord *)self emojiImageContentIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)emojiImageContentIdentifier
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 20);
  return (NSString *)v2;
}

- (NSString)emojiImageShortDescription
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 21);
  return (NSString *)v2;
}

- (NSDictionary)transferUserInfo
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 8);
  if ([v2 length])
  {
    BOOL v3 = JWDecodeDictionary();
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)stickerUserInfo
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 12);
  if ([v2 length])
  {
    BOOL v3 = JWDecodeDictionary();
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)attributionInfo
{
  uint64_t v2 = (void *)IMDBridgedRecordCopyPropertyValue(self, 13);
  if ([v2 length])
  {
    BOOL v3 = JWDecodeDictionary();
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (int64_t)cloudSyncState
{
  return MEMORY[0x1F4181798](self, sel_ckSyncState);
}

- (NSData)cloudServerChangeToken
{
  return (NSData *)MEMORY[0x1F4181798](self, sel_ckServerChangeTokenBlob);
}

- (NSString)cloudRecordID
{
  return (NSString *)MEMORY[0x1F4181798](self, sel_ckRecordID);
}

- (int64_t)previewGenerationState
{
  return IMDBridgedRecordGetPropertyInteger(self, 22);
}

- (IMDMessageRecord)messageRecord
{
  uint64_t v2 = [(IMDAttachmentRecord *)self guid];
  BOOL v3 = (void *)IMDAttachmentRecordCopyMessageForAttachmentGUID(v2);

  return (IMDMessageRecord *)v3;
}

- (void)_write
{
  v28 = [(IMDAttachmentRecord *)self guid];
  v27 = [(IMDAttachmentRecord *)self createdDate];
  [v27 timeIntervalSinceReferenceDate];
  uint64_t v25 = (uint64_t)v3;
  v26 = [(IMDAttachmentRecord *)self startDate];
  [v26 timeIntervalSinceReferenceDate];
  uint64_t v24 = (uint64_t)v4;
  v23 = [(IMDAttachmentRecord *)self transferName];
  v22 = [(IMDAttachmentRecord *)self filename];
  v21 = [(IMDAttachmentRecord *)self utiString];
  v20 = [(IMDAttachmentRecord *)self mimeType];
  uint64_t v19 = [(IMDAttachmentRecord *)self transferState];
  char v18 = [(IMDAttachmentRecord *)self isOutgoing];
  int64_t v17 = [(IMDAttachmentRecord *)self totalBytes];
  v16 = [(IMDAttachmentRecord *)self transferUserInfo];
  char v15 = [(IMDAttachmentRecord *)self isSticker];
  v13 = [(IMDAttachmentRecord *)self stickerUserInfo];
  long long v5 = [(IMDAttachmentRecord *)self attributionInfo];
  char v14 = [(IMDAttachmentRecord *)self isHidden];
  uint64_t v6 = [(IMDAttachmentRecord *)self cloudSyncState];
  v12 = [(IMDAttachmentRecord *)self cloudServerChangeToken];
  v7 = [(IMDAttachmentRecord *)self cloudRecordID];
  v8 = [(IMDAttachmentRecord *)self originalGUID];
  int64_t v9 = [(IMDAttachmentRecord *)self isCommSafetySensitive];
  v10 = [(IMDAttachmentRecord *)self emojiImageContentIdentifier];
  v11 = [(IMDAttachmentRecord *)self emojiImageShortDescription];
  IMDAttachmentRecordBulkUpdate((uint64_t)self, (uint64_t)v28, v25, v24, (uint64_t)v23, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, v19, v18, v17, (uint64_t)v16, v15, (uint64_t)v13, v5, v14, v6, (uint64_t)v12, (uint64_t)v7,
    (uint64_t)v8,
    v9,
    (uint64_t)v10,
    (uint64_t)v11,
    [(IMDAttachmentRecord *)self previewGenerationState]);
}

- (void)_writeIfNeededForPreviewGenerationStateMigration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(IMDAttachmentRecord *)self previewGenerationState] == 3)
  {
    double v3 = [(IMDAttachmentRecord *)self utiString];
    int v4 = IMIsSupportedUTIType();

    if (v4)
    {
      long long v5 = [(IMDAttachmentRecord *)self attributionInfo];
      uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6D418]];

      if (v6)
      {
        if (IMOSLoggingEnabled())
        {
          v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v8 = [(IMDAttachmentRecord *)self guid];
            int v9 = 138412290;
            v10 = v8;
            _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Migrating attachment GUID %@ to new preview generation state", (uint8_t *)&v9, 0xCu);
          }
        }
        [(IMDAttachmentRecord *)self _write];
      }
    }
  }
}

- (IMDAttachmentRecord)init
{
  return 0;
}

+ (id)keyPathsToColumns
{
  if (qword_1EB5ABA48 != -1) {
    dispatch_once(&qword_1EB5ABA48, &unk_1F084CF60);
  }
  uint64_t v2 = (void *)qword_1EB5ABA28;
  return v2;
}

@end