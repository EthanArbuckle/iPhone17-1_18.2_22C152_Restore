@interface IMCarrierReportJunkHelper
+ (BOOL)canReportJunkOverCellularServiceOfMessageItem:(id)a3;
+ (BOOL)isRCSServiceName:(id)a3;
+ (BOOL)isReportJunkServiceAllowedForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4;
+ (BOOL)userInHomeCountryWithDestinationCallerID:(id)a3;
+ (BOOL)validateReportJunkCarrierAddress:(id)a3;
+ (BOOL)wifiCallingEnabledForDestinationCallerID:(id)a3;
+ (id)createJunkReportMessageBodyTextForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5;
+ (id)createJunkReportMessageItemBodyForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5;
+ (id)fetchMMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4;
+ (id)fetchSMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4;
+ (id)jsonSerializeDictionary:(id)a3;
+ (id)jsonSerializeDictionaryStrippingOutMessageContent:(id)a3;
+ (id)junkReportMessageItemForMessageItem:(id)a3 account:(id)a4 junkChatStyle:(unsigned __int8)a5 serviceName:(id)a6;
+ (id)receiveDateForMessageItem:(id)a3;
+ (id)reportJunkCarrierAddressForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4;
+ (void)collectReportJunkMetricsForChatbotJunkMessageItem:(id)a3 totalMessagesInThread:(unint64_t)a4;
+ (void)collectReportJunkMetricsForJunkMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 totalMessagesInThread:(unint64_t)a5;
+ (void)setHandleParametersOfMessageItem:(id)a3 usingAccount:(id)a4 usingMessageItem:(id)a5 junkChatStyle:(unsigned __int8)a6;
@end

@implementation IMCarrierReportJunkHelper

+ (BOOL)isRCSServiceName:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_rcsService(IMService, v4, v5, v6);
  v11 = objc_msgSend_internalName(v7, v8, v9, v10);
  char isEqualToString = objc_msgSend_isEqualToString_(v3, v12, (uint64_t)v11, v13);

  return isEqualToString;
}

+ (id)junkReportMessageItemForMessageItem:(id)a3 account:(id)a4 junkChatStyle:(unsigned __int8)a5 serviceName:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v14 = objc_msgSend_createJunkReportMessageItemBodyForMessageItem_junkChatStyle_serviceName_(a1, v13, (uint64_t)v10, v7, v12);
  if (objc_msgSend_isRCSServiceName_(a1, v15, (uint64_t)v12, v16))
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v20 = objc_msgSend_fileTransferGUIDs(v10, v17, v18, v19);
  }
  id v21 = objc_alloc(MEMORY[0x1E4F6E850]);
  v25 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v22, v23, v24);
  v29 = objc_msgSend_stringGUID(NSString, v26, v27, v28);
  v31 = objc_msgSend_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_threadIdentifier_(v21, v30, 0, (uint64_t)v25, v14, 0, v20, 5, 0, v29, 0);

  v35 = objc_msgSend_destinationCallerID(v10, v32, v33, v34);
  objc_msgSend_setDestinationCallerID_(v31, v36, (uint64_t)v35, v37);

  objc_msgSend_setHandleParametersOfMessageItem_usingAccount_usingMessageItem_junkChatStyle_(a1, v38, (uint64_t)v31, (uint64_t)v11, v10, v7);
  if (IMOSLoggingEnabled())
  {
    v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v31;
      _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "IMMessageItem for reporting junk -> %@", buf, 0xCu);
    }
  }

  return v31;
}

+ (BOOL)canReportJunkOverCellularServiceOfMessageItem:(id)a3
{
  uint64_t v5 = objc_msgSend_destinationCallerID(a3, a2, (uint64_t)a3, v3);
  char v8 = objc_msgSend_userInHomeCountryWithDestinationCallerID_(a1, v6, (uint64_t)v5, v7);
  LOBYTE(a1) = objc_msgSend_wifiCallingEnabledForDestinationCallerID_(a1, v9, (uint64_t)v5, v10) | v8;

  return (char)a1;
}

