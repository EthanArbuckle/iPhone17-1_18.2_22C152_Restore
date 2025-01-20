@interface IMPluginPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualAttachmentFileURLsToPluginPayload:(id)a3;
- (BOOL)isEqualToPluginPayload:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isPlayed;
- (BOOL)isSticker;
- (BOOL)isUpdate;
- (BOOL)sendAsCopy;
- (BOOL)shouldExpire;
- (BOOL)shouldHideAttachments;
- (BOOL)skipConfigurePlugin;
- (BOOL)supportsCollaboration;
- (BOOL)supportsSendLater;
- (CKContainerSetupInfo)containerSetupInfo;
- (CKShare)cloudKitShare;
- (DDScannerResult)dataDetectedResult;
- (IMBalloonPluginDataSource)datasource;
- (IMPluginPayload)initWithCoder:(id)a3;
- (IMPluginPayload)initWithCoder:(id)a3 additionalAllowedClasses:(id)a4;
- (IMPluginPayload)initWithMessage:(id)a3;
- (IMPluginPayload)initWithMessageItem:(id)a3;
- (IMPluginPayload)initWithMessageItem:(id)a3 chatContext:(id)a4;
- (NSArray)attachments;
- (NSArray)consumedSessionPayloads;
- (NSArray)fileTransferGUIDs;
- (NSAttributedString)text;
- (NSData)data;
- (NSData)generativePlaygroundRecipeData;
- (NSDate)time;
- (NSDictionary)userInfo;
- (NSString)associatedMessageGUID;
- (NSString)breadcrumbText;
- (NSString)collaborationOptionsSummary;
- (NSString)messageGUID;
- (NSString)pluginBundleID;
- (NSString)pluginSessionGUID;
- (NSString)sender;
- (NSString)statusText;
- (NSString)threadIdentifier;
- (NSURL)sendAsCopyURL;
- (NSURL)url;
- (TUConversationActivity)groupActivity;
- (_SWCollaborationMetadata)collaborationMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)payloadDictionary;
- (int64_t)payloadCollaborationType;
- (unint64_t)hash;
- (void)acceptPurgedTransfers;
- (void)addAttachmentsFromFilePaths:(id)a3;
- (void)addAttachmentsFromFileTransferGUIDs:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedMessageGUID:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBreadcrumbText:(id)a3;
- (void)setCloudKitShare:(id)a3;
- (void)setCollaborationMetadata:(id)a3;
- (void)setCollaborationOptionsSummary:(id)a3;
- (void)setConsumedSessionPayloads:(id)a3;
- (void)setData:(id)a3;
- (void)setDataDetectedResult:(id)a3;
- (void)setDatasource:(id)a3;
- (void)setFileTransferGUIDs:(id)a3;
- (void)setGenerativePlaygroundRecipeData:(id)a3;
- (void)setGroupActivity:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPlayed:(BOOL)a3;
- (void)setMessageGUID:(id)a3;
- (void)setPayloadCollaborationType:(int64_t)a3;
- (void)setPluginBundleID:(id)a3;
- (void)setPluginSessionGUID:(id)a3;
- (void)setSendAsCopy:(BOOL)a3;
- (void)setSendAsCopyURL:(id)a3;
- (void)setSender:(id)a3;
- (void)setShouldExpire:(BOOL)a3;
- (void)setSkipConfigurePlugin:(BOOL)a3;
- (void)setStatusText:(id)a3;
- (void)setSticker:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTime:(id)a3;
- (void)setUpdate:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation IMPluginPayload

- (IMPluginPayload)initWithMessage:(id)a3
{
  v5 = objc_msgSend__imMessageItem(a3, a2, (uint64_t)a3, v3);
  v8 = (IMPluginPayload *)objc_msgSend_initWithMessageItem_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (IMPluginPayload)initWithMessageItem:(id)a3
{
  return (IMPluginPayload *)objc_msgSend_initWithMessageItem_chatContext_(self, a2, (uint64_t)a3, 0);
}

- (IMPluginPayload)initWithMessageItem:(id)a3 chatContext:(id)a4
{
  v196[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v193.receiver = self;
  v193.super_class = (Class)IMPluginPayload;
  v11 = [(IMPluginPayload *)&v193 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_guid(v6, v8, v9, v10);
    messageGUID = v11->_messageGUID;
    v11->_messageGUID = (NSString *)v12;

    uint64_t v17 = objc_msgSend_time(v6, v14, v15, v16);
    time = v11->_time;
    v11->_time = (NSDate *)v17;

    uint64_t v22 = objc_msgSend_pluginSessionGUID(v6, v19, v20, v21);
    pluginSessionGUID = v11->_pluginSessionGUID;
    v11->_pluginSessionGUID = (NSString *)v22;

    uint64_t v27 = objc_msgSend_balloonBundleID(v6, v24, v25, v26);
    pluginBundleID = v11->_pluginBundleID;
    v11->_pluginBundleID = (NSString *)v27;

    v32 = objc_msgSend_body(v6, v29, v30, v31);
    uint64_t v36 = objc_msgSend__pluginPayloadURLFromIMMessageItemBody(v32, v33, v34, v35);
    url = v11->_url;
    v178 = v11;
    v11->_url = (NSURL *)v36;

    v183 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
    v41 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40);
    v45 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v42, v43, v44);
    id v180 = v7;
    uint64_t v47 = objc_msgSend__newMessagePartsForMessageItem_chatContext_(IMMessagePartChatItem, v46, (uint64_t)v6, (uint64_t)v7);
    v51 = &off_1E5B79000;
    v181 = v6;
    if (v47)
    {
      v52 = (void *)v47;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v196[0] = v52;
        uint64_t v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)v196, 1);

        v52 = (void *)v54;
      }
      long long v191 = 0u;
      long long v192 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id obj = v52;
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v55, (uint64_t)&v189, (uint64_t)v195, 16);
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v190;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v190 != v58) {
              objc_enumerationMutation(obj);
            }
            v60 = *(void **)(*((void *)&v189 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = v60;
              v68 = objc_msgSend_subject(v61, v62, v63, v64);
              if (!v68)
              {
                v68 = objc_msgSend_text(v61, v65, v66, v67);
                if (!v68) {
                  goto LABEL_18;
                }
              }
              objc_msgSend_appendAttributedString_(v183, v65, (uint64_t)v68, v67, v178);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              objc_msgSend_transferGUID(v60, v69, v70, v71);
              id v61 = (id)objc_claimAutoreleasedReturnValue();
              v75 = objc_msgSend_sharedInstance(IMFileTransferCenter, v72, v73, v74);
              v68 = objc_msgSend_transferForGUID_(v75, v76, (uint64_t)v61, v77);

              v81 = objc_msgSend_localURL(v68, v78, v79, v80);

              if (v81)
              {
                objc_msgSend_addObject_(v45, v82, (uint64_t)v61, v83);
                v87 = objc_msgSend_localURL(v68, v84, v85, v86);
                objc_msgSend_addObject_(v41, v88, (uint64_t)v87, v89);
              }
            }

LABEL_18:
          }
          uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v69, (uint64_t)&v189, (uint64_t)v195, 16);
        }
        while (v57);
      }

      id v6 = v181;
      v51 = &off_1E5B79000;
    }
    else
    {
      id obj = 0;
    }
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    v90 = objc_msgSend_fileTransferGUIDs(v6, v48, v49, v50, v178);
    uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v185, (uint64_t)v194, 16);
    if (!v92) {
      goto LABEL_37;
    }
    uint64_t v95 = v92;
    uint64_t v96 = *(void *)v186;
