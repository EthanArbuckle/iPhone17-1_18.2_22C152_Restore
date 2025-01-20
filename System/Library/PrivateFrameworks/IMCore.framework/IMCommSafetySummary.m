@interface IMCommSafetySummary
+ (id)primaryiCloudAccountIdentifier;
+ (id)recipientStrings:(id)a3;
+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7;
+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7 childID:(id)a8 deviceID:(id)a9 senderID:(id)a10 eventSender:(id)a11;
@end

@implementation IMCommSafetySummary

+ (id)primaryiCloudAccountIdentifier
{
  if (qword_1E965EA78 != -1) {
    dispatch_once(&qword_1E965EA78, &unk_1EF8E56D8);
  }
  v2 = (void *)qword_1E965EA70;

  return v2;
}

+ (id)recipientStrings:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v8 = objc_msgSend_participants(v3, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v8);
        }
        v17 = objc_msgSend_ID(*(void **)(*((void *)&v22 + 1) + 8 * i), v11, v12, v13);
        if (MEMORY[0x1A62639B0]())
        {
          uint64_t v20 = IMFormattedDisplayStringForNumber();

          v17 = (void *)v20;
        }
        if (v17) {
          objc_msgSend_addObject_(v4, v18, (uint64_t)v17, v19);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }

  return v4;
}

+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v18 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E6D0], v15, v16, v17);
  if (objc_msgSend_shouldNotifyParentAboutSensitivePhotos(v18, v19, v20, v21))
  {
    long long v25 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E6D0], v22, v23, v24);
    char IsYoungAgeGroup = objc_msgSend_childIsYoungAgeGroup(v25, v26, v27, v28);

    if (IsYoungAgeGroup)
    {
      v49 = objc_msgSend_primaryiCloudAccountIdentifier(IMCommSafetySummary, v30, v31, v32);
      v35 = (void *)MGCopyAnswer();
      if (v12)
      {
        v36 = objc_msgSend_messageForGUID_(v13, v33, (uint64_t)v12, v34);
        v40 = v36;
        if (v36)
        {
          v41 = objc_msgSend_sender(v36, v37, v38, v39);
          v45 = objc_msgSend_ID(v41, v42, v43, v44);
        }
        else
        {
          v45 = 0;
        }
      }
      else
      {
        v45 = 0;
      }
      if (MEMORY[0x1A62639B0](v45))
      {
        uint64_t v48 = IMFormattedDisplayStringForNumber();

        v45 = (void *)v48;
      }
      objc_msgSend_registerEvent_eventType_messageGUID_chat_forImages_childID_deviceID_senderID_eventSender_(a1, v47, a3, a4, v12, v13, v14, v49, v35, v45, &unk_1EF8E4190);

      goto LABEL_17;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v51 = a4;
      _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "Not registering event %lu because setting is not enabled!", buf, 0xCu);
    }
  }
LABEL_17:
}

