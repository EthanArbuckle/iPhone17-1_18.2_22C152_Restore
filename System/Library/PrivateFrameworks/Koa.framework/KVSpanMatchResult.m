@interface KVSpanMatchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpanMatchResult:(id)a3;
- (KVSpanMatchResult)initWithSpanMatchResult:(id)a3;
- (SEMSpanMatchResult)spanMatchResult;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fieldMatches;
- (id)itemInfo;
- (id)spanInfo;
- (id)spanValue;
- (unint64_t)hash;
@end

@implementation KVSpanMatchResult

- (void).cxx_destruct
{
}

- (SEMSpanMatchResult)spanMatchResult
{
  return self->_spanMatchResult;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_spanMatchResult, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToSpanMatchResult:(id)a3
{
  spanMatchResult = self->_spanMatchResult;
  v7 = objc_msgSend_spanMatchResult(a3, a2, (uint64_t)a3, v3, v4, v5);
  LOBYTE(spanMatchResult) = objc_msgSend_isEqual_(spanMatchResult, v8, (uint64_t)v7, v9, v10, v11);

  return (char)spanMatchResult;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVSpanMatchResult *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToSpanMatchResult = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToSpanMatchResult = objc_msgSend_isEqualToSpanMatchResult_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToSpanMatchResult = 0;
  }

  return isEqualToSpanMatchResult;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_spanMatchResult, v11, (uint64_t)a3, v12, v13, v14);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (id)description
{
  return (id)objc_msgSend_description(self->_spanMatchResult, a2, v2, v3, v4, v5);
}

- (float)score
{
  objc_msgSend_score(self->_spanMatchResult, a2, v2, v3, v4, v5);
  return result;
}

- (id)fieldMatches
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = objc_msgSend_fieldMatches(self->_spanMatchResult, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  v20 = objc_msgSend_initWithCapacity_(v3, v16, v15, v17, v18, v19);

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v26 = objc_msgSend_fieldMatches(self->_spanMatchResult, v21, v22, v23, v24, v25, 0);
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v47, (uint64_t)v51, 16, v28);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v26);
        }
        uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v34 = [KVFieldMatch alloc];
        v43 = objc_msgSend_initWithFieldMatch_(v34, v35, v33, v36, v37, v38);
        if (v43) {
          objc_msgSend_addObject_(v20, v39, (uint64_t)v43, v40, v41, v42);
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v44, (uint64_t)&v47, (uint64_t)v51, 16, v45);
    }
    while (v30);
  }

  return v20;
}

- (id)spanValue
{
  return (id)((uint64_t (*)(SEMSpanMatchResult *, char *))MEMORY[0x1F4181798])(self->_spanMatchResult, sel_spanValue);
}

- (id)spanInfo
{
  id v3 = [KVSpanInfo alloc];
  uint64_t v9 = objc_msgSend_spanInfo(self->_spanMatchResult, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_initWithSpanInfo_(v3, v10, (uint64_t)v9, v11, v12, v13);

  return v14;
}

- (id)itemInfo
{
  id v3 = [KVItemInfo alloc];
  uint64_t v9 = objc_msgSend_entityInfo(self->_spanMatchResult, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_initWithCascadeEntityInfo_(v3, v10, (uint64_t)v9, v11, v12, v13);

  return v14;
}

- (KVSpanMatchResult)initWithSpanMatchResult:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)KVSpanMatchResult;
  uint64_t v6 = [(KVSpanMatchResult *)&v33 init];
  p_isa = (void **)&v6->super.isa;
  if (v6
    && (p_spanMatchResult = (void **)&v6->_spanMatchResult,
        objc_storeStrong((id *)&v6->_spanMatchResult, a3),
        objc_msgSend_entityInfo(p_isa[1], v9, v10, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v20 = objc_msgSend_entityType(v14, v15, v16, v17, v18, v19),
        v14,
        v20 != 1))
  {
    uint64_t v22 = (void *)qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *p_spanMatchResult;
      uint64_t v25 = v22;
      uint64_t v31 = objc_msgSend_entityInfo(v24, v26, v27, v28, v29, v30);
      v32 = *p_spanMatchResult;
      *(_DWORD *)buf = 136315650;
      v35 = "-[KVSpanMatchResult initWithSpanMatchResult:]";
      __int16 v36 = 2112;
      uint64_t v37 = v31;
      __int16 v38 = 2112;
      v39 = v32;
      _os_log_error_impl(&dword_1BC3B6000, v25, OS_LOG_TYPE_ERROR, "%s Unsupported entityInfo: %@ for result: %@", buf, 0x20u);
    }
    v21 = 0;
  }
  else
  {
    v21 = p_isa;
  }

  return v21;
}

@end