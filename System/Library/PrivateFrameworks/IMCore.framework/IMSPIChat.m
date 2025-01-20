@interface IMSPIChat
+ (void)enumerateAllChatsWithBlock:(id)a3;
- (BOOL)isBlackholed;
- (BOOL)isGroup;
- (IMSPIChat)initWithChatRecord:(_IMDChatRecordStruct *)a3;
- (NSArray)handles;
- (NSString)chatIdentifier;
- (NSString)displayName;
- (NSString)guid;
- (NSString)serviceName;
- (id)description;
- (void)enumerateAllAttachmentsWithBlock:(id)a3;
- (void)enumerateAllMessagesWithBlock:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHandles:(id)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setServiceName:(id)a3;
@end

@implementation IMSPIChat

+ (void)enumerateAllChatsWithBlock:(id)a3
{
  v3 = (void (**)(id, void *, unsigned char *))a3;
  if (qword_1E965E998 != -1) {
    dispatch_once(&qword_1E965E998, &unk_1EF8E54D8);
  }
  CFArrayRef v4 = (const __CFArray *)off_1E965E990();
  if (v4)
  {
    CFArrayRef v5 = v4;
    unsigned __int8 v14 = 0;
    if (CFArrayGetCount(v4) >= 1)
    {
      CFIndex v6 = 0;
      do
      {
        v7 = (void *)MEMORY[0x1A6264150]();
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v6);
        v9 = [IMSPIChat alloc];
        v12 = objc_msgSend_initWithChatRecord_(v9, v10, (uint64_t)ValueAtIndex, v11);
        if (v12) {
          v3[2](v3, v12, &v14);
        }
        int v13 = v14;

        if (v13) {
          break;
        }
        ++v6;
      }
      while (v6 < CFArrayGetCount(v5));
    }
    CFRelease(v5);
  }
}

- (void)enumerateAllAttachmentsWithBlock:(id)a3
{
  v61[1] = *MEMORY[0x1E4F143B8];
  v47 = (void (**)(id, void *, unsigned char *))a3;
  v7 = objc_msgSend_chatIdentifier(self, v4, v5, v6);
  v61[0] = v7;
  v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v61, 1);

  int v13 = objc_msgSend_serviceName(self, v10, v11, v12);
  v60 = v13;
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)&v60, 1);

  if (qword_1E965E9A8 != -1) {
    dispatch_once(&qword_1E965E9A8, &unk_1EF8E3E70);
  }
  CFArrayRef v16 = (const __CFArray *)off_1E965E9A0(v9, v15);
  if (v16)
  {
    CFArrayRef v17 = v16;
    v44 = v15;
    v45 = v9;
    unsigned __int8 v59 = 0;
    if (CFArrayGetCount(v16) >= 1)
    {
      CFIndex v18 = 0;
      CFArrayRef v46 = v17;
      while (1)
      {
        v19 = (void *)MEMORY[0x1A6264150]();
        v20 = CFArrayGetValueAtIndex(v17, v18);
        v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"guid", v22);
        if (objc_msgSend_length(v23, v24, v25, v26))
        {
          uint64_t v27 = IMDAttachmentRecordCopyAttachmentForGUID();
          uint64_t v57 = 0;
          CFTypeRef v58 = 0;
          CFTypeRef v55 = 0;
          uint64_t v56 = 0;
          CFTypeRef v54 = 0;
          __int16 v53 = 0;
          CFTypeRef v52 = 0;
          v50 = v19;
          CFTypeRef cf = 0;
          v49 = v20;
          if (qword_1E965E9B8 != -1) {
            dispatch_once(&qword_1E965E9B8, &unk_1EF8E3F50);
          }
          v48 = (const void *)v27;
          off_1E965E9B0(v27, 0, &v57, 0, 0, &v58, &v55, 0, &v56, &v53, 0, 0, (char *)&v53 + 1, 0, &v54, 0, 0, 0, 0,
            0,
            0,
            &v52,
            &cf);
          v30 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v28, (uint64_t)v58, v29);
          v31 = [IMSPIAttachment alloc];
          CFTypeRef v32 = v55;
          uint64_t v33 = v56;
          BOOL v34 = HIBYTE(v53) != 0;
          BOOL v35 = (_BYTE)v53 != 0;
          CFTypeRef v36 = v54;
          v40 = objc_msgSend___im_dateWithNanosecondTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v37, v38, v39, (double)v57);
          isOutgoing_attributionInfo_creationDate_adaptiveImageGlyphContentIdentifier_adaptiveImageGlyphContentDescription = objc_msgSend_initWithGuid_fileUrl_transferState_uti_isSticker_isOutgoing_attributionInfo_creationDate_adaptiveImageGlyphContentIdentifier_adaptiveImageGlyphContentDescription_(v31, v41, (uint64_t)v23, (uint64_t)v30, v33, v32, v34, v35, v36, v40, v52, cf);

          if (v52)
          {
            CFRelease(v52);
            CFTypeRef v52 = 0;
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          v20 = v49;
          if (v58)
          {
            CFRelease(v58);
            CFTypeRef v58 = 0;
          }
          if (v55)
          {
            CFRelease(v55);
            CFTypeRef v55 = 0;
          }
          if (v54)
          {
            CFRelease(v54);
            CFTypeRef v54 = 0;
          }
          CFRelease(v48);
          v47[2](v47, isOutgoing_attributionInfo_creationDate_adaptiveImageGlyphContentIdentifier_adaptiveImageGlyphContentDescription, &v59);
          int v43 = v59;

          CFArrayRef v17 = v46;
          v19 = v50;
          if (v43) {
            break;
          }
        }

        if (++v18 >= CFArrayGetCount(v17)) {
          goto LABEL_23;
        }
      }
    }
