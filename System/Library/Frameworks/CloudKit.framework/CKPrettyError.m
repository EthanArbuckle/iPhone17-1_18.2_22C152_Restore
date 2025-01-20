@interface CKPrettyError
+ (id)combinedErrorFromErrors:(id)a3 topLevelErrorMessage:(id)a4;
+ (id)databaseCorruptError;
+ (id)errorForAccountStatus:(int64_t)a3;
+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4;
+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4 args:(char *)a5;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5 format:(id)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 URL:(id)a6 format:(id)a7;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 format:(id)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 path:(id)a6 format:(id)a7;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7 arguments:(char *)a8;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 path:(id)a7 URL:(id)a8 description:(id)a9;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 format:(id)a6;
+ (id)itemErrorFromError:(id)a3 forID:(id)a4;
+ (id)secureCodableError:(id)a3;
+ (id)testError;
+ (id)undeprecatedDescriptionForError:(id)a3;
+ (void)initialize;
- (id)CKPartialErrorDescription;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKPrettyError

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (byte_1E9124EF0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = objc_opt_class();
    objc_msgSend_setClassName_forClass_(v4, v8, (uint64_t)v6, v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)CKPrettyError;
  [(CKPrettyError *)&v9 encodeWithCoder:v4];
}

- (id)CKPartialErrorDescription
{
  v5 = objc_msgSend_domain(self, a2, v2, v3);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, @"CKInternalErrorDomain", v7);

  uint64_t v12 = objc_msgSend_CKStringForWellKnownCKErrors(self, v9, v10, v11);
  v16 = (void *)MEMORY[0x1E4F28E78];
  v116 = (void *)v12;
  if (v12)
  {
    uint64_t v17 = v12;
    if (isEqualToString) {
      v18 = @"CKUnderlyingError";
    }
    else {
      v18 = @"CKError";
    }
    uint64_t v19 = objc_msgSend_code(self, v13, v14, v15);
    v25 = objc_msgSend_stringWithFormat_(v16, v20, @"<%@ %p: \"%@\" (%ld"), v21, v18, self, v17, v19;
  }
  else
  {
    v26 = objc_msgSend_domain(self, v13, v14, v15);
    uint64_t v30 = objc_msgSend_code(self, v27, v28, v29);
    v25 = objc_msgSend_stringWithFormat_(v16, v31, @"<NSError %p: (%@:%ld"), v32, self, v26, v30;
  }
  v33 = objc_msgSend_userInfo(self, v22, v23, v24);
  v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, *MEMORY[0x1E4F28A50], v35);
  v40 = v36;
  if (v36)
  {
    v41 = objc_msgSend_domain(v36, v37, v38, v39);
    int v44 = objc_msgSend_isEqualToString_(v41, v42, @"CKInternalErrorDomain", v43);

    if (v44)
    {
      uint64_t v48 = objc_msgSend_code(v40, v45, v46, v47);
      objc_msgSend_appendFormat_(v25, v49, @"/%ld", v50, v48);
    }
    else
    {
      v51 = objc_msgSend_domain(v40, v45, v46, v47);
      uint64_t v55 = objc_msgSend_code(v40, v52, v53, v54);
      objc_msgSend_appendFormat_(v25, v56, @"/%@:%ld", v57, v51, v55);
    }
  }
  objc_msgSend_appendString_(v25, v37, @""), v39);
  uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(v33, v58, @"ServerErrorDescription", v59);
  if (v60)
  {
    v63 = (void *)v60;
    objc_msgSend_appendFormat_(v25, v61, @"; server message = \"%@\"", v62, v60);
LABEL_16:

    goto LABEL_17;
  }
  v63 = objc_msgSend_objectForKeyedSubscript_(v33, v61, @"CKErrorDescription", v62);
  if (v63
    || (objc_msgSend_userInfo(v40, v64, v65, v66),
        v67 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v67, v68, *MEMORY[0x1E4F28568], v69),
        v63 = objc_claimAutoreleasedReturnValue(),
        v67,
        v63))
  {
    objc_msgSend_appendFormat_(v25, v64, @"; \"%@\"", v66, v63);
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v33, v64, @"ClientEtag", v66);
  v73 = (void *)v70;
  if (v70) {
    objc_msgSend_appendFormat_(v25, v71, @"; clientEtag = %@", v72, v70);
  }
  uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v33, v71, @"ServerEtag", v72);
  v77 = (void *)v74;
  if (v74) {
    objc_msgSend_appendFormat_(v25, v75, @"; serverEtag = %@", v76, v74);
  }
  uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v33, v75, @"OperationID", v76);
  v81 = (void *)v78;
  if (v78) {
    objc_msgSend_appendFormat_(v25, v79, @"; op = %@", v80, v78);
  }
  uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v33, v79, @"RequestUUID", v80);
  v85 = (void *)v82;
  if (v82) {
    objc_msgSend_appendFormat_(v25, v83, @"; uuid = %@", v84, v82);
  }
  uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v33, v83, *MEMORY[0x1E4F289D0], v84);
  v90 = (void *)v86;
  if (v86) {
    objc_msgSend_appendFormat_(v25, v87, @"; URL = %@", v89, v86);
  }
  v91 = objc_msgSend_domain(v40, v87, v88, v89);
  int v94 = objc_msgSend_isEqualToString_(v91, v92, *MEMORY[0x1E4F289A0], v93);

  if (v94)
  {
    v98 = objc_msgSend_userInfo(v40, v95, v96, v97);
    v101 = objc_msgSend_objectForKeyedSubscript_(v98, v99, @"_NSURLErrorFailingURLSessionTaskErrorKey", v100);

    if (v101) {
      objc_msgSend_appendFormat_(v25, v102, @"; task = %@", v103, v101);
    }
  }
  v106 = objc_msgSend_objectForKeyedSubscript_(v33, v95, @"CKRetryAfter", v97);
  if (v106 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_doubleValue(v106, v104, v107, v105);
    objc_msgSend_appendFormat_(v25, v108, @"; Retry after %0.1f seconds", v109, v110);
  }
  uint64_t v111 = objc_msgSend_objectForKeyedSubscript_(v33, v104, 0x1ED7F8EF8, v105);
  v114 = (void *)v111;
  if (v111) {
    objc_msgSend_appendFormat_(v25, v112, @"; SQLite error: %@", v113, v111);
  }

  return v25;
}