LABEL_25:
    uint64_t v97 = 0;
    uint64_t v182 = v95;
    while (1)
    {
      if (*(void *)v186 != v96) {
        objc_enumerationMutation(v90);
      }
      uint64_t v98 = *(void *)(*((void *)&v185 + 1) + 8 * v97);
      if (objc_msgSend_containsObject_(v45, v93, v98, v94)) {
        goto LABEL_35;
      }
      objc_msgSend_addObject_(v45, v93, v98, v94);
      v102 = objc_msgSend_sharedInstance(v51[440], v99, v100, v101);
      v105 = objc_msgSend_transferForGUID_(v102, v103, v98, v104);

      uint64_t v109 = objc_msgSend_localURL(v105, v106, v107, v108);
      if (!v109)
      {
        v113 = objc_msgSend_localPath(v105, v110, v111, v112);

        if (v113)
        {
          v115 = (void *)MEMORY[0x1E4F1CB10];
          objc_msgSend_localPath(v105, v110, v114, v112);
          uint64_t v116 = v96;
          v117 = v90;
          v118 = v45;
          v119 = v41;
          v121 = v120 = v51;
          v124 = objc_msgSend_fileURLWithPath_(v115, v122, (uint64_t)v121, v123);

          v51 = v120;
          v41 = v119;
          v45 = v118;
          v90 = v117;
          uint64_t v96 = v116;
          uint64_t v95 = v182;
          if (v124) {
            goto LABEL_34;
          }
        }
        uint64_t v109 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v110, v114, v112);
      }
      v124 = (void *)v109;
LABEL_34:
      objc_msgSend_addObject_(v41, v110, (uint64_t)v124, v112);

LABEL_35:
      if (v95 == ++v97)
      {
        uint64_t v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v185, (uint64_t)v194, 16);
        if (!v95)
        {
LABEL_37:

          v11 = v179;
          text = v179->_text;
          v179->_text = v183;
          v126 = v183;

          id v6 = v181;
          v130 = objc_msgSend_breadcrumbText(v181, v127, v128, v129);
          uint64_t v134 = objc_msgSend_string(v130, v131, v132, v133);
          breadcrumbText = v179->_breadcrumbText;
          v179->_breadcrumbText = (NSString *)v134;

          uint64_t v139 = objc_msgSend_copy(v41, v136, v137, v138);
          attachments = v179->_attachments;
          v179->_attachments = (NSArray *)v139;

          v144 = objc_msgSend_payloadData(v181, v141, v142, v143);
          uint64_t v148 = objc_msgSend__FTOptionallyDecompressData(v144, v145, v146, v147);
          data = v179->_data;
          v179->_data = (NSData *)v148;

          v179->_sticker = objc_msgSend_isSticker(v181, v150, v151, v152);
          v179->_shouldExpire = objc_msgSend_isExpirable(v181, v153, v154, v155);
          uint64_t v159 = objc_msgSend_consumedSessionPayloads(v181, v156, v157, v158);
          consumedSessionPayloads = v179->_consumedSessionPayloads;
          v179->_consumedSessionPayloads = (NSArray *)v159;

          v179->_isFromMe = objc_msgSend_isFromMe(v181, v161, v162, v163);
          uint64_t v167 = objc_msgSend_sender(v181, v164, v165, v166);
          sender = v179->_sender;
          v179->_sender = (NSString *)v167;

          v179->_isPlayed = objc_msgSend_isPlayed(v181, v169, v170, v171);
          uint64_t v175 = objc_msgSend_allObjects(v45, v172, v173, v174);
          fileTransferGUIDs = v179->_fileTransferGUIDs;
          v179->_fileTransferGUIDs = (NSArray *)v175;

          id v7 = v180;
          break;
        }
        goto LABEL_25;
      }
    }
  }

  return v11;
}

- (void)addAttachmentsFromFileTransferGUIDs:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    v11 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v14)
    {
      uint64_t v18 = v14;
      uint64_t v19 = *(void *)v39;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v12);
          }
          uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 8 * v20);
          uint64_t v22 = objc_msgSend_sharedInstance(IMFileTransferCenter, v15, v16, v17, (void)v38);
          uint64_t v25 = objc_msgSend_transferForGUID_(v22, v23, v21, v24);

          if (v11)
          {
            v29 = objc_msgSend_localURL(v25, v26, v27, v28);

            if (v29)
            {
              v33 = objc_msgSend_localURL(v25, v30, v31, v32);
              CFArrayAppendValue(v11, v33);
            }
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v18);
    }

    objc_msgSend_setAttachments_(self, v34, (uint64_t)v11, v35);
    objc_msgSend_setFileTransferGUIDs_(self, v36, (uint64_t)v12, v37);
  }
}