LABEL_23:
    CFRelease(v17);
    v15 = v44;
    v9 = v45;
  }
}

- (void)enumerateAllMessagesWithBlock:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  CFArrayRef v4 = (void (**)(id, void *, unsigned char *))a3;
  v8 = objc_msgSend_chatIdentifier(self, v5, v6, v7);
  v52[0] = v8;
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v52, 1);

  unsigned __int8 v14 = objc_msgSend_serviceName(self, v11, v12, v13);
  v51 = v14;
  CFArrayRef v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)&v51, 1);

  id v17 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  CFArrayRef v18 = (const __CFArray *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesWithOnlyUnreadAndLimit();
  if (v18)
  {
    CFArrayRef v19 = v18;
    if (CFArrayGetCount(v18) >= 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v19, 0);
      v21 = _IMSPIMessageFromRecord((uint64_t)ValueAtIndex, 0, 0, v17, QOS_CLASS_DEFAULT);
      if (v21)
      {
        v45 = v21;
        CFArrayRef v46 = v19;
        uint64_t v25 = objc_msgSend_guid(v21, v22, v23, v24);
        uint64_t v26 = 0;
        unsigned __int8 v50 = 0;
        v47 = v16;
        v48 = v10;
        while (1)
        {
          uint64_t v27 = (void *)MEMORY[0x1A6264150]();
          CFArrayRef v28 = (const __CFArray *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier();
          if (!v28) {
            goto LABEL_19;
          }
          CFArrayRef v29 = v28;
          CFIndex Count = CFArrayGetCount(v28);
          if (CFArrayGetCount(v29) < 1) {
            goto LABEL_18;
          }
          CFIndex v30 = 0;
          while (1)
          {
            v31 = (void *)MEMORY[0x1A6264150]();
            CFTypeRef v32 = CFArrayGetValueAtIndex(v29, v30);
            uint64_t v33 = _IMSPIMessageFromRecord((uint64_t)v32, 0, 0, v17, QOS_CLASS_DEFAULT);
            v37 = v33;
            if (!v33) {
              goto LABEL_13;
            }
            uint64_t v38 = objc_msgSend_text(v33, v34, v35, v36);
            if (v38) {
              break;
            }
            v42 = objc_msgSend_attributedText(v37, v39, v40, v41);

            if (v42) {
              goto LABEL_12;
            }
LABEL_13:
            if (!v30)
            {
              uint64_t v43 = objc_msgSend_guid(v37, v34, v35, v36);

              uint64_t v25 = (void *)v43;
            }

            if (++v30 >= CFArrayGetCount(v29)) {
              goto LABEL_18;
            }
          }

LABEL_12:
          v4[2](v4, v37, &v50);
          if (!v50) {
            goto LABEL_13;
          }

LABEL_18:
          CFRelease(v29);
          CFArrayRef v16 = v47;
          v10 = v48;
          uint64_t v26 = Count;
LABEL_19:
          int v44 = v50;
          if (v44 || v26 <= 999)
          {

            CFArrayRef v19 = v46;
            break;
          }
        }
      }
    }
    CFRelease(v19);
  }
}

