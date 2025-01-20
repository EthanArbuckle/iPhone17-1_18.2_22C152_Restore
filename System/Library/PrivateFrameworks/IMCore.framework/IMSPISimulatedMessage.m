@interface IMSPISimulatedMessage
+ (id)_dateFormatter;
- (BOOL)fromMe;
- (IMSPISimulatedMessage)init;
- (IMSPISimulatedMessage)initWithDictionaryRepresentation:(id)a3;
- (NSArray)handles;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (NSString)accountID;
- (NSString)chatGUID;
- (NSString)effectID;
- (NSString)groupID;
- (NSString)lastAddressedHandle;
- (NSString)sender;
- (NSString)serviceName;
- (NSString)text;
- (id)_calculateSender;
- (id)_calculateServiceName;
- (id)_calculateTimestamp;
- (id)_createItem;
- (id)_createSimulatedMessage;
- (unint64_t)flags;
- (void)setAccountID:(id)a3;
- (void)setChatGUID:(id)a3;
- (void)setDate:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setGroupID:(id)a3;
- (void)setHandles:(id)a3;
- (void)setLastAddressedHandle:(id)a3;
- (void)setSender:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setText:(id)a3;
@end

@implementation IMSPISimulatedMessage

- (id)_calculateSender
{
  if (objc_msgSend_fromMe(self, a2, v2, v3))
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend_sender(self, v5, v6, v7);

    if (v9)
    {
      v8 = objc_msgSend_sender(self, v10, v11, v12);
    }
    else
    {
      v13 = objc_msgSend_handles(self, v10, v11, v12);
      v8 = objc_msgSend_firstObject(v13, v14, v15, v16);
    }
  }

  return v8;
}

- (id)_calculateServiceName
{
  v4 = objc_msgSend_serviceName(self, a2, v2, v3);
  v5 = v4;
  if (!v4) {
    v4 = (void *)*MEMORY[0x1E4F6E1A0];
  }
  id v6 = v4;

  return v6;
}

