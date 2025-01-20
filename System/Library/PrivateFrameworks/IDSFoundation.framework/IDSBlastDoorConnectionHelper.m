@interface IDSBlastDoorConnectionHelper
+ (id)getBlastDoorSharedConnection;
- (BOOL)commandEnabledForBlastDoor:(id)a3 topic:(id)a4;
- (BOOL)removeAllowlistedKey:(id)a3 fromPayload:(id)a4;
- (IDSBlastDoorConnectionHelper)init;
- (id)idsBlastDoor;
- (void)addAllowlistedKey:(id)a3 toValidatedPayload:(id)a4 fromOriginalPayload:(id)a5;
- (void)auditMissingHeaderKeys:(id)a3 target:(id)a4;
- (void)diffuseAPSUserPayload:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5;
- (void)diffuseClientMessage:(id)a3 context:(id)a4 withCompletionBlock:(id)a5;
- (void)setIdsBlastDoor:(id)a3;
- (void)writeBlastDoorPayloadToDiskIfNecessary:(id)a3 withContext:(id)a4;
@end

@implementation IDSBlastDoorConnectionHelper

+ (id)getBlastDoorSharedConnection
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19D9F4DA4;
  block[3] = &unk_1E5970A28;
  block[4] = a1;
  if (qword_1E944F0D8 != -1) {
    dispatch_once(&qword_1E944F0D8, block);
  }
  v2 = (void *)qword_1E944F0D0;
  return v2;
}

- (IDSBlastDoorConnectionHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)IDSBlastDoorConnectionHelper;
  v2 = [(IDSBlastDoorConnectionHelper *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend_setIdsBlastDoor_(v2, v4, (uint64_t)v3, v5);
  }
  return v2;
}

- (void)diffuseAPSUserPayload:(id)a3 topic:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v30, OS_LOG_TYPE_DEFAULT, "BlastDoor: Disabled for framing messages", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_16;
    }
    v31 = @"BlastDoor: Disabled for framing messages";
    goto LABEL_15;
  }
  if (!self->_idsBlastDoor || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D9BE000, v32, OS_LOG_TYPE_DEFAULT, "BlastDoor: Blastdoor object is null or does not respond to selector", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_16;
    }
    v31 = @"BlastDoor: Blastdoor object is null or does not respond to selector";
LABEL_15:
    _IDSLogV(0, @"IDSFoundation", @"IDSBlastDoorConnectionHelper", v31);
LABEL_16:
    (*((void (**)(id, id, void, void))v10 + 2))(v10, v8, 0, 0);
    goto LABEL_17;
  }
  uint64_t v11 = objc_opt_class();
  v12 = sub_19D9F5164(v11, v8, @"c");
  char v15 = objc_msgSend_commandEnabledForBlastDoor_topic_(self, v13, (uint64_t)v12, v14, v9);

  v19 = objc_msgSend_mutableCopy(v8, v16, v17, v18);
  char v22 = objc_msgSend_removeAllowlistedKey_fromPayload_(self, v20, @"i", v21, v19);
  char v25 = objc_msgSend_removeAllowlistedKey_fromPayload_(self, v23, @"i", v24, v19);
  id idsBlastDoor = self->_idsBlastDoor;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_19D9F5220;
  v33[3] = &unk_1E5970A50;
  char v38 = v15;
  id v34 = v8;
  v36 = self;
  id v37 = v10;
  char v39 = v22;
  id v35 = v19;
  char v40 = v25;
  id v27 = v19;
  objc_msgSend_unpackPayloadDictionary_resultHandler_(idsBlastDoor, v28, (uint64_t)v27, v29, v33);

LABEL_17:
}

- (void)diffuseClientMessage:(id)a3 context:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = objc_msgSend_dictionaryRepresentation(v9, v12, v13, v14);
    *(_DWORD *)buf = 138412290;
    v31 = v15;
    _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "Sending with context %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = objc_msgSend_dictionaryRepresentation(v9, v16, v18, v17);
    _IDSLogV(0, @"IDSFoundation", @"IDSBlastDoorConnectionHelper", @"Sending with context %@");
  }
  objc_msgSend_writeBlastDoorPayloadToDiskIfNecessary_withContext_(self, v16, (uint64_t)v8, v17, v9, v27);
  id idsBlastDoor = self->_idsBlastDoor;
  v23 = objc_msgSend_dictionaryRepresentation(v9, v20, v21, v22);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_19D9F56CC;
  v28[3] = &unk_1E5970AC8;
  id v29 = v10;
  id v24 = v10;
  objc_msgSend_unpackClientMessage_context_resultHandler_(idsBlastDoor, v25, (uint64_t)v8, v26, v23, v28);
}