- (id)description
{
  id v4 = self;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_CKPartialErrorDescription(self, a2, v2, v3);
  objc_super v9 = objc_msgSend_userInfo(v4, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"ContainerID", v11);

  if (v12)
  {
    v16 = objc_msgSend_userInfo(v4, v13, v14, v15);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"ContainerID", v18);
    objc_msgSend_appendFormat_(v5, v20, @"; container ID = \"%@\"", v21, v19);
  }
  v22 = objc_msgSend_userInfo(v4, v13, v14, v15);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, @"CKPartialErrors", v24);

  if (!v25) {
    goto LABEL_24;
  }
  objc_msgSend_appendFormat_(v5, v26, @"; partial errors: {\n", v27);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v31 = objc_msgSend_userInfo(v4, v28, v29, v30);
  v34 = objc_msgSend_objectForKeyedSubscript_(v31, v32, @"CKPartialErrors", v33);
  uint64_t v38 = objc_msgSend_allKeys(v34, v35, v36, v37);

  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v76, (uint64_t)v80, 16);
  if (!v40)
  {

    goto LABEL_23;
  }
  uint64_t v44 = v40;
  v45 = v5;
  uint64_t v74 = 0;
  id obj = v38;
  uint64_t v46 = *(void *)v77;
  do
  {
    for (uint64_t i = 0; i != v44; ++i)
    {
      if (*(void *)v77 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      v49 = v4;
      uint64_t v50 = objc_msgSend_userInfo(v4, v41, v42, v43);
      uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v50, v51, @"CKPartialErrors", v52);
      v56 = objc_msgSend_objectForKeyedSubscript_(v53, v54, (uint64_t)v48, v55);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend_code(v56, v57, v58, v59) == 22)
        {
          uint64_t v74 = (v74 + 1);
          id v4 = v49;
          goto LABEL_18;
        }
        uint64_t v63 = objc_msgSend_CKPartialErrorDescription(v56, v60, v61, v62);
      }
      else
      {
        uint64_t v63 = objc_msgSend_description(v56, v57, v58, v59);
      }
      v64 = (void *)v63;
      id v4 = v49;
      if (objc_opt_respondsToSelector()) {
        objc_msgSend_ckShortDescription(v48, v65, v66, v67);
      }
      else {
      v68 = objc_msgSend_description(v48, v65, v66, v67);
      }
      objc_msgSend_appendFormat_(v45, v69, @"\t%@ = %@>\n", v70, v68, v64);