+ (BOOL)isReportJunkServiceAllowedForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A4CBA3CC(v10);
    }
    goto LABEL_12;
  }
  uint64_t v10 = objc_msgSend_reportJunkCarrierAddressForMessageItem_junkChatStyle_(a1, v6, (uint64_t)v7, v4);
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Found nil carrier address in carrier bundle. Report Junk not allowed.", v22, 2u);
      }
    }
LABEL_12:
    char v11 = 0;
    goto LABEL_13;
  }
  char v11 = objc_msgSend_validateReportJunkCarrierAddress_(a1, v8, (uint64_t)v10, v9);
  id v12 = (void *)MEMORY[0x1E4F6E660];
  uint64_t v16 = objc_msgSend_destinationCallerID(v7, v13, v14, v15);
  uint64_t v19 = objc_msgSend_carrierNameForPhoneNumber_(v12, v17, (uint64_t)v16, v18);

  if (!v19) {
    char v11 = 0;
  }

LABEL_13:
  return v11;
}

+ (void)collectReportJunkMetricsForJunkMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 totalMessagesInThread:(unint64_t)a5
{
  int v6 = a4;
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v12 = objc_msgSend_service(v8, v9, v10, v11);
  int isRCSServiceName = objc_msgSend_isRCSServiceName_(a1, v13, (uint64_t)v12, v14);

  unint64_t v112 = a5;
  if (isRCSServiceName)
  {
    BOOL v19 = v6 == 45;
    uint64_t v20 = 10;
    goto LABEL_5;
  }
  id v21 = objc_msgSend_subject(v8, v16, v17, v18);
  if (objc_msgSend_length(v21, v22, v23, v24))
  {

    BOOL v19 = v6 == 45;
    uint64_t v20 = 2;
LABEL_5:
    if (!v19) {
      ++v20;
    }
    goto LABEL_7;
  }
  v103 = objc_msgSend_fileTransferGUIDs(v8, v25, v26, v27);
  uint64_t v107 = objc_msgSend_count(v103, v104, v105, v106);

  uint64_t v20 = 2;
  if (v6 == 45)
  {
    if (!v107) {
      uint64_t v20 = 1;
    }
  }
  else
  {
    uint64_t v20 = 3;
  }
LABEL_7:
  uint64_t v108 = v20;
  uint64_t v28 = objc_msgSend_destinationCallerID(v8, v16, v17, v18);
  int v31 = objc_msgSend_userInHomeCountryWithDestinationCallerID_(a1, v29, (uint64_t)v28, v30);

  uint64_t v35 = 4;
  if (!v31) {
    uint64_t v35 = 5;
  }
  uint64_t v110 = v35;
  v36 = (void *)MEMORY[0x1E4F6E660];
  uint64_t v37 = objc_msgSend_destinationCallerID(v8, v32, v33, v34);
  v111 = objc_msgSend_carrierNameForPhoneNumber_(v36, v38, (uint64_t)v37, v39);

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v43 = objc_msgSend_fileTransferGUIDs(v8, v40, v41, v42);
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v114, (uint64_t)v118, 16);
  if (v45)
  {
    uint64_t v49 = v45;
    uint64_t v50 = 0;
    uint64_t v51 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v115 != v51) {
          objc_enumerationMutation(v43);
        }
        uint64_t v53 = *(void *)(*((void *)&v114 + 1) + 8 * i);
        v54 = objc_msgSend_sharedInstance(IMFileTransferCenter, v46, v47, v48);
        v57 = objc_msgSend_transferForGUID_(v54, v55, v53, v56);

        v50 += objc_msgSend_totalBytes(v57, v58, v59, v60);
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v114, (uint64_t)v118, 16);
    }
    while (v49);
  }
  else
  {
    uint64_t v50 = 0;
  }

  v113 = v8;
  v64 = objc_msgSend_body(v8, v61, v62, v63);
  v68 = objc_msgSend_string(v64, v65, v66, v67);
  uint64_t v72 = objc_msgSend_length(v68, v69, v70, v71);

  id v109 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v75 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v73, v112, v74);
  uint64_t v76 = *MEMORY[0x1E4F6D7F8];
  v79 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v77, v108, v78);
  uint64_t v80 = *MEMORY[0x1E4F6D7E8];
  v83 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v81, v72, v82);
  uint64_t v84 = *MEMORY[0x1E4F6D800];
  v87 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v85, v50, v86);
  uint64_t v88 = *MEMORY[0x1E4F6D7C8];
  v91 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v89, v110, v90);
  v94 = objc_msgSend_initWithObjectsAndKeys_(v109, v92, (uint64_t)v75, v93, v76, v79, v80, v83, v84, v87, v88, v91, *MEMORY[0x1E4F6D7F0], 0);

  if (objc_msgSend_length(v111, v95, v96, v97)) {
    objc_msgSend_setObject_forKey_(v94, v98, (uint64_t)v111, *MEMORY[0x1E4F6D7D0]);
  }
  v101 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v98, v99, v100);
  objc_msgSend_trackEvent_withDictionary_(v101, v102, *MEMORY[0x1E4F6D7C0], (uint64_t)v94);
}