- (BOOL)isEqualAttachmentFileURLsToPluginPayload:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_attachments(self, v5, v6, v7);
  id v12 = objc_msgSend___imSetFromArray(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_attachments(v4, v13, v14, v15);

  uint64_t v20 = objc_msgSend___imSetFromArray(v16, v17, v18, v19);

  LOBYTE(v16) = objc_msgSend_isEqualToSet_(v12, v21, (uint64_t)v20, v22);
  return (char)v16;
}

- (void)acceptPurgedTransfers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = self->_fileTransferGUIDs;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v2);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = objc_msgSend_sharedInstance(IMFileTransferCenter, v5, v6, v7, (void)v15);
        objc_msgSend_acceptTransfer_(v12, v13, v11, v14);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }
}

- (void)addAttachmentsFromFilePaths:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    uint64_t v11 = (__CFArray *)objc_claimAutoreleasedReturnValue();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v4;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v14)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v12);
          }
          uint64_t v20 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v15, *(void *)(*((void *)&v24 + 1) + 8 * i), v16, (void)v24);
          uint64_t v21 = v20;
          if (v11 && v20) {
            CFArrayAppendValue(v11, v20);
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v17);
    }

    objc_msgSend_setAttachments_(self, v22, (uint64_t)v11, v23);
  }
}

- (void)setData:(id)a3
{
  objc_msgSend__FTOptionallyDecompressData(a3, a2, (uint64_t)a3, v3);
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v5;

  MEMORY[0x1F41817F8](v5, data);
}

- (NSString)pluginSessionGUID
{
  pluginSessionGUID = self->_pluginSessionGUID;
  if (!pluginSessionGUID) {
    pluginSessionGUID = self->_messageGUID;
  }
  uint64_t v3 = pluginSessionGUID;

  return v3;
}

- (BOOL)shouldHideAttachments
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_length(v4, v5, v6, v7) != 0;

  return v8;
}

- (BOOL)supportsCollaboration
{
  return self->_payloadCollaborationType != 0;
}

