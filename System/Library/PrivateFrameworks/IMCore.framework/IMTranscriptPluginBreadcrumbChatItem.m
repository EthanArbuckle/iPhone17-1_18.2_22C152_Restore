@interface IMTranscriptPluginBreadcrumbChatItem
- (BOOL)canDelete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (IMBalloonPluginDataSource)dataSource;
- (NSString)rawStatusText;
- (NSString)statusText;
- (NSString)type;
- (id)_initWithItem:(id)a3 datasource:(id)a4 statusText:(id)a5 optionFlags:(unint64_t)a6;
- (unint64_t)hash;
- (unint64_t)optionFlags;
- (void)configureStatusTextWithAccount:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation IMTranscriptPluginBreadcrumbChatItem

- (id)_initWithItem:(id)a3 datasource:(id)a4 statusText:(id)a5 optionFlags:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  v16 = [(IMChatItem *)&v22 _initWithItem:v10];
  if (v16)
  {
    v17 = objc_msgSend_guid(v10, v13, v14, v15);
    v18 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v16, v19, (uint64_t)v18, v20);
    objc_storeStrong(v16 + 7, a4);
    objc_storeStrong(v16 + 8, a5);
    v16[10] = (id)a6;
  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  if ([(IMTranscriptChatItem *)&v14 isEqual:v4])
  {
    v7 = v4;
    if (self->_optionFlags == v7[10]
      && ((rawStatusText = self->_rawStatusText, uint64_t v9 = v7[8], rawStatusText == (NSString *)v9)
       || objc_msgSend_isEqual_(rawStatusText, v5, v9, v6)))
    {
      dataSource = self->_dataSource;
      uint64_t v11 = v7[7];
      if (dataSource == (IMBalloonPluginDataSource *)v11) {
        char isEqual = 1;
      }
      else {
        char isEqual = objc_msgSend_isEqual_(dataSource, v5, v11, v6);
      }
    }
    else
    {
      char isEqual = 0;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)IMTranscriptPluginBreadcrumbChatItem;
  v3 = (char *)[(IMTranscriptChatItem *)&v12 hash] + self->_optionFlags;
  v7 = &v3[objc_msgSend_hash(self->_rawStatusText, v4, v5, v6)];
  return (unint64_t)&v7[objc_msgSend_hash(self->_dataSource, v8, v9, v10)];
}

- (void)configureStatusTextWithAccount:(id)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  id v4 = self->_rawStatusText;
  v8 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x1E4F28E58], v5, v6, v7);
  objc_super v12 = objc_msgSend_nonBaseCharacterSet(MEMORY[0x1E4F28B88], v9, v10, v11);
  objc_msgSend_formUnionWithCharacterSet_(v8, v13, (uint64_t)v12, v14);

  v18 = objc_msgSend_symbolCharacterSet(MEMORY[0x1E4F28B88], v15, v16, v17);
  objc_msgSend_formUnionWithCharacterSet_(v8, v19, (uint64_t)v18, v20);

  objc_msgSend_invert(v8, v21, v22, v23);
  v26 = objc_msgSend_stringByAppendingString_((void *)*MEMORY[0x1E4F6C110], v24, *MEMORY[0x1E4F6C130], v25);
  objc_msgSend_addCharactersInString_(v8, v27, (uint64_t)v26, v28);

  v31 = objc_msgSend_componentsSeparatedByCharactersInSet_(v4, v29, (uint64_t)v8, v30);
  v34 = objc_msgSend_componentsJoinedByString_(v31, v32, (uint64_t)&stru_1EF8E78C8, v33);

  if (objc_msgSend_length(v34, v35, v36, v37))
  {
    v41 = 0;
  }
  else
  {
    v42 = objc_msgSend_bundleID(self->_dataSource, v38, v39, v40);
    int hasPrefix = objc_msgSend_hasPrefix_(v42, v43, *MEMORY[0x1E4F6CBE8], v44);

    if (!hasPrefix) {
      goto LABEL_5;
    }
    v49 = objc_msgSend_pluginPayload(self->_dataSource, v46, v47, v48);
    v53 = objc_msgSend_payloadDictionary(v49, v50, v51, v52);

    v41 = objc_msgSend_objectForKey_(v53, v54, *MEMORY[0x1E4F6D2E8], v55);

    if (!v41)
    {
LABEL_5:
      v56 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v46, v47, v48);
      v60 = objc_msgSend_bundleID(self->_dataSource, v57, v58, v59);
      v63 = objc_msgSend_balloonPluginForBundleID_(v56, v61, (uint64_t)v60, v62);

      v41 = objc_msgSend_browserDisplayName(v63, v64, v65, v66);
    }
    v67 = NSString;
    v68 = sub_1A4C0ACE4();
    v70 = objc_msgSend_localizedStringForKey_value_table_(v68, v69, @"$(%@) sent %@ message", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    uint64_t v73 = objc_msgSend_stringWithFormat_(v67, v71, (uint64_t)v70, v72, kIMTranscriptPluginBreadcrumbTextSenderIdentifier, v41);

    id v4 = (NSString *)v73;
  }
  v74 = objc_msgSend___im_rangesOfHandleIdentifierStrings(v4, v38, v39, v40);
  if (objc_msgSend_count(v74, v75, v76, v77))
  {
    v107 = v34;
    v78 = (NSString *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v82 = objc_msgSend__item(self, v79, v80, v81);
    v86 = objc_msgSend__senderHandle(v82, v83, v84, v85);

    if (v86 && objc_msgSend_hasName(v86, v87, v88, v89))
    {
      v90 = objc_msgSend_name(v86, v87, v88, v89);
      if (v90)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v78, kIMTranscriptPluginBreadcrumbTextSenderIdentifier, v90);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB7C48();
      }
    }
    v94 = objc_msgSend__item(self, v87, v88, v89);
    v98 = objc_msgSend__otherHandle(v94, v95, v96, v97);

    if (v98 && objc_msgSend_hasName(v98, v99, v100, v101))
    {
      v102 = objc_msgSend_name(v98, v99, v100, v101);
      if (v102)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v78, kIMTranscriptPluginBreadcrumbTextReceiverIdentifier, v102);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sub_1A4CB7BB4();
      }
    }
    v103 = objc_msgSend_mutableCopy(v4, v99, v100, v101);
    v93 = v108;
    objc_msgSend_replaceHandleWithContactNameInString_forAccount_additionalHandles_(IMBalloonPluginDataSource, v104, (uint64_t)v103, (uint64_t)v108, v78);
    v105 = (NSString *)objc_claimAutoreleasedReturnValue();
    statusText = self->_statusText;
    self->_statusText = v105;

    v34 = v107;
  }
  else
  {
    v91 = IMLogHandleForCategory();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v110 = v4;
      __int16 v111 = 2112;
      v112 = v74;
      __int16 v113 = 2112;
      v114 = v41;
      _os_log_error_impl(&dword_1A4AF7000, v91, OS_LOG_TYPE_ERROR, "There are no identifier strings to replace, so we display the raw string. tmpRawStatusText: %@, identifierRanges: %@, pluginName: %@", buf, 0x20u);
    }

    v92 = v4;
    v78 = self->_statusText;
    self->_statusText = v92;
    v93 = v108;
  }
}

- (NSString)type
{
  return (NSString *)objc_msgSend_bundleID(self->_dataSource, a2, v2, v3);
}

- (BOOL)isFromMe
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)canDelete
{
  return IMGetDomainBoolForKey();
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)rawStatusText
{
  return self->_rawStatusText;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (unint64_t)optionFlags
{
  return self->_optionFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_rawStatusText, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end