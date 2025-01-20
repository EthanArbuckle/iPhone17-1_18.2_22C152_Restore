@interface GDKnosisRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)enableDebug;
- (BOOL)enableTextualization;
- (GDKnosisRequest)initWithCoder:(id)a3;
- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6;
- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7;
- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6;
- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7;
- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7 enableTextualization:(BOOL)a8;
- (NSArray)intentArgs;
- (NSNumber)limit;
- (NSNumber)offset;
- (NSString)kgq;
- (NSString)query;
- (void)encodeWithCoder:(id)a3;
- (void)setOffset:(id)a3;
@end

@implementation GDKnosisRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_intentArgs, 0);
  objc_storeStrong((id *)&self->_kgq, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (BOOL)enableTextualization
{
  return self->_enableTextualization;
}

- (BOOL)enableDebug
{
  return self->_enableDebug;
}

- (void)setOffset:(id)a3
{
}

- (NSNumber)offset
{
  return self->_offset;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSArray)intentArgs
{
  return self->_intentArgs;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (NSString)query
{
  return self->_query;
}

- (GDKnosisRequest)initWithCoder:(id)a3
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_query);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("kgq");
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (!v18)
    {
      v81 = objc_msgSend_error(v4, v19, v20, v21, v22);

      if (v81)
      {
        v18 = 0;
        v80 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v29 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v25, 0);
    v30 = NSStringFromSelector(sel_intentArgs);
    v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v29, (uint64_t)v30, v32);

    if (v33) {
      goto LABEL_4;
    }
    v82 = objc_msgSend_error(v4, v34, v35, v36, v37);

    if (!v82)
    {
      if (!v18)
      {
        v100 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v116 = *MEMORY[0x1E4F28568];
        v117 = @"GDKnosisRequest either kgq or intentArgs is required";
        v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v83, (uint64_t)&v117, (uint64_t)&v116, 1);
        v51 = objc_msgSend_errorWithDomain_code_userInfo_(v100, v101, @"GDErrorDomain", 9, (uint64_t)v42);
        objc_msgSend_failWithError_(v4, v102, (uint64_t)v51, v103, v104);
        goto LABEL_26;
      }
LABEL_4:
      uint64_t v38 = objc_opt_class();
      v39 = NSStringFromSelector(sel_limit);
      v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v38, (uint64_t)v39, v41);

      if (v42)
      {
        uint64_t v47 = objc_opt_class();
        v48 = NSStringFromSelector(sel_offset);
        v51 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v47, (uint64_t)v48, v50);

        if (v51)
        {
          v56 = NSStringFromSelector(sel_enableDebug);
          uint64_t v60 = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)v56, v58, v59);

          v65 = objc_msgSend_error(v4, v61, v62, v63, v64);

          if (!v65)
          {
            v66 = NSStringFromSelector(sel_enableTextualization);
            uint64_t v70 = objc_msgSend_decodeBoolForKey_(v4, v67, (uint64_t)v66, v68, v69);

            v75 = objc_msgSend_error(v4, v71, v72, v73, v74);

            if (!v75)
            {
              if (v33) {
                limit_offset_enableDebug = objc_msgSend_initWithIntents_query_limit_offset_enableDebug_(self, v76, (uint64_t)v33, (uint64_t)v9, (uint64_t)v42, v51, v60);
              }
              else {
                limit_offset_enableDebug = objc_msgSend_initWithKGQ_query_limit_offset_enableDebug_enableTextualization_(self, v76, (uint64_t)v18, (uint64_t)v9, (uint64_t)v42, v51, v60, v70);
              }
              self = limit_offset_enableDebug;
              v80 = self;
              goto LABEL_27;
            }
          }
        }
        else
        {
          v91 = objc_msgSend_error(v4, v52, v53, v54, v55);

          if (!v91)
          {
            v93 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v112 = *MEMORY[0x1E4F28568];
            v113 = @"GDKnosisRequest offset is nil";
            v94 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v92, (uint64_t)&v113, (uint64_t)&v112, 1);
            v96 = objc_msgSend_errorWithDomain_code_userInfo_(v93, v95, @"GDErrorDomain", 9, (uint64_t)v94);
            objc_msgSend_failWithError_(v4, v97, (uint64_t)v96, v98, v99);
          }
          v51 = 0;
        }
      }
      else
      {
        v89 = objc_msgSend_error(v4, v43, v44, v45, v46);

        if (v89)
        {
          v42 = 0;
          v80 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v105 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v114 = *MEMORY[0x1E4F28568];
        v115 = @"GDKnosisRequest limit is nil";
        v51 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v90, (uint64_t)&v115, (uint64_t)&v114, 1);
        v107 = objc_msgSend_errorWithDomain_code_userInfo_(v105, v106, @"GDErrorDomain", 9, (uint64_t)v51);
        objc_msgSend_failWithError_(v4, v108, (uint64_t)v107, v109, v110);

        v42 = 0;
      }
LABEL_26:
      v80 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v33 = 0;
LABEL_17:
    v80 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v78 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v78)
  {
    v84 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v118 = *MEMORY[0x1E4F28568];
    v119[0] = @"GDKnosisRequest query is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v79, (uint64_t)v119, (uint64_t)&v118, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(v84, v85, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v86, (uint64_t)v33, v87, v88);
    goto LABEL_17;
  }
  v80 = 0;
LABEL_31:

  return v80;
}

