void __XPCServerIMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  void v6[7];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC31B00;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  v6[6] = a5;
  v6[4] = a3;
  v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC31B00(uint64_t a1)
{
  uint64_t v1 = a1;
  updated = IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark(*(void *)(a1 + 48));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    v4 = v3;
    uint64_t v16 = v1;
    if ([updated count])
    {
      unint64_t v5 = 0;
      do
      {
        v6 = (void *)[updated objectAtIndex:v5];
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        if (v7)
        {
          v8 = v7;
          if ([v6 objectForKeyedSubscript:@"rowID"])
          {
            uint64_t v12 = objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"rowID"), "intValue");
            uint64_t v14 = 0;
            IMInsertIntsToXPCDictionary();
          }
          if (objc_msgSend(v6, "objectForKeyedSubscript:", @"filename", v12, v14))
          {
            uint64_t v13 = [v6 objectForKeyedSubscript:@"filename"];
            uint64_t v15 = 0;
            IMInsertNSStringsToXPCDictionary();
          }
          if (objc_msgSend(v6, "objectForKeyedSubscript:", @"guid", v13, v15))
          {
            uint64_t v12 = [v6 objectForKeyedSubscript:@"guid"];
            uint64_t v14 = 0;
            IMInsertNSStringsToXPCDictionary();
          }
          xpc_array_append_value(v4, v8);
          xpc_release(v8);
        }
        ++v5;
      }
      while (v5 < objc_msgSend(updated, "count", v12, v14));
    }
    uint64_t v1 = v16;
    if (updated)
    {
      v9 = *(void **)(v16 + 32);
      if (v9) {
        xpc_dictionary_set_value(v9, "array_result", v4);
      }
    }
    xpc_release(v4);
  }
  if (updated) {
    CFRelease(updated);
  }
  uint64_t result = *(void *)(v1 + 40);
  if (result)
  {
    v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordDeleteAttachmentPreviewsOlderThan_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC31D6C;
  v6[3] = &unk_1E5F9CE28;
  v6[4] = a4;
  v6[5] = a5;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC31D6C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan(*(void *)(a1 + 40));
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Deleting files older than %lld recent attachments", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC31ECC;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC31ECC(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v3;
      __int16 v18 = 2048;
      uint64_t v19 = [v1 count];
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Copying filenames for attachments for chat identifiers: %@ on services: %@   (Results: %ld)", buf, 0x20u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    uint64_t v6 = [v1 count];
    if (v6)
    {
      uint64_t v7 = 0;
      do
      {
        v8 = (void *)[v1 objectAtIndex:v7];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"path"), "UTF8String");
          xpc_dictionary_set_string(v9, "guid", (const char *)objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"guid"), "UTF8String"));
          if (v10) {
            xpc_dictionary_set_string(v9, "path", v10);
          }
          xpc_dictionary_set_BOOL(v9, "isSticker", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"isSticker"), "BOOLValue"));
          xpc_dictionary_set_int64(v9, "createdDate", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"createdDate"), "unsignedLongLongValue"));
          xpc_dictionary_set_int64(v9, "transferState", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"transferState"), "unsignedLongLongValue"));
          xpc_array_append_value(v5, v9);
          xpc_release(v9);
        }
        ++v7;
      }
      while (v6 != v7);
    }
    v11 = *(void **)(a1 + 48);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v1) {
    CFRelease(v1);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC32204;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC32204(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3 && v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (IMOSLoggingEnabled())
    {
      xpc_object_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 64)];
        int v14 = 138412802;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = v8;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Copying purged attachments for chat %@ services %@ limit %@", (uint8_t *)&v14, 0x20u);
      }
    }
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDAttachmentRecordBulkCopyXPCDictionary((uint64_t)ValueAtIndex, (uint64_t)v11, 1);
          xpc_array_set_value(v3, 0xFFFFFFFFFFFFFFFFLL, v11);
          xpc_release(v11);
        }
      }
    }
    uint64_t v12 = *(void **)(a1 + 48);
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v3);
    }
  }
  if (v3) {
    xpc_release(v3);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatGetChatsThatContainRecipient_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3246C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3246C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  ChatsThatContainRecipient = IMDChatGetChatsThatContainRecipient(*(void *)(a1 + 32));
  if (ChatsThatContainRecipient)
  {
    CFArrayRef v3 = ChatsThatContainRecipient;
    uint64_t v21 = v1;
    xpc_object_t v4 = xpc_array_create(0, 0);
    if (v4)
    {
      BOOL v5 = v4;
      CFIndex Count = CFArrayGetCount(v3);
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = *(void *)(v21 + 32);
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v8;
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "All chats that have %@ as a participant.", buf, 0xCu);
        }
      }
      if (Count)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex(v3, i);
          xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
          if (v11)
          {
            uint64_t v12 = (void *)[ValueAtIndex valueForKey:@"chatGUID"];
            if (v12) {
              xpc_dictionary_set_string(v11, "chatGUID", (const char *)[v12 UTF8String]);
            }
            uint64_t v13 = (void *)[ValueAtIndex valueForKey:@"displayName"];
            if (v13) {
              xpc_dictionary_set_string(v11, "displayName", (const char *)[v13 UTF8String]);
            }
            xpc_object_t v14 = xpc_array_create(0, 0);
            uint64_t v15 = (void *)[ValueAtIndex valueForKey:@"handles"];
            __int16 v16 = v15;
            if (v15 && [v15 count])
            {
              unint64_t v17 = 0;
              do
              {
                uint64_t v18 = [v16 objectAtIndex:v17];
                xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
                if (v19)
                {
                  _IMDHandleRecordBulkCopyXPCDictionary(v18, (uint64_t)v19, 1);
                  xpc_array_append_value(v14, v19);
                  xpc_release(v19);
                }
                ++v17;
              }
              while (v17 < [v16 count]);
            }
            if (v14)
            {
              xpc_dictionary_set_value(v11, "handles", v14);
              xpc_release(v14);
            }
            xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, v11);
            xpc_release(v11);
          }
        }
      }
      xpc_dictionary_set_value(*(xpc_object_t *)(v21 + 40), "array_result", v5);
      xpc_release(v5);
    }
    CFRelease(v3);
    uint64_t v1 = v21;
  }
  uint64_t result = *(void *)(v1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC327B0;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC327B0(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices(*(void **)(a1 + 32), *(void **)(a1 + 40));
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_object_t v4 = v3;
  if (v3 && v2)
  {
    if (CFArrayGetCount(v2) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          uint64_t v7 = *(void *)(a1 + 40);
          int v13 = 138412546;
          uint64_t v14 = v6;
          __int16 v15 = 2112;
          uint64_t v16 = v7;
          _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Copying purged attachments count for chat %@ services %@", (uint8_t *)&v13, 0x16u);
        }
      }
      int64_t v8 = objc_msgSend((id)CFArrayGetValueAtIndex(v2, 0), "unsignedIntegerValue");
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      v10 = v9;
      if (v9)
      {
        xpc_dictionary_set_int64(v9, "purgedCount", v8);
        xpc_array_set_value(v4, 0xFFFFFFFFFFFFFFFFLL, v10);
        xpc_release(v10);
      }
      xpc_object_t v11 = *(void **)(a1 + 48);
      if (v11) {
        xpc_dictionary_set_value(v11, "array_result", v4);
      }
    }
  }
  else if (!v3)
  {
    goto LABEL_13;
  }
  xpc_release(v4);
LABEL_13:
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyStickers_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC329E8;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC329E8(uint64_t a1)
{
  uint64_t v1 = a1;
  v2 = (void *)IMDAttachmentRecordCopyAttachmentStickers(*(void *)(a1 + 48));
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying filenames for sticker attachments", buf, 2u);
    }
  }
  xpc_object_t v4 = xpc_array_create(0, 0);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v17 = v1;
    if ([v2 count])
    {
      unint64_t v6 = 0;
      uint64_t v18 = v2;
      do
      {
        uint64_t v7 = (void *)[v2 objectAtIndex:v6];
        uint64_t v8 = [v7 valueForKey:@"sticker_user_info"];
        uint64_t v9 = [v7 valueForKey:@"filename"];
        objc_msgSend((id)objc_msgSend(v7, "valueForKey:", @"created_date"), "intValue");
        uint64_t v10 = [v7 valueForKey:@"accessibility_string"];
        if (v8 && v9)
        {
          uint64_t v11 = v10;
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          IMInsertDatasToXPCDictionary();
          IMInsertNSStringsToXPCDictionary();
          v2 = v18;
          IMInsertIntsToXPCDictionary();
          uint64_t v15 = v11;
          uint64_t v16 = 0;
          IMInsertNSStringsToXPCDictionary();
          xpc_array_append_value(v5, v12);
          xpc_release(v12);
        }
        ++v6;
      }
      while (v6 < objc_msgSend(v2, "count", v15, v16));
    }
    uint64_t v1 = v17;
    int v13 = *(void **)(v17 + 32);
    if (v13) {
      xpc_dictionary_set_value(v13, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(v1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, long long a9, uint64_t a10, int a11, char a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char a18, int a19, long long a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25)
{
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1AFC32D34;
  v26[3] = &unk_1E5F9CF90;
  int v39 = a6;
  int v40 = a7;
  v26[4] = a5;
  v26[5] = a8;
  long long v27 = a9;
  char v44 = a12;
  uint64_t v28 = a10;
  uint64_t v29 = a14;
  char v45 = a15;
  uint64_t v30 = a16;
  uint64_t v31 = a17;
  char v46 = a18;
  int v41 = a11;
  int v42 = a19;
  long long v32 = a20;
  uint64_t v37 = a13;
  uint64_t v38 = a22;
  uint64_t v33 = a21;
  uint64_t v34 = a23;
  int v43 = a25;
  uint64_t v35 = a24;
  uint64_t v36 = a4;
  BOOL v25 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v26, v25);
}

uint64_t sub_1AFC32D34(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = IMDAttachmentRecordCopyAttachmentForGUID(*(const __CFString **)(a1 + 32));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      xpc_object_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v5;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Updating attachment for guid: %@", buf, 0xCu);
      }
    }
    IMDAttachmentRecordBulkUpdate((uint64_t)v2, *(void *)(a1 + 32), *(int *)(a1 + 160), *(int *)(a1 + 164), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(int *)(a1 + 168), *(unsigned char *)(a1 + 180), *(void *)(a1 + 144), *(void *)(a1 + 72), *(unsigned char *)(a1 + 181), *(void *)(a1 + 80), *(void **)(a1 + 88), *(unsigned char *)(a1 + 182), *(int *)(a1 + 172), *(void *)(a1 + 96), *(void *)(a1 + 104),
      *(void *)(a1 + 112),
      *(void *)(a1 + 152),
      *(void *)(a1 + 120),
      *(void *)(a1 + 128),
      *(int *)(a1 + 176));
    CFRelease(v2);
  }
  else if (v3)
  {
    unint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "No attachment found to update for guid: %@", buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 136);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDCNRecordIDAndHistoryTokenForAliases_IPAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC32F90;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC32F90(uint64_t a1)
{
  IMDCNRecordIDAndHistoryTokenForAliases(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    IMInsertDictionariesToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCNRecordIDForAliases_IPAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC33088;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC33088(uint64_t a1)
{
  IMDCNRecordIDForAliases(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    IMInsertDictionariesToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCNRecordIDAndHistoryTokenForAliases_asyncIPAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EB5AB9B8 != -1) {
    dispatch_once(&qword_1EB5AB9B8, &unk_1F084CFC0);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC331F0;
  v10[3] = &unk_1E5F9CEF0;
  v10[4] = a5;
  v10[5] = a6;
  v10[6] = a3;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)qword_1EB5AB9C0, v10);
}

dispatch_queue_t sub_1AFC331C4()
{
  dispatch_queue_t result = dispatch_queue_create("_IMDPersistenceQueueForAsyncIPAction", 0);
  qword_1EB5AB9C0 = (uint64_t)result;
  return result;
}

void sub_1AFC331F0(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1AFC33268;
  v3[3] = &unk_1E5F9CFB8;
  long long v4 = *(_OWORD *)(a1 + 48);
  IMDCNRecordIDAndHistoryTokenForAliasesWithCompletionHandler(v2, v1, v3);
}

uint64_t sub_1AFC33268(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    IMInsertDictionariesToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDIsFavoritedContact_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC33354;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC33354(uint64_t a1)
{
  char v2 = IMDIsFavoritedContact(*(void **)(a1 + 32));
  int v3 = *(void **)(a1 + 40);
  if (v3) {
    xpc_dictionary_set_BOOL(v3, "BOOL_result", v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDCNGivenNameAndBirthdayForHandleID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3343C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3343C(uint64_t a1)
{
  IMDCNGivenNameAndBirthdayForHandleID(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    IMInsertDictionariesToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCNFullNameAndOrganizationNameForHandleID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC33534;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC33534(uint64_t a1)
{
  IMDCNFullNameAndOrganizationNameForHandleID(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    IMInsertDictionariesToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDHandleRecordCreate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC33638;
  v10[3] = &unk_1E5F9CFE0;
  v10[4] = a5;
  v10[5] = a6;
  v10[6] = a7;
  v10[7] = a8;
  void v10[8] = a9;
  v10[9] = a3;
  v10[10] = a4;
  BOOL v9 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v10, v9);
}

void sub_1AFC33638(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = IMDHandleRecordCreate(0, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      long long v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 48);
        int v11 = 138412546;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Creating handle record for ID: %@  service: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 72), 1);
  }
  else if (v3)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Failed to create handle record for ID: %@  service: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 80);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDHandleRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1AFC3386C;
  v11[3] = &unk_1E5F9D008;
  v11[9] = a4;
  v11[10] = a5;
  v11[4] = a6;
  v11[5] = a7;
  v11[6] = a9;
  v11[7] = a8;
  v11[8] = a10;
  BOOL v10 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v11, v10);
}

uint64_t sub_1AFC3386C(uint64_t *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v2 = (const void *)IMDHandleRecordCreateFromRecordID(0, a1[10]);
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      long long v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a1[10];
        uint64_t v6 = a1[4];
        uint64_t v7 = a1[5];
        uint64_t v8 = a1[6];
        uint64_t v9 = a1[7];
        uint64_t v10 = a1[8];
        int v14 = 134219266;
        uint64_t v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v10;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Updating handle record for handle ID: %lld   ID: %@  country: %@  unformatted: %@  service: %@ personCentricID: %@", (uint8_t *)&v14, 0x3Eu);
      }
    }
    IMDHandleRecordBulkUpdate((uint64_t)v2, a1[4], a1[5], a1[7], a1[6], a1[8]);
    CFRelease(v2);
  }
  else if (v3)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = a1[10];
      int v14 = 134217984;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Failed handle record record ID: %lld", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t result = a1[9];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDHandleRecordCopyHandleForIDOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC33AA4;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC33AA4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = (const void *)IMDHandleRecordCopyHandleForIDOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      long long v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v11 = 138412546;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copied handle record for ID: %@  service: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 48), 1);
    CFRelease(v2);
  }
  else if (v3)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "No handle record found for ID: %@  service: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordUnassociateMessageWithGUIDFromAttachmentWithGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC33CB8;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC33CB8(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    char v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      uint64_t v4 = a1[5];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Unassociating message guid: %@  from attachment: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessageRecordUnassociateMessageWithGUIDFromAttachmentWithGUID(a1[4], a1[5]);
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC33E24;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC33E24(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    char v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      uint64_t v4 = a1[5];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Associating message guid: %@  from attachment: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID(a1[4], a1[5]);
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesForAssociatedGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC33F90;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC33F90(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v2 = (__CFString *)IMDMessageRecordCopyMessagesForAssociatedGUID(*(const __CFString **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = [(__CFString *)v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for associated guid: %@   (Results: %ld)", (uint8_t *)&v11, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    if ([(__CFString *)v2 count])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = [(__CFString *)v2 objectAtIndex:v6];
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        if (v8)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v7, (uint64_t)v8, 1, 0);
          xpc_array_append_value(v5, v8);
          xpc_release(v8);
        }
        ++v6;
      }
      while (v6 < [(__CFString *)v2 count]);
    }
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9) {
      xpc_dictionary_set_value(v9, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesForGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC341D4;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC341D4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = IMDMessageRecordCopyMessagesForGUIDs(*(const __CFArray **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = [(__CFArray *)v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for guids: %@   (Results: %ld)", (uint8_t *)&v13, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    int v6 = [(__CFArray *)v2 count];
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        uint64_t v9 = [(__CFArray *)v2 objectAtIndex:v7];
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v9, (uint64_t)v10, 1, 0);
          xpc_array_append_value(v5, v10);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v8 != v7);
    }
    int v11 = *(void **)(a1 + 40);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesBetweenRowIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC34420;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC34420(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyMessagesBetweenRowIDs(a1[6], a1[7]);
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[6];
      uint64_t v4 = a1[7];
      int v14 = 134218496;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages between rowID: %lld  and rowID: %lld   (Results: %ld)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    uint64_t v12 = (void *)a1[4];
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessageForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC34678;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC34678(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = IMDMessageRecordCopyMessageForGUID(*(const __CFString **)(a1 + 32));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v9 = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        CFStringRef v12 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy message for guid: %@   (Result: %@)", (uint8_t *)&v9, 0x16u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 40), 1, 0);
  }
  else if (v3)
  {
    xpc_object_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Failed to copy message for guid: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyLastReadMessageForChatIdentifier_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC34888;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC34888(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef MessageForChatIdentifier = IMDMessageRecordCopyLastReadMessageForChatIdentifier(*(const __CFString **)(a1 + 32));
  int v3 = IMOSLoggingEnabled();
  if (MessageForChatIdentifier)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v9 = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        CFStringRef v12 = MessageForChatIdentifier;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy last read message for chat identifier: %@   (Result: %@)", (uint8_t *)&v9, 0x16u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)MessageForChatIdentifier, *(void *)(a1 + 40), 1, 0);
  }
  else if (v3)
  {
    xpc_object_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Failed to copy last read message for chat identifier: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  if (MessageForChatIdentifier) {
    CFRelease(MessageForChatIdentifier);
  }
}

void __XPCServerIMDMessageRecordCopyMessageForRowID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC34A98;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC34A98(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const void *)IMDMessageRecordCopyMessageForRowID(a1[6]);
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a1[6];
        int v9 = 134218242;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        CFStringRef v12 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy message for RowID: %lld   (Result: %@)", (uint8_t *)&v9, 0x16u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, a1[4], 1, 0);
  }
  else if (v3)
  {
    xpc_object_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[6];
      int v9 = 134217984;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Failed to copy message for rowID: %lld", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = a1[5];
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyLastReceivedMessage_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC34CA4;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

void sub_1AFC34CA4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ReceivedMessage = (const void *)IMDMessageRecordCopyLastReceivedMessage();
  int v3 = IMOSLoggingEnabled();
  if (ReceivedMessage)
  {
    if (v3)
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        uint64_t v8 = ReceivedMessage;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy last received message (Result: %@)", (uint8_t *)&v7, 0xCu);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)ReceivedMessage, *(void *)(a1 + 32), 1, 0);
  }
  else if (v3)
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Failed to copy last received message", (uint8_t *)&v7, 2u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  if (ReceivedMessage) {
    CFRelease(ReceivedMessage);
  }
}

void __XPCServerIMDMessageRecordCopyLastReceivedMessageLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC34E90;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC34E90(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ReceivedMessageLimit = (void *)IMDMessageRecordCopyLastReceivedMessageLimit(a1[6]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[6];
      int v13 = 134218240;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = [ReceivedMessageLimit count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying last received messages with limit: %lld   (Results: %ld)", (uint8_t *)&v13, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    int v6 = [ReceivedMessageLimit count];
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        uint64_t v9 = [ReceivedMessageLimit objectAtIndex:v7];
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v9, (uint64_t)v10, 1, 0);
          xpc_array_append_value(v5, v10);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v8 != v7);
    }
    __int16 v11 = (void *)a1[4];
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (ReceivedMessageLimit) {
    CFRelease(ReceivedMessageLimit);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesForRowIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC350DC;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC350DC(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)IMDMessageRecordCopyMessagesForRowIDs(*(const __CFArray **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for rowIDs: %@   (Results: %ld)", (uint8_t *)&v13, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    int v6 = [v2 count];
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        uint64_t v9 = [v2 objectAtIndex:v7];
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v9, (uint64_t)v10, 1, 0);
          xpc_array_append_value(v5, v10);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v8 != v7);
    }
    __int16 v11 = *(void **)(a1 + 40);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyNewMessagesForKnownRowIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC35328;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC35328(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)IMDMessageRecordCopyNewMessagesForKnownRowIDs(*(void **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for rowIDs: %@", buf, 0xCu);
    }
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  int v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFC354B8;
    v9[3] = &unk_1E5F9D030;
    v9[4] = *(void *)(a1 + 40);
    v9[5] = v5;
    [v2 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7) {
      xpc_dictionary_set_value(v7, "dictionary_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1AFC354B8(uint64_t a1, void *a2, void *a3)
{
  if ([a2 isEqualToString:@"newMessages"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    int v7 = [a3 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [a3 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          uint64_t v12 = v11;
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v12);
          xpc_release(v12);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    if (*(void *)(a1 + 32)) {
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), "newMessages", v6);
    }
    xpc_release(v6);
  }
  else if ([a2 isEqualToString:@"readMessageIDs"] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    xpc_object_t v13 = xpc_array_create(0, 0);
    int v14 = [a3 count];
    if (v14 >= 1)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v14;
      do
      {
        CFNumberRef v17 = (const __CFNumber *)[a3 objectAtIndex:v15];
        int64_t valuePtr = -1;
        CFNumberGetValue(v17, kCFNumberLongLongType, &valuePtr);
        if (valuePtr != -1) {
          xpc_array_set_int64(v13, 0xFFFFFFFFFFFFFFFFLL, valuePtr);
        }
        ++v15;
      }
      while (v16 != v15);
    }
    if (*(void *)(a1 + 32)) {
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), "readMessageIDs", v13);
    }
    xpc_release(v13);
  }
  else if ([a2 isEqualToString:@"lastFailedDate"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t valuePtr = -1;
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      if (*(void *)(a1 + 32)) {
        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "lastFailedDate", valuePtr);
      }
    }
  }
}

void __XPCServerIMDMessageRecordDeleteMessagesForGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC357A4;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC357A4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Delete messages for guids: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  IMDMessageRecordDeleteMessagesForGUIDs(*(const __CFArray **)(a1 + 32), 0);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordDeleteMessagesOlderThanDays_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC35904;
  v6[3] = &unk_1E5F9CE28;
  v6[4] = a4;
  v6[5] = a5;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC35904(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Delete messages older than %lld days", (uint8_t *)&v5, 0xCu);
    }
  }
  IMDMessageRecordDeleteMessagesOlderThanDays(*(void *)(a1 + 40), 0);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesWithRoomnameOnServiceLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC35A6C;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC35A6C(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)IMDMessageRecordCopyMessagesWithRoomnameOnServiceLimit(*(CFStringRef *)(a1 + 32), *(const __CFString **)(a1 + 40), *(void *)(a1 + 64));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for room name: %@ on service: %@   (Results: %ld)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    uint64_t v12 = *(void **)(a1 + 48);
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesWithOptionalThreadIdentifierAndLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1AFC35CE0;
  v11[3] = &unk_1E5F9D058;
  v11[4] = a5;
  v11[5] = a6;
  v11[6] = a7;
  v11[7] = a8;
  char v12 = a10;
  char v13 = a11;
  v11[9] = a4;
  v11[10] = a9;
  v11[8] = a3;
  IMDPersistencePerformBlock(v11, 1);
}

uint64_t sub_1AFC35CE0(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48), *(const __CFString **)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), *(void *)(a1 + 80));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = *(unsigned __int8 *)(a1 + 88);
      uint64_t v7 = [v2 count];
      uint64_t v8 = @"YES";
      *(_DWORD *)uint64_t v17 = 138413058;
      *(void *)&v17[4] = v5;
      *(_WORD *)&v17[12] = 2112;
      if (!v6) {
        uint64_t v8 = @"NO";
      }
      *(void *)&v17[14] = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying messages for chat identifiers: %@ on services: %@ onlyMessages: %@   (Results: %ld)", v17, 0x2Au);
    }
  }
  xpc_object_t v9 = xpc_array_create(0, 0);
  if (v9)
  {
    int v10 = [v2 count];
    if (v10 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v10;
      do
      {
        uint64_t v13 = objc_msgSend(v2, "objectAtIndex:", v11, *(_OWORD *)v17);
        xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
        if (v14)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v13, (uint64_t)v14, 1, 0);
          xpc_array_append_value(v9, v14);
          xpc_release(v14);
        }
        ++v11;
      }
      while (v12 != v11);
    }
    uint64_t v15 = *(void **)(a1 + 64);
    if (v15) {
      xpc_dictionary_set_value(v15, "array_result", v9);
    }
    xpc_release(v9);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1AFC35F7C;
  v11[3] = &unk_1E5F9D080;
  v11[4] = a5;
  v11[5] = a6;
  v11[10] = a9;
  void v11[11] = a10;
  v11[6] = a7;
  v11[7] = a8;
  v11[8] = a3;
  v11[9] = a4;
  BOOL v10 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v11, v10);
}

uint64_t sub_1AFC35F7C(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL value = 1;
  BOOL v21 = 1;
  CFArrayRef v2 = IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 88), *(const __CFString **)(a1 + 56), (void (*)(void))&value, (void (*)(void))&v21);
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = [(__CFArray *)v2 count];
      uint64_t v7 = *(void *)(a1 + 80);
      uint64_t v8 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138413314;
      uint64_t v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      __int16 v27 = 2048;
      uint64_t v28 = v6;
      __int16 v29 = 2048;
      uint64_t v30 = v7;
      __int16 v31 = 2048;
      uint64_t v32 = v8;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying limited number of messages for chat identifiers: %@ on services: %@  (Results: %ld) numberOfMessagesBefore: %lld numberOfMessagesAfter: %lld", buf, 0x34u);
    }
  }
  xpc_object_t v9 = xpc_array_create(0, 0);
  xpc_object_t v10 = xpc_BOOL_create(value);
  xpc_object_t v11 = xpc_BOOL_create(v21);
  if (v9)
  {
    int v12 = [(__CFArray *)v2 count];
    if (v12 >= 1)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12;
      do
      {
        uint64_t v15 = [(__CFArray *)v2 objectAtIndex:v13];
        xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
        if (v16)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v15, (uint64_t)v16, 1, 0);
          xpc_array_append_value(v9, v16);
          xpc_release(v16);
        }
        ++v13;
      }
      while (v14 != v13);
    }
    uint64_t v17 = *(void **)(a1 + 64);
    if (v17) {
      xpc_dictionary_set_value(v17, "array_result", v9);
    }
    xpc_release(v9);
  }
  if (v10)
  {
    __int16 v18 = *(void **)(a1 + 64);
    if (v18) {
      xpc_dictionary_set_value(v18, "has_messages_before", v10);
    }
    xpc_release(v10);
  }
  if (v11)
  {
    uint64_t v19 = *(void **)(a1 + 64);
    if (v19) {
      xpc_dictionary_set_value(v19, "has_messages_after", v11);
    }
    xpc_release(v11);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyFrequentRepliesForChatIdentifiersOnServicesLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC36274;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC36274(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyFrequentRepliesForChatIdentifiersOnServicesUpToLimit(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 64));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v12 = 138412802;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying frequent replies for chat identifiers: %@ on services: %@   (Results: %ld)", (uint8_t *)&v12, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
        xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)objc_msgSend(v2, "objectAtIndex:", v8++), "UTF8String"));
      while (v9 != v8);
    }
    xpc_object_t v10 = *(void **)(a1 + 48);
    if (v10) {
      xpc_dictionary_set_value(v10, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyGUIDsForMessagesWithChatIdentifiersOnServices_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC36498;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC36498(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyGUIDsForMessagesWithChatIdentifiersOnServices(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copying guids for chat identifiers: %@ on services: %@   (Results: %ld)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        xpc_object_t v10 = (void *)[v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v10 UTF8String]);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    int v12 = *(void **)(a1 + 48);
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatRemapChatsWithLastAddressedSIMIDToNewLastAddressedIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC366E8;
  v8[3] = &unk_1E5F9CEF0;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a7;
  v8[7] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC366E8(uint64_t a1)
{
  IMDChatRemapChatsWithLastAddressedSIMIDToNewLastAddressedIDs(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatGetMessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC367BC;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC367BC(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs = (void *)IMDChatGetMessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Getting last addressed labelID and last message date for chat identifiers: %@ and last addressed labelIDs: %@   (Results: %@)", buf, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if ([MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs count])
    {
      if ([MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs objectForKeyedSubscript:@"labelID"])
      {
        uint64_t v9 = [MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs objectForKeyedSubscript:@"labelID"];
        uint64_t v10 = 0;
        IMInsertNSStringsToXPCDictionary();
      }
      if (objc_msgSend(MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs, "objectForKeyedSubscript:", @"date", v9, v10))
      {
        xpc_dictionary_set_int64(v6, "date", objc_msgSend((id)objc_msgSend(MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs, "objectForKeyedSubscript:", @"date"), "integerValue"));
      }
    }
    BOOL v7 = *(void **)(a1 + 48);
    if (v7) {
      xpc_dictionary_set_value(v7, "dictionary_result", v6);
    }
    xpc_release(v6);
  }
  if (MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs) {
    CFRelease(MessageDateAndLastAddressedLabelIDFromChatIdentifiersAndLastAddressedLabelIDs);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatGetMessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC36A04;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC36A04(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles = (void *)IMDChatGetMessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Getting last addressed handle and last message date for chat identifiers: %@ and last addressed handles: %@   (Results: %@)", buf, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if ([MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles count])
    {
      if ([MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles objectForKeyedSubscript:@"handle"])
      {
        uint64_t v9 = [MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles objectForKeyedSubscript:@"handle"];
        uint64_t v10 = 0;
        IMInsertNSStringsToXPCDictionary();
      }
      if (objc_msgSend(MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles, "objectForKeyedSubscript:", @"date", v9, v10))
      {
        xpc_dictionary_set_int64(v6, "date", objc_msgSend((id)objc_msgSend(MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles, "objectForKeyedSubscript:", @"date"), "integerValue"));
      }
    }
    BOOL v7 = *(void **)(a1 + 48);
    if (v7) {
      xpc_dictionary_set_value(v7, "dictionary_result", v6);
    }
    xpc_release(v6);
  }
  if (MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles) {
    CFRelease(MessageDateAndLastAddressedHandleFromChatIdentifiersAndLastAddressedHandles);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServices_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC36C4C;
  v8[3] = &unk_1E5F9CEF0;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a7;
  v8[7] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC36C4C(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFArrayRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412802;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Delete messages guids: %@ for chat identifiers: %@ on services: %@", (uint8_t *)&v7, 0x20u);
    }
  }
  IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServices(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesWithHandleOnServiceLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC36DCC;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  void v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC36DCC(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyMessagesWithHandleOnServiceLimit(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(void *)(a1 + 64));
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 64);
      int v15 = 138413058;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy messages with for handle: %@ on service: %@  limit: %lld  (Results: %ld)", (uint8_t *)&v15, 0x2Au);
    }
  }
  xpc_object_t v7 = xpc_array_create(0, 0);
  if (v7)
  {
    int v8 = [v2 count];
    if (v8 >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        uint64_t v11 = [v2 objectAtIndex:v9];
        xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
        if (v12)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v11, (uint64_t)v12, 1, 0);
          xpc_array_append_value(v7, v12);
          xpc_release(v12);
        }
        ++v9;
      }
      while (v10 != v9);
    }
    uint64_t v13 = *(void **)(a1 + 48);
    if (v13) {
      xpc_dictionary_set_value(v13, "array_result", v7);
    }
    xpc_release(v7);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDs_IPCAction(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFC37050;
  v13[3] = &unk_1E5F9D0A8;
  v13[4] = a6;
  v13[5] = a7;
  v13[6] = a8;
  v13[7] = a9;
  *(double *)&v13[12] = a1;
  char v14 = a10;
  v13[8] = a11;
  v13[9] = a12;
  v13[10] = a4;
  v13[11] = a5;
  BOOL v12 = sub_1AFC2EAF8(a4);
  IMDPersistencePerformBlock(v13, v12);
}

void sub_1AFC37050(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDs(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(const __CFArray **)(a1 + 48), *(const __CFArray **)(a1 + 56), *(unsigned __int8 *)(a1 + 104), *(const __CFArray **)(a1 + 64), *(const __CFArray **)(a1 + 72), *(double *)(a1 + 96));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 64);
        uint64_t v6 = *(void *)(a1 + 72);
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        int v15 = 138413314;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        uint64_t v18 = v5;
        __int16 v19 = 2112;
        uint64_t v20 = v6;
        __int16 v21 = 2112;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        uint64_t v24 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy messages with handle: %@ matching body with for chatidentifiers: %@ on services: %@  skipping: %@  (Result: %@)", (uint8_t *)&v15, 0x34u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 80), 1, 0);
  }
  else if (v3)
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 64);
      uint64_t v11 = *(void *)(a1 + 72);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v15 = 138413058;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "No message found with handle: %@ matching body with for chatidentifiers: %@ on services: %@  skipping: %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v14 = *(void *)(a1 + 88);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs_IPCAction(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC372B8;
  v10[3] = &unk_1E5F9D008;
  v10[4] = a6;
  v10[5] = a7;
  v10[6] = a8;
  v10[7] = a9;
  *(double *)&v10[10] = a1;
  void v10[8] = a4;
  v10[9] = a5;
  BOOL v9 = sub_1AFC2EAF8(a4);
  IMDPersistencePerformBlock(v10, v9);
}

void sub_1AFC372B8(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(const __CFArray **)(a1 + 48), *(const __CFArray **)(a1 + 56), *(double *)(a1 + 80));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        int v11 = 138412802;
        uint64_t v12 = v5;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy messages with handle: %@ matching body skipping services: %@  (Result: %@)", (uint8_t *)&v11, 0x20u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 64), 1, 0);
  }
  else if (v3)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "No message found with handle: %@ matching body skipping services: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID_IPCAction(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1AFC374F8;
  v11[3] = &unk_1E5F9D0D0;
  v11[4] = a6;
  v11[5] = a7;
  char v12 = a9;
  v11[6] = a8;
  v11[7] = a10;
  *(double *)&v11[10] = a1;
  v11[8] = a4;
  v11[9] = a5;
  BOOL v10 = sub_1AFC2EAF8(a4);
  IMDPersistencePerformBlock(v11, v10);
}

void sub_1AFC374F8(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 56), *(double *)(a1 + 80));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        int v7 = *(unsigned __int8 *)(a1 + 88);
        int v12 = 138413058;
        uint64_t v13 = v5;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        __int16 v16 = 1024;
        int v17 = v7;
        __int16 v18 = 2112;
        __int16 v19 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy SOS messages with handle: %@ matching body matching service: %@ matchingIsSOS: %d (Result: %@)", (uint8_t *)&v12, 0x26u);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 64), 1, 0);
  }
  else if (v3)
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "No SOS duplicate message found with handle: %@ matching body matching service: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyMessageWithHandleOnServiceWithReplaceID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC37740;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  void v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

void sub_1AFC37740(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const void *)IMDMessageRecordCopyMessageWithHandleOnServiceWithReplaceID(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(void *)(a1 + 64));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 64);
        int v13 = 138413058;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        __int16 v17 = 2048;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Copy message with handle: %@ on service: %@  replaceID: %lld (Result: %@)", (uint8_t *)&v13, 0x2Au);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 48), 1, 0);
  }
  else if (v3)
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 64);
      int v13 = 138412802;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "No message found with handle: %@ on service: %@  replaceID: %lld", (uint8_t *)&v13, 0x20u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    (*(void (**)(void))(v12 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDMessageRecordCopyUndeliveredOneToOneiMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3798C;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3798C(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyUndeliveredOneToOneiMessages(a1[6]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy undelivered 1-1 messages (Results: %ld)", (uint8_t *)&v12, 0xCu);
    }
  }
  xpc_object_t v4 = xpc_array_create(0, 0);
  if (v4)
  {
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0);
          xpc_array_append_value(v4, v9);
          xpc_release(v9);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    uint64_t v10 = (void *)a1[4];
    if (v10) {
      xpc_dictionary_set_value(v10, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyExpiringOrExpiredMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC37BC8;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC37BC8(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyExpiringOrExpiredMessages(a1[6]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy expiring or expired messages (Results: %ld)", (uint8_t *)&v12, 0xCu);
    }
  }
  xpc_object_t v4 = xpc_array_create(0, 0);
  if (v4)
  {
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0);
          xpc_array_append_value(v4, v9);
          xpc_release(v9);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    uint64_t v10 = (void *)a1[4];
    if (v10) {
      xpc_dictionary_set_value(v10, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyUnsentUnfailedMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC37E04;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC37E04(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyUnsentUnfailedMessages(a1[6]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy unsent messages (Results: %ld)", (uint8_t *)&v12, 0xCu);
    }
  }
  xpc_object_t v4 = xpc_array_create(0, 0);
  if (v4)
  {
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0);
          xpc_array_append_value(v4, v9);
          xpc_release(v9);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    uint64_t v10 = (void *)a1[4];
    if (v10) {
      xpc_dictionary_set_value(v10, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessageActionItemsForOriginalMessageGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC38040;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC38040(uint64_t *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (void *)IMDMessageRecordCopyMessageActionItemsForOriginalMessageGUID(a1[4]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      uint64_t v13 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy message action items for original message guid (Results: %ld)", (uint8_t *)&v12, 0xCu);
    }
  }
  xpc_object_t v4 = xpc_array_create(0, 0);
  if (v4)
  {
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0);
          xpc_array_append_value(v4, v9);
          xpc_release(v9);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    uint64_t v10 = (void *)a1[5];
    if (v10) {
      xpc_dictionary_set_value(v10, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCountAllUnreadMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38278;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38278(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v2 = IMDMessageRecordCountAllUnreadMessages();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = v2;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Unread message count: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (v2) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCountAllUnreadMessagesForChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC383F8;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC383F8(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v2 = IMDMessageRecordCountAllUnreadMessagesForChatGUID(*(const __CFString **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 134218242;
      int64_t v7 = v2;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Unread message count: %lld  for chat GUID: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  if (v2) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "sint64_result", v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCountAllUnreadMessagesForChatRowID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3858C;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3858C(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v2 = IMDMessageRecordCountAllUnreadMessagesForChatRowID(*(void *)(a1 + 48));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v6 = 134218240;
      int64_t v7 = v2;
      __int16 v8 = 2048;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Unread message count: %lld  for chat rowID: %lld", (uint8_t *)&v6, 0x16u);
    }
  }
  if (v2) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordLastFailedMessageRowID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3871C;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3871C(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t FailedMessageRowID = IMDMessageRecordLastFailedMessageRowID();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = FailedMessageRowID;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Last failed message rowID: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (FailedMessageRowID) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", FailedMessageRowID);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordLastSyncedMessageRowID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38898;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38898(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t SyncedMessageRowID = IMDMessageRecordLastSyncedMessageRowID();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = SyncedMessageRowID;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Last synced message rowID: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (SyncedMessageRowID) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", SyncedMessageRowID);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordLastFailedMessageDate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38A14;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38A14(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t FailedMessageDate = IMDMessageRecordLastFailedMessageDate();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = FailedMessageDate;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Last failed message rowID: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (FailedMessageDate) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", FailedMessageDate);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordGetMostRecentMessageDate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38B90;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38B90(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t MostRecentMessageDate = IMDMessageRecordGetMostRecentMessageDate();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = MostRecentMessageDate;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Most recent message date: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (MostRecentMessageDate) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", MostRecentMessageDate);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordGetIndentifierForMessageWithGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC38D10;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC38D10(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CFStringRef IndentifierForMessageWithGUID = IMDMessageRecordGetIndentifierForMessageWithGUID(*(CFStringRef *)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      CFStringRef v9 = IndentifierForMessageWithGUID;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Get identifier for message guid: %@  result: %lld", (uint8_t *)&v6, 0x16u);
    }
  }
  if (IndentifierForMessageWithGUID) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 40), "sint64_result", (int64_t)IndentifierForMessageWithGUID);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordMaxMessageIDFromChatMessageJoin_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38EA0;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38EA0(uint64_t a1)
{
  int64_t v2 = IMDMessageRecordMaxMessageIDFromChatMessageJoin();
  if (v2) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "sint64_result", v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __XPCServerIMDMessageRecordGetMessagesSequenceNumber_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC38F80;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC38F80(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t MessagesSequenceNumber = IMDMessageRecordGetMessagesSequenceNumber();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = MessagesSequenceNumber;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Get messages sequence number: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
  if (MessagesSequenceNumber) {
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "int64_result", MessagesSequenceNumber);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkMessageGUIDAsDeduplicated_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC390FC;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC390FC(uint64_t a1)
{
  CFIndex v2 = *(void *)(a1 + 32);
  if (v2) {
    IMDMessageRecordMarkMessageGUIDAsDeduplicated(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkFailedAllUnsentUnfailedMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC391CC;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC391CC(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    CFIndex v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Mark all unsent messages failed", v4, 2u);
    }
  }
  IMDMessageRecordMarkFailedAllUnsentUnfailedMessages();
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordDeleteOrphanedMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC392E8;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC392E8(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    CFIndex v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Delete orphaned messages", v4, 2u);
    }
  }
  IMDMessageRecordDeleteOrphanedMessages();
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyAndMarkAsReadMessagesPriorToGuidMatchingChatGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFC39410;
  v9[3] = &unk_1E5F9D0F8;
  v9[4] = a5;
  v9[5] = a6;
  char v10 = a8;
  void v9[6] = a7;
  v9[7] = a3;
  v9[8] = a4;
  BOOL v8 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v9, v8);
}

uint64_t sub_1AFC39410(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFArrayRef MessagesPriorToGuidMatchingChatGUIDs = IMDMessageRecordCopyAndMarkAsReadMessagesPriorToGuidMatchingChatGUIDs(*(__CFString **)(a1 + 32), *(const __CFArray **)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [(__CFArray *)MessagesPriorToGuidMatchingChatGUIDs count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy messages guids, and mark read, for chatGUIDs: %@ up to guid: %@  (Results: %ld)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [(__CFArray *)MessagesPriorToGuidMatchingChatGUIDs count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        char v10 = (void *)[(__CFArray *)MessagesPriorToGuidMatchingChatGUIDs objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v10 UTF8String]);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    int v12 = *(void **)(a1 + 56);
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (MessagesPriorToGuidMatchingChatGUIDs) {
    CFRelease(MessagesPriorToGuidMatchingChatGUIDs);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyAllUnplayedMessageGUIDsForChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC39664;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC39664(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = IMDMessageRecordCopyAllUnplayedMessageGUIDsForChatGUID(*(const __CFString **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = [(__CFArray *)v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy unplayed audio messages guids, for chat guid: %@  (Results: %ld)", (uint8_t *)&v13, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    int v6 = [(__CFArray *)v2 count];
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        uint64_t v9 = (void *)[(__CFArray *)v2 objectAtIndex:v7];
        xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
        if (v10)
        {
          xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v9 UTF8String]);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v8 != v7);
    }
    xpc_object_t v11 = *(void **)(a1 + 40);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v5);
    }
    xpc_release(v5);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFC398A8;
  v9[3] = &unk_1E5F9D120;
  v9[4] = a5;
  v9[5] = a6;
  void v9[6] = a8;
  v9[7] = a3;
  v9[8] = a4;
  void v9[9] = a7;
  BOOL v8 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v9, v8);
}

uint64_t sub_1AFC398A8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 48));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v7 = *(void *)(a1 + 48);
      int v16 = 138413314;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      __int16 v24 = 2048;
      uint64_t v25 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy unread incoming messages chatIdentifiers:%@   services: %@   limit: %lld  fallbackGUID:%@ (Result: %lu)", (uint8_t *)&v16, 0x34u);
    }
  }
  xpc_object_t v8 = xpc_array_create(0, 0);
  if (v8)
  {
    int v9 = [v2 count];
    if (v9 >= 1)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v9;
      do
      {
        uint64_t v12 = [v2 objectAtIndex:v10];
        xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
        if (v13)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v12, (uint64_t)v13, 1, 0);
          xpc_array_append_value(v8, v13);
          xpc_release(v13);
        }
        ++v10;
      }
      while (v11 != v10);
    }
    uint64_t v14 = *(void **)(a1 + 56);
    if (v14) {
      xpc_dictionary_set_value(v14, "array_result", v8);
    }
    xpc_release(v8);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesDataDetectionResults_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC39B20;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC39B20(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyMessagesDataDetectionResults(a1[6], a1[7]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[6];
      uint64_t v5 = a1[7];
      int v14 = 134218496;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy DD result messages up to rowID: %lld  limit: %lld   (Result: %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    uint64_t v12 = (void *)a1[4];
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesWithReplyToGUIDs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC39D78;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC39D78(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyMessagesWithReplyToGUIDs(*(void **)(a1 + 32));
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy messages with reply to guid %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v2)
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    if (v5)
    {
      int v6 = [v2 count];
      if (v6 >= 1)
      {
        uint64_t v7 = 0;
        uint64_t v8 = v6;
        do
        {
          uint64_t v9 = [v2 objectAtIndex:v7];
          xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
          if (v10)
          {
            _IMDMessageRecordBulkCopyXPCDictionary(v9, (uint64_t)v10, 1, 0);
            xpc_array_append_value(v5, v10);
            xpc_release(v10);
          }
          ++v7;
        }
        while (v8 != v7);
      }
      xpc_object_t v11 = *(void **)(a1 + 40);
      if (v11) {
        xpc_dictionary_set_value(v11, "array_result", v5);
      }
      xpc_release(v5);
    }
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyNewestUnreadIncomingMessagesToLimitAfterRowID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC39FAC;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC39FAC(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyNewestUnreadIncomingMessagesToLimitAfterRowID(a1[6], a1[7]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[6];
      uint64_t v5 = a1[7];
      int v14 = 134218496;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy newest unread incoming messages up to rowID: %lld  limit: %lld   (Result: %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    uint64_t v12 = (void *)a1[4];
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3A204;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3A204(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate(a1[6], a1[7]);
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[6];
      uint64_t v5 = a1[7];
      int v14 = 134218496;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2048;
      uint64_t v19 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Copy newest failed outgoing messages up to date: %lld  limit: %lld   (Result: %lu)", (uint8_t *)&v14, 0x20u);
    }
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (v6)
  {
    int v7 = [v2 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        uint64_t v10 = [v2 objectAtIndex:v8];
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        if (v11)
        {
          _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1, 0);
          xpc_array_append_value(v6, v11);
          xpc_release(v11);
        }
        ++v8;
      }
      while (v9 != v8);
    }
    uint64_t v12 = (void *)a1[4];
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v6);
    }
    xpc_release(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMostRecentUseageOfAddresses_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3A45C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3A45C(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = (void *)IMDMessageRecordCopyMostRecentUseageOfAddresses(*(const __CFArray **)(a1 + 32));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = (void *)[v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          uint64_t v10 = v9;
          xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v8 UTF8String]);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    xpc_object_t v11 = *(void **)(a1 + 40);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      __int16 v18 = v2;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Copy most recent usage of addresses: %@   result: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCreate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, long long a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,long long a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,long long a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,long long a43,uint64_t a44,uint64_t a45,long long a46,long long a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1AFC3A7D0;
  v51[3] = &unk_1E5F9D148;
  v51[4] = a12;
  v51[5] = a14;
  v51[6] = a31;
  v51[7] = a5;
  v51[8] = a13;
  v51[9] = a17;
  v51[10] = a39;
  uint64_t v74 = a20;
  uint64_t v75 = a7;
  uint64_t v76 = a8;
  long long v77 = a9;
  uint64_t v78 = a10;
  uint64_t v54 = a21;
  uint64_t v55 = a24;
  long long v80 = a22;
  uint64_t v79 = a11;
  uint64_t v81 = a23;
  uint64_t v82 = a25;
  uint64_t v83 = a26;
  uint64_t v84 = a28;
  uint64_t v85 = a29;
  uint64_t v56 = a27;
  uint64_t v57 = a32;
  uint64_t v86 = a30;
  uint64_t v87 = a34;
  uint64_t v58 = a33;
  uint64_t v59 = a35;
  uint64_t v61 = a38;
  uint64_t v62 = a40;
  uint64_t v63 = a41;
  uint64_t v88 = a36;
  uint64_t v89 = a42;
  uint64_t v65 = a44;
  uint64_t v66 = a45;
  uint64_t v91 = a49;
  uint64_t v92 = a50;
  uint64_t v68 = a48;
  uint64_t v69 = a18;
  uint64_t v72 = a4;
  uint64_t v73 = a6;
  uint64_t v70 = a19;
  long long v52 = a15;
  long long v53 = a16;
  long long v60 = a37;
  long long v64 = a43;
  long long v90 = a46;
  long long v67 = a47;
  uint64_t v71 = a3;
  BOOL v50 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v51, v50);
}

uint64_t sub_1AFC3A7D0(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 unsignedLongLongValue];
  int v5 = *(void **)(a1 + 48);
  if ((v4 & 0x100000) != 0)
  {
    uint64_t v32 = v2;
    goto LABEL_24;
  }
  uint64_t v6 = *(void **)(a1 + 56);
  uint64_t v7 = (void *)[(id)JWDecodeCodableObjectWithStandardAllowlist() mutableCopy];
  if (![v6 length]) {
    [v7 string];
  }
  if ([MEMORY[0x1E4F6E730] supportsDataDetectors]
    && (unint64_t)[v7 length] < 0xFA0)
  {
    [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)*(uint64_t *)(a1 + 296)];
    if (IMDDScanAttributedStringWithExtendedContext())
    {
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v4 | 0x110000];
      uint64_t v3 = JWEncodeCodableObject();
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v4 | 0x100000];
    }
    if ((v4 & 4) == 0)
    {
LABEL_13:
      if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x1E4F6CAF0]])
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F6E8D8]);
        uint64_t v10 = (void *)[v9 createOTCFromMessageBody:v7 sender:*(void *)(a1 + 72) guid:*(void *)(a1 + 64)];
        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            xpc_object_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              uint64_t v12 = *(void *)(a1 + 64);
              *(_DWORD *)buf = 138412290;
              uint64_t v35 = v12;
              _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Creating chat bot message containing OTC guid: %@", buf, 0xCu);
            }
          }
          int v5 = 0;
        }
        if (v9) {

        }
        if (v10) {
      }
        }
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v4 | 0x100000];
    if ((v4 & 4) == 0) {
      goto LABEL_13;
    }
  }

  uint64_t v32 = (void *)v8;
LABEL_24:
  long long v13 = *(_OWORD *)(a1 + 88);
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v15 = *(_OWORD *)(a1 + 360);
  long long v16 = *(_OWORD *)(a1 + 376);
  __int16 v17 = IMDMessageRecordCreate(0, *(void *)(a1 + 304), *(void *)(a1 + 56), *(void *)(a1 + 296), *(void *)(a1 + 312), *(void *)(a1 + 320), *(void *)(a1 + 328), *(void *)(a1 + 336), *(void *)(a1 + 344), *(void *)(a1 + 352), v32, *(void *)(a1 + 64), v3, v13, *((uint64_t *)&v13 + 1), *(void *)(a1 + 104), *(void *)(a1 + 112), 0, 0,
          0,
          v14,
          *((uint64_t *)&v14 + 1),
          v15,
          *((uint64_t *)&v15 + 1),
          v16,
          *((uint64_t *)&v16 + 1),
          *(void *)(a1 + 392),
          *(void *)(a1 + 136),
          *(void *)(a1 + 400),
          *(void *)(a1 + 408),
          *(void *)(a1 + 416),
          (uint64_t)v5,
          *(void *)(a1 + 144),
          *(void *)(a1 + 152),
          *(void *)(a1 + 424),
          *(void *)(a1 + 160),
          *(void *)(a1 + 432),
          *(void *)(a1 + 168),
          *(void *)(a1 + 176),
          *(void *)(a1 + 184),
          0,
          *(void *)(a1 + 192),
          *(void *)(a1 + 200),
          *(void *)(a1 + 440),
          *(void *)(a1 + 208),
          *(void *)(a1 + 216),
          *(void *)(a1 + 224),
          *(void *)(a1 + 232),
          *(void *)(a1 + 448),
          *(void *)(a1 + 456),
          *(void *)(a1 + 240),
          *(void *)(a1 + 248),
          *(void *)(a1 + 256),
          *(void *)(a1 + 464),
          *(void *)(a1 + 472));
  if (v17)
  {
    CFStringRef v18 = *(const __CFString **)(a1 + 72);
    if (v18)
    {
      uint64_t v19 = (const void *)IMDHandleRecordCopyHandleForIDOnService(v18, *(const __CFString **)(a1 + 88));
      if (v19) {
        goto LABEL_30;
      }
      uint64_t v20 = *(void *)(a1 + 72);
      uint64_t v21 = *(void *)(a1 + 264);
      if (!v21) {
        uint64_t v21 = IMCountryCodeForIncomingTextMessage();
      }
      uint64_t v19 = IMDHandleRecordCreate(*MEMORY[0x1E4F1CF80], v20, v21, *(void **)(a1 + 88), *(void *)(a1 + 272), 0);
      if (v19)
      {
LABEL_30:
        IMDMessageRecordSetHandle((uint64_t)v17, (uint64_t)v19);
        IMDSMSRecordStoreInvalidateCaches();
        CFRelease(v19);
      }
    }
    CFStringRef v22 = *(const __CFString **)(a1 + 120);
    if (v22)
    {
      uint64_t v23 = (const void *)IMDHandleRecordCopyHandleForIDOnService(v22, *(const __CFString **)(a1 + 88));
      if (v23) {
        goto LABEL_36;
      }
      uint64_t v24 = *(void *)(a1 + 120);
      uint64_t v25 = *(void *)(a1 + 264);
      if (!v25) {
        uint64_t v25 = IMCountryCodeForIncomingTextMessage();
      }
      uint64_t v23 = IMDHandleRecordCreate(*MEMORY[0x1E4F1CF80], v24, v25, *(void **)(a1 + 88), *(void *)(a1 + 272), 0);
      if (v23)
      {
LABEL_36:
        IMDMessageRecordSetOtherHandle((uint64_t)v17, (uint64_t)v23);
        IMDSMSRecordStoreInvalidateCaches();
        CFRelease(v23);
      }
    }
  }
  if ([v5 isEqualToString:IMBalloonExtensionIDWithSuffix()])
  {
    IMProcessPeerPaymentMessageWithPayloadData();
  }
  else if ([v5 isEqualToString:IMBalloonExtensionIDWithSuffix()])
  {
    IMProcessPhotosExtensionMessageWithPayloadData();
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F6CC10]])
  {
    IMProcessRichLinkMessageWithBody();
  }
  else if ([v5 isEqualToString:IMBalloonExtensionIDWithSuffix()])
  {
    if (*(void *)(a1 + 72))
    {
      uint64_t v33 = *(void *)(a1 + 72);
      objc_msgSend((id)objc_msgSend(IMDCNRecordIDForAliases(objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v33, 1)), "objectForKey:", *(void *)(a1 + 72)), "isEqualToString:", @"__kIMDCNPersonNotFound");
    }
    IMProcessGameCenterMessageWithPayloadData();
  }
  int v26 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v26)
    {
      __int16 v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v28;
        _os_log_impl(&dword_1AFB53000, v27, OS_LOG_TYPE_INFO, "Created message with guid: %@", buf, 0xCu);
      }
    }
    _IMDMessageRecordBulkCopyXPCDictionary((uint64_t)v17, *(void *)(a1 + 280), 0, 0);
    CFRelease(v17);
  }
  else if (v26)
  {
    __int16 v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v30;
      _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "Failed to create message with guid: %@", buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 288);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3AEC0;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3AEC0(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = IMDMessageRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)IMDMessageRecordCopyChats((uint64_t)v2);
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = a1[6];
        int v17 = 134218240;
        uint64_t v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = [v4 count];
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Copy chats from message ID: %lld  (Results: %lu)", (uint8_t *)&v17, 0x16u);
      }
    }
    xpc_object_t v7 = xpc_array_create(0, 0);
    if (v7)
    {
      int v8 = [v4 count];
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = v8;
        do
        {
          uint64_t v11 = [v4 objectAtIndex:v9];
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          if (v12)
          {
            _IMDChatRecordBulkCopyXPCDictionary(v11, (uint64_t)v12, 0, 0, 0, 1);
            xpc_array_append_value(v7, v12);
            xpc_release(v12);
          }
          ++v9;
        }
        while (v10 != v9);
      }
      long long v13 = (void *)a1[4];
      if (v13) {
        xpc_dictionary_set_value(v13, "array_result", v7);
      }
      xpc_release(v7);
    }
    if (v4) {
      CFRelease(v4);
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = a1[6];
      int v17 = 134217984;
      uint64_t v18 = v15;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Tried to copy chats from message ID: %lld, but no message found", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordChatForMessageGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3B19C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3B19C(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = IMDMessageRecordChatForMessageGUID(*(CFStringRef *)(a1 + 32));
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v9 = 138412546;
        CFStringRef v10 = v2;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Found chat: %@  for message GUID: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 40), 0, 0, 0, 1);
    CFRelease(v2);
  }
  else if (v3)
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = *(const __CFString **)(a1 + 32);
      int v9 = 138412290;
      CFStringRef v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Tried to find chat from message GUID: %@, but no chat was found", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyAttachments_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3B3A4;
  v5[3] = &unk_1E5F9CE50;
  void v5[5] = a4;
  void v5[6] = a5;
  v5[4] = a3;
  IMDPersistencePerformBlock(v5, 1);
}

uint64_t sub_1AFC3B3A4(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = IMDMessageRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = (void *)IMDMessageRecordCopyAttachments((uint64_t)v2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = a1[6];
        int v17 = 134218240;
        uint64_t v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = [v4 count];
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Copy attachments from message ID: %lld  (Results: %lu)", (uint8_t *)&v17, 0x16u);
      }
    }
    xpc_object_t v7 = xpc_array_create(0, 0);
    if (v7)
    {
      int v8 = [v4 count];
      if (v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = v8;
        do
        {
          uint64_t v11 = [v4 objectAtIndex:v9];
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          if (v12)
          {
            _IMDAttachmentRecordBulkCopyXPCDictionary(v11, (uint64_t)v12, 1);
            xpc_array_append_value(v7, v12);
            xpc_release(v12);
          }
          ++v9;
        }
        while (v10 != v9);
      }
      uint64_t v13 = (void *)a1[4];
      if (v13) {
        xpc_dictionary_set_value(v13, "array_result", v7);
      }
      xpc_release(v7);
    }
    if (v4) {
      CFRelease(v4);
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = a1[6];
      int v17 = 134217984;
      uint64_t v18 = v15;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Tried to copy attachments from message ID: %lld, but no attachments found", (uint8_t *)&v17, 0xCu);
    }
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordSetHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3B674;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a6;
  v7[6] = a5;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3B674(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const void *)IMDHandleRecordCreateFromRecordID(0, a1[5]);
  int v3 = IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  int v4 = IMOSLoggingEnabled();
  if (v3) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (v4)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = a1[5];
        uint64_t v11 = a1[6];
        int v13 = 134218240;
        uint64_t v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = v11;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Setting handle ID: %lld  on message ID: %lld", (uint8_t *)&v13, 0x16u);
      }
    }
    IMDMessageRecordSetHandle((uint64_t)v3, (uint64_t)v2);
LABEL_15:
    CFRelease(v3);
    goto LABEL_16;
  }
  if (v4)
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[6];
      int v13 = 134218754;
      uint64_t v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v2;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Failed to set handle (%lld) on message (%lld)   (Message: %@  Handle: %@)", (uint8_t *)&v13, 0x2Au);
    }
  }
  if (v3) {
    goto LABEL_15;
  }
LABEL_16:
  if (v2) {
    CFRelease(v2);
  }
  IMDSMSRecordStoreInvalidateCaches();
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3B8CC;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3B8CC(uint64_t *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const __CFArray **)IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  if (v2)
  {
    int v3 = v2;
    int v4 = IMDMessageRecordCopyHandle(v2);
    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        BOOL v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = a1[6];
          int v13 = 138412546;
          uint64_t v14 = v4;
          __int16 v15 = 2048;
          uint64_t v16 = v7;
          _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Copied handle: %@  for message ID: %lld", (uint8_t *)&v13, 0x16u);
        }
      }
      _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v4, a1[4], 1);
      CFRelease(v4);
    }
    else if (v5)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = a1[6];
        int v13 = 134217984;
        uint64_t v14 = (void *)v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Tried to copy handle from Message ID: %lld, but no handle was found", (uint8_t *)&v13, 0xCu);
      }
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[6];
      int v13 = 134217984;
      uint64_t v14 = (void *)v9;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Tried to copy handle from Message ID: %lld, but no message was found", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyOtherHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3BB60;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3BB60(uint64_t *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const __CFArray **)IMDMessageRecordCreateFromRecordIDWithLock(0, a1[6], 1);
  if (v2)
  {
    int v3 = v2;
    int v4 = IMDMessageRecordCopyOtherHandle(v2);
    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        BOOL v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = a1[6];
          int v13 = 138412546;
          uint64_t v14 = v4;
          __int16 v15 = 2048;
          uint64_t v16 = v7;
          _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Copied other handle: %@  for message ID: %lld", (uint8_t *)&v13, 0x16u);
        }
      }
      _IMDHandleRecordBulkCopyXPCDictionary((uint64_t)v4, a1[4], 1);
      CFRelease(v4);
    }
    else if (v5)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = a1[6];
        int v13 = 134217984;
        uint64_t v14 = (void *)v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Tried to copy other handle from Message ID: %lld, but no handle was found", (uint8_t *)&v13, 0xCu);
      }
    }
    CFRelease(v3);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = a1[6];
      int v13 = 134217984;
      uint64_t v14 = (void *)v9;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Tried to copy other handle from Message ID: %lld, but no message was found", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, long long a11, long long a12, long long a13, uint64_t a14, uint64_t a15, long long a16, uint64_t a17, long long a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,long long a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,long long a31,long long a32,uint64_t a33,uint64_t a34,long long a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,long long a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1AFC3BF08;
  v44[3] = &unk_1E5F9D170;
  uint64_t v63 = a5;
  uint64_t v64 = a6;
  v44[4] = a7;
  long long v66 = a9;
  uint64_t v65 = a8;
  uint64_t v67 = a10;
  uint64_t v48 = a15;
  long long v69 = a16;
  uint64_t v68 = a14;
  uint64_t v70 = a17;
  uint64_t v49 = a20;
  uint64_t v72 = a19;
  uint64_t v73 = a21;
  uint64_t v50 = a23;
  long long v75 = a24;
  uint64_t v74 = a22;
  uint64_t v76 = a25;
  uint64_t v51 = a26;
  uint64_t v52 = a27;
  uint64_t v53 = a29;
  uint64_t v77 = a28;
  uint64_t v78 = a30;
  long long v54 = a31;
  long long v55 = a32;
  uint64_t v56 = a33;
  uint64_t v58 = a36;
  uint64_t v59 = a37;
  uint64_t v79 = a34;
  uint64_t v80 = a38;
  uint64_t v81 = a39;
  uint64_t v82 = a42;
  uint64_t v83 = a43;
  uint64_t v61 = a41;
  uint64_t v62 = a4;
  long long v45 = a11;
  long long v46 = a12;
  long long v47 = a13;
  long long v71 = a18;
  long long v57 = a35;
  long long v60 = a40;
  BOOL v43 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v44, v43);
}

uint64_t sub_1AFC3BF08(uint64_t a1)
{
  CFStringRef v2 = IMDMessageRecordCreateFromRecordIDWithLock(0, *(void *)(a1 + 240), 1);
  if (v2)
  {
    long long v6 = *(_OWORD *)(a1 + 112);
    int v3 = v2;
    IMDMessageRecordBulkUpdate((uint64_t)v2, *(void *)(a1 + 248), *(void *)(a1 + 32), *(void *)(a1 + 256), *(void *)(a1 + 264), *(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 288), *(void *)(a1 + 88), *(void *)(a1 + 296), *(void *)(a1 + 304), *(void *)(a1 + 312), *(void *)(a1 + 96),
      *(void *)(a1 + 320),
      *(void *)(a1 + 328),
      *(void *)(a1 + 336),
      *(void *)(a1 + 344),
      *(void *)(a1 + 352),
      *(void *)(a1 + 104),
      *(void *)(a1 + 360),
      *(void *)(a1 + 368),
      *(void *)(a1 + 376),
      v6,
      *((uint64_t *)&v6 + 1),
      *(void *)(a1 + 384),
      *(void *)(a1 + 128),
      *(void *)(a1 + 392),
      *(void *)(a1 + 136),
      *(void *)(a1 + 144),
      *(void *)(a1 + 152),
      *(void *)(a1 + 160),
      *(void *)(a1 + 168),
      *(void *)(a1 + 400),
      *(void *)(a1 + 176),
      *(void *)(a1 + 184),
      *(void *)(a1 + 192),
      *(void *)(a1 + 200),
      *(void *)(a1 + 408),
      *(void *)(a1 + 416),
      *(void *)(a1 + 208),
      *(void *)(a1 + 216),
      *(void *)(a1 + 224),
      *(void *)(a1 + 424),
      *(void *)(a1 + 432));
    CFRelease(v3);
  }
  uint64_t result = *(void *)(a1 + 232);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDMessagePTaskInsertRow_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3C160;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3C160(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      uint64_t v4 = a1[6];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2048;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Inserting Message Processing Task with (guid: %@, taskflags: %ld)", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessagePTaskInsertRow(a1[4], a1[6]);
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessagePTaskSelectWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3C2D4;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3C2D4(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (void *)IMDMessagePTaskSelectWithLimit(a1[6]);
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[6];
      *(_DWORD *)buf = 134218240;
      uint64_t v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = [v2 count];
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Coping first %ld Message Processing Task (Results: %ld)", buf, 0x16u);
    }
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    if ([v2 count])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = (void *)[v2 objectAtIndex:v6];
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        if (v8)
        {
          if ([v7 objectForKeyedSubscript:@"guid"])
          {
            uint64_t v11 = [v7 objectForKeyedSubscript:@"guid"];
            uint64_t v12 = 0;
            IMInsertNSStringsToXPCDictionary();
          }
          if (objc_msgSend(v7, "objectForKeyedSubscript:", @"task_flags", v11, v12))
          {
            uint64_t v11 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"task_flags"), "intValue");
            uint64_t v12 = 0;
            IMInsertIntsToXPCDictionary();
          }
          xpc_array_append_value(v5, v8);
          xpc_release(v8);
        }
        ++v6;
      }
      while (v6 < objc_msgSend(v2, "count", v11, v12));
    }
    uint64_t v9 = (void *)a1[4];
    if (v9) {
      xpc_dictionary_set_value(v9, "array_result", v5);
    }
    xpc_release(v5);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessagePTaskUpdateTaskFlagsForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3C580;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3C580(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[6];
      uint64_t v4 = a1[4];
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Updating task_flags to %ld for Message Processing Task with guid: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  IMDMessagePTaskUpdateTaskFlagsForGUID(a1[4], a1[6]);
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessagePTaskDeleteAllCompletedTask_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3C6F0;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3C6F0(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    CFStringRef v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Deleting all completed task from Message Processing Table", v4, 2u);
    }
  }
  IMDMessagePTaskDeleteAllCompletedTask();
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatRecordCreate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long a11, long long a12, long long a13, uint64_t a14, long long a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21,long long a22,uint64_t a23)
{
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1AFC3C878;
  v24[3] = &unk_1E5F9D198;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  v24[4] = a7;
  v24[5] = a8;
  long long v25 = a9;
  long long v26 = a10;
  long long v27 = a11;
  long long v28 = a12;
  long long v37 = a13;
  long long v29 = a15;
  uint64_t v38 = a14;
  uint64_t v39 = a16;
  uint64_t v40 = a18;
  uint64_t v30 = a17;
  uint64_t v31 = a19;
  long long v41 = a21;
  long long v42 = a22;
  uint64_t v43 = a23;
  uint64_t v32 = a20;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  BOOL v23 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v24, v23);
}

void sub_1AFC3C878(uint64_t *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = IMDChatRecordCreate(0, a1[21], a1[22], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[23], a1[24], a1[25], a1[14], a1[15], a1[26],
         a1[16],
         a1[27],
         a1[17],
         a1[18],
         a1[28],
         a1[29],
         a1[30],
         a1[31],
         a1[32]);
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a1[8];
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2048;
        uint64_t v12 = v2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Created chat with guid: %@  (0x%p)", buf, 0x16u);
      }
    }
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, a1[19], 0, 0, 1, 1);
  }
  else if (v3)
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[8];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Failed to create chat with guid: %@", buf, 0xCu);
    }
  }
  uint64_t v8 = a1[20];
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
  if (v2) {
    CFRelease(v2);
  }
}

void __XPCServerIMDChatRecordCopyHandles_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3CAFC;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3CAFC(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    int v3 = v2;
    BOOL v4 = IMDChatRecordCopyHandles(v2);
    xpc_object_t v5 = xpc_array_create(0, 0);
    if (v5)
    {
      int v6 = v5;
      int v7 = [v4 count];
      if (v7 >= 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = v7;
        do
        {
          uint64_t v10 = [v4 objectAtIndex:v8];
          xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
          if (v11)
          {
            uint64_t v12 = v11;
            _IMDHandleRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 1);
            xpc_array_append_value(v6, v12);
            xpc_release(v12);
          }
          ++v8;
        }
        while (v9 != v8);
      }
      uint64_t v13 = (void *)a1[4];
      if (v13) {
        xpc_dictionary_set_value(v13, "array_result", v6);
      }
      xpc_release(v6);
    }
    if (v4) {
      CFRelease(v4);
    }
    CFRelease(v3);
  }
  uint64_t result = a1[5];
  if (result)
  {
    __int16 v15 = *(uint64_t (**)(void))(result + 16);
    return v15();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyMessagesWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3CCBC;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3CCBC(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[6]);
  if (v2)
  {
    int v3 = v2;
    BOOL v4 = (void *)IMDChatRecordCopyMessagesWithLimit((uint64_t)v2, a1[7]);
    xpc_object_t v5 = xpc_array_create(0, 0);
    if (v5)
    {
      BOOL v6 = v5;
      int v7 = [v4 count];
      if (v7 >= 1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = v7;
        do
        {
          uint64_t v10 = [v4 objectAtIndex:v8];
          xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
          if (v11)
          {
            uint64_t v12 = v11;
            _IMDMessageRecordBulkCopyXPCDictionary(v10, (uint64_t)v11, 0, 0);
            xpc_array_append_value(v6, v12);
            xpc_release(v12);
          }
          ++v8;
        }
        while (v9 != v8);
      }
      uint64_t v13 = (void *)a1[4];
      if (v13) {
        xpc_dictionary_set_value(v13, "array_result", v6);
      }
      xpc_release(v6);
    }
    if (v4) {
      CFRelease(v4);
    }
    CFRelease(v3);
  }
  uint64_t result = a1[5];
  if (result)
  {
    __int16 v15 = *(uint64_t (**)(void))(result + 16);
    return v15();
  }
  return result;
}

void __XPCServerIMDChatRecordSetIsArchived_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3CE88;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3CE88(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    int v3 = v2;
    IMDChatRecordSetIsArchived((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  uint64_t result = a1[4];
  if (result)
  {
    xpc_object_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDChatRecordSetIsBlackholed_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3CF74;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3CF74(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    int v3 = v2;
    IMDChatRecordSetIsBlackholed((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  uint64_t result = a1[4];
  if (result)
  {
    xpc_object_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDChatRecordSetIsRecovered_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3D060;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3D060(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    int v3 = v2;
    IMDChatRecordSetIsRecovered((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  uint64_t result = a1[4];
  if (result)
  {
    xpc_object_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDChatRecordSetIsDeletingIncomingMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3D14C;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3D14C(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  if (v2)
  {
    int v3 = v2;
    IMDChatRecordSetIsDeletingIncomingMessages((uint64_t)v2, a1[6]);
    CFRelease(v3);
  }
  uint64_t result = a1[4];
  if (result)
  {
    xpc_object_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDChatRecordAddHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3D238;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3D238(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  uint64_t v3 = IMDHandleRecordCreateFromRecordID(0, a1[6]);
  BOOL v4 = (const void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    IMDChatRecordAddHandle((uint64_t)v2, v3);
  }
  CFRelease(v2);
LABEL_8:
  if (v4) {
    CFRelease(v4);
  }
  uint64_t result = a1[4];
  if (result)
  {
    int v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordRemoveHandle_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3D360;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3D360(void *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[5]);
  uint64_t v3 = IMDHandleRecordCreateFromRecordID(0, a1[6]);
  BOOL v4 = (const void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    IMDChatRecordRemoveHandle((uint64_t)v2, v3);
  }
  CFRelease(v2);
LABEL_8:
  if (v4) {
    CFRelease(v4);
  }
  uint64_t result = a1[4];
  if (result)
  {
    int v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordBulkUpdate_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long a11, long long a12, uint64_t a13, long long a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long a23,long long a24,uint64_t a25)
{
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1AFC3D4EC;
  v26[3] = &unk_1E5F9D1C0;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  v26[4] = a8;
  long long v27 = a9;
  long long v28 = a10;
  long long v29 = a11;
  long long v30 = a12;
  long long v41 = a14;
  uint64_t v31 = a13;
  uint64_t v32 = a16;
  uint64_t v42 = a15;
  uint64_t v43 = a18;
  uint64_t v33 = a17;
  uint64_t v34 = a19;
  uint64_t v44 = a20;
  uint64_t v35 = a21;
  uint64_t v36 = a22;
  long long v45 = a23;
  long long v46 = a24;
  uint64_t v47 = a25;
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  BOOL v25 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v26, v25);
}

uint64_t sub_1AFC3D4EC(uint64_t *a1)
{
  CFStringRef v2 = IMDChatRecordCreateFromRecordID(0, a1[20]);
  if (v2)
  {
    uint64_t v3 = v2;
    IMDChatRecordBulkUpdate((uint64_t)v2, a1[21], a1[22], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[23], a1[24], a1[25], a1[14], a1[15], a1[26],
      a1[16],
      a1[27],
      a1[17],
      a1[18],
      a1[28],
      a1[29],
      a1[30],
      a1[31],
      a1[32]);
    CFRelease(v3);
  }
  uint64_t result = a1[19];
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyAllChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3D660;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  void v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3D660(uint64_t a1)
{
  CFStringRef v2 = (void *)IMDChatRecordCopyAllChats();
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          uint64_t v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0, 0, 1);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    xpc_object_t v11 = *(void **)(a1 + 32);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyAllNamedChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3D80C;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  void v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3D80C(uint64_t a1)
{
  CFStringRef v2 = (void *)IMDChatRecordCopyAllNamedChats();
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          uint64_t v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0, 0, 1);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    xpc_object_t v11 = *(void **)(a1 + 32);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyAllActiveChatsProgressivelyWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1AFC3D9C4;
    v7[3] = &unk_1E5F9CF18;
    v7[4] = a3;
    v7[5] = a4;
    v7[6] = a5;
    void v7[7] = a6;
    BOOL v6 = sub_1AFC2EAF8(a3);
    IMDPersistencePerformBlock(v7, v6);
  }
}

void sub_1AFC3D9C4(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v33 startTimingForKey:@"goFetchAllActiveChatsProgressively"];
  uint64_t v31 = a1;
  if (qword_1E9AF7490 == a1[6])
  {
LABEL_17:
    xpc_object_t v10 = xpc_array_create(0, 0);
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1E9AF7F40);
    CFIndex v12 = qword_1EB5ABB20;
    if (qword_1EB5ABB20 < Count)
    {
      uint64_t v13 = qword_1EB5ABB20 + 250;
      do
      {
        xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1E9AF7F40, v12);
        uint64_t v16 = (const void *)[MEMORY[0x1E4F28ED0] numberWithLongLong:IMDChatRecordGetIdentifier((uint64_t)ValueAtIndex)];
        if (qword_1E9AF83A8)
        {
          Value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1E9AF83A8, v16);
          uint64_t v18 = Value;
          if (Value)
          {
            char v19 = objc_msgSend((id)objc_msgSend(Value, "objectForKeyedSubscript:", @"l"), "BOOLValue");
            int64_t v20 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", @"d"), "integerValue");
          }
          else
          {
            char v19 = 0;
            int64_t v20 = -1;
          }
        }
        else
        {
          int64_t v20 = -1;
          char v19 = 1;
        }
        _IMDChatRecordBulkCopyXPCDictionary((uint64_t)ValueAtIndex, (uint64_t)v14, 1, 0, v19, 1);
        xpc_dictionary_set_int64(v14, "last_message_date_on_load", v20);
        uint64_t v21 = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_1E9AF7F48, v16);
        if (v21) {
          int64_t v22 = [v21 longLongValue];
        }
        else {
          int64_t v22 = 0;
        }
        xpc_dictionary_set_int64(v14, "unread_count_cache", v22);
        xpc_array_append_value(v10, v14);
        xpc_release(v14);
        ++qword_1EB5ABB20;
        if (v12 + 1 >= Count) {
          break;
        }
      }
      while (v12++ < v13);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v35 = qword_1EB5ABB20;
        __int16 v36 = 2048;
        CFIndex v37 = Count;
        _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "Progressive chat send progress: %lu out of %lu", buf, 0x16u);
      }
    }
    xpc_dictionary_set_value((xpc_object_t)v31[4], "array_result", v10);
    xpc_release(v10);
    BOOL v25 = (void *)v31[4];
    if (qword_1EB5ABB20 == Count)
    {
      xpc_dictionary_set_BOOL(v25, "complete", 1);
      qword_1E9AF7490 = -1;
      if (qword_1E9AF7F40)
      {
        CFRelease((CFTypeRef)qword_1E9AF7F40);
        qword_1E9AF7F40 = 0;
      }
      if (qword_1E9AF83A8)
      {
        CFRelease((CFTypeRef)qword_1E9AF83A8);
        qword_1E9AF83A8 = 0;
      }
      if (qword_1E9AF7F48)
      {
        CFRelease((CFTypeRef)qword_1E9AF7F48);
        qword_1E9AF7F48 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        long long v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v35 = qword_1EB5ABB20;
          _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Progressive chat send complete with %lu chats sent", buf, 0xCu);
        }
      }
    }
    else
    {
      xpc_dictionary_set_BOOL(v25, "complete", 0);
    }
    objc_msgSend(v33, "stopTimingForKey:", @"goFetchAllActiveChatsProgressively", v31);

    uint64_t v27 = *(void *)(v32 + 40);
    if (v27) {
      (*(void (**)(void))(v27 + 16))();
    }
    return;
  }
  if (qword_1E9AF7F40)
  {
    CFRelease((CFTypeRef)qword_1E9AF7F40);
    qword_1E9AF7F40 = 0;
  }
  if (qword_1E9AF83A8)
  {
    CFRelease((CFTypeRef)qword_1E9AF83A8);
    qword_1E9AF83A8 = 0;
  }
  if (qword_1E9AF7F48)
  {
    CFRelease((CFTypeRef)qword_1E9AF7F48);
    qword_1E9AF7F48 = 0;
  }
  CFArrayRef active = (const __CFArray *)IMDChatRecordCopyAllActiveChats();
  qword_1E9AF7F40 = (uint64_t)active;
  qword_1EB5ABB20 = 0;
  qword_1E9AF7490 = a1[6];
  if (active)
  {
    if ((uint64_t)a1[7] >= 1)
    {
      CFIndex v3 = CFArrayGetCount(active);
      uint64_t v4 = a1[7];
      if (v3 > v4)
      {
        qword_1E9AF83A8 = (uint64_t)IMDChatRowIDsMostRecentByLastMessageWithLimit(v4);
        if (IMOSLoggingEnabled())
        {
          int v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            uint64_t v6 = a1[7];
            *(_DWORD *)buf = 134218240;
            uint64_t v35 = v6;
            __int16 v36 = 2048;
            CFIndex v37 = CFDictionaryGetCount((CFDictionaryRef)qword_1E9AF83A8);
            _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Enforcing lastMessage load limit of %lld, found %lu chats with messages", buf, 0x16u);
          }
        }
      }
    }
    CFIndex v7 = CFArrayGetCount((CFArrayRef)qword_1E9AF7F40);
    qword_1E9AF7F48 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)&unk_1F084C668);
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        CFIndex v9 = CFArrayGetCount((CFArrayRef)qword_1E9AF7F40);
        *(_DWORD *)buf = 134218240;
        uint64_t v35 = v9;
        __int16 v36 = 2048;
        CFIndex v37 = 250;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Received new copy all chats request (total: %ld, batch size: %ld)", buf, 0x16u);
      }
    }
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    long long v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Got nil for all active chats, aborting progressive copy all chats request early", buf, 2u);
    }
  }
  qword_1E9AF7490 = -1;
  long long v29 = (void *)a1[4];
  if (v29) {
    xpc_dictionary_set_BOOL(v29, "complete", 1);
  }
  uint64_t v30 = a1[5];
  if (v30) {
    (*(void (**)(void))(v30 + 16))();
  }
}

void sub_1AFC3E038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (const void *)[MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
  int v5 = (const void *)[MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  uint64_t v6 = (__CFDictionary *)qword_1E9AF7F48;
  CFDictionarySetValue(v6, v4, v5);
}

void __XPCServerIMDChatRecordCopyAllActiveChatsWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3E11C;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3E11C(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v23 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v23 startTimingForKey:@"goFetchAllActiveChats"];
  CFArrayRef active = (void *)IMDChatRecordCopyAllActiveChats();
  xpc_object_t xarray = xpc_array_create(0, 0);
  int v3 = [active count];
  id MessageWithLimit = 0;
  int64_t v22 = a1;
  uint64_t v4 = a1[6];
  BOOL v6 = v4 > 0 && v4 < v3;
  if (v6)
  {
    id MessageWithLimit = IMDChatRowIDsMostRecentByLastMessageWithLimit(v4);
    if (IMOSLoggingEnabled())
    {
      CFIndex v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = (void *)v22[6];
        *(_DWORD *)buf = 134218240;
        id v28 = v8;
        __int16 v29 = 2048;
        uint64_t v30 = [MessageWithLimit count];
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Enforing lastMessage load limit of %lld, found %lu chats with messages", buf, 0x16u);
      }
    }
  }
  if (xarray)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v3 >= 1)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v3;
      do
      {
        uint64_t v12 = [active objectAtIndex:v10];
        uint64_t v13 = v12;
        if (v6)
        {
          xpc_object_t v14 = objc_msgSend(MessageWithLimit, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", IMDChatRecordGetIdentifier(v12)));
          __int16 v15 = v14;
          if (v14)
          {
            char v16 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"l"), "BOOLValue");
            int64_t v17 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", @"d"), "integerValue");
          }
          else
          {
            char v16 = 0;
            int64_t v17 = -1;
          }
        }
        else
        {
          int64_t v17 = -1;
          char v16 = 1;
        }
        xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
        if (v18)
        {
          _IMDChatRecordBulkCopyXPCDictionary(v13, (uint64_t)v18, 1, 0, v16, 1);
          xpc_dictionary_set_int64(v18, "last_message_date_on_load", v17);
          xpc_array_append_value(xarray, v18);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", xpc_dictionary_get_int64(v18, "recordIdentifier")));
          xpc_release(v18);
        }
        ++v10;
      }
      while (v11 != v10);
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1AFC3E50C;
    v26[3] = &unk_1E5F9D208;
    v26[4] = v9;
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)v26);
    [v9 enumerateKeysAndObjectsUsingBlock:&unk_1F084BF00];

    char v19 = (void *)v22[4];
    if (v19) {
      xpc_dictionary_set_value(v19, "array_result", xarray);
    }
    xpc_release(xarray);
  }

  if (active) {
    CFRelease(active);
  }
  [v23 stopTimingForKey:@"goFetchAllActiveChats"];
  if (IMOSLoggingEnabled())
  {
    int64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v23;
      _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Finished timing goFetchAllActiveChats with time: %@", buf, 0xCu);
    }
  }

  uint64_t result = v22[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void *sub_1AFC3E50C(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", a2));
  if (result)
  {
    xpc_dictionary_set_int64(result, "unread_count_cache", a3);
    CFIndex v7 = *(void **)(a1 + 32);
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
    return (void *)[v7 removeObjectForKey:v8];
  }
  return result;
}

void sub_1AFC3E5B4(int a1, int a2, xpc_object_t xdict)
{
}

void __XPCServerIMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3E644;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3E644(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v2 startTimingForKey:@"copyRecentChats"];
  id v3 = IMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit(a1[6], a1[7]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  xpc_object_t v5 = xpc_array_create(0, 0);
  if (v5)
  {
    BOOL v6 = v5;
    if ([v3 count])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [v3 objectAtIndex:v7];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          uint64_t v10 = v9;
          _IMDChatRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 0, 1, 1);
          xpc_dictionary_set_int64(v10, "unread_count_cache", 0);
          objc_msgSend(v4, "setObject:forKey:", v10, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", IMDChatRecordGetIdentifier(v8)));
          xpc_array_append_value(v6, v10);
          xpc_release(v10);
        }
        ++v7;
      }
      while (v7 < [v3 count]);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFC3E8DC;
    v14[3] = &unk_1E5F9D208;
    v14[4] = v4;
    _IMDMessageRecordCountAllUnreadMessagesForAllUnreadChats((uint64_t)v14);
    uint64_t v11 = (void *)a1[4];
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v6);
    }
    xpc_release(v6);
  }

  [v2 stopTimingForKey:@"copyRecentChats"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v2;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Finished timing copyRecentChats with time: %@", buf, 0xCu);
    }
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1AFC3E8DC(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  xpc_object_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", a2));
  if (v5)
  {
    xpc_dictionary_set_int64(v5, "unread_count_cache", a3);
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218240;
      uint64_t v8 = a2;
      __int16 v9 = 2048;
      int64_t v10 = a3;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "An unread chat was not included in recent chats with rowID: %llu unreadCount: %lld", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __XPCServerIMDCoreSpotlightAddMessageGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3EAD4;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3EAD4(uint64_t a1)
{
  IMDCoreSpotlightAddMessageGUID(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightAddMessageGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3EBA8;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3EBA8(uint64_t a1)
{
  IMDCoreSpotlightAddMessageGUIDs(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightDeleteMessageGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3EC7C;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3EC7C(uint64_t a1)
{
  IMDCoreSpotlightDeleteMessageGUIDS(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightAddChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3ED50;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3ED50(uint64_t a1)
{
  IMDCoreSpotlightAddChatGUID(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightDeleteChatGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3EE24;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3EE24(uint64_t a1)
{
  IMDCoreSpotlightDeleteChatGUID(*(void **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightSetNeedsMessageReindex_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3EEF4;
  v6[3] = &unk_1E5F9CE28;
  v6[4] = a4;
  v6[5] = a5;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC3EEF4(uint64_t a1)
{
}

void __XPCServerIMDCoreSpotlightIndexNextMessageBatchIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3EF7C;
  v7[3] = &unk_1E5F9CEC8;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void sub_1AFC3EF7C(uint64_t a1)
{
}

void __XPCServerIMDCoreSpotlightReindexMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3F008;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void sub_1AFC3F008(uint64_t a1)
{
}

void __XPCServerIMDCoreSpotlightReindexMessagesWithCollaborationMetadata_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC3F094;
  v8[3] = &unk_1E5F9D250;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a4;
  v8[7] = a7;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC3F094(uint64_t a1)
{
  IMDCoreSpotlightReindexMessagesWithCollaborationMetadata(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3F16C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC3F16C(uint64_t a1)
{
  CFStringRef v2 = IMDChatRecordCopyChatForGUID(*(CFStringRef *)(a1 + 32));
  CFStringRef v3 = v2;
  if (v2) {
    _IMDChatRecordBulkCopyXPCDictionary((uint64_t)v2, *(void *)(a1 + 40), 0, 0, 1, 1);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

void __XPCServerIMDChatRecordCopyChatRecordForIdentifier_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3F26C;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC3F26C(uint64_t *a1)
{
  uint64_t v2 = IMDChatRecordCopyChatRecord(a1[6]);
  CFStringRef v3 = (const void *)v2;
  if (v2) {
    _IMDChatRecordBulkCopyXPCDictionary(v2, a1[4], 0, 0, 1, 1);
  }
  uint64_t v4 = a1[5];
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

void __XPCServerIMDChatRecordCopyChatForMessageID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3F36C;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void sub_1AFC3F36C(uint64_t *a1)
{
  int64_t v2 = IMDChatRecordCopyChatForMessageID(a1[6]);
  CFStringRef v3 = (const void *)v2;
  if (v2) {
    _IMDChatRecordBulkCopyXPCDictionary(v2, a1[4], 0, 0, 0, 1);
  }
  uint64_t v4 = a1[5];
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

void __XPCServerIMDChatRecordCopyChatsWithHandleOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3F46C;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3F46C(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)IMDChatRecordCopyChatsWithHandleOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    BOOL v5 = *(void **)(a1 + 48);
    if (v5) {
      xpc_dictionary_set_value(v5, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithIdentifierOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3F5AC;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3F5AC(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)IMDChatRecordCopyChatsWithIdentifierOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    BOOL v5 = *(void **)(a1 + 48);
    if (v5) {
      xpc_dictionary_set_value(v5, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithRoomnameOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3F6EC;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3F6EC(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)IMDChatRecordCopyChatsWithRoomnameOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    BOOL v5 = *(void **)(a1 + 48);
    if (v5) {
      xpc_dictionary_set_value(v5, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatsWithGroupID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3F82C;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3F82C(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)IMDChatRecordCopyChatsWithGroupID(*(const __CFString **)(a1 + 32));
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    _IMDChatRecordCopyChatsToXPCArray(v2, v3, 0, 0, 0, 1);
    BOOL v5 = *(void **)(a1 + 40);
    if (v5) {
      xpc_dictionary_set_value(v5, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyNewestChatForGroupIDOnService_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC3F96C;
  v8[3] = &unk_1E5F9D278;
  v8[4] = a5;
  v8[5] = a6;
  char v9 = a7;
  v8[6] = a3;
  v8[7] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

void sub_1AFC3F96C(uint64_t a1)
{
  uint64_t v2 = IMDChatRecordCopyNewestChatForGroupIDOnService(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  xpc_object_t v3 = (const void *)v2;
  if (v2) {
    _IMDChatRecordBulkCopyXPCDictionary(v2, *(void *)(a1 + 48), 0, 0, 0, 1);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

void __XPCServerIMDChatRecordDeleteChatForGUID_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC3FA70;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC3FA70(uint64_t a1)
{
  IMDChatRecordDeleteChatForGUID(*(__CFString **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3FB40;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3FB40(uint64_t *a1)
{
  IMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded(a1[4], a1[5]);
  uint64_t result = a1[6];
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3FC14;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3FC14(uint64_t a1)
{
  IMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatGUIDsWithUnplayedAudioMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3FCE4;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  void v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3FCE4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFMutableArrayRef v2 = IMDChatRecordCopyChatGUIDsWithUnplayedAudioMessages();
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(__CFArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v2);
          }
          char v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v9 UTF8String])
          {
            xpc_object_t v10 = xpc_string_create((const char *)[v9 UTF8String]);
            if (v10)
            {
              uint64_t v11 = v10;
              xpc_array_append_value(v4, v10);
              xpc_release(v11);
            }
          }
        }
        uint64_t v6 = [(__CFArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      xpc_dictionary_set_value(v12, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatRecordSetIsFiltered_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC3FED8;
  v7[3] = &unk_1E5F9CE50;
  v7[5] = a4;
  v7[6] = a6;
  v7[4] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC3FED8(uint64_t a1)
{
  IMDChatRecordSetIsFiltered(*(const __CFString **)(a1 + 32), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordDeleteEmptyChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC3FFA8;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC3FFA8(uint64_t a1)
{
  IMDChatRecordDeleteEmptyChats();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatIdentitiesForMessageWithGUIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC40074;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC40074(uint64_t a1)
{
  CFArrayRef v2 = IMDChatRecordCopyChatIdentitiesForMessageWithGUIDs(*(const __CFArray **)(a1 + 32));
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    if ([(__CFArray *)v2 count]) {
      IMInsertArraysToXPCDictionary();
    }
    BOOL v5 = *(void **)(a1 + 40);
    if (v5) {
      xpc_dictionary_set_value(v5, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __XPCServerIMDChatRecordRepairDuplicateChats_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC401C8;
  v8[3] = &unk_1E5F9D2A0;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a7;
  v8[7] = a3;
  void v8[8] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC401C8(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  int v2 = IMDChatRecordRepairDuplicateChats(*(void **)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), &v12);
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = @"NO";
      if (v2) {
        BOOL v4 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = (uint64_t)v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "IMDChatRecordRepairDuplicateChats is returned %@", buf, 0xCu);
    }
  }
  BOOL v5 = *(void **)(a1 + 56);
  if (v5)
  {
    xpc_dictionary_set_BOOL(v5, "BOOL_result", v2);
    if ((v2 & 1) == 0)
    {
      BOOL v6 = v12 == 0;
      int v7 = IMOSLoggingEnabled();
      if (v6)
      {
        if (v7)
        {
          xpc_object_t v10 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "got NO success with NO error!?", buf, 2u);
          }
        }
      }
      else
      {
        if (v7)
        {
          uint64_t v8 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            uint64_t v9 = [v12 description];
            *(_DWORD *)buf = 138412290;
            uint64_t v14 = v9;
            _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "got NO success with error: %@", buf, 0xCu);
          }
        }
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "error_domain", (const char *)objc_msgSend((id)objc_msgSend(v12, "domain"), "UTF8String"));
        xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 56), "error_code", [v12 code]);
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 56), "error_localized_description", (const char *)objc_msgSend((id)objc_msgSend(v12, "localizedDescription"), "UTF8String"));
      }
    }
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatRecordSplitDatabaseByDays_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC404C4;
  v7[3] = &unk_1E5F9D250;
  v7[4] = a6;
  v7[5] = a3;
  v7[6] = a4;
  void v7[7] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC404C4(uint64_t a1)
{
  char v2 = IMDTrimSharedDatabaseToDays(*(void *)(a1 + 32), *(void *)(a1 + 56), 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "BOOL_result", v2);
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __XPCServerIMDChatRecordSplitDatabaseByRecentCount_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC405B0;
  v7[3] = &unk_1E5F9D250;
  v7[4] = a6;
  v7[5] = a3;
  v7[6] = a4;
  void v7[7] = a5;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC405B0(uint64_t a1)
{
  char v2 = IMDTrimSharedDatabaseToMessageCount(*(void *)(a1 + 32), *(void *)(a1 + 56), 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "BOOL_result", v2);
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __XPCServerIMDSwitchDatabase_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC40698;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC40698(uint64_t a1)
{
  IMDSwitchToDatabase();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC40768;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC40768(uint64_t a1)
{
  id v14 = 0;
  char v2 = (void *)IMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender(*(void *)(a1 + 32), *(void *)(a1 + 40), (void (*)(void))&v14);
  xpc_object_t v3 = xpc_array_create(0, 0);
  if (v3)
  {
    BOOL v4 = v3;
    int v5 = [v2 count];
    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      do
      {
        uint64_t v8 = [v2 objectAtIndex:v6];
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        if (v9)
        {
          xpc_object_t v10 = v9;
          _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 0, 0);
          xpc_array_append_value(v4, v10);
          xpc_release(v10);
        }
        ++v6;
      }
      while (v7 != v6);
    }
    uint64_t v11 = *(void **)(a1 + 48);
    if (v11) {
      xpc_dictionary_set_value(v11, "array_result", v4);
    }
    xpc_release(v4);
  }
  if (v14)
  {
    id v12 = *(void **)(a1 + 48);
    if (v12)
    {
      xpc_dictionary_set_int64(v12, "error_code", [v14 code]);
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), "error_domain", (const char *)objc_msgSend((id)objc_msgSend(v14, "domain"), "UTF8String"));
      if (objc_msgSend((id)objc_msgSend(v14, "localizedDescription"), "UTF8String")) {
        xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 48), "error_description", (const char *)objc_msgSend((id)objc_msgSend(v14, "localizedDescription"), "UTF8String"));
      }
    }
  }
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDCoreSpotlightMarkAttachment_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC40998;
  v10[3] = &unk_1E5F9D2C8;
  v10[4] = a6;
  v10[5] = a5;
  v10[6] = a1;
  v10[7] = a7;
  char v11 = a9;
  void v10[8] = a8;
  v10[9] = a3;
  v10[10] = a4;
  BOOL v9 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v10, v9);
}

uint64_t sub_1AFC40998(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 UTF8String];
    uint64_t v3 = sandbox_extension_consume();
    if (v3 != -1) {
      goto LABEL_7;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Failed to consume sandbox token, %@ token: %@", buf, 0x16u);
      }
    }
  }
  uint64_t v3 = -1;
LABEL_7:
  memset(buf, 0, 32);
  xpc_connection_get_audit_token();
  [*(id *)(a1 + 40) UTF8String];
  *(_OWORD *)int64_t v20 = *(_OWORD *)buf;
  *(_OWORD *)&v20[16] = *(_OWORD *)&buf[16];
  int v7 = sandbox_check_by_audit_token();
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = *__error();
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)int64_t v20 = 67109890;
        *(_DWORD *)&v20[4] = v7;
        *(_WORD *)&v20[8] = 1024;
        *(_DWORD *)&v20[10] = v9;
        *(_WORD *)&v20[14] = 1024;
        *(_DWORD *)&v20[16] = buf;
        *(_WORD *)&v20[20] = 2112;
        *(void *)&v20[22] = v10;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Denying access to attachment, (check %d, errno %d) client with audit token: %u not allowed to access request path: %@", v20, 0x1Eu);
      }
    }
    int v11 = 0;
  }
  else
  {
    int v11 = IMDCoreSpotlightMarkAttachment();
  }
  if (v3 != -1 && sandbox_extension_release() == -1)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)int64_t v20 = 138412546;
        *(void *)&v20[4] = v13;
        *(_WORD *)&v20[12] = 2112;
        *(void *)&v20[14] = v14;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Failed to release sandbox token, %@ token: %@", v20, 0x16u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = @"NO";
      uint64_t v17 = *(void *)(a1 + 40);
      if (v11) {
        long long v16 = @"YES";
      }
      *(_DWORD *)int64_t v20 = 138412546;
      *(void *)&v20[4] = v17;
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v16;
      _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Mark file %@ succedded ? %@", v20, 0x16u);
    }
  }
  xpc_object_t v18 = *(void **)(a1 + 72);
  if (v18) {
    xpc_dictionary_set_BOOL(v18, "BOOL_result", v11);
  }
  uint64_t result = *(void *)(a1 + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

void __XPCServerIMDDowngradeDatabase_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC40D68;
  v8[3] = &unk_1E5F9CF68;
  v8[4] = a5;
  v8[5] = a6;
  v8[7] = a4;
  void v8[8] = a7;
  v8[6] = a3;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC40D68(uint64_t *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  char v2 = IMDDowngradeDatabaseToVersion(a1[4], a1[5], a1[8], (void (*)(void))&v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a1[8];
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Downgrade Database to version %ld", buf, 0xCu);
    }
  }
  uint64_t v5 = (void *)a1[6];
  if (v5) {
    xpc_dictionary_set_BOOL(v5, "BOOL_result", v2);
  }
  if (v7) {
    _IMDInsertErrorToXPCDictionary(a1[6], "error");
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesToUploadToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC40F14;
  v7[3] = &unk_1E5F9CF18;
  v7[6] = a5;
  void v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC40F14(void *a1)
{
  char v2 = (void *)IMDMessageRecordCopyMessagesToUploadToCloudKitWithLimit(a1[6], a1[7]);
  if (v2)
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = [v2 count];
      if (v5 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v5;
        do
        {
          uint64_t v8 = [v2 objectAtIndex:v6];
          xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            uint64_t v10 = v9;
            _IMDMessageRecordBulkCopyXPCDictionary(v8, (uint64_t)v9, 1, 1);
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      int v11 = (void *)a1[4];
      if (v11) {
        xpc_dictionary_set_value(v11, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = a1[5];
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC410C4;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC410C4(uint64_t a1)
{
  uint64_t v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKitWithLimit(*(void *)(a1 + 48));
  if (updated)
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v17 = v1;
      int v5 = [updated count];
      if (v5 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v5;
        do
        {
          uint64_t v8 = (void *)[updated objectAtIndex:v6];
          xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            uint64_t v10 = v9;
            int v11 = (void *)[v8 objectForKeyedSubscript:@"MID"];
            id v12 = (void *)[v8 objectForKeyedSubscript:@"TOID"];
            uint64_t v13 = (void *)[v8 objectForKeyedSubscript:@"TOPart"];
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"ROWID"), "longLongValue"));
            if ([v11 UTF8String]) {
              xpc_dictionary_set_string(v10, "MID", (const char *)[v11 UTF8String]);
            }
            if ([v12 UTF8String]) {
              xpc_dictionary_set_string(v10, "TOID", (const char *)[v12 UTF8String]);
            }
            if ([v13 UTF8String]) {
              xpc_dictionary_set_string(v10, "TOPart", (const char *)[v13 UTF8String]);
            }
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      uint64_t v1 = v17;
      uint64_t v14 = *(void **)(v17 + 32);
      if (v14) {
        xpc_dictionary_set_value(v14, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(v1 + 40);
  if (result)
  {
    long long v16 = *(uint64_t (**)(void))(result + 16);
    return v16();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC41358;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC41358(uint64_t a1)
{
  uint64_t v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKitWithLimit(*(void *)(a1 + 48));
  if (updated)
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v17 = v1;
      int v5 = [updated count];
      if (v5 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v5;
        do
        {
          uint64_t v8 = (void *)[updated objectAtIndex:v6];
          xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            uint64_t v10 = v9;
            int v11 = (void *)[v8 objectForKeyedSubscript:@"MID"];
            id v12 = (void *)[v8 objectForKeyedSubscript:@"SR"];
            uint64_t v13 = (void *)[v8 objectForKeyedSubscript:@"SSR"];
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"ROWID"), "longLongValue"));
            if ([v11 UTF8String]) {
              xpc_dictionary_set_string(v10, "MID", (const char *)[v11 UTF8String]);
            }
            if ([v12 UTF8String]) {
              xpc_dictionary_set_string(v10, "SR", (const char *)[v12 UTF8String]);
            }
            if ([v13 UTF8String]) {
              xpc_dictionary_set_string(v10, "SSR", (const char *)[v13 UTF8String]);
            }
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      uint64_t v1 = v17;
      uint64_t v14 = *(void **)(v17 + 32);
      if (v14) {
        xpc_dictionary_set_value(v14, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(v1 + 40);
  if (result)
  {
    long long v16 = *(uint64_t (**)(void))(result + 16);
    return v16();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC415EC;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC415EC(uint64_t a1)
{
  uint64_t v1 = a1;
  updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKitWithLimit(*(void *)(a1 + 48));
  if (updated)
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v15 = v1;
      int v5 = [updated count];
      if (v5 >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = v5;
        do
        {
          uint64_t v8 = (void *)[updated objectAtIndex:v6];
          xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
          if (v9)
          {
            uint64_t v10 = v9;
            int v11 = (void *)[v8 objectForKeyedSubscript:@"MID"];
            xpc_dictionary_set_int64(v10, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"ROWID"), "longLongValue"));
            if ([v11 UTF8String]) {
              xpc_dictionary_set_string(v10, "MID", (const char *)[v11 UTF8String]);
            }
            xpc_array_append_value(v4, v10);
            xpc_release(v10);
          }
          ++v6;
        }
        while (v7 != v6);
      }
      uint64_t v1 = v15;
      id v12 = *(void **)(v15 + 32);
      if (v12) {
        xpc_dictionary_set_value(v12, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(v1 + 40);
  if (result)
  {
    uint64_t v14 = *(uint64_t (**)(void))(result + 16);
    return v14();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkAllMessagesAsNeedingCloudKitSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC4180C;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC4180C(uint64_t a1)
{
  IMDMessageRecordMarkAllMessagesAsNeedingCloudKitSync();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordCopyMessagesToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC418D8;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC418D8(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)IMDMessageRecordCopyRecordIDsAndGUIDsToDeleteWithLimit(a1[6]);
  if ([v2 count])
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      if ([v2 count])
      {
        unint64_t v5 = 0;
        xpc_object_t xarray = v4;
        xpc_object_t v18 = v2;
        do
        {
          xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = (void *)[v2 objectAtIndex:v5];
            long long v19 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            xpc_object_t v9 = (void *)[v8 allKeys];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v20;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v20 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
                  if (([v14 isEqualToString:@"ROWID"] & 1) == 0) {
                    xpc_dictionary_set_string(v7, (const char *)[v14 cStringUsingEncoding:4], (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
              }
              while (v11);
            }
            BOOL v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            char v2 = v18;
          }
          ++v5;
        }
        while ([v2 count] > v5);
      }
      uint64_t v15 = (void *)a1[4];
      if (v15) {
        xpc_dictionary_set_value(v15, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDUpdateWallpaperForCNContact_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC41B70;
  v7[3] = &unk_1E5F9CEF0;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a3;
  void v7[7] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC41B70(uint64_t a1)
{
  BOOL v2 = IMDSaveWallpaperForCNContact(*(void **)(a1 + 32), *(void **)(a1 + 40));
  xpc_object_t v3 = *(void **)(a1 + 48);
  if (v3) {
    xpc_dictionary_set_BOOL(v3, "BOOL_result", v2);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    unint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC41C5C;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC41C5C(uint64_t a1)
{
  IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC41D2C;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC41D2C(uint64_t a1)
{
  IMDAddIncompatibleGroupPhotoChangedMessagesToDeleteFromCloudKit();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkDeletedTombStonedMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC41DF4;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC41DF4(uint64_t a1)
{
  IMDMessageRecordClearDeleteTombStones();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordDeleteTombStonedMessagesWithRecordIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC41EBC;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC41EBC(uint64_t a1)
{
  IMDMessageRecordDeleteTombStonedMessagesWithRecordIDs(*(const __CFArray **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerInsertIntoDeletedChatsTable_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC41F8C;
  v8[3] = &unk_1E5F9D250;
  v8[4] = a5;
  v8[5] = a6;
  v8[6] = a4;
  v8[7] = a7;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC41F8C(uint64_t a1)
{
  IMDChatInsertIntoDeletedChatsTable(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRecordCopyChatRecordIDsAndGUIDsToDeleteFromCloudKitWithLimit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC42064;
  v6[3] = &unk_1E5F9CE50;
  v6[5] = a4;
  void v6[6] = a5;
  v6[4] = a3;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC42064(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)IMDChatCopyChatRecordIDsAndGUIDsToDeleteWithLimit(*(void *)(a1 + 48));
  if ([v2 count])
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      uint64_t v17 = v1;
      if ([v2 count])
      {
        unint64_t v5 = 0;
        xpc_object_t xarray = v4;
        long long v19 = v2;
        do
        {
          xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            BOOL v7 = v6;
            unint64_t v20 = v5;
            uint64_t v8 = (void *)[v2 objectAtIndex:v5];
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            xpc_object_t v9 = (void *)[v8 allKeys];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v22;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v22 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                  if (([v14 isEqualToString:@"ROWID"] & 1) == 0)
                  {
                    if (([v14 isEqualToString:@"guid"] & 1) != 0
                      || [v14 isEqualToString:@"recordID"])
                    {
                      xpc_dictionary_set_string(v7, (const char *)[v14 cStringUsingEncoding:4], (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                    }
                    if ([v14 isEqualToString:@"timestamp"]) {
                      xpc_dictionary_set_int64(v7, "timestamp", objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "unsignedIntegerValue"));
                    }
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
              }
              while (v11);
            }
            BOOL v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            BOOL v2 = v19;
            unint64_t v5 = v20;
          }
          ++v5;
        }
        while ([v2 count] > v5);
      }
      uint64_t v1 = v17;
      uint64_t v15 = *(void **)(v17 + 32);
      if (v15) {
        xpc_dictionary_set_value(v15, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(v1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDChatClearPendingDeleteChatsTable_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC4235C;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC4235C(uint64_t a1)
{
  IMDChatClearPendingDeleteChatsTable();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDChatRemapMessagesWithErrorCodeToErrorCode_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC42428;
  v8[3] = &unk_1E5F9CF18;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a5;
  v8[5] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

uint64_t sub_1AFC42428(uint64_t a1)
{
  IMDChatRemapMessagesWithErrorCodeToErrorCode(*(void **)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordCalculateLocalCloudKitStatistics_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC424F8;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  void v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC424F8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    IMDMessageRecordCalculateLocalCloudKitStatistics();
    BOOL v2 = (void *)IMCreateXPCObjectFromDictionary();
    if (v2)
    {
      xpc_object_t v3 = v2;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "dictionary_result", v2);
      xpc_release(v3);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDMessageRecordCalculateTotalCounts_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC425F0;
  v5[3] = &unk_1E5F9CD88;
  v5[4] = a3;
  void v5[5] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC425F0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    IMDMessageRecordCalculateTotalCounts();
    BOOL v2 = (void *)IMCreateXPCObjectFromDictionary();
    if (v2)
    {
      xpc_object_t v3 = v2;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "dictionary_result", v2);
      xpc_release(v3);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC426E8;
  v6[3] = &unk_1E5F9CE28;
  v6[4] = a4;
  v6[5] = a5;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC426E8(uint64_t a1)
{
  IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit(*(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkMessageWithROWIDAsIgnoreButNeedingSyncWithCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC427B4;
  v6[3] = &unk_1E5F9CE28;
  v6[4] = a4;
  v6[5] = a5;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC427B4(uint64_t a1)
{
  IMDMessageRecordMarkMessageWithROWIDAsIgnoreButNeedingSyncWithCloudKit(*(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordSetCloudKitSyncCounts_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC42880;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC42880(uint64_t a1)
{
  _IMDMessageRecordSetCloudKitSyncCounts(*(void **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordMarkFailedAttachmentsAsNeedingSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC4294C;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC4294C(uint64_t a1)
{
  IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyAttachmentsToDeleteFromCloudKit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC42A18;
  v7[3] = &unk_1E5F9D250;
  v7[4] = a5;
  v7[5] = a3;
  v7[6] = a4;
  void v7[7] = a6;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC42A18(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit(*(void **)(a1 + 32), *(void *)(a1 + 56));
  if ([v2 count])
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      uint64_t v17 = v1;
      if ([v2 count])
      {
        unint64_t v5 = 0;
        xpc_object_t xarray = v4;
        long long v19 = v2;
        do
        {
          xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            BOOL v7 = v6;
            unint64_t v20 = v5;
            uint64_t v8 = (void *)[v2 objectAtIndex:v5];
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            xpc_object_t v9 = (void *)[v8 allKeys];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v22;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v22 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                  if ([v14 isEqualToString:@"ROWID"]) {
                    xpc_dictionary_set_int64(v7, "ROWID", objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v14), "longLongValue"));
                  }
                  else {
                    xpc_dictionary_set_string(v7, (const char *)[v14 cStringUsingEncoding:4], (const char *)objc_msgSend((id)objc_msgSend(v8, "valueForKey:", v14), "cStringUsingEncoding:", 4));
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
              }
              while (v11);
            }
            BOOL v4 = xarray;
            xpc_array_append_value(xarray, v7);
            xpc_release(v7);
            BOOL v2 = v19;
            unint64_t v5 = v20;
          }
          ++v5;
        }
        while ([v2 count] > v5);
      }
      uint64_t v1 = v17;
      uint64_t v15 = *(void **)(v17 + 40);
      if (v15) {
        xpc_dictionary_set_value(v15, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(v1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordCopyAttachmentGUIDs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC42CE4;
  v7[3] = &unk_1E5F9D250;
  v7[4] = a5;
  v7[5] = a3;
  v7[6] = a4;
  void v7[7] = a6;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

uint64_t sub_1AFC42CE4(uint64_t a1)
{
  BOOL v2 = (void *)IMDAttachmentCopyGUIDsAfterRowWithLimit(*(void **)(a1 + 32), *(void *)(a1 + 56));
  if ([v2 count])
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      if ([v2 count])
      {
        unint64_t v5 = 0;
        do
        {
          xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
          if (v6)
          {
            BOOL v7 = v6;
            uint64_t v8 = (void *)[v2 objectAtIndex:v5];
            int64_t v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"ROWID"), "longLongValue");
            uint64_t v10 = (void *)[v8 objectForKey:@"guid"];
            LOBYTE(v8) = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"is_orphaned"), "BOOLValue");
            xpc_dictionary_set_int64(v7, "ROWID", v9);
            xpc_dictionary_set_string(v7, "guid", (const char *)[v10 cStringUsingEncoding:4]);
            xpc_dictionary_set_BOOL(v7, "is_orphaned", (BOOL)v8);
            xpc_array_append_value(v4, v7);
            xpc_release(v7);
          }
          ++v5;
        }
        while ([v2 count] > v5);
      }
      uint64_t v11 = *(void **)(a1 + 40);
      if (v11) {
        xpc_dictionary_set_value(v11, "array_result", v4);
      }
      xpc_release(v4);
    }
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC42F18;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

uint64_t sub_1AFC42F18(uint64_t a1)
{
  IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs(*(const __CFArray **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDAttachmentRecordDeleteTombStonedAttachmentsToDeleteFromCloudKit_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC42FE4;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

uint64_t sub_1AFC42FE4(uint64_t a1)
{
  IMDAttachmentRecordClearDeleteTombStones();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __XPCServerIMDMessageRecordMarkAllUnsuccessFullSyncMessagesAsNeedingSync_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC43D90;
  v5[3] = &unk_1E5F922D0;
  v5[4] = a4;
  BOOL v4 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v5, v4);
}

void __XPCServerIMDKVValueForKey_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC43DE0;
  v6[3] = &unk_1E5F9CDD8;
  v6[4] = a5;
  v6[5] = a3;
  void v6[6] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDKVPersistValueForKey_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC43E5C;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsPostNotifications_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC43EB4;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsRetractNotificationsForReadMessages_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC43F08;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDMessageRecordRetractNotificationsForChatGuids_asyncIPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC43F5C;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsRetractNotificationsFromFirstUnlock_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC43FB0;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDNotificationsPostUrgentNotificationsForMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC44004;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsUpdatePostedNotificationsForMessages_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC4405C;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDNotificationsPostFirstUnlockMessage_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC440B4;
  v7[3] = &unk_1E5F9CDD8;
  v7[4] = a5;
  v7[5] = a6;
  v7[6] = a4;
  BOOL v6 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v7, v6);
}

void __XPCServerIMDMessageRecordMarkMessageGUIDUnread_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC4410C;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __XPCServerIMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFC44160;
  v8[3] = &unk_1E5F9CE00;
  v8[4] = a5;
  v8[5] = a6;
  char v9 = a7;
  v8[6] = a4;
  BOOL v7 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v8, v7);
}

void __XPCServerIMDChatRecordPurgeAttachments_IPCAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFC441BC;
  v6[3] = &unk_1E5F9CD88;
  v6[4] = a5;
  v6[5] = a4;
  BOOL v5 = sub_1AFC2EAF8(a3);
  IMDPersistencePerformBlock(v6, v5);
}

void __IMDPersistenceIPCServer_InitializeEntitlements()
{
  if (qword_1EB5ABCA0 != -1) {
    dispatch_once(&qword_1EB5ABCA0, &unk_1F084C000);
  }
}

uint64_t __IMDPersistenceCheckLesserEntitlements(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1EB5ABCA0 != -1) {
    dispatch_once(&qword_1EB5ABCA0, &unk_1F084C000);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = objc_msgSend((id)qword_1EB5ABCB8, "allKeys", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        CFBooleanRef v10 = (const __CFBoolean *)[a1 objectForKey:v9];
        if (v10)
        {
          CFBooleanRef v11 = v10;
          CFTypeID v12 = CFGetTypeID(v10);
          if (v12 == CFBooleanGetTypeID())
          {
            if (CFBooleanGetValue(v11))
            {
              uint64_t v13 = (void *)[(id)qword_1EB5ABCB8 objectForKey:v9];
              if (v13)
              {
                if ([v13 containsIndex:a2]) {
                  return 1;
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1AFC43C00()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  qword_1EB5ABCB0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.private.imcore.spi.database-access", @"com.apple.private.imcore.imdpersistence.data-detection-access", @"com.apple.private.imcore.imdpersistence.database-access", 0);
  v0 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 20, 2);
  objc_msgSend(v0, "addIndexesInRange:", 182, 4);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 225, 1);
  objc_msgSend(v1, "addIndexesInRange:", 235, 1);
  v3[0] = @"com.apple.imdpersistence.IMDPersistenceAgent-UnreadChatList";
  v4[0] = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 220, 1);
  v4[1] = v0;
  v3[1] = @"com.apple.imdpersistence.IMDPersistenceAgent-StorageManagement";
  v3[2] = @"com.apple.imdpersistence.IMDPersistenceAgent-GroupMetadata";
  v3[3] = @"com.apple.imdpersistence.IMDPersistenceAgent-Syndication";
  v4[2] = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 154, 1);
  v4[3] = v1;
  qword_1EB5ABCB8 = (uint64_t)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  qword_1EB5ABCA8 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend((id)qword_1EB5ABCB0, "allObjects"));
  return objc_msgSend((id)qword_1EB5ABCA8, "addObjectsFromArray:", objc_msgSend((id)qword_1EB5ABCB8, "allKeys"));
}

uint64_t sub_1AFC43D90(uint64_t a1)
{
  IMDMessageRecordMarkAllUnsuccessFullSyncMessagesAsNeedingSync();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43DE0(uint64_t a1)
{
  IMDKVValueForKey(*(void **)(a1 + 32));
  if (*(void *)(a1 + 40)) {
    IMInsertDatasToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43E5C(uint64_t *a1)
{
  IMDKVPersistValueForKey(a1[4], a1[5]);
  uint64_t result = a1[6];
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43EB4(uint64_t a1)
{
  IMDNotificationsPostNotificationsWithContext(*(void **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43F08(uint64_t a1)
{
  IMDNotificationsRetractNotificationsForReadMessages(*(void **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43F5C(uint64_t a1)
{
  IMDMessageRecordRetractNotificationsForMessagesMatchingChatGUIDs(*(const __CFArray **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC43FB0(uint64_t a1)
{
  IMDNotificationsRetractNotificationsFromFirstUnlockWithContext(*(void **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC44004(uint64_t a1)
{
  IMDNotificationsPostUrgentNotificationsForMessages(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC4405C(uint64_t a1)
{
  IMDNotificationsUpdatePostedNotificationsForMessages(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC440B4(uint64_t a1)
{
  IMDNotificationsPostFirstUnlockMessage(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC4410C(uint64_t a1)
{
  IMDMessageRecordMarkMessageGUIDUnread(*(void *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC44160(uint64_t a1)
{
  IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe(*(const __CFString **)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC441BC(uint64_t a1)
{
  IMDChatRecordPurgeAttachments(*(const __CFString **)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    xpc_object_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1AFC44210()
{
  uint64_t result = IMGetCachedDomainBoolForKeyWithDefaultValue();
  byte_1E9AF7F58 = result;
  return result;
}

void sub_1AFC44244()
{
  byte_1EB5ABB48 = 0;
}

void sub_1AFC444FC(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F228F8]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == -1003)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = a1[6];
          *(_DWORD *)buf = 134218498;
          uint64_t v24 = v10;
          __int16 v25 = 1024;
          int v26 = 5;
          __int16 v27 = 2112;
          id v28 = v6;
          _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Error getting client state (attempt %lld/%d): %@", buf, 0x1Cu);
        }
      }
      dispatch_time_t v11 = dispatch_time(0, 5000000000);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1AFC44808;
      v19[3] = &unk_1E5F9D2F0;
      v19[4] = a1[4];
      id v12 = v6;
      long long v14 = (void *)a1[5];
      uint64_t v13 = a1[6];
      id v20 = v12;
      uint64_t v22 = v13;
      id v21 = v14;
      dispatch_after(v11, MEMORY[0x1E4F14428], v19);

      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v15 = [v5 length];
  int v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Spotlight client state exists", buf, 2u);
      }
    }
  }
  else if (v16)
  {
    xpc_object_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Spotlight client state is empty!", buf, 2u);
    }
  }
  (*(void (**)(void))(a1[5] + 16))();
LABEL_20:
}

uint64_t sub_1AFC44808(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__validateSpotlightClientStateWithLastError_attempts_completion_);
}

void sub_1AFC44A54()
{
  v0 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v1 = [v0 isInternalInstall];

  if (v1)
  {
    BOOL v2 = objc_alloc_init(IMSpotlightEventNotifier);
    xpc_object_t v3 = (void *)qword_1EB5ABB78;
    qword_1EB5ABB78 = (uint64_t)v2;
  }
}

__CFString *IMDCreateQueryRemoveMessagesFromTombStoneTableQuery(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppend(Mutable, @"DELETE FROM sync_deleted_messages WHERE (recordID = ?");
  uint64_t v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, @" OR recordID = ?");
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, @""));
  return Mutable;
}

__CFString *IMDCreateQueryRemoveMessagesFromMessageTableWithMessageGuidCount(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 256);
  CFStringAppend(Mutable, @"DELETE FROM message WHERE (guid = ?");
  uint64_t v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, @" OR guid = ?");
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, @""));
  return Mutable;
}

__CFString *IMDMessageRecordGetHistoryAllItemsWithOptionalThreadIdentifierQuery(int a1, uint64_t a2, int a3)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppend(Mutable, @"SELECT cm.message_id FROM chat_message_join cm ");
  if ((a1 & 1) != 0 || a3) {
    CFStringAppend(Mutable, @"INNER JOIN message m ON m.ROWID = cm.message_id ");
  }
  CFStringAppend(Mutable, @"WHERE cm.chat_id IN (SELECT c.ROWID FROM chat c WHERE (c.chat_identifier = ? and c.service_name = ?)) ");
  if (a1) {
    CFStringAppend(Mutable, @"AND ((m.thread_originator_guid = ? AND m.thread_originator_part = ?) OR m.associated_message_guid = ?)");
  }
  if (a3) {
    CFStringAppend(Mutable, @"AND m.is_read == 0 AND m.is_finished == 1 AND m.is_from_me == 0 ");
  }
  if (a2) {
    CFStringRef v7 = @"ORDER BY cm.message_date DESC, cm.message_id DESC LIMIT ?;";
  }
  else {
    CFStringRef v7 = @"ORDER BY cm.message_date DESC, cm.message_id DESC;";
  }
  CFStringAppend(Mutable, v7);
  return Mutable;
}

__CFString *IMDMessageRecordGetMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifierQuery(int a1, uint64_t a2, uint64_t a3)
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppend(Mutable, @"SELECT message_id from chat_message_join cmj ");
  if (a1)
  {
    CFStringAppend(Mutable, @"INNER JOIN message m ON m.ROWID = cmj.message_id ");
    CFStringAppend(Mutable, @"WHERE cmj.chat_id in (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) ");
    CFStringRef v7 = @"AND ((m.thread_originator_guid = ? AND m.thread_originator_part = ?) OR m.associated_message_guid = ?) ";
  }
  else
  {
    CFStringRef v7 = @"WHERE cmj.chat_id in (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) ";
  }
  CFStringAppend(Mutable, v7);
  if (a2 < 1 || a3)
  {
    if (a2 < 1)
    {
      if (a3 < 1)
      {
        CFRelease(Mutable);
        return 0;
      }
      CFStringRef v8 = @"AND cmj.message_date >= (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date ASC LIMIT ? + 1";
    }
    else
    {
      CFStringRef v8 = @"AND cmj.message_date < (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date DESC LIMIT ?";
    }
  }
  else
  {
    CFStringRef v8 = @"AND cmj.message_date <= (SELECT om.date FROM message om WHERE om.guid = ?) ORDER BY cmj.message_date DESC LIMIT ? + 1";
  }
  CFStringAppend(Mutable, v8);
  return Mutable;
}

id IMDMessageRecordSelectMessagesWithGUIDsChatIdentifiersOnServicesQuery1(int a1)
{
  int v1 = IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery1(a1);
  id v2 = (id)[(__CFString *)v1 stringByReplacingOccurrencesOfString:@"DELETE" withString:@"SELECT *"];
  CFRelease(v1);
  return v2;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery1(int a1)
{
  if (!a1)
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70C54();
    }
    goto LABEL_9;
  }
  if (a1 < 2)
  {
LABEL_9:
    uint64_t v3 = @"DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id = (SELECT m.ROWID FROM message m WHERE m.guid = ?);";
    CFRetain(@"DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id = (SELECT m.ROWID FROM message m WHERE m.guid = ?);");
    return v3;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    uint64_t v3 = Mutable;
    CFStringAppend(Mutable, CFSTR("DELETE FROM chat_message_join WHERE chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?) AND message_id IN (SELECT m.ROWID FROM message m WHERE m.guid IN (?"));
    int v4 = a1 - 1;
    do
    {
      CFStringAppend(v3, @", ?");
      --v4;
    }
    while (v4);
    CFStringAppend(v3, @");"));
  }
  else
  {
    CFStringRef v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70D08();
    }
    return 0;
  }
  return v3;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery2(int a1)
{
  if (!a1)
  {
    id v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70E58();
    }
  }
  Mutable = CFStringCreateMutable(0, 0);
  int v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"DELETE FROM message WHERE(    SELECT 1 FROM chat_message_join     WHERE message_id = message.rowid     LIMIT 1) IS NULL AND message.guid ");
    CFStringRef v5 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v4, v5);
  }
  else
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70DB0();
    }
  }
  return v4;
}

__CFString *IMDMessageRecordDeleteMessagesWithGUIDsChatIdentifiersOnServicesQuery3(int a1)
{
  if (!a1)
  {
    id v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70FB4();
    }
  }
  Mutable = CFStringCreateMutable(0, 0);
  int v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"UPDATE message SET cache_roomnames = (SELECT group_concat(c.room_name)                    FROM chat c INNER JOIN chat_message_join j                    ON c.ROWID = j.chat_id                    WHERE j.message_id = message.ROWID) WHERE message.guid ");
    CFStringRef v5 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v4, v5);
  }
  else
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC70F0C();
    }
  }
  return v4;
}

void sub_1AFC456D0(uint64_t a1, uint64_t a2, int a3, CFTypeRef *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a1 < 1)
  {
    CFStringRef v9 = 0;
  }
  else
  {
    CFStringRef v8 = IMDGenerateInClauseForCount(a1);
    CFStringRef v9 = CFStringCreateWithFormat(v7, 0, @"AND h.service NOT %@", v8);
  }
  if (a2 < 1)
  {
    CFStringRef v11 = 0;
  }
  else
  {
    uint64_t v10 = IMDGenerateInClauseForCount(a2);
    CFStringRef v11 = CFStringCreateWithFormat(v7, 0, @"AND m.guid NOT %@", v10);
  }
  id v12 = @"m.is_from_me = 0 AND";
  if (a3) {
    id v12 = @"m.is_from_me = 1 OR";
  }
  uint64_t v13 = &stru_1F084E970;
  if (v9) {
    long long v14 = (__CFString *)v9;
  }
  else {
    long long v14 = &stru_1F084E970;
  }
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  CFStringRef v15 = CFStringCreateWithFormat(v7, 0, @"SELECT   MAX(m.ROWID) FROM   message m   INDEXED BY message_idx_handle WHERE (  %@  m.handle_id IN(   SELECT       h.rowid     FROM       handle h     WHERE       h.id = ?       %@) )   AND m.date >= ?   AND m.was_deduplicated = 0   AND m.cache_has_attachments = 0   %@   AND im_trim(m.text) = im_trim(?)   AND m.ROWID IN(    SELECT        cm.message_id      FROM        chat_message_join cm      WHERE        m.ROWID = cm.message_id        AND cm.chat_id = (SELECT c.rowid FROM chat c WHERE c.chat_identifier = ? AND c.service_name = ?)  ) ", v12, v14, v13);
  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v15)
  {
    if (a4) {
      *a4 = CFRetain(v15);
    }
    CFRelease(v15);
  }
}

CFTypeRef IMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDsQuery(uint64_t a1, uint64_t a2, int a3)
{
  CFTypeRef v4 = 0;
  sub_1AFC456D0(a1, a2, a3, &v4);
  return v4;
}

CFStringRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDsQuery(int a1, int a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a1 < 1)
  {
    CFStringRef v5 = 0;
  }
  else
  {
    CFTypeRef v4 = IMDGenerateInClauseForCount(a1);
    CFStringRef v5 = CFStringCreateWithFormat(v3, 0, @"AND h.service NOT %@", v4);
  }
  if (a2 < 1)
  {
    CFStringRef v7 = 0;
  }
  else
  {
    id v6 = IMDGenerateInClauseForCount(a2);
    CFStringRef v7 = CFStringCreateWithFormat(v3, 0, @"AND m.guid NOT %@", v6);
  }
  CFStringRef v8 = &stru_1F084E970;
  if (v5) {
    CFStringRef v9 = (__CFString *)v5;
  }
  else {
    CFStringRef v9 = &stru_1F084E970;
  }
  if (v7) {
    CFStringRef v8 = (__CFString *)v7;
  }
  CFStringRef v10 = CFStringCreateWithFormat(v3, 0, @"SELECT   MAX(m.ROWID) FROM   message m   INDEXED BY message_idx_handle WHERE   m.handle_id IN(   SELECT       h.rowid     FROM       handle h     WHERE       h.id = ?       %@ )  AND m.date >= ?   AND m.is_from_me = 0   AND m.was_deduplicated = 0   AND m.cache_roomnames IS NULL   %@   AND im_trim(m.text) = im_trim(?) ", v9, v8);
  if (v10 || (CFStringRef v11 = IMLogHandleForCategory(), !os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)))
  {
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  sub_1AFC71068();
  if (v7) {
LABEL_15:
  }
    CFRelease(v7);
LABEL_16:
  if (v5) {
    CFRelease(v5);
  }
  return v10;
}

__CFString *IMDMessageRecordCopyMostRecentUseageOfAddressesQuery(int a1)
{
  Mutable = CFStringCreateMutable(0, 0);
  CFAllocatorRef v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"SELECT   MAX(cm.message_id), h.ID FROM chat_message_join cm   INNER JOIN chat_handle_join j     ON cm.chat_id = j.chat_id       INNER JOIN handle h         ON h.ROWID = j.handle_id WHERE h.ID ");
    CFStringRef v4 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v3, v4);
    CFStringAppend(v3, @" GROUP BY h.ID ");
    CFStringAppend(v3, @" ORDER BY cm.message_id DESC ");
  }
  else
  {
    CFStringRef v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71110();
    }
  }
  return v3;
}

__CFString *IMDMessageRecordCopyMessagesForGUIDsQuery(int a1)
{
  Mutable = CFStringCreateMutable(0, 0);
  CFAllocatorRef v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message ");
    CFStringAppend(v3, @"WHERE guid ");
    CFStringRef v4 = (const __CFString *)IMDGenerateInClauseForCount(a1);
    CFStringAppend(v3, v4);
    CFStringAppend(v3, @"ORDER BY message.ROWID ASC;");
  }
  else
  {
    CFStringRef v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC711B8();
    }
  }
  return v3;
}

__CFString *IMDCreateDeleteDeletedMessagesGuidsQuery(int a1)
{
  if (!a1)
  {
    CFStringRef v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71260();
    }
    return 0;
  }
  int v2 = a1 - 1;
  if (a1 < 1) {
    return 0;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (!Mutable)
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71314();
    }
    return 0;
  }
  CFStringRef v4 = Mutable;
  CFStringAppend(Mutable, @"DELETE from deleted_messages where (ROWID = ?");
  if (a1 >= 2)
  {
    do
    {
      CFStringAppend(v4, @" OR ROWID = ?");
      --v2;
    }
    while (v2);
  }
  CFStringAppend(v4, @""));
  return v4;
}

void *_IMDCreateQueryRemoveMessagesFromChatMessageJoinWithArrayOfMessageGuids(const __CFArray *a1, void *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  uint64_t v5 = Count << 32;
  if (!(Count << 32))
  {
    CFStringRef v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC713BC();
    }
    return 0;
  }
  if (v5 < 1) {
    return 0;
  }
  uint64_t v6 = (int)Count;
  CFStringRef v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(int)Count];
  if (!v7)
  {
    CFStringRef v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71518();
    }
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, 0);
  CFStringRef v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"DELETE FROM chat_message_join WHERE message_id = ?"];
  if (!v10)
  {
    CFStringRef v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71470();
    }
  }
  [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"message_guid=%@", ValueAtIndex)];
  if ((unint64_t)v5 >= 0x100000001)
  {
    if (v6 <= 2) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v6;
    }
    for (CFIndex i = 1; i != v12; ++i)
    {
      long long v14 = CFArrayGetValueAtIndex(a1, i);
      [v10 appendString:@" OR message_id = ?"];
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"message_guid=%@", v14)];
    }
  }
  [v10 appendString:@""]);
  if (a2) {
    *a2 = v7;
  }

  return v10;
}

__CFString *IMDMessageRecordCountAllUnreadMessagesQuery(int a1)
{
  if (!a1)
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1AFC715C0();
    }
    goto LABEL_9;
  }
  if (a1 < 2)
  {
LABEL_9:
    CFAllocatorRef v3 = @"SELECT   COUNT(1) FROM (SELECT   m.rowid , cm.message_id FROM   message m INNER JOIN chat_message_join cm ON  cm.message_id = m.rowid INNER JOIN chat c ON   c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered != ?)";
    CFRetain(@"SELECT   COUNT(1) FROM (SELECT   m.rowid , cm.message_id FROM   message m INNER JOIN chat_message_join cm ON  cm.message_id = m.rowid INNER JOIN chat c ON   c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered != ?)");
    return v3;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    CFAllocatorRef v3 = Mutable;
    CFStringAppend(Mutable, CFSTR("SELECT COUNT(1) FROM (SELECT m.rowid , cm.message_id FROM message m INNER JOIN chat_message_join cm ON cm.message_id = m.rowid INNER JOIN chat c ON c.ROWID = cm.chat_id WHERE   m.is_read == 0   AND NOT (m.ROWID in (SELECT message_id FROM chat_recoverable_message_join))  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0  AND c.is_blackholed != 1  AND c.is_filtered NOT IN (?"));
    int v4 = a1 - 1;
    do
    {
      CFStringAppend(v3, @", ?");
      --v4;
    }
    while (v4);
    CFStringAppend(v3, @");"));
  }
  else
  {
    CFStringRef v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71674();
    }
    return 0;
  }
  return v3;
}

uint64_t IMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimitQuery(uint64_t a1, void *a2)
{
  if (a1) {
    CFAllocatorRef v3 = (__CFString *)[NSString stringWithFormat:@"AND %@", a1];
  }
  else {
    CFAllocatorRef v3 = &stru_1F084E970;
  }
  if ([a2 count])
  {
    uint64_t v4 = [a2 componentsJoinedByString:@", "];
    uint64_t v5 = (__CFString *)[NSString stringWithFormat:@"ORDER BY %@ ", v4];
  }
  else
  {
    uint64_t v5 = &stru_1F084E970;
  }
  return objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message JOIN chat_message_join ON    chat_message_join.message_id == message.rowid WHERE    chat_message_join.chat_id = (SELECT c.rowid FROM chat c WHERE c.guid = ?) %@ %@ LIMIT    ?;",
           v3,
           v5);
}

uint64_t IMDMessageRecordCopySortedMessagesFilteredUsingPredicateWithLimitQuery(__CFString *a1, void *a2, int a3)
{
  if ([a2 count])
  {
    uint64_t v6 = [a2 componentsJoinedByString:@", "];
    CFStringRef v7 = (__CFString *)[NSString stringWithFormat:@"ORDER BY %@ ", v6];
  }
  else
  {
    CFStringRef v7 = &stru_1F084E970;
  }
  if (a3) {
    CFStringRef v8 = @"INNER JOIN chat_message_join cmj ON cmj.message_id = message.rowid";
  }
  else {
    CFStringRef v8 = &stru_1F084E970;
  }
  if (!a1) {
    a1 = &stru_1F084E970;
  }
  return objc_msgSend([NSString alloc], "initWithFormat:", @"SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message %@ WHERE %@ %@ LIMIT    ?;",
           v8,
           a1,
           v7);
}

uint64_t IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter(uint64_t a1, uint64_t a2)
{
  if (a1) {
    CFAllocatorRef v3 = (__CFString *)[NSString stringWithFormat:@"AND (%@)", a1];
  }
  else {
    CFAllocatorRef v3 = &stru_1F084E970;
  }
  return [[NSString alloc] initWithFormat:@"%@ %@ ORDER BY m.date DESC LIMIT %ld", @"SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE m.is_read == 0  AND m.is_finished == 1  AND m.is_from_me == 0  AND m.item_type == 0  AND m.is_system_message == 0 ", v3, a2];
}

void sub_1AFC46084(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

uint64_t IMDAttachmentRecordCreateEphemeralRecord(uint64_t a1)
{
  IMDAttachmentRecordGetTypeID();
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v3 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    Mutable = CFArrayCreateMutable(0, 23, 0);
    if (a1) {
      uint64_t v5 = (const void *)((uint64_t (*)(uint64_t))*MEMORY[0x1E4F5D048])(a1);
    }
    else {
      uint64_t v5 = 0;
    }
    CFArraySetValueAtIndex(Mutable, 0, v5);
    *(void *)(v3 + 16) = 3735928559;
    uint64_t v6 = 22;
    do
    {
      CFArrayAppendValue(Mutable, 0);
      --v6;
    }
    while (v6);
  }
  return v3;
}

uint64_t IMDAttachmentRecordCopyAttachmentRecordUnlocked(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1AFC46250;
  v3[3] = &unk_1E5F8FE88;
  void v3[4] = &v4;
  v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AFC46238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC46250(uint64_t a1)
{
  uint64_t result = CSDBRecordStoreCopyInstanceOfClassWithUID();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentRecord(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1AFC46354;
  v3[3] = &unk_1E5F8FE88;
  void v3[4] = &v4;
  v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AFC4633C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC46354(uint64_t a1)
{
  uint64_t result = CSDBRecordStoreCopyInstanceOfClassWithUID();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordDoesAttachmentWithGUIDExist(const __CFString *a1)
{
  char v2 = IMDIsRunningInDatabaseServerProcess();
  uint64_t v3 = &v8;
  if (v2)
  {
    uint64_t v8 = 0;
    CFStringRef v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    if (a1)
    {
      if (CFStringGetLength(a1))
      {
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = sub_1AFC4653C;
        v6[3] = &unk_1E5F900E0;
        v6[4] = &v8;
        v6[5] = a1;
        _IMDPerformLockedStatementBlockWithQuery(@"SELECT count(rowid) FROM Attachment where guid = ?", (uint64_t)v6);
      }
      uint64_t v3 = v9;
    }
    uint64_t v4 = *((unsigned __int8 *)v3 + 24);
  }
  else
  {
    uint64_t v8 = 0;
    CFStringRef v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v7[1] = (void (*)(void))3221225472;
    v7[2] = (void (*)(void))sub_1AFC464FC;
    v7[3] = (void (*)(void))&unk_1E5F8D580;
    v7[4] = (void (*)(void))&v8;
    __syncXPCIMDAttachmentRecordDoesAttachmentWithGUIDExist_IPCAction(v7, (uint64_t)a1);
    uint64_t v4 = *((unsigned __int8 *)v9 + 24);
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_1AFC464DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_1AFC464FC(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "BOOL_result");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1AFC4653C(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  uint64_t result = CSDBSqliteStatementIntegerResult();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result > 0;
  return result;
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUID(const __CFString *a1)
{
  return IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(a1, 0);
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID(CFStringRef theString, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = @"YES";
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "*** IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID called with isLegacyGUID %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if (theString)
  {
    if (CFStringGetLength(theString))
    {
      if (!IMDIsRunningInDatabaseServerProcess())
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v21 = 0x2020000000;
        uint64_t v22 = 0;
        v18[0] = (void (*)(void))MEMORY[0x1E4F143A8];
        v18[1] = (void (*)(void))3221225472;
        v18[2] = (void (*)(void))sub_1AFC468CC;
        v18[3] = (void (*)(void))&unk_1E5F8D580;
        v18[4] = (void (*)(void))&buf;
        __syncXPCIMDAttachmentRecordCopyAttachmentForGUID_IPCAction(v18, (uint64_t)theString);
        theString = *(CFStringRef *)(*((void *)&buf + 1) + 24);
LABEL_22:
        _Block_object_dispose(&buf, 8);
        return theString;
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0;
      if (a2) {
        uint64_t v5 = @"SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state FROM attachment WHERE original_guid = ? ORDER BY ROWID DESC;";
      }
      else {
        uint64_t v5 = @"SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state FROM attachment WHERE guid = ? ORDER BY ROWID DESC;";
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1AFC46868;
      v19[3] = &unk_1E5F900E0;
      v19[4] = &buf;
      void v19[5] = theString;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v5, (uint64_t)v19);
      CFArrayRef v6 = *(const __CFArray **)(*((void *)&buf + 1) + 24);
      if (v6)
      {
        int Count = CFArrayGetCount(v6);
        if (Count >= 2)
        {
          uint64_t v8 = IMLogHandleForCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            sub_1AFC7171C((uint64_t)theString, v8, v9, v10, v11, v12, v13, v14);
          }
          goto LABEL_18;
        }
        if (Count == 1)
        {
LABEL_18:
          CFArrayGetValueAtIndex(*(CFArrayRef *)(*((void *)&buf + 1) + 24), 0);
          int ID = CSDBRecordGetID();
          theString = (CFStringRef)IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E4F1CF80], ID);
          goto LABEL_20;
        }
      }
      theString = 0;
LABEL_20:
      int v16 = *(const void **)(*((void *)&buf + 1) + 24);
      if (v16) {
        CFRelease(v16);
      }
      goto LABEL_22;
    }
    return 0;
  }
  return theString;
}

void sub_1AFC46814(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC46868(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1AFC468CC(uint64_t a1, void *a2)
{
  uint64_t result = _IMDCopyIMDAttachmentRecordFromXPCObjectClient(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordRowIDForGUID(const __CFString *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      char v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Getting message record for attachment guid %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!a1 || !CFStringGetLength(a1)) {
      return 0;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0xD010000000;
    int v26 = &unk_1AFCE00D7;
    memset(v27, 0, sizeof(v27));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v27);
    IMDSqlOperationBeginTransaction((void *)(*((void *)&buf + 1) + 32));
    uint64_t v15 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    long long v17 = sub_1AFC46D50;
    xpc_object_t v18 = &unk_1E5F8EB38;
    p_long long buf = &buf;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFC46DB0;
    v14[3] = &unk_1E5F9D3D8;
    v14[4] = a1;
    id RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(@"SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;",
                                     &v15,
                                     (uint64_t)v14);
    uint64_t v4 = RowsForQueryWithBindingBlock;
    if (v15)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_21;
      }
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      *(_DWORD *)id v20 = 138412290;
      uint64_t v21 = v15;
      CFArrayRef v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
      uint64_t v7 = v5;
      uint32_t v8 = 12;
    }
    else
    {
      if ([RowsForQueryWithBindingBlock count])
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "firstObject"), "objectForKey:", @"ROWID"), "integerValue");
        if (IMOSLoggingEnabled())
        {
          uint64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v20 = 134218242;
            uint64_t v21 = v9;
            __int16 v22 = 2112;
            CFStringRef v23 = a1;
            _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Got ROWID %lu for GUID %@", v20, 0x16u);
          }
        }

        v17((uint64_t)v16);
        goto LABEL_22;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_21;
      }
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_21;
      }
      *(_WORD *)id v20 = 0;
      CFArrayRef v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
      uint64_t v7 = v11;
      uint32_t v8 = 2;
    }
    _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, v6, v20, v8);
LABEL_21:

    v17((uint64_t)v16);
    uint64_t v9 = 0;
    goto LABEL_22;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  v13[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v13[1] = (void (*)(void))3221225472;
  v13[2] = (void (*)(void))sub_1AFC46DC0;
  v13[3] = (void (*)(void))&unk_1E5F8D580;
  v13[4] = (void (*)(void))&buf;
  __syncXPCIMDAttachmentRecordRIDForGUID_IPCAction(v13, (uint64_t)a1);
  uint64_t v9 = *(void *)(*((void *)&buf + 1) + 24);
LABEL_22:
  _Block_object_dispose(&buf, 8);
  return v9;
}

void sub_1AFC46D30()
{
}

void sub_1AFC46D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

BOOL sub_1AFC46D50(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 32;
  return IMDSqlOperationRelease(v2, 0);
}

void sub_1AFC46DB0(uint64_t a1, uint64_t a2)
{
}

int64_t sub_1AFC46DC0(uint64_t a1, xpc_object_t xdict)
{
  int64_t result = xpc_dictionary_get_int64(xdict, "rrid");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyMessageForAttachmentGUID(const __CFString *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Getting message record for attachment guid %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!a1 || !CFStringGetLength(a1)) {
      return 0;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0xD010000000;
    __int16 v36 = &unk_1AFCE00D7;
    memset(v37, 0, 176);
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v37);
    IMDSqlOperationBeginTransaction((void *)(*((void *)&buf + 1) + 32));
    uint64_t v27 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    uint64_t v29 = sub_1AFC474BC;
    uint64_t v30 = &unk_1E5F8EB38;
    p_long long buf = &buf;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1AFC4751C;
    v26[3] = &unk_1E5F9D3D8;
    v26[4] = a1;
    id RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(@"SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;",
                                     &v27,
                                     (uint64_t)v26);
    id v4 = RowsForQueryWithBindingBlock;
    if (v27)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_37;
      }
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_37;
      }
      *(_DWORD *)uint64_t v32 = 138412290;
      uint64_t v33 = v27;
      CFArrayRef v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
      uint64_t v7 = v5;
      uint32_t v8 = 12;
LABEL_11:
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, v6, v32, v8);
LABEL_37:
      v29((uint64_t)v28);
      goto LABEL_38;
    }
    if (![RowsForQueryWithBindingBlock count])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_37;
      }
      xpc_object_t v18 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_37;
      }
      *(_WORD *)uint64_t v32 = 0;
      CFArrayRef v6 = "kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
      uint64_t v7 = v18;
      uint32_t v8 = 2;
      goto LABEL_11;
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(RowsForQueryWithBindingBlock, "firstObject"), "objectForKey:", @"ROWID"), "integerValue");
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v32 = 134217984;
        uint64_t v33 = v10;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Looking up message ID that corresponds to attachment ID %lld", v32, 0xCu);
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1AFC4752C;
    v25[3] = &unk_1E5F9D3D8;
    v25[4] = v10;
    id v12 = _IMDSqlOperationGetRowsForQueryWithBindingBlock(@"SELECT message_id FROM message_attachment_join WHERE attachment_id = ?;",
            &v27,
            (uint64_t)v25);
    id v13 = v12;
    if (v27)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_36;
      }
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      *(_DWORD *)uint64_t v32 = 138412290;
      uint64_t v33 = v27;
      uint64_t v15 = "kIMDAttachmentRecordGetMessageIDFromAttachmentID returned error %@";
      int v16 = v14;
      uint32_t v17 = 12;
    }
    else
    {
      if ([v12 count])
      {
        int64_t v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "firstObject"), "objectForKey:", @"message_id"), "integerValue");
        if (IMOSLoggingEnabled())
        {
          id v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v32 = 134217984;
            uint64_t v33 = v19;
            _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Looking up message record corresponding to %lld", v32, 0xCu);
          }
        }
        uint64_t v9 = IMDMessageRecordCopyMessageForRowID(v19);
        IMDSqlOperationFinishQuery(*((void *)&buf + 1) + 32);
        IMDSqlOperationCommitOrRevertTransaction((void *)(*((void *)&buf + 1) + 32));
        IMDSqlOperationRelease(*((void *)&buf + 1) + 32, 0);
        if (v9) {
          goto LABEL_39;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v32 = 134217984;
            uint64_t v33 = v19;
            _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Failed to look up message record for messsage_id %llu", v32, 0xCu);
          }
        }
        goto LABEL_38;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_36;
      }
      __int16 v22 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      *(_WORD *)uint64_t v32 = 0;
      uint64_t v15 = "kIMDAttachmentRecordGetMessageIDFromAttachmentID returned zero results";
      int v16 = v22;
      uint32_t v17 = 2;
    }
    _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, v15, v32, v17);
LABEL_36:
    v29((uint64_t)v28);
LABEL_38:
    uint64_t v9 = 0;
    goto LABEL_39;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  __int16 v36 = 0;
  v24[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v24[1] = (void (*)(void))3221225472;
  v24[2] = (void (*)(void))sub_1AFC4753C;
  v24[3] = (void (*)(void))&unk_1E5F8D580;
  v24[4] = (void (*)(void))&buf;
  __syncXPCIMDAttachmentRecordCopyMessageForAttachmentGUID_IPCAction(v24, (uint64_t)a1);
  uint64_t v9 = *(void *)(*((void *)&buf + 1) + 24);
LABEL_39:
  _Block_object_dispose(&buf, 8);
  return v9;
}

void sub_1AFC4749C()
{
}

void sub_1AFC474A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

BOOL sub_1AFC474BC(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 32;
  return IMDSqlOperationRelease(v2, 0);
}

void sub_1AFC4751C(uint64_t a1, uint64_t a2)
{
}

void sub_1AFC4752C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1AFC4753C(uint64_t a1, void *a2)
{
  uint64_t result = _IMDCopyIMDMessageRecordFromXPCObjectClient(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentStickers(int64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    uint64_t v27 = sub_1AFC47910;
    uint64_t v28 = sub_1AFC47920;
    uint64_t v29 = 0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    v31[3] = (uint64_t)Mutable;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1AFC4792C;
    v23[3] = &unk_1E5F909D0;
    v23[4] = &v24;
    v23[5] = @"SELECT sticker_user_info, filename, created_date, attribution_info FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWint ID = ma.attachment_id INNER JOIN message m ON ma.message_id = m.ROWID WHERE a.sticker_user_info IS NOT NULL AND m.is_from_me=1 AND a.transfer_state=5 GROUP BY filename ORDER BY a.ROWID DESC LIMIT ?;";
    v23[6] = a1;
    IMDRunSqlOperation((uint64_t)v23);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)v25[5];
    uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v34 count:16];
    if (v3)
    {
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v5 valueForKey:@"attribution_info"];
          CFArrayRef v6 = (void *)JWDecodeDictionary();
          uint64_t v7 = [v6 valueForKey:@"accessl"];
          uint32_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          if (v7)
          {
            uint64_t v9 = [v5 valueForKey:@"filename"];
            uint64_t v10 = [v5 valueForKey:@"sticker_user_info"];
            uint64_t v11 = [v5 valueForKey:@"created_date"];
            uint64_t v12 = [v6 valueForKey:@"accessl"];
          }
          else
          {
            uint64_t v9 = [v5 valueForKey:@"filename"];
            uint64_t v10 = [v5 valueForKey:@"sticker_user_info"];
            uint64_t v11 = [v5 valueForKey:@"created_date"];
            uint64_t v12 = [v5 valueForKey:@"filename"];
          }
          id v13 = (const void *)objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"filename", v10, @"sticker_user_info", v11, @"created_date", v12, @"accessibility_string", 0);
          CFArrayAppendValue((CFMutableArrayRef)v31[3], v13);
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v34 count:16];
      }
      while (v3);
    }

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v18[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v18[1] = (void (*)(void))3221225472;
    v18[2] = (void (*)(void))sub_1AFC479C8;
    v18[3] = (void (*)(void))&unk_1E5F8D580;
    v18[4] = (void (*)(void))&v30;
    __syncXPCIMDAttachmentRecordCopyStickers_IPCAction(v18, a1);
  }
  uint64_t v14 = v31[3];
  _Block_object_dispose(&v30, 8);
  return v14;
}

void sub_1AFC478D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1AFC47910(uint64_t a1, uint64_t a2)
{
}

void sub_1AFC47920(uint64_t a1)
{
}

id sub_1AFC4792C(void *a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC479BC;
  v7[3] = &unk_1E5F90128;
  CFStringRef v4 = (const __CFString *)a1[5];
  uint64_t v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  id result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(void *)(*(void *)(a1[4] + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  return result;
}

void sub_1AFC479BC(uint64_t a1)
{
}

void sub_1AFC479C8(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    CFStringRef v4 = value;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    size_t count = xpc_array_get_count(v4);
    if (count)
    {
      size_t v6 = count;
      for (size_t i = 0; i != v6; ++i)
      {
        xpc_array_get_dictionary(v4, i);
        uint64_t v8 = IMGetXPCStringFromDictionary();
        uint64_t v9 = IMGetXPCDataFromDictionary();
        uint64_t v10 = IMGetXPCIntFromDictionary();
        uint64_t v11 = (const void *)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, @"filename", v9, @"sticker_user_info", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", v10), @"created_date", IMGetXPCStringFromDictionary(), @"accessibility_string", 0);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v11);
      }
    }
  }
}

const void *IMDAttachmentCopyAttachmentWithStickerPath(CFStringRef theString)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (theString && CFStringGetLength(theString) > 0)
  {
    if (!IMDIsRunningInDatabaseServerProcess())
    {
      *(void *)&long long v14 = 0;
      *((void *)&v14 + 1) = &v14;
      uint64_t v15 = 0x2020000000;
      uint64_t v16 = 0;
      v10[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v10[1] = (void (*)(void))3221225472;
      v10[2] = (void (*)(void))sub_1AFC47E7C;
      v10[3] = (void (*)(void))&unk_1E5F8D580;
      v10[4] = (void (*)(void))&v14;
      __syncXPCIMDAttachmentRecordCopyStickerAttachmentForStickerCachePath_IPCAction(v10, (uint64_t)theString);
      size_t v6 = *(const void **)(*((void *)&v14 + 1) + 24);
LABEL_19:
      _Block_object_dispose(&v14, 8);
      return v6;
    }
    *(void *)&long long v14 = 0;
    *((void *)&v14 + 1) = &v14;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFC47E18;
    v11[3] = &unk_1E5F900E0;
    v11[4] = &v14;
    v11[5] = theString;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state FROM attachment WHERE filename LIKE ?;",
      (uint64_t)v11);
    CFArrayRef v2 = *(const __CFArray **)(*((void *)&v14 + 1) + 24);
    if (v2)
    {
      int Count = CFArrayGetCount(v2);
      if (Count >= 2)
      {
        if (IMOSLoggingEnabled())
        {
          CFStringRef v4 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v13 = theString;
            _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "There appears to be more than one sticker with sticker path [%@]", buf, 0xCu);
          }
        }
        goto LABEL_15;
      }
      if (Count == 1)
      {
LABEL_15:
        CFArrayGetValueAtIndex(*(CFArrayRef *)(*((void *)&v14 + 1) + 24), 0);
        int ID = CSDBRecordGetID();
        size_t v6 = IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E4F1CF80], ID);
        goto LABEL_17;
      }
    }
    size_t v6 = 0;
LABEL_17:
    uint64_t v8 = *(const void **)(*((void *)&v14 + 1) + 24);
    if (v8) {
      CFRelease(v8);
    }
    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v14) = 138412290;
      *(void *)((char *)&v14 + 4) = theString;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Invalid parameter to IMDAttachmentCountAttachmentsWithStickerPath stickerCachePath %@", (uint8_t *)&v14, 0xCu);
    }
  }
  return 0;
}

uint64_t sub_1AFC47E18(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1AFC47E7C(uint64_t a1, void *a2)
{
  uint64_t result = _IMDCopyIMDAttachmentRecordFromXPCObjectClient(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _IMDAttachmentRecordProcessStickerPathAttachmentCount(uint64_t result)
{
  if (!result) {
    return -1;
  }
  return result;
}

uint64_t IMDAttachmentRecordDoesStickerPathHaveAttachments(CFStringRef theString)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (theString && CFStringGetLength(theString) > 0)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0;
    if (IMDIsRunningInDatabaseServerProcess())
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = sub_1AFC480BC;
      v6[3] = &unk_1E5F900E0;
      v6[4] = &buf;
      v6[5] = theString;
      _IMDPerformLockedStatementBlockWithQuery(@"SELECT count(rowid) FROM Attachment WHERE is_sticker = 1 AND filename LIKE ?;",
        (uint64_t)v6);
    }
    else
    {
      v5[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v5[1] = (void (*)(void))3221225472;
      v5[2] = (void (*)(void))sub_1AFC48110;
      v5[3] = (void (*)(void))&unk_1E5F8D580;
      v5[4] = (void (*)(void))&buf;
      __syncXPCIMDAttachmentRecordDoesStickerPathHaveAttachments_IPCAction(v5, (uint64_t)theString);
    }
    uint64_t v3 = *(void *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CFArrayRef v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = theString;
        _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Invalid parameter to IMDAttachmentCountAttachmentsWithStickerPath stickerCachePath %@", (uint8_t *)&buf, 0xCu);
      }
    }
    return 0;
  }
  return v3;
}

void sub_1AFC48084(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC480BC(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  uint64_t result = CSDBSqliteStatementIntegerResult();
  if (result) {
    int v3 = result;
  }
  else {
    int v3 = -1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

int64_t sub_1AFC48110(uint64_t a1, xpc_object_t xdict)
{
  int64_t result = xpc_dictionary_get_int64(xdict, "int64_result");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFStringRef IMDAttachmentRecordCopyAttachmentForGUIDUnlocked(CFStringRef theString)
{
  CFStringRef v1 = theString;
  if (!theString) {
    return v1;
  }
  if (!CFStringGetLength(theString)) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1AFC482CC;
  v14[3] = &unk_1E5F900E0;
  v14[4] = &v15;
  void v14[5] = v1;
  _IMDPerformLockedStatementBlockWithQuery(@"SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state FROM attachment WHERE guid = ? ORDER BY ROWID DESC;",
    (uint64_t)v14);
  CFArrayRef v2 = (const __CFArray *)v16[3];
  if (!v2) {
    goto LABEL_10;
  }
  int Count = CFArrayGetCount(v2);
  if (Count >= 2)
  {
    CFStringRef v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1AFC7171C((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
    }
    goto LABEL_9;
  }
  if (Count != 1)
  {
LABEL_10:
    CFStringRef v1 = 0;
    goto LABEL_11;
  }
LABEL_9:
  CFArrayGetValueAtIndex((CFArrayRef)v16[3], 0);
  int ID = CSDBRecordGetID();
  CFStringRef v1 = (CFStringRef)IMDAttachmentRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E4F1CF80], ID);
LABEL_11:
  uint64_t v12 = (const void *)v16[3];
  if (v12) {
    CFRelease(v12);
  }
  _Block_object_dispose(&v15, 8);
  return v1;
}

void sub_1AFC482A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC482CC(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyRecentFilenames(int64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1AFC48548;
    v4[3] = &unk_1E5F900E0;
    v4[4] = &v6;
    void v4[5] = a1;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT filename from attachment where mime_type in (\"image/jpeg\", \"image/png\", \"image/gif\")  order by ROWID DESC LIMIT ?", (uint64_t)v4);
  }
  else
  {
    v5[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))sub_1AFC48474;
    v5[3] = (void (*)(void))&unk_1E5F8D580;
    v5[4] = (void (*)(void))&v6;
    __syncXPCIMDAttachmentRecordCopyRecentFilenames_IPCAction(v5, a1);
  }
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

void sub_1AFC48458(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AFC48474(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    CFStringRef v4 = value;
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v6 = count;
      size_t v7 = 0;
      uint64_t v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        }
        string = xpc_array_get_string(v4, v7);
        if (string)
        {
          uint64_t v10 = (const void *)[NSString stringWithUTF8String:string];
          if (v10) {
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
          }
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

uint64_t sub_1AFC48548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if (result == 100)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    do
    {
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0))
      {
        uint64_t v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        CFStringRef v10 = CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
        if (v10)
        {
          CFStringRef v11 = v10;
          uint64_t v12 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          if (!v12)
          {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
            uint64_t v12 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          }
          CFArrayAppendValue(v12, v11);
          CFRelease(v11);
        }
      }
      uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while (result == 100);
  }
  return result;
}

void IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState(sqlite3_int64 a1, sqlite3_int64 a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 134217984;
      *(void *)((char *)v6 + 4) = a1;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Request to mark attachment with ROWID %lld as failed to upload to cloudKit", (uint8_t *)v6, 0xCu);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    memset(v7, 0, sizeof(v7));
    memset(v6, 0, sizeof(v6));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v6);
    _IMDSqlOperationBeginQuery((uint64_t)v6, @"update attachment set ck_sync_state = ? where rowid=?");
    IMDSqlStatementBindInt64((uint64_t)v7, a2);
    IMDSqlStatementBindInt64((uint64_t)v7, a1);
    IMDSqlOperationFinishQuery((uint64_t)v6);
    IMDSqlOperationRelease((uint64_t)v6, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState_IPCAction(0, a1, a2);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 134217984;
      *(void *)((char *)v6 + 4) = a1;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Finished marking attachment with ROWID %lld as failed to upload (2)", (uint8_t *)v6, 0xCu);
    }
  }
}

void IMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit(sqlite3_int64 a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LODWORD(v4[0]) = 134217984;
      *(void *)((char *)v4 + 4) = a1;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Request to mark attachment with ROWID %lld as clean", (uint8_t *)v4, 0xCu);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    memset(v5, 0, sizeof(v5));
    memset(v4, 0, sizeof(v4));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v4);
    _IMDSqlOperationBeginQuery((uint64_t)v4, @"update attachment set ck_sync_state = 1,transfer_state = 5 where rowid=?");
    IMDSqlStatementBindInt64((uint64_t)v5, a1);
    IMDSqlOperationFinishQuery((uint64_t)v4);
    IMDSqlOperationRelease((uint64_t)v4, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit_IPCAction(0, a1);
  }
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(v4[0]) = 134217984;
      *(void *)((char *)v4 + 4) = a1;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Finished marking attachment with ROWID %lld as clean", (uint8_t *)v4, 0xCu);
    }
  }
}

void IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync()
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, @"update attachment set ck_sync_state=0, ck_server_change_token_blob='', ck_record_id='';",
      (uint64_t)&unk_1F084D000);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "Returned from DB call after marking all attachments as dirty.", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1AFC48AFC()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordMarkAllAttachmentsAsNeedingCloudKitSync updated attachments as dirty ", v1, 2u);
    }
  }
}

void IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState()
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, @"UPDATE attachment SET ck_sync_state == 1 WHERE ck_sync_state == 5;",
      (uint64_t)&unk_1F084D1E0);
    IMDSqlOperationExecuteQuery((uint64_t)v2, @"UPDATE attachment SET ck_sync_state=0 where ck_sync_state in (2,3,5) OR (ck_sync_state==1 AND guid not like \"at_%\");",
      (uint64_t)&unk_1F084D060);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCIMDAttachmentResetAllAttachmentsInFailedCloudDownloadState_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState Returned from DB call after resetting all failed cloud attachment downloads.", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1AFC48D10()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState update all failed cloud attachment downloads ", v1, 2u);
    }
  }
}

void sub_1AFC48DB0()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentResetAllAttachmentsInFailedCloudDownloadState reset all failed cloud attachments ", v1, 2u);
    }
  }
}

uint64_t IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "Request to fetch the non synced attachment disk space", buf, 2u);
    }
  }
  *(void *)long long buf = 0;
  uint64_t v8 = buf;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _OWORD v6[2] = sub_1AFC49090;
    v6[3] = &unk_1E5F8FF50;
    v6[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT sum(total_bytes) FROM attachment WHERE ck_sync_state != 1 AND hide_attachment == 0 ORDER BY created_date ASC;",
      (uint64_t)v6);
    if (IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        uint64_t v2 = *((void *)v8 + 3);
        *(_DWORD *)CFStringRef v11 = 134217984;
        uint64_t v12 = v2;
        _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "Returning non synced attachment disk space with: %lld bytes", v11, 0xCu);
      }
    }
  }
  else
  {
    v5[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v5[1] = (void (*)(void))3221225472;
    v5[2] = (void (*)(void))sub_1AFC490C8;
    v5[3] = (void (*)(void))&unk_1E5F8D580;
    v5[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordGetNonSyncedAttachmentDiskSpace_IPCAction(v5);
  }
  uint64_t v3 = *((void *)v8 + 3);
  _Block_object_dispose(buf, 8);
  return v3;
}

uint64_t sub_1AFC49090(uint64_t a1)
{
  uint64_t result = CSDBSqliteStatementInteger64Result();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

int64_t sub_1AFC490C8(uint64_t a1, xpc_object_t xdict)
{
  int64_t result = xpc_dictionary_get_int64(xdict, "diskSpace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordGetPurgeableDiskSpace()
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "Request to fetch the purgeable disk space", buf, 2u);
    }
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)long long buf = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    _IMDSqlOperationBeginQuery((uint64_t)buf, @"SELECT filename, total_bytes FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL;");
    uint64_t v1 = 0;
    uint64_t v2 = 0;
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      IMDSqlOperationColumnByIndex((uint64_t)buf, 0, (uint64_t)v13);
      uint64_t v3 = (unsigned __int8 *)IMDStringFromSqlColumn((uint64_t)v13);
      IMDSqlOperationColumnByIndex((uint64_t)buf, 1, (uint64_t)v12);
      sqlite3_int64 v4 = IMDInt64FromSqlColumn((uint64_t)v12);
      if ([v3 length]
        && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", @"~", @"/var/mobile")))
      {
        v26[3] += v4;
        ++v1;
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = [v3 stringByReplacingOccurrencesOfString:@"~" withString:@"/var/mobile"];
          *(_DWORD *)uint64_t v29 = 138412290;
          uint64_t v30 = v6;
          _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "File does not exist at path %@", v29, 0xCu);
        }
      }

      ++v2;
    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    IMDSqlOperationRelease((uint64_t)buf, 0);
    if (IMOSLoggingEnabled())
    {
      CFAllocatorRef v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = v26[3];
        *(_DWORD *)uint64_t v29 = 134218496;
        uint64_t v30 = v8;
        __int16 v31 = 2048;
        uint64_t v32 = v1;
        __int16 v33 = 2048;
        uint64_t v34 = v2;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "returning purgeable disk space results (%lld) to delete number of attachments to delete (%lld) number of attachments total (%lld) ", v29, 0x20u);
      }
    }
  }
  else
  {
    v11[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v11[1] = (void (*)(void))3221225472;
    v11[2] = (void (*)(void))sub_1AFC494BC;
    v11[3] = (void (*)(void))&unk_1E5F8D580;
    uint8_t v11[4] = (void (*)(void))&v25;
    __syncXPCIMDAttachmentRecordGetPurgeableDiskSpace_IPCAction(v11);
  }
  uint64_t v9 = v26[3];
  _Block_object_dispose(&v25, 8);
  return v9;
}

int64_t sub_1AFC494BC(uint64_t a1, xpc_object_t xdict)
{
  int64_t result = xpc_dictionary_get_int64(xdict, "purgeableDiskSpace");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace(int64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Request to copy attachments to metric what we would purge", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    *(void *)long long buf = 0;
    uint64_t v12 = buf;
    uint64_t v13 = 0x2020000000;
    LODWORD(v14) = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1AFC497B8;
    v10[3] = &unk_1E5F8FF50;
    v10[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT COUNT(*) FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL;",
      (uint64_t)v10);
    uint64_t v3 = arc4random_uniform(*((_DWORD *)v12 + 6));
    if (IMOSLoggingEnabled())
    {
      sqlite3_int64 v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
        uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)v12 + 6)];
        *(_DWORD *)long long v15 = 138412546;
        uint64_t v16 = v5;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Offset we are choosing: %@ number of available records: %@", v15, 0x16u);
      }
    }
    uint64_t v7 = IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace(a1, v3);
  }
  else
  {
    *(void *)long long buf = 0;
    uint64_t v12 = buf;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    v9[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v9[1] = (void (*)(void))3221225472;
    v9[2] = (void (*)(void))sub_1AFC49BF8;
    v9[3] = (void (*)(void))&unk_1E5F8D580;
    v9[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace_IPCAction(v9, a1);
    uint64_t v7 = *((void *)v12 + 3);
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

void sub_1AFC49754(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC4968CLL);
  }
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1AFC497B8(uint64_t a1)
{
  uint64_t result = CSDBSqliteStatementIntegerResult();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace(int64_t a1, int a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    sqlite3_int64 v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a2;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Request to copy attachments to purge from disk that have been synced to CloudKit with bytes to free up: %lld starting offset: %d", buf, 0x12u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    CFMutableArrayRef Mutable = 0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    int v27 = a2;
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2020000000;
    BOOL v25 = a1 < 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    uint64_t v13 = sub_1AFC4A3CC;
    uint64_t v14 = &unk_1E5F9D450;
    int v21 = a2;
    long long v15 = v26;
    uint64_t v16 = &v22;
    uint64_t v19 = @"SELECT ROWID, guid, created_date, start_date, filename, uti, mime_type, transfer_state, is_outgoing, user_info, transfer_name, total_bytes, is_sticker, sticker_user_info, attribution_info, hide_attachment, ck_sync_state, ck_server_change_token_blob, ck_record_id, original_guid, is_commsafety_sensitive, emoji_image_content_identifier, emoji_image_short_description, preview_generation_state FROM attachment WHERE ck_sync_state == 1 AND transfer_state == 5 AND ck_server_change_token_blob != '' AND ck_server_change_token_blob NOT NULL ORDER BY created_date ASC LIMIT ? OFFSET ?;";
    int64_t v20 = a1;
    __int16 v17 = &v28;
    uint64_t v18 = buf;
    while (!*((unsigned char *)v23 + 24))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int64_t v6 = a1 - v29[3];
          *(_DWORD *)uint64_t v32 = 134217984;
          int64_t v33 = v6;
          _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Going to try and free up disk space with remaining bytes to free up: %lld", v32, 0xCu);
        }
      }
      v13((uint64_t)v12);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)&buf[8] + 24));
        *(_DWORD *)uint64_t v32 = 67109120;
        LODWORD(v33) = Count;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "returning results (%d) to delete ", v32, 8u);
      }
    }
    uint64_t v7 = *(void *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    CFMutableArrayRef Mutable = 0;
    v11[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v11[1] = (void (*)(void))3221225472;
    v11[2] = (void (*)(void))sub_1AFC4A6D0;
    v11[3] = (void (*)(void))&unk_1E5F8D580;
    uint8_t v11[4] = (void (*)(void))buf;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace_IPCAction(v11, a1, a2);
    uint64_t v7 = *(void *)(*(void *)&buf[8] + 24);
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

void sub_1AFC49B6C(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC49AF4);
  }
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(exc_buf);
}

void sub_1AFC49B8C()
{
}

void sub_1AFC49BF8(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    uint64_t v4 = value;
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v6 = count;
      size_t v7 = 0;
      uint64_t v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        }
        xpc_object_t v9 = xpc_array_get_value(v4, v7);
        uint64_t v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
        if (v10) {
          CFRelease(v10);
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

__CFDictionary *IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChatsTest(int64_t a1, int64_t a2)
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    CFMutableDictionaryRef v31 = 0;
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3052000000;
    BOOL v25 = sub_1AFC47910;
    uint64_t v26 = sub_1AFC47920;
    uint64_t v27 = 0;
    uint64_t v27 = [MEMORY[0x1E4F1C978] array];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1AFC4A0E8;
    v21[3] = &unk_1E5F909D0;
    v21[4] = &v22;
    v21[5] = @"SELECT DISTINCT chat_id FROM (SELECT chat_id,message_date FROM chat_message_join ORDER BY message_date desc) ORDER BY message_date DESC LIMIT ?;";
    v21[6] = a1;
    IMDRunSqlOperation((uint64_t)v21);
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1CF80];
    while (v5 < [(id)v23[5] count])
    {
      size_t v7 = (const void *)[NSString stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend((id)v23[5], "objectAtIndexedSubscript:", v5), "valueForKey:", @"chat_id"];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1AFC4A184;
      v20[3] = &unk_1E5F9BC80;
      uint8_t v20[4] = v7;
      v20[5] = &v28;
      v20[6] = a2;
      _IMDPerformLockedStatementBlockWithQuery(@"SELECT a.ROWID, a.guid, a.is_sticker, a.transfer_name, a.filename FROM attachment a JOIN (SELECT ma.attachment_id as a_id, message_date as m_date FROM message_attachment_join ma JOIN (SELECT cm.message_id as message_id, cm.message_date as message_date FROM message m JOIN chat_message_join cm WHERE m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id = ? AND m.rowid = cm.message_id) as tmp WHERE ma.message_id = tmp.message_id) as tmp2 WHERE a.rowid = tmp2.a_id ORDER BY tmp2.m_date DESC LIMIT ?", (uint64_t)v20);
      CFArrayRef v8 = (const __CFArray *)v29[3];
      if (v8) {
        int Count = CFArrayGetCount(v8);
      }
      else {
        int Count = 0;
      }
      uint64_t v10 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      if (Count >= 1)
      {
        CFIndex v11 = 0;
        if (Count <= 1uLL) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = Count;
        }
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v29[3], v11);
          int ID = CSDBRecordGetID();
          uint64_t v14 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v6, ID);
          CFArrayAppendValue(v10, v14);
          if (v14) {
            CFRelease(v14);
          }
          ++v11;
        }
        while (v12 != v11);
      }
      CFDictionarySetValue(Mutable, v7, v10);
      if (v10) {
        CFRelease(v10);
      }
      long long v15 = (const void *)v29[3];
      if (v15)
      {
        CFRelease(v15);
        v29[3] = 0;
      }
      ++v5;
    }
    __int16 v17 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFArrayAppendValue(v17, Mutable);
    _Block_object_dispose(&v22, 8);
    uint64_t v16 = &v28;
  }
  else
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2020000000;
    BOOL v25 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    CFMutableDictionaryRef v31 = 0;
    CFMutableDictionaryRef v31 = CFDictionaryCreateMutable(0, 0, 0, 0);
    v19[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v19[1] = (void (*)(void))3221225472;
    v19[2] = (void (*)(void))sub_1AFC4A1F4;
    v19[3] = (void (*)(void))&unk_1E5F900B8;
    v19[4] = (void (*)(void))&v22;
    void v19[5] = (void (*)(void))&v28;
    __syncXPCIMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats_IPCAction(v19, a1, a2);
    CFMutableArrayRef Mutable = (__CFDictionary *)v29[3];
    _Block_object_dispose(&v28, 8);
    uint64_t v16 = &v22;
  }
  _Block_object_dispose(v16, 8);
  return Mutable;
}

void sub_1AFC4A07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

id sub_1AFC4A0E8(void *a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC4A178;
  v7[3] = &unk_1E5F90128;
  CFStringRef v4 = (const __CFString *)a1[5];
  uint64_t v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  id result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(void *)(*(void *)(a1[4] + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  return result;
}

void sub_1AFC4A178(uint64_t a1)
{
}

uint64_t sub_1AFC4A184(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

xpc_object_t sub_1AFC4A1F4(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result = xpc_dictionary_get_value(xdict, "dictionary_result");
  if (result)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    _OWORD v4[2] = sub_1AFC4A288;
    v4[3] = &unk_1E5F9D400;
    long long v5 = *(_OWORD *)(a1 + 32);
    return (xpc_object_t)xpc_dictionary_apply(result, v4);
  }
  return result;
}

uint64_t sub_1AFC4A288(uint64_t a1, uint64_t a2, xpc_object_t xarray)
{
  if (xpc_array_get_count(xarray))
  {
    size_t v6 = 0;
    size_t v7 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    do
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v7);
      }
      xpc_object_t value = xpc_array_get_value(xarray, v6);
      xpc_object_t v9 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(value);
      id v10 = IMDAttachmentRecordCopyFilename(0, (uint64_t)v9, 0);
      if (v10)
      {
        CFIndex v11 = v10;
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
        CFRelease(v11);
      }
      if (v9) {
        CFRelease(v9);
      }
      ++v6;
    }
    while (xpc_array_get_count(xarray) > v6);
  }
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (id)[[NSString alloc] initWithUTF8String:a2], *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v12 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return 1;
}

void sub_1AFC4A3CC(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v2 = *(void *)(a1 + 64);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = sub_1AFC4A658;
  v16[3] = &unk_1E5F9D428;
  v16[4] = *(void *)(a1 + 32);
  v16[5] = &v17;
  _IMDPerformLockedStatementBlockWithQuery(v2, (uint64_t)v16);
  CFArrayRef v3 = (const __CFArray *)v18[3];
  if (!v3)
  {
    int v5 = 0;
    goto LABEL_7;
  }
  int Count = CFArrayGetCount(v3);
  int v5 = Count;
  if (!Count)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:
    if (v5 < 1) {
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  if (Count <= 49)
  {
    if (*(_DWORD *)(a1 + 80)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:
  CFIndex v6 = 0;
  uint64_t v7 = *MEMORY[0x1E4F1CF80];
  while (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 72))
  {
    CFArrayGetValueAtIndex((CFArrayRef)v18[3], v6);
    int ID = CSDBRecordGetID();
    xpc_object_t v9 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v7, ID);
    id v10 = IMDAttachmentRecordCopyFilename(0, (uint64_t)v9, 0);
    if ([v10 length]
      && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v10))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += IMDAttachmentRecordGetTotalBytes((uint64_t)v9);
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v9);
    }

    if (v9) {
      CFRelease(v9);
    }
    if (v5 == ++v6) {
      goto LABEL_19;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_19:
  CFIndex v11 = (const void *)v18[3];
  if (v11) {
    CFRelease(v11);
  }
  int v12 = *(_DWORD *)(a1 + 80);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  int v14 = *(_DWORD *)(v13 + 24);
  if (v12 < 1) {
    goto LABEL_30;
  }
  if (v14 >= v12 || v14 + 50 < v12)
  {
    if (v5 <= 49 && v14 >= v12)
    {
      *(_DWORD *)(v13 + 24) = 0;
      goto LABEL_31;
    }
LABEL_30:
    *(_DWORD *)(v13 + 24) = v14 + v5;
    goto LABEL_31;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_31:
  _Block_object_dispose(&v17, 8);
}

void sub_1AFC4A624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4A658(uint64_t a1)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1AFC4A6D0(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    CFStringRef v4 = value;
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v6 = count;
      size_t v7 = 0;
      CFArrayRef v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        }
        xpc_object_t v9 = xpc_array_get_value(v4, v7);
        id v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
        if (v10) {
          CFRelease(v10);
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

__CFString *sub_1AFC4A7A0(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 3:
      CFStringRef v4 = @"SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWID = ma.attachment_id INNER JOIN message m ON m.rowid = ma.message_id WHERE a.ck_sync_state == 0 AND m.balloon_bundle_id == 'com.apple.messages.chatbot' ORDER BY a.ROWID LIMIT ? ";
      int v5 = @"SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWID = ma.attachment_id INNER JOIN message m ON m.rowid = ma.message_id WHERE a.ck_sync_state == 0 AND m.balloon_bundle_id == 'com.apple.messages.chatbot' AND a.ROWID > ? ORDER BY a.ROWID LIMIT ? ";
LABEL_7:
      if (a2) {
        return v5;
      }
      else {
        return v4;
      }
    case 2:
      CFStringRef v4 = @"SELECT * FROM attachment a WHERE a.ck_sync_state == 1 AND a.transfer_state == 0 ORDER BY a.ROWID LIMIT ? ";
      int v5 = @"SELECT * FROM attachment a WHERE a.ck_sync_state == 1 AND a.transfer_state == 0 AND a.ROWID > ? ORDER BY a.ROWID LIMIT ? ";
      goto LABEL_7;
    case 1:
      CFStringRef v4 = @"SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWID = ma.attachment_id INNER JOIN message m ON m.rowid = ma.message_id WHERE a.ck_sync_state == 0 AND (m.balloon_bundle_id IS NULL OR m.balloon_bundle_id != 'com.apple.messages.chatbot') ORDER BY a.ROWID LIMIT ? ";
      int v5 = @"SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON a.ROWID = ma.attachment_id INNER JOIN message m ON m.rowid = ma.message_id WHERE a.ck_sync_state == 0 AND (m.balloon_bundle_id IS NULL OR m.balloon_bundle_id != 'com.apple.messages.chatbot') AND a.ROWID > ? ORDER BY a.ROWID LIMIT ? ";
      goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    size_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      CFArrayRef v8 = @"NO";
      if (a2) {
        CFArrayRef v8 = @"YES";
      }
      int v9 = 134218242;
      uint64_t v10 = a1;
      __int16 v11 = 2112;
      int v12 = v8;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentQueryStringForIMAttachmentsQuery unknown IMAttachmentsQuery type %lld, fromRow %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return 0;
}

__CFArray *IMDAttachmentRecordCopyAttachmentsForQueryWithLimit(uint64_t a1, void *a2, int64_t a3)
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    size_t v6 = sub_1AFC4A7A0(a1, a2 != 0);
    if (v6)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1AFC4AB38;
      v19[3] = &unk_1E5F9BC80;
      v19[4] = a2;
      void v19[5] = &v20;
      void v19[6] = a3;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v6, (uint64_t)v19);
      CFArrayRef v7 = (const __CFArray *)v21[3];
      if (v7 && (CFIndex Count = CFArrayGetCount(v7), Count << 32 >= 1))
      {
        CFIndex v9 = 0;
        CFMutableArrayRef Mutable = 0;
        uint64_t v11 = (int)Count;
        uint64_t v12 = *MEMORY[0x1E4F1CF80];
        uint64_t v13 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
        do
        {
          CFArrayGetValueAtIndex((CFArrayRef)v21[3], v9);
          int ID = CSDBRecordGetID();
          long long v15 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v12, ID);
          if (!Mutable) {
            CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, v13);
          }
          CFArrayAppendValue(Mutable, v15);
          if (v15) {
            CFRelease(v15);
          }
          ++v9;
        }
        while (v11 != v9);
      }
      else
      {
        CFMutableArrayRef Mutable = 0;
      }
      uint64_t v16 = (const void *)v21[3];
      if (v16) {
        CFRelease(v16);
      }
    }
    else
    {
      CFMutableArrayRef Mutable = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v18[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v18[1] = (void (*)(void))3221225472;
    v18[2] = (void (*)(void))sub_1AFC4ABB4;
    v18[3] = (void (*)(void))&unk_1E5F8D580;
    v18[4] = (void (*)(void))&v20;
    __syncXPCIMDAttachmentRecordCopyAttachmentsForQueryWithLimit_IPCAction(v18, a1, a2, a3);
    CFMutableArrayRef Mutable = (__CFArray *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  return Mutable;
}

void sub_1AFC4AB0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4AB38(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 longLongValue];
    CSDBSqliteBindInt64();
  }
  CSDBSqliteBindInt64();
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1AFC4ABB4(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    CFStringRef v4 = value;
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v6 = count;
      size_t v7 = 0;
      CFArrayRef v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        }
        xpc_object_t v9 = xpc_array_get_value(v4, v7);
        uint64_t v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
        if (v10) {
          CFRelease(v10);
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

uint64_t _IMDAttachmentRecordGetGuidsAndTransferNamesFromQueryRows(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a1;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v22 != v4) {
          objc_enumerationMutation(obj);
        }
        size_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v7 = [v6 valueForKey:@"guid"];
        CFArrayRef v8 = (void *)[v6 valueForKey:@"transfer_name"];
        StickerPathFromTransferName = (__CFString *)[v6 valueForKey:@"filename"];
        int v10 = objc_msgSend((id)objc_msgSend(v6, "valueForKey:", @"is_sticker"), "intValue");
        if (v10 != 1 || v8 == 0)
        {
          int v12 = v10;
          if (v10 != 1 && v7 != 0) {
            [v18 addObject:v7];
          }
          if (v12 != 1 && StickerPathFromTransferName != 0)
          {
            long long v15 = v17;
LABEL_23:
            [v15 addObject:StickerPathFromTransferName];
            continue;
          }
        }
        else
        {
          StickerPathFromTransferName = _IMDAttachmentRecordGetStickerPathFromTransferName(v8);
          if ([(__CFString *)StickerPathFromTransferName length])
          {
            long long v15 = v19;
            goto LABEL_23;
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v3);
  }
  v25[0] = @"guids";
  v25[1] = @"transfernames";
  v26[0] = v18;
  v26[1] = v19;
  v25[2] = @"filenames";
  v26[2] = v17;
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
}

__CFString *_IMDAttachmentRecordGetStickerPathFromTransferName(void *a1)
{
  if (![a1 containsString:@"sticker"]) {
    return &stru_1F084E970;
  }
  if (![a1 containsString:@"-"]) {
    return &stru_1F084E970;
  }
  uint64_t v2 = (void *)[a1 componentsSeparatedByString:@"-"];
  if (![v2 count]) {
    return &stru_1F084E970;
  }
  uint64_t v3 = (void *)[v2 objectAtIndex:0];
  if ([v3 length]) {
    return (__CFString *)[NSString stringWithFormat:@"%@-%@-sticker", v3, v3];
  }
  return (__CFString *)v3;
}

void IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan(int64_t a1)
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    id v2 = IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats(50, 15);
    GuidsAndTransferNamesFromQueryRows = (void *)_IMDAttachmentRecordGetGuidsAndTransferNamesFromQueryRows(v2);

    uint64_t v4 = (void *)[GuidsAndTransferNamesFromQueryRows objectForKey:@"guids"];
    uint64_t v5 = [(id)IMCachesDirectoryURL() path];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, @"Previews", @"Attachments", 0);
    uint64_t v7 = (void *)[NSString pathWithComponents:v6];
    id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(v4, v7, v10, (void *)[v10 enumeratorAtPath:v7]);
    CFArrayRef v8 = (void *)[GuidsAndTransferNamesFromQueryRows objectForKey:@"transfernames"];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v5, @"Previews", @"StickerCache", 0);
    _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(v8, (void *)[NSString pathWithComponents:v9]);
  }
  else
  {
    __syncXPCIMDAttachmentRecordDeleteAttachmentPreviewsOlderThan_IPCAction(0, a1);
  }
}

id IMDAttachmentRecordCopyMostRecentAttachmentsInMostRecentChats(uint64_t a1, uint64_t a2)
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = sub_1AFC47910;
  long long v21 = sub_1AFC47920;
  uint64_t v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = sub_1AFC4EDC0;
  v16[3] = &unk_1E5F909D0;
  v16[4] = &v17;
  v16[5] = @"SELECT DISTINCT chat_id FROM (SELECT chat_id,message_date FROM chat_message_join ORDER BY message_date desc) ORDER BY message_date DESC LIMIT ?;";
  void v16[6] = a1;
  IMDRunSqlOperation((uint64_t)v16);
  for (unint64_t i = 0; [(id)v18[5] count] > i; ++i)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@", objc_msgSend((id)objc_msgSend((id)v18[5], "objectAtIndexedSubscript:", i), "valueForKey:", @"chat_id"];
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = sub_1AFC47910;
    int v14 = sub_1AFC47920;
    uint64_t v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFC4EE5C;
    v9[3] = &unk_1E5F9D4F0;
    v9[4] = v5;
    v9[5] = &v10;
    void v9[6] = @"SELECT a.ROWID, a.guid, a.is_sticker, a.transfer_name, a.filename FROM attachment a JOIN (SELECT ma.attachment_id as a_id, message_date as m_date FROM message_attachment_join ma JOIN (SELECT cm.message_id as message_id, cm.message_date as message_date FROM message m JOIN chat_message_join cm WHERE m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id = ? AND m.rowid = cm.message_id) as tmp WHERE ma.message_id = tmp.message_id) as tmp2 WHERE a.rowid = tmp2.a_id ORDER BY tmp2.m_date DESC LIMIT ?";
    v9[7] = a2;
    IMDRunSqlOperation((uint64_t)v9);
    if (v11[5])
    {
      objc_msgSend(v8, "addObjectsFromArray:");
    }
    _Block_object_dispose(&v10, 8);
  }
  uint64_t v6 = (const void *)v18[5];
  if (v6)
  {
    CFRelease(v6);
    v18[5] = 0;
  }
  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_1AFC4B30C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)((char *)&v32[2] + 2) = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = (uint64_t)a2;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Deleting previews at %@", buf, 0xCu);
    }
  }
  uint64_t v9 = (void *)[a4 nextObject];
  if (v9)
  {
    int v11 = 501;
    *(void *)&long long v10 = 138412290;
    long long v26 = v10;
    do
    {
      if (!--v11)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = sub_1AFC4BE10;
        v27[3] = &unk_1E5F958C0;
        v27[4] = a1;
        v27[5] = a2;
        v27[6] = a3;
        v27[7] = a4;
        IMDPersistencePerformBlock(v27, 0);
        return;
      }
      int v12 = [a4 level];
      if (v12 == 3)
      {
        if ([a4 level] != 3) {
          goto LABEL_24;
        }
        uint64_t v13 = [v9 lastPathComponent];
        if (IMOSLoggingEnabled())
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v30 = (uint64_t)v9;
            __int16 v31 = 2112;
            v32[0] = v13;
            _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Examining '%@' as it looks like it contains a guid '%@'.", buf, 0x16u);
          }
        }
        if (objc_msgSend(a1, "containsObject:", v13, v26)) {
          goto LABEL_24;
        }
        uint64_t v28 = 0;
        uint64_t v15 = [a2 stringByAppendingPathComponent:v9];
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v26;
            uint64_t v30 = v15;
            _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "To Delete: %@", buf, 0xCu);
          }
        }
        int v17 = [a3 removeItemAtPath:v15 error:&v28];
        int v18 = IMOSLoggingEnabled();
        if (v17)
        {
          if (!v18) {
            goto LABEL_24;
          }
          uint64_t v19 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          *(_DWORD *)long long buf = v26;
          uint64_t v30 = v15;
          uint64_t v20 = v19;
          long long v21 = "Cleaned up '%@'";
          uint32_t v22 = 12;
        }
        else
        {
          if (!v18) {
            goto LABEL_24;
          }
          long long v24 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
            goto LABEL_24;
          }
          *(_DWORD *)long long buf = 138412546;
          uint64_t v30 = v15;
          __int16 v31 = 2112;
          v32[0] = v28;
          uint64_t v20 = v24;
          long long v21 = "Could ~not~ clean up '%@' due to error '%@'.";
          uint32_t v22 = 22;
        }
      }
      else
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_24;
        }
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
          goto LABEL_24;
        }
        *(_DWORD *)long long buf = 138412802;
        uint64_t v30 = (uint64_t)v9;
        __int16 v31 = 1024;
        LODWORD(v32[0]) = v12;
        WORD2(v32[0]) = 1024;
        *(_DWORD *)((char *)v32 + 6) = 3;
        uint64_t v20 = v23;
        long long v21 = "Skipping '%@' as its level is %d and our target level is %d.";
        uint32_t v22 = 24;
      }
      _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, v21, buf, v22);
LABEL_24:
      uint64_t v9 = objc_msgSend(a4, "nextObject", v26);
    }
    while (v9);
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "_IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep File cleanse ended", buf, 2u);
    }
  }
}

void _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "contentsOfDirectoryAtPath:error:", a2, &v32);
  if (v32)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v34 = v32;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Could ~not~ clean up sticker previews due to error '%@'.", buf, 0xCu);
      }
    }
    goto LABEL_30;
  }
  uint64_t v6 = v4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (!v7)
  {
LABEL_30:
    if (IMOSLoggingEnabled())
    {
      BOOL v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "_IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep File cleanse ended", buf, 2u);
      }
    }
    return;
  }
  unsigned int v8 = 0;
  uint64_t v9 = *(void *)v29;
LABEL_7:
  uint64_t v10 = 0;
  unsigned int v11 = v8;
  BOOL v12 = v8 <= 0x1F4;
  unsigned int v13 = 500 - v8;
  unsigned int v26 = v11 + v7;
  if (v12) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  while (1)
  {
    if (*(void *)v29 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
    if (v14 == v10) {
      break;
    }
    if (_IMDAttachmentRecordShouldDeleteSticketPreviewWithFolderName(*(void **)(*((void *)&v28 + 1) + 8 * v10), a1))
    {
      uint64_t v16 = [a2 stringByAppendingPathComponent:v15];
      uint64_t v32 = 0;
      if (IMOSLoggingEnabled())
      {
        int v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v34 = v16;
          _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Sticker Preview to Delete: %@", buf, 0xCu);
        }
      }
      int v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v16, &v32);
      int v19 = IMOSLoggingEnabled();
      if (v18)
      {
        if (!v19) {
          goto LABEL_25;
        }
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 138412290;
        uint64_t v34 = v16;
        long long v21 = v20;
        uint32_t v22 = "Cleaned up sticker preview '%@'";
        uint32_t v23 = 12;
      }
      else
      {
        if (!v19) {
          goto LABEL_25;
        }
        long long v24 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        uint64_t v36 = v32;
        long long v21 = v24;
        uint32_t v22 = "Could ~not~ clean up sticker preview '%@' due to error '%@'.";
        uint32_t v23 = 22;
      }
      _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, v22, buf, v23);
    }
LABEL_25:
    if (v7 == ++v10)
    {
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      unsigned int v8 = v26;
      if (v7) {
        goto LABEL_7;
      }
      goto LABEL_30;
    }
  }
  if (!v15) {
    goto LABEL_30;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1AFC4BD7C;
  v27[3] = &unk_1E5F9D478;
  v27[4] = a1;
  v27[5] = a2;
  IMDPersistencePerformBlock(v27, 0);
}

uint64_t _IMDAttachmentRecordShouldDeleteSticketPreviewWithFolderName(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 length];
  uint64_t result = IMOSLoggingEnabled();
  if (v4)
  {
    if (result)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        uint64_t v10 = a1;
        _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Examining pewview folder name'%@'.", (uint8_t *)&v9, 0xCu);
      }
    }
    if ([a2 containsObject:a1])
    {
      uint64_t result = IMOSLoggingEnabled();
      if (result)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        uint64_t result = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if (result)
        {
          int v9 = 138412290;
          uint64_t v10 = a1;
          unsigned int v8 = "Sticker preview %@ is part of 200 last attachments, not deleting";
LABEL_12:
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
          return 0;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else if (result)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    uint64_t result = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (result)
    {
      int v9 = 138412290;
      uint64_t v10 = a1;
      unsigned int v8 = "Skipping folder %@ as it does not have a valid transfername";
      goto LABEL_12;
    }
  }
  return result;
}

uint64_t sub_1AFC4BD7C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Beginning iteration of _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep attachments", v4, 2u);
    }
  }
  return _IMDAttachmentRecordDeleteStickersExceptPreviewsToKeep(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_1AFC4BE10(void *a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Beginning iteration of _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep attachments", v4, 2u);
    }
  }
  return _IMDAttachmentRecordDeleteAttachmentsExceptPreviewsToKeep(a1[4], a1[5], a1[6], a1[7]);
}

void IMDAttachmentRecordDeleteAttachmentsOlderThanDays(uint64_t a1)
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    sub_1AFC4BF64(a1);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1AFC4BFE8;
    v3[3] = &unk_1E5F901E8;
    void v3[4] = v2;
    _IMDPerformLockedStatementBlockWithQuery(@"DELETE FROM attachment WHERE created_date < ? AND transfer_name != 'GroupPhotoImage';",
      (uint64_t)v3);
  }
  else
  {
    __syncXPCIMDAttachmentRecordDeleteAttachmentsOlderThanDays_IPCAction(0, a1);
  }
}

uint64_t sub_1AFC4BF64(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:-a1];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v4 = objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v2, objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), 0);

  return [v4 timeIntervalSinceReferenceDate];
}

uint64_t sub_1AFC4BFE8()
{
  CSDBSqliteBindInt64();
  CSDBSqliteStatementPerform();
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v15 = a1;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Request to fetch estimate space taken by attachments older than days %llu", buf, 0xCu);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    sub_1AFC4BF64(a1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1AFC4C2EC;
    v8[3] = &unk_1E5F900E0;
    v8[5] = v3;
    v8[4] = &v10;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT filename FROM attachment WHERE created_date < ?;",
      (uint64_t)v8);
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = v11[3];
        *(_DWORD *)long long buf = 134218240;
        uint64_t v15 = a1;
        __int16 v16 = 2048;
        uint64_t v17 = v5;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Request to fetch estimate space taken by attachments older than days %llu returning %llu", buf, 0x16u);
      }
    }
  }
  else
  {
    v9[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v9[1] = (void (*)(void))3221225472;
    v9[2] = (void (*)(void))sub_1AFC4C2AC;
    v9[3] = (void (*)(void))&unk_1E5F8D580;
    v9[4] = (void (*)(void))&v10;
    __syncXPCIMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays_IPCAction(v9, a1);
  }
  uint64_t v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t sub_1AFC4C2AC(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = xpc_dictionary_get_uint64(xdict, "bytes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_1AFC4C2EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  CSDBSqliteStatementPerform();
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v18 = *MEMORY[0x1E4F6D4D0];
    do
    {
      uint64_t v7 = (void *)MEMORY[0x1B3E8A120]();
      unsigned int v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        int v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        unsigned int v8 = (void *)CFStringCreateWithCString(v6, (const char *)v9, 0x8000100u);
      }
      id v10 = v8;
      if (v10)
      {
        uint64_t v11 = v10;
        if ([v10 length])
        {
          uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          uint64_t v20 = 0;
          long long v21 = &v20;
          uint64_t v22 = 0x2020000000;
          uint64_t v23 = 0;
          uint64_t v13 = (void *)[v11 stringByResolvingAndStandardizingPath];
          if (v13)
          {
            uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:v13];
            uint64_t v15 = objc_msgSend(v13, "__im_filePathWithVariant:", v18);
            [v14 addObject:v15];
            objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend(v11, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", @"MOV"));
            objc_msgSend(v14, "addObject:", objc_msgSend((id)objc_msgSend(v15, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", @"MOV"));
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = sub_1AFC51D58;
            v19[3] = &unk_1E5F9D8B0;
            v19[4] = v12;
            void v19[5] = &v20;
            [v14 enumerateObjectsUsingBlock:v19];
          }
          uint64_t v16 = v21[3];
          _Block_object_dispose(&v20, 8);
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v16;
        }
      }
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

void sub_1AFC4C518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id IMDAttachmentFindLargestConversations(unint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = sub_1AFC47910;
  long long v21 = sub_1AFC47920;
  uint64_t v22 = 0;
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Request to fetch largest non synced conversations", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    *(void *)long long buf = 0;
    uint64_t v11 = buf;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = sub_1AFC47910;
    uint64_t v14 = sub_1AFC47920;
    id v15 = 0;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a1 >= 3) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = off_1E5F9D8D0[a1];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFC4C8AC;
    v9[3] = &unk_1E5F8FF50;
    v9[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v3, (uint64_t)v9);
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [*((id *)v11 + 5) count];
        *(_DWORD *)uint64_t v23 = 134217984;
        uint64_t v24 = v5;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Returning %lu conversations", v23, 0xCu);
      }
    }
    uint64_t v6 = [*((id *)v11 + 5) copy];
    v18[5] = v6;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v16[1] = (void (*)(void))3221225472;
    void v16[2] = (void (*)(void))sub_1AFC4C864;
    v16[3] = (void (*)(void))&unk_1E5F8D580;
    v16[4] = (void (*)(void))&v17;
    __syncXPCIMDAttachmentRecordFindLargestConversations_IPCAction(v16, a1);
  }
  id v7 = (id)v18[5];
  _Block_object_dispose(&v17, 8);
  return v7;
}

void sub_1AFC4C7F8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC4C778);
  }
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1AFC4C864(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    uint64_t result = _CFXPCCreateCFObjectFromXPCObject();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  }
  return result;
}

uint64_t sub_1AFC4C8AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      id v7 = (void *)MEMORY[0x1B3E8A120]();
      unsigned int v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        int v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        unsigned int v8 = (void *)CFStringCreateWithCString(v6, (const char *)v9, 0x8000100u);
      }
      id v10 = v8;
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      if (v10)
      {
        v13[1] = @"size";
        v14[0] = v10;
        v13[0] = @"guid";
        v14[1] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v11];
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
      }
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

id IMDAttachmentFindLargestNonSyncedAttachmentGUIDs()
{
  return IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(0, 0, 100, 0);
}

id IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClass(void *a1, unint64_t a2)
{
  return IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(a1, a2, 100, 0);
}

id IMDAttachmentFindLargestAttachmentGUIDsForAttachmentClassWithLimitAndOffset(void *a1, unint64_t a2, int64_t a3, int64_t a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3052000000;
  uint64_t v34 = sub_1AFC47910;
  __int16 v35 = sub_1AFC47920;
  uint64_t v36 = 0;
  if (IMOSLoggingEnabled())
  {
    unsigned int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Request to fetch non synced attachment guids for attachment class", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    int v9 = &stru_1F084E970;
    if (a2 <= 2) {
      int v9 = off_1E5F9D8E8[a2];
    }
    if ([a1 isEqualToString:IMAttachmentClassPhoto[0]])
    {
      id v10 = @"AND is_sticker = 0 AND mime_type LIKE 'image/%' AND NOT mime_type = 'image/gif'";
    }
    else if ([a1 isEqualToString:IMAttachmentClassVideo])
    {
      id v10 = @"AND mime_type LIKE 'video/%'";
    }
    else if ([a1 isEqualToString:IMAttachmentClassGIFOrSticker[0]])
    {
      id v10 = @"AND (is_sticker = 1 OR mime_type = 'image/gif')";
    }
    else
    {
      int v11 = [a1 isEqualToString:IMAttachmentClassOther];
      id v10 = @"AND NOT (mime_type LIKE 'image/%' OR mime_type LIKE 'video/%' OR is_sticker = 1 OR mime_type = 'image/gif')";
      if (!v11) {
        id v10 = &stru_1F084E970;
      }
    }
    uint64_t v12 = [NSString stringWithValidatedFormat:v9, @"%@", 0, v10 validFormatSpecifiers error];
    *(void *)long long buf = 0;
    uint64_t v25 = buf;
    uint64_t v26 = 0x3052000000;
    uint64_t v27 = sub_1AFC47910;
    long long v28 = sub_1AFC47920;
    uint64_t v29 = 0;
    uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v20 = 0;
    long long v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    if (v12)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1AFC4CEBC;
      v19[3] = &unk_1E5F9D4A0;
      void v19[6] = a3;
      void v19[7] = a4;
      v19[4] = buf;
      void v19[5] = &v20;
      _IMDPerformLockedStatementBlockWithQuery(v12, (uint64_t)v19);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [*((id *)v25 + 5) count];
        uint64_t v15 = v21[3];
        *(_DWORD *)CFIndex v37 = 134218498;
        uint64_t v38 = v14;
        __int16 v39 = 2048;
        uint64_t v40 = v15;
        __int16 v41 = 2112;
        uint64_t v42 = a1;
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Returning %lu non synced attachments with total size %llu for attachmentClass %@", v37, 0x20u);
      }
    }
    uint64_t v16 = [*((id *)v25 + 5) copy];
    v32[5] = v16;
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v30[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v30[1] = (void (*)(void))3221225472;
    v30[2] = (void (*)(void))sub_1AFC4CE74;
    v30[3] = (void (*)(void))&unk_1E5F8D580;
    v30[4] = (void (*)(void))&v31;
    __syncXPCIMDAttachmentRecordFindLargestAttachmentGUIDsWithLimitAndOffset_IPCAction(v30, a1, a2, a3, a4);
  }
  id v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);
  return v17;
}

void sub_1AFC4CDF8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC4CD70);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v23 - 176), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1AFC4CE74(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    uint64_t result = _CFXPCCreateCFObjectFromXPCObject();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  }
  return result;
}

uint64_t sub_1AFC4CEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v18[4] = *MEMORY[0x1E4F143B8];
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if (result == 100)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      unsigned int v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        int v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        unsigned int v8 = (void *)CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
      }
      id v10 = v8;
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      uint64_t v12 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 2);
      if (v12)
      {
        uint64_t v13 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 2);
        uint64_t v12 = (void *)CFStringCreateWithCString(v7, (const char *)v13, 0x8000100u);
      }
      id v14 = v12;
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3));
      if (v10 && v14)
      {
        uint64_t v16 = v15;
        if (v15)
        {
          v18[0] = v10;
          v17[0] = @"guid";
          v17[1] = @"size";
          v18[1] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v11];
          v18[2] = v14;
          v17[2] = @"filename";
          v17[3] = @"date";
          v18[3] = v16;
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v11;
        }
      }
      uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while (result == 100);
  }
  return result;
}

id IMDAttachmentSpaceTakenByAttachmentClass(int64_t a1)
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3052000000;
  sqlite3_int64 v11 = sub_1AFC47910;
  uint64_t v12 = sub_1AFC47920;
  uint64_t v13 = 0;
  if (IMDIsRunningInDatabaseServerProcess())
  {
    id v2 = @"SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE ck_sync_state != 1 AND hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;";
    if (a1 == 1) {
      id v2 = @"SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE ck_sync_state != 0 AND hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;";
    }
    if (a1) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = @"SELECT mime_type, is_sticker, SUM(total_bytes) FROM attachment WHERE hide_attachment=0 AND transfer_state = 5 GROUP BY mime_type, is_sticker ;";
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _OWORD v6[2] = sub_1AFC4D278;
    v6[3] = &unk_1E5F8FF50;
    v6[4] = &v8;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v3, (uint64_t)v6);
  }
  else
  {
    v7[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v7[1] = (void (*)(void))3221225472;
    v7[2] = (void (*)(void))sub_1AFC4D230;
    v7[3] = (void (*)(void))&unk_1E5F8D580;
    v7[4] = (void (*)(void))&v8;
    __syncXPCIMDAttachmentRecordSpaceTakenByAttachmentClass_IPCAction(v7, a1);
  }
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_1AFC4D214(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4D230(uint64_t a1, xpc_object_t xdict)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_value(xdict, "result");
  if (result)
  {
    uint64_t result = _CFXPCCreateCFObjectFromXPCObject();
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  }
  return result;
}

void sub_1AFC4D278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a1;
  id v22 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      CFAllocatorRef v6 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v6)
      {
        CFAllocatorRef v7 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        CFAllocatorRef v6 = (void *)CFStringCreateWithCString(v5, (const char *)v7, 0x8000100u);
      }
      id v8 = v6;
      int v9 = sqlite3_column_int(*(sqlite3_stmt **)(a4 + 8), 1);
      sqlite3_int64 v10 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 2);
      sqlite3_int64 v11 = (uint64_t *)IMAttachmentClassGIFOrSticker;
      if (!v9)
      {
        char v12 = [v8 isEqualToString:@"image/gif"];
        sqlite3_int64 v11 = (uint64_t *)IMAttachmentClassGIFOrSticker;
        if ((v12 & 1) == 0)
        {
          char v13 = [v8 containsString:@"image/"];
          sqlite3_int64 v11 = (uint64_t *)IMAttachmentClassPhoto;
          if ((v13 & 1) == 0)
          {
            BOOL v15 = [v8 rangeOfString:@"video/"] || v14 == 0;
            sqlite3_int64 v11 = &IMAttachmentClassOther;
            if (!v15) {
              sqlite3_int64 v11 = &IMAttachmentClassVideo;
            }
          }
        }
      }
      uint64_t v16 = *v11;
      id v17 = objc_msgSend(v22, "objectForKeyedSubscript:", *v11, v20);
      if (v17) {
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v17, "unsignedLongLongValue") + v10);
      }
      else {
        uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v10];
      }
      [v22 setObject:v18 forKeyedSubscript:v16];
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  uint64_t v19 = objc_msgSend(v22, "copy", v20);
  *(void *)(*(void *)(*(void *)(v21 + 32) + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v19;
}

BOOL _IMDAttachmentUpdateAttachmentWithRowidToFileSize(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!IMDIsRunningInDatabaseServerProcess()) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0xD010000000;
  uint64_t v18 = &unk_1AFCE00D7;
  memset(v19, 0, sizeof(v19));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v19);
  IMDSqlOperationBeginTransaction(v16 + 4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  char v12 = sub_1AFC4D6DC;
  char v13 = &unk_1E5F8EB38;
  uint64_t v14 = &v15;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC4D73C;
  v10[3] = &unk_1E5F9D4C8;
  v10[4] = &v15;
  void v10[5] = a2;
  v10[6] = a1;
  BOOL v4 = IMDSqlOperationExecuteQuery((uint64_t)(v16 + 4), @"UPDATE attachment set total_bytes = ? WHERE rowid = ?;",
         (uint64_t)v10);
  if (IMOSLoggingEnabled())
  {
    CFAllocatorRef v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a1];
      uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
      id v8 = @"NO";
      *(_DWORD *)long long buf = 138412802;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      if (v4) {
        id v8 = @"YES";
      }
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Updated attachment at rowID %@ to new filesize %@ with success %@", buf, 0x20u);
    }
  }
  v12((uint64_t)v11);
  _Block_object_dispose(&v15, 8);
  return v4;
}

void sub_1AFC4D698(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC4D63CLL);
  }
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(exc_buf);
}

BOOL sub_1AFC4D6DC(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 32;
  return IMDSqlOperationRelease(v2, 0);
}

void sub_1AFC4D73C(void *a1)
{
  IMDSqlStatementBindInt64(*(void *)(a1[4] + 8) + 64, a1[5]);
  uint64_t v2 = *(void *)(a1[4] + 8) + 64;
  sqlite3_int64 v3 = a1[6];
  IMDSqlStatementBindInt64(v2, v3);
}

BOOL _IMDAttachmentUpdateAttachmentWithRowidToTransferState(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!IMDIsRunningInDatabaseServerProcess()) {
    return 0;
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0xD010000000;
  uint64_t v18 = &unk_1AFCE00D7;
  memset(v19, 0, sizeof(v19));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v19);
  IMDSqlOperationBeginTransaction(v16 + 4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  char v12 = sub_1AFC4DA14;
  char v13 = &unk_1E5F8EB38;
  uint64_t v14 = &v15;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFC4DA74;
  v10[3] = &unk_1E5F9D4C8;
  v10[4] = &v15;
  void v10[5] = a2;
  v10[6] = a1;
  BOOL v4 = IMDSqlOperationExecuteQuery((uint64_t)(v16 + 4), @"UPDATE attachment set transfer_state = ? WHERE rowid = ?;",
         (uint64_t)v10);
  if (IMOSLoggingEnabled())
  {
    CFAllocatorRef v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a1];
      uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
      id v8 = @"NO";
      *(_DWORD *)long long buf = 138412802;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      if (v4) {
        id v8 = @"YES";
      }
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Updated attachment at rowID %@ to new transfer_state %@ with success %@", buf, 0x20u);
    }
  }
  v12((uint64_t)v11);
  _Block_object_dispose(&v15, 8);
  return v4;
}

void sub_1AFC4D9D0(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC4D974);
  }
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(exc_buf);
}

BOOL sub_1AFC4DA14(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 32;
  return IMDSqlOperationRelease(v2, 0);
}

void sub_1AFC4DA74(void *a1)
{
  IMDSqlStatementBindInt64(*(void *)(a1[4] + 8) + 64, a1[5]);
  uint64_t v2 = *(void *)(a1[4] + 8) + 64;
  sqlite3_int64 v3 = a1[6];
  IMDSqlStatementBindInt64(v2, v3);
}

uint64_t _IMDCopyAttachmentsNeedingFileSizeUpdatesForWatermark(uint64_t a1, void *a2)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = -1;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  sqlite3_int64 v10 = sub_1AFC47910;
  sqlite3_int64 v11 = sub_1AFC47920;
  id v12 = 0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = sub_1AFC4DC2C;
  v6[3] = &unk_1E5F95BD0;
  void v6[5] = &v7;
  void v6[6] = a1;
  v6[4] = &v13;
  _IMDPerformLockedStatementBlockWithQuery(@"SELECT filename,rowid,total_bytes,ck_sync_state,is_sticker,hide_attachment,transfer_state,guid FROM attachment WHERE rowid > ? AND filename != '' ORDER BY rowid ASC LIMIT 20;",
    (uint64_t)v6);
  *a2 = [(id)v8[5] copy];

  uint64_t v4 = v14[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_1AFC4DC00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4DC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v27[8] = *MEMORY[0x1E4F143B8];
  CSDBSqliteBindInt64();
  uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
  if (result == 100)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v25 = a1;
    do
    {
      id v8 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
      if (v8)
      {
        uint64_t v9 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        id v8 = (void *)CFStringCreateWithCString(v7, (const char *)v9, 0x8000100u);
      }
      id v10 = v8;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 1);
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 2);
      sqlite3_int64 v12 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3);
      sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 4);
      sqlite3_int64 v14 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 5);
      sqlite3_int64 v15 = sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 6);
      uint64_t v16 = (void *)sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 7);
      if (v16)
      {
        uint64_t v17 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 7);
        uint64_t v16 = (void *)CFStringCreateWithCString(v7, (const char *)v17, 0x8000100u);
      }
      id v18 = v16;
      if ([v10 length])
      {
        if (v18)
        {
          uint64_t v19 = *(void *)(a1 + 32);
          uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v26[0] = @"rowID";
          v27[0] = [MEMORY[0x1E4F28ED0] numberWithLongLong:*(void *)(*(void *)(v19 + 8) + 24)];
          v26[1] = @"bytes";
          v27[1] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v11];
          v27[2] = v10;
          v26[2] = @"filename";
          void v26[3] = @"ck_sync_state";
          v27[3] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v12];
          v26[4] = @"is_sticker";
          v27[4] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
          void v26[5] = @"hide_attachment";
          v27[5] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v14];
          void v26[6] = @"transfer_state";
          uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v15];
          v26[7] = @"guid";
          void v27[6] = v21;
          v27[7] = v18;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
          uint64_t v23 = v20;
          CFAllocatorRef v7 = v24;
          a1 = v25;
          [v23 addObject:v22];
        }
      }
      uint64_t result = sqlite3_step(*(sqlite3_stmt **)(a4 + 8));
    }
    while (result == 100);
  }
  return result;
}

BOOL _IMDUpdateAttachmentFileSizeIfNeeded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 != a2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412802;
        uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a1];
        __int16 v10 = 2112;
        uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
        __int16 v12 = 2112;
        uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
        _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "For rowID %@ bytes %@ is not equal to new byte count %@ for file.", (uint8_t *)&v8, 0x20u);
      }
    }
    _IMDAttachmentUpdateAttachmentWithRowidToFileSize(a1, a3);
  }
  return a3 != a2;
}

void *IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark(int64_t a1)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  uint64_t v73 = 0;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x3052000000;
  uint64_t v76 = sub_1AFC47910;
  uint64_t v77 = sub_1AFC47920;
  id v78 = 0;
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  if ((IMDIsRunningInDatabaseServerProcess() & 1) == 0)
  {
    v68[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v68[1] = (void (*)(void))3221225472;
    v68[2] = (void (*)(void))sub_1AFC4EAF0;
    v68[3] = (void (*)(void))&unk_1E5F900B8;
    v68[4] = (void (*)(void))&v69;
    v68[5] = (void (*)(void))&v73;
    __syncXPCIMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark_IPCAction(v68, a1);
    goto LABEL_72;
  }
  id v67 = 0;
  _IMDCopyAttachmentsNeedingFileSizeUpdatesForWatermark(a1, &v67);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v2 = v67;
  uint64_t v3 = [v67 countByEnumeratingWithState:&v63 objects:v96 count:16];
  if (!v3) {
    goto LABEL_65;
  }
  id obj = v2;
  uint64_t v48 = *MEMORY[0x1E4F6D450];
  uint64_t v49 = *(void *)v64;
  *(void *)&long long v4 = 134219266;
  long long v46 = v4;
  do
  {
    uint64_t v56 = 0;
    uint64_t v50 = v3;
    do
    {
      if (*(void *)v64 != v49) {
        objc_enumerationMutation(obj);
      }
      CFAllocatorRef v5 = *(void **)(*((void *)&v63 + 1) + 8 * v56);
      uint64_t v6 = objc_msgSend(v5, "objectForKey:", @"filename", v46);
      uint64_t v55 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"rowID"), "longLongValue");
      uint64_t v51 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"bytes"), "longLongValue");
      uint64_t v54 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"ck_sync_state"), "longLongValue");
      long long v57 = objc_msgSend((id)objc_msgSend(NSString, "stringWithString:", v6), "stringByExpandingTildeInPath");
      uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"is_sticker"), "longLongValue");
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"hide_attachment"), "longLongValue");
      uint64_t v52 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", @"transfer_state"), "longLongValue");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(v57, "pathExtension"), "im_isAudioMessageExtension");
      int v53 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v57);
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v57, "lastPathComponent"), "containsString:", v48);
      int v11 = [MEMORY[0x1E4F6E780] canMarkPurgeableWithCKSyncState:v54 transferState:5 isAudio:v9 isSticker:v7 != 0 isGroupPhoto:v10];
      if (IMOSLoggingEnabled())
      {
        __int16 v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v46;
          uint64_t v13 = @"NO";
          if (v7) {
            uint64_t v14 = @"YES";
          }
          else {
            uint64_t v14 = @"NO";
          }
          uint64_t v85 = v55;
          if (v8) {
            sqlite3_int64 v15 = @"YES";
          }
          else {
            sqlite3_int64 v15 = @"NO";
          }
          __int16 v86 = 2112;
          if (v11) {
            uint64_t v13 = @"YES";
          }
          uint64_t v87 = v57;
          __int16 v88 = 2048;
          uint64_t v89 = v54;
          __int16 v90 = 2112;
          uint64_t v91 = v14;
          __int16 v92 = 2112;
          v93 = v15;
          __int16 v94 = 2112;
          v95 = v13;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Can mark rowID: %lld file: [%@], cloudKitSyncState: [%lld], is_sticker: [%@], hide_attachment: [%@], purgeable: [%@]", buf, 0x3Eu);
        }
      }
      if (v11)
      {
        if (v53)
        {
          uint64_t v16 = (void *)v74[5];
          v82[0] = @"rowID";
          v83[0] = [MEMORY[0x1E4F28ED0] numberWithLongLong:v55];
          v83[1] = v57;
          v82[1] = @"filename";
          v82[2] = @"guid";
          v83[2] = objc_msgSend(v5, "objectForKey:");
          objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v83, v82, 3));
          if (v52 != 5)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v55];
                *(_DWORD *)long long buf = 138412546;
                uint64_t v85 = v18;
                __int16 v86 = 2112;
                uint64_t v87 = v57;
                _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "File on disk, but not in finished state: %@, filename: %@.", buf, 0x16u);
              }
            }
            _IMDAttachmentUpdateAttachmentWithRowidToTransferState(v55, 5);
          }
        }
      }
      else
      {
        uint64_t v19 = (void *)v74[5];
        v80[0] = @"rowID";
        uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v55];
        v80[1] = @"filename";
        v81[0] = v20;
        v81[1] = &stru_1F084E970;
        objc_msgSend(v19, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v81, v80, 2));
      }
      [MEMORY[0x1E4F1CB10] fileURLWithPath:v57];
      uint64_t v21 = (void *)[(id)IMAttachmentPreviewFileURL() path];
      uint64_t v22 = objc_msgSend(v57, "im_livePhotoBundlePath");
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v22 length]) {
        [v23 addObject:v22];
      }
      if ([v21 length]
        && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v21))
      {
        [v23 addObject:v21];
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v79 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v60 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            if ([v27 length])
            {
              uint64_t v58 = 0;
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v27, &v58))
              {
                if (IMOSLoggingEnabled())
                {
                  long long v28 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    uint64_t v85 = (uint64_t)v27;
                    uint64_t v29 = v28;
                    long long v30 = "Live Photo bundle deleted: %@";
                    uint32_t v31 = 12;
LABEL_44:
                    _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, v30, buf, v31);
                    continue;
                  }
                }
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v32 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v85 = (uint64_t)v27;
                  __int16 v86 = 2112;
                  uint64_t v87 = v58;
                  uint64_t v29 = v32;
                  long long v30 = "Live Photo bundle on disk, but failed to delete it: %@, error: %@";
                  uint32_t v31 = 22;
                  goto LABEL_44;
                }
              }
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v79 count:16];
        }
        while (v24);
      }

      if (v53)
      {
        uint64_t v33 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", v57, 0);
        uint64_t v34 = [v33 fileSize];
        __int16 v35 = objc_msgSend(v57, "im_livePhotoVideoPath");
        if (v33)
        {
          uint64_t v36 = v35;
          if (![v35 length]) {
            goto LABEL_52;
          }
          CFIndex v37 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", v36, 0);
          uint64_t v38 = [v37 fileSize];
          if (v37)
          {
            v34 += v38;
LABEL_52:
            _IMDUpdateAttachmentFileSizeIfNeeded(v55, v51, v34);
            goto LABEL_62;
          }
        }
        if (IMOSLoggingEnabled())
        {
          __int16 v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            uint64_t v42 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v55];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v85 = v42;
            __int16 v86 = 2112;
            uint64_t v87 = v57;
            _os_log_impl(&dword_1AFB53000, v41, OS_LOG_TYPE_INFO, "Failed getting filesize at rowID %@ and path %@.", buf, 0x16u);
          }
        }
      }
      else if (v54 == 1 && v52 == 5)
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v55];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v85 = v40;
            __int16 v86 = 2112;
            uint64_t v87 = v57;
            _os_log_impl(&dword_1AFB53000, v39, OS_LOG_TYPE_INFO, "File not on disk, lets switch it to tap to download rowID: %@, filename: %@.", buf, 0x16u);
          }
        }
        _IMDAttachmentUpdateAttachmentWithRowidToTransferState(v55, 0);
      }
LABEL_62:
      ++v56;
    }
    while (v56 != v50);
    uint64_t v3 = [obj countByEnumeratingWithState:&v63 objects:v96 count:16];
  }
  while (v3);
  id v2 = v67;
LABEL_65:
  if ([v2 count])
  {
    *((unsigned char *)v70 + 24) = 1;
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v43, OS_LOG_TYPE_INFO, "No more attachments found to update", buf, 2u);
    }
  }

LABEL_72:
  uint64_t v44 = (void *)v74[5];
  if (!*((unsigned char *)v70 + 24))
  {

    uint64_t v44 = 0;
  }
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  return v44;
}

xpc_object_t sub_1AFC4EAF0(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFC4EB94;
    applier[3] = &unk_1E5F8D558;
    applier[4] = *(void *)(a1 + 40);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1AFC4EB94(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", IMGetXPCIntFromDictionary()), @"rowID");
  [v2 setObject:IMGetXPCStringFromDictionary() forKeyedSubscript:@"filename"];
  [v2 setObject:IMGetXPCStringFromDictionary() forKeyedSubscript:@"guid"];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];

  return 1;
}

void IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery(void *a1, CFTypeRef *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a1 count];
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"SELECT c.rowid FROM chat c WHERE (c.chat_identifier = ? AND c.service_name = ?)");
  if (v3 >= 2)
  {
    unint64_t v5 = v3 - 1;
    do
    {
      CFStringAppend(Mutable, @" OR (c.chat_identifier = ? AND c.service_name = ?)");
      --v5;
    }
    while (v5);
  }
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"select a.filename, a.guid, a.is_sticker, a.created_date, a.transfer_state from attachment a join  (select ma.attachment_id as a_id, message_date as m_date from message_attachment_join ma join (select cm.message_id as message_id, cm.message_date as message_date from message m join chat_message_join cm where m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id IN (%@) AND m.rowid = cm.message_id) as tmp where ma.message_id = tmp.message_id) as tmp2 where a.rowid = tmp2.a_id AND     a.hide_attachment == 0 ORDER BY tmp2.m_date ASC;",
         Mutable);
  CFStringRef v7 = v6;
  if (a2)
  {
    *a2 = CFRetain(v6);
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v10 = v7;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery %@", buf, 0xCu);
      }
    }
  }
  CFRelease(v7);
  CFRelease(Mutable);
}

id sub_1AFC4EDC0(void *a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFC4EE50;
  v7[3] = &unk_1E5F90128;
  CFStringRef v4 = (const __CFString *)a1[5];
  uint64_t v5 = a1[6];
  v7[4] = a2;
  v7[5] = v5;
  id result = _IMDSqlOperationGetRowsWithBindingBlock(a2, v4, (uint64_t)v7);
  *(void *)(*(void *)(a1[4] + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  return result;
}

void sub_1AFC4EE50(uint64_t a1)
{
}

id sub_1AFC4EE5C(void *a1, uint64_t a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC4EEF4;
  v5[3] = &unk_1E5F93EE0;
  v5[4] = a1[4];
  uint64_t v6 = a2;
  CFStringRef v3 = (const __CFString *)a1[6];
  uint64_t v7 = a1[7];
  id result = _IMDSqlOperationGetRowsWithBindingBlock(v6, v3, (uint64_t)v5);
  *(void *)(*(void *)(a1[5] + 8) + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = result;
  return result;
}

void sub_1AFC4EEF4(uint64_t *a1)
{
  IMDSqlStatementBindTextFromCFString(a1[5] + 32, a1[4]);
  sqlite3_int64 v2 = a1[6];
  uint64_t v3 = a1[5] + 32;
  IMDSqlStatementBindInt64(v3, v2);
}

void IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServicesQuery(void *a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a1 count];
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"SELECT c.rowid FROM chat c WHERE (c.chat_identifier = ? AND c.service_name = ?)");
  if (v5 >= 2)
  {
    unint64_t v7 = v5 - 1;
    do
    {
      CFStringAppend(Mutable, @" OR (c.chat_identifier = ? AND c.service_name = ?)");
      --v7;
    }
    while (v7);
  }
  CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"SELECT * FROM attachment a INNER JOIN message_attachment_join ma ON   a.ROWID = ma.attachment_id INNER JOIN chat_message_join cm ON   ma.message_id = cm.message_id INNER JOIN message m ON   ma.message_id = m.ROWID WHERE   m.cache_has_attachments   AND m.expire_state != %d   AND cm.chat_id IN (%@)   AND a.hide_attachment == 0   AND a.ck_sync_state == 1   AND a.transfer_state == 0 ORDER BY m.date DESC limit %d", 2, Mutable, a2);
  CFStringRef v9 = v8;
  if (a3)
  {
    *a3 = CFRetain(v8);
    if (IMOSLoggingEnabled())
    {
      CFStringRef v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v12 = v9;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery %@", buf, 0xCu);
      }
    }
  }
  CFRelease(v9);
  CFRelease(Mutable);
}

void IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServicesQuery(void *a1, CFTypeRef *a2)
{
  unint64_t v3 = [a1 count];
  CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"SELECT c.rowid FROM chat c INDEXED BY chat_idx_chat_identifier_service_name WHERE (c.chat_identifier = ? AND c.service_name = ?)");
  if (v3 >= 2)
  {
    unint64_t v5 = v3 - 1;
    do
    {
      CFStringAppend(Mutable, @" OR (c.chat_identifier = ? AND c.service_name = ?)");
      --v5;
    }
    while (v5);
  }
  CFStringRef v6 = CFStringCreateWithFormat(0, 0, @"select count(*) from attachment a INDEXED BY attachment_idx_purged_attachments_v2 join (select ma.attachment_id as a_id, message_date as m_date from message_attachment_join ma INDEXED BY message_attachment_join_idx_attachment_id join (select cm.message_id as message_id, cm.message_date as message_date from message m INDEXED BY message_idx_cache_has_attachments join chat_message_join cm where m.cache_has_attachments = 1 AND cm.chat_id AND cm.chat_id IN (%@) AND m.rowid = cm.message_id) as tmp where ma.message_id = tmp.message_id) as tmp2 where a.rowid = tmp2.a_id AND a.hide_attachment == 0 AND (a.ck_sync_state == 1 OR a.ck_sync_state == 4) AND a.transfer_state == 0 ORDER BY tmp2.m_date ASC;",
         Mutable);
  CFStringRef v7 = v6;
  if (a2) {
    *a2 = CFRetain(v6);
  }
  CFRelease(v7);
  CFRelease(Mutable);
}

__CFArray *IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices(void *a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 count];
  uint64_t v7 = [a2 count];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a2;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v34 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Copy purged attachments for chat %@ services %@ limit %@", buf, 0x20u);
    }
  }
  if (v6 && v7 && v6 == v7)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v34 = 0;
      uint64_t v26 = 0;
      IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServicesQuery(a1, a3, (CFTypeRef *)&v26);
      if (v26)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1AFC4F5A8;
        void v25[3] = &unk_1E5F9B9E8;
        v25[6] = a1;
        v25[7] = a2;
        v25[4] = buf;
        void v25[5] = v6;
        _IMDPerformLockedStatementBlockWithQuery(v26, (uint64_t)v25);
        CFArrayRef v9 = *(const __CFArray **)(*(void *)&buf[8] + 24);
        if (v9) {
          CFIndex Count = CFArrayGetCount(v9);
        }
        else {
          CFIndex Count = 0;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInt:Count];
            *(_DWORD *)uint64_t v27 = 138412802;
            uint64_t v28 = v14;
            __int16 v29 = 2112;
            long long v30 = a1;
            __int16 v31 = 2112;
            uint64_t v32 = v26;
            _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "%@ assets that have been purged for chat %@ outQuery %@", v27, 0x20u);
          }
        }
        if ((int)Count < 1)
        {
          CFMutableArrayRef Mutable = 0;
        }
        else
        {
          CFIndex v15 = 0;
          CFMutableArrayRef Mutable = 0;
          uint64_t v16 = (int)Count;
          uint64_t v17 = *MEMORY[0x1E4F1CF80];
          uint64_t v18 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
          do
          {
            CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)&buf[8] + 24), v15);
            int ID = CSDBRecordGetID();
            uint64_t v20 = IMDAttachmentRecordCreateFromRecordIDUnlocked(v17, ID);
            if (!Mutable) {
              CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, v18);
            }
            CFArrayAppendValue(Mutable, v20);
            if (v20) {
              CFRelease(v20);
            }
            ++v15;
          }
          while (v16 != v15);
        }
        uint64_t v21 = *(const void **)(*(void *)&buf[8] + 24);
        if (v21) {
          CFRelease(v21);
        }
      }
      else
      {
        CFStringRef v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1AFC71788();
        }
        CFMutableArrayRef Mutable = 0;
      }
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v34 = 0;
      v24[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v24[1] = (void (*)(void))3221225472;
      v24[2] = (void (*)(void))sub_1AFC4F64C;
      v24[3] = (void (*)(void))&unk_1E5F8D580;
      v24[4] = (void (*)(void))buf;
      __syncXPCIMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices_IPCAction(v24, (uint64_t)a1, (uint64_t)a2);
      CFMutableArrayRef Mutable = *(__CFArray **)(*(void *)&buf[8] + 24);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6FD88();
    }
    return 0;
  }
  return Mutable;
}

void sub_1AFC4F580()
{
}

void sub_1AFC4F590(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4F5A8(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v2);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v2);
      CSDBSqliteBindTextFromCFString();
      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1AFC4F64C(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    CFStringRef v4 = value;
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v6 = count;
      size_t v7 = 0;
      CFStringRef v8 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v8);
        }
        xpc_object_t v9 = xpc_array_get_value(v4, v7);
        CFStringRef v10 = (const void *)_IMDCopyIMDAttachmentRecordFromXPCObjectClient(v9);
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v10);
        if (v10) {
          CFRelease(v10);
        }
        ++v7;
      }
      while (v6 != v7);
    }
  }
}

__CFArray *IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 count];
  uint64_t v5 = [a2 count];
  if (IMOSLoggingEnabled())
  {
    size_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Copy purged attachments count for chat %@ services %@", buf, 0x16u);
    }
  }
  if (v4 && v5 && v4 == v5)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v24 = 0;
      CFTypeRef cf = 0;
      IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServicesQuery(a1, &cf);
      if (cf)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = sub_1AFC4FAC4;
        v15[3] = &unk_1E5F9B9E8;
        v15[6] = a1;
        v15[7] = a2;
        uint8_t v15[4] = buf;
        v15[5] = v4;
        _IMDPerformLockedStatementBlockWithQuery((uint64_t)cf, (uint64_t)v15);
        CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)&buf[8] + 24), 0);
        size_t v7 = (const void *)[MEMORY[0x1E4F28ED0] numberWithInt:CSDBRecordGetID()];
        if (IMOSLoggingEnabled())
        {
          CFStringRef v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t v17 = 138412802;
            uint64_t v18 = v7;
            __int16 v19 = 2112;
            uint64_t v20 = a1;
            __int16 v21 = 2112;
            CFTypeRef v22 = cf;
            _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "%@ assets that have been purged for chat %@ outQuery %@", v17, 0x20u);
          }
        }
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        CFArrayAppendValue(Mutable, v7);
        CFStringRef v10 = *(const void **)(*(void *)&buf[8] + 24);
        if (v10) {
          CFRelease(v10);
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      else
      {
        uint64_t v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1AFC71788();
        }
        CFMutableArrayRef Mutable = 0;
      }
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v24 = 0;
      v14[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v14[1] = (void (*)(void))3221225472;
      v14[2] = (void (*)(void))sub_1AFC4FB68;
      void v14[3] = (void (*)(void))&unk_1E5F8D580;
      v14[4] = (void (*)(void))buf;
      __syncXPCIMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices_IPCAction(v14, (uint64_t)a1, (uint64_t)a2);
      CFMutableArrayRef Mutable = *(__CFArray **)(*(void *)&buf[8] + 24);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    CFStringRef v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6FD88();
    }
    return 0;
  }
  return Mutable;
}

uint64_t sub_1AFC4FAC4(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v2);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v2);
      CSDBSqliteBindTextFromCFString();
      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
  uint64_t result = CSDBRecordStoreProcessStatement();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1AFC4FB68(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    uint64_t v4 = value;
    if (xpc_array_get_count(value) == 1)
    {
      xpc_object_t dictionary = xpc_array_get_dictionary(v4, 0);
      if (dictionary)
      {
        int64_t int64 = xpc_dictionary_get_int64(dictionary, "purgedCount");
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        size_t v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        CFStringRef v8 = (const void *)[MEMORY[0x1E4F28ED0] numberWithLongLong:int64];
        CFArrayAppendValue(v7, v8);
      }
    }
  }
}

uint64_t IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices(void *a1, void *a2)
{
  uint64_t v4 = [a1 count];
  uint64_t v5 = [a2 count];
  if (v4 && v5 && v4 == v5)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    if (IMDIsRunningInDatabaseServerProcess())
    {
      CFTypeRef v11 = 0;
      IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServicesQuery(a1, &v11);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1AFC4FDE4;
      v10[3] = &unk_1E5F9B9E8;
      v10[6] = a1;
      void v10[7] = a2;
      v10[4] = &v12;
      void v10[5] = v4;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v11, (uint64_t)v10);
      if (v11) {
        CFRelease(v11);
      }
    }
    else
    {
      v9[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v9[1] = (void (*)(void))3221225472;
      v9[2] = (void (*)(void))sub_1AFC50128;
      v9[3] = (void (*)(void))&unk_1E5F8D580;
      v9[4] = (void (*)(void))&v12;
      __syncXPCIMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices_IPCAction(v9, (uint64_t)a1, (uint64_t)a2);
    }
    uint64_t v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    size_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6FD88();
    }
    return 0;
  }
  return v7;
}

void sub_1AFC4FDC8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC4FDE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    unint64_t v6 = 0;
    do
    {
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v6);
      CSDBSqliteBindTextFromCFString();
      CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), v6);
      CSDBSqliteBindTextFromCFString();
      ++v6;
    }
    while (v6 < *(void *)(a1 + 40));
  }
  if (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0))
      {
        CFStringRef v8 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 0);
        xpc_object_t v9 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v8, 0x8000100u);
      }
      else
      {
        xpc_object_t v9 = 0;
      }
      if (sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 1))
      {
        CFStringRef v10 = sqlite3_column_text(*(sqlite3_stmt **)(a4 + 8), 1);
        CFTypeRef v11 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v10, 0x8000100u);
      }
      else
      {
        CFTypeRef v11 = 0;
      }
      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", sqlite3_column_int(*(sqlite3_stmt **)(a4 + 8), 2) != 0);
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithUnsignedLong:", sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 3));
      uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithUnsignedLong:", sqlite3_column_int64(*(sqlite3_stmt **)(a4 + 8), 4));
      uint64_t v15 = (void *)v14;
      if (v11 && v12 && v13 && v14)
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        }
        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"guid", v12, @"isSticker", v13, @"createdDate", v15, @"transferState", 0);
        uint64_t v17 = v16;
        if (v9) {
          [v16 setObject:v9 forKey:@"path"];
        }
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v17);
      }
      else
      {
        uint64_t v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138413314;
          __int16 v21 = v9;
          __int16 v22 = 2112;
          id v23 = v11;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          __int16 v26 = 2112;
          uint64_t v27 = v13;
          __int16 v28 = 2112;
          __int16 v29 = v15;
          _os_log_error_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_ERROR, "Skipping an attachment because of incomplete data filename %@ guid %@ isSticker %@ createdDate %@ transferState %@", buf, 0x34u);
        }
      }
    }
    while (sqlite3_step(*(sqlite3_stmt **)(a4 + 8)) == 100);
  }
  return CSDBSqliteStatementReset();
}

void sub_1AFC50128(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "array_result");
  if (value)
  {
    size_t count = xpc_array_get_count(value);
    if (count)
    {
      size_t v3 = 0;
      uint64_t v17 = a1;
      do
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
        }
        xpc_object_t v4 = xpc_array_get_value(value, v3);
        string = xpc_dictionary_get_string(v4, "guid");
        unint64_t v6 = (char *)xpc_dictionary_get_string(v4, "path");
        BOOL v7 = xpc_dictionary_get_BOOL(v4, "isSticker");
        int64_t int64 = xpc_dictionary_get_int64(v4, "createdDate");
        int64_t v9 = xpc_dictionary_get_int64(v4, "transferState");
        if (string)
        {
          int64_t v10 = v9;
          CFTypeRef v11 = (void *)[[NSString alloc] initWithUTF8String:string];
          if (v6) {
            unint64_t v6 = (char *)[[NSString alloc] initWithUTF8String:v6];
          }
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithBool:v7];
          uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)int64];
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:v10];
          uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, @"guid", v6, @"path", v12, @"isSticker", v13, @"createdDate", v14, @"transferState", 0);
          uint64_t v16 = v15;
          if (v6) {
            [v15 setObject:v6 forKey:@"path"];
          }
          a1 = v17;
          if (v16) {
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(v17 + 32) + 8) + 24), v16);
          }
        }
        ++v3;
      }
      while (count != v3);
    }
  }
}

void IMDAttachmentRecordDeleteAttachmentForGUID(CFStringRef theString)
{
  if (theString && CFStringGetLength(theString))
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = sub_1AFC50468;
      v9[3] = &unk_1E5F901E8;
      v9[4] = theString;
      _IMDPerformLockedStatementBlockWithQuery(@"DELETE FROM attachment WHERE guid = ?;", (uint64_t)v9);
    }
    else
    {
      __syncXPCIMDAttachmentRecordDeleteAttachmentForGUID_IPCAction(0, (uint64_t)theString);
    }
  }
  else
  {
    unint64_t v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1AFC717BC((uint64_t)theString, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

uint64_t sub_1AFC50468()
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteStatementPerform();
  CSDBRecordSaveStore();
  return CSDBRecordStoreInvalidateCachesWithStore();
}

uint64_t IMDAttachmentRecordAddAttachment(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1AFC5057C;
  v3[3] = &unk_1E5F8FE88;
  void v3[4] = &v4;
  void v3[5] = a1;
  _IMDPerformLockedMessageStoreBlock((uint64_t)v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1AFC50564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC5057C(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    CSDBRecordStoreAddRecord();
    uint64_t result = CSDBRecordSaveStore();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t IMDAttachmentRecordUpdateAttachmentGUIDWithGUID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (a1 && a2)
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0xD010000000;
      __int16 v29 = &unk_1AFCE00D7;
      memset(v30, 0, sizeof(v30));
      IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v30);
      IMDSqlOperationBeginTransaction(v27 + 4);
      uint64_t v21 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      id v23 = sub_1AFC50AB0;
      __int16 v24 = &unk_1E5F8EB38;
      uint64_t v25 = &v26;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1AFC50B10;
      v20[3] = &unk_1E5F9D3D8;
      uint8_t v20[4] = a1;
      id RowsForQueryWithBindingBlock = _IMDSqlOperationGetRowsForQueryWithBindingBlock(@"SELECT ROWID FROM attachment WHERE guid = ? LIMIT 1;",
                                       &v21,
                                       (uint64_t)v20);
      id v6 = RowsForQueryWithBindingBlock;
      if (v21)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_25;
        }
        char v7 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        *(_DWORD *)long long buf = 138412290;
        uint64_t v36 = v21;
        uint64_t v8 = "IMDAttachmentRecordUpdateAttachmentGUIDWithGUID - kIMDAttachmentRecordGetAttachmentRowIDForGUID returned error %@";
        int64_t v9 = v7;
        uint32_t v10 = 12;
LABEL_8:
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
LABEL_25:
        v23((uint64_t)v22);
        uint64_t v2 = *((unsigned __int8 *)v32 + 24);
        _Block_object_dispose(&v26, 8);
        goto LABEL_26;
      }
      if (![RowsForQueryWithBindingBlock count])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_25;
        }
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          goto LABEL_25;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v8 = "IMDAttachmentRecordUpdateAttachmentGUIDWithGUID - kIMDAttachmentRecordGetAttachmentRowIDForGUID returned zero results";
        int64_t v9 = v16;
        uint32_t v10 = 2;
        goto LABEL_8;
      }
      uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(RowsForQueryWithBindingBlock, "firstObject"), "objectForKey:", @"ROWID"), "integerValue");
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v36 = v11;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Updating GUID for attachment at rowID %lld", buf, 0xCu);
        }
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1AFC50B20;
      v19[3] = &unk_1E5F9D4C8;
      v19[4] = &v26;
      void v19[5] = a2;
      void v19[6] = v11;
      BOOL v13 = IMDSqlOperationExecuteQuery((uint64_t)(v27 + 4), @"UPDATE attachment set guid = ? WHERE ROWID = ?;",
              (uint64_t)v19);
      *((unsigned char *)v32 + 24) = v13;
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          if (*((unsigned char *)v32 + 24)) {
            uint64_t v15 = @"YES";
          }
          else {
            uint64_t v15 = @"NO";
          }
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = (uint64_t)v15;
          _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "kIMDAttachmentRecordUpdateAttachmentGUIDWithGUID Success: %@", buf, 0xCu);
        }
      }
      v23((uint64_t)v22);
      _Block_object_dispose(&v26, 8);
    }
    else
    {
      v18[0] = (void (*)(void))MEMORY[0x1E4F143A8];
      v18[1] = (void (*)(void))3221225472;
      v18[2] = (void (*)(void))sub_1AFC50B70;
      v18[3] = (void (*)(void))&unk_1E5F8D580;
      v18[4] = (void (*)(void))&v31;
      __syncXPCIMDAttachmentRecordUpdateAttachmentGUIDWithGUID_IPCAction(v18, a1, a2);
    }
    uint64_t v2 = *((unsigned __int8 *)v32 + 24);
  }
LABEL_26:
  _Block_object_dispose(&v31, 8);
  return v2;
}

void sub_1AFC50A78()
{
}

BOOL sub_1AFC50AB0(uint64_t a1)
{
  IMDSqlOperationFinishQuery(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  IMDSqlOperationCommitOrRevertTransaction((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 32;
  return IMDSqlOperationRelease(v2, 0);
}

void sub_1AFC50B10(uint64_t a1, uint64_t a2)
{
}

void sub_1AFC50B20(void *a1)
{
  IMDSqlStatementBindTextFromCFString(*(void *)(a1[4] + 8) + 64, a1[5]);
  uint64_t v2 = *(void *)(a1[4] + 8) + 64;
  sqlite3_int64 v3 = a1[6];
  IMDSqlStatementBindInt64(v2, v3);
}

BOOL sub_1AFC50B70(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "BOOL_result");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t IMDAttachmentCopyGUIDsAfterRowWithLimit(void *a1, sqlite3_int64 a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3052000000;
  __int16 v24 = sub_1AFC47910;
  uint64_t v25 = sub_1AFC47920;
  id v26 = 0;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(void *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDAttachmentCopyGUIDsAfterRowWithLimit is in IMDP afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    memset(v28, 0, sizeof(v28));
    memset(buf, 0, sizeof(buf));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    if (a1) {
      CFStringRef v5 = @" select ROWID, guid, maj.rowid is null as is_orphaned from attachment left join message_attachment_join maj on attachment.ROWID=maj.attachment_id WHERE ROWID > ? ORDER BY ROWID limit ?;";
    }
    else {
      CFStringRef v5 = @" select ROWID, guid, maj.rowid is null as is_orphaned from attachment left join message_attachment_join maj on attachment.ROWID=maj.attachment_id ORDER BY ROWID limit ?;";
    }
    _IMDSqlOperationBeginQuery((uint64_t)buf, v5);
    if (a1) {
      IMDSqlStatementBindInt64((uint64_t)v28, [a1 longLongValue]);
    }
    IMDSqlStatementBindInt64((uint64_t)v28, a2);
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      Row = IMDSqlStatementGetRow((sqlite3_stmt **)v28);
      if (Row) {
        [(id)v22[5] addObject:Row];
      }
    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    uint64_t v20 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v20);
    if (v20)
    {
      uint32_t v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1AFC71828((uint64_t)&v20, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(void *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentCopyGUIDsAfterRowWithLimit is in imagent afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    v19[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v19[1] = (void (*)(void))3221225472;
    v19[2] = (void (*)(void))sub_1AFC50F8C;
    v19[3] = (void (*)(void))&unk_1E5F8D580;
    v19[4] = (void (*)(void))&v21;
    __syncXPCIMDAttachmentRecordCopyAttachmentGUIDs_IPCAction(v19, a1, a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [(id)v22[5] count];
        buf[0] = 134217984;
        *(void *)&buf[1] = v9;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Returned from DB call after loading attachments to delete messages count %lu", (uint8_t *)buf, 0xCu);
      }
    }
  }
  uint64_t v17 = v22[5];
  _Block_object_dispose(&v21, 8);
  return v17;
}

void sub_1AFC50F00(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC50EB8);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

xpc_object_t sub_1AFC50F8C(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFC51020;
    applier[3] = &unk_1E5F8D558;
    applier[4] = *(void *)(a1 + 32);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1AFC51020(uint64_t a1, int a2, xpc_object_t xdict)
{
  int64_t int64 = xpc_dictionary_get_int64(xdict, "ROWID");
  uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "guid"), 4);
  BOOL v7 = xpc_dictionary_get_BOOL(xdict, "is_orphaned");
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:int64];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v6, @"guid", v9, @"ROWID", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", v7), @"is_orphaned", 0));
  return 1;
}

uint64_t IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit(void *a1, sqlite3_int64 a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x3052000000;
  __int16 v24 = sub_1AFC47910;
  uint64_t v25 = sub_1AFC47920;
  id v26 = 0;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(void *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit is in IMDP with afterRow %@ limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    memset(v28, 0, sizeof(v28));
    memset(buf, 0, sizeof(buf));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    if (a1) {
      CFStringRef v5 = @" select * from sync_deleted_attachments where LENGTH(TRIM(recordID)) > 0 AND ROWID > ? ORDER BY ROWID LIMIT ?;";
    }
    else {
      CFStringRef v5 = @" select * from sync_deleted_attachments where LENGTH(TRIM(recordID)) > 0 ORDER BY ROWID LIMIT ?;";
    }
    _IMDSqlOperationBeginQuery((uint64_t)buf, v5);
    if (a1) {
      IMDSqlStatementBindInt64((uint64_t)v28, [a1 longLongValue]);
    }
    IMDSqlStatementBindInt64((uint64_t)v28, a2);
    while (IMDSqlOperationHasRows((uint64_t)buf))
    {
      Row = IMDSqlStatementGetRow((sqlite3_stmt **)v28);
      if (Row) {
        [(id)v22[5] addObject:Row];
      }
    }
    IMDSqlOperationFinishQuery((uint64_t)buf);
    uint64_t v20 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v20);
    if (v20)
    {
      uint32_t v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1AFC71898((uint64_t)&v20, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        buf[0] = 138412546;
        *(void *)&buf[1] = a1;
        LOWORD(buf[3]) = 2048;
        *(void *)((char *)&buf[3] + 2) = a2;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit is in imagent afterRow %@ with limit %lld", (uint8_t *)buf, 0x16u);
      }
    }
    v19[0] = (void (*)(void))MEMORY[0x1E4F143A8];
    v19[1] = (void (*)(void))3221225472;
    v19[2] = (void (*)(void))sub_1AFC514FC;
    v19[3] = (void (*)(void))&unk_1E5F8D580;
    v19[4] = (void (*)(void))&v21;
    __syncXPCIMDAttachmentRecordCopyAttachmentsToDeleteFromCloudKit_IPCAction(v19, a1, a2);
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [(id)v22[5] count];
        buf[0] = 134217984;
        *(void *)&buf[1] = v9;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Returned from DB call after loading attachments to delete messages count %lu", (uint8_t *)buf, 0xCu);
      }
    }
  }
  uint64_t v17 = v22[5];
  _Block_object_dispose(&v21, 8);
  return v17;
}

void sub_1AFC51470(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC51428);
  }
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(exc_buf);
}

xpc_object_t sub_1AFC514FC(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t result = xpc_dictionary_get_value(xdict, "array_result");
  if (result)
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_1AFC51590;
    applier[3] = &unk_1E5F8D558;
    applier[4] = *(void *)(a1 + 32);
    return (xpc_object_t)xpc_array_apply(result, applier);
  }
  return result;
}

uint64_t sub_1AFC51590(uint64_t a1, int a2, xpc_object_t xdict)
{
  int64_t int64 = xpc_dictionary_get_int64(xdict, "ROWID");
  uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "guid"), 4);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v6, @"guid", objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, "recordID"), 4), @"recordID", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", int64), @"ROWID", 0));
  return 1;
}

__CFString *sub_1AFC51694(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppend(Mutable, @"DELETE FROM sync_deleted_attachments WHERE (recordint ID = ?");
  uint64_t v3 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      CFStringAppend(Mutable, @" OR recordint ID = ?");
      --v3;
    }
    while (v3);
  }
  CFStringAppend(Mutable, @""));
  return Mutable;
}

void IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs(const __CFArray *a1)
{
  if (a1 && CFArrayGetCount(a1))
  {
    if (IMDIsRunningInDatabaseServerProcess())
    {
      CFIndex Count = CFArrayGetCount(a1);
      uint64_t v3 = sub_1AFC51694(Count);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _OWORD v6[2] = sub_1AFC51898;
      v6[3] = &unk_1E5F9BDE0;
      v6[4] = v3;
      void v6[5] = a1;
      IMDRunSqlOperation((uint64_t)v6);
      CFRelease(v3);
      return;
    }
    __syncXPCIMDAttachmentRecordDeleteTombStonedAttachmentsForRecordIDs_IPCAction(0, (uint64_t)a1);
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        CFStringRef v5 = "Returned from DB call after deleting RecordIDs from Tombstone table";
        goto LABEL_11;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      CFStringRef v5 = "IMDAttachmentRecordDeleteTombStonedAttachmentsWithRecordIDs has no GUIDs to delete.";
LABEL_11:
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
}

BOOL sub_1AFC51898(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _OWORD v6[2] = sub_1AFC51918;
  v6[3] = &unk_1E5F90128;
  CFStringRef v3 = *(const __CFString **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = a2;
  void v6[5] = v4;
  return _IMDSqlOperationRunQuery(a2, v3, (uint64_t)v6, 0);
}

void sub_1AFC51918(uint64_t a1)
{
}

void IMDAttachmentRecordClearDeleteTombStones()
{
  if (IMDIsRunningInDatabaseServerProcess())
  {
    if (IMOSLoggingEnabled())
    {
      v0 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordClearDeleteTombStones", (uint8_t *)v2, 2u);
      }
    }
    memset(v2, 0, sizeof(v2));
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v2);
    IMDSqlOperationExecuteQuery((uint64_t)v2, @"delete from sync_deleted_attachments;", (uint64_t)&unk_1F084D778);
    IMDSqlOperationRelease((uint64_t)v2, 0);
  }
  else
  {
    __syncXPCMDAttachmentRecordDeleteTombStonedAttachmentsToDeleteFromCloudKit_IPCAction(0);
    if (IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v2[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "Returned from DB call after clearing all tombstones", (uint8_t *)v2, 2u);
      }
    }
  }
}

void sub_1AFC51A80()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "IMDAttachmentRecordClearDeleteTombStones deleted pending sync table", v1, 2u);
    }
  }
}

void IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "Request to markAllUnsuccessFullySyncedAttachmentsAsNeedingSync ", buf, 2u);
    }
  }
  if (IMDIsRunningInDatabaseServerProcess())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    *(_OWORD *)long long buf = 0u;
    long long v4 = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    IMDSqlOperationExecuteQuery((uint64_t)buf, @"UPDATE attachment SET ck_sync_state=0 where ck_sync_state in (2,3,5) OR (ck_sync_state==1 AND guid not like \"at_%\");",
      (uint64_t)&unk_1F084D798);
    uint64_t v2 = 0;
    IMDSqlOperationRelease((uint64_t)buf, &v2);
    if (v2 && IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v14 = 138412290;
        uint64_t v15 = v2;
        _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "Error executing markAllFailedAttachmentsAsNeedingSync %@ ", v14, 0xCu);
      }
    }
  }
  else
  {
    __syncXPCIMDAttachmentRecordMarkFailedAttachmentsAsNeedingSync_IPCAction(0);
  }
}

void sub_1AFC51CB8()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "Executed query to mark all unsuccessfuly synced attachments as needing sync", v1, 2u);
    }
  }
}

uint64_t sub_1AFC51D58(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) fileExistsAtPath:a2];
  if (result)
  {
    uint64_t v5 = 0;
    uint64_t result = [*(id *)(a1 + 32) attributesOfItemAtPath:a2 error:&v5];
    if (result)
    {
      uint64_t result = [(id)result fileSize];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
    }
  }
  return result;
}

void _IMDSMSRecordStoreCustomFunctionBeforeDeleteAttachment(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  int v6 = dword_1E9AF83B0++;
  if (v6 >= 1)
  {
    long long v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71908(v7);
    }
  }
  if (a2 == 2)
  {
    int v8 = sqlite3_value_int(*a3);
    long long v9 = sqlite3_value_text(a3[1]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1AFC51EE8;
    v10[3] = &unk_1E5F9B8E0;
    v10[4] = v9;
    int v11 = v8;
    IMDPersistencePerformBlock(v10, 1);
    sqlite3_result_int(a1, 0);
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionDeleteAttachment: wrong number of arguments", -1);
  }
  --dword_1E9AF83B0;
}

void sub_1AFC51EE8(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[NSString stringWithUTF8String:*(void *)(a1 + 32)];
  if ([v2 length])
  {
    CFStringRef v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, finding messageRowID for attachment rowID %d", buf, 8u);
    }
    *(void *)long long buf = 0;
    uint64_t v35 = buf;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1AFC52538;
    v30[3] = &unk_1E5F9D908;
    int v31 = *(_DWORD *)(a1 + 40);
    v30[4] = buf;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT message_id FROM message_attachment_join WHERE attachment_id = ? LIMIT 1", (uint64_t)v30);
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = (void *)*((void *)v35 + 3);
      *(_DWORD *)uint64_t v32 = 134217984;
      uint64_t v33 = v6;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, message row id: %lli", v32, 0xCu);
    }
    uint64_t v7 = IMDMessageRecordCopyMessageForRowID(*((void *)v35 + 3));
    int v8 = (void *)v7;
    if (v7)
    {
      uint64_t v28 = 0;
      CFTypeRef v29 = 0;
      uint64_t v27 = 0;
      IMDMessageRecordBulkCopy(v7, 0, 0, 0, &v28, 0, 0, 0, 0, 0, &v29, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        &v27,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0);
      long long v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v32 = 138412290;
        uint64_t v33 = v8;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, messageRecord: %@", v32, 0xCu);
      }
      long long v10 = v28;
      if (v29 && v28)
      {
        int v11 = (void *)JWDecodeCodableObjectWithStandardAllowlist();
        long long v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t v32 = 138412290;
          uint64_t v33 = v2;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, we found attachment guid: %@", v32, 0xCu);
        }
        long long v13 = (void *)[v11 mutableCopy];
        uint64_t v14 = [v13 length];
        uint64_t v15 = *MEMORY[0x1E4F6C1F8];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1AFC52584;
        void v26[3] = &unk_1E5F9D930;
        v26[4] = v13;
        void v26[5] = v2;
        objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v26);
        uint64_t v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithMessageSummaryInfoData:v27];
        uint64_t v17 = (void *)[v16 objectForKey:*MEMORY[0x1E4F6D688]];
        if ([v13 length] || objc_msgSend(v17, "count"))
        {
          uint64_t v18 = JWEncodeCodableObject();
          uint64_t v19 = [v13 string];
          if (v18)
          {
            if (v19)
            {
              v24[0] = MEMORY[0x1E4F143A8];
              v24[1] = 3221225472;
              v24[2] = sub_1AFC52794;
              v24[3] = &unk_1E5F9D980;
              v24[4] = v19;
              v24[5] = v28;
              void v24[6] = v18;
              _IMDPerformLockedStatementBlockWithQuery(@"UPDATE message set attributedBody = ?, text = ? where guid = ?", (uint64_t)v24);
              uint64_t v20 = IMLogHandleForCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)uint64_t v32 = 0;
                _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, updated attributedBody and text", v32, 2u);
              }
            }
          }
        }
        else
        {
          __int16 v22 = IMLogHandleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v32 = 0;
            _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment,deleted messages for guid", v32, 2u);
          }
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_1AFC526C4;
          void v25[3] = &unk_1E5F9D958;
          v25[4] = v28;
          IMDPersistencePerformBlock(v25, 0);
        }
        long long v10 = v28;
      }
      if (v10)
      {
        CFRelease(v10);
        uint64_t v28 = 0;
      }
      if (v29)
      {
        CFRelease(v29);
        CFTypeRef v29 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      uint64_t v21 = IMLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, no message record found", v32, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  uint64_t v23 = IMLogHandleForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, all done!", buf, 2u);
  }
}

void sub_1AFC524E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC52538(uint64_t a1)
{
  CSDBSqliteBindInt();
  uint64_t result = CSDBSqliteStatementInteger64Result();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (int)result;
  return result;
}

void sub_1AFC52584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F6C188] atIndex:a3 effectiveRange:0];
  int v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    int v11 = v7;
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, guid in message part: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([v7 isEqualToString:*(void *)(a1 + 40)])
  {
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a3, a4);
    long long v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v1xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = 0;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "TRIGGER: Before deleting attachment, was equal, deleting range", (uint8_t *)&v10, 2u);
    }
  }
}

void sub_1AFC526C4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "TRIGGER: deferred deletion of messageGUID: %@", buf, 0xCu);
  }
  CFArrayRef v4 = (const __CFArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)(a1 + 32), 0);
  IMDMessageRecordDeleteMessagesForGUIDs(v4, 0);
}

uint64_t sub_1AFC52794()
{
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindTextFromCFString();
  return CSDBSqliteStatementPerform();
}

void _IMDSMSRecordStoreCustomFunctionDeleteAttachment(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    CFArrayRef v4 = sqlite3_value_text(*a3);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x1B3E8A120]();
      uint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:v5];
      id v8 = (id)[v7 stringByResolvingAndStandardizingPath];
      int v9 = IMSharedHelperPathIsInStickerCache();
      int v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = @"NO";
        if (v9) {
          int v11 = @"YES";
        }
        int v21 = 138412546;
        uint64_t v22 = (uint64_t)v8;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "TRIGGER: Deleting attachment files based on path: %@, pathIsInStickerCache %@", (uint8_t *)&v21, 0x16u);
      }
      if (([v8 isAbsolutePath] ^ 1 | v9))
      {
        uint64_t v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          uint64_t v22 = (uint64_t)v8;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Did not delete attachment at path %@", (uint8_t *)&v21, 0xCu);
        }
        int v13 = 0;
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        uint64_t v15 = (void *)[v8 stringByDeletingLastPathComponent];
        if (v8) {
          [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
        }
        uint64_t v16 = IMPreviewCachesDirectoryWithAttachmentURL();
        unint64_t v17 = objc_msgSend((id)objc_msgSend(v15, "lastPathComponent"), "length");
        uint64_t v18 = IMLogHandleForCategory();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17 < 0x24)
        {
          if (v19)
          {
            int v21 = 138412290;
            uint64_t v22 = (uint64_t)v8;
            _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Just deleting the original path: %@", (uint8_t *)&v21, 0xCu);
          }
          int v13 = [v14 removeItemAtPath:v8 error:0];
        }
        else
        {
          if (v19)
          {
            int v21 = 138412290;
            uint64_t v22 = (uint64_t)v15;
            _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Deleting this guid directory too: %@", (uint8_t *)&v21, 0xCu);
          }
          int v13 = [v14 removeItemAtPath:v15 error:0];
          if (v16)
          {
            [v14 removeItemAtURL:v16 error:0];
            uint64_t v20 = IMLogHandleForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              int v21 = 138412290;
              uint64_t v22 = v16;
              _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Deleting this caches guid directory too: %@", (uint8_t *)&v21, 0xCu);
            }
          }
        }
      }
    }
    else
    {
      int v13 = 0;
    }
    sqlite3_result_int(a1, v13);
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionDeleteAttachment: wrong number of arguments", -1);
  }
}

void _IMDSMSRecordStoreCustomFunctionAfterDeleteMessagePlugin(sqlite3_context *a1, int a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = &qword_1E9AF8000;
  int v7 = dword_1E9AF83B4++;
  if (v7 >= 1)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1AFC71908(v8);
    }
  }
  if (a2 == 2)
  {
    int v9 = sqlite3_value_text(*(sqlite3_value **)(a3 + 8));
    if (v9)
    {
      int v10 = v9;
      context = (void *)MEMORY[0x1B3E8A120]();
      uint64_t v11 = [NSString stringWithUTF8String:v10];
      id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      for (uint64_t i = 0; i != 3; ++i)
      {
        [NSString stringWithFormat:@"%@-%d", v11, i];
        uint64_t v14 = IMPluginSnapshotCachesFileURL();
        uint64_t v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v20 = v14;
          _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "TRIGGER: Deleting plugin snapshot at path: %@", buf, 0xCu);
        }
        uint64_t v18 = 0;
        if (([v12 removeItemAtURL:v14 error:&v18] & 1) == 0)
        {
          uint64_t v16 = IMLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v20 = v18;
            _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Failure to delete file at path with error: %@", buf, 0xCu);
          }
        }
      }

      uint64_t v6 = &qword_1E9AF8000;
    }
  }
  else
  {
    sqlite3_result_error(a1, "_IMDSMSRecordStoreCustomFunctionAfterDeleteMessagePlugin: wrong number of arguments", -1);
  }
  --*((_DWORD *)v6 + 237);
}

void _IMDSMSRecordStoreCustomFunctionTrim(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 1)
  {
    if (a3)
    {
      CFArrayRef v4 = sqlite3_value_text(*a3);
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = (void *)MEMORY[0x1B3E8A120]();
        sqlite3_result_text(a1, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v5), "trimmedString"), "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        return;
      }
      int v7 = "_IMDSMSRecordStoreCustomFunctionTrim: SQLite text of value[0] was NULL.";
    }
    else
    {
      int v7 = "_IMDSMSRecordStoreCustomFunctionTrim: sqlite3_value was NULL.";
    }
  }
  else
  {
    int v7 = "_IMDSMSRecordStoreCustomFunctionTrim: wrong number of arguments";
  }
  sqlite3_result_error(a1, v7, -1);
}

uint64_t IMDPersistenceCheckNotDatabaseThread()
{
  if (byte_1EB5ABD00)
  {
    IMDSharedThreadedRecordStore();
    if (CSDBThreadedRecordStoreOwnsCurrentThread())
    {
      if (IMOSLoggingEnabled())
      {
        v0 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_INFO, "**************************************************************************", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v1 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_INFO, "***** Non-database work on the database thread, please file a radar ******", v6, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v2 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "**************************************************************************", v5, 2u);
        }
      }
      if (qword_1E9AF83C0 != -1) {
        dispatch_once(&qword_1E9AF83C0, &unk_1F084C7E8);
      }
      uint64_t v3 = qword_1E9AF83C8;
      if (os_log_type_enabled((os_log_t)qword_1E9AF83C8, OS_LOG_TYPE_FAULT)) {
        sub_1AFC7194C(v3);
      }
    }
  }
  return 1;
}

uint64_t sub_1AFC535D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t _IMDContactStore()
{
  if (qword_1EB5AB9E0 != -1) {
    dispatch_once(&qword_1EB5AB9E0, &unk_1F084D020);
  }
  return qword_1EB5AB9E8;
}

id sub_1AFC53628()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1B980]);
  qword_1EB5AB9E8 = (uint64_t)result;
  return result;
}

void *IMDGenerateInClauseForCount(int a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"IN (");
  if (a1 >= 1)
  {
    int v3 = 0;
    do
    {
      if (v3 >= a1 - 1) {
        CFArrayRef v4 = @"? ");
      }
      else {
        CFArrayRef v4 = @"?, ";
      }
      [v2 appendFormat:v4];
      ++v3;
    }
    while (a1 != v3);
  }
  return v2;
}

uint64_t IMDPersistenceSubmitEvent(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1 length];
  if (result)
  {
    if (IMOSLoggingEnabled())
    {
      int v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v4 = 138412290;
        uint64_t v5 = a1;
        _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Submitting persistence event: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return IMSubmitSimpleAggegateMetric();
  }
  return result;
}

uint64_t IMDSetIsRunningInDatabaseServerProcess(uint64_t result)
{
  byte_1EB5ABD00 = result;
  return result;
}

void *IMDDBRecordGetAllColumnNames(uint64_t *a1, int a2)
{
  LODWORD(v2) = a2;
  int v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a2 + 1];
  [v4 addObject:@"ROWID"];
  if ((int)v2 >= 1)
  {
    uint64_t v2 = v2;
    do
    {
      uint64_t v5 = *a1;
      a1 += 5;
      objc_msgSend(v4, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", v5));
      --v2;
    }
    while (v2);
  }
  return v4;
}

__CFString *_IMDGetUserDefaultsDomainForSavedDeviceInfo()
{
  if (qword_1E9AF83B8) {
    return (__CFString *)qword_1E9AF83B8;
  }
  else {
    return @"com.apple.imdsmsrecordstore";
  }
}

void _IMDSetUserDefaultsDomainForSavedDeviceInfo(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1E9AF83B8)
  {

    qword_1E9AF83B8 = 0;
  }
  if (a1) {
    qword_1E9AF83B8 = a1;
  }
  uint64_t v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = (__CFString *)qword_1E9AF83B8;
    if (!qword_1E9AF83B8) {
      int v3 = @"com.apple.imdsmsrecordstore";
    }
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Set device state test user defaults domain to: %@", (uint8_t *)&v4, 0xCu);
  }
}

void *_IMDGetSavedDeviceState()
{
  if (qword_1E9AF83B8) {
    CFStringRef v0 = (const __CFString *)qword_1E9AF83B8;
  }
  else {
    CFStringRef v0 = @"com.apple.imdsmsrecordstore";
  }
  uint64_t v1 = (void *)CFPreferencesCopyValue(@"IMDSavedDeviceState", v0, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v2 = v1;
  if (v1) {
    id v3 = v1;
  }
  return v2;
}

id _IMDSetAllPropertiesOnDeviceStateIfNeeded(void *a1)
{
  id v1 = (id)[a1 mutableCopy];
  if (!v1) {
    id v1 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDidUpgradeKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateDidUpgradeKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDidRestoreFromBackupKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateDidRestoreFromBackupKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDidRestoreFromCloudBackupKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateDidRestoreFromCloudBackupKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDidMigrateKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateDidMigrateKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateBuildVersionKey"]) {
    objc_msgSend(v1, "setObject:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "operatingSystemVersionString"), @"IMDSavedDeviceStateBuildVersionKey");
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateIsMigratingKey"]) {
    [v1 setObject:MEMORY[0x1E4F1CC28] forKey:@"IMDSavedDeviceStateIsMigratingKey"];
  }
  if (![v1 objectForKey:@"IMDSavedDeviceStateDateKey"]) {
    objc_msgSend(v1, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), @"IMDSavedDeviceStateDateKey");
  }
  return v1;
}

void _IMDSetSavedDeviceState(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1) {
    id v1 = _IMDSetAllPropertiesOnDeviceStateIfNeeded(a1);
  }
  else {
    id v1 = 0;
  }
  if (qword_1E9AF83B8) {
    CFStringRef v2 = (const __CFString *)qword_1E9AF83B8;
  }
  else {
    CFStringRef v2 = @"com.apple.imdsmsrecordstore";
  }
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(@"IMDSavedDeviceState", v1, v2, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (qword_1E9AF83B8) {
    CFStringRef v4 = (const __CFString *)qword_1E9AF83B8;
  }
  else {
    CFStringRef v4 = @"com.apple.imdsmsrecordstore";
  }
  CFPreferencesSynchronize(v4, @"mobile", v3);
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = [v1 description];
    _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Saved device state: %@", (uint8_t *)&v6, 0xCu);
  }
}

id IMDReadDeviceState()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFStringRef v0 = _IMDGetSavedDeviceState();
  id v1 = _IMDSetAllPropertiesOnDeviceStateIfNeeded(v0);
  CFStringRef v2 = IMLogHandleForCategory();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (v3)
    {
      int v6 = 138412290;
      uint64_t v7 = [v1 description];
      CFStringRef v4 = "Read stored device state: %@";
LABEL_6:
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v3)
  {
    int v6 = 138412290;
    uint64_t v7 = [v1 description];
    CFStringRef v4 = "Device state not set, return default version: %@";
    goto LABEL_6;
  }
  return v1;
}

void IMSaveDeviceState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"IMDSavedDeviceStateDidUpgradeKey";
  v12[0] = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  v11[1] = @"IMDSavedDeviceStateDidRestoreFromBackupKey";
  v12[1] = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
  void v11[2] = @"IMDSavedDeviceStateDidMigrateFromDifferentDeviceKey";
  void v12[2] = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  v11[3] = @"IMDSavedDeviceStateDidRestoreFromCloudBackupKey";
  v12[3] = [MEMORY[0x1E4F28ED0] numberWithBool:a4];
  uint8_t v11[4] = @"IMDSavedDeviceStateDidMigrateKey";
  v12[4] = [MEMORY[0x1E4F28ED0] numberWithBool:a5];
  v11[5] = @"IMDSavedDeviceStateIsMigratingKey";
  v12[5] = [MEMORY[0x1E4F28ED0] numberWithBool:a6];
  _IMDSetSavedDeviceState((void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6]);
}

os_log_t sub_1AFC53EA8()
{
  os_log_t result = os_log_create("com.apple.runtime-issues", "Messages");
  qword_1E9AF83C8 = (uint64_t)result;
  return result;
}

dispatch_queue_t sub_1AFC53ED8()
{
  CFStringRef v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("_IMDPersistenceClientQueue", v0);
  qword_1E9AF83D0 = (uint64_t)result;
  return result;
}

void sub_1AFC53FF8()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (qword_1EB5ABB18 != -1) {
    dispatch_once(&qword_1EB5ABB18, &unk_1F084D040);
  }
  if (!qword_1EB5ABB30)
  {
    CFStringRef v0 = NSString;
    uint64_t v1 = IMFileLocationTrimFileName();
    CFStringRef v2 = [NSString stringWithFormat:&stru_1F084E970];
    BOOL v3 = [v0 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"kIMContactsContactEmailAddressesKey", "void _IMDContactsApiInit(void)", v1, 71, v2];

    CFStringRef v4 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v4)
    {
      v4(v3);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v19 = v3;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  if (!qword_1EB5ABB40)
  {
    int v6 = NSString;
    uint64_t v7 = IMFileLocationTrimFileName();
    uint64_t v8 = [NSString stringWithFormat:&stru_1F084E970];
    int v9 = [v6 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"kIMContactsContactPhoneNumbersKey", "void _IMDContactsApiInit(void)", v7, 72, v8];

    int v10 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v10)
    {
      v10(v9);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v19 = v9;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  if (!qword_1EB5ABB38)
  {
    id v12 = NSString;
    uint64_t v13 = IMFileLocationTrimFileName();
    uint64_t v14 = [NSString stringWithFormat:&stru_1F084E970];
    uint64_t v15 = [v12 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"kIMContactsContactInstantMessageAddressesKey", "void _IMDContactsApiInit(void)", v13, 73, v14];

    uint64_t v16 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v16)
    {
      v16(v15);
    }
    else if (IMOSLoggingEnabled())
    {
      unint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v19 = v15;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
}

void sub_1AFC551F8(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x1AFC551E4);
  }
  objc_end_catch();
  _Unwind_Resume(exc_buf);
}

uint64_t sub_1AFC55238(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = 0;
  return result;
}

void sub_1AFC55248(uint64_t a1)
{
}

void sub_1AFC55250(void *a1)
{
  CFStringRef v2 = +[IMDContactCache sharedInstance];
  [v2 cacheContactsFromFetchResults:a1[4] forAliases:a1[5]];

  id v3 = +[IMDContactCache sharedInstance];
  [v3 setCurrentHistoryToken:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

uint64_t sub_1AFC55C00()
{
  if (!qword_1EB5ABB30)
  {
    CFStringRef v0 = (void **)MEMORY[0x1B3E89B20]("CNContactEmailAddressesKey", @"Contacts");
    if (v0) {
      uint64_t v1 = *v0;
    }
    else {
      uint64_t v1 = 0;
    }
    objc_storeStrong((id *)&qword_1EB5ABB30, v1);
  }
  if (!qword_1EB5ABB40)
  {
    CFStringRef v2 = (void **)MEMORY[0x1B3E89B20]("CNContactPhoneNumbersKey", @"Contacts");
    if (v2) {
      id v3 = *v2;
    }
    else {
      id v3 = 0;
    }
    objc_storeStrong((id *)&qword_1EB5ABB40, v3);
  }
  if (!qword_1EB5ABB38)
  {
    CFStringRef v4 = (void **)MEMORY[0x1B3E89B20]("CNContactInstantMessageAddressesKey", @"Contacts");
    if (v4) {
      uint64_t v5 = *v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_storeStrong((id *)&qword_1EB5ABB38, v5);
  }
  qword_1EB5ABB00 = MEMORY[0x1B3E89B10](@"CNContactStore", @"Contacts");
  qword_1EB5ABAE8 = MEMORY[0x1B3E89B10](@"CNContact", @"Contacts");
  qword_1EB5ABB10 = MEMORY[0x1B3E89B10](@"CNPhoneNumber", @"Contacts");
  qword_1EB5ABAF8 = MEMORY[0x1B3E89B10](@"CNContactFormatter", @"Contacts");
  qword_1EB5ABAF0 = MEMORY[0x1B3E89B10](@"CNContactFetchRequest", @"Contacts");
  qword_1EB5ABAE0 = MEMORY[0x1B3E89B10](@"CNChangeHistoryFetchRequest", @"Contacts");
  uint64_t result = MEMORY[0x1B3E89B10](@"CNFavorites", @"Contacts");
  qword_1EB5ABB08 = result;
  return result;
}

void sub_1AFC56028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AFC56050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = 0;
  return result;
}

void sub_1AFC56060(uint64_t a1)
{
}

void sub_1AFC56068(uint64_t a1, void *a2)
{
}

__CFString *sub_1AFC56118(unint64_t a1)
{
  if (a1 > 0xFB) {
    return @"Unknown";
  }
  else {
    return off_1E5F9DAB8[a1];
  }
}

uint64_t sub_1AFC56370(void *a1)
{
  id v1 = objc_msgSend(a1, sel_selectAllColumns);
  sub_1AFC71D08();

  swift_bridgeObjectRetain();
  sub_1AFC71D38();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1AFC71CF8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1AFC56474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 0)
  {
    uint64_t result = sub_1AFC71F28();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      int v6 = (void *)sub_1AFC71DB8();
      uint64_t v7 = v6;
      _OWORD v6[2] = a3;
      v6[4] = a1;
      void v6[5] = a2;
      if (a3 != 1)
      {
        void v6[6] = a1;
        void v6[7] = a2;
        uint64_t v8 = a3 - 2;
        if (v8)
        {
          int v9 = v6 + 9;
          do
          {
            *(v9 - 1) = a1;
            void *v9 = a2;
            swift_bridgeObjectRetain();
            v9 += 2;
            --v8;
          }
          while (v8);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x1E4FBC860];
    }
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1AFC56654(uint64_t a1)
{
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_copyChatGUIDsWithUnreadMessagesQuery);
  uint64_t v3 = sub_1AFC71D08();

  if ((a1 & 0x8000000000000000) == 0)
  {
    sub_1AFC71D38();
    sub_1AFC71F68();
    sub_1AFC71D38();
    swift_bridgeObjectRelease();
  }
  return v3;
}

IMDChatQueryStrings __swiftcall IMDChatQueryStrings.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (IMDChatQueryStrings)objc_msgSend(v0, sel_init);
}

id IMDChatQueryStrings.init()()
{
  v1.super_class = (Class)IMDChatQueryStrings;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for IMDChatQueryStrings()
{
  unint64_t result = qword_1E9AF78E0;
  if (!qword_1E9AF78E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9AF78E0);
  }
  return result;
}

uint64_t sub_1AFC5683C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1AFC56880()
{
  unint64_t result = qword_1E9AF7500;
  if (!qword_1E9AF7500)
  {
    sub_1AFC568DC((uint64_t *)&unk_1E9AF74A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7500);
  }
  return result;
}

uint64_t sub_1AFC568DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1AFC56924()
{
  uint64_t v0 = sub_1AFC71BE8();
  sub_1AFC57E00(v0, qword_1E9AF8410);
  sub_1AFC57D04(v0, (uint64_t)qword_1E9AF8410);
  sub_1AFC71BB8();
  return sub_1AFC71BD8();
}

uint64_t sub_1AFC56990(uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return v1;
  }
  unint64_t v3 = 0;
  unint64_t v4 = v2 >> 1;
  for (unint64_t i = v2 + 31; ; --i)
  {
    if (v3 == i - 32) {
      goto LABEL_5;
    }
    unint64_t v6 = *(void *)(v1 + 16);
    if (v3 >= v6) {
      break;
    }
    if (i - 32 >= v6) {
      goto LABEL_12;
    }
    char v7 = *(unsigned char *)(v1 + v3 + 32);
    char v8 = *(unsigned char *)(v1 + i);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1AFC57E64(v1);
      uint64_t v1 = result;
    }
    *(unsigned char *)(v1 + v3 + 32) = v8;
    *(unsigned char *)(v1 + i) = v7;
LABEL_5:
    if (v4 == ++v3) {
      return v1;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

id sub_1AFC56A4C(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)sub_1AFC71A98();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_1AFC71AC8();
    unint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_1AFC71A88();

    swift_willThrow();
    uint64_t v9 = sub_1AFC71AC8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_1AFC56BA4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = sub_1AFC71AF8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a3 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_1AFC57D3C(a2, a3);
      sub_1AFC57D3C(a2, a3);
      break;
    default:
      break;
  }
  sub_1AFC71B08();
  sub_1AFC57DA8(a2, a3);
  uint64_t v10 = *(void *)(a1 + 16);
  sub_1AFC58540(&qword_1E9AF7D28, MEMORY[0x1F418B908]);
  swift_bridgeObjectRetain();
  sub_1AFC71E98();
  if (v10)
  {
    uint64_t v11 = (unsigned __int8 *)(a1 + 32);
    while ((v15 & 1) == 0 && v14[14] == *v11)
    {
      sub_1AFC71E98();
      ++v11;
      if (!--v10) {
        goto LABEL_8;
      }
    }
    uint64_t v12 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v12 = v15;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

id sub_1AFC56E60(uint64_t a1)
{
  unint64_t v2 = v1;
  v69[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = (void *)sub_1AFC71A98();
  LODWORD(v2) = objc_msgSend(v2, sel_imagePreviewIsMultiFrameAtFileURL_, v4);

  if (!v2) {
    return 0;
  }
  sub_1AFC57CC4();
  sub_1AFC71AC8();
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)&v69[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  id v8 = sub_1AFC56A4C((uint64_t)v6);
  uint64_t v9 = sub_1AFC71DD8();
  unint64_t v13 = v10;
  if (v10 >> 60 == 15)
  {
    if (qword_1E9AF78B0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_1AFC71BE8();
    sub_1AFC57D04(v14, (uint64_t)qword_1E9AF8410);
    unsigned __int8 v15 = sub_1AFC71BC8();
    os_log_type_t v16 = sub_1AFC71E18();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_1AFB53000, v15, v16, "Failed to read frame length", v17, 2u);
      MEMORY[0x1B3E8AA80](v17, -1, -1);
    }
    goto LABEL_10;
  }
  unint64_t v18 = v10 >> 62;
  uint64_t v19 = v9;
  switch(v10 >> 62)
  {
    case 1uLL:
      LODWORD(v2xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = HIDWORD(v9) - v9;
      if (__OFSUB__(HIDWORD(v9), v9)) {
        goto LABEL_67;
      }
      uint64_t v20 = (int)v20;
LABEL_16:
      if (v20 != 8)
      {
LABEL_23:
        if (qword_1E9AF78B0 != -1) {
          swift_once();
        }
        uint64_t v29 = sub_1AFC71BE8();
        sub_1AFC57D04(v29, (uint64_t)qword_1E9AF8410);
        sub_1AFC57D3C(v19, v13);
        unsigned __int8 v15 = sub_1AFC71BC8();
        os_log_type_t v30 = sub_1AFC71E18();
        if (os_log_type_enabled(v15, v30))
        {
          int v31 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)int v31 = 134217984;
          uint64_t v32 = v31;
          unint64_t v33 = 0;
          switch((int)v18)
          {
            case 1:
              LODWORD(v33) = HIDWORD(v19) - v19;
              if (__OFSUB__(HIDWORD(v19), v19)) {
                goto LABEL_72;
              }
              unint64_t v33 = (int)v33;
              break;
            case 2:
              uint64_t v49 = *(void *)(v19 + 16);
              uint64_t v48 = *(void *)(v19 + 24);
              BOOL v23 = __OFSUB__(v48, v49);
              unint64_t v33 = v48 - v49;
              if (v23) {
                goto LABEL_73;
              }
              break;
            case 3:
              break;
            default:
              unint64_t v33 = BYTE6(v13);
              break;
          }
          v69[0] = (id)v33;
          sub_1AFC71EA8();
          sub_1AFC57D94(v19, v13);
          _os_log_impl(&dword_1AFB53000, v15, v30, "Failed to read frame length - data wrong length: %ld", v32, 0xCu);
          uint64_t v47 = v32;
LABEL_42:
          MEMORY[0x1B3E8AA80](v47, -1, -1);

LABEL_43:
          sub_1AFC57D94(v19, v13);
          return 0;
        }
        sub_1AFC57D94(v19, v13);

        uint64_t v34 = v19;
        unint64_t v35 = v13;
LABEL_29:
        sub_1AFC57D94(v34, v35);

        return 0;
      }
      uint64_t v24 = v9;
      if (!v18) {
        goto LABEL_33;
      }
      if (v18 == 1)
      {
        if ((int)v9 > v9 >> 32)
        {
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        sub_1AFC57D3C(v9, v10);
        uint64_t v25 = sub_1AFC71A58();
        if (!v25)
        {
LABEL_79:
          sub_1AFC71A68();
          __break(1u);
          goto LABEL_80;
        }
        uint64_t v26 = v25;
        uint64_t v27 = sub_1AFC71A78();
        uint64_t v28 = (int)v19 - v27;
        if (__OFSUB__((int)v19, v27))
        {
LABEL_71:
          __break(1u);
LABEL_72:
          __break(1u);
LABEL_73:
          __break(1u);
          goto LABEL_74;
        }
        sub_1AFC71A68();
        uint64_t v24 = *(void *)(v26 + v28);
        sub_1AFC57D94(v19, v13);
      }
      else
      {
        uint64_t v36 = *(void *)(v9 + 16);
        swift_retain();
        swift_retain();
        uint64_t v37 = sub_1AFC71A58();
        if (!v37)
        {
LABEL_80:
          sub_1AFC71A68();
          __break(1u);
          JUMPOUT(0x1AFC57938);
        }
        uint64_t v38 = v37;
        uint64_t v39 = sub_1AFC71A78();
        BOOL v23 = __OFSUB__(v36, v39);
        uint64_t v40 = v36 - v39;
        if (v23) {
          goto LABEL_70;
        }
        sub_1AFC71A68();
        uint64_t v24 = *(void *)(v38 + v40);
        swift_release();
        swift_release();
      }
LABEL_33:
      if (v24 < 0)
      {
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
        goto LABEL_69;
      }
      uint64_t v41 = sub_1AFC71DD8();
      unint64_t v43 = v42;
      if (v42 >> 60 == 15)
      {
        if (qword_1E9AF78B0 == -1)
        {
LABEL_36:
          uint64_t v44 = sub_1AFC71BE8();
          sub_1AFC57D04(v44, (uint64_t)qword_1E9AF8410);
          unsigned __int8 v15 = sub_1AFC71BC8();
          os_log_type_t v45 = sub_1AFC71E18();
          if (!os_log_type_enabled(v15, v45))
          {
            sub_1AFC57D94(v19, v13);
LABEL_10:

            return 0;
          }
          long long v46 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v46 = 0;
          _os_log_impl(&dword_1AFB53000, v15, v45, "Failed to read first frame", v46, 2u);
          uint64_t v47 = v46;
          goto LABEL_42;
        }
LABEL_74:
        swift_once();
        goto LABEL_36;
      }
      unint64_t v50 = v42 >> 62;
      uint64_t v51 = v41;
      switch(v42 >> 62)
      {
        case 1uLL:
          LODWORD(v52) = HIDWORD(v41) - v41;
          if (__OFSUB__(HIDWORD(v41), v41))
          {
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
            goto LABEL_79;
          }
          uint64_t v52 = (int)v52;
LABEL_50:
          if (v52 != v24)
          {
LABEL_54:
            if (qword_1E9AF78B0 != -1) {
              swift_once();
            }
            uint64_t v56 = sub_1AFC71BE8();
            sub_1AFC57D04(v56, (uint64_t)qword_1E9AF8410);
            sub_1AFC57D3C(v51, v43);
            unsigned __int8 v15 = sub_1AFC71BC8();
            os_log_type_t v57 = sub_1AFC71E18();
            if (os_log_type_enabled(v15, v57))
            {
              uint64_t v58 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v58 = 134217984;
              long long v59 = v58;
              unint64_t v60 = 0;
              switch((int)v50)
              {
                case 1:
                  LODWORD(v6xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = HIDWORD(v51) - v51;
                  if (__OFSUB__(HIDWORD(v51), v51)) {
                    goto LABEL_77;
                  }
                  unint64_t v60 = (int)v60;
LABEL_65:
                  v69[0] = (id)v60;
                  sub_1AFC71EA8();
                  sub_1AFC57D94(v51, v43);
                  _os_log_impl(&dword_1AFB53000, v15, v57, "Failed to read first frame- data wrong length: %ld", v59, 0xCu);
                  MEMORY[0x1B3E8AA80](v59, -1, -1);

                  sub_1AFC57D94(v51, v43);
                  break;
                case 2:
                  uint64_t v67 = *(void *)(v51 + 16);
                  uint64_t v66 = *(void *)(v51 + 24);
                  BOOL v23 = __OFSUB__(v66, v67);
                  unint64_t v60 = v66 - v67;
                  if (!v23) {
                    goto LABEL_65;
                  }
                  goto LABEL_78;
                case 3:
                  goto LABEL_65;
                default:
                  unint64_t v60 = BYTE6(v43);
                  goto LABEL_65;
              }
              goto LABEL_43;
            }
            sub_1AFC57D94(v51, v43);
            sub_1AFC57D94(v19, v13);

            uint64_t v34 = v51;
            unint64_t v35 = v43;
            goto LABEL_29;
          }
LABEL_51:
          v69[0] = 0;
          if (objc_msgSend(v8, sel_closeAndReturnError_, v69))
          {
            id v55 = v69[0];
          }
          else
          {
            id v61 = v69[0];
            long long v62 = (void *)sub_1AFC71A88();

            swift_willThrow();
          }
          id v63 = objc_msgSend(self, sel_defaultManager);
          sub_1AFC71AB8();
          long long v64 = (void *)sub_1AFC71CF8();
          swift_bridgeObjectRelease();
          long long v65 = (void *)sub_1AFC71AD8();
          id v11 = objc_msgSend(v63, sel_createFileAtPath_contents_attributes_, v64, v65, 0);

          sub_1AFC57D94(v51, v43);
          sub_1AFC57D94(v19, v13);

          return v11;
        case 2uLL:
          uint64_t v54 = *(void *)(v41 + 16);
          uint64_t v53 = *(void *)(v41 + 24);
          BOOL v23 = __OFSUB__(v53, v54);
          uint64_t v52 = v53 - v54;
          if (!v23) {
            goto LABEL_50;
          }
          goto LABEL_76;
        case 3uLL:
          if (v24) {
            goto LABEL_54;
          }
          goto LABEL_51;
        default:
          uint64_t v52 = BYTE6(v42);
          goto LABEL_50;
      }
    case 2uLL:
      uint64_t v22 = *(void *)(v9 + 16);
      uint64_t v21 = *(void *)(v9 + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_16;
      }
      goto LABEL_68;
    case 3uLL:
      goto LABEL_23;
    default:
      uint64_t v20 = BYTE6(v10);
      goto LABEL_16;
  }
}

char *sub_1AFC57AB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AFC5683C(&qword_1E9AF7578);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (char *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1AFC57E8C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1AFC57BB4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_1AFC5683C(&qword_1E9AF7570);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      unint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1AFC5858C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1AFC57CC4()
{
  unint64_t result = qword_1E9AF7D10;
  if (!qword_1E9AF7D10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9AF7D10);
  }
  return result;
}

uint64_t sub_1AFC57D04(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1AFC57D3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1AFC57D94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1AFC57DA8(a1, a2);
  }
  return a1;
}

uint64_t sub_1AFC57DA8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t *sub_1AFC57E00(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

char *sub_1AFC57E64(uint64_t a1)
{
  return sub_1AFC57AB8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_1AFC57E78(void *a1)
{
  return sub_1AFC57BB4(0, a1[2], 0, a1);
}

char *sub_1AFC57E8C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_1AFC71F58();
  __break(1u);
  return result;
}

unint64_t sub_1AFC57F74(uint64_t a1)
{
  uint64_t v2 = sub_1AFC56990((uint64_t)&unk_1F084D7B8);
  if (qword_1E9AF78B0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1AFC71BE8();
  uint64_t v4 = sub_1AFC57D04(v3, (uint64_t)qword_1E9AF8410);
  uint64_t v5 = sub_1AFC71AC8();
  uint64_t v32 = &v27;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790]();
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v33 = a1;
  int v31 = v8;
  v8((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  uint64_t v30 = v4;
  uint64_t v9 = sub_1AFC71BC8();
  os_log_type_t v10 = sub_1AFC71DF8();
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v35 = v28;
    uint64_t v29 = v2;
    *(_DWORD *)int64_t v11 = 136315138;
    uint64_t v27 = v11 + 4;
    sub_1AFC58540((unint64_t *)&qword_1E9AF7D20, MEMORY[0x1F418B860]);
    uint64_t v12 = sub_1AFC71F68();
    uint64_t v34 = sub_1AFC5A438(v12, v13, &v35);
    uint64_t v2 = v29;
    sub_1AFC71EA8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    _os_log_impl(&dword_1AFB53000, v9, v10, "Opening source file: %s", v11, 0xCu);
    uint64_t v14 = v28;
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v14, -1, -1);
    MEMORY[0x1B3E8AA80](v11, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  }

  sub_1AFC57CC4();
  MEMORY[0x1F4188790]();
  v31((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v5);
  id v15 = sub_1AFC56A4C((uint64_t)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t result = sub_1AFC71DE8();
  uint64_t v18 = result;
  if (result < 4)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_1AFC71BC8();
    os_log_type_t v20 = sub_1AFC71E18();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 134217984;
      uint64_t v35 = v18;
      sub_1AFC71EA8();
      _os_log_impl(&dword_1AFB53000, v19, v20, "File too small: %llu", v21, 0xCu);
      MEMORY[0x1B3E8AA80](v21, -1, -1);
    }

    char v17 = 0;
    return v17 & 1;
  }
  unint64_t v22 = *(void *)(v2 + 16);
  if (result >= v22)
  {
    objc_msgSend(v15, sel_seekToFileOffset_, result - v22);
    id v23 = objc_msgSend(v15, sel_readDataOfLength_, v22);
    uint64_t v24 = sub_1AFC71AE8();
    unint64_t v26 = v25;

    objc_msgSend(v15, sel_closeFile);
    char v17 = sub_1AFC56BA4(v2, v24, v26);
    swift_bridgeObjectRelease();

    sub_1AFC57DA8(v24, v26);
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AFC58540(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AFC5858C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1AFC71F58();
  __break(1u);
  return result;
}

uint64_t sub_1AFC58680()
{
  uint64_t v0 = sub_1AFC71BE8();
  sub_1AFC57E00(v0, qword_1E9AF7D30);
  sub_1AFC57D04(v0, (uint64_t)qword_1E9AF7D30);
  sub_1AFC71BB8();
  return sub_1AFC71BD8();
}

void sub_1AFC586EC()
{
  id v1 = objc_msgSend(self, sel_serviceListener);
  objc_msgSend(v1, sel_setDelegate_, v0);
  objc_msgSend(v1, sel_resume);
}

id MessagesPersistenceServiceListener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id MessagesPersistenceServiceListener.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MessagesPersistenceServiceListener()
{
  return self;
}

id MessagesPersistenceServiceListener.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall MessagesPersistenceServiceListener.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_1AFC58FBC(shouldAcceptNewConnection.super.isa);
}

uint64_t MessagesPersistenceServiceListener.unlockedProxyForConnection(_:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1AFC58A54;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AFC58EB8;
  aBlock[3] = &unk_1F084D200;
  id v1 = _Block_copy(aBlock);
  objc_msgSend(v0, sel_initWithProtocol_forwardingHandler_, &unk_1F086FAF8, v1);
  _Block_release(v1);
  swift_release();
  return swift_dynamicCastObjCProtocolUnconditional();
}

void sub_1AFC58A54(const char *a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9AF78B8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1AFC71BE8();
  sub_1AFC57D04(v6, (uint64_t)qword_1E9AF7D30);
  uint64_t v7 = sub_1AFC71BC8();
  os_log_type_t v8 = sub_1AFC71E08();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v19 = a3;
    uint64_t v9 = a2;
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    uint64_t v12 = NSStringFromSelector(a1);
    uint64_t v13 = sub_1AFC71D08();
    unint64_t v15 = v14;

    uint64_t v16 = v13;
    a2 = v9;
    a3 = v19;
    sub_1AFC5A438(v16, v15, aBlock);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AFB53000, v7, v8, "Receiving message in persistence %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v11, -1, -1);
    MEMORY[0x1B3E8AA80](v10, -1, -1);
  }

  char v17 = (void *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  uint8_t v17[4] = a3;
  aBlock[4] = (uint64_t)sub_1AFC59358;
  aBlock[5] = (uint64_t)v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1AFC5BC90;
  aBlock[3] = (uint64_t)&unk_1F084C8F0;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  IMDPersistencePerformBlock(v18, 1);
  _Block_release(v18);
}

uint64_t sub_1AFC58CBC(const char *a1, void (*a2)(void))
{
  if (qword_1E9AF78B8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1AFC71BE8();
  sub_1AFC57D04(v4, (uint64_t)qword_1E9AF7D30);
  unint64_t v5 = sub_1AFC71BC8();
  os_log_type_t v6 = sub_1AFC71DF8();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v16 = a2;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    v17[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = NSStringFromSelector(a1);
    uint64_t v10 = sub_1AFC71D08();
    unint64_t v12 = v11;

    sub_1AFC5A438(v10, v12, v17);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AFB53000, v5, v6, "Processing message for persistence %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v8, -1, -1);
    uint64_t v13 = v7;
    a2 = v16;
    MEMORY[0x1B3E8AA80](v13, -1, -1);
  }

  id v14 = objc_msgSend(self, sel_synchronousDatabase);
  v17[3] = swift_getObjectType();
  v17[0] = (uint64_t)v14;
  a2(v17);
  return sub_1AFC59364((uint64_t)v17);
}

uint64_t sub_1AFC58EB8(uint64_t a1, uint64_t a2, void *aBlock)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t (*)(void *), uint64_t))(a1 + 32);
  unint64_t v5 = _Block_copy(aBlock);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  v4(a2, sub_1AFC592D4, v6);
  swift_release();
  return swift_release();
}

uint64_t sub_1AFC58F5C(void *a1, uint64_t a2)
{
  sub_1AFC592DC(a1, a1[3]);
  uint64_t v3 = sub_1AFC71F78();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_1AFC58FBC(void *a1)
{
  if (qword_1E9AF78B8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AFC71BE8();
  sub_1AFC57D04(v2, (uint64_t)qword_1E9AF7D30);
  id v3 = a1;
  uint64_t v4 = sub_1AFC71BC8();
  os_log_type_t v5 = sub_1AFC71DF8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    LODWORD(aBlock[0]) = objc_msgSend(v3, sel_processIdentifier);
    sub_1AFC71EA8();

    _os_log_impl(&dword_1AFB53000, v4, v5, "Accepting connection from PID %d", v6, 8u);
    MEMORY[0x1B3E8AA80](v6, -1, -1);
  }
  else
  {
  }
  id v7 = objc_allocWithZone(MEMORY[0x1E4F6E7E8]);
  aBlock[4] = sub_1AFC58A54;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AFC58EB8;
  aBlock[3] = &unk_1F084C828;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = objc_msgSend(v7, sel_initWithProtocol_forwardingHandler_, &unk_1F086FAF8, v8);
  _Block_release(v8);
  swift_release();
  objc_msgSend(v3, sel_setExportedObject_, swift_dynamicCastObjCProtocolUnconditional());

  id v10 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F086FAF8);
  objc_msgSend(v3, sel_setExportedInterface_, v10);

  objc_msgSend(v3, sel_resume);
  return 1;
}

uint64_t sub_1AFC59238(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v2;
  return swift_retain();
}

uint64_t sub_1AFC59248()
{
  return swift_release();
}

uint64_t method lookup function for MessagesPersistenceServiceListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessagesPersistenceServiceListener);
}

uint64_t dispatch thunk of MessagesPersistenceServiceListener.resume()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x50))();
}

uint64_t sub_1AFC5929C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1AFC592D4(void *a1)
{
  return sub_1AFC58F5C(a1, *(void *)(v1 + 16));
}

void *sub_1AFC592DC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1AFC59320()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1AFC59358()
{
  return sub_1AFC58CBC(*(const char **)(v0 + 16), *(void (**)(void))(v0 + 24));
}

uint64_t sub_1AFC59364(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1AFC593C4()
{
  uint64_t v0 = sub_1AFC71BE8();
  sub_1AFC57E00(v0, qword_1E9AF7DB0);
  sub_1AFC57D04(v0, (uint64_t)qword_1E9AF7DB0);
  sub_1AFC71BB8();
  return sub_1AFC71BD8();
}

id AskToParser.__allocating_init(url:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return AskToParser.init(url:)(a1);
}

id AskToParser.init(url:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1AFC71CB8();
  uint64_t v20 = *(void *)(v3 - 8);
  uint64_t v21 = v3;
  MEMORY[0x1F4188790](v3);
  os_log_type_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1;
  sub_1AFC71CA8();
  sub_1AFC59B3C(a1, (uint64_t)&v6[OBJC_IVAR___IMDAskToParser_url]);
  uint64_t v7 = sub_1AFC71AC8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = sub_1AFC5683C(&qword_1E9AF7DD0);
  MEMORY[0x1F4188790](v10 - 8);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFC59B3C(a1, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7) == 1)
  {
    sub_1AFC59BA4((uint64_t)v12);
    if (qword_1E9AF78C0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1AFC71BE8();
    sub_1AFC57D04(v13, (uint64_t)qword_1E9AF7DB0);
    id v14 = sub_1AFC71BC8();
    os_log_type_t v15 = sub_1AFC71E18();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1AFB53000, v14, v15, "Provided payload URL was nil", v16, 2u);
      MEMORY[0x1B3E8AA80](v16, -1, -1);
    }

    *(void *)&v6[OBJC_IVAR___IMDAskToParser_payload] = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v7);
    sub_1AFC71CA8();
    sub_1AFC71CD8();
    sub_1AFC5A3F4(&qword_1E9AF7DD8);
    sub_1AFC5A3F4(&qword_1E9AF7DE0);
    sub_1AFC71C88();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v21);
    (*(void (**)(char *, uint64_t))(v8 + 8))((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    *(void *)&v6[OBJC_IVAR___IMDAskToParser_payload] = v23;
  }

  v24.receiver = v6;
  v24.super_class = ObjectType;
  id v17 = objc_msgSendSuper2(&v24, sel_init);
  sub_1AFC59BA4(a1);
  return v17;
}

uint64_t sub_1AFC59B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC5683C(&qword_1E9AF7DD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AFC59BA4(uint64_t a1)
{
  uint64_t v2 = sub_1AFC5683C(&qword_1E9AF7DD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AskToParser.isValid.getter()
{
  uint64_t v1 = sub_1AFC71AC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR___IMDAskToParser_url;
  uint64_t v6 = sub_1AFC5683C(&qword_1E9AF7DD0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFC59B3C(v5, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) == 1)
  {
    sub_1AFC59BA4((uint64_t)v8);
    char v9 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    char v9 = sub_1AFC71C98();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v9 & 1;
}

uint64_t AskToParser.notificationText.getter()
{
  if (!*(void *)(v0 + OBJC_IVAR___IMDAskToParser_payload)) {
    return 0;
  }
  uint64_t v1 = (void *)sub_1AFC71CC8();
  uint64_t v2 = sub_1AFC71BF8();

  return v2;
}

uint64_t AskToParser.summary.getter()
{
  return sub_1AFC5A230(MEMORY[0x1E4F4E208]);
}

id sub_1AFC5A184(char *a1, uint64_t a2, void (*a3)(void))
{
  if (*(void *)&a1[OBJC_IVAR___IMDAskToParser_payload])
  {
    uint64_t v4 = a1;
    uint64_t v5 = (void *)sub_1AFC71CC8();
    a3();

    uint64_t v6 = (void *)sub_1AFC71CF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

uint64_t AskToParser.questionIdentifier.getter()
{
  return sub_1AFC5A230(MEMORY[0x1E4F4E200]);
}

uint64_t sub_1AFC5A230(uint64_t (*a1)(void))
{
  if (!*(void *)(v1 + OBJC_IVAR___IMDAskToParser_payload)) {
    return 0;
  }
  uint64_t v3 = (void *)sub_1AFC71CC8();
  uint64_t v4 = a1();

  return v4;
}

id AskToParser.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AskToParser.init()()
{
}

id AskToParser.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AFC5A3F4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AFC71CD8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AFC5A438(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1AFC5A50C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1AFC5AC88((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1AFC5AC88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1AFC59364((uint64_t)v12);
  return v7;
}

uint64_t sub_1AFC5A50C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1AFC71EB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1AFC5A6C8(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1AFC71F18();
  if (!v8)
  {
    sub_1AFC71F28();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1AFC71F58();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1AFC5A6C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1AFC5A760(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1AFC5A940(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1AFC5A940(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1AFC5A760(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1AFC5A8D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1AFC71EE8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1AFC71F28();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1AFC71D48();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1AFC71F58();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1AFC71F28();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1AFC5A8D8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1AFC5683C(&qword_1E9AF7578);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1AFC5A940(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_1AFC5683C(&qword_1E9AF7578);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1AFC71F58();
  __break(1u);
  return result;
}

unint64_t sub_1AFC5AA90()
{
  unint64_t result = qword_1E9AF7D20;
  if (!qword_1E9AF7D20)
  {
    sub_1AFC71AC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7D20);
  }
  return result;
}

uint64_t sub_1AFC5AADC()
{
  return type metadata accessor for AskToParser();
}

uint64_t type metadata accessor for AskToParser()
{
  uint64_t result = qword_1E9AF7DE8;
  if (!qword_1E9AF7DE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1AFC5AB30()
{
  sub_1AFC71CB8();
  if (v0 <= 0x3F)
  {
    sub_1AFC5AC30();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AskToParser(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AskToParser);
}

uint64_t dispatch thunk of AskToParser.__allocating_init(url:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void sub_1AFC5AC30()
{
  if (!qword_1E9AF7DF8)
  {
    sub_1AFC71AC8();
    unint64_t v0 = sub_1AFC71E88();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9AF7DF8);
    }
  }
}

uint64_t sub_1AFC5AC88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1AFC5ACE4()
{
  uint64_t v0 = sub_1AFC71BE8();
  sub_1AFC57E00(v0, qword_1E9AF7E00);
  sub_1AFC57D04(v0, (uint64_t)qword_1E9AF7E00);
  sub_1AFC71BB8();
  return sub_1AFC71BD8();
}

id sub_1AFC5AD50()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MessagesPersistenceServiceClient()), sel_init);
  qword_1E9AF7E18 = (uint64_t)result;
  return result;
}

id MessagesPersistenceServiceClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id static MessagesPersistenceServiceClient.shared.getter()
{
  if (qword_1E9AF78D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (void *)qword_1E9AF7E18;
  return v0;
}

void static MessagesPersistenceServiceClient.shared.setter(uint64_t a1)
{
  if (qword_1E9AF78D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_1E9AF7E18;
  qword_1E9AF7E18 = a1;
}

uint64_t (*static MessagesPersistenceServiceClient.shared.modify())()
{
  if (qword_1E9AF78D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

id MessagesPersistenceServiceClient.init()()
{
  uint64_t v1 = OBJC_IVAR___IMDPersistenceServiceClient_queue;
  sub_1AFC5B274();
  uint64_t v2 = sub_1AFC71C48();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = v0;
  sub_1AFC71C28();
  uint64_t v4 = sub_1AFC71E28();
  MEMORY[0x1F4188790](v4);
  uint64_t v12 = MEMORY[0x1E4FBC860];
  sub_1AFC5B2B4();
  sub_1AFC5683C(&qword_1E9AF7548);
  sub_1AFC5B300();
  sub_1AFC71ED8();
  uint64_t v5 = sub_1AFC71E48();
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, void))(v7 + 104))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FBCC50]);
  *(void *)&v0[v1] = sub_1AFC71E68();
  *(void *)&v3[OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection] = 0;

  int64_t v8 = (objc_class *)type metadata accessor for MessagesPersistenceServiceClient();
  v11.receiver = v3;
  v11.super_class = v8;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t sub_1AFC5B274()
{
  unint64_t result = qword_1E9AF7568;
  if (!qword_1E9AF7568)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9AF7568);
  }
  return result;
}

unint64_t sub_1AFC5B2B4()
{
  unint64_t result = qword_1E9AF7560;
  if (!qword_1E9AF7560)
  {
    sub_1AFC71E28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7560);
  }
  return result;
}

unint64_t sub_1AFC5B300()
{
  unint64_t result = qword_1E9AF7550;
  if (!qword_1E9AF7550)
  {
    sub_1AFC568DC(&qword_1E9AF7548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7550);
  }
  return result;
}

uint64_t type metadata accessor for MessagesPersistenceServiceClient()
{
  return self;
}

id MessagesPersistenceServiceClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesPersistenceServiceClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1AFC5B424()
{
  uint64_t v1 = OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection;
  if (!*(void *)(v0 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection))
  {
    uint64_t v2 = v0;
    if (qword_1E9AF78C8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_1AFC71BE8();
    sub_1AFC57D04(v3, (uint64_t)qword_1E9AF7E00);
    uint64_t v4 = sub_1AFC71BC8();
    os_log_type_t v5 = sub_1AFC71DF8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1AFB53000, v4, v5, "Connecting to persistence agent", v6, 2u);
      MEMORY[0x1B3E8AA80](v6, -1, -1);
    }

    id v7 = objc_allocWithZone(MEMORY[0x1E4F29260]);
    int64_t v8 = (void *)sub_1AFC71CF8();
    id v9 = objc_msgSend(v7, sel_initWithServiceName_, v8);

    uint64_t v10 = *(void **)(v2 + v1);
    *(void *)(v2 + v1) = v9;

    objc_super v11 = *(void **)(v2 + v1);
    if (v11)
    {
      uint64_t v12 = self;
      id v13 = v11;
      id v14 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_1F086FAF8);
      objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

      os_log_type_t v15 = *(void **)(v2 + v1);
    }
    else
    {
      os_log_type_t v15 = 0;
    }
    objc_msgSend(v15, sel_resume);
  }
}

uint64_t MessagesPersistenceServiceClient.remoteProxy.getter()
{
  return sub_1AFC5B7B8();
}

uint64_t sub_1AFC5B63C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_1AFC5B424();
  uint64_t result = *(void *)(a1 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection);
  if (!result
    || (id v5 = objc_msgSend((id)result, sel_remoteObjectProxy),
        sub_1AFC71EC8(),
        swift_unknownObjectRelease(),
        sub_1AFC5683C(qword_1E9AF7EA0),
        uint64_t result = swift_dynamicCast(),
        (result & 1) == 0))
  {
    *a2 = 0;
  }
  return result;
}

uint64_t sub_1AFC5B6E8@<X0>(void *a1@<X8>)
{
  return sub_1AFC5B63C(*(void *)(v1 + 16), a1);
}

id sub_1AFC5B71C(void *a1)
{
  id v1 = a1;
  sub_1AFC5683C((uint64_t *)&unk_1E9AF7E90);
  sub_1AFC71E58();

  return v3;
}

uint64_t MessagesPersistenceServiceClient.synchronousRemoteProxy.getter()
{
  return sub_1AFC5B7B8();
}

uint64_t sub_1AFC5B7B8()
{
  sub_1AFC5683C((uint64_t *)&unk_1E9AF7E90);
  sub_1AFC71E58();
  return v1;
}

void sub_1AFC5B824(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_1AFC5B424();
  uint64_t v4 = *(void **)(a1 + OBJC_IVAR___IMDPersistenceServiceClient_unlockedConnection);
  if (!v4) {
    goto LABEL_3;
  }
  v8[4] = sub_1AFC5B98C;
  v8[5] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1AFC5BB80;
  v8[3] = &unk_1F084D228;
  id v5 = _Block_copy(v8);
  id v6 = v4;
  id v7 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v5);
  _Block_release(v5);

  sub_1AFC71EC8();
  swift_unknownObjectRelease();
  sub_1AFC5683C(qword_1E9AF7EA0);
  if ((swift_dynamicCast() & 1) == 0) {
LABEL_3:
  }
    *a2 = 0;
}

void sub_1AFC5B958(void *a1@<X8>)
{
  sub_1AFC5B824(*(void *)(v1 + 16), a1);
}

uint64_t method lookup function for MessagesPersistenceServiceClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessagesPersistenceServiceClient);
}

void sub_1AFC5B98C(void *a1)
{
  if (qword_1E9AF78C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AFC71BE8();
  sub_1AFC57D04(v2, (uint64_t)qword_1E9AF7E00);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_1AFC71BC8();
  os_log_type_t v5 = sub_1AFC71E18();
  if (os_log_type_enabled(oslog, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)id v6 = 136315138;
    swift_getErrorValue();
    uint64_t v8 = sub_1AFC71F98();
    sub_1AFC5A438(v8, v9, &v11);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1AFB53000, oslog, v5, "Received error for synchronous proxy to persistence agent: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v7, -1, -1);
    MEMORY[0x1B3E8AA80](v6, -1, -1);
  }
  else
  {
  }
}

void sub_1AFC5BB80(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1AFC5BBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v2;
  return swift_retain();
}

uint64_t sub_1AFC5BBF8()
{
  return swift_release();
}

void sub_1AFC5BC00(void *a1@<X8>)
{
}

uint64_t sub_1AFC5BC18@<X0>(void *a1@<X8>)
{
  return sub_1AFC5B6E8(a1);
}

void *IMDMessageRecord.makeIMItem(inputHandleString:useAttachmentCache:shouldLoadAttachments:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  if (a2) {
    uint64_t v7 = (void *)sub_1AFC71CF8();
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = IMDCreateIMItemFromIMDMessageRecord(v4, v7, a3 & 1, a4 & 1);

  return v8;
}

uint64_t sub_1AFC5BC94()
{
  sub_1AFC60C94(0, (unint64_t *)&qword_1E9AF7568);
  uint64_t v0 = sub_1AFC71C48();
  MEMORY[0x1F4188790](v0 - 8);
  sub_1AFC71C38();
  uint64_t v1 = sub_1AFC71E28();
  MEMORY[0x1F4188790](v1);
  v6[1] = MEMORY[0x1E4FBC860];
  sub_1AFC60CD0((unint64_t *)&qword_1E9AF7560, MEMORY[0x1F41AB0F0]);
  sub_1AFC5683C(&qword_1E9AF7548);
  sub_1AFC60D18((unint64_t *)&qword_1E9AF7550, &qword_1E9AF7548);
  sub_1AFC71ED8();
  uint64_t v2 = sub_1AFC71E48();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, void))(v4 + 104))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4FBCC50]);
  uint64_t result = sub_1AFC71E68();
  qword_1E9AF7520 = result;
  return result;
}

id SpotlightReindexer.__allocating_init(handles:batchDeferralTime:messageAge:index:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_1AFC60214(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id SpotlightReindexer.init(handles:batchDeferralTime:messageAge:index:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = sub_1AFC60214(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

Swift::Void __swiftcall SpotlightReindexer.reindex()()
{
  uint64_t v1 = v0;
  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
    goto LABEL_17;
  }
  if (*(void *)(*(void *)&v0[OBJC_IVAR___IMDCoreSpotlightReindexer_handles] + 16))
  {
    if (qword_1E9AF74F0 == -1)
    {
LABEL_4:
      uint64_t v2 = sub_1AFC71BE8();
      sub_1AFC57D04(v2, (uint64_t)qword_1E9AF83E0);
      id v3 = sub_1AFC71BC8();
      os_log_type_t v4 = sub_1AFC71DF8();
      if (os_log_type_enabled(v3, v4))
      {
        os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v5 = 134217984;
        aBlock[0] = 10;
        sub_1AFC71EA8();
        _os_log_impl(&dword_1AFB53000, v3, v4, "Deferring reindexing for %ld seconds.", v5, 0xCu);
        MEMORY[0x1B3E8AA80](v5, -1, -1);
      }

      if (qword_1E9AF7528 != -1) {
        swift_once();
      }
      uint64_t v36 = qword_1E9AF7520;
      uint64_t v6 = sub_1AFC71C68();
      uint64_t v37 = v31;
      uint64_t v34 = v6;
      uint64_t v7 = *(void *)(v6 - 8);
      uint64_t v8 = MEMORY[0x1F4188790](v6);
      uint64_t v32 = v31;
      MEMORY[0x1F4188790](v8);
      uint64_t v10 = (char *)v31 - v9;
      sub_1AFC71C58();
      uint64_t v11 = sub_1AFC71C08();
      uint64_t v12 = *(void *)(v11 - 8);
      MEMORY[0x1F4188790](v11);
      id v14 = (void *)((char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
      *id v14 = 10;
      (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCAE0], v11);
      MEMORY[0x1B3E887F0](v10, v14);
      (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
      os_log_type_t v15 = *(void (**)(void *, uint64_t))(v7 + 8);
      uint64_t v33 = v7 + 8;
      uint64_t v35 = v15;
      v15(v10, v6);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v1;
      aBlock[4] = sub_1AFC60464;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1AFC5BC90;
      aBlock[3] = &unk_1F084D250;
      id v17 = _Block_copy(aBlock);
      uint64_t v18 = sub_1AFC71C48();
      v31[2] = v31;
      uint64_t v19 = *(void *)(v18 - 8);
      MEMORY[0x1F4188790](v18);
      uint64_t v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      id v22 = v1;
      sub_1AFC71C28();
      uint64_t v23 = sub_1AFC71C18();
      v31[1] = v31;
      uint64_t v24 = *(void *)(v23 - 8);
      MEMORY[0x1F4188790](v23);
      unint64_t v26 = (char *)v31 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v38 = MEMORY[0x1E4FBC860];
      sub_1AFC60CD0(&qword_1E9AF7530, MEMORY[0x1F41AAEB0]);
      sub_1AFC5683C(&qword_1E9AF7538);
      sub_1AFC60D18(&qword_1E9AF7540, &qword_1E9AF7538);
      sub_1AFC71ED8();
      uint64_t v27 = v32;
      MEMORY[0x1B3E889B0](v32, v21, v26, v17);
      _Block_release(v17);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      v35(v27, v34);
      swift_release();
      return;
    }
LABEL_17:
    swift_once();
    goto LABEL_4;
  }
  if (qword_1E9AF74F0 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1AFC71BE8();
  sub_1AFC57D04(v28, (uint64_t)qword_1E9AF83E0);
  uint64_t v37 = sub_1AFC71BC8();
  os_log_type_t v29 = sub_1AFC71E18();
  if (os_log_type_enabled(v37, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_1AFB53000, v37, v29, "No handles to update Core Spotlight indexes for", v30, 2u);
    MEMORY[0x1B3E8AA80](v30, -1, -1);
  }
}

uint64_t sub_1AFC5C698(void *a1)
{
  if (qword_1E9AF74F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1AFC71BE8();
  sub_1AFC57D04(v2, (uint64_t)qword_1E9AF83E0);
  id v3 = a1;
  os_log_type_t v4 = sub_1AFC71BC8();
  os_log_type_t v5 = sub_1AFC71DF8();
  unint64_t v6 = 0x1E9AF7000uLL;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    v27[0] = v8;
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x1B3E88910](v9, MEMORY[0x1E4FBB1A0]);
    unint64_t v12 = v11;
    unint64_t v6 = 0x1E9AF7000;
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_1AFC5A438(v10, v12, v27);
    sub_1AFC71EA8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AFB53000, v4, v5, "Finding chats to re-index with CoreSpotlight for handles: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v8, -1, -1);
    MEMORY[0x1B3E8AA80](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v13 = MEMORY[0x1E4FBC860];
  uint64_t v28 = MEMORY[0x1E4FBC860];
  uint64_t v14 = *(void *)&v3[*(void *)(v6 + 1256)];
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = (unint64_t *)(v14 + 40);
    do
    {
      uint64_t v17 = *(v16 - 1);
      unint64_t v18 = *v16;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1AFC60650(v17, v18, 5459283, 0xE300000000000000);
      sub_1AFC5CA50(v19);
      uint64_t v20 = sub_1AFC60650(v17, v18, 0x6567617373654D69, 0xE800000000000000);
      swift_bridgeObjectRelease();
      sub_1AFC5CA50(v20);
      v16 += 2;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v13 = v28;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_1AFC71BC8();
  os_log_type_t v22 = sub_1AFC71DF8();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 134217984;
    v27[0] = *(void *)(v13 + 16);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AFB53000, v21, v22, "Computed %ld chats to update CoreSpotlight indexes for.", v23, 0xCu);
    MEMORY[0x1B3E8AA80](v23, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v24 = (void *)v28;
  if (*(void *)(v28 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)sub_1AFC71D58();
    swift_bridgeObjectRelease();
    IMDCoreSpotlightAddChatGUIDs(v25, 1008);

    sub_1AFC5CD74(v24, &v3[OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge]);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AFC5CA50(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  id v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  id v3 = sub_1AFC57BB4(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1AFC71F58();
  __break(1u);
  return result;
}

uint64_t sub_1AFC5CBA8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1B3E88A80](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_1AFC5FEA8(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return MEMORY[0x1F4183E98](v10);
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x1xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v14;
  }
  uint64_t v10 = swift_bridgeObjectRelease();
  return MEMORY[0x1F4183E98](v10);
}

void sub_1AFC5CD74(void *a1, NSObject *a2)
{
  unint64_t v4 = v2;
  os_log_t v65 = a2;
  uint64_t v6 = sub_1AFC71BE8();
  uint64_t v7 = *(void **)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
LABEL_23:
    a1 = sub_1AFC57E78(a1);
LABEL_4:
    sub_1AFC60C94(0, &qword_1E9AF7EC0);
    uint64_t v10 = a1[2];
    if (v10)
    {
      long long v64 = v7;
      uint64_t v11 = v10 - 1;
      uint64_t v12 = &a1[2 * v11];
      uint64_t v13 = v12[4];
      uint64_t v14 = v12[5];
      a1[2] = v11;
      uint64_t v15 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
      uint64_t v3 = *(void *)(*(void *)(v15 - 8) + 64);
      MEMORY[0x1F4188790](v15);
      long long v62 = (unsigned __int8 *)v17;
      id v63 = v16;
      unint64_t v60 = (void (*)(char *, os_log_t))v17[2];
      id v61 = v17 + 2;
      v60((char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v65);
      uint64_t v7 = sub_1AFC5D72C(v13, v14, (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
      if (qword_1E9AF74F0 == -1)
      {
LABEL_6:
        uint64_t v18 = sub_1AFC57D04(v6, (uint64_t)qword_1E9AF83E0);
        uint64_t v19 = v64;
        ((void (*)(char *, uint64_t, uint64_t))v64[2])(v9, v18, v6);
        uint64_t v20 = v7;
        uint64_t v21 = sub_1AFC71BC8();
        os_log_type_t v22 = sub_1AFC71DF8();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v59 = (uint64_t)v4;
          uint64_t v23 = (uint8_t *)swift_slowAlloc();
          os_log_type_t v57 = (void (*)(void, void))swift_slowAlloc();
          aBlock[0] = (uint64_t)v57;
          *(_DWORD *)uint64_t v23 = 136315138;
          uint64_t v58 = v20;
          id v24 = objc_msgSend(v20, sel_associatedChatGUID);
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = sub_1AFC71D08();
            unint64_t v28 = v27;
          }
          else
          {
            unint64_t v28 = 0xE300000000000000;
            uint64_t v26 = 7104878;
          }
          uint64_t v66 = sub_1AFC5A438(v26, v28, aBlock);
          sub_1AFC71EA8();
          uint64_t v20 = v58;

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1AFB53000, v21, v22, "Queuing up first chat reindex: %s", v23, 0xCu);
          uint64_t v32 = v57;
          swift_arrayDestroy();
          MEMORY[0x1B3E8AA80](v32, -1, -1);
          MEMORY[0x1B3E8AA80](v23, -1, -1);

          ((void (*)(char *, uint64_t))v64[1])(v9, v6);
          unint64_t v4 = (char *)v59;
        }
        else
        {

          ((void (*)(char *, uint64_t))v19[1])(v9, v6);
        }
        if (qword_1E9AF7528 != -1) {
          swift_once();
        }
        uint64_t v59 = qword_1E9AF7520;
        uint64_t v33 = sub_1AFC71C68();
        long long v64 = v55;
        uint64_t v56 = v33;
        uint64_t v34 = *(void *)(v33 - 8);
        uint64_t v35 = MEMORY[0x1F4188790](v33);
        v55[0] = v55;
        MEMORY[0x1F4188790](v35);
        uint64_t v37 = (char *)v55 - v36;
        sub_1AFC71C58();
        MEMORY[0x1B3E887F0](v37, &v4[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime]);
        uint64_t v38 = *(void (**)(void, void))(v34 + 8);
        v55[1] = v34 + 8;
        os_log_type_t v57 = v38;
        uint64_t v39 = ((uint64_t (*)(char *, uint64_t))v38)(v37, v33);
        uint64_t v58 = v55;
        MEMORY[0x1F4188790](v39);
        uint64_t v40 = v63;
        ((void (*)(char *, os_log_t, void *))v60)((char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v65, v63);
        uint64_t v41 = v62;
        unint64_t v42 = (v62[80] + 40) & ~(unint64_t)v62[80];
        unint64_t v43 = (char *)swift_allocObject();
        *((void *)v43 + 2) = v4;
        *((void *)v43 + 3) = v20;
        *((void *)v43 + 4) = a1;
        (*((void (**)(char *, char *, void *))v41 + 4))(&v43[v42], (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v40);
        aBlock[4] = (uint64_t)sub_1AFC609B8;
        aBlock[5] = (uint64_t)v43;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1AFC5BC90;
        aBlock[3] = (uint64_t)&unk_1F084C918;
        uint64_t v44 = _Block_copy(aBlock);
        uint64_t v45 = sub_1AFC71C48();
        os_log_t v65 = (os_log_t)v55;
        uint64_t v46 = *(void *)(v45 - 8);
        MEMORY[0x1F4188790](v45);
        uint64_t v48 = (char *)v55 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
        long long v62 = v20;
        uint64_t v49 = v4;
        sub_1AFC71C28();
        uint64_t v50 = sub_1AFC71C18();
        id v63 = v55;
        uint64_t v51 = *(void *)(v50 - 8);
        MEMORY[0x1F4188790](v50);
        uint64_t v53 = (char *)v55 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v66 = MEMORY[0x1E4FBC860];
        sub_1AFC60CD0(&qword_1E9AF7530, MEMORY[0x1F41AAEB0]);
        sub_1AFC5683C(&qword_1E9AF7538);
        sub_1AFC60D18(&qword_1E9AF7540, &qword_1E9AF7538);
        sub_1AFC71ED8();
        uint64_t v54 = v55[0];
        MEMORY[0x1B3E889B0](v55[0], v48, v53, v44);
        _Block_release(v44);

        (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v50);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v45);
        v57(v54, v56);
        swift_release();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    swift_once();
    goto LABEL_6;
  }
  if (a1[2])
  {
    swift_bridgeObjectRetain();
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  if (qword_1E9AF74F0 != -1) {
    swift_once();
  }
  sub_1AFC57D04(v6, (uint64_t)qword_1E9AF83E0);
  os_log_t v65 = (os_log_t)sub_1AFC71BC8();
  os_log_type_t v29 = sub_1AFC71E18();
  if (os_log_type_enabled(v65, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_1AFB53000, v65, v29, "No chats to reindex recent messages", v30, 2u);
    MEMORY[0x1B3E8AA80](v30, -1, -1);
  }
  os_log_t v31 = v65;
}

uint64_t sub_1AFC5D6A0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_1AFC5D72C(uint64_t a1, uint64_t a2, char *a3)
{
  unint64_t v27 = a3;
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v4 = (void *)sub_1AFC71CF8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithAssociatedChatGUID_, v4);

  uint64_t v6 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = self;
  id v11 = v5;
  id v12 = objc_msgSend(v10, sel_seconds);
  sub_1AFC71A38();

  sub_1AFC71A28();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v9, v6);
  uint64_t v26 = sub_1AFC60C94(0, &qword_1E9AF7EF0);
  sub_1AFC5683C(&qword_1E9AF7EF8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1AFC784C0;
  uint64_t v15 = sub_1AFC71D08();
  uint64_t v17 = v16;
  *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v14 + 64) = sub_1AFC60B90();
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v17;
  uint64_t v18 = sub_1AFC71B58();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = v11;
  sub_1AFC71B38();
  uint64_t v23 = sub_1AFC71B28();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  *(void *)(v14 + 96) = sub_1AFC60C94(0, &qword_1E9AF7F08);
  *(void *)(v14 + 104) = sub_1AFC60BD8();
  *(void *)(v14 + 72) = v23;
  id v24 = (void *)sub_1AFC71DC8();
  objc_msgSend(v22, sel_setPredicate_, v24);

  objc_msgSend(v22, sel_setBatchSize_, 300);
  v13(v27, v6);
  return v22;
}

void sub_1AFC5DA7C(void *a1, uint64_t *a2, uint64_t *a3)
{
  v172 = a3;
  v176 = a2;
  uint64_t v4 = sub_1AFC71BE8();
  id v5 = *(void **)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  v167 = (NSObject **)((char *)&v165 - v10);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v171 = (char *)&v165 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = ((char *)&v165 - v14);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v165 - v16;
  if (qword_1E9AF74F0 != -1) {
    swift_once();
  }
  v166 = (uint64_t *)v8;
  uint64_t v18 = sub_1AFC57D04(v4, (uint64_t)qword_1E9AF83E0);
  v177 = (uint64_t *)v5[2];
  v178 = v5 + 2;
  ((void (*)(char *, uint64_t, uint64_t))v177)(v17, v18, v4);
  uint64_t v19 = a1;
  uint64_t v20 = sub_1AFC71BC8();
  os_log_type_t v21 = sub_1AFC71DF8();
  BOOL v22 = os_log_type_enabled(v20, v21);
  v173 = v5;
  v174 = (uint64_t *)v4;
  v175 = (uint64_t *)v18;
  v170 = v15;
  if (v22)
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    aBlock = (void *)v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    id v25 = objc_msgSend(v19, sel_associatedChatGUID);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = sub_1AFC71D08();
      unint64_t v29 = v28;
    }
    else
    {
      unint64_t v29 = 0xE300000000000000;
      uint64_t v27 = 7104878;
    }
    uint64_t v179 = sub_1AFC5A438(v27, v29, (uint64_t *)&aBlock);
    sub_1AFC71EA8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AFB53000, v20, v21, "Fetching batch of messages to reindex for %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v24, -1, -1);
    MEMORY[0x1B3E8AA80](v23, -1, -1);

    id v5 = v173;
    uint64_t v4 = (uint64_t)v174;
    uint64_t v30 = (uint64_t *)v173[1];
    ((void (*)(char *, uint64_t *))v30)(v17, v174);
    uint64_t v18 = (uint64_t)v175;
  }
  else
  {

    uint64_t v30 = (uint64_t *)v5[1];
    ((void (*)(char *, uint64_t))v30)(v17, v4);
  }
  unint64_t v31 = (unint64_t)sub_1AFC5F1B4();
  unint64_t v32 = v31;
  unint64_t v33 = v31 >> 62;
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v100 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
    if (v100) {
      goto LABEL_11;
    }
  }
  else if (*(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    uint64_t v34 = v170;
    ((void (*)(NSObject *, uint64_t, uint64_t))v177)(v170, v18, v4);
    uint64_t v35 = v19;
    swift_bridgeObjectRetain_n();
    uint64_t v36 = v35;
    uint64_t v37 = sub_1AFC71BC8();
    os_log_type_t v38 = sub_1AFC71DF8();
    BOOL v39 = os_log_type_enabled(v37, v38);
    v168 = v30;
    if (v39)
    {
      v167 = v36;
      uint64_t v40 = swift_slowAlloc();
      v166 = (uint64_t *)swift_slowAlloc();
      aBlock = v166;
      *(_DWORD *)uint64_t v40 = 134218242;
      if (v33)
      {
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_1AFC71F38();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v41 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      uint64_t v179 = v41;
      sub_1AFC71EA8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      id v44 = objc_msgSend(v167, sel_associatedChatGUID);
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = sub_1AFC71D08();
        unint64_t v48 = v47;
      }
      else
      {
        unint64_t v48 = 0xE300000000000000;
        uint64_t v46 = 7104878;
      }
      uint64_t v179 = sub_1AFC5A438(v46, v48, (uint64_t *)&aBlock);
      sub_1AFC71EA8();
      uint64_t v49 = v167;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AFB53000, v37, v38, "Kicking off indexing of %ld searchable items for chat with GUID %s", (uint8_t *)v40, 0x16u);
      uint64_t v50 = v166;
      swift_arrayDestroy();
      MEMORY[0x1B3E8AA80](v50, -1, -1);
      uint64_t v51 = v40;
      uint64_t v36 = v49;
      MEMORY[0x1B3E8AA80](v51, -1, -1);

      uint64_t v4 = (uint64_t)v174;
      unint64_t v42 = v170;
      unint64_t v43 = v174;
      uint64_t v30 = v168;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      unint64_t v42 = v34;
      unint64_t v43 = (void *)v4;
    }
    ((void (*)(NSObject *, void *))v30)(v42, v43);
    sub_1AFC60C94(0, &qword_1E9AF7EC8);
    uint64_t v52 = (void *)sub_1AFC71D58();
    swift_bridgeObjectRelease();
    sub_1AFC60C94(0, &qword_1E9AF7ED0);
    uint64_t v53 = (void *)sub_1AFC71D58();
    swift_bridgeObjectRelease();
    uint64_t v54 = v169;
    IMDCoreSpotlightIndexSearchableItemsAsync(v52, v53, 1008, *(void **)&v169[OBJC_IVAR___IMDCoreSpotlightReindexer_index]);

    id v55 = v171;
    ((void (*)(char *, uint64_t *, uint64_t))v177)(v171, v175, v4);
    uint64_t v56 = v36;
    id v57 = v54;
    uint64_t v58 = v56;
    uint64_t v59 = (char *)v57;
    unint64_t v60 = sub_1AFC71BC8();
    int v61 = sub_1AFC71DF8();
    if (os_log_type_enabled(v60, (os_log_type_t)v61))
    {
      LODWORD(v178) = v61;
      uint64_t v62 = swift_slowAlloc();
      v177 = (uint64_t *)swift_slowAlloc();
      aBlock = v177;
      *(_DWORD *)uint64_t v62 = 136315394;
      id v63 = objc_msgSend(v58, sel_associatedChatGUID);
      if (v63)
      {
        long long v64 = v63;
        uint64_t v65 = sub_1AFC71D08();
        unint64_t v67 = v66;
      }
      else
      {
        unint64_t v67 = 0xE300000000000000;
        uint64_t v65 = 7104878;
      }
      uint64_t v179 = sub_1AFC5A438(v65, v67, (uint64_t *)&aBlock);
      sub_1AFC71EA8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2080;
      uint64_t v68 = &v59[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime];
      uint64_t v69 = v58;
      uint64_t v70 = sub_1AFC71C08();
      MEMORY[0x1F4188790](v70);
      (*(void (**)(char *, char *, uint64_t))(v72 + 16))((char *)&v165 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0), v68, v70);
      uint64_t v58 = v69;
      uint64_t v73 = sub_1AFC71D18();
      uint64_t v179 = sub_1AFC5A438(v73, v74, (uint64_t *)&aBlock);
      sub_1AFC71EA8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AFB53000, v60, (os_log_type_t)v178, "Scheduling fetching the next batch of messages for re-indexing in chat with GUID %s after %s seconds", (uint8_t *)v62, 0x16u);
      uint64_t v75 = v177;
      swift_arrayDestroy();
      MEMORY[0x1B3E8AA80](v75, -1, -1);
      MEMORY[0x1B3E8AA80](v62, -1, -1);

      ((void (*)(char *, uint64_t *))v168)(v171, v174);
    }
    else
    {

      ((void (*)(char *, uint64_t))v30)(v55, v4);
    }
    if (qword_1E9AF7528 != -1) {
      swift_once();
    }
    v177 = (uint64_t *)qword_1E9AF7520;
    uint64_t v76 = sub_1AFC71C68();
    v178 = &v165;
    v173 = (void *)v76;
    uint64_t v77 = *(void *)(v76 - 8);
    uint64_t v78 = MEMORY[0x1F4188790](v76);
    v170 = &v165;
    MEMORY[0x1F4188790](v78);
    uint64_t v80 = (char *)&v165 - v79;
    sub_1AFC71C58();
    MEMORY[0x1B3E887F0](v80, &v59[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime]);
    uint64_t v81 = *(uint64_t **)(v77 + 8);
    v171 = (char *)(v77 + 8);
    v174 = v81;
    ((void (*)(char *, uint64_t))v81)(v80, v76);
    uint64_t v82 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
    v175 = &v165;
    uint64_t v83 = *(void *)(v82 - 8);
    uint64_t v84 = *(void *)(v83 + 64);
    MEMORY[0x1F4188790](v82);
    uint64_t v85 = (char *)&v165 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t *, uint64_t))(v83 + 16))(v85, v172, v82);
    unint64_t v86 = (*(unsigned __int8 *)(v83 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
    uint64_t v87 = (char *)swift_allocObject();
    *((void *)v87 + 2) = v59;
    *((void *)v87 + 3) = v58;
    *((void *)v87 + 4) = v176;
    (*(void (**)(char *, char *, uint64_t))(v83 + 32))(&v87[v86], v85, v82);
    v184 = sub_1AFC609B8;
    v185 = v87;
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v181 = 1107296256;
    v182 = sub_1AFC5BC90;
    v183 = &unk_1F084C3E0;
    __int16 v88 = _Block_copy(&aBlock);
    uint64_t v89 = sub_1AFC71C48();
    v172 = &v165;
    uint64_t v90 = *(void *)(v89 - 8);
    MEMORY[0x1F4188790](v89);
    __int16 v92 = (char *)&v165 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0);
    v93 = v58;
    __int16 v94 = v59;
    swift_bridgeObjectRetain();
    sub_1AFC71C28();
    uint64_t v95 = sub_1AFC71C18();
    v176 = &v165;
    uint64_t v96 = *(void *)(v95 - 8);
    MEMORY[0x1F4188790](v95);
    v98 = (char *)&v165 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v179 = MEMORY[0x1E4FBC860];
    sub_1AFC60CD0(&qword_1E9AF7530, MEMORY[0x1F41AAEB0]);
    sub_1AFC5683C(&qword_1E9AF7538);
    sub_1AFC60D18(&qword_1E9AF7540, &qword_1E9AF7538);
    sub_1AFC71ED8();
    v99 = v170;
    MEMORY[0x1B3E889B0](v170, v92, v98, v88);
    _Block_release(v88);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v98, v95);
    (*(void (**)(char *, uint64_t))(v90 + 8))(v92, v89);
    ((void (*)(NSObject *, void *))v174)(v99, v173);
    swift_release();
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v101 = v176;
  if (v176[2])
  {
    v102 = v167;
    ((void (*)(NSObject **, uint64_t, uint64_t))v177)(v167, v18, v4);
    v103 = v19;
    v104 = sub_1AFC71BC8();
    os_log_type_t v105 = sub_1AFC71DF8();
    BOOL v106 = os_log_type_enabled(v104, v105);
    v168 = v30;
    if (v106)
    {
      uint64_t v19 = (NSObject **)v5;
      uint64_t v107 = v4;
      v108 = (uint8_t *)swift_slowAlloc();
      uint64_t v109 = swift_slowAlloc();
      aBlock = (void *)v109;
      *(_DWORD *)v108 = 136315138;
      id v110 = objc_msgSend(v103, sel_associatedChatGUID);
      if (v110)
      {
        v111 = v110;
        uint64_t v112 = sub_1AFC71D08();
        unint64_t v114 = v113;
      }
      else
      {
        unint64_t v114 = 0xE300000000000000;
        uint64_t v112 = 7104878;
      }
      uint64_t v179 = sub_1AFC5A438(v112, v114, (uint64_t *)&aBlock);
      sub_1AFC71EA8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AFB53000, v104, v105, "No more messages to reindex for %s", v108, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B3E8AA80](v109, -1, -1);
      MEMORY[0x1B3E8AA80](v108, -1, -1);

      uint64_t v30 = v168;
      uint64_t v4 = v107;
      ((void (*)(NSObject **, uint64_t))v168)(v167, v107);
      v101 = v176;
    }
    else
    {

      ((void (*)(NSObject **, uint64_t))v30)(v102, v4);
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v101 = sub_1AFC57E78(v101);
    }
    sub_1AFC60C94(0, &qword_1E9AF7EC0);
    uint64_t v118 = v101[2];
    if (v118)
    {
      uint64_t v119 = v118 - 1;
      v120 = &v101[2 * v119];
      uint64_t v121 = v120[4];
      uint64_t v122 = v120[5];
      v176 = v101;
      v101[2] = v119;
      uint64_t v123 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
      uint64_t v19 = *(NSObject ***)(v123 - 8);
      v104 = v19[8];
      MEMORY[0x1F4188790](v123);
      v170 = v19[2];
      v171 = v124;
      ((void (*)(char *, uint64_t *))v170)((char *)&v165 - (((unint64_t)&v104[1].isa + 7) & 0xFFFFFFFFFFFFFFF0), v172);
      id v125 = sub_1AFC5D72C(v121, v122, (char *)&v165 - (((unint64_t)&v104[1].isa + 7) & 0xFFFFFFFFFFFFFFF0));
      v126 = v166;
      ((void (*)(uint64_t *, uint64_t *, uint64_t))v177)(v166, v175, v4);
      v127 = (uint64_t *)v125;
      v128 = sub_1AFC71BC8();
      os_log_type_t v129 = sub_1AFC71DF8();
      BOOL v130 = os_log_type_enabled(v128, v129);
      v178 = v127;
      if (v130)
      {
        v131 = (uint8_t *)swift_slowAlloc();
        uint64_t v132 = swift_slowAlloc();
        aBlock = (void *)v132;
        *(_DWORD *)v131 = 136315138;
        id v133 = objc_msgSend(v127, sel_associatedChatGUID);
        if (v133)
        {
          v134 = v133;
          uint64_t v135 = sub_1AFC71D08();
          unint64_t v137 = v136;
        }
        else
        {
          unint64_t v137 = 0xE300000000000000;
          uint64_t v135 = 7104878;
        }
        uint64_t v179 = sub_1AFC5A438(v135, v137, (uint64_t *)&aBlock);
        sub_1AFC71EA8();
        v140 = v178;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1AFB53000, v128, v129, "Incrementing chat to reindex to %s", v131, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1B3E8AA80](v132, -1, -1);
        MEMORY[0x1B3E8AA80](v131, -1, -1);

        v139 = v174;
        v138 = v166;
      }
      else
      {

        v138 = v126;
        v139 = (void *)v4;
      }
      ((void (*)(uint64_t *, void *))v168)(v138, v139);
      uint64_t v30 = v176;
      if (qword_1E9AF7528 == -1) {
        goto LABEL_50;
      }
    }
    else
    {
      __break(1u);
    }
    swift_once();
LABEL_50:
    v175 = (uint64_t *)qword_1E9AF7520;
    uint64_t v141 = sub_1AFC71C68();
    v177 = &v165;
    v168 = (uint64_t *)v141;
    uint64_t v142 = *(void *)(v141 - 8);
    uint64_t v143 = MEMORY[0x1F4188790](v141);
    v166 = &v165;
    MEMORY[0x1F4188790](v143);
    v145 = (char *)&v165 - v144;
    sub_1AFC71C58();
    v146 = v169;
    MEMORY[0x1B3E887F0](v145, &v169[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime]);
    v147 = *(void **)(v142 + 8);
    v167 = (NSObject **)(v142 + 8);
    v173 = v147;
    uint64_t v148 = ((uint64_t (*)(char *, uint64_t))v147)(v145, v141);
    v174 = &v165;
    MEMORY[0x1F4188790](v148);
    v149 = (char *)&v165 - (((unint64_t)&v104[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
    v150 = v171;
    ((void (*)(char *, uint64_t *, char *))v170)(v149, v172, v171);
    unint64_t v151 = (*((unsigned __int8 *)v19 + 80) + 40) & ~(unint64_t)*((unsigned __int8 *)v19 + 80);
    v152 = (char *)swift_allocObject();
    v153 = v178;
    *((void *)v152 + 2) = v146;
    *((void *)v152 + 3) = v153;
    *((void *)v152 + 4) = v30;
    ((void (*)(char *, char *, char *))v19[4])(&v152[v151], v149, v150);
    v184 = sub_1AFC609B8;
    v185 = v152;
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v181 = 1107296256;
    v182 = sub_1AFC5BC90;
    v183 = &unk_1F084C408;
    v154 = _Block_copy(&aBlock);
    uint64_t v155 = sub_1AFC71C48();
    v176 = &v165;
    uint64_t v156 = *(void *)(v155 - 8);
    MEMORY[0x1F4188790](v155);
    v158 = (char *)&v165 - ((v157 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v159 = v146;
    v172 = v153;
    sub_1AFC71C28();
    uint64_t v160 = sub_1AFC71C18();
    v178 = &v165;
    uint64_t v161 = *(void *)(v160 - 8);
    MEMORY[0x1F4188790](v160);
    v163 = (char *)&v165 - ((v162 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v179 = MEMORY[0x1E4FBC860];
    sub_1AFC60CD0(&qword_1E9AF7530, MEMORY[0x1F41AAEB0]);
    sub_1AFC5683C(&qword_1E9AF7538);
    sub_1AFC60D18(&qword_1E9AF7540, &qword_1E9AF7538);
    sub_1AFC71ED8();
    v164 = v166;
    MEMORY[0x1B3E889B0](v166, v158, v163, v154);
    _Block_release(v154);

    (*(void (**)(char *, uint64_t))(v161 + 8))(v163, v160);
    (*(void (**)(char *, uint64_t))(v156 + 8))(v158, v155);
    ((void (*)(uint64_t *, uint64_t *))v173)(v164, v168);
    swift_release();
    return;
  }
  v115 = sub_1AFC71BC8();
  os_log_type_t v116 = sub_1AFC71DF8();
  if (os_log_type_enabled(v115, v116))
  {
    v117 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v117 = 0;
    _os_log_impl(&dword_1AFB53000, v115, v116, "No more chats to reindex, stopping", v117, 2u);
    MEMORY[0x1B3E8AA80](v117, -1, -1);
  }
}

id sub_1AFC5F1B4()
{
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = MEMORY[0x1E4FBC860];
  *(void *)(v1 + 16) = MEMORY[0x1E4FBC860];
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA48]), sel_init);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = v0;
  aBlock[4] = sub_1AFC60B88;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AFC5BC90;
  aBlock[3] = &unk_1F084C430;
  id v5 = _Block_copy(aBlock);
  swift_retain();
  id v6 = v0;
  swift_release();
  IMDPersistencePerformBlock(v5, 1);
  _Block_release(v5);
  swift_beginAccess();
  unint64_t v7 = *(void *)(v1 + 16);
  uint64_t v20 = v2;
  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v8) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease_n();
    uint64_t v18 = MEMORY[0x1E4FBC860];
LABEL_17:
    sub_1AFC60C94(0, &qword_1E9AF7ED0);
    id v19 = v3;
    sub_1AFC71D78();

    swift_release();
    return (id)v18;
  }
LABEL_15:
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_1AFC71F38();
  if (!v8) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v9 = self;
  uint64_t v10 = 4;
  while (1)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x1B3E88A70](v10 - 4, v7);
    }
    else {
      id v13 = *(id *)(v7 + 8 * v10);
    }
    uint64_t v12 = v13;
    uint64_t v14 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
      goto LABEL_15;
    }
    id result = objc_msgSend(v9, sel_sharedInstance);
    if (!result) {
      break;
    }
    uint64_t v16 = result;
    id v17 = objc_msgSend(result, sel_newSearchableItemsForMessage_reindexing_rejectedItems_, v12, 1, v3);

    if (v17)
    {
      sub_1AFC60C94(0, &qword_1E9AF7EC8);
      unint64_t v11 = sub_1AFC71D88();

      uint64_t v12 = v17;
    }
    else
    {
      unint64_t v11 = MEMORY[0x1E4FBC860];
    }

    sub_1AFC5CBA8(v11);
    ++v10;
    if (v14 == v8)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v18 = v20;
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

void sub_1AFC5F4B8()
{
  uint64_t v0 = (__CFString *)sub_1AFC71CF8();
  uint64_t v1 = (__CFString *)sub_1AFC71CF8();
  uint64_t v2 = IMDChatRecordCopyChatsWithHandleOnService(v0, v1);

  if (v2)
  {
    sub_1AFC60C94(0, &qword_1E9AF7558);
    sub_1AFC71D68();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1AFC5F874(unint64_t a1, uint64_t a2)
{
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_1AFC71F38();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = (void **)(a2 + 16);
    unint64_t v19 = a1 & 0xC000000000000001;
    do
    {
      if (v19) {
        id v8 = (id)MEMORY[0x1B3E88A70](v6, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_guid, v19);
      uint64_t v11 = sub_1AFC71D08();
      uint64_t v13 = v12;

      swift_beginAccess();
      uint64_t v14 = *v7;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unint64_t v7 = v14;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v14 = sub_1AFC57BB4(0, v14[2] + 1, 1, v14);
        *unint64_t v7 = v14;
      }
      unint64_t v17 = v14[2];
      unint64_t v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        uint64_t v14 = sub_1AFC57BB4((void *)(v16 > 1), v17 + 1, 1, v14);
        *unint64_t v7 = v14;
      }
      ++v6;
      v14[2] = v17 + 1;
      uint64_t v18 = &v14[2 * v17];
      v18[4] = v11;
      void v18[5] = v13;
      swift_endAccess();
    }
    while (v4 != v6);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1AFC5FA54(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1AFC60C94(0, &qword_1E9AF7558);
  uint64_t v2 = sub_1AFC71D88();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

id SpotlightReindexer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SpotlightReindexer.init()()
{
}

id SpotlightReindexer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1AFC5FC7C(uint64_t a1, id a2)
{
  id v3 = objc_msgSend(a2, sel_nextBatch);
  sub_1AFC60C94(0, &qword_1E9AF7EE8);
  uint64_t v4 = sub_1AFC71D88();

  swift_beginAccess();
  *(void *)(a1 + 16) = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AFC5FD1C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1AFC5FD3C(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_1AFC5FD3C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1AFC5683C(&qword_1E9AF7570);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1AFC71F58();
  __break(1u);
  return result;
}

uint64_t sub_1AFC5FEA8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1AFC71F38();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1AFC60D18(&qword_1E9AF7EE0, &qword_1E9AF7ED8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_1AFC5683C(&qword_1E9AF7ED8);
          uint64_t v12 = sub_1AFC600DC(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1AFC60C94(0, &qword_1E9AF7EC8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1AFC71F58();
  __break(1u);
  return result;
}

void (*sub_1AFC600DC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1AFC6018C(v6, a2, a3);
  return sub_1AFC60144;
}

void sub_1AFC60144(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1AFC6018C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  id v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1B3E88A70](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)id v3 = v4;
    return sub_1AFC6020C;
  }
  __break(1u);
  return result;
}

void sub_1AFC6020C(id *a1)
{
}

id sub_1AFC60214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = v4;
  id result = (id)IMDIsRunningInDatabaseServerProcess();
  if (result)
  {
    *(void *)&v9[OBJC_IVAR___IMDCoreSpotlightReindexer_handles] = a1;
    int64_t v11 = &v9[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime];
    *(void *)&v9[OBJC_IVAR___IMDCoreSpotlightReindexer_deferralTime] = a2;
    uint64_t v12 = *MEMORY[0x1E4FBCAC0];
    uint64_t v13 = sub_1AFC71C08();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
    uint64_t v14 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
    uint64_t v15 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v14);
    unint64_t v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v18 = objc_msgSend(self, sel_seconds);
    sub_1AFC60C94(0, (unint64_t *)&unk_1E9AF7510);
    sub_1AFC71A18();
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v9[OBJC_IVAR___IMDCoreSpotlightReindexer_messageAge], v17, v14);
    *(void *)&v9[OBJC_IVAR___IMDCoreSpotlightReindexer_index] = a3;
    swift_unknownObjectRetain();

    v19.receiver = v9;
    v19.super_class = ObjectType;
    return objc_msgSendSuper2(&v19, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AFC6042C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1AFC60464()
{
  return sub_1AFC5C698(*(void **)(v0 + 16));
}

uint64_t sub_1AFC6046C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = v2;
  return swift_retain();
}

uint64_t sub_1AFC6047C()
{
  return swift_release();
}

uint64_t sub_1AFC60484()
{
  return type metadata accessor for SpotlightReindexer();
}

uint64_t type metadata accessor for SpotlightReindexer()
{
  uint64_t result = qword_1E9AF7498;
  if (!qword_1E9AF7498) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1AFC604D8()
{
  sub_1AFC71C08();
  if (v0 <= 0x3F)
  {
    sub_1AFC605E8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SpotlightReindexer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SpotlightReindexer);
}

uint64_t dispatch thunk of SpotlightReindexer.__allocating_init(handles:batchDeferralTime:messageAge:index:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_1AFC605E8()
{
  if (!qword_1E9AF74C8)
  {
    sub_1AFC60C94(255, (unint64_t *)&unk_1E9AF7510);
    unint64_t v0 = sub_1AFC71A48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9AF74C8);
    }
  }
}

uint64_t sub_1AFC60650(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!IMDIsRunningInDatabaseServerProcess())
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_10;
  }
  uint64_t v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v8)
  {
    uint64_t v9 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v9 = a3 & 0xFFFFFFFFFFFFLL;
    }
    if (v9)
    {
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = MEMORY[0x1E4FBC860];
      int64_t v11 = (void *)swift_allocObject();
      id v11[2] = a1;
      v11[3] = a2;
      uint8_t v11[4] = a3;
      v11[5] = a4;
      void v11[6] = v10;
      aBlock[4] = (uint64_t)sub_1AFC60C7C;
      aBlock[5] = (uint64_t)v11;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1AFC5BC90;
      aBlock[3] = (uint64_t)&unk_1F084C458;
      uint64_t v12 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      IMDPersistencePerformBlock(v12, 1);
      _Block_release(v12);
      swift_beginAccess();
      uint64_t v13 = *(void *)(v10 + 16);
      swift_bridgeObjectRetain();
      swift_release();
      return v13;
    }
  }
  if (qword_1E9AF74F0 != -1) {
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v14 = sub_1AFC71BE8();
  sub_1AFC57D04(v14, (uint64_t)qword_1E9AF83E0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1AFC71BC8();
  os_log_type_t v16 = sub_1AFC71E18();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    sub_1AFC5A438(a1, a2, aBlock);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1AFC5A438(a3, a4, aBlock);
    sub_1AFC71EA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AFB53000, v15, v16, "Handle (%s) or service (%s) is empty", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1B3E8AA80](v18, -1, -1);
    MEMORY[0x1B3E8AA80](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1AFC609C4()
{
  uint64_t v1 = sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

void sub_1AFC60AA4()
{
  uint64_t v1 = *(void *)(sub_1AFC5683C((uint64_t *)&unk_1E9AF74B8) - 8);
  sub_1AFC5DA7C(*(void **)(v0 + 24), *(uint64_t **)(v0 + 32), (uint64_t *)(v0 + ((*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))));
}

uint64_t sub_1AFC60B10()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1AFC60B48()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1AFC60B88()
{
  return sub_1AFC5FC7C(*(void *)(v0 + 16), *(id *)(v0 + 24));
}

unint64_t sub_1AFC60B90()
{
  unint64_t result = qword_1E9AF7F00;
  if (!qword_1E9AF7F00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7F00);
  }
  return result;
}

unint64_t sub_1AFC60BD8()
{
  unint64_t result = qword_1E9AF7F10;
  if (!qword_1E9AF7F10)
  {
    sub_1AFC60C94(255, &qword_1E9AF7F08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9AF7F10);
  }
  return result;
}

uint64_t sub_1AFC60C34()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_1AFC60C7C()
{
}

uint64_t sub_1AFC60C8C(unint64_t a1)
{
  return sub_1AFC5F874(a1, v1);
}

uint64_t sub_1AFC60C94(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1AFC60CD0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AFC60D18(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1AFC568DC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1AFC60D90()
{
  if (MEMORY[0x1E4F18910])
  {
    sub_1AFC71B18();
    sub_1AFC61158(MEMORY[0x1E4FBC860]);
    sub_1AFC71E78();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AFC60ED8(void *a1)
{
  id v8 = a1;
  sub_1AFC71D08();
  sub_1AFC71D08();
  sub_1AFC71D08();
  uint64_t v1 = sub_1AFC71B58();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFC71B48();
  id v5 = v8;
  sub_1AFC60D90();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void sub_1AFC61040(void *a1)
{
  sub_1AFC71D08();
  sub_1AFC71D08();
  id v2 = a1;
  if (MEMORY[0x1E4F18910])
  {
    sub_1AFC61158(MEMORY[0x1E4FBC860]);
    sub_1AFC71E78();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

unint64_t sub_1AFC61158(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  sub_1AFC5683C(&qword_1E9AF7F18);
  uint64_t v2 = sub_1AFC71F48();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1AFC612FC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1AFC61284(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    int64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1AFC61364(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1AFC61284(uint64_t a1, uint64_t a2)
{
  sub_1AFC71FA8();
  sub_1AFC71D28();
  uint64_t v4 = sub_1AFC71FB8();
  return sub_1AFC61374(a1, a2, v4);
}

uint64_t sub_1AFC612FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC5683C(&qword_1E9AF7F20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1AFC61364(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1AFC61374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1AFC71F88() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1AFC71F88() & 1) == 0);
    }
  }
  return v6;
}

id IMDPersistenceHelloWorldClass.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id IMDPersistenceHelloWorldClass.init()()
{
  uint64_t v1 = OBJC_IVAR___IMDPersistenceHelloWorldClass_Impl_inner;
  id v2 = objc_allocWithZone((Class)sub_1AFC71BA8());
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for IMDPersistenceHelloWorldClass()
{
  return self;
}

uint64_t sub_1AFC615B4()
{
  return sub_1AFC71B98();
}

id IMDPersistenceHelloWorldClass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for IMDPersistenceHelloWorldClass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for IMDPersistenceHelloWorldClass);
}

uint64_t dispatch thunk of IMDPersistenceHelloWorldClass.printGreeting()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t initializeBufferWithCopyOfBuffer for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  objc_super v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for IMDPersistenceHelloWorld(uint64_t a1)
{
  uint64_t v2 = sub_1AFC71B88();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1AFC6193C);
}

uint64_t sub_1AFC6193C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for IMDPersistenceHelloWorld(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1AFC619BC);
}

uint64_t sub_1AFC619BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1AFC71B88();
  objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for IMDPersistenceHelloWorld()
{
  uint64_t result = qword_1E9AF7F30;
  if (!qword_1E9AF7F30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1AFC61A78()
{
  uint64_t result = sub_1AFC71B88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AFC61B04()
{
  uint64_t v0 = sub_1AFC71BE8();
  sub_1AFC57E00(v0, qword_1E9AF83E0);
  sub_1AFC57D04(v0, (uint64_t)qword_1E9AF83E0);
  sub_1AFC71BB8();
  return sub_1AFC71BD8();
}

id static NSXPCInterface.messagesRemoteDatabase.getter()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1F086FAF8);
  return v0;
}

void sub_1AFC61BC4(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Nil or empty path parameter", v1, 2u);
}

void sub_1AFC61C08(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "Failed to get file size for item at path: %@, with error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1AFC61CBC(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = [a2 localizedDescription];
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "Downgraded database SQL query '%@' got error: '%@'", (uint8_t *)&v4, 0x16u);
}

void sub_1AFC61D5C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Failed to get total row count for table %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1AFC61DE4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  int v3 = "-[IMDDatabase(Database) fetchCountOfRecordType:completionHandler:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Unknown record type %lld", (uint8_t *)&v2, 0x16u);
}

void sub_1AFC61E70(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "IMDContactCache: Error! being called in a process that is not in IMDPersistenceAgent!", v1, 2u);
}

void sub_1AFC61EB4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Unable to select rows from Message PTask Table: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC61F30(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Unable to delete completed task from Message PTask Table: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC61FAC(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_1AFB67AD4();
  sub_1AFB67AA8(&dword_1AFB53000, v1, v2, "Failed to save client state from previous manager %@: %@", (void)v3, DWORD2(v3));
}

void sub_1AFC62020(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_1AFB67AD4();
  sub_1AFB67AA8(&dword_1AFB53000, v1, v2, "Failed to read client state from previous manager %@: %@", (void)v3, DWORD2(v3));
}

void sub_1AFC62094()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Simulating error during fetch due to defaults", v2, v3, v4, v5, v6);
}

void sub_1AFC620C8(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_1AFB67AD4();
  sub_1AFB67AA8(&dword_1AFB53000, v1, v2, "Failed to parse client state. generating a new one! error %@ data %@", (void)v3, DWORD2(v3));
}

void sub_1AFC62138()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Couldn't open Spotlight index to save client state", v2, v3, v4, v5, v6);
}

void sub_1AFC6216C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize client state: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC621E4()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Simulating error during save due to defaults", v2, v3, v4, v5, v6);
}

void sub_1AFC62218(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Failed to save client state: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC62294()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6233C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC623E4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6248C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62534()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC625DC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62684()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6272C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC627D4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6287C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62924()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC629CC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62A74()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62B1C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62BC4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62C6C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62D14()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62DBC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62E64()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62F0C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC62FB4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6305C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC63104()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC631AC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC63254()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC632FC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC633A4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6344C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC634F4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6359C(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"OFF";
  if (a1) {
    uint64_t v2 = @"ON";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_FAULT, "This method should not be called %@ the notification queue because it may lead to long blocking of other requests.", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC6362C()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Failed to create IMItem from IMMessageRecord: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC63694()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  _os_log_debug_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_DEBUG, "Not generating notification for participantChangeItem from myself: %@", v1, 0xCu);
}

void sub_1AFC63708(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 chatRecord];
  sub_1AFB7CF60();
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch chat for chatRecord: %@", v4, 0xCu);
}

void sub_1AFC637A0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1AFB53000, log, OS_LOG_TYPE_DEBUG, "Not generating notification because chat %@ doesn't have scheduled messages in it", buf, 0xCu);
}

void sub_1AFC637F8(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 changeType];
  sub_1AFB7CF60();
  _os_log_debug_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_DEBUG, "Not generating notification for participantChangeItem with changeType: %lld", v3, 0xCu);
}

void sub_1AFC63880(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  sub_1AFB7CF60();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "Error posting notification request %@. Error: %@", v6, 0x16u);
}

void sub_1AFC63934(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Error updating edited message content for notification request %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1AFC639C0()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "We don't have a chat identifier to set as the thread identifier for chat dictionary %@", v2, v3, v4, v5, v6);
}

void sub_1AFC63A28()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "We don't have a message guid for message dictionary %@", v2, v3, v4, v5, v6);
}

void sub_1AFC63A90()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Failed to generate a destination URL for a ", v2, v3, v4, v5, v6);
}

void sub_1AFC63AC4()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Failed to copy first frame of multiframe preview", v2, v3, v4, v5, v6);
}

void sub_1AFC63AF8()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Not synthesizing notification content from intent, contentByUpdatingWithProvider returned error %@", v2, v3, v4, v5, v6);
}

void sub_1AFC63B60(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Could not create emoji image text attachment for attachment record", buf, 2u);
}

void sub_1AFC63BA0()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  _os_log_fault_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_FAULT, "Caught exception generating notification %@", v1, 0xCu);
}

void sub_1AFC63C14()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not find transferGUID for sticker tapback", v2, v3, v4, v5, v6);
}

void sub_1AFC63C48()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not find attachmentRecord for sticker tapback", v2, v3, v4, v5, v6);
}

void sub_1AFC63C7C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not find transferGUID for removed sticker tapback", v2, v3, v4, v5, v6);
}

void sub_1AFC63CB0()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not find associatedMessageEmoji for removed emoji tapback", v2, v3, v4, v5, v6);
}

void sub_1AFC63CE4()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not find associatedMessageEmoji for emoji tapback", v2, v3, v4, v5, v6);
}

void sub_1AFC63D18(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SOSLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDNotificationsController.m", 97, @"%s", *a1);

  __break(1u);
}

void sub_1AFC63D98()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSOSUtilitiesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDNotificationsController.m", 98, @"Unable to find class %s", "SOSUtilities");

  __break(1u);
}

void sub_1AFC63E14(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SafetyMonitorLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDNotificationsController.m", 84, @"%s", *a1);

  __break(1u);
}

void sub_1AFC63E94()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSMMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDNotificationsController.m", 85, @"Unable to find class %s", "SMMessage");

  __break(1u);
}

void sub_1AFC63F10(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = IMDSqlOperationErrorDescription(a1);
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "SQL ERROR: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC63F9C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64044()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC640EC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64194()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6423C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "No handles or services specified. Or handleCount != serviceCount. No rows will be returned.", v1, 2u);
}

void sub_1AFC64280()
{
  sub_1AFB85FD4();
  [v0 stringWithFormat:@"can't have migration  %d to %d fail without error!! (Actual migration)"]);
  sub_1AFB85FC4();
  sub_1AFB85FB4();
  sub_1AFB85FA0();
  sub_1AFB85F80(&dword_1AFB53000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_1AFC64330()
{
  sub_1AFB85FD4();
  [v0 stringWithFormat:@"can't have migration %d to %d fail without error!! (Drop unknown indexes)"];
  sub_1AFB85FC4();
  sub_1AFB85FB4();
  sub_1AFB85FA0();
  sub_1AFB85F80(&dword_1AFB53000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_1AFC643E0()
{
  sub_1AFB85FD4();
  [v0 stringWithFormat:@"can't have migration %d to %d fail without error!! (Drop Triggers)"];
  sub_1AFB85FC4();
  sub_1AFB85FB4();
  sub_1AFB85FA0();
  sub_1AFB85F80(&dword_1AFB53000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_1AFC64490()
{
  sub_1AFB85FD4();
  [v0 stringWithFormat:@"can't have migration %d to %d fail without error!! (Begin Transaction)"];
  sub_1AFB85FC4();
  sub_1AFB85FB4();
  sub_1AFB85FA0();
  sub_1AFB85F80(&dword_1AFB53000, v1, v2, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v3, v4, v5, v6, v7, v8, 2u);
}

void sub_1AFC64540(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 18017;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Database version is newer, but internal build allows this state (dbver %d, expected %d)", (uint8_t *)v2, 0xEu);
}

void sub_1AFC645C8(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 18017;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Unable to perform database migration to %d - NO MIGRATOR FOUND", (uint8_t *)v1, 8u);
}

void sub_1AFC64648(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "No chatIdentifiers or lastAddressedLabelIDsCount provided. No rows will be returned.", v1, 2u);
}

void sub_1AFC6468C()
{
  sub_1AFB8E224(*MEMORY[0x1E4F143B8]);
  sub_1AFB8E218();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Unable to find last addressed lablID & date from chat identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC646F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "No chatIdentifiers or lastAddressedHandles provided. No rows will be returned.", v1, 2u);
}

void sub_1AFC64738()
{
  sub_1AFB8E224(*MEMORY[0x1E4F143B8]);
  sub_1AFB8E218();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Unable to find last addressed handles & date from chat identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC647A0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64850()
{
  sub_1AFB8E224(*MEMORY[0x1E4F143B8]);
  sub_1AFB8E218();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Unable to select rows from Message Deleted Messages Table: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC648B8()
{
  sub_1AFB8E224(*MEMORY[0x1E4F143B8]);
  sub_1AFB8E218();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Unable to update messages to new error (%@)", v2, v3, v4, v5, v6);
}

void sub_1AFC64920(NSObject *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [NSString stringWithFormat:&stru_1F084E970];
  v4[0] = 136316162;
  sub_1AFB69024();
  uint64_t v5 = "0";
  __int16 v6 = v2;
  uint64_t v7 = "CFStringRef kIMDChatRemapMessagesWithErrorCodeToErrorCode(int)";
  __int16 v8 = 1024;
  int v9 = 1562;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1AFB53000, a1, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", (uint8_t *)v4, 0x30u);
}

void sub_1AFC64A00()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64AB4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Too many items queued for donation, purging first %llu to make room", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC64B2C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) count];
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "Failed to donate %llu interactions: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1AFC64BCC(NSObject *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = "op == nil || op->connection == nil || op->database == nil";
  __int16 v4 = 2080;
  uint64_t v5 = "void IMDSqlOperationWasInitialized(IMDSqlOperation *)";
  __int16 v6 = 1024;
  int v7 = 77;
  __int16 v8 = 2112;
  uint64_t v9 = [NSString stringWithFormat:&stru_1F084E970];
  _os_log_error_impl(&dword_1AFB53000, a1, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", (uint8_t *)&v2, 0x26u);
}

void sub_1AFC64CA0(uint64_t a1, uint64_t a2)
{
  IMDSqlOperationErrorDescription(a2);
  sub_1AFB914AC();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Failed to create table %@ with error %@", v4, v5, v6, v7, v8);
}

void sub_1AFC64D24(uint64_t a1, uint64_t a2)
{
  IMDSqlOperationErrorDescription(a2);
  sub_1AFB914AC();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Failed to drop table %@ with error %@", v4, v5, v6, v7, v8);
}

void sub_1AFC64DA8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64E50()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64EF8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC64FA0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65048()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC650F0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65198()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65240()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC652E8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65390()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65438()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC654E0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65588()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65630()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC656D8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65780()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65828()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC658D0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65978()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65A24()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65ACC()
{
  [NSString stringWithFormat:@"CSDBSqliteDatabaseConnectionForWriting returned a nil CSDBSqliteConnection"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65B78()
{
  [NSString stringWithFormat:@"IMDSharedSqliteDatabase() should not be nil"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC65C20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65C98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65D10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65D88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65E00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65E78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65EF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65F68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC65FDC(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = 36;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "NULL message passed when trying to set property: %ld  (value:%d)", (uint8_t *)&v2, 0x12u);
}

void sub_1AFC66068(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC660E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66158(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC661D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Remote set other handle not implemented", v1, 2u);
}

void sub_1AFC66214(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  __int16 v4 = "void IMDMessageRecordAddAttachmentIfNeededUnlocked(IMDMessageRecordRef, IMDAttachmentRecordRef)_block_invoke";
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Error adding attachment join: %d (%s)", (uint8_t *)v2, 0x12u);
}

void sub_1AFC662A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66318(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66390(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66408(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66480(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC664F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66570(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC665E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66660(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC666D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66750(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC667C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC66840()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  sub_1AFBA5FFC(&dword_1AFB53000, v0, v1, "CloudSync.message | Update status Query success for: %@", v2);
}

void sub_1AFC668AC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "CloudSync.message | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC66930(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "CloudSync.message | Failed to update ck_sync_state for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC669CC()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "originalMessageItem was nil when attempting to update a message", v2, v3, v4, v5, v6);
}

void sub_1AFC66A00()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "newMessageItem was nil when attempting to update a message", v2, v3, v4, v5, v6);
}

void sub_1AFC66A34()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "newSyndicationRange was nil when attempting to update a message", v2, v3, v4, v5, v6);
}

void sub_1AFC66A68(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FFC(&dword_1AFB53000, a1, a3, "%s Tried to remove nil attachment GUID from syndication", (uint8_t *)&v3);
}

void sub_1AFC66AE4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FB4();
  sub_1AFBA5FE4(&dword_1AFB53000, v0, v1, "%s Could not derive message GUID from attachment GUID %@", (uint8_t *)&v2);
}

void sub_1AFC66B60()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FB4();
  sub_1AFBA5FE4(&dword_1AFB53000, v0, v1, "%s Could not derive message item from attachment GUID %@", (uint8_t *)&v2);
}

void sub_1AFC66BDC()
{
  int v2 = 136315650;
  sub_1AFBA6034();
  sub_1AFBA60A4(&dword_1AFB53000, v0, v1, "%s Message record was nil for attachment GUID %@, messageGUID %@", v2);
}

void sub_1AFC66C50(void *a1)
{
  os_log_t v1 = [a1 fileTransferGUIDs];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "%s messageItem.fileTransferGUIDs for failing messageItem: %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC66CE8()
{
  sub_1AFBA6050();
  os_log_t v1 = [v0 fileTransferGUIDs];
  [v1 count];
  sub_1AFBA605C();
  sub_1AFBA6014(&dword_1AFB53000, v2, v3, "%s Could not derive actual attachment GUID from given attachment GUID %@, messageItem.fileTransferGUIDs.count: %lu", v4, v5, v6, v7, 2u);
}

void sub_1AFC66D98()
{
  int v2 = 136315650;
  sub_1AFBA6034();
  sub_1AFBA60A4(&dword_1AFB53000, v0, v1, "%s IMItem was not an IMMessageItem for attachment GUID %@, messageGUID %@", v2);
}

void sub_1AFC66E0C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
  sub_1AFBA5FFC(&dword_1AFB53000, a1, a3, "%s Tried to update syndicationRanges on nil messageItem", (uint8_t *)&v3);
}

void sub_1AFC66E88(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
  sub_1AFBA5FFC(&dword_1AFB53000, a1, a3, "%s Tried to update syndicationRanges on nil messagePart", (uint8_t *)&v3);
}

void sub_1AFC66F04(void *a1)
{
  os_log_t v1 = [a1 guid];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "%s Tried to update syndication range for message GUID %@ with zeroed message range", v4, v5, v6, v7, 2u);
}

void sub_1AFC66F9C(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
  sub_1AFBA5FFC(&dword_1AFB53000, a1, a3, "%s Tried to update CMM syndicationRanges on nil messageItem", (uint8_t *)&v3);
}

void sub_1AFC67018(void *a1)
{
  os_log_t v1 = [a1 guid];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "%s No file transfer guids when updating CMM syndicationRanges on message %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC670B0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_1AFBA5FE4(&dword_1AFB53000, v1, (uint64_t)v1, "cmmAssetOffset %llu is greater than the number of file transfers %llu", v2);
}

void sub_1AFC6712C(void *a1)
{
  os_log_t v1 = [a1 guid];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "%s No valid CMM assets present for message %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC671C4(void *a1)
{
  os_log_t v1 = [a1 guid];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "%s No file transfer guids present for message %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC6725C()
{
  sub_1AFBA6050();
  os_log_t v1 = [v0 guid];
  sub_1AFBA605C();
  sub_1AFBA6014(&dword_1AFB53000, v2, v3, "%s Did not find a valid range for attachment GUID %@ and message %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC67304(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FFC(&dword_1AFB53000, a1, a3, "%s Tried to syndication ranges for nil message GUID", (uint8_t *)&v3);
}

void sub_1AFC67380()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FB4();
  sub_1AFBA5FE4(&dword_1AFB53000, v0, v1, "%s Message record was nil for messageGUID %@", (uint8_t *)&v2);
}

void sub_1AFC673FC()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FB4();
  sub_1AFBA5FE4(&dword_1AFB53000, v0, v1, "%s Could not load message item for message GUID %@", (uint8_t *)&v2);
}

void sub_1AFC67478(void *a1)
{
  [a1 partNumber];
  sub_1AFBA6014(&dword_1AFB53000, v1, v2, "%s Could not load message part %ld for message GUID %@", v3, v4, v5, v6, 2u);
}

void sub_1AFC6751C()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
  sub_1AFBA5FB4();
  sub_1AFBA5FE4(&dword_1AFB53000, v0, v1, "%s IMItem was not an IMMessageItem for messageGUID %@", (uint8_t *)&v2);
}

void sub_1AFC67598()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  sub_1AFBA5FFC(&dword_1AFB53000, v0, v1, "CloudSync.message | Update synced syndication ranges Query success for: %@", v2);
}

void sub_1AFC67604(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "CloudSync.message | Update synced syndication ranges Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC67688(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "CloudSync.message | Failed to update synced syndication ranges for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC67724(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC677AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_1AFBA6070(a1, a2), "localizedDescription");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_1AFBA6084(&dword_1AFB53000, v5, v6, "Recently Deleted | Failed to remove entries from chat_message_join: %@");
}

void sub_1AFC67808()
{
  sub_1AFBA6050();
  uint64_t v1 = [v0 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Recently Deleted | Insert to recoverable message table failed for message guid %@: %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC678A4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6792C()
{
  sub_1AFBA6050();
  uint64_t v1 = [v0 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Recently Deleted | Parts: Permanent recoverable message part deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC679C8()
{
  sub_1AFBA6050();
  uint64_t v1 = [v0 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Recently Deleted | Permanent recoverable message deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC67A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_1AFBA6070(a1, a2), "localizedDescription");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_1AFBA6084(&dword_1AFB53000, v5, v6, "Recently Deleted | Failed to add chat entry to unsynced_removed_recoverable_messages: %@");
}

void sub_1AFC67AC0()
{
  sub_1AFBA6050();
  uint64_t v1 = [v0 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v2, v3, "Junk Messages | Permanent junk message deletion failed for chat guid %@: %@", v4, v5, v6, v7, 2u);
}

void sub_1AFC67B5C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody could not find part attribute name", v2, v3, v4, v5, v6);
}

void sub_1AFC67B90()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody message part body data is nil.", v2, v3, v4, v5, v6);
}

void sub_1AFC67BC4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC67C4C()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  sub_1AFBA5FFC(&dword_1AFB53000, v0, v1, "Recently Deleted | Bailing:storeRecoverableMessagePartWithBody Failed to encode message part body with exception: %@", v2);
}

void sub_1AFC67CB8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC67D3C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Failed with error: %@ clearing out message tombstones", v4, v5, v6, v7, v8);
}

void sub_1AFC67DC0(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[IMDBaseSpotlightIndexController _createErrorFromSyncError:]";
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "%s originalError was nil, returning nil", (uint8_t *)&v1, 0xCu);
}

void sub_1AFC67E44(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "uniqueIdentifier not set for item: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC67EBC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
}

void sub_1AFC67F00(void *a1)
{
  objc_end_catch();
}

void sub_1AFC67F24(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Not donating INInteraction, interaction generated is nil", v1, 2u);
}

void sub_1AFC67F68(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Error donating intent interaction = %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC67FE0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "messageDate was distant past. Not setting contentCreationDate on metadataAttributes.", v1, 2u);
}

void sub_1AFC68024(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1AFB53000, log, OS_LOG_TYPE_FAULT, "No implementation found for setting URL description on CSSearchableItemAttributeSet", v1, 2u);
}

void sub_1AFC68068()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaSongMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 59, @"Unable to find class %s", "LPiTunesMediaSongMetadata");

  __break(1u);
}

void sub_1AFC680E4(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LinkPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDCoreSpotlightIndexers.m", 56, @"%s", *a1);

  __break(1u);
}

void sub_1AFC68164()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaAlbumMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 60, @"Unable to find class %s", "LPiTunesMediaAlbumMetadata");

  __break(1u);
}

void sub_1AFC681E0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaArtistMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 61, @"Unable to find class %s", "LPiTunesMediaArtistMetadata");

  __break(1u);
}

void sub_1AFC6825C()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaMusicVideoMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 62, @"Unable to find class %s", "LPiTunesMediaMusicVideoMetadata");

  __break(1u);
}

void sub_1AFC682D8()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaPodcastEpisodeMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 63, @"Unable to find class %s", "LPiTunesMediaPodcastEpisodeMetadata");

  __break(1u);
}

void sub_1AFC68354()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaPodcastMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 64, @"Unable to find class %s", "LPiTunesMediaPodcastMetadata");

  __break(1u);
}

void sub_1AFC683D0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaTVEpisodeMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 65, @"Unable to find class %s", "LPiTunesMediaTVEpisodeMetadata");

  __break(1u);
}

void sub_1AFC6844C()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaTVSeasonMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 66, @"Unable to find class %s", "LPiTunesMediaTVSeasonMetadata");

  __break(1u);
}

void sub_1AFC684C8()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaPlaylistMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 67, @"Unable to find class %s", "LPiTunesMediaPlaylistMetadata");

  __break(1u);
}

void sub_1AFC68544()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaMovieMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 68, @"Unable to find class %s", "LPiTunesMediaMovieMetadata");

  __break(1u);
}

void sub_1AFC685C0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPiTunesMediaMovieBundleMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 69, @"Unable to find class %s", "LPiTunesMediaMovieBundleMetadata");

  __break(1u);
}

void sub_1AFC6863C()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPAppleTVMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 70, @"Unable to find class %s", "LPAppleTVMetadata");

  __break(1u);
}

void sub_1AFC686B8()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPAppleNewsMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 71, @"Unable to find class %s", "LPAppleNewsMetadata");

  __break(1u);
}

void sub_1AFC68734()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getLPMapMetadataClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlightIndexers.m", 58, @"Unable to find class %s", "LPMapMetadata");

  __break(1u);
}

void sub_1AFC687B0()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class get_CDInteractionRecorderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight_CoreDuetDonation.m", 37, @"Unable to find class %s", "_CDInteractionRecorder");

  __break(1u);
}

void sub_1AFC6882C(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDCoreSpotlight_CoreDuetDonation.m", 33, @"%s", *a1);

  __break(1u);
}

void sub_1AFC688AC()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class get_CDInteractionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight_CoreDuetDonation.m", 36, @"Unable to find class %s", "_CDInteraction");

  __break(1u);
}

void sub_1AFC68928()
{
  id v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class get_CDContactClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight_CoreDuetDonation.m", 35, @"Unable to find class %s", "_CDContact");

  __break(1u);
}

void sub_1AFC689A4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = 138412546;
  int v1 = @"knownSender";
  __int16 v2 = 2080;
  uint64_t v3 = "itemDictionary";
  _os_log_error_impl(&dword_1AFB53000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_1AFC68A40(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Error fetching suggested name for handle \"%@\" Error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1AFC68ACC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "No cached business name, using placeholder business name, will call interaction update handler if business name fetch completes", v1, 2u);
}

void sub_1AFC68B10(void *a1)
{
  __int16 v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DataDetectorsCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDCoreSpotlightIndexHelpers.m", 73, @"%s", *a1);

  __break(1u);
}

void sub_1AFC68B90(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ORPHAN: Failed to insert message. SQLite error was: %d", v4);
}

void sub_1AFC68BC8(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "[Database] ERROR: **** Failed ingesting legacy message with row ID: %d", (uint8_t *)v2, 8u);
}

void sub_1AFC68C40(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "[Database] ERROR: Failed to create new message row. SQLite error: %d", (uint8_t *)v1, 8u);
}

void sub_1AFC68CC0(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBCC98C(&dword_1AFB53000, v2, v3, "[Database] Bailing early on a problematic message.", v4);
}

void sub_1AFC68CEC(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ORPHAN: Failed to update message. SQLite error: %d", v4);
}

void sub_1AFC68D24(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ORPHAN: Failed to create new attachment record. SQLite error: %d.", v4);
}

void sub_1AFC68D5C(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ERROR: Failed updating the filename on the new attachment record with SQLite result: %d", v4);
}

void sub_1AFC68D94(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBCC98C(&dword_1AFB53000, v2, v3, "[Database] ERROR: Failed to write piece data to FS.", v4);
}

void sub_1AFC68DC0(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ERROR: Failed joining new attachment to message with SQLite result: %d", v4);
}

void sub_1AFC68DF8(float *a1, _DWORD *a2)
{
  sub_1AFBCC928(a1, a2, 1.5047e-36);
  sub_1AFBCC938(&dword_1AFB53000, v2, v3, "[Database] ERROR: Failed to create chat record. SQLite error: %d", v4);
}

void sub_1AFC68E30(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBCC98C(&dword_1AFB53000, v2, v3, "[Database] ERROR: * * * * * Holy Smokes, the group row id is bogus! * * * * * *", v4);
}

void sub_1AFC68E5C(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)long long buf = 136315138;
  *a2 = "Boolean __findOrCreateiMessageAttachmentsForLegacyGUID(CSDBSqliteConnection *, CFStringRef, int64_t)";
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Invalid legacy guid provided in %s - this is bad but non-fatal.", buf, 0xCu);
}

void sub_1AFC68EAC()
{
  sub_1AFBCC954();
  sub_1AFBCC9A8(&dword_1AFB53000, v0, v1, "[Database] ERROR: Unable to bind chat id[%lld] to message id[%lld]: %d", v2, v3, v4);
}

void sub_1AFC68F14()
{
  sub_1AFBCC954();
  sub_1AFBCC9A8(&dword_1AFB53000, v0, v1, "[Database] ERROR: Failed to join Handle [%lld] to Chat [%lld]. SQLite error: %d", v2, v3, v4);
}

void sub_1AFC68F7C(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "[Database] ERROR: Unable to set properties for chat[%lld]: %d", (uint8_t *)&v3, 0x12u);
}

void sub_1AFC69004(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "[Database] ERROR: You tried to join chat [%lld] to group [%lld] with an invalid row id.", (uint8_t *)&v3, 0x16u);
}

void sub_1AFC6908C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69134()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC691DC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69284()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly NOT nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6932C(uint64_t a1)
{
  IMDSqlOperationErrorDescription(a1);
  sub_1AFBA5FC4(&dword_1AFB53000, v1, v2, "Starting new query with pending error: : %@", v3, v4, v5, v6, 2u);
}

void sub_1AFC693A8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69450()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly NOT nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC694F8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC695A0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69648()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC696F0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69798()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69840()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC698E8()
{
  [NSString stringWithFormat:@"SQL operation results never read from statement"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69990()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69A38()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69AE0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69B88()
{
  [NSString stringWithFormat:@"trying to commit transaction when we don't have one."];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69C30()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69CD8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69D80()
{
  [NSString stringWithFormat:@"Trying to revert transaction when we don't have one. This may mean we have a transaction open on this same sql_connection with another IMDSqlOperation"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69E28()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69ED0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC69F78()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A020(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "committing uncommitted transation", v1, 2u);
}

void sub_1AFC6A064(uint64_t a1)
{
  IMDSqlOperationErrorDescription(a1);
  sub_1AFBA5FC4(&dword_1AFB53000, v1, v2, "reverting uncommitted transation with error: %@", v3, v4, v5, v6, 2u);
}

void sub_1AFC6A0E0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A188()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A230()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A2D8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A380()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6A428(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A4A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A518(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A590(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A608(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A680(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A6F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A770(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A7E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A860(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A8D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6A950()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6AA08()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6AAC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6AB38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6ABB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6AC28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6ACA0(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = [a1 localizedDescription];
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Sqlite3 Error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC6AD2C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Can't start main timer, we're already profiling", v2, v3, v4, v5, v6);
}

void sub_1AFC6AD60()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Unexpected nil key", v2, v3, v4, v5, v6);
}

void sub_1AFC6AD94()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Main timer not started, can't start timing: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6ADFC()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Trying to start a timing key that is already running: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6AE64()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Main timer not started, can't stop timing: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6AECC()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Spotlight Indexer trying to stop an unknown timing key: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6AF34()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Bailing on profiling but we never started timing", v2, v3, v4, v5, v6);
}

void sub_1AFC6AF68()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Already stopped profiling", v2, v3, v4, v5, v6);
}

void sub_1AFC6AF9C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "ABORTED profiling after error", v2, v3, v4, v5, v6);
}

void sub_1AFC6AFD0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "failed to get a contact with handle %@ to save wallpaper", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC6B048(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "error saving wallpaper to contact: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC6B0C0()
{
  sub_1AFB67AC8();
  _os_log_fault_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_FAULT, "This method should be called on the spotlight queue because it may lead to long blocking of other requests or state corruption.", v1, 2u);
}

void sub_1AFC6B100()
{
  sub_1AFB67AC8();
  _os_log_debug_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_DEBUG, "Skipping donation of message to SmartReplies due to nil text", v1, 2u);
}

void sub_1AFC6B140()
{
  sub_1AFB67AC8();
  sub_1AFBE489C(&dword_1AFB53000, v0, v1, "No Core Spotlight index", v2);
}

void sub_1AFC6B178()
{
  sub_1AFB67AC8();
  sub_1AFBE489C(&dword_1AFB53000, v0, v1, "No Collaboration metadata", v2);
}

void sub_1AFC6B1B0(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Unable to archive collaboration Metadata %@, error %@", (uint8_t *)&v2, 0x16u);
}

void sub_1AFC6B234(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6B2AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6B324(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = 134349826;
  uint64_t v7 = [a1 count];
  __int16 v8 = 2050;
  uint64_t v9 = [a2 count];
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  __int16 v12 = 2112;
  BOOL v13 = a2;
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "Not attempting to index malformed message/chat pair. message dict has %{public}lld entries, chat dict has %{public}lld entries. %@ %@", (uint8_t *)&v6, 0x2Au);
}

void sub_1AFC6B3EC()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Timed out indexing %@, likely have a hung thread, exiting!", v2, v3, v4, v5, v6);
}

void sub_1AFC6B454()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Timed out indexing %@, but an override is set, not exiting!", v2, v3, v4, v5, v6);
}

void sub_1AFC6B4BC()
{
  sub_1AFB67AC8();
  sub_1AFBE489C(&dword_1AFB53000, v0, v1, "Invalid ResolvedURL", v2);
}

void sub_1AFC6B4F4()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Invalid providerID: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6B55C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6B5CC(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1AFB53000, a4, OS_LOG_TYPE_ERROR, "Failed to unarchive Collaboration Metadata: %@. Not indexing this item.", a1, 0xCu);
}

void sub_1AFC6B644(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBE489C(&dword_1AFB53000, v2, (uint64_t)v2, "Collaboration metadata has a nil collaboration identifier, which is needed for key diversification. Not indexing this item.", v3);
}

void sub_1AFC6B674(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBE489C(&dword_1AFB53000, v2, (uint64_t)v2, "Unable to create handshakeController", v3);
}

void sub_1AFC6B6A4(unsigned char *a1, unsigned char *a2)
{
  sub_1AFBCC97C(a1, a2);
  sub_1AFBE489C(&dword_1AFB53000, v2, (uint64_t)v2, "Handshake controller did not respond to the expected selector to generate the identity proof (generateProofForIdentity:collaborationIdentifier:timeout:completion:)", v3);
}

void sub_1AFC6B6D4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  sub_1AFB7CF60();
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain local proof of inclusion: %@", v4, 0xCu);
}

void sub_1AFC6B76C()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "(1/2) Failed to generate searchable chat item with error %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6B7D4()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "(1/2) Failed to generate searchable chat item for chat dictionary %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6B83C()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "(2/2) Failed to generate searchable chat item with error %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6B8A4(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_1AFB67AD4();
  _os_log_error_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_ERROR, "(1/2) Failed to generate searchable chat item for chat GUID %@ dictionary %@", (uint8_t *)&v2, 0x16u);
}

void sub_1AFC6B924(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_1AFB67AD4();
  _os_log_fault_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_FAULT, "Failed to serialize client state with error %@ client state %@", (uint8_t *)&v2, 0x16u);
}

void sub_1AFC6B9A4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  _os_log_fault_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_FAULT, "Failed to fetch client state: %@", v1, 0xCu);
}

void sub_1AFC6BA18()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "failed to save client state with error %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6BA80()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Suspending reindexing for 30 minutes due to error %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6BAE8()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSROSmartRepliesManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight.m", 113, @"Unable to find class %s", "SROSmartRepliesManager");

  __break(1u);
}

void sub_1AFC6BB64(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *SmartRepliesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDCoreSpotlight.m", 112, @"%s", *a1);

  __break(1u);
}

void sub_1AFC6BBE4()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSROSmartRepliesMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight.m", 115, @"Unable to find class %s", "SROSmartRepliesMessage");

  __break(1u);
}

void sub_1AFC6BC60()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getSROSmartRepliesSuggestionRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDCoreSpotlight.m", 114, @"Unable to find class %s", "SROSmartRepliesSuggestionRequest");

  __break(1u);
}

void sub_1AFC6BCDC(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v5 = 138412802;
  uint64_t v6 = v1;
  sub_1AFB67AD4();
  __int16 v7 = v2;
  uint64_t v8 = v3;
  _os_log_error_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_ERROR, "IMDCoreSpotlightIndexSearchableItems: indexing transaction %@ failed with error %@. Using Index %@", (uint8_t *)&v5, 0x20u);
}

void sub_1AFC6BD68(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Not setting syndication identifier because attachment index was not found in attributed body. attachmentGUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC6BDE0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "+[IMDAttachmentSyndicationUtilities _attachmentGUIDIsSyndicatable:syndicationIdentifier:attachmentUTI:attributedB"
       "ody:encodedSyndicationRanges:isCMM:verbose:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "%s Could not derive message part range from attachment GUID %@ (syndicationIdentifier %@)", (uint8_t *)&v3, 0x20u);
}

void sub_1AFC6BE78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Unable to create record for attachment.", v1, 2u);
}

void sub_1AFC6BEBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6BF34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6BFAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C09C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C114(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C18C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C204(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C27C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C2F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C36C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C3E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C45C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C4D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C54C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C5C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C63C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C6B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C72C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C7A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C81C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C894(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6C90C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "CloudSync.message | Update status Query success for: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC6C984(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "CloudSync.message | Query returned an error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1AFC6CA1C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  __int16 v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1AFB53000, a3, OS_LOG_TYPE_ERROR, "CloudSync.message | Failed to update ck_sync_state for recordIDs: %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1AFC6CAD0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1AFB53000, v1, OS_LOG_TYPE_ERROR, "Unable to perform query %@. Error %d", v2, 0x12u);
}

void sub_1AFC6CB54(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "MessageImport failed in ImportBegin", v1, 2u);
}

void sub_1AFC6CB98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6CC10()
{
  sub_1AFB7CF60();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_1AFB67AA8(&dword_1AFB53000, v0, v1, "Failed to add handle: %lld to chat: %lld", v2, v3);
}

void sub_1AFC6CC84()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Failed to create new chat for guid: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6CCEC()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  sub_1AFBEF6F8();
  _os_log_error_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_ERROR, "%s called for chat: %@, but not during import, ignoring", (uint8_t *)v1, 0x16u);
}

void sub_1AFC6CD6C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  sub_1AFBEF6F8();
  _os_log_error_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_ERROR, "%s called for chat: %@, but not during import, ignoring", (uint8_t *)v1, 0x16u);
}

void sub_1AFC6CDEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "MessageImport - IMDImportAttachmentWithPath - empty guid", v1, 2u);
}

void sub_1AFC6CE30()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Could not write attachmentData to path %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6CE98()
{
  sub_1AFBEF6E0();
  sub_1AFB67AA8(&dword_1AFB53000, v0, v1, "Unable to create directories for %@ when saving attachment %@");
}

void sub_1AFC6CF00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6CF78()
{
  sub_1AFB7CF60();
  sub_1AFB7CF6C(&dword_1AFB53000, v0, v1, "Failed to create message for guid: %@", v2, v3, v4, v5, v6);
}

void sub_1AFC6CFE0()
{
  sub_1AFBEF6E0();
  sub_1AFB67AA8(&dword_1AFB53000, v0, v1, "No chat found for guid: %@   failing message import for GUID: %@");
}

void sub_1AFC6D048(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC6D0C0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Couldn't find request identifier or payload URL. This is going to cause responses from the notification to fail!", v1, 2u);
}

void sub_1AFC6D104()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D1AC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D254()
{
  [NSString stringWithFormat:@"Sqlite database path is nil"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D2FC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D3A4(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 136315906;
  *(void *)(buf + 4) = "_MessagesRecordStore";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "CSDBThreadedRecordStoreRef IMDSharedThreadedRecordStore(void)";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 143;
  *((_WORD *)buf + 14) = 2112;
  *(void *)(buf + 3xpc_dictionary_set_int64(xdict, "unread_count_cache", 0) = a1;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", buf, 0x26u);
}

void sub_1AFC6D424()
{
  [NSString stringWithFormat:@"CSDBCreateThreadedRecordStore failed"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D4CC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D574()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D61C()
{
  [NSString stringWithFormat:@"recordStore is nil, will not initialize"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D6C4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D76C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D814()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D8BC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6D964()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No valid database handle, cannot perform a clean", v2, v3, v4, v5, v6);
}

void sub_1AFC6D998(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Creating triggers for %p after db init failed: %@", buf, 0x16u);
}

void sub_1AFC6D9F0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6DA98()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6DB40(NSObject *a1, double a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  int v5 = 134217984;
  double v6 = v4 - a2;
  _os_log_error_impl(&dword_1AFB53000, a1, OS_LOG_TYPE_ERROR, "Message's DB migration took %f seconds.", (uint8_t *)&v5, 0xCu);
}

void sub_1AFC6DBE4(int *a1, id *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *a1;
  if (*a2) {
    int v5 = (__CFString *)[*a2 localizedDescription];
  }
  else {
    int v5 = &stru_1F084E970;
  }
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  __int16 v8 = v5;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Migration failed, made it to version: %d: error: %@", (uint8_t *)v6, 0x12u);
}

void sub_1AFC6DC94()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Message database migration passed post migrate integrity check", v2, v3, v4, v5, v6);
}

void sub_1AFC6DCC8()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Message database migration failed post migrate integrity check", v2, v3, v4, v5, v6);
}

void sub_1AFC6DCFC()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Message database migration failed - Database integrity check failed", v2, v3, v4, v5, v6);
}

void sub_1AFC6DD30(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 18017;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Beginning migration.  The SMS db is currently at v%d, upgrading to v%d.", (uint8_t *)v2, 0xEu);
}

void sub_1AFC6DDC0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6DE68()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6DF10()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Database Post Vacuuming integrity checked failed failed", v2, v3, v4, v5, v6);
}

void sub_1AFC6DF44(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Database Vacuuming failed with SQLite result: %d", (uint8_t *)v2, 8u);
}

void sub_1AFC6DFBC(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Database Reindexing the DB failed with SQLite result: %d", (uint8_t *)v2, 8u);
}

void sub_1AFC6E034()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E0DC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E184()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E22C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E2D4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E37C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E424()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E4CC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E574()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E61C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E6C4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E76C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E814()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E8BC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6E964()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6EA0C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6EAB4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6EB5C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6EC04()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6ECAC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6ED54()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6EDFC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1AFBE489C(&dword_1AFB53000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage got a bogus message to send...bailing!", v3);
}

void sub_1AFC6EE38(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1AFBE489C(&dword_1AFB53000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage: You should not be hitting the database in a unit test. Please check your dependencies", v3);
}

void sub_1AFC6EE74(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1AFBE489C(&dword_1AFB53000, a1, a3, "__syncXPCIMDMessageStoreSendXPCMessage failed too many times...bailing!", v3);
}

void sub_1AFC6EEB0(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1AFBE489C(&dword_1AFB53000, a3, (uint64_t)a3, "__syncXPCIMDMessageStoreSendXPCMessage failed several consecutive times - sleeping for 1+ the launchd throttle time.", a1);
}

void sub_1AFC6EEE8(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1AFBE489C(&dword_1AFB53000, a3, (uint64_t)a3, "__syncXPCIMDMessageStoreSendXPCMessage failed to copy the xpc_connection_t!", a1);
}

void sub_1AFC6EF20(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "FAFetchFamilyCircleRequest failed %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC6EF98(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FamilyCircleLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDFamilyInviteNotificationContext.m", 22, @"%s", *a1);

  __break(1u);
}

void sub_1AFC6F018()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFAFetchFamilyCircleRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDFamilyInviteNotificationContext.m", 23, @"Unable to find class %s", "FAFetchFamilyCircleRequest");

  __break(1u);
}

void sub_1AFC6F094(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F11C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Failed to remove entries from chat_message_join: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F1A4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Insert to recoverable message table failed. Error : %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F22C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Selecting the guid failed with error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F2B4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F33C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Failed to remove entries from chat_recoverable_message_join: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F3C4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 localizedDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1AFB53000, a4, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed to add chat entry to unsynced_removed_recoverable_messages: %@", a1, 0xCu);
}

void sub_1AFC6F43C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "Recently Deleted | Insert to chat message table failed for chat guid %@: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC6F4DC(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "Recently Deleted | Failed to finish query for messages to be restored in chat %@: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC6F57C()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1AFB7CF60();
  _os_log_error_impl(&dword_1AFB53000, v0, OS_LOG_TYPE_ERROR, "Recently Deleted | Cannot recover: Could not find attributed body for messageGUID: %@", v1, 0xCu);
}

void sub_1AFC6F5F0(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "Recently Deleted | Failed to update attributedbody for messageGUID: %@ with error: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC6F68C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Failed to remove entries from recoverable message part: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F710(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "Recently Deleted | Failed to add entries into unsynced_removed_recoverable_messages: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F794(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)long long buf = 138412290;
  *a3 = v4;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "Recently Deleted | attributedBodyPart is nil for message guid %@", buf, 0xCu);
}

void sub_1AFC6F7E8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1AFB7CF60();
  sub_1AFBA5FC4(&dword_1AFB53000, v2, v3, "CloudSync.chat | Query returned an error: %@", v4, v5, v6, v7, v8);
}

void sub_1AFC6F86C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_1AFBA5FB4();
  sub_1AFB914C4(&dword_1AFB53000, v3, v4, "CloudSync.chat | Failed to update ck_sync_state for recordIDs: %@ with error: %@", v5, v6, v7, v8, 2u);
}

void sub_1AFC6F908(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "No migration block to execute!", v1, 2u);
}

void sub_1AFC6F94C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 80);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Migration failed, made it to version: %d", (uint8_t *)v3, 8u);
}

void sub_1AFC6F9C8(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 18017;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Migration unsupported.  The SMS db is currently at v%d, cannot upgrade to v%d.", (uint8_t *)v2, 0xEu);
}

void sub_1AFC6FA58()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FB00()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FBA8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FC50()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FCF8()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No roomname or service specified. No rows will be returned.", v2, v3, v4, v5, v6);
}

void sub_1AFC6FD2C(uint64_t a1, _DWORD *a2)
{
  *a2 = 136315906;
  sub_1AFC29470((uint64_t)a2, (uint64_t)"results");
  sub_1AFC29460(v2, (uint64_t)"CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier(CFArrayRef, CFArrayRef, CFStringRef, CFStringRef, Boolean, Boolean, int64_t)");
  sub_1AFC2944C(v3, v4, 1378);
  sub_1AFC29434(&dword_1AFB53000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1AFC6FD88()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No handles or services specified. Or handleCount != serviceCount. No rows will be returned.", v2, v3, v4, v5, v6);
}

void sub_1AFC6FDBC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FE64()
{
  [NSString stringWithFormat:@"history query:"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FF0C()
{
  [NSString stringWithFormat:@"history query: rowID should be > 0"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC6FFB4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC7005C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUID No handles or services specified for loading a limited number of messages up to guid. No rows will be returned", v2, v3, v4, v5, v6);
}

void sub_1AFC70090()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70138(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"Paged history query with numberOfMessagesBefore: %lld numberOfMessagesAfter: %lld", *(void *)(a1 + 40), *(void *)(a1 + 48));
  int v4 = 136315906;
  uint64_t v5 = "firstLoadResults";
  __int16 v6 = 2080;
  uint64_t v7 = "CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifie"
       "r(CFArrayRef, CFArrayRef, CFStringRef, int64_t, int64_t, CFStringRef, Boolean *, Boolean *)_block_invoke_2";
  __int16 v8 = 1024;
  sub_1AFB85FA0();
  sub_1AFC29434(&dword_1AFB53000, a2, v3, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", (uint8_t *)&v4);
}

void sub_1AFC70204()
{
  [NSString stringWithFormat:@"Paged history query: rowID should be > 0"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC702AC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70354(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(NSString, "stringWithFormat:", @"Paged history query with numberOfMessagesAfter: %lld for second load", *(void *)(a1 + 40));
  int v4 = 136315906;
  uint64_t v5 = "secondLoadResults";
  __int16 v6 = 2080;
  uint64_t v7 = "CFArrayRef IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifie"
       "r(CFArrayRef, CFArrayRef, CFStringRef, int64_t, int64_t, CFStringRef, Boolean *, Boolean *)_block_invoke_2";
  __int16 v8 = 1024;
  sub_1AFB85FA0();
  sub_1AFC29434(&dword_1AFB53000, a2, v3, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", (uint8_t *)&v4);
}

void sub_1AFC70420()
{
  [NSString stringWithFormat:@"Paged history query: rowID should be > 0 for second load"];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Condition is unexpectedly true: %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC704C8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70570()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No handles or services specified. Or handleCount != serviceCount. Or guidCount == 0. No rows will be returned.", v2, v3, v4, v5, v6);
}

void sub_1AFC705A4()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No handle or service specified. No rows will be returned.", v2, v3, v4, v5, v6);
}

void sub_1AFC705D8(uint64_t a1, _DWORD *a2)
{
  *a2 = 136315906;
  sub_1AFC29470((uint64_t)a2, (uint64_t)"query");
  sub_1AFC29460(v2, (uint64_t)"IMDMessageRecordRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs(CFStringRef, CFStringRef, CFArrayRef, CFArrayRef, NSTimeInterval)");
  sub_1AFC2944C(v3, v4, 2258);
  sub_1AFC29434(&dword_1AFB53000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1AFC70634(uint64_t a1, _DWORD *a2)
{
  *a2 = 136315906;
  sub_1AFC29470((uint64_t)a2, (uint64_t)"query");
  sub_1AFC29460(v2, (uint64_t)"IMDMessageRecordRef IMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID(CFStringRef, CFStringRef, CFStringRef, BOOL, CFStringRef, NSTimeInterval)");
  sub_1AFC2944C(v3, v4, 2308);
  sub_1AFC29434(&dword_1AFB53000, v5, (uint64_t)v5, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v6);
}

void sub_1AFC70690()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Can't determine unread count when GUID is NULL or empty.", v2, v3, v4, v5, v6);
}

void sub_1AFC706C4()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Can't determine unplayed audio messages GUID is NULL or empty.", v2, v3, v4, v5, v6);
}

void sub_1AFC706F8()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No addresses to lookup, no results for you.", v2, v3, v4, v5, v6);
}

void sub_1AFC7072C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "No addresses provided to IMDMessageRecordCopyMostRecentUseageOfAddresses().", v2, v3, v4, v5, v6);
}

void sub_1AFC70760(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "Unable to select rows from Message Deleted Messages Table: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1AFC707DC(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "IMDMessageRecordCalculateLocalCloudKitStatistics failed with error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1AFC7086C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "We don't have a guid to find messages with this reply to guid", v2, v3, v4, v5, v6);
}

void sub_1AFC708A0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70948()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Highlight Server Date is nil!", v2, v3, v4, v5, v6);
}

void sub_1AFC7097C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Unexpected nil attribute set", v2, v3, v4, v5, v6);
}

void sub_1AFC709B0()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "messageDate was distant past. Not setting contentCreationDate on attributesToUpdate.", v2, v3, v4, v5, v6);
}

void sub_1AFC709E4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AFB53000, a2, OS_LOG_TYPE_ERROR, "No CKBundleIDs found for URL with messageGUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1AFC70A5C()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "creationDate was distant past. Not setting contentCreationDate on attributesToUpdate.", v2, v3, v4, v5, v6);
}

void sub_1AFC70A90()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Failed to get a collaboration identifier for URL hence setting message to be shared only in SWY", v2, v3, v4, v5, v6);
}

void sub_1AFC70AC4(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *LinkPresentationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"IMDSharedWithYouMetadataManager.m", 53, @"%s", *a1);

  __break(1u);
}

void sub_1AFC70B44()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getLPLinkMetadataSharedWithYouTransformerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"IMDSharedWithYouMetadataManager.m", 54, @"Unable to find class %s", "LPLinkMetadataSharedWithYouTransformer");

  __break(1u);
}

void sub_1AFC70BC0(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446466;
  uint64_t v2 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
  __int16 v3 = 1024;
  int v4 = 5;
  _os_log_fault_impl(&dword_1AFB53000, log, OS_LOG_TYPE_FAULT, "%{public}s Failed to inspect client state %d times - giving up", (uint8_t *)&v1, 0x12u);
}

void sub_1AFC70C54()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70D08()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70DB0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70E58()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70F0C()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC70FB4()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71068()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71110()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC711B8()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71260()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71314()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC713BC()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71470()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71518()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC715C0()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFC460C8();
  sub_1AFC460B8();
  sub_1AFC460A4();
  sub_1AFC46084(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: Conditions are unexpectedly equal: %s == %s in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC71674()
{
  [NSString stringWithFormat:&stru_1F084E970];
  sub_1AFB69024();
  sub_1AFB69014();
  sub_1AFB69000();
  sub_1AFB68FE0(&dword_1AFB53000, v0, v1, "ASSERTION FAILED: %s is unexpectedly nil in \"%s\" at line %d [%@]", v2, v3, v4, v5, 2u);
}

void sub_1AFC7171C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC71788()
{
  sub_1AFB67AC8();
  sub_1AFB67A8C(&dword_1AFB53000, v0, v1, "Could not initialize query.", v2, v3, v4, v5, v6);
}

void sub_1AFC717BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC71828(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC71898(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1AFC71908(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "TRIGGER: custom function is already executing -- this is not reentrant!", v1, 2u);
}

void sub_1AFC7194C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1AFB53000, log, OS_LOG_TYPE_FAULT, "This method should not be called on the database thread because it may lead to egregiously long blocking of other requests.", v1, 2u);
}

void sub_1AFC71990(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1AFB53000, log, OS_LOG_TYPE_FAULT, "This method should not be called off the database thread because it may lead to threading issues and database corruption.", v1, 2u);
}

void sub_1AFC719D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AFB53000, log, OS_LOG_TYPE_ERROR, "IMDCNPersonAliasResolver: Error! Contact Store failed to get initialized!", v1, 2u);
}

uint64_t sub_1AFC71A18()
{
  return MEMORY[0x1F40E31C0]();
}

uint64_t sub_1AFC71A28()
{
  return MEMORY[0x1F40E31D8]();
}

uint64_t sub_1AFC71A38()
{
  return MEMORY[0x1F40E3258]();
}

uint64_t sub_1AFC71A48()
{
  return MEMORY[0x1F40E3278]();
}

uint64_t sub_1AFC71A58()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1AFC71A68()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1AFC71A78()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1AFC71A88()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1AFC71A98()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1AFC71AA8()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1AFC71AB8()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t sub_1AFC71AC8()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1AFC71AD8()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1AFC71AE8()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1AFC71AF8()
{
  return MEMORY[0x1F40E4E58]();
}

uint64_t sub_1AFC71B08()
{
  return MEMORY[0x1F40E4E68]();
}

uint64_t sub_1AFC71B18()
{
  return MEMORY[0x1F40E4EE8]();
}

uint64_t sub_1AFC71B28()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_1AFC71B38()
{
  return MEMORY[0x1F40E51E0]();
}

uint64_t sub_1AFC71B48()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t sub_1AFC71B58()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t _s14IMDPersistence0A10HelloWorldV13printGreetingyyF_0()
{
  return MEMORY[0x1F4123C58]();
}

uint64_t _s14IMDPersistence0A10HelloWorldVACycfC_0()
{
  return MEMORY[0x1F4123C60]();
}

uint64_t sub_1AFC71B88()
{
  return MEMORY[0x1F4123C68]();
}

uint64_t sub_1AFC71B98()
{
  return MEMORY[0x1F4123C70]();
}

uint64_t sub_1AFC71BA8()
{
  return MEMORY[0x1F4123C78]();
}

uint64_t sub_1AFC71BB8()
{
  return MEMORY[0x1F4123E08]();
}

uint64_t sub_1AFC71BC8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1AFC71BD8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1AFC71BE8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1AFC71BF8()
{
  return MEMORY[0x1F410AB78]();
}

uint64_t sub_1AFC71C08()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t sub_1AFC71C18()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1AFC71C28()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1AFC71C38()
{
  return MEMORY[0x1F4186D38]();
}

uint64_t sub_1AFC71C48()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1AFC71C58()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t sub_1AFC71C68()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t sub_1AFC71C78()
{
  return MEMORY[0x1F4186F00]();
}

uint64_t sub_1AFC71C88()
{
  return MEMORY[0x1F410AB90]();
}

uint64_t sub_1AFC71C98()
{
  return MEMORY[0x1F410AB98]();
}

uint64_t sub_1AFC71CA8()
{
  return MEMORY[0x1F410ABA0]();
}

uint64_t sub_1AFC71CB8()
{
  return MEMORY[0x1F410ABA8]();
}

uint64_t sub_1AFC71CC8()
{
  return MEMORY[0x1F410ABB8]();
}

uint64_t sub_1AFC71CD8()
{
  return MEMORY[0x1F410ABC0]();
}

uint64_t sub_1AFC71CE8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1AFC71CF8()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1AFC71D08()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1AFC71D18()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1AFC71D28()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1AFC71D38()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1AFC71D48()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1AFC71D58()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1AFC71D68()
{
  return MEMORY[0x1F40E6350]();
}

uint64_t sub_1AFC71D78()
{
  return MEMORY[0x1F40E6358]();
}

uint64_t sub_1AFC71D88()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1AFC71D98()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1AFC71DB8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1AFC71DC8()
{
  return MEMORY[0x1F40E6510]();
}

uint64_t sub_1AFC71DD8()
{
  return MEMORY[0x1F40E6588]();
}

uint64_t sub_1AFC71DE8()
{
  return MEMORY[0x1F40E65B0]();
}

uint64_t sub_1AFC71DF8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1AFC71E08()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1AFC71E18()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1AFC71E28()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t sub_1AFC71E38()
{
  return MEMORY[0x1F4186FF8]();
}

uint64_t sub_1AFC71E48()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t sub_1AFC71E58()
{
  return MEMORY[0x1F41870D0]();
}

uint64_t sub_1AFC71E68()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t sub_1AFC71E78()
{
  return MEMORY[0x1F40D4AA0]();
}

uint64_t sub_1AFC71E88()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1AFC71E98()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1AFC71EA8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1AFC71EB8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1AFC71EC8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1AFC71ED8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1AFC71EE8()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1AFC71EF8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1AFC71F08()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1AFC71F18()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1AFC71F28()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1AFC71F38()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1AFC71F48()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1AFC71F58()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1AFC71F68()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1AFC71F78()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1AFC71F88()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1AFC71F98()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t sub_1AFC71FA8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1AFC71FB8()
{
  return MEMORY[0x1F4185EF8]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x1F4114C18]();
}

uint64_t CSDBCreateThreadedRecordStore()
{
  return MEMORY[0x1F4114C20]();
}

uint64_t CSDBCreateUTF8StringFromCFString()
{
  return MEMORY[0x1F4114C28]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x1F4114C38]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x1F4114C40]();
}

uint64_t CSDBPerformBlock()
{
  return MEMORY[0x1F4114C48]();
}

uint64_t CSDBPerformBlockAfterDelay()
{
  return MEMORY[0x1F4114C50]();
}

uint64_t CSDBPerformLockedSectionForQueryForReading()
{
  return MEMORY[0x1F4114C58]();
}

uint64_t CSDBRecordCopyProperty()
{
  return MEMORY[0x1F4114C60]();
}

uint64_t CSDBRecordCreate()
{
  return MEMORY[0x1F4114C68]();
}

uint64_t CSDBRecordGetID()
{
  return MEMORY[0x1F4114C70]();
}

uint64_t CSDBRecordGetProperty()
{
  return MEMORY[0x1F4114C78]();
}

uint64_t CSDBRecordIndexOfPropertyNamed()
{
  return MEMORY[0x1F4114C80]();
}

uint64_t CSDBRecordInvalidateRecord()
{
  return MEMORY[0x1F4114C88]();
}

uint64_t CSDBRecordSaveStore()
{
  return MEMORY[0x1F4114C90]();
}

uint64_t CSDBRecordSetProperty()
{
  return MEMORY[0x1F4114C98]();
}

uint64_t CSDBRecordStoreAddRecord()
{
  return MEMORY[0x1F4114CA0]();
}

uint64_t CSDBRecordStoreCopyInstanceOfClassWithUID()
{
  return MEMORY[0x1F4114CA8]();
}

uint64_t CSDBRecordStoreCreateTablesForClass()
{
  return MEMORY[0x1F4114CB0]();
}

uint64_t CSDBRecordStoreGetDatabase()
{
  return MEMORY[0x1F4114CB8]();
}

uint64_t CSDBRecordStoreGetSequenceNumber()
{
  return MEMORY[0x1F4114CC0]();
}

uint64_t CSDBRecordStoreInvalidateCachesWithStore()
{
  return MEMORY[0x1F4114CC8]();
}

uint64_t CSDBRecordStoreProcessStatement()
{
  return MEMORY[0x1F4114CD0]();
}

uint64_t CSDBRecordStoreRefFromThreadedRecordStoreRef()
{
  return MEMORY[0x1F4114CD8]();
}

uint64_t CSDBRecordStoreRemoveRecord()
{
  return MEMORY[0x1F4114CE0]();
}

uint64_t CSDBRegisterReconnectBlockWithIdentifier()
{
  return MEMORY[0x1F4114CE8]();
}

uint64_t CSDBSetCorruptedDatabaseHandler()
{
  return MEMORY[0x1F4114CF0]();
}

uint64_t CSDBSqliteBackupDatabase()
{
  return MEMORY[0x1F4114CF8]();
}

uint64_t CSDBSqliteBindBlobFromCFData()
{
  return MEMORY[0x1F4114D00]();
}

uint64_t CSDBSqliteBindInt()
{
  return MEMORY[0x1F4114D08]();
}

uint64_t CSDBSqliteBindInt64()
{
  return MEMORY[0x1F4114D10]();
}

uint64_t CSDBSqliteBindNull()
{
  return MEMORY[0x1F4114D18]();
}

uint64_t CSDBSqliteBindTextFromCFArrayOfCFStrings()
{
  return MEMORY[0x1F4114D20]();
}

uint64_t CSDBSqliteBindTextFromCFString()
{
  return MEMORY[0x1F4114D28]();
}

uint64_t CSDBSqliteConnectionBeginTransactionType()
{
  return MEMORY[0x1F4114D30]();
}

uint64_t CSDBSqliteConnectionCommit()
{
  return MEMORY[0x1F4114D38]();
}

uint64_t CSDBSqliteConnectionIntegerForProperty()
{
  return MEMORY[0x1F4114D40]();
}

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x1F4114D48]();
}

uint64_t CSDBSqliteConnectionRowidOfLastInsert()
{
  return MEMORY[0x1F4114D50]();
}

uint64_t CSDBSqliteConnectionSetIntegerForProperty()
{
  return MEMORY[0x1F4114D58]();
}

uint64_t CSDBSqliteConnectionSetValueForProperty()
{
  return MEMORY[0x1F4114D60]();
}

uint64_t CSDBSqliteConnectionStatementForSQL()
{
  return MEMORY[0x1F4114D68]();
}

uint64_t CSDBSqliteDatabaseCheckIntegrity()
{
  return MEMORY[0x1F4114D70]();
}

uint64_t CSDBSqliteDatabaseConnectionForReading()
{
  return MEMORY[0x1F4114D78]();
}

uint64_t CSDBSqliteDatabaseConnectionForWriting()
{
  return MEMORY[0x1F4114D80]();
}

uint64_t CSDBSqliteDatabaseCopyValueForProperty()
{
  return MEMORY[0x1F4114D88]();
}

uint64_t CSDBSqliteDatabaseFromThreadedRecordStoreRef()
{
  return MEMORY[0x1F4114D90]();
}

uint64_t CSDBSqliteDatabasePath()
{
  return MEMORY[0x1F4114D98]();
}

uint64_t CSDBSqliteDatabaseRegisterFunctionForDB()
{
  return MEMORY[0x1F4114DA0]();
}

uint64_t CSDBSqliteDatabaseReleaseSqliteConnection()
{
  return MEMORY[0x1F4114DA8]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x1F4114DB0]();
}

uint64_t CSDBSqliteDatabaseStatementForReading()
{
  return MEMORY[0x1F4114DB8]();
}

uint64_t CSDBSqliteDatabaseStatementForWriting()
{
  return MEMORY[0x1F4114DC0]();
}

uint64_t CSDBSqliteDatabaseVacuum()
{
  return MEMORY[0x1F4114DC8]();
}

uint64_t CSDBSqliteDeleteDatabase()
{
  return MEMORY[0x1F4114DD0]();
}

uint64_t CSDBSqliteStatementCopyDataResult()
{
  return MEMORY[0x1F4114DE0]();
}

uint64_t CSDBSqliteStatementInteger64Result()
{
  return MEMORY[0x1F4114DE8]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x1F4114DF0]();
}

uint64_t CSDBSqliteStatementIntegerResult()
{
  return MEMORY[0x1F4114DF8]();
}

uint64_t CSDBSqliteStatementPerform()
{
  return MEMORY[0x1F4114E00]();
}

uint64_t CSDBSqliteStatementReset()
{
  return MEMORY[0x1F4114E08]();
}

uint64_t CSDBSqliteStep()
{
  return MEMORY[0x1F4114E10]();
}

uint64_t CSDBSqliteStepWithConnection()
{
  return MEMORY[0x1F4114E18]();
}

uint64_t CSDBSqliteUtilitiesGetSchemaVersionAtPathWithProtection()
{
  return MEMORY[0x1F4114E20]();
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection()
{
  return MEMORY[0x1F4114E28]();
}

uint64_t CSDBThreadedRecordStoreOwnsCurrentThread()
{
  return MEMORY[0x1F4114E30]();
}

uint64_t CSDBThreadedRecordStoreRegisterClass()
{
  return MEMORY[0x1F4114E38]();
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase()
{
  return MEMORY[0x1F4114E40]();
}

uint64_t IMAdditionalContactsLoggingEnabled()
{
  return MEMORY[0x1F4123EB8]();
}

uint64_t IMAllowMessagesIniCloud()
{
  return MEMORY[0x1F4123EC0]();
}

uint64_t IMAttachmentEmojiImagePreviewFileURL()
{
  return MEMORY[0x1F4123EE0]();
}

uint64_t IMAttachmentPreviewFileURL()
{
  return MEMORY[0x1F4123EF0]();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x1F4123F30]();
}

uint64_t IMBrowserSnapshotCacheDirectoryURL()
{
  return MEMORY[0x1F4123F58]();
}

uint64_t IMCMMAssetIndexFromIMFileTransferGUID()
{
  return MEMORY[0x1F4123F68]();
}

uint64_t IMCSIndexReasonFromIMIndexReason()
{
  return MEMORY[0x1F4123F70]();
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x1F4123F78]();
}

uint64_t IMCanonicalizeFormattedString()
{
  return MEMORY[0x1F4123678]();
}

uint64_t IMComponentsFromChatGUID()
{
  return MEMORY[0x1F4123688]();
}

uint64_t IMCopyGUIDForChat()
{
  return MEMORY[0x1F4123698]();
}

uint64_t IMCountryCodeForIncomingTextMessage()
{
  return MEMORY[0x1F41236C0]();
}

uint64_t IMCountryCodeForNumber()
{
  return MEMORY[0x1F41236C8]();
}

uint64_t IMCreateDictionaryFromXPCObjectWithStandardAllowlist()
{
  return MEMORY[0x1F41236D0]();
}

uint64_t IMCreateXPCObjectFromDictionary()
{
  return MEMORY[0x1F41236E8]();
}

uint64_t IMDAuditTokenTaskCopyValuesForEntitlements()
{
  return MEMORY[0x1F41236F8]();
}

uint64_t IMDDScanAttributedStringWithExtendedContext()
{
  return MEMORY[0x1F4123710]();
}

uint64_t IMDDatabaseTelemetryLogHandle()
{
  return MEMORY[0x1F4124040]();
}

uint64_t IMDictionaryFromPayloadData()
{
  return MEMORY[0x1F4124058]();
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x1F4123718]();
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x1F4123728]();
}

uint64_t IMFileSizeForItemAtPath()
{
  return MEMORY[0x1F41240A8]();
}

uint64_t IMFileTransferAttributionInfoHasLegacyState()
{
  return MEMORY[0x1F41240B0]();
}

uint64_t IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex()
{
  return MEMORY[0x1F41240B8]();
}

uint64_t IMFileTransferGUIDIsTemporary()
{
  return MEMORY[0x1F41240D8]();
}

uint64_t IMFileTransferPreviewGenerationStateWithStoredState()
{
  return MEMORY[0x1F41240E0]();
}

uint64_t IMFormattedDisplayStringForNumber()
{
  return MEMORY[0x1F4123748]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x1F4123780]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x1F4123788]();
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1F4123790]();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return MEMORY[0x1F41237A8]();
}

uint64_t IMGetDomainBoolForKey()
{
  return MEMORY[0x1F41237B8]();
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue()
{
  return MEMORY[0x1F41237C0]();
}

uint64_t IMGetDomainIntForKey()
{
  return MEMORY[0x1F41237C8]();
}

uint64_t IMGetDomainValueForKey()
{
  return MEMORY[0x1F41237D0]();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return MEMORY[0x1F4123810]();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return MEMORY[0x1F4123818]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x1F4123820]();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return MEMORY[0x1F4123828]();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x1F4123830]();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x1F4123838]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x1F4123840]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x1F4123848]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x1F4123858]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x1F4123860]();
}

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return MEMORY[0x1F4123868]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x1F4123870]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x1F4123878]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x1F4123880]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x1F4123888]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x1F4123890]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x1F4123898]();
}

uint64_t IMInternationalForPhoneNumberWithOptions()
{
  return MEMORY[0x1F41238A0]();
}

uint64_t IMIsRunningInUnitTesting()
{
  return MEMORY[0x1F41241E8]();
}

uint64_t IMIsStringStewieEmergency()
{
  return MEMORY[0x1F4124210]();
}

uint64_t IMIsStringStewieRoadside()
{
  return MEMORY[0x1F4124218]();
}

uint64_t IMIsSupportedUTIType()
{
  return MEMORY[0x1F4124220]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x1F4124230]();
}

uint64_t IMMentionContactKeysForMe()
{
  return MEMORY[0x1F4124240]();
}

uint64_t IMMentionMeTokensForContact()
{
  return MEMORY[0x1F4124248]();
}

uint64_t IMMessageCreateAssociatedMessageGUIDFromThreadIdentifier()
{
  return MEMORY[0x1F4124250]();
}

uint64_t IMMessageCreateThreadIdentifierWithComponents()
{
  return MEMORY[0x1F4124258]();
}

uint64_t IMMessageGuidFromIMFileTransferGuid()
{
  return MEMORY[0x1F4124268]();
}

uint64_t IMMessageThreadIdentifierGetComponents()
{
  return MEMORY[0x1F41242A0]();
}

uint64_t IMMessagesDatabaseURL()
{
  return MEMORY[0x1F41242C8]();
}

uint64_t IMNicknameUnarchivingClasses()
{
  return MEMORY[0x1F41242D8]();
}

uint64_t IMNormalizeFormattedString()
{
  return MEMORY[0x1F4123948]();
}

uint64_t IMNormalizePhoneNumber()
{
  return MEMORY[0x1F41242E0]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x1F4123960]();
}

uint64_t IMPluginSnapshotCachesFileURL()
{
  return MEMORY[0x1F41242E8]();
}

uint64_t IMPreviewCachesDirectoryWithAttachmentURL()
{
  return MEMORY[0x1F41242F8]();
}

uint64_t IMPreviewExtension()
{
  return MEMORY[0x1F4124318]();
}

uint64_t IMProcessGameCenterMessageWithPayloadData()
{
  return MEMORY[0x1F4124320]();
}

uint64_t IMProcessNameForPid()
{
  return MEMORY[0x1F4123998]();
}

uint64_t IMProcessPeerPaymentMessageWithPayloadData()
{
  return MEMORY[0x1F4124328]();
}

uint64_t IMProcessPhotosExtensionMessageWithPayloadData()
{
  return MEMORY[0x1F4124330]();
}

uint64_t IMProcessRichLinkMessageWithBody()
{
  return MEMORY[0x1F4124338]();
}

uint64_t IMSHA1HashFromStrings()
{
  return MEMORY[0x1F4124350]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x1F4124380]();
}

uint64_t IMSanitizedAppNameForIMExtensionPayloadUserInfoKey()
{
  return MEMORY[0x1F4124390]();
}

uint64_t IMSanitizedCaptionForIMExtensionPayloadUserInfoKey()
{
  return MEMORY[0x1F4124398]();
}

uint64_t IMSanitizedURLForIMExtensionPayloadURLKey()
{
  return MEMORY[0x1F41243A8]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x1F41239F8]();
}

uint64_t IMSetDomainIntForKey()
{
  return MEMORY[0x1F4123A00]();
}

uint64_t IMSetDomainValueForKey()
{
  return MEMORY[0x1F4123A08]();
}

uint64_t IMSharedHelperCachePathForStickerWithProperties()
{
  return MEMORY[0x1F4124418]();
}

uint64_t IMSharedHelperCatalystNotificationDisabled()
{
  return MEMORY[0x1F4124420]();
}

uint64_t IMSharedHelperCombinedPluginPayloadDictionaryDataWithAttachmentURLs()
{
  return MEMORY[0x1F4124430]();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return MEMORY[0x1F4124448]();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return MEMORY[0x1F4124460]();
}

uint64_t IMSharedHelperExternalLocationForFile()
{
  return MEMORY[0x1F4124478]();
}

uint64_t IMSharedHelperPathIsInStickerCache()
{
  return MEMORY[0x1F41244D8]();
}

uint64_t IMSharedHelperPayloadFromCombinedPluginPayloadData()
{
  return MEMORY[0x1F41244E0]();
}

uint64_t IMSharedHelperPersistMergeID()
{
  return MEMORY[0x1F41244E8]();
}

uint64_t IMSharedHelperSpotlightIndexingPreference()
{
  return MEMORY[0x1F4124518]();
}

uint64_t IMSharedMessageSummaryCreateWithShortName()
{
  return MEMORY[0x1F4124538]();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return MEMORY[0x1F4124540]();
}

uint64_t IMShouldAllowInteractionlessUsageOfUTITypeWithPreviewGenerationState()
{
  return MEMORY[0x1F4124548]();
}

uint64_t IMStickerCacheDirectoryURL()
{
  return MEMORY[0x1F4124570]();
}

uint64_t IMStringFromCKSyncState()
{
  return MEMORY[0x1F4124590]();
}

uint64_t IMStringFromTransferState()
{
  return MEMORY[0x1F41245F8]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x1F4123A40]();
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x1F4123A48]();
}

uint64_t IMStringIsEmpty()
{
  return MEMORY[0x1F4123A58]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x1F4123A70]();
}

uint64_t IMStringIsStewie()
{
  return MEMORY[0x1F4123A80]();
}

uint64_t IMSubmitSimpleAggegateMetric()
{
  return MEMORY[0x1F4123AA0]();
}

uint64_t IMSupportsUserNotifications()
{
  return MEMORY[0x1F4124618]();
}

uint64_t IMUTITypeForExtension()
{
  return MEMORY[0x1F4124658]();
}

uint64_t IMUTITypeForFilename()
{
  return MEMORY[0x1F4124660]();
}

uint64_t IMUTITypeIsFileAttachment()
{
  return MEMORY[0x1F4124670]();
}

uint64_t IMUTITypeIsSupportedByPhotos()
{
  return MEMORY[0x1F4124680]();
}

uint64_t IMUTTypeIsAudio()
{
  return MEMORY[0x1F4124698]();
}

uint64_t IMUTTypeIsCalendar()
{
  return MEMORY[0x1F41246A0]();
}

uint64_t IMUTTypeIsImage()
{
  return MEMORY[0x1F41246B0]();
}

uint64_t IMUTTypeIsMap()
{
  return MEMORY[0x1F41246B8]();
}

uint64_t IMUTTypeIsMovie()
{
  return MEMORY[0x1F41246C0]();
}

uint64_t IMUTTypeIsPass()
{
  return MEMORY[0x1F41246C8]();
}

uint64_t IMUTTypeIsSupportedScreenshot()
{
  return MEMORY[0x1F41246D8]();
}

uint64_t IMUTTypeIsVCard()
{
  return MEMORY[0x1F41246E0]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4123AF0]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1F4123AF8]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x1F4123B00]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x1F4123B08]();
}

uint64_t JWDecodeArray()
{
  return MEMORY[0x1F4123B50]();
}

uint64_t JWDecodeCodableObjectWithStandardAllowlist()
{
  return MEMORY[0x1F4123B58]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x1F4123B60]();
}

uint64_t JWEncodeCodableObject()
{
  return MEMORY[0x1F4123B68]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x1F4123B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromIMCoreSpotlightIndexReason()
{
  return MEMORY[0x1F4124720]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x1F4123B88]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x1F4123B90]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1F40D8E18]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1F40D8EA8]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1F40D8EB8]();
}

uint64_t _CFRuntimeBridgeClasses()
{
  return MEMORY[0x1F40D90C8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1F40D91E0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x1F4123BB8]();
}

uint64_t _IMStringStrippingControlCharacters()
{
  return MEMORY[0x1F4124730]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x1F4123C00]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x1F4123C08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x1F4182150](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x1F41864F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEA70](xarray, index);
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA80](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1F40CEF18]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}