- (id)_calculateTimestamp
{
  v4 = objc_msgSend_date(self, a2, v2, v3);
  v8 = v4;
  if (v4)
  {
    id v9 = v4;
  }
  else
  {
    objc_msgSend_now(MEMORY[0x1E4F1C9C8], v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)_createItem
{
  v5 = objc_msgSend__calculateSender(self, a2, v2, v3);
  id v9 = objc_msgSend__calculateTimestamp(self, v6, v7, v8);
  id v10 = objc_alloc(MEMORY[0x1E4F6E850]);
  v14 = objc_msgSend_stringGUID(NSString, v11, v12, v13);
  uint64_t v16 = objc_msgSend_initWithSender_time_guid_type_(v10, v15, (uint64_t)v5, (uint64_t)v9, v14, 0);

  v20 = objc_msgSend__calculateServiceName(self, v17, v18, v19);
  objc_msgSend_setService_(v16, v21, (uint64_t)v20, v22);

  uint64_t v26 = objc_msgSend_flags(self, v23, v24, v25);
  objc_msgSend_setFlags_(v16, v27, v26, v28);
  if (objc_msgSend_fromMe(self, v29, v30, v31))
  {
    uint64_t v35 = objc_msgSend_flags(v16, v32, v33, v34);
    objc_msgSend_setFlags_(v16, v36, v35 | 4, v37);
    uint64_t v41 = objc_msgSend_flags(v16, v38, v39, v40);
    objc_msgSend_setFlags_(v16, v42, v41 | 0x8000, v43);
  }
  v44 = objc_msgSend_accountID(self, v32, v33, v34);
  objc_msgSend_setAccountID_(v16, v45, (uint64_t)v44, v46);

  if (!objc_msgSend_flags(self, v47, v48, v49))
  {
    uint64_t v53 = objc_msgSend_flags(v16, v50, v51, v52);
    objc_msgSend_setFlags_(v16, v54, v53 | 1, v55);
    uint64_t v59 = objc_msgSend_flags(v16, v56, v57, v58);
    objc_msgSend_setFlags_(v16, v60, v59 & 0xFFFFFFFFFFFFFFF7, v61);
  }
  id v62 = objc_alloc(MEMORY[0x1E4F6EA90]);
  v65 = objc_msgSend_initWithContent_(v62, v63, (uint64_t)&stru_1EF8E78C8, v64);
  v69 = objc_msgSend_text(self, v66, v67, v68);
  objc_msgSend_appendString_(v65, v70, (uint64_t)v69, v71);

  v75 = objc_msgSend_body(v65, v72, v73, v74);
  objc_msgSend_setBody_(v16, v76, (uint64_t)v75, v77);

  v81 = objc_msgSend_body(v65, v78, v79, v80);
  v85 = objc_msgSend_string(v81, v82, v83, v84);
  objc_msgSend_setPlainBody_(v16, v86, (uint64_t)v85, v87);

  v91 = objc_msgSend_lastAddressedHandle(self, v88, v89, v90);
  objc_msgSend_setDestinationCallerID_(v16, v92, (uint64_t)v91, v93);

  v97 = objc_msgSend_effectID(self, v94, v95, v96);
  objc_msgSend_setExpressiveSendStyleID_(v16, v98, (uint64_t)v97, v99);

  return v16;
}

- (id)_createSimulatedMessage
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F6EA30]);
  uint64_t v7 = objc_msgSend__createItem(self, v4, v5, v6);
  objc_msgSend_setItem_(v3, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_groupID(self, v10, v11, v12);
  objc_msgSend_setGroupID_(v3, v14, (uint64_t)v13, v15);

  uint64_t v19 = objc_msgSend_chatGUID(self, v16, v17, v18);
  objc_msgSend_setChatGUID_(v3, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_handles(self, v22, v23, v24);
  objc_msgSend_setHandles_(v3, v26, (uint64_t)v25, v27);

  uint64_t v31 = objc_msgSend_lastAddressedHandle(self, v28, v29, v30);
  objc_msgSend_setLastAddressedHandle_(v3, v32, (uint64_t)v31, v33);

  return v3;
}

- (IMSPISimulatedMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMSPISimulatedMessage;
  return [(IMSPISimulatedMessage *)&v3 init];
}

+ (id)_dateFormatter
{
  if (qword_1E965E8E8 != -1) {
    dispatch_once(&qword_1E965E8E8, &unk_1EF8E5358);
  }
  uint64_t v2 = (void *)qword_1E965E8E0;

  return v2;
}

- (IMSPISimulatedMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v10 = (IMSPISimulatedMessage *)objc_msgSend_init(self, v5, v6, v7);
  if (v10)
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"text", v9);
    objc_msgSend_setText_(v10, v12, (uint64_t)v11, v13);

    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"sender", v15);
    objc_msgSend_setSender_(v10, v17, (uint64_t)v16, v18);

    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"serviceName", v20);
    objc_msgSend_setServiceName_(v10, v22, (uint64_t)v21, v23);

    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v4, v24, @"accountID", v25);
    objc_msgSend_setAccountID_(v10, v27, (uint64_t)v26, v28);

    uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(v4, v29, @"fromMe", v30);
    uint64_t v35 = objc_msgSend_BOOLValue(v31, v32, v33, v34);
    objc_msgSend_setFromMe_(v10, v36, v35, v37);

    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v4, v38, @"chatGUID", v39);
    objc_msgSend_setChatGUID_(v10, v41, (uint64_t)v40, v42);

    v45 = objc_msgSend_objectForKeyedSubscript_(v4, v43, @"groupID", v44);
    objc_msgSend_setGroupID_(v10, v46, (uint64_t)v45, v47);

    v50 = objc_msgSend_objectForKeyedSubscript_(v4, v48, @"handles", v49);
    objc_msgSend_setHandles_(v10, v51, (uint64_t)v50, v52);

    uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v4, v53, @"lastAddressedHandle", v54);
    objc_msgSend_setLastAddressedHandle_(v10, v56, (uint64_t)v55, v57);

    v60 = objc_msgSend_objectForKeyedSubscript_(v4, v58, @"flags", v59);
    unsigned int v64 = objc_msgSend_unsignedIntValue(v60, v61, v62, v63);
    objc_msgSend_setFlags_(v10, v65, v64, v66);

    v72 = objc_msgSend_objectForKeyedSubscript_(v4, v67, @"date", v68);
    if (v72)
    {
      uint64_t v73 = objc_msgSend__dateFormatter(IMSPISimulatedMessage, v69, v70, v71);
      v76 = objc_msgSend_dateFromString_(v73, v74, (uint64_t)v72, v75);
      objc_msgSend_setDate_(v10, v77, (uint64_t)v76, v78);
    }
    uint64_t v79 = objc_msgSend_objectForKeyedSubscript_(v4, v69, @"effectID", v71);
    objc_msgSend_setEffectID_(v10, v80, (uint64_t)v79, v81);
  }
  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_msgSend_text(self, v4, v5, v6);

  if (v7)
  {
    uint64_t v11 = objc_msgSend_text(self, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"text");
  }
  uint64_t v13 = objc_msgSend_sender(self, v8, v9, v10);

  if (v13)
  {
    uint64_t v17 = objc_msgSend_sender(self, v14, v15, v16);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, @"sender");
  }
  uint64_t v19 = objc_msgSend_serviceName(self, v14, v15, v16);

  if (v19)
  {
    uint64_t v23 = objc_msgSend_serviceName(self, v20, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, @"serviceName");
  }
  uint64_t v25 = objc_msgSend_accountID(self, v20, v21, v22);

  if (v25)
  {
    uint64_t v29 = objc_msgSend_accountID(self, v26, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, @"accountID");
  }
  uint64_t v31 = NSNumber;
  uint64_t v32 = objc_msgSend_fromMe(self, v26, v27, v28);
  uint64_t v35 = objc_msgSend_numberWithBool_(v31, v33, v32, v34);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v36, (uint64_t)v35, @"fromMe");

  uint64_t v40 = objc_msgSend_chatGUID(self, v37, v38, v39);

  if (v40)
  {
    uint64_t v44 = objc_msgSend_chatGUID(self, v41, v42, v43);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, @"chatGUID");
  }
  uint64_t v46 = objc_msgSend_groupID(self, v41, v42, v43);

  if (v46)
  {
    v50 = objc_msgSend_groupID(self, v47, v48, v49);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v51, (uint64_t)v50, @"groupID");
  }
  uint64_t v52 = objc_msgSend_handles(self, v47, v48, v49);

  if (v52)
  {
    v56 = objc_msgSend_handles(self, v53, v54, v55);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, @"handles");
  }
  uint64_t v58 = objc_msgSend_lastAddressedHandle(self, v53, v54, v55);

  if (v58)
  {
    uint64_t v62 = objc_msgSend_lastAddressedHandle(self, v59, v60, v61);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v63, (uint64_t)v62, @"lastAddressedHandle");
  }
  unsigned int v64 = objc_msgSend_date(self, v59, v60, v61);

  if (v64)
  {
    uint64_t v68 = objc_msgSend__dateFormatter(IMSPISimulatedMessage, v65, v66, v67);
    v72 = objc_msgSend_date(self, v69, v70, v71);
    uint64_t v75 = objc_msgSend_stringFromDate_(v68, v73, (uint64_t)v72, v74);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v76, (uint64_t)v75, @"date");
  }
  uint64_t v77 = objc_msgSend_effectID(self, v65, v66, v67);

  if (v77)
  {
    uint64_t v81 = objc_msgSend_effectID(self, v78, v79, v80);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v82, (uint64_t)v81, @"effectID");
  }
  if (objc_msgSend_flags(self, v78, v79, v80))
  {
    v86 = NSNumber;
    uint64_t v87 = objc_msgSend_flags(self, v83, v84, v85);
    uint64_t v90 = objc_msgSend_numberWithUnsignedLongLong_(v86, v88, v87, v89);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v91, (uint64_t)v90, @"flags");
  }
  v92 = objc_msgSend_copy(v3, v83, v84, v85);

  return (NSDictionary *)v92;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (BOOL)fromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)effectID
{
  return self->_effectID;
}

- (void)setEffectID:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSString)lastAddressedHandle
{
  return self->_lastAddressedHandle;
}

- (void)setLastAddressedHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_effectID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end