+ (void)collectReportJunkMetricsForChatbotJunkMessageItem:(id)a3 totalMessagesInThread:(unint64_t)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v9 = objc_msgSend_fileTransferGUIDs(v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v63, (uint64_t)v67, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v64 != v17) {
          objc_enumerationMutation(v9);
        }
        uint64_t v19 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_sharedInstance(IMFileTransferCenter, v12, v13, v14);
        uint64_t v23 = objc_msgSend_transferForGUID_(v20, v21, v19, v22);

        v16 += objc_msgSend_totalBytes(v23, v24, v25, v26);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v63, (uint64_t)v67, 16);
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  uint64_t v30 = objc_msgSend_body(v5, v27, v28, v29);
  uint64_t v34 = objc_msgSend_string(v30, v31, v32, v33);
  uint64_t v38 = objc_msgSend_length(v34, v35, v36, v37);

  id v39 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v42 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v40, a4, v41);
  uint64_t v43 = *MEMORY[0x1E4F6D7F8];
  v46 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v44, 12, v45);
  uint64_t v47 = *MEMORY[0x1E4F6D7E8];
  uint64_t v50 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v48, v38, v49);
  uint64_t v51 = *MEMORY[0x1E4F6D800];
  v54 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v52, v16, v53);
  v57 = objc_msgSend_initWithObjectsAndKeys_(v39, v55, (uint64_t)v42, v56, v43, v46, v47, v50, v51, v54, *MEMORY[0x1E4F6D7C8], 0);

  v61 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v58, v59, v60);
  objc_msgSend_trackEvent_withDictionary_(v61, v62, *MEMORY[0x1E4F6D7C0], (uint64_t)v57);
}

+ (void)setHandleParametersOfMessageItem:(id)a3 usingAccount:(id)a4 usingMessageItem:(id)a5 junkChatStyle:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend_reportJunkCarrierAddressForMessageItem_junkChatStyle_(a1, v12, (uint64_t)a5, v6);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_imHandleWithID_(v10, v13, (uint64_t)v34, v14);

  uint64_t v19 = objc_msgSend_ID(v15, v16, v17, v18);
  objc_msgSend_setHandle_(v11, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_originalID(v15, v22, v23, v24);
  objc_msgSend_setUnformattedID_(v11, v26, (uint64_t)v25, v27);

  int v31 = objc_msgSend_countryCode(v15, v28, v29, v30);
  objc_msgSend_setCountryCode_(v11, v32, (uint64_t)v31, v33);
}

+ (id)reportJunkCarrierAddressForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v10 = objc_msgSend_destinationCallerID(v6, v7, v8, v9);
  if (!v10 || (IMStringIsEmail() & 1) != 0)
  {
    id v11 = 0;
    goto LABEL_14;
  }
  int v12 = MEMORY[0x1A62639B0](v10);
  id v13 = v10;
  BOOL v17 = v12 == 0;
  if (v12) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v17) {
    uint64_t v19 = v13;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = objc_msgSend_subject(v6, v14, v15, v16);
  if (objc_msgSend_length(v20, v21, v22, v23))
  {
  }
  else
  {
    uint64_t v30 = objc_msgSend_fileTransferGUIDs(v6, v24, v25, v26);
    uint64_t v34 = objc_msgSend_count(v30, v31, v32, v33);

    if (v4 == 45 && !v34)
    {
      uint64_t v28 = objc_msgSend_fetchSMSReportJunkCarrierAddressForPhoneNumber_simID_(a1, v27, (uint64_t)v18, (uint64_t)v19);
      goto LABEL_13;
    }
  }
  uint64_t v28 = objc_msgSend_fetchMMSReportJunkCarrierAddressForPhoneNumber_simID_(a1, v27, (uint64_t)v18, (uint64_t)v19);
LABEL_13:
  id v11 = (void *)v28;

LABEL_14:

  return v11;
}

+ (id)fetchSMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_carrierBundleValueForKeyHierarchy_phoneNumber_simID_(MEMORY[0x1E4F6E660], v7, (uint64_t)&unk_1EF914710, (uint64_t)v5, v6);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    int v12 = objc_msgSend_valueForKey_(v9, v10, @"SMSCarrierReportJunkAddress", v11);
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        uint64_t v18 = v12;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Report junk address provided by carrier is -> %@.\n", (uint8_t *)&v17, 0xCu);
      }
    }
    id v14 = v12;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412546;
        uint64_t v18 = &unk_1EF914710;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nCarrier Bundle object -> %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)fetchMMSReportJunkCarrierAddressForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = objc_msgSend_carrierBundleValueForKeyHierarchy_phoneNumber_simID_(MEMORY[0x1E4F6E660], v7, (uint64_t)&unk_1EF914728, (uint64_t)v5, v6);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = v8;
    int v12 = objc_msgSend_valueForKey_(v9, v10, @"MMSCarrierReportJunkAddress", v11);
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        uint64_t v18 = v12;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Report junk address provided by carrier is -> %@.\n", (uint8_t *)&v17, 0xCu);
      }
    }
    id v14 = v12;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412546;
        uint64_t v18 = &unk_1EF914728;
        __int16 v19 = 2112;
        uint64_t v20 = v8;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nCarrier Bundle object -> %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)createJunkReportMessageItemBodyForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v11 = objc_msgSend_createJunkReportMessageBodyTextForMessageItem_junkChatStyle_serviceName_(a1, v10, (uint64_t)v8, v6, v9);
  LOBYTE(v6) = objc_msgSend_isRCSServiceName_(a1, v12, (uint64_t)v9, v13);

  if (v6)
  {
    int v17 = (void *)MEMORY[0x1E4F1CBF0];
    objc_msgSend___im_attributedStringWithFileTransfers_(MEMORY[0x1E4F28B18], v14, MEMORY[0x1E4F1CBF0], v16);
  }
  else
  {
    int v17 = objc_msgSend_fileTransferGUIDs(v8, v14, v15, v16);
    objc_msgSend___im_attributedStringWithFileTransfers_(MEMORY[0x1E4F28B18], v18, (uint64_t)v17, v19);
  uint64_t v20 = };
  uint64_t v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
  objc_msgSend_appendAttributedString_(v24, v25, (uint64_t)v11, v26);
  uint64_t v30 = objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(v24, v27, v28, v29);

  return v30;
}

