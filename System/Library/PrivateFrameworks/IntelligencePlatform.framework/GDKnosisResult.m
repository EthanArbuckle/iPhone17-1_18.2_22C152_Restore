@interface GDKnosisResult
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMoreAnswers;
- (GDKnosisDebug)debug;
- (GDKnosisResult)initWithCoder:(id)a3;
- (GDKnosisResult)initWithQuery:(id)a3 kgq:(id)a4 status:(unint64_t)a5 answers:(id)a6 errorMessage:(id)a7 limit:(id)a8 offset:(id)a9 hasMoreAnswers:(BOOL)a10 debug:(id)a11;
- (NSArray)answers;
- (NSNumber)limit;
- (NSNumber)offset;
- (NSString)errorMessage;
- (NSString)kgq;
- (NSString)query;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDKnosisResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debug, 0);
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_kgq, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

- (GDKnosisDebug)debug
{
  return self->_debug;
}

- (BOOL)hasMoreAnswers
{
  return self->_hasMoreAnswers;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (NSNumber)limit
{
  return self->_limit;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSArray)answers
{
  return self->_answers;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSString)kgq
{
  return self->_kgq;
}

- (NSString)query
{
  return self->_query;
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

  unint64_t status = self->_status;
  v14 = NSStringFromSelector(sel_status);
  objc_msgSend_encodeInteger_forKey_(v5, v15, status, (uint64_t)v14, v16);

  answers = self->_answers;
  v18 = NSStringFromSelector(sel_answers);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)answers, (uint64_t)v18, v20);

  errorMessage = self->_errorMessage;
  v22 = NSStringFromSelector(sel_errorMessage);
  objc_msgSend_encodeObject_forKey_(v5, v23, (uint64_t)errorMessage, (uint64_t)v22, v24);

  limit = self->_limit;
  v26 = NSStringFromSelector(sel_limit);
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)limit, (uint64_t)v26, v28);

  offset = self->_offset;
  v30 = NSStringFromSelector(sel_offset);
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)offset, (uint64_t)v30, v32);

  BOOL hasMoreAnswers = self->_hasMoreAnswers;
  v34 = NSStringFromSelector(sel_hasMoreAnswers);
  objc_msgSend_encodeBool_forKey_(v5, v35, hasMoreAnswers, (uint64_t)v34, v36);

  debug = self->_debug;
  NSStringFromSelector(sel_debug);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v38, (uint64_t)debug, (uint64_t)v40, v39);
}

- (GDKnosisResult)initWithCoder:(id)a3
{
  v147[1] = *MEMORY[0x1E4F143B8];
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
      v97 = objc_msgSend_error(v4, v19, v20, v21, v22);

      if (v97)
      {
        v18 = 0;
        v94 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v106 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v144 = *MEMORY[0x1E4F28568];
      v145 = @"GDKnosisResult kgq is nil";
      v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v98, (uint64_t)&v145, (uint64_t)&v144, 1);
      v42 = objc_msgSend_errorWithDomain_code_userInfo_(v106, v107, @"GDErrorDomain", 9, (uint64_t)v33);
      objc_msgSend_failWithError_(v4, v108, (uint64_t)v42, v109, v110);
      goto LABEL_20;
    }
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v29 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v25, 0);
    v30 = NSStringFromSelector(sel_answers);
    v33 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v29, (uint64_t)v30, v32);

    if (v33)
    {
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = NSStringFromSelector(sel_errorMessage);
      v42 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v38, (uint64_t)v39, v41);

      v47 = objc_msgSend_error(v4, v43, v44, v45, v46);

      if (!v47)
      {
        v48 = NSStringFromSelector(sel_status);
        uint64_t v52 = objc_msgSend_decodeIntegerForKey_(v4, v49, (uint64_t)v48, v50, v51);

        v57 = objc_msgSend_error(v4, v53, v54, v55, v56);

        if (!v57)
        {
          uint64_t v58 = objc_opt_class();
          v59 = NSStringFromSelector(sel_limit);
          v62 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v58, (uint64_t)v59, v61);

          if (v62)
          {
            uint64_t v67 = objc_opt_class();
            v68 = NSStringFromSelector(sel_offset);
            v71 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v67, (uint64_t)v68, v70);

            if (v71)
            {
              v76 = NSStringFromSelector(sel_hasMoreAnswers);
              char v137 = objc_msgSend_decodeBoolForKey_(v4, v77, (uint64_t)v76, v78, v79);

              v84 = objc_msgSend_error(v4, v80, v81, v82, v83);

              if (!v84)
              {
                uint64_t v135 = objc_opt_class();
                v85 = NSStringFromSelector(sel_debug);
                v136 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v135, (uint64_t)v85, v87);

                v92 = objc_msgSend_error(v4, v88, v89, v90, v91);

                if (v92)
                {
                  v94 = 0;
                }
                else
                {
                  LOBYTE(v134) = v137;
                  self = (GDKnosisResult *)(id)objc_msgSend_initWithQuery_kgq_status_answers_errorMessage_limit_offset_hasMoreAnswers_debug_(self, v93, (uint64_t)v9, (uint64_t)v18, v52, v33, v42, v62, v71, v134, v136);
                  v94 = self;
                }

                goto LABEL_30;
              }
            }
            else
            {
              v118 = objc_msgSend_error(v4, v72, v73, v74, v75);

              if (!v118)
              {
                v120 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v138 = *MEMORY[0x1E4F28568];
                v139 = @"GDKnosisResult offset is nil";
                v121 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v119, (uint64_t)&v139, (uint64_t)&v138, 1);
                v123 = objc_msgSend_errorWithDomain_code_userInfo_(v120, v122, @"GDErrorDomain", 9, (uint64_t)v121);
                objc_msgSend_failWithError_(v4, v124, (uint64_t)v123, v125, v126);
              }
              v71 = 0;
            }
