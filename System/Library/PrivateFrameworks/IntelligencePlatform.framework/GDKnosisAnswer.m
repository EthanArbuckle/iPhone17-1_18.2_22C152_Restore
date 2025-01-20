@interface GDKnosisAnswer
+ (BOOL)supportsSecureCoding;
- (GDKnosisAnswer)initWithAnswerId:(id)a3 name:(id)a4 textualization:(id)a5 facts:(id)a6 parents:(id)a7 requestIds:(id)a8;
- (GDKnosisAnswer)initWithCoder:(id)a3;
- (NSArray)facts;
- (NSArray)parents;
- (NSArray)requestIds;
- (NSString)answerId;
- (NSString)name;
- (NSString)textualization;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisAnswer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIds, 0);
  objc_storeStrong((id *)&self->_parents, 0);
  objc_storeStrong((id *)&self->_facts, 0);
  objc_storeStrong((id *)&self->_textualization, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_answerId, 0);
}

- (NSArray)requestIds
{
  return self->_requestIds;
}

- (NSArray)parents
{
  return self->_parents;
}

- (NSArray)facts
{
  return self->_facts;
}

- (NSString)textualization
{
  return self->_textualization;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)answerId
{
  return self->_answerId;
}

- (GDKnosisAnswer)initWithCoder:(id)a3
{
  v111[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_answerId);
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9
    || (objc_msgSend_error(v4, v10, v11, v12, v13),
        v78 = objc_claimAutoreleasedReturnValue(),
        v78,
        !v78))
  {
    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_name);
    v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (!v18)
    {
      v79 = objc_msgSend_error(v4, v19, v20, v21, v22);

      if (v79)
      {
        v77 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_textualization);
    v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24, v26);

    if (!v27)
    {
      v80 = objc_msgSend_error(v4, v28, v29, v30, v31);

      if (v80)
      {
        v77 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    v38 = objc_msgSend_setWithObjects_(v32, v35, v33, v36, v37, v34, 0);
    v39 = NSStringFromSelector(sel_facts);
    v42 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v38, (uint64_t)v39, v41);

    if (v42)
    {
      v47 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v48 = objc_opt_class();
      uint64_t v49 = objc_opt_class();
      v53 = objc_msgSend_setWithObjects_(v47, v50, v48, v51, v52, v49, 0);
      v54 = NSStringFromSelector(sel_parents);
      v57 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v53, (uint64_t)v54, v56);

      if (v57)
      {
        v62 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v63 = objc_opt_class();
        uint64_t v64 = objc_opt_class();
        v68 = objc_msgSend_setWithObjects_(v62, v65, v63, v66, v67, v64, 0);
        v69 = NSStringFromSelector(sel_requestIds);
        v72 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v70, (uint64_t)v68, (uint64_t)v69, v71);

        if (v72)
        {
          self = (GDKnosisAnswer *)(id)objc_msgSend_initWithAnswerId_name_textualization_facts_parents_requestIds_(self, v73, (uint64_t)v9, (uint64_t)v18, (uint64_t)v27, v42, v57, v72);
          v77 = self;
        }
        else
        {
          v85 = objc_msgSend_error(v4, v73, v74, v75, v76);

          if (!v85)
          {
            v87 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v106 = *MEMORY[0x1E4F28568];
            v107 = @"GDKnosisAnswer requestIds is nil";
            v88 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v86, (uint64_t)&v107, (uint64_t)&v106, 1);
            v90 = objc_msgSend_errorWithDomain_code_userInfo_(v87, v89, @"GDErrorDomain", 9, (uint64_t)v88);
            objc_msgSend_failWithError_(v4, v91, (uint64_t)v90, v92, v93);
          }
          v72 = 0;
          v77 = 0;
        }
        goto LABEL_24;
      }
      v83 = objc_msgSend_error(v4, v58, v59, v60, v61);

      if (v83)
      {
        v57 = 0;
        v77 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v99 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v108 = *MEMORY[0x1E4F28568];
      v109 = @"GDKnosisAnswer parents is nil";
      v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v84, (uint64_t)&v109, (uint64_t)&v108, 1);
      v101 = objc_msgSend_errorWithDomain_code_userInfo_(v99, v100, @"GDErrorDomain", 9, (uint64_t)v72);
      objc_msgSend_failWithError_(v4, v102, (uint64_t)v101, v103, v104);

      v57 = 0;
    }
    else
    {
      v81 = objc_msgSend_error(v4, v43, v44, v45, v46);

      if (v81)
      {
        v77 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v94 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v110 = *MEMORY[0x1E4F28568];
      v111[0] = @"GDKnosisAnswer facts is nil";
      v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v82, (uint64_t)v111, (uint64_t)&v110, 1);
      v72 = objc_msgSend_errorWithDomain_code_userInfo_(v94, v95, @"GDErrorDomain", 9, (uint64_t)v57);
      objc_msgSend_failWithError_(v4, v96, (uint64_t)v72, v97, v98);
    }
    v77 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v77 = 0;
LABEL_29:

  return v77;
}

- (void)encodeWithCoder:(id)a3
{
  answerId = self->_answerId;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_answerId);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)answerId, (uint64_t)v6, v8);

  name = self->_name;
  v10 = NSStringFromSelector(sel_name);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)name, (uint64_t)v10, v12);

  textualization = self->_textualization;
  uint64_t v14 = NSStringFromSelector(sel_textualization);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)textualization, (uint64_t)v14, v16);

  facts = self->_facts;
  v18 = NSStringFromSelector(sel_facts);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)facts, (uint64_t)v18, v20);

  parents = self->_parents;
  uint64_t v22 = NSStringFromSelector(sel_parents);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)parents, (uint64_t)v22, v24);

  requestIds = self->_requestIds;
  NSStringFromSelector(sel_requestIds);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v26, (uint64_t)requestIds, (uint64_t)v28, v27);
}

- (GDKnosisAnswer)initWithAnswerId:(id)a3 name:(id)a4 textualization:(id)a5 facts:(id)a6 parents:(id)a7 requestIds:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)GDKnosisAnswer;
  uint64_t v24 = [(GDKnosisAnswer *)&v58 init];
  if (v24)
  {
    uint64_t v25 = objc_msgSend_copy(v14, v20, v21, v22, v23);
    answerId = v24->_answerId;
    v24->_answerId = (NSString *)v25;

    uint64_t v31 = objc_msgSend_copy(v15, v27, v28, v29, v30);
    name = v24->_name;
    v24->_name = (NSString *)v31;

    uint64_t v37 = objc_msgSend_copy(v16, v33, v34, v35, v36);
    textualization = v24->_textualization;
    v24->_textualization = (NSString *)v37;

    uint64_t v43 = objc_msgSend_copy(v17, v39, v40, v41, v42);
    facts = v24->_facts;
    v24->_facts = (NSArray *)v43;

    uint64_t v49 = objc_msgSend_copy(v18, v45, v46, v47, v48);
    parents = v24->_parents;
    v24->_parents = (NSArray *)v49;

    uint64_t v55 = objc_msgSend_copy(v19, v51, v52, v53, v54);
    requestIds = v24->_requestIds;
    v24->_requestIds = (NSArray *)v55;
  }
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end