+ (id)createJunkReportMessageBodyTextForMessageItem:(id)a3 junkChatStyle:(unsigned __int8)a4 serviceName:(id)a5
{
  int v6 = a4;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v97 = a5;
  int v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v9, v10, v11);
  uint64_t v16 = objc_msgSend_subject(v8, v13, v14, v15);
  uint64_t v23 = @"MMS";
  if (!objc_msgSend_length(v16, v17, v18, v19))
  {
    uint64_t v24 = objc_msgSend_fileTransferGUIDs(v8, v20, v21, v22);
    if (objc_msgSend_count(v24, v25, v26, v27)) {
      BOOL v28 = 0;
    }
    else {
      BOOL v28 = v6 == 45;
    }
    if (v28) {
      uint64_t v23 = @"SMS";
    }
  }
  uint64_t v29 = v23;
  id v30 = (id)qword_1E965C800;
  if (objc_msgSend_isRCSServiceName_(a1, v31, (uint64_t)v97, v32))
  {
    uint64_t v34 = (__CFString *)v97;

    id v35 = (id)qword_1E965C808;
    id v39 = objc_msgSend_fallbackHash(v8, v36, v37, v38);
    unint64_t v42 = objc_msgSend_rangeOfString_(v39, v40, @"__", v41);
    if (v42 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v46 = v42;
      if (v42 <= objc_msgSend_length(v39, v43, v44, v45))
      {
        uint64_t v47 = objc_msgSend_substringToIndex_(v39, v43, v46, v45);

        id v39 = (void *)v47;
      }
    }
    if (v39) {
      objc_msgSend_setValue_forKey_(v12, v43, (uint64_t)v39, @"e");
    }
    uint64_t v48 = objc_msgSend_sharedInstance(IMFileTransferCenter, v43, v44, v45);
    v52 = objc_msgSend_fileTransferGUIDs(v8, v49, v50, v51);
    uint64_t v56 = objc_msgSend_firstObject(v52, v53, v54, v55);
    uint64_t v59 = objc_msgSend_transferForGUID_(v48, v57, (uint64_t)v56, v58);

    long long v63 = objc_msgSend_originalFilename(v59, v60, v61, v62);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v64, (uint64_t)v63, @"a");

    uint64_t v29 = v34;
    id v30 = v35;
  }
  objc_msgSend_setValue_forKey_(v12, v33, (uint64_t)v29, @"r");
  objc_msgSend_setValue_forKey_(v12, v65, (uint64_t)v30, @"v");
  v69 = objc_msgSend_handle(v8, v66, v67, v68);
  v73 = objc_msgSend_im_stripCategoryLabel(v69, v70, v71, v72);

  if (v73) {
    objc_msgSend_setValue_forKey_(v12, v74, (uint64_t)v73, @"f");
  }
  v79 = objc_msgSend_receiveDateForMessageItem_(a1, v74, (uint64_t)v8, v75);
  if (v79) {
    objc_msgSend_setValue_forKey_(v12, v76, (uint64_t)v79, @"t");
  }
  uint64_t v80 = objc_msgSend_body(v8, v76, v77, v78);
  uint64_t v84 = objc_msgSend_string(v80, v81, v82, v83);

  if (v84) {
    objc_msgSend_setValue_forKey_(v12, v85, (uint64_t)v84, @"m");
  }
  v87 = objc_msgSend_jsonSerializeDictionary_(a1, v85, (uint64_t)v12, v86);
  if (IMOSLoggingEnabled())
  {
    uint64_t v88 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      v91 = objc_msgSend_jsonSerializeDictionaryStrippingOutMessageContent_(a1, v89, (uint64_t)v12, v90);
      *(_DWORD *)buf = 138412290;
      uint64_t v99 = v91;
      _os_log_impl(&dword_1A4AF7000, v88, OS_LOG_TYPE_INFO, "Created serialize junk report: %@", buf, 0xCu);
    }
  }
  id v92 = objc_alloc(MEMORY[0x1E4F28E48]);
  v95 = objc_msgSend_initWithString_(v92, v93, (uint64_t)v87, v94);

  return v95;
}