- (void)encodeWithCoder:(id)a3
{
  query = self->_query;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_query);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)query, (uint64_t)v6, v8);

  kgq = self->_kgq;
  v10 = NSStringFromSelector("kgq");
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)kgq, (uint64_t)v10, v12);

  intentArgs = self->_intentArgs;
  uint64_t v14 = NSStringFromSelector(sel_intentArgs);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)intentArgs, (uint64_t)v14, v16);

  limit = self->_limit;
  v18 = NSStringFromSelector(sel_limit);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)limit, (uint64_t)v18, v20);

  offset = self->_offset;
  uint64_t v22 = NSStringFromSelector(sel_offset);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)offset, (uint64_t)v22, v24);

  BOOL enableDebug = self->_enableDebug;
  v26 = NSStringFromSelector(sel_enableDebug);
  objc_msgSend_encodeBool_forKey_(v5, v27, enableDebug, (uint64_t)v26, v28);

  BOOL enableTextualization = self->_enableTextualization;
  NSStringFromSelector(sel_enableTextualization);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v30, enableTextualization, (uint64_t)v32, v31);
}

- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v38.receiver = self;
  v38.super_class = (Class)GDKnosisRequest;
  uint64_t v21 = [(GDKnosisRequest *)&v38 init];
  if (v21)
  {
    uint64_t v22 = objc_msgSend_copy(v14, v17, v18, v19, v20);
    query = v21->_query;
    v21->_query = (NSString *)v22;

    kgq = v21->_kgq;
    v21->_kgq = 0;

    objc_storeStrong((id *)&v21->_intentArgs, a3);
    uint64_t v29 = objc_msgSend_copy(v15, v25, v26, v27, v28);
    limit = v21->_limit;
    v21->_limit = (NSNumber *)v29;

    uint64_t v35 = objc_msgSend_copy(v16, v31, v32, v33, v34);
    offset = v21->_offset;
    v21->_offset = (NSNumber *)v35;

    v21->_BOOL enableDebug = a7;
    v21->_BOOL enableTextualization = 0;
  }

  return v21;
}

- (GDKnosisRequest)initWithIntents:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)GDKnosisRequest;
  uint64_t v19 = [(GDKnosisRequest *)&v36 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v12, v15, v16, v17, v18);
    query = v19->_query;
    v19->_query = (NSString *)v20;

    kgq = v19->_kgq;
    v19->_kgq = 0;

    objc_storeStrong((id *)&v19->_intentArgs, a3);
    uint64_t v27 = objc_msgSend_copy(v13, v23, v24, v25, v26);
    limit = v19->_limit;
    v19->_limit = (NSNumber *)v27;

    uint64_t v33 = objc_msgSend_copy(v14, v29, v30, v31, v32);
    offset = v19->_offset;
    v19->_offset = (NSNumber *)v33;

    *(_WORD *)&v19->_BOOL enableDebug = 0;
  }

  return v19;
}

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7 enableTextualization:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v45.receiver = self;
  v45.super_class = (Class)GDKnosisRequest;
  uint64_t v22 = [(GDKnosisRequest *)&v45 init];
  if (v22)
  {
    uint64_t v23 = objc_msgSend_copy(v15, v18, v19, v20, v21);
    query = v22->_query;
    v22->_query = (NSString *)v23;

    uint64_t v29 = objc_msgSend_copy(v14, v25, v26, v27, v28);
    kgq = v22->_kgq;
    v22->_kgq = (NSString *)v29;

    intentArgs = v22->_intentArgs;
    v22->_intentArgs = 0;

    uint64_t v36 = objc_msgSend_copy(v16, v32, v33, v34, v35);
    limit = v22->_limit;
    v22->_limit = (NSNumber *)v36;

    uint64_t v42 = objc_msgSend_copy(v17, v38, v39, v40, v41);
    offset = v22->_offset;
    v22->_offset = (NSNumber *)v42;

    v22->_BOOL enableDebug = a7;
    v22->_BOOL enableTextualization = a8;
  }

  return v22;
}

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6 enableDebug:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v43.receiver = self;
  v43.super_class = (Class)GDKnosisRequest;
  uint64_t v20 = [(GDKnosisRequest *)&v43 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_copy(v13, v16, v17, v18, v19);
    query = v20->_query;
    v20->_query = (NSString *)v21;

    uint64_t v27 = objc_msgSend_copy(v12, v23, v24, v25, v26);
    kgq = v20->_kgq;
    v20->_kgq = (NSString *)v27;

    intentArgs = v20->_intentArgs;
    v20->_intentArgs = 0;

    uint64_t v34 = objc_msgSend_copy(v14, v30, v31, v32, v33);
    limit = v20->_limit;
    v20->_limit = (NSNumber *)v34;

    uint64_t v40 = objc_msgSend_copy(v15, v36, v37, v38, v39);
    offset = v20->_offset;
    v20->_offset = (NSNumber *)v40;

    v20->_BOOL enableDebug = a7;
    v20->_BOOL enableTextualization = 0;
  }

  return v20;
}

- (GDKnosisRequest)initWithKGQ:(id)a3 query:(id)a4 limit:(id)a5 offset:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v41.receiver = self;
  v41.super_class = (Class)GDKnosisRequest;
  uint64_t v18 = [(GDKnosisRequest *)&v41 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v11, v14, v15, v16, v17);
    query = v18->_query;
    v18->_query = (NSString *)v19;

    uint64_t v25 = objc_msgSend_copy(v10, v21, v22, v23, v24);
    kgq = v18->_kgq;
    v18->_kgq = (NSString *)v25;

    intentArgs = v18->_intentArgs;
    v18->_intentArgs = 0;

    uint64_t v32 = objc_msgSend_copy(v12, v28, v29, v30, v31);
    limit = v18->_limit;
    v18->_limit = (NSNumber *)v32;

    uint64_t v38 = objc_msgSend_copy(v13, v34, v35, v36, v37);
    offset = v18->_offset;
    v18->_offset = (NSNumber *)v38;

    *(_WORD *)&v18->_BOOL enableDebug = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end