LABEL_18:
    }
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v76, (uint64_t)v80, 16);
  }
  while (v44);

  v5 = v45;
  if (v74) {
    objc_msgSend_appendFormat_(v45, v71, @"\t... %d \"Batch Request Failed\" CKErrors omitted ...\n", v72, v74);
  }
LABEL_23:
  objc_msgSend_appendFormat_(v5, v71, @"}", v72);
LABEL_24:
  objc_msgSend_appendString_(v5, v26, @">", v27);

  return v5;
}

+ (id)errorForAccountStatus:(int64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 0:
      id v4 = @"Could not determine iCloud account status";
      goto LABEL_5;
    case 2:
      id v4 = @"iCloud account is restricted";
      goto LABEL_5;
    case 3:
      id v4 = @"iCloud account is not available";
LABEL_5:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, @"CKErrorDomain", 9, v4);
      goto LABEL_7;
    case 4:
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, a2, @"CKErrorDomain", 36, @"iCloud account is temporarily not available");
      uint64_t v3 = LABEL_7:;
      break;
    default:
      break;
  }

  return v3;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  uint64_t v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v18);

  uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, (uint64_t)v10, a4, 0, 0, 0, 0, v13);

  return v15;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 path:(id)a7 URL:(id)a8 description:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v23 = objc_msgSend_mutableCopy(a5, v20, v21, v22);
  v25 = (void *)v23;
  if (!v16 && !v17 && !v18 && !v19) {
    goto LABEL_14;
  }
  if (!v23)
  {
    v25 = objc_opt_new();
    if (!v16) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v16) {
LABEL_7:
  }
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v16, *MEMORY[0x1E4F28A50]);
LABEL_8:
  if (v17) {
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v17, *MEMORY[0x1E4F28328]);
  }
  if (v18) {
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v18, *MEMORY[0x1E4F289D0]);
  }
  if (v19)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v25, v24, (uint64_t)v19, *MEMORY[0x1E4F28568]);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v19, @"CKErrorDescription");
  }
LABEL_14:
  uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v24, (uint64_t)v15, a4, v25);

  return v27;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKPrettyError;
  v5 = objc_msgSendSuper2(&v7, sel_errorWithDomain_code_userInfo_, a3, a4, a5);

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CKPrettyError;
  [(CKPrettyError *)&v2 dealloc];
}

+ (id)databaseCorruptError
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"SQLCode";
  id v4 = objc_msgSend_numberWithInt_(NSNumber, a2, 11, v2);
  v13[1] = @"SQLExtendedCode";
  v14[0] = v4;
  objc_super v7 = objc_msgSend_numberWithInt_(NSNumber, v5, 0, v6);
  v14[1] = v7;
  id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v14, (uint64_t)v13, 2);

  id v11 = objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v10, @"CKInternalErrorDomain", 1027, v9, @"%@", @"database corrupt");

  return v11;
}

