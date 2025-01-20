@interface KVDonator
+ (BOOL)_isXPCDonationEnabledForItemType:(int64_t)a3;
+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7;
+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 error:(id *)a5;
+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 error:(id *)a6;
+ (id)donatorWithServiceProvider:(id)a3 cascadeItemType:(unsigned __int16)a4 originAppId:(id)a5 userId:(id)a6 error:(id *)a7;
+ (id)donatorWithServiceProvider:(id)a3 isExternalClient:(BOOL)a4 cascadeItemType:(unsigned __int16)a5 originAppId:(id)a6 userId:(id)a7 error:(id *)a8;
+ (void)initialize;
- (KVDonator)init;
- (KVDonator)initWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 userId:(id)a5 serviceProvider:(id)a6 isExternalClient:(BOOL)a7;
- (id)_descriptorsForItemType:(int64_t)a3 error:(id *)a4;
- (void)_donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6;
- (void)donateWithOptions:(unsigned __int16)a3 usingStream:(id)a4;
- (void)donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6;
@end

@implementation KVDonator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

- (id)_descriptorsForItemType:(int64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if ((unint64_t)a3 <= 0x12 && ((1 << a3) & 0x44102) != 0)
  {
    originAppId = self->_originAppId;
    id v18 = 0;
    v9 = objc_msgSend_sourceIdentifierWithValue_error_(MEMORY[0x1E4F57FD0], a2, (uint64_t)originAppId, (uint64_t)&v18, v4, v5);
    id v10 = v18;
    v14 = v10;
    if (v9)
    {
      v19[0] = v9;
      v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v19, 1, v12, v13);
    }
    else
    {
      v15 = sub_1BC3DC60C(v10);
      v16 = v15;
      if (a4 && v15) {
        *a4 = v15;
      }

      v6 = 0;
    }
  }
  return v6;
}