+ (id)receiveDateForMessageItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_time(v3, v4, v5, v6);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v11 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v9, @"en_US_POSIX", v10);
  objc_msgSend_setLocale_(v8, v12, (uint64_t)v11, v13);
  objc_msgSend_setDateFormat_(v8, v14, @"yyyy-MM-dd HH:mm:ss ZZZ", v15);
  uint64_t v18 = objc_msgSend_stringFromDate_(v8, v16, (uint64_t)v7, v17);
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      uint64_t v22 = v18;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Receiving date of message item -> %@", (uint8_t *)&v21, 0xCu);
    }
  }

  return v18;
}

+ (id)jsonSerializeDictionary:(id)a3
{
  id v3 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], a2, (uint64_t)a3, 0, 0);
  id v4 = [NSString alloc];
  uint64_t v6 = objc_msgSend_initWithData_encoding_(v4, v5, (uint64_t)v3, 4);

  return v6;
}

+ (id)jsonSerializeDictionaryStrippingOutMessageContent:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  id v9 = objc_msgSend_dictionaryWithDictionary_(v5, v7, (uint64_t)v6, v8);

  objc_msgSend_setObject_forKey_(v9, v10, @"(hidden)", @"m");
  uint64_t v13 = objc_msgSend_jsonSerializeDictionary_(a1, v11, (uint64_t)v9, v12);

  return v13;
}

+ (BOOL)validateReportJunkCarrierAddress:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)a3;
  uint64_t v6 = objc_msgSend_predicateWithFormat_(MEMORY[0x1E4F28F60], v4, @"SELF MATCHES %@", v5, @"^[+]?[0-9]+$");
  if (objc_msgSend_evaluateWithObject_(v6, v7, (uint64_t)v3, v8))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1BA70]);
    uint64_t v12 = objc_msgSend_initWithStringValue_(v9, v10, (uint64_t)v3, v11);
    uint64_t v16 = objc_msgSend_digitsRemovingDialingCode(v12, v13, v14, v15);
    int v20 = objc_msgSend_length(v16, v17, v18, v19);
    BOOL v21 = v20 < 11;
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = @"NO";
        if (v20 < 11) {
          uint64_t v23 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v23;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Is valid carrier report junk address - %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v3;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Not a valid report junk address from carrier. Carrier report junk address - %@", buf, 0xCu);
      }
    }
    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)userInHomeCountryWithDestinationCallerID:(id)a3
{
  id v3 = a3;
  if (v3 && (IMStringIsEmail() & 1) == 0)
  {
    int v5 = MEMORY[0x1A62639B0](v3);
    id v6 = v3;
    BOOL v10 = v5 == 0;
    if (v5) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v10) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v7, v8, v9);
    uint64_t v17 = objc_msgSend_ctSubscriptionInfo(v13, v14, v15, v16);
    uint64_t v19 = objc_msgSend___im_subscriptionContextForForSimID_phoneNumber_(v17, v18, (uint64_t)v12, (uint64_t)v11);

    uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v20, v21, v22);
    char v4 = objc_msgSend_simInHomeCountryWithSubscriptionContext_(v23, v24, (uint64_t)v19, v25);
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)wifiCallingEnabledForDestinationCallerID:(id)a3
{
  id v3 = a3;
  if (v3 && (IMStringIsEmail() & 1) == 0)
  {
    int v5 = MEMORY[0x1A62639B0](v3);
    id v6 = v3;
    BOOL v10 = v5 == 0;
    if (v5) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v10) {
      uint64_t v12 = v6;
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v7, v8, v9);
    uint64_t v17 = objc_msgSend_ctSubscriptionInfo(v13, v14, v15, v16);
    uint64_t v19 = objc_msgSend___im_subscriptionContextForForSimID_phoneNumber_(v17, v18, (uint64_t)v12, (uint64_t)v11);

    uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v20, v21, v22);
    char v4 = objc_msgSend_wifiCallingEnabledForSubscriptionContext_(v23, v24, (uint64_t)v19, v25);
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

@end