+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4 args:(char *)a5
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = sqlite3_errcode(a3);
  uint64_t v10 = sqlite3_extended_errcode(a3);
  id v11 = sqlite3_errmsg(a3);
  uint64_t v14 = objc_msgSend_stringWithUTF8String_(NSString, v12, (uint64_t)v11, v13);
  v29[0] = @"SQLCode";
  id v17 = objc_msgSend_numberWithInt_(NSNumber, v15, v9, v16);
  v30[0] = v17;
  v29[1] = @"SQLExtendedCode";
  v20 = objc_msgSend_numberWithInt_(NSNumber, v18, v10, v19);
  v29[2] = @"SQLErrorMessage";
  v30[1] = v20;
  v30[2] = v14;
  uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v30, (uint64_t)v29, 3);

  id v23 = [NSString alloc];
  v25 = objc_msgSend_initWithFormat_arguments_(v23, v24, (uint64_t)v8, (uint64_t)a5);

  uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v26, @"CKInternalErrorDomain", 1027, v22, @"%@", v25);

  return v27;
}

+ (id)errorForSQLite:(sqlite3 *)a3 message:(id)a4
{
  id v4 = objc_msgSend_errorForSQLite_message_args_(a1, a2, (uint64_t)a3, (uint64_t)a4, &v7);

  return v4;
}

+ (id)testError
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)"testing", v2);
  v16[0] = @"SQLCode";
  uint64_t v7 = objc_msgSend_numberWithInt_(NSNumber, v5, 13, v6);
  v17[0] = v7;
  v16[1] = @"SQLExtendedCode";
  uint64_t v10 = objc_msgSend_numberWithInt_(NSNumber, v8, 1, v9);
  v16[2] = @"SQLErrorMessage";
  v17[1] = v10;
  v17[2] = v4;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v17, (uint64_t)v16, 3);

  uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_format_(a1, v13, @"CKInternalErrorDomain", 1027, v12, @"%@", @"test error");

  return v14;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v10 = objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, (uint64_t)&v15);

  uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v11, @"CKErrorDomain", a3, 0, 0, 0, 0, v10);

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 alloc];
  uint64_t v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v18);

  uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, @"CKErrorDomain", a3, v10, 0, 0, 0, v13);

  return v15;
}

+ (id)itemErrorFromError:(id)a3 forID:(id)a4
{
  return (id)objc_msgSend_CKItemErrorForID_(a3, a2, (uint64_t)a4, (uint64_t)a4);
}

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 1);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 format:(id)a6
{
  id v10 = (objc_class *)NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v21);

  uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, v12, 0, 0, 0, v16);

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  id v10 = (objc_class *)NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v21);

  uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, 0, v12, 0, v16);

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7
{
  id v7 = objc_msgSend_errorWithDomain_code_userInfo_error_format_arguments_(a1, a2, (uint64_t)a3, a4, a5, a6, a7, &v10);

  return v7;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5 error:(id)a6 format:(id)a7 arguments:(char *)a8
{
  id v14 = (objc_class *)NSString;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [v14 alloc];
  uint64_t v21 = objc_msgSend_initWithFormat_arguments_(v19, v20, (uint64_t)v15, (uint64_t)a8);

  id v23 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v22, (uint64_t)v18, a4, v17, v16, 0, 0, v21);

  return v23;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 format:(id)a6
{
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 alloc];
  id v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v21);

  id v18 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, v12, 0, 0, v16);

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5 format:(id)a6
{
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 alloc];
  id v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, (uint64_t)&v21);

  id v18 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v17, (uint64_t)v13, a4, 0, 0, 0, v12, v16);

  return v18;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 path:(id)a6 format:(id)a7
{
  id v12 = (objc_class *)NSString;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = [v12 alloc];
  id v19 = objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, (uint64_t)&v24);

  uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v20, (uint64_t)v16, a4, 0, v15, v14, 0, v19);

  return v21;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 error:(id)a5 URL:(id)a6 format:(id)a7
{
  id v12 = (objc_class *)NSString;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = [v12 alloc];
  id v19 = objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, (uint64_t)&v24);

  uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v20, (uint64_t)v16, a4, 0, v15, 0, v14, v19);

  return v21;
}