- (void)_donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6
{
  char v8 = a3;
  v72[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v15 = a6;
  if (v15)
  {
    uint64_t v21 = objc_msgSend_itemTypeFromCascadeItemType_(KVItemConverter, v11, self->_cascadeItemType, v12, v13, v14);
    if (self->_isExternalClient
      && (v22 = objc_opt_class(),
          (objc_msgSend__isXPCDonationEnabledForItemType_(v22, v23, v21, v24, v25, v26) & 1) == 0))
    {
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v44 = NSString;
      if ((unsigned __int16)v21 - 1 >= 0x1A) {
        uint64_t v45 = 0;
      }
      else {
        uint64_t v45 = (unsigned __int16)v21;
      }
      v46 = objc_msgSend_stringWithCString_encoding_(NSString, v16, (uint64_t)off_1E62AD038[v45], 4, v19, v20);
      v51 = objc_msgSend_stringWithFormat_(v44, v47, @"KVItemType: %@ not enabled for this device platform", v48, v49, v50, v46);
      v72[0] = v51;
      v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v52, (uint64_t)v72, (uint64_t)&v71, 1, v53);
      objc_msgSend_errorWithDomain_code_userInfo_(v43, v55, @"com.apple.koa.donate", 8, (uint64_t)v54, v56);
      id v29 = (id)objc_claimAutoreleasedReturnValue();

      v57 = qword_1EB5EE458;
      if (!os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315394;
      v68 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
      __int16 v69 = 2112;
      id v70 = v29;
      v58 = "%s Rejecting donation: %@";
    }
    else
    {
      if (!self->_userId
        || !objc_msgSend_isSiriMUXSupported(KVAssistantServicesBridge, v16, v17, v18, v19, v20))
      {
        v35 = 0;
        id v29 = 0;
        goto LABEL_11;
      }
      userId = self->_userId;
      id v66 = 0;
      v28 = objc_msgSend_iCloudAltDSIDFromSharedUserId_error_(KVAssistantServicesBridge, v16, (uint64_t)userId, (uint64_t)&v66, v19, v20);
      id v29 = v66;
      if (v28)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F4FB40]);
        v35 = objc_msgSend_initWithAccountIdentifier_(v30, v31, (uint64_t)v28, v32, v33, v34);

LABEL_11:
        v37 = v29;
        id v65 = v29;
        v38 = objc_msgSend__descriptorsForItemType_error_(self, v16, v21, (uint64_t)&v65, v19, v20);
        id v29 = v65;

        if (v38)
        {
          uint64_t v60 = MEMORY[0x1E4F143A8];
          uint64_t v61 = 3221225472;
          v62 = sub_1BC3BB6E8;
          v63 = &unk_1E62ACEC8;
          id v64 = v15;
          v40 = (void *)MEMORY[0x1C186EA80](&v60);
          serviceProvider = self->_serviceProvider;
          uint64_t cascadeItemType = self->_cascadeItemType;
          if (v8)
          {
            if (serviceProvider) {
              objc_msgSend_incrementalSetDonationWithItemType_forAccount_descriptors_version_validity_serviceProvider_completion_(MEMORY[0x1E4F57FD8], v39, cascadeItemType, (uint64_t)v35, (uint64_t)v38, a4, v10, v40, v60, v61, v62, v63);
            }
            else {
              objc_msgSend_incrementalSetDonationWithItemType_forAccount_descriptors_version_validity_completion_(MEMORY[0x1E4F57FD8], v39, cascadeItemType, (uint64_t)v35, (uint64_t)v38, a4, v10, v40);
            }
          }
          else if (serviceProvider)
          {
            objc_msgSend_fullSetDonationWithItemType_forAccount_descriptors_serviceProvider_completion_(MEMORY[0x1E4F57FD8], v39, cascadeItemType, (uint64_t)v35, (uint64_t)v38, (uint64_t)self->_serviceProvider, v40);
          }
          else
          {
            objc_msgSend_fullSetDonationWithItemType_forAccount_descriptors_completion_(MEMORY[0x1E4F57FD8], v39, cascadeItemType, (uint64_t)v35, (uint64_t)v38, (uint64_t)v40);
          }
        }
        else
        {
          v59 = qword_1EB5EE458;
          if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v68 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
            __int16 v69 = 2112;
            id v70 = v29;
            _os_log_error_impl(&dword_1BC3B6000, v59, OS_LOG_TYPE_ERROR, "%s Failed to resolve descriptors: %@", buf, 0x16u);
          }
          (*((void (**)(id, void, id))v15 + 2))(v15, 0, v29);
        }

        goto LABEL_33;
      }
      v57 = qword_1EB5EE458;
      if (!os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
      {
LABEL_28:
        (*((void (**)(id, void, id))v15 + 2))(v15, 0, v29);
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v68 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
      __int16 v69 = 2112;
      id v70 = v29;
      v58 = "%s Failed to resolve account identifier: %@";
    }
    _os_log_error_impl(&dword_1BC3B6000, v57, OS_LOG_TYPE_ERROR, v58, buf, 0x16u);
    goto LABEL_28;
  }
  v36 = qword_1EB5EE458;
  if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v68 = "-[KVDonator _donateWithOptions:version:validity:usingStream:]";
    _os_log_error_impl(&dword_1BC3B6000, v36, OS_LOG_TYPE_ERROR, "%s streamBlock parameter is nil.", buf, 0xCu);
  }
LABEL_34:
}

- (void)donateWithOptions:(unsigned __int16)a3 version:(unint64_t)a4 validity:(id)a5 usingStream:(id)a6
{
}

- (void)donateWithOptions:(unsigned __int16)a3 usingStream:(id)a4
{
}

- (KVDonator)initWithCascadeItemType:(unsigned __int16)a3 originAppId:(id)a4 userId:(id)a5 serviceProvider:(id)a6 isExternalClient:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KVDonator;
  v16 = [(KVDonator *)&v19 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_uint64_t cascadeItemType = a3;
    objc_storeStrong((id *)&v16->_originAppId, a4);
    objc_storeStrong((id *)&v17->_userId, a5);
    objc_storeStrong((id *)&v17->_serviceProvider, a6);
    v17->_isExternalClient = a7;
  }

  return v17;
}