LABEL_29:
            v94 = 0;
LABEL_30:

            goto LABEL_31;
          }
          v116 = objc_msgSend_error(v4, v63, v64, v65, v66);

          if (!v116)
          {
            v127 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v140 = *MEMORY[0x1E4F28568];
            v141 = @"GDKnosisResult limit is nil";
            v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v117, (uint64_t)&v141, (uint64_t)&v140, 1);
            v129 = objc_msgSend_errorWithDomain_code_userInfo_(v127, v128, @"GDErrorDomain", 9, (uint64_t)v71);
            objc_msgSend_failWithError_(v4, v130, (uint64_t)v129, v131, v132);

            goto LABEL_29;
          }
          v62 = 0;
LABEL_22:
          v94 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
LABEL_20:
      v94 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v99 = objc_msgSend_error(v4, v34, v35, v36, v37);

    if (!v99)
    {
      v111 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v142 = *MEMORY[0x1E4F28568];
      v143 = @"GDKnosisResult answers is nil";
      v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v100, (uint64_t)&v143, (uint64_t)&v142, 1);
      v62 = objc_msgSend_errorWithDomain_code_userInfo_(v111, v112, @"GDErrorDomain", 9, (uint64_t)v42);
      objc_msgSend_failWithError_(v4, v113, (uint64_t)v62, v114, v115);
      goto LABEL_22;
    }
    v33 = 0;
LABEL_18:
    v94 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v95 = objc_msgSend_error(v4, v10, v11, v12, v13);

  if (!v95)
  {
    v101 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v146 = *MEMORY[0x1E4F28568];
    v147[0] = @"GDKnosisResult query is nil";
    v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v96, (uint64_t)v147, (uint64_t)&v146, 1);
    v33 = objc_msgSend_errorWithDomain_code_userInfo_(v101, v102, @"GDErrorDomain", 9, (uint64_t)v18);
    objc_msgSend_failWithError_(v4, v103, (uint64_t)v33, v104, v105);
    goto LABEL_18;
  }
  v94 = 0;
LABEL_35:

  return v94;
}

- (GDKnosisResult)initWithQuery:(id)a3 kgq:(id)a4 status:(unint64_t)a5 answers:(id)a6 errorMessage:(id)a7 limit:(id)a8 offset:(id)a9 hasMoreAnswers:(BOOL)a10 debug:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  v62.receiver = self;
  v62.super_class = (Class)GDKnosisResult;
  uint64_t v28 = [(GDKnosisResult *)&v62 init];
  if (v28)
  {
    uint64_t v29 = objc_msgSend_copy(v17, v24, v25, v26, v27);
    query = v28->_query;
    v28->_query = (NSString *)v29;

    uint64_t v35 = objc_msgSend_copy(v18, v31, v32, v33, v34);
    kgq = v28->_kgq;
    v28->_kgq = (NSString *)v35;

    v28->_unint64_t status = a5;
    uint64_t v41 = objc_msgSend_copy(v19, v37, v38, v39, v40);
    answers = v28->_answers;
    v28->_answers = (NSArray *)v41;

    uint64_t v47 = objc_msgSend_copy(v20, v43, v44, v45, v46);
    errorMessage = v28->_errorMessage;
    v28->_errorMessage = (NSString *)v47;

    uint64_t v53 = objc_msgSend_copy(v21, v49, v50, v51, v52);
    limit = v28->_limit;
    v28->_limit = (NSNumber *)v53;

    uint64_t v59 = objc_msgSend_copy(v22, v55, v56, v57, v58);
    offset = v28->_offset;
    v28->_offset = (NSNumber *)v59;

    v28->_BOOL hasMoreAnswers = a10;
    objc_storeStrong((id *)&v28->_debug, a11);
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end