+ (id)secureCodableError:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v9 = objc_msgSend_userInfo(v4, v6, v7, v8);
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v73, (uint64_t)v78, 16);
    if (v11)
    {
      uint64_t v15 = v11;
      uint64_t v16 = *(void *)v74;
      uint64_t v67 = *MEMORY[0x1E4F28750];
      uint64_t v68 = *MEMORY[0x1E4F28A50];
      v64 = v5;
      id v65 = v4;
      uint64_t v62 = *(void *)v74;
      uint64_t v63 = v9;
      do
      {
        uint64_t v17 = 0;
        uint64_t v66 = v15;
        do
        {
          if (*(void *)v74 != v16) {
            objc_enumerationMutation(v9);
          }
          id v18 = *(void **)(*((void *)&v73 + 1) + 8 * v17);
          id v19 = objc_msgSend_userInfo(v4, v12, v13, v14, v62, v63);
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v18, v21);

          if ((objc_msgSend_isEqualToString_(v18, v23, v68, v24) & 1) != 0
            || objc_msgSend_isEqualToString_(v18, v25, @"CKFunctionError", v26))
          {
            uint64_t v27 = objc_msgSend_secureCodableError_(a1, v25, (uint64_t)v22, v26);
            objc_msgSend_setObject_forKeyedSubscript_(v5, v28, (uint64_t)v27, (uint64_t)v18);
          }
          else if (objc_msgSend_isEqualToString_(v18, v25, v67, v26))
          {
            uint64_t v32 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v29, v30, v31);
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v33 = v22;
            uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v69, (uint64_t)v77, 16);
            if (v35)
            {
              uint64_t v38 = v35;
              uint64_t v39 = *(void *)v70;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v70 != v39) {
                    objc_enumerationMutation(v33);
                  }
                  v41 = objc_msgSend_secureCodableError_(a1, v36, *(void *)(*((void *)&v69 + 1) + 8 * i), v37);
                  objc_msgSend_addObject_(v32, v42, (uint64_t)v41, v43);
                }
                uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v69, (uint64_t)v77, 16);
              }
              while (v38);
            }

            id v5 = v64;
            objc_msgSend_setObject_forKeyedSubscript_(v64, v44, (uint64_t)v32, (uint64_t)v18);

            id v4 = v65;
            uint64_t v16 = v62;
            id v9 = v63;
            uint64_t v15 = v66;
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0 {
                 && objc_msgSend_supportsSecureCoding(v22, v45, v46, v47))
          }
          {
            objc_msgSend_setObject_forKeyedSubscript_(v5, v48, (uint64_t)v22, (uint64_t)v18);
          }

          ++v17;
        }
        while (v17 != v15);
        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v73, (uint64_t)v78, 16);
        uint64_t v15 = v49;
      }
      while (v49);
    }

    id v50 = objc_alloc((Class)a1);
    uint64_t v54 = objc_msgSend_domain(v4, v51, v52, v53);
    uint64_t v58 = objc_msgSend_code(v4, v55, v56, v57);
    uint64_t v60 = objc_msgSend_initWithDomain_code_userInfo_(v50, v59, (uint64_t)v54, v58, v5);
  }
  else
  {
    uint64_t v60 = 0;
  }

  return v60;
}