- (KVDonator)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)_isXPCDonationEnabledForItemType:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  LOBYTE(v7) = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 20:
    case 21:
    case 24:
    case 25:
    case 26:
      return v7;
    case 5:
    case 16:
      if (objc_msgSend_isSiriUODSupported(KVAssistantServicesBridge, a2, a3, v3, v4, v5))
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        LOBYTE(v7) = MEMORY[0x1F4181798](KVAssistantServicesBridge, sel_isASRSupported, v8, v9, v10, v11);
      }
      break;
    case 8:
    case 9:
    case 17:
    case 18:
    case 19:
    case 22:
    case 23:
      LOBYTE(v7) = objc_msgSend_isSiriUODSupported(KVAssistantServicesBridge, a2, a3, v3, v4, v5);
      break;
    default:
      uint64_t v12 = (void *)qword_1EB5EE458;
      int v7 = os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        id v13 = v12;
        objc_super v19 = KVItemTypeDescription(a3, v14, v15, v16, v17, v18);
        int v21 = 136315394;
        v22 = "+[KVDonator _isXPCDonationEnabledForItemType:]";
        __int16 v23 = 2112;
        uint64_t v24 = v19;
        _os_log_error_impl(&dword_1BC3B6000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected itemType: %@", (uint8_t *)&v21, 0x16u);

        LOBYTE(v7) = 0;
      }
      break;
  }
  return v7;
}

+ (id)donatorWithServiceProvider:(id)a3 isExternalClient:(BOOL)a4 cascadeItemType:(unsigned __int16)a5 originAppId:(id)a6 userId:(id)a7 error:(id *)a8
{
  uint64_t v9 = a5;
  BOOL v10 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = objc_alloc((Class)objc_opt_class());
  isExternalClient = objc_msgSend_initWithCascadeItemType_originAppId_userId_serviceProvider_isExternalClient_(v15, v16, v9, (uint64_t)v13, (uint64_t)v12, (uint64_t)v14, v10);

  return isExternalClient;
}

+ (id)donatorWithServiceProvider:(id)a3 cascadeItemType:(unsigned __int16)a4 originAppId:(id)a5 userId:(id)a6 error:(id *)a7
{
  return (id)objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(a1, a2, (uint64_t)a3, 0, a4, (uint64_t)a5, a6, a7);
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  uint64_t v18 = objc_msgSend_copy(a5, v13, v14, v15, v16, v17);
  if (!objc_msgSend_length(v18, v19, v20, v21, v22, v23))
  {
    v36 = (void *)MEMORY[0x1E4F28C58];
    v37 = objc_msgSend_stringWithFormat_(NSString, v24, @"Invalid deviceId: \"%@\"", v26, v27, v28, v18, *MEMORY[0x1E4F28568]);
    v51[0] = v37;
    v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v51, (uint64_t)&v50, 1, v39);
    v43 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v41, @"com.apple.koa.donate", 4, (uint64_t)v40, v42);
    v44 = v43;
    if (a7 && v43) {
      *a7 = v43;
    }

    goto LABEL_10;
  }
  if (!v18)
  {
LABEL_10:
    v35 = 0;
    goto LABEL_16;
  }
  uint64_t v33 = sub_1BC3BBDCC(v12, (char *)a7, v25, v26, v27, v28);
  if (v33
    && (uint64_t v34 = sub_1BC3BBF00(a3, (char *)a7, v29, v30, v31, v32), v34 != (unsigned __int16)*MEMORY[0x1E4F57F78]))
  {
    uint64_t v45 = v34;
    v46 = sub_1BC3BC070(v11, a7);
    if (v46)
    {
      v47 = objc_opt_class();
      v35 = objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v47, v48, 0, 1, v45, (uint64_t)v46, v33, a7);
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }

LABEL_16:
  return v35;
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 userId:(id)a5 error:(id *)a6
{
  id v9 = a4;
  uint64_t v18 = sub_1BC3BBDCC(a5, (char *)a6, v10, v11, v12, v13);
  if (v18
    && (uint64_t v19 = sub_1BC3BBF00(a3, (char *)a6, v14, v15, v16, v17), v19 != (unsigned __int16)*MEMORY[0x1E4F57F78]))
  {
    uint64_t v21 = v19;
    uint64_t v22 = sub_1BC3BC070(v9, a6);
    if (v22)
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v20 = objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v23, v24, 0, 1, v21, (uint64_t)v22, v18, a6);
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (id)donatorWithItemType:(int64_t)a3 originAppId:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v12 = sub_1BC3BBF00(a3, (char *)a5, v8, v9, v10, v11);
  if (v12 == (unsigned __int16)*MEMORY[0x1E4F57F78])
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = v12;
    uint64_t v15 = sub_1BC3BC070(v7, a5);
    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v13 = objc_msgSend_donatorWithServiceProvider_isExternalClient_cascadeItemType_originAppId_userId_error_(v16, v17, 0, 1, v14, (uint64_t)v15, 0, a5);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  return v13;
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end