- (BOOL)supportsSendLater
{
  return 0;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_msgSend_containerSetupInfo(self->_collaborationMetadata, v3, v4, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (CKContainerSetupInfo *)v6;
}

- (BOOL)isEqualToPluginPayload:(id)a3
{
  id v4 = a3;
  BOOL v8 = objc_msgSend_text(self, v5, v6, v7);
  id v12 = objc_msgSend_text(v4, v9, v10, v11);
  int v13 = sub_1A4B4FACC(v8, v12);

  if (!v13) {
    goto LABEL_42;
  }
  uint64_t v17 = objc_msgSend_data(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_data(v4, v18, v19, v20);
  int v22 = sub_1A4B4FB3C(v17, v21);

  if (!v22) {
    goto LABEL_42;
  }
  long long v26 = objc_msgSend_generativePlaygroundRecipeData(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_generativePlaygroundRecipeData(v4, v27, v28, v29);
  int v31 = sub_1A4B4FB3C(v26, v30);

  if (!v31) {
    goto LABEL_42;
  }
  uint64_t v35 = objc_msgSend_breadcrumbText(self, v32, v33, v34);
  long long v39 = objc_msgSend_breadcrumbText(v4, v36, v37, v38);
  int v40 = sub_1A4B4FBAC(v35, v39);

  if (!v40) {
    goto LABEL_42;
  }
  uint64_t v44 = objc_msgSend_statusText(self, v41, v42, v43);
  v48 = objc_msgSend_statusText(v4, v45, v46, v47);
  int v49 = sub_1A4B4FBAC(v44, v48);

  if (!v49) {
    goto LABEL_42;
  }
  int isUpdate = objc_msgSend_isUpdate(self, v50, v51, v52);
  if (isUpdate != objc_msgSend_isUpdate(v4, v54, v55, v56)) {
    goto LABEL_42;
  }
  v60 = objc_msgSend_url(self, v57, v58, v59);
  uint64_t v64 = objc_msgSend_url(v4, v61, v62, v63);
  int v65 = sub_1A4B4FB3C(v60, v64);

  if (!v65) {
    goto LABEL_42;
  }
  v69 = objc_msgSend_userInfo(self, v66, v67, v68);
  uint64_t v73 = objc_msgSend_userInfo(v4, v70, v71, v72);
  int v74 = sub_1A4B4FC1C(v69, v73);

  if (!v74) {
    goto LABEL_42;
  }
  v78 = objc_msgSend_messageGUID(self, v75, v76, v77);
  v82 = objc_msgSend_messageGUID(v4, v79, v80, v81);
  int v83 = sub_1A4B4FBAC(v78, v82);

  if (!v83) {
    goto LABEL_42;
  }
  v87 = objc_msgSend_associatedMessageGUID(self, v84, v85, v86);
  v91 = objc_msgSend_associatedMessageGUID(v4, v88, v89, v90);
  int v92 = sub_1A4B4FBAC(v87, v91);

  if (!v92) {
    goto LABEL_42;
  }
  uint64_t v96 = objc_msgSend_pluginSessionGUID(self, v93, v94, v95);
  uint64_t v100 = objc_msgSend_pluginSessionGUID(v4, v97, v98, v99);
  int v101 = sub_1A4B4FBAC(v96, v100);

  if (!v101) {
    goto LABEL_42;
  }
  v105 = objc_msgSend_pluginBundleID(self, v102, v103, v104);
  uint64_t v109 = objc_msgSend_pluginBundleID(v4, v106, v107, v108);
  int v110 = sub_1A4B4FBAC(v105, v109);

  if (!v110) {
    goto LABEL_42;
  }
  uint64_t v114 = objc_msgSend_attachments(self, v111, v112, v113);
  v118 = objc_msgSend_attachments(v4, v115, v116, v117);
  int v119 = sub_1A4B4FC8C(v114, v118);

  if (!v119) {
    goto LABEL_42;
  }
  uint64_t v123 = objc_msgSend_fileTransferGUIDs(self, v120, v121, v122);
  v127 = objc_msgSend_fileTransferGUIDs(v4, v124, v125, v126);
  int v128 = sub_1A4B4FC8C(v123, v127);

  if (!v128) {
    goto LABEL_42;
  }
  int isSticker = objc_msgSend_isSticker(self, v129, v130, v131);
  if (isSticker != objc_msgSend_isSticker(v4, v133, v134, v135)) {
    goto LABEL_42;
  }
  int shouldExpire = objc_msgSend_shouldExpire(self, v136, v137, v138);
  if (shouldExpire != objc_msgSend_shouldExpire(v4, v140, v141, v142)) {
    goto LABEL_42;
  }
  uint64_t v146 = objc_msgSend_sender(self, v143, v144, v145);
  v150 = objc_msgSend_sender(v4, v147, v148, v149);
  int v151 = sub_1A4B4FBAC(v146, v150);

  if (!v151) {
    goto LABEL_42;
  }
  int v155 = objc_msgSend_isFromMe(self, v152, v153, v154);
  if (v155 != objc_msgSend_isFromMe(v4, v156, v157, v158)) {
    goto LABEL_42;
  }
  int isPlayed = objc_msgSend_isPlayed(self, v159, v160, v161);
  if (isPlayed != objc_msgSend_isPlayed(v4, v163, v164, v165)) {
    goto LABEL_42;
  }
  uint64_t v169 = objc_msgSend_payloadCollaborationType(self, v166, v167, v168);
  if (v169 != objc_msgSend_payloadCollaborationType(v4, v170, v171, v172)) {
    goto LABEL_42;
  }
  int v176 = objc_msgSend_sendAsCopy(self, v173, v174, v175);
  if (v176 != objc_msgSend_sendAsCopy(v4, v177, v178, v179)) {
    goto LABEL_42;
  }
  v183 = objc_msgSend_sendAsCopyURL(self, v180, v181, v182);
  long long v187 = objc_msgSend_sendAsCopyURL(v4, v184, v185, v186);

  if (v183 != v187) {
    goto LABEL_42;
  }
  int v191 = objc_msgSend_skipConfigurePlugin(self, v188, v189, v190);
  if (v191 != objc_msgSend_skipConfigurePlugin(v4, v192, v193, v194)) {
    goto LABEL_42;
  }
  v198 = objc_msgSend_cloudKitShare(self, v195, v196, v197);
  v202 = objc_msgSend_cloudKitShare(v4, v199, v200, v201);
  int v203 = sub_1A4B4FB3C(v198, v202);

  if (!v203) {
    goto LABEL_42;
  }
  v207 = objc_msgSend_containerSetupInfo(self, v204, v205, v206);
  v211 = objc_msgSend_containerSetupInfo(v4, v208, v209, v210);
  int v212 = sub_1A4B4FB3C(v207, v211);

  if (!v212) {
    goto LABEL_42;
  }
  v216 = objc_msgSend_collaborationMetadata(self, v213, v214, v215);
  v220 = objc_msgSend_collaborationMetadata(v4, v217, v218, v219);
  int v221 = sub_1A4B4FB3C(v216, v220);

  if (!v221) {
    goto LABEL_42;
  }
  v225 = objc_msgSend_collaborationMetadata(self, v222, v223, v224);
  v229 = objc_msgSend_userSelectedShareOptions(v225, v226, v227, v228);
  v233 = objc_msgSend_collaborationMetadata(v4, v230, v231, v232);
  v237 = objc_msgSend_userSelectedShareOptions(v233, v234, v235, v236);
  int v238 = sub_1A4B4FB3C(v229, v237);

  if (!v238) {
    goto LABEL_42;
  }
  v242 = objc_msgSend_collaborationOptionsSummary(self, v239, v240, v241);
  v246 = objc_msgSend_collaborationOptionsSummary(v4, v243, v244, v245);
  int v247 = sub_1A4B4FBAC(v242, v246);

  if (!v247) {
    goto LABEL_42;
  }
  v251 = objc_msgSend_groupActivity(self, v248, v249, v250);
  v255 = objc_msgSend_groupActivity(v4, v252, v253, v254);
  int v256 = sub_1A4B4FB3C(v251, v255);

  if (!v256) {
    goto LABEL_42;
  }
  v260 = objc_msgSend_time(self, v257, v258, v259);
  v264 = objc_msgSend_time(v4, v261, v262, v263);
  int v265 = sub_1A4B4FB3C(v260, v264);

  if (!v265) {
    goto LABEL_42;
  }
  v269 = objc_msgSend_consumedSessionPayloads(self, v266, v267, v268);
  v273 = objc_msgSend_consumedSessionPayloads(v4, v270, v271, v272);
  id v274 = v269;
  id v275 = v273;
  if (v274 == v275)
  {
  }
  else
  {
    v278 = v275;
    if (!v274 || !v275)
    {

LABEL_42:
      LOBYTE(v312) = 0;
      goto LABEL_43;
    }
    char isEqualToArray = objc_msgSend_isEqualToArray_(v274, v276, (uint64_t)v275, v277);

    if ((isEqualToArray & 1) == 0) {
      goto LABEL_42;
    }
  }
  v283 = objc_msgSend_threadIdentifier(self, v280, v281, v282);
  v287 = objc_msgSend_threadIdentifier(v4, v284, v285, v286);
  int v288 = sub_1A4B4FB3C(v283, v287);

  if (!v288) {
    goto LABEL_42;
  }
  v292 = objc_msgSend_dataDetectedResult(self, v289, v290, v291);
  v296 = objc_msgSend_dataDetectedResult(v4, v293, v294, v295);
  int v297 = sub_1A4B4FB3C(v292, v296);

  if (!v297) {
    goto LABEL_42;
  }
  int shouldHideAttachments = objc_msgSend_shouldHideAttachments(self, v298, v299, v300);
  if (shouldHideAttachments != objc_msgSend_shouldHideAttachments(v4, v302, v303, v304)) {
    goto LABEL_42;
  }
  int v308 = objc_msgSend_supportsCollaboration(self, v305, v306, v307);
  int v312 = v308 ^ objc_msgSend_supportsCollaboration(v4, v309, v310, v311) ^ 1;
LABEL_43:

  return v312;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_pluginBundleID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  int v13 = objc_msgSend_data(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) + v9;
  uint64_t v21 = objc_msgSend_generativePlaygroundRecipeData(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_url(self, v26, v27, v28);
  uint64_t v33 = v17 + v25 + objc_msgSend_hash(v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_messageGUID(self, v34, v35, v36);
  unint64_t v41 = v33 + objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IMPluginPayload *)a3;
  if (self == v4)
  {
    char isEqualToPluginPayload = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToPluginPayload = objc_msgSend_isEqualToPluginPayload_(self, v5, (uint64_t)v4, v6);
    }
    else {
      char isEqualToPluginPayload = 0;
    }
  }

  return isEqualToPluginPayload;
}

- (id)payloadDictionary
{
  v24[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  v24[3] = objc_opt_class();
  v24[4] = objc_opt_class();
  v24[5] = objc_opt_class();
  v24[6] = objc_opt_class();
  v24[7] = objc_opt_class();
  v24[8] = objc_opt_class();
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v24, 9);
  uint64_t v8 = objc_msgSend_setWithArray_(v3, v6, (uint64_t)v5, v7);

  char v9 = objc_opt_respondsToSelector();
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v15 = objc_msgSend_data(self, v11, v12, v13);
  if (v9)
  {
    uint64_t v23 = 0;
    uint64_t v16 = (id *)&v23;
    uint64_t v17 = objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(v10, v14, (uint64_t)v8, (uint64_t)v15, &v23);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v16 = (id *)&v22;
    uint64_t v17 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v10, v14, (uint64_t)v8, (uint64_t)v15, &v22);
  }
  uint64_t v18 = (void *)v17;
  id v19 = *v16;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = v18;
  }
  else {
    id v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v129 = a3;
  uint64_t v7 = objc_msgSend_text(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v129, v8, (uint64_t)v7, @"IMPLUGIN_TEXT_KEY");

  uint64_t v12 = objc_msgSend_data(self, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v129, v13, (uint64_t)v12, @"IMPLUGIN_DATA_KEY");

  uint64_t v17 = objc_msgSend_url(self, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v129, v18, (uint64_t)v17, @"IMPLUGIN_URL_KEY");

  uint64_t v22 = objc_msgSend_breadcrumbText(self, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v129, v23, (uint64_t)v22, @"IMPLUGIN_BREADCRUMBTEXT_KEY");

  uint64_t v27 = objc_msgSend_statusText(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v129, v28, (uint64_t)v27, @"IMPLUGIN_STATUSTEXT_KEY");

  uint64_t isUpdate = objc_msgSend_isUpdate(self, v29, v30, v31);
  objc_msgSend_encodeBool_forKey_(v129, v33, isUpdate, @"IMPLUGIN_UPDATE_KEY");
  uint64_t v37 = objc_msgSend_userInfo(self, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v129, v38, (uint64_t)v37, @"IMPLUGIN_USERINFO_KEY");

  uint64_t v42 = objc_msgSend_messageGUID(self, v39, v40, v41);
  objc_msgSend_encodeObject_forKey_(v129, v43, (uint64_t)v42, @"IMPLUGIN_MESSAGEGUID_KEY");

  uint64_t v47 = objc_msgSend_associatedMessageGUID(self, v44, v45, v46);
  objc_msgSend_encodeObject_forKey_(v129, v48, (uint64_t)v47, @"IMPLUGIN_ASSOCIATEDMESSAGEGUID_KEY");

  uint64_t v52 = objc_msgSend_pluginSessionGUID(self, v49, v50, v51);
  objc_msgSend_encodeObject_forKey_(v129, v53, (uint64_t)v52, @"IMPLUGIN_PLUGINSESSIONGUID_KEY");

  uint64_t v57 = objc_msgSend_pluginBundleID(self, v54, v55, v56);
  objc_msgSend_encodeObject_forKey_(v129, v58, (uint64_t)v57, @"IMPLUGIN_PLUGINBUNDLEID_KEY");

  uint64_t v62 = objc_msgSend_attachments(self, v59, v60, v61);
  objc_msgSend_encodeObject_forKey_(v129, v63, (uint64_t)v62, @"IMPLUGIN_ATTACHMENTS_KEY");

  uint64_t v67 = objc_msgSend_fileTransferGUIDs(self, v64, v65, v66);
  objc_msgSend_encodeObject_forKey_(v129, v68, (uint64_t)v67, @"IMPLUGIN_TRANSFERGUIDS_KEY");

  uint64_t shouldExpire = objc_msgSend_shouldExpire(self, v69, v70, v71);
  objc_msgSend_encodeBool_forKey_(v129, v73, shouldExpire, @"IMPLUGIN_SHOULD_EXPIRE_KEY");
  uint64_t isSticker = objc_msgSend_isSticker(self, v74, v75, v76);
  objc_msgSend_encodeBool_forKey_(v129, v78, isSticker, @"IMPLUGIN_IS_STICKER_KEY");
  uint64_t v82 = objc_msgSend_isFromMe(self, v79, v80, v81);
  objc_msgSend_encodeBool_forKey_(v129, v83, v82, @"IMPLUGIN_IS_FROM_ME");
  v87 = objc_msgSend_sender(self, v84, v85, v86);
  objc_msgSend_encodeObject_forKey_(v129, v88, (uint64_t)v87, @"IMPLUGIN_SENDER");

  int v92 = objc_msgSend_cloudKitShare(self, v89, v90, v91);
  objc_msgSend_encodeObject_forKey_(v129, v93, (uint64_t)v92, @"IMPLUGIN_CKSHARE");

  uint64_t isPlayed = objc_msgSend_isPlayed(self, v94, v95, v96);
  objc_msgSend_encodeBool_forKey_(v129, v98, isPlayed, @"IMPLUGIN_IS_PLAYED");
  uint64_t v102 = objc_msgSend_payloadCollaborationType(self, v99, v100, v101);
  objc_msgSend_encodeInteger_forKey_(v129, v103, v102, @"IMPLUGIN_COLLABORATION_TYPE");
  uint64_t v107 = objc_msgSend_collaborationMetadata(self, v104, v105, v106);
  objc_msgSend_encodeObject_forKey_(v129, v108, (uint64_t)v107, @"IMPLUGIN_PLUGIN_COLLABORATIONMETADATA_KEY");

  uint64_t v112 = objc_msgSend_collaborationOptionsSummary(self, v109, v110, v111);
  objc_msgSend_encodeObject_forKey_(v129, v113, (uint64_t)v112, @"IMPLUGIN_PLUGIN_COLLABORATIONOPTIONSSUMMARY_KEY");

  uint64_t v117 = objc_msgSend_skipConfigurePlugin(self, v114, v115, v116);
  objc_msgSend_encodeBool_forKey_(v129, v118, v117, @"IMPLUGIN_SKIPCONFIGURATION_KEY");
  uint64_t v122 = objc_msgSend_sendAsCopyURL(self, v119, v120, v121);
  objc_msgSend_encodeObject_forKey_(v129, v123, (uint64_t)v122, @"IMPLUGIN_SENDASCOPYURL_KEY");

  uint64_t v127 = objc_msgSend_sendAsCopy(self, v124, v125, v126);
  objc_msgSend_encodeBool_forKey_(v129, v128, v127, @"IMPLUGIN_SENDASCOPY_KEY");
}

- (IMPluginPayload)initWithCoder:(id)a3
{
  return (IMPluginPayload *)MEMORY[0x1F4181798](self, sel_initWithCoder_additionalAllowedClasses_, a3, 0);
}

- (IMPluginPayload)initWithCoder:(id)a3 additionalAllowedClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v148.receiver = self;
  v148.super_class = (Class)IMPluginPayload;
  uint64_t v8 = [(IMPluginPayload *)&v148 init];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = (uint64_t)v7;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v147 = v12;
    id v7 = (id)v11;
    uint64_t v20 = objc_msgSend_initWithObjects_(v9, v18, v10, v19, v147, v13, v14, v15, v16, v17, 0);
    uint64_t v23 = v20;
    if (v11) {
      objc_msgSend_unionSet_(v20, v21, v11, v22);
    }
    uint64_t v24 = objc_opt_class();
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v25, v24, @"IMPLUGIN_TEXT_KEY");
    objc_msgSend_setText_(v8, v27, (uint64_t)v26, v28);

    uint64_t v29 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v30, v29, @"IMPLUGIN_DATA_KEY");
    objc_msgSend_setData_(v8, v32, (uint64_t)v31, v33);

    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v35, v34, @"IMPLUGIN_GENERATIVE_PLAYGROUND_RECIPE_DATA_KEY");
    objc_msgSend_setGenerativePlaygroundRecipeData_(v8, v37, (uint64_t)v36, v38);

    uint64_t v39 = objc_opt_class();
    uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v40, v39, @"IMPLUGIN_URL_KEY");
    objc_msgSend_setUrl_(v8, v42, (uint64_t)v41, v43);

    uint64_t v44 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v45, v44, @"IMPLUGIN_BREADCRUMBTEXT_KEY");
    objc_msgSend_setBreadcrumbText_(v8, v47, (uint64_t)v46, v48);

    uint64_t v49 = objc_opt_class();
    uint64_t v51 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v50, v49, @"IMPLUGIN_STATUSTEXT_KEY");
    objc_msgSend_setStatusText_(v8, v52, (uint64_t)v51, v53);

    uint64_t v56 = objc_msgSend_decodeBoolForKey_(v6, v54, @"IMPLUGIN_UPDATE_KEY", v55);
    objc_msgSend_setUpdate_(v8, v57, v56, v58);
    uint64_t v60 = objc_msgSend_decodeObjectOfClasses_forKey_(v6, v59, (uint64_t)v23, @"IMPLUGIN_USERINFO_KEY");
    objc_msgSend_setUserInfo_(v8, v61, (uint64_t)v60, v62);

    uint64_t v63 = objc_opt_class();
    uint64_t v65 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v64, v63, @"IMPLUGIN_MESSAGEGUID_KEY");
    objc_msgSend_setMessageGUID_(v8, v66, (uint64_t)v65, v67);

    uint64_t v68 = objc_opt_class();
    uint64_t v70 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v69, v68, @"IMPLUGIN_ASSOCIATEDMESSAGEGUID_KEY");
    objc_msgSend_setAssociatedMessageGUID_(v8, v71, (uint64_t)v70, v72);

    uint64_t v73 = objc_opt_class();
    uint64_t v75 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v74, v73, @"IMPLUGIN_PLUGINSESSIONGUID_KEY");
    objc_msgSend_setPluginSessionGUID_(v8, v76, (uint64_t)v75, v77);

    uint64_t v78 = objc_opt_class();
    uint64_t v80 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v79, v78, @"IMPLUGIN_PLUGINBUNDLEID_KEY");
    objc_msgSend_setPluginBundleID_(v8, v81, (uint64_t)v80, v82);

    v84 = objc_msgSend_decodeObjectOfClasses_forKey_(v6, v83, (uint64_t)v23, @"IMPLUGIN_ATTACHMENTS_KEY");
    objc_msgSend_setAttachments_(v8, v85, (uint64_t)v84, v86);

    v88 = objc_msgSend_decodeObjectOfClasses_forKey_(v6, v87, (uint64_t)v23, @"IMPLUGIN_TRANSFERGUIDS_KEY");
    objc_msgSend_setFileTransferGUIDs_(v8, v89, (uint64_t)v88, v90);

    uint64_t v93 = objc_msgSend_decodeBoolForKey_(v6, v91, @"IMPLUGIN_IS_STICKER_KEY", v92);
    objc_msgSend_setSticker_(v8, v94, v93, v95);
    uint64_t v98 = objc_msgSend_decodeBoolForKey_(v6, v96, @"IMPLUGIN_SHOULD_EXPIRE_KEY", v97);
    objc_msgSend_setShouldExpire_(v8, v99, v98, v100);
    uint64_t v103 = objc_msgSend_decodeBoolForKey_(v6, v101, @"IMPLUGIN_IS_FROM_ME", v102);
    objc_msgSend_setIsFromMe_(v8, v104, v103, v105);
    uint64_t v106 = objc_opt_class();
    uint64_t v108 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v107, v106, @"IMPLUGIN_SENDER");
    objc_msgSend_setSender_(v8, v109, (uint64_t)v108, v110);

    uint64_t v113 = objc_msgSend_decodeBoolForKey_(v6, v111, @"IMPLUGIN_IS_PLAYED", v112);
    objc_msgSend_setIsPlayed_(v8, v114, v113, v115);
    uint64_t v118 = objc_msgSend_decodeIntegerForKey_(v6, v116, @"IMPLUGIN_COLLABORATION_TYPE", v117);
    objc_msgSend_setPayloadCollaborationType_(v8, v119, v118, v120);
    uint64_t v121 = objc_opt_class();
    uint64_t v123 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v122, v121, @"IMPLUGIN_PLUGIN_COLLABORATIONMETADATA_KEY");
    objc_msgSend_setCollaborationMetadata_(v8, v124, (uint64_t)v123, v125);

    uint64_t v126 = objc_opt_class();
    int v128 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v127, v126, @"IMPLUGIN_PLUGIN_COLLABORATIONOPTIONSSUMMARY_KEY");
    objc_msgSend_setCollaborationOptionsSummary_(v8, v129, (uint64_t)v128, v130);

    uint64_t v133 = objc_msgSend_decodeBoolForKey_(v6, v131, @"IMPLUGIN_SKIPCONFIGURATION_KEY", v132);
    objc_msgSend_setSkipConfigurePlugin_(v8, v134, v133, v135);
    uint64_t v136 = objc_opt_class();
    uint64_t v138 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v137, v136, @"IMPLUGIN_SENDASCOPYURL_KEY");
    objc_msgSend_setSendAsCopyURL_(v8, v139, (uint64_t)v138, v140);

    uint64_t v143 = objc_msgSend_decodeBoolForKey_(v6, v141, @"IMPLUGIN_SENDASCOPY_KEY", v142);
    objc_msgSend_setSendAsCopy_(v8, v144, v143, v145);
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_text(self, v9, v10, v11);
  objc_msgSend_setText_(v8, v13, (uint64_t)v12, v14);

  uint64_t v18 = objc_msgSend_data(self, v15, v16, v17);
  objc_msgSend_setData_(v8, v19, (uint64_t)v18, v20);

  uint64_t v24 = objc_msgSend_generativePlaygroundRecipeData(self, v21, v22, v23);
  objc_msgSend_setGenerativePlaygroundRecipeData_(v8, v25, (uint64_t)v24, v26);

  uint64_t v30 = objc_msgSend_url(self, v27, v28, v29);
  objc_msgSend_setUrl_(v8, v31, (uint64_t)v30, v32);

  uint64_t v36 = objc_msgSend_breadcrumbText(self, v33, v34, v35);
  objc_msgSend_setBreadcrumbText_(v8, v37, (uint64_t)v36, v38);

  uint64_t v42 = objc_msgSend_statusText(self, v39, v40, v41);
  objc_msgSend_setStatusText_(v8, v43, (uint64_t)v42, v44);

  uint64_t isUpdate = objc_msgSend_isUpdate(self, v45, v46, v47);
  objc_msgSend_setUpdate_(v8, v49, isUpdate, v50);
  uint64_t v54 = objc_msgSend_userInfo(self, v51, v52, v53);
  objc_msgSend_setUserInfo_(v8, v55, (uint64_t)v54, v56);

  uint64_t v60 = objc_msgSend_messageGUID(self, v57, v58, v59);
  objc_msgSend_setMessageGUID_(v8, v61, (uint64_t)v60, v62);

  uint64_t v66 = objc_msgSend_associatedMessageGUID(self, v63, v64, v65);
  objc_msgSend_setAssociatedMessageGUID_(v8, v67, (uint64_t)v66, v68);

  uint64_t v72 = objc_msgSend_pluginSessionGUID(self, v69, v70, v71);
  objc_msgSend_setPluginSessionGUID_(v8, v73, (uint64_t)v72, v74);

  uint64_t v78 = objc_msgSend_pluginBundleID(self, v75, v76, v77);
  objc_msgSend_setPluginBundleID_(v8, v79, (uint64_t)v78, v80);

  v84 = objc_msgSend_attachments(self, v81, v82, v83);
  objc_msgSend_setAttachments_(v8, v85, (uint64_t)v84, v86);

  uint64_t v90 = objc_msgSend_fileTransferGUIDs(self, v87, v88, v89);
  objc_msgSend_setFileTransferGUIDs_(v8, v91, (uint64_t)v90, v92);

  uint64_t shouldExpire = objc_msgSend_shouldExpire(self, v93, v94, v95);
  objc_msgSend_setShouldExpire_(v8, v97, shouldExpire, v98);
  uint64_t isSticker = objc_msgSend_isSticker(self, v99, v100, v101);
  objc_msgSend_setSticker_(v8, v103, isSticker, v104);
  uint64_t v108 = objc_msgSend_isFromMe(self, v105, v106, v107);
  objc_msgSend_setIsFromMe_(v8, v109, v108, v110);
  uint64_t v114 = objc_msgSend_sender(self, v111, v112, v113);
  objc_msgSend_setSender_(v8, v115, (uint64_t)v114, v116);

  uint64_t isPlayed = objc_msgSend_isPlayed(self, v117, v118, v119);
  objc_msgSend_setIsPlayed_(v8, v121, isPlayed, v122);
  uint64_t v126 = objc_msgSend_datasource(self, v123, v124, v125);
  objc_msgSend_setDatasource_(v8, v127, (uint64_t)v126, v128);

  uint64_t v132 = objc_msgSend_payloadCollaborationType(self, v129, v130, v131);
  objc_msgSend_setPayloadCollaborationType_(v8, v133, v132, v134);
  uint64_t v138 = objc_msgSend_sendAsCopy(self, v135, v136, v137);
  objc_msgSend_setSendAsCopy_(v8, v139, v138, v140);
  uint64_t v144 = objc_msgSend_skipConfigurePlugin(self, v141, v142, v143);
  objc_msgSend_setSkipConfigurePlugin_(v8, v145, v144, v146);
  v150 = objc_msgSend_cloudKitShare(self, v147, v148, v149);
  objc_msgSend_setCloudKitShare_(v8, v151, (uint64_t)v150, v152);

  v156 = objc_msgSend_groupActivity(self, v153, v154, v155);
  objc_msgSend_setGroupActivity_(v8, v157, (uint64_t)v156, v158);

  uint64_t v162 = objc_msgSend_collaborationMetadata(self, v159, v160, v161);
  objc_msgSend_setCollaborationMetadata_(v8, v163, (uint64_t)v162, v164);

  uint64_t v168 = objc_msgSend_collaborationOptionsSummary(self, v165, v166, v167);
  objc_msgSend_setCollaborationOptionsSummary_(v8, v169, (uint64_t)v168, v170);

  uint64_t v174 = objc_msgSend_sendAsCopyURL(self, v171, v172, v173);
  objc_msgSend_setSendAsCopyURL_(v8, v175, (uint64_t)v174, v176);

  return v8;
}