+ (id)undeprecatedDescriptionForError:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    objc_msgSend_string(MEMORY[0x1E4F28E78], v4, v5, v6);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_localizedDescription(v7, v9, v10, v11);
    uint64_t v15 = (void *)v12;
    if (v12) {
      objc_msgSend_appendString_(v8, v13, v12, v14);
    }
    else {
      objc_msgSend_appendString_(v8, v13, @"Unknown error", v14);
    }
    id v19 = objc_msgSend_userInfo(v7, v16, v17, v18);
    uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, *MEMORY[0x1E4F28328], v21);

    if (v22) {
      objc_msgSend_appendFormat_(v8, v23, @" at path \"%@\"", v25, v22);
    }
    uint64_t v26 = objc_msgSend_userInfo(v7, v23, v24, v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, *MEMORY[0x1E4F289D0], v28);

    if (v29) {
      objc_msgSend_appendFormat_(v8, v30, @" for URL \"%@\"", v32, v29);
    }
    id v33 = objc_msgSend_domain(v7, v30, v31, v32);
    uint64_t v37 = objc_msgSend_code(v7, v34, v35, v36);
    objc_msgSend_appendFormat_(v8, v38, @" (%@/%d)", v39, v33, v37);

    uint64_t v43 = objc_msgSend_userInfo(v7, v40, v41, v42);
    uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v43, v44, *MEMORY[0x1E4F28A50], v45);

    if (v46)
    {
      id v50 = objc_msgSend_undeprecatedDescriptionForError_(a1, v47, (uint64_t)v46, v49);
      objc_msgSend_appendFormat_(v8, v51, @". Underlying error: %@", v52, v50);
    }
    uint64_t v53 = objc_msgSend_userInfo(v7, v47, v48, v49);
    uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v53, v54, @"kMMCSErrorUnderlyingErrorArrayKey", v55);

    if (v56)
    {
      uint64_t v79 = v46;
      uint64_t v80 = v29;
      uint64_t v81 = v22;
      uint64_t v82 = v15;
      unint64_t v60 = objc_msgSend_count(v56, v57, v58, v59);
      uint64_t v66 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v61, v62, v63);
      if (v60 >= 3) {
        uint64_t v67 = 3;
      }
      else {
        uint64_t v67 = v60;
      }
      if (v67)
      {
        for (uint64_t i = 0; i != v67; ++i)
        {
          long long v69 = objc_msgSend_objectAtIndexedSubscript_(v56, v64, i, v65);
          long long v72 = objc_msgSend_undeprecatedDescriptionForError_(a1, v70, (uint64_t)v69, v71);
          objc_msgSend_addObject_(v66, v73, (uint64_t)v72, v74);
        }
      }
      if (v60 > 3) {
        objc_msgSend_addObject_(v66, v64, @"...", v65);
      }
      long long v75 = objc_msgSend_componentsJoinedByString_(v66, v64, @", ", v65);
      objc_msgSend_appendFormat_(v8, v76, @". Underlying MMCS errors: [%@]", v77, v75);

      uint64_t v22 = v81;
      uint64_t v15 = v82;
      uint64_t v46 = v79;
      uint64_t v29 = v80;
    }
    objc_msgSend_appendString_(v8, v57, @".", v59);
  }
  else
  {
    uint64_t v8 = @"(null)";
  }

  return v8;
}

+ (id)combinedErrorFromErrors:(id)a3 topLevelErrorMessage:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_18AF142EC;
  uint64_t v28 = sub_18AF13A04;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B191C6C;
  void v16[3] = &unk_1E5465F10;
  id v8 = v7;
  id v17 = v8;
  uint64_t v18 = &v24;
  id v19 = &v20;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v9, (uint64_t)v16, v10);
  if (*((unsigned char *)v21 + 24))
  {
    id v12 = (id)v25[5];
  }
  else
  {
    uint64_t v30 = @"CKPartialErrors";
    v31[0] = v8;
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v31, (uint64_t)&v30, 1);
    objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v14, @"CKErrorDomain", 2, v13, @"%@", v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

@end