+ (void)registerEvent:(unint64_t)a3 eventType:(unint64_t)a4 messageGUID:(id)a5 chat:(id)a6 forImages:(id)a7 childID:(id)a8 deviceID:(id)a9 senderID:(id)a10 eventSender:(id)a11
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  id v139 = a5;
  id v125 = a6;
  id v14 = a7;
  id v131 = a8;
  id v130 = a9;
  id v136 = a10;
  v132 = (void (**)(id, void *, void *))a11;
  v133 = objc_msgSend_sharedRegistry(IMChatRegistry, v15, v16, v17);
  v137 = objc_msgSend_chatIdentifier(v125, v18, v19, v20);
  v138 = objc_msgSend_messagesURLWithChat_(v133, v21, (uint64_t)v125, v22);
  v129 = objc_msgSend_recipientStrings_(IMCommSafetySummary, v23, (uint64_t)v125, v24);
  if (!v14)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F502F8]);
    v29 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v26, v27, v28);
    objc_msgSend_timeIntervalSinceReferenceDate(v29, v30, v31, v32);
    uint64_t v34 = objc_msgSend_initWithChildID_deviceID_sourceBundleID_absoluteTimeStamp_eventDirection_eventType_contentType_contactHandles_contentID_conversationID_imageData_senderHandle_contentURL_conversationURL_(v25, v33, (uint64_t)v131, (uint64_t)v130, @"com.apple.MobileSMS", a3, a4, 0, v129, &stru_1EF8E78C8, v137, 0, 0, 0, v138);

    v132[2](v132, v34, v34);
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v154 = a4;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Registered event of type %lu with Biome", buf, 0xCu);
      }
    }
  }
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v126 = v14;
  uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v36, (uint64_t)&v149, (uint64_t)v167, 16);
  if (v134)
  {
    uint64_t v127 = *(void *)v150;
    do
    {
      for (uint64_t i = 0; i != v134; ++i)
      {
        if (*(void *)v150 != v127) {
          objc_enumerationMutation(v126);
        }
        v148 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        context = (void *)MEMORY[0x1A6264150]();
        v40 = objc_msgSend_imageData(v148, v37, v38, v39);
        v145 = (void *)IMRescaledImageDataFromDataForBiomeDonation();

        if (v139) {
          objc_msgSend_messagesURLWithMessageGUID_(v133, v41, (uint64_t)v139, v42);
        }
        else {
        v147 = objc_msgSend_messagesURLWithChat_(v133, v41, (uint64_t)v125, v42);
        }
        id v43 = objc_alloc(MEMORY[0x1E4F502F8]);
        v47 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v44, v45, v46);
        objc_msgSend_timeIntervalSinceReferenceDate(v47, v48, v49, v50);
        double v52 = v51;
        v56 = objc_msgSend_identifier(v148, v53, v54, v55);
        v58 = objc_msgSend_initWithChildID_deviceID_sourceBundleID_absoluteTimeStamp_eventDirection_eventType_contentType_contactHandles_contentID_conversationID_imageData_senderHandle_contentURL_conversationURL_(v43, v57, (uint64_t)v131, (uint64_t)v130, @"com.apple.MobileSMS", a3, a4, 0, v52, v129, v56, v137, v145, v136, v147, v138);

        id v141 = objc_alloc(MEMORY[0x1E4F502F8]);
        v143 = objc_msgSend_childID(v58, v59, v60, v61);
        v144 = objc_msgSend_deviceID(v58, v62, v63, v64);
        v142 = objc_msgSend_sourceBundleID(v58, v65, v66, v67);
        objc_msgSend_absoluteTimestamp(v58, v68, v69, v70);
        double v72 = v71;
        uint64_t v76 = objc_msgSend_eventDirection(v58, v73, v74, v75);
        uint64_t v80 = objc_msgSend_eventType(v58, v77, v78, v79);
        uint64_t v84 = objc_msgSend_contentType(v58, v81, v82, v83);
        v88 = objc_msgSend_contactHandles(v58, v85, v86, v87);
        v92 = objc_msgSend_contentID(v58, v89, v90, v91);
        v96 = objc_msgSend_conversationID(v58, v93, v94, v95);
        v100 = objc_msgSend_senderHandle(v58, v97, v98, v99);
        v104 = objc_msgSend_contentURL(v58, v101, v102, v103);
        v108 = objc_msgSend_conversationURL(v58, v105, v106, v107);
        v110 = objc_msgSend_initWithChildID_deviceID_sourceBundleID_absoluteTimeStamp_eventDirection_eventType_contentType_contactHandles_contentID_conversationID_imageData_senderHandle_contentURL_conversationURL_(v141, v109, (uint64_t)v143, (uint64_t)v144, v142, v76, v80, v84, v72, v88, v92, v96, 0, v100, v104, v108);

        v132[2](v132, v58, v110);
        if (IMOSLoggingEnabled())
        {
          v111 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            v115 = objc_msgSend_identifier(v148, v112, v113, v114);
            v119 = objc_msgSend_absoluteString(v147, v116, v117, v118);
            v123 = objc_msgSend_absoluteString(v138, v120, v121, v122);
            *(_DWORD *)buf = 138413826;
            unint64_t v154 = (unint64_t)v139;
            __int16 v155 = 2048;
            unint64_t v156 = a4;
            __int16 v157 = 2112;
            id v158 = v136;
            __int16 v159 = 2112;
            v160 = v115;
            __int16 v161 = 2112;
            v162 = v119;
            __int16 v163 = 2112;
            v164 = v137;
            __int16 v165 = 2112;
            v166 = v123;
            _os_log_impl(&dword_1A4AF7000, v111, OS_LOG_TYPE_INFO, "Registered event with messageGUID %@, of type %lu, sender %@, contentID %@, contentURL %@, conversationID %@, conversationURL %@ with Biome", buf, 0x48u);
          }
        }
      }
      uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v126, v124, (uint64_t)&v149, (uint64_t)v167, 16);
    }
    while (v134);
  }
}

@end