- (TUConversationActivity)groupActivity
{
  return self->groupActivity;
}

- (void)setGroupActivity:(id)a3
{
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)breadcrumbText
{
  return self->_breadcrumbText;
}

- (void)setBreadcrumbText:(id)a3
{
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (BOOL)isUpdate
{
  return self->_update;
}

- (void)setUpdate:(BOOL)a3
{
  self->_update = a3;
}

- (BOOL)isSticker
{
  return self->_sticker;
}

- (void)setSticker:(BOOL)a3
{
  self->_sticker = a3;
}

- (BOOL)shouldExpire
{
  return self->_shouldExpire;
}

- (void)setShouldExpire:(BOOL)a3
{
  self->_uint64_t shouldExpire = a3;
}

- (int64_t)payloadCollaborationType
{
  return self->_payloadCollaborationType;
}

- (void)setPayloadCollaborationType:(int64_t)a3
{
  self->_payloadCollaborationType = a3;
}

- (BOOL)sendAsCopy
{
  return self->_sendAsCopy;
}

- (void)setSendAsCopy:(BOOL)a3
{
  self->_sendAsCopy = a3;
}

- (BOOL)skipConfigurePlugin
{
  return self->_skipConfigurePlugin;
}

- (void)setSkipConfigurePlugin:(BOOL)a3
{
  self->_skipConfigurePlugin = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSString)associatedMessageGUID
{
  return self->_associatedMessageGUID;
}

- (void)setAssociatedMessageGUID:(id)a3
{
}

- (void)setPluginSessionGUID:(id)a3
{
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
}

- (NSArray)consumedSessionPayloads
{
  return self->_consumedSessionPayloads;
}

- (void)setConsumedSessionPayloads:(id)a3
{
}

- (BOOL)isPlayed
{
  return self->_isPlayed;
}

- (void)setIsPlayed:(BOOL)a3
{
  self->_uint64_t isPlayed = a3;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSArray)fileTransferGUIDs
{
  return self->_fileTransferGUIDs;
}

- (void)setFileTransferGUIDs:(id)a3
{
}

- (DDScannerResult)dataDetectedResult
{
  return self->_dataDetectedResult;
}

- (void)setDataDetectedResult:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (IMBalloonPluginDataSource)datasource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datasource);

  return (IMBalloonPluginDataSource *)WeakRetained;
}

- (void)setDatasource:(id)a3
{
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void)setCollaborationMetadata:(id)a3
{
}

- (NSString)collaborationOptionsSummary
{
  return self->_collaborationOptionsSummary;
}

- (void)setCollaborationOptionsSummary:(id)a3
{
}

- (NSURL)sendAsCopyURL
{
  return self->_sendAsCopyURL;
}

- (void)setSendAsCopyURL:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (CKShare)cloudKitShare
{
  return self->_cloudKitShare;
}

- (void)setCloudKitShare:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitShare, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_sendAsCopyURL, 0);
  objc_storeStrong((id *)&self->_collaborationOptionsSummary, 0);
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_destroyWeak((id *)&self->_datasource);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dataDetectedResult, 0);
  objc_storeStrong((id *)&self->_fileTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_consumedSessionPayloads, 0);
  objc_storeStrong((id *)&self->_pluginBundleID, 0);
  objc_storeStrong((id *)&self->_pluginSessionGUID, 0);
  objc_storeStrong((id *)&self->_associatedMessageGUID, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_breadcrumbText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->groupActivity, 0);
}

@end