- (IMSPIChat)initWithChatRecord:(_IMDChatRecordStruct *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)IMSPIChat;
  CFArrayRef v4 = [(IMSPIChat *)&v37 init];
  if (!v4)
  {
LABEL_14:
    uint64_t v24 = v4;
    goto LABEL_20;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v33 = 0;
  BOOL v34 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  if (qword_1E965EB40 != -1) {
    dispatch_once(&qword_1E965EB40, &unk_1EF8E58F8);
  }
  off_1E965EB38(a3, &v32, 0, 0, 0, &v34, &v36, &v35, 0, &v33, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    &v31,
    0,
    0,
    &v30,
    &v29);
  serviceName = v4->_serviceName;
  v4->_serviceName = v36;

  guid = v4->_guid;
  v4->_guid = v35;

  chatIdentifier = v4->_chatIdentifier;
  v4->_chatIdentifier = v34;

  displayName = v4->_displayName;
  v4->_displayName = v33;

  v4->_isGroup = v32 != 45;
  v4->_isBlackholed = v31 != 0;
  if (v4->_guid && v4->_serviceName)
  {
    if (qword_1E965EB50 != -1) {
      dispatch_once(&qword_1E965EB50, &unk_1EF8E5A78);
    }
    v9 = (void *)off_1E965EB48(a3);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (objc_msgSend_count(v9, v11, v12, v13))
    {
      unint64_t v16 = 0;
      do
      {
        id v17 = objc_msgSend_objectAtIndex_(v9, v14, v16, v15);
        v20 = sub_1A4C6FD20(v17);
        if (v20) {
          objc_msgSend_addObject_(v10, v18, (uint64_t)v20, v19);
        }

        ++v16;
      }
      while (v16 < objc_msgSend_count(v9, v21, v22, v23));
    }
    objc_msgSend_setHandles_(v4, v14, (uint64_t)v10, v15);

    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = v4->_guid;
      uint64_t v27 = v4->_serviceName;
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v26;
      __int16 v40 = 2112;
      uint64_t v41 = v27;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Cannot initialize chat with record: guid: %@ service: %@.", buf, 0x16u);
    }
  }
  uint64_t v24 = 0;
LABEL_20:

  return v24;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_chatIdentifier(self, a2, v2, v3);
  id v10 = objc_msgSend_guid(self, v7, v8, v9);
  unsigned __int8 v14 = objc_msgSend_serviceName(self, v11, v12, v13);
  CFArrayRef v18 = objc_msgSend_displayName(self, v15, v16, v17);
  if (objc_msgSend_isGroup(self, v19, v20, v21)) {
    objc_msgSend_stringWithFormat_(v5, v22, @"IMSPIChat: %p [ChatIdentifier: %@  guid: %@, serviceName: %@, displayName: %@, isGroup: %@]", v23, self, v6, v10, v14, v18, @"YES");
  }
  else {
  uint64_t v24 = objc_msgSend_stringWithFormat_(v5, v22, @"IMSPIChat: %p [ChatIdentifier: %@  guid: %@, serviceName: %@, displayName: %@, isGroup: %@]", v23, self, v6, v10, v14, v18, @"NO");
  }

  return v24;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGuid:(id)a3
{
}

- (NSString)chatIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChatIdentifier:(id)a3
{
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceName:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (BOOL)isBlackholed
{
  return self->_isBlackholed;
}

- (NSArray)handles
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end