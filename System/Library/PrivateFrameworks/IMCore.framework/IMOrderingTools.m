@interface IMOrderingTools
- (NSMutableArray)jsonArray;
- (NSString)jsonFilePath;
- (id)currentJsonArray;
- (id)messageDictionariesFromItemsInChat:(id)a3 withEventKey:(id)a4;
- (void)printChangeInItemsToJSON:(id)a3;
- (void)printChangeInItemsToJSONFromChat:(id)a3;
- (void)setJsonArray:(id)a3;
- (void)setJsonFilePath:(id)a3;
- (void)setUpJSONFileForChatGUID:(id)a3;
- (void)startTrackingChat:(id)a3;
- (void)writeDataToJSONFile:(id)a3;
@end

@implementation IMOrderingTools

- (void)startTrackingChat:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v5, v6, v7);
  char isInternalInstall = objc_msgSend_isInternalInstall(v8, v9, v10, v11);

  if (isInternalInstall)
  {
    v16 = objc_msgSend_guid(v4, v13, v14, v15);
    objc_msgSend_setUpJSONFileForChatGUID_(self, v17, (uint64_t)v16, v18);

    v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
    objc_msgSend_addObserver_selector_name_object_(v22, v23, (uint64_t)self, (uint64_t)sel_printChangeInItemsToJSON_, @"__kIMChatItemsDidChangeNotification", 0);
  }
  else if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "---Tried to trace guids on a non internal install!!!!!-----", v25, 2u);
    }
  }
}

- (void)setUpJSONFileForChatGUID:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28B88], v5, v6, v7);
  v12 = objc_msgSend_invertedSet(v8, v9, v10, v11);

  uint64_t v15 = objc_msgSend_componentsSeparatedByCharactersInSet_(v4, v13, (uint64_t)v12, v14);
  uint64_t v18 = objc_msgSend_componentsJoinedByString_(v15, v16, (uint64_t)&stru_1EF8E78C8, v17);

  v22 = objc_msgSend_pathToDirectoryOfJSONFile(self, v19, v20, v21);
  v23 = NSString;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v24, v25, v26);
  v30 = objc_msgSend_stringWithFormat_(v23, v28, @"ordering_output_%@_%lu.json", v29, v18, (unint64_t)v27);
  v33 = objc_msgSend_stringByAppendingPathComponent_(v22, v31, (uint64_t)v30, v32);
  v37 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v34, v35, v36);
  objc_msgSend_createFileAtPath_contents_attributes_(v37, v38, (uint64_t)v33, 0, 0);

  objc_msgSend_setJsonFilePath_(self, v39, (uint64_t)v33, v40);
  if (IMOSLoggingEnabled())
  {
    v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v4;
      __int16 v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "JSON File for chatGUID %@ can be found at this path: %@", buf, 0x16u);
    }
  }
}

- (void)printChangeInItemsToJSONFromChat:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_guid(v4, v13, v14, v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = NSNumber;
      uint64_t v21 = objc_msgSend_chatItems(v4, v18, v19, v20);
      uint64_t v25 = objc_msgSend_count(v21, v22, v23, v24);
      v28 = objc_msgSend_numberWithUnsignedInteger_(v17, v26, v25, v27);
      *(_DWORD *)buf = 138412802;
      id v54 = v16;
      __int16 v55 = 2112;
      v56 = v8;
      __int16 v57 = 2112;
      v58 = v28;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Print change items for chat %@ at time %@ current item count %@", buf, 0x20u);
    }
  }
  uint64_t v29 = objc_msgSend_chatItems(v4, v9, v10, v11);
  BOOL v33 = objc_msgSend_count(v29, v30, v31, v32) == 0;

  if (!v33)
  {
    v37 = NSString;
    objc_msgSend_timeIntervalSinceReferenceDate(v8, v34, v35, v36);
    v41 = objc_msgSend_stringWithFormat_(v37, v38, @"ItemsChangedEvent-%f", v39, v40);
    id v43 = objc_msgSend_messageDictionariesFromItemsInChat_withEventKey_(self, v42, (uint64_t)v4, (uint64_t)v41);
    v47 = objc_msgSend_currentJsonArray(self, v44, v45, v46);
    objc_msgSend_addObject_(v47, v48, (uint64_t)v43, v49);
    if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v54 = v41;
        __int16 v55 = 2112;
        v56 = v43;
        _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Appending event key %@ with items JSON Array %@", buf, 0x16u);
      }
    }
    objc_msgSend_writeDataToJSONFile_(self, v50, (uint64_t)v47, v51);
  }
}

- (void)printChangeInItemsToJSON:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Print change in items %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v9 = objc_msgSend_object(v4, v5, v6, v7);
  objc_msgSend_printChangeInItemsToJSONFromChat_(self, v10, (uint64_t)v9, v11);
}

- (id)currentJsonArray
{
  id v4 = objc_msgSend_jsonFilePath(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], v5, (uint64_t)v4, v6);
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v7, (uint64_t)v10, 0, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    uint64_t v11 = 0;
LABEL_8:
    uint64_t v12 = objc_msgSend_array(MEMORY[0x1E4F1C978], v7, v8, v9);

    uint64_t v11 = (void *)v12;
    goto LABEL_9;
  }
  if (!v11 || !objc_msgSend_count(v11, v7, v8, v9)) {
    goto LABEL_8;
  }
LABEL_9:
  id v13 = objc_msgSend_mutableCopy(v11, v7, v8, v9);

  return v13;
}

- (void)writeDataToJSONFile:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_jsonFilePath(self, v5, v6, v7);
  if (objc_msgSend_length(v8, v9, v10, v11))
  {
    id v13 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v12, (uint64_t)v4, 1, 0);
    objc_msgSend_writeToFile_atomically_(v13, v14, (uint64_t)v8, 1);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "We didn't find a json file to persist for path %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)messageDictionariesFromItemsInChat:(id)a3 withEventKey:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v12 = objc_msgSend_chatItems(v7, v9, v10, v11);
  uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_initWithCapacity_(v8, v17, v16, v18);

  objc_msgSend_addObject_(v19, v20, (uint64_t)v6, v21);
  uint64_t v25 = objc_msgSend_chatItems(v7, v22, v23, v24);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A4BC7124;
  v29[3] = &unk_1E5B7D158;
  id v26 = v19;
  id v30 = v26;
  objc_msgSend___enumerateItemsWithOptions_usingBlock_(v25, v27, 1, (uint64_t)v29);

  return v26;
}

- (NSString)jsonFilePath
{
  return self->_jsonFilePath;
}

- (void)setJsonFilePath:(id)a3
{
}

- (NSMutableArray)jsonArray
{
  return self->_jsonArray;
}

- (void)setJsonArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonArray, 0);

  objc_storeStrong((id *)&self->_jsonFilePath, 0);
}

@end