- (BOOL)removeAllowlistedKey:(id)a3 fromPayload:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)v6, v9);
  if (!v11) {
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v6, v10, @"i", v12))
  {
    double v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v14, v16, v15, v17)) {
      goto LABEL_8;
    }
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v18, v20, v19, v21)) {
      goto LABEL_8;
    }
  }
  if (objc_msgSend_isEqualToString_(v6, v10, @"b", v13)
    && ((double v22 = objc_opt_class(),
         uint64_t v23 = objc_opt_class(),
         (objc_msgSend_isSubclassOfClass_(v22, v24, v23, v25) & 1) != 0)
     || (double v26 = objc_opt_class(),
         uint64_t v27 = objc_opt_class(),
         objc_msgSend_isSubclassOfClass_(v26, v28, v27, v29))))
  {
LABEL_8:
    objc_msgSend_removeObjectForKey_(v7, v10, (uint64_t)v6, v13);
    int v30 = 1;
  }
  else
  {
LABEL_9:
    int v30 = 0;
  }
  v56 = (void *)v11;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF029488, v10, (uint64_t)&v65, 0.0, v70, 16);
  if (v59)
  {
    v57 = v7;
    uint64_t v58 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v66 != v58) {
          objc_enumerationMutation(&unk_1EF029488);
        }
        id v34 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v35 = objc_msgSend_objectForKey_(v7, v31, (uint64_t)v34, v32);

        if (v35)
        {
          id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          uint64_t v37 = objc_opt_class();
          v60 = v34;
          char v38 = sub_19D9F5164(v37, v7, v34);
          uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v61, v40, v69, 16);
          if (v41)
          {
            uint64_t v45 = v41;
            uint64_t v46 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v62 != v46) {
                  objc_enumerationMutation(v38);
                }
                v48 = objc_msgSend_mutableCopy(*(void **)(*((void *)&v61 + 1) + 8 * j), v42, v43, v44);
                v30 |= objc_msgSend_removeAllowlistedKey_fromPayload_(self, v49, (uint64_t)v6, v50, v48);
                objc_msgSend_addObject_(v36, v51, (uint64_t)v48, v52);
              }
              uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v42, (uint64_t)&v61, v44, v69, 16);
            }
            while (v45);
          }

          id v7 = v57;
          objc_msgSend_setObject_forKey_(v57, v53, (uint64_t)v36, v54, v60);
        }
      }
      uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF029488, v31, (uint64_t)&v65, v32, v70, 16);
    }
    while (v59);
  }

  return v30 & 1;
}

- (void)addAllowlistedKey:(id)a3 toValidatedPayload:(id)a4 fromOriginalPayload:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v8, v12);
  if (v14) {
    objc_msgSend_setObject_forKey_(v9, v13, v14, v15, v8);
  }
  uint64_t v45 = (void *)v14;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0294A0, v13, (uint64_t)&v48, 0.0, v52, 16);
  if (v47)
  {
    uint64_t v46 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(&unk_1EF0294A0);
        }
        uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v20 = objc_msgSend_objectForKey_(v10, v16, (uint64_t)v19, v17);

        if (v20)
        {
          uint64_t v21 = objc_opt_class();
          double v22 = sub_19D9F5164(v21, v10, v19);
          uint64_t v23 = objc_opt_class();
          id v24 = v9;
          double v25 = sub_19D9F5164(v23, v9, v19);
          if (objc_msgSend_count(v22, v26, v27, v28))
          {
            unint64_t v31 = 0;
            do
            {
              double v32 = objc_msgSend_objectAtIndexedSubscript_(v22, v29, v31, v30);
              id v35 = objc_msgSend_objectForKey_(v32, v33, (uint64_t)v8, v34);

              if (v35)
              {
                char v39 = objc_msgSend_objectAtIndex_(v25, v36, v31, v38);
                v42 = objc_msgSend_objectAtIndex_(v22, v40, v31, v41);
                objc_msgSend_addAllowlistedKey_toValidatedPayload_fromOriginalPayload_(self, v43, (uint64_t)v8, v44, v39, v42);
              }
              ++v31;
            }
            while (objc_msgSend_count(v22, v36, v37, v38) > v31);
          }

          id v9 = v24;
        }
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EF0294A0, v16, (uint64_t)&v48, v17, v52, 16);
    }
    while (v47);
  }
}

- (void)auditMissingHeaderKeys:(id)a3 target:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  double v12 = objc_msgSend_allKeys(v6, v9, v10, v11);

  double v15 = objc_msgSend_initWithArray_(v8, v13, (uint64_t)v12, v14);
  id v16 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v20 = objc_msgSend_allKeys(v7, v17, v18, v19);

  uint64_t v23 = objc_msgSend_initWithArray_(v16, v21, (uint64_t)v20, v22);
  objc_msgSend_minusSet_(v23, v24, (uint64_t)v15, v25);
  if (objc_msgSend_count(v23, v26, v27, v28))
  {
    double v32 = objc_msgSend_daemon(MEMORY[0x1E4F6C350], v29, v30, v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      sub_19DB7640C((uint64_t)v23, v32);
    }
  }
}

- (BOOL)commandEnabledForBlastDoor:(id)a3 topic:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, @"com.apple.sps.push", v8))
  {
LABEL_3:
    char v13 = _os_feature_enabled_impl();
  }
  else
  {
    int v12 = objc_msgSend_intValue(v5, v9, v10, v11);
    switch(v12)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 32:
      case 34:
      case 64:
      case 66:
      case 90:
      case 91:
      case 92:
      case 96:
      case 97:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 160:
      case 165:
      case 170:
      case 180:
      case 181:
      case 182:
      case 190:
      case 195:
      case 196:
      case 200:
      case 201:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 228:
      case 229:
      case 250:
      case 251:
      case 255:
        goto LABEL_3;
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 33:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 65:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 93:
      case 94:
      case 95:
      case 98:
      case 99:
      case 103:
      case 114:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 135:
      case 136:
      case 137:
      case 138:
      case 156:
      case 157:
      case 158:
      case 159:
      case 161:
      case 162:
      case 163:
      case 164:
      case 166:
      case 167:
      case 168:
      case 169:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 191:
      case 192:
      case 193:
      case 194:
      case 197:
      case 198:
      case 199:
      case 202:
      case 203:
      case 204:
      case 205:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 226:
      case 230:
      case 231:
      case 240:
      case 241:
      case 252:
      case 253:
        goto LABEL_8;
      case 100:
      case 101:
      case 102:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 227:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 254:
        if ((_os_feature_enabled_impl() & 1) == 0) {
          goto LABEL_3;
        }
        goto LABEL_6;
      default:
        if (v12 == 315) {
          goto LABEL_3;
        }
LABEL_8:
        double v15 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v5;
          _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "BlastDoor: Command {%@} not handled in switch case, defaulting to NO", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"commandEnabledForBlastDoor", @"BlastDoor: Command {%@} not handled in switch case, defaulting to NO");
        }
LABEL_6:
        char v13 = 1;
        break;
    }
  }

  return v13;
}

- (void)writeBlastDoorPayloadToDiskIfNecessary:(id)a3 withContext:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (CUTIsInternalInstall()
    && objc_msgSend_isWriteBlastDoorPayloadsToDiskEnabled(MEMORY[0x1E4F6C408], v7, v8, v9))
  {
    char v13 = objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E4F6C408], v10, v11, v12);

    if (v13)
    {
      objc_msgSend_writePushPayloadsToDiskPath(MEMORY[0x1E4F6C408], v14, v15, v16);
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = @"/var/mobile/Library/IdentityServices/";
    }
    uint64_t v18 = NSString;
    double v19 = objc_msgSend_command(v6, v14, v15, v16);
    uint64_t v23 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v20, v21, v22);
    uint64_t v27 = objc_msgSend_UUIDString(v23, v24, v25, v26);
    uint64_t v30 = objc_msgSend_stringWithFormat_(v18, v28, @"%@-client-payload-%@.data", v29, v19, v27);

    double v31 = (void *)MEMORY[0x1E4F1CB10];
    double v34 = objc_msgSend_stringByAppendingPathComponent_(v17, v32, (uint64_t)v30, v33);
    uint64_t v37 = objc_msgSend_fileURLWithPath_(v31, v35, (uint64_t)v34, v36);

    double v38 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend_absoluteString(v37, v39, v40, v41);
      *(_DWORD *)buf = 138412290;
      id v68 = v42;
      _os_log_impl(&dword_19D9BE000, v38, OS_LOG_TYPE_DEFAULT, "Writing BlastDoor payload to disk: {%@}", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v63 = objc_msgSend_absoluteString(v37, v43, v45, v44);
      _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Writing BlastDoor payload to disk: {%@}");
    }
    id v66 = 0;
    uint64_t v46 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v43, (uint64_t)v5, v44, 200, 0, &v66, v63);
    id v49 = v66;
    if (v46)
    {
      long long v51 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v47, v48, v50);
      double v54 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v52, @"/var/mobile/Library/IdentityServices/", v53, 1);
      id v65 = v49;
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v51, v55, (uint64_t)v54, v56, 1, 0, &v65);
      id v57 = v65;

      id v64 = v57;
      LODWORD(v51) = objc_msgSend_writeToURL_options_error_(v46, v58, (uint64_t)v37, v59, 1, &v64);
      id v49 = v64;

      if (v51)
      {
        v60 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v60, OS_LOG_TYPE_DEFAULT, "Write to disk: Successful", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Write to disk: Successful");
        }
      }
      else
      {
        long long v62 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v49;
          _os_log_impl(&dword_19D9BE000, v62, OS_LOG_TYPE_DEFAULT, "Write to disk: Unsuccessful with error: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Write to disk: Unsuccessful with error: %@");
        }
      }
    }
    else
    {
      long long v61 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v49;
        _os_log_impl(&dword_19D9BE000, v61, OS_LOG_TYPE_DEFAULT, "Error while serializing BlastDoor payload %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"IDSPushHandler", @"Error while serializing BlastDoor payload %@");
      }
    }
  }
}

- (id)idsBlastDoor
{
  return self->_idsBlastDoor;
}

- (void)setIdsBlastDoor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end