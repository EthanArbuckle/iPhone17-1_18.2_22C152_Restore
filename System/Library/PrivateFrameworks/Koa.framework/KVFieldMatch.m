@interface KVFieldMatch
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFieldMatch:(id)a3;
- (BOOL)isLabelMatch;
- (BOOL)isValueMatch;
- (KVFieldMatch)initWithFieldMatch:(id)a3;
- (SEMFieldMatch)fieldMatch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fieldSpanInfo;
- (id)fieldSpanValue;
- (int64_t)fieldType;
- (unint64_t)hash;
@end

@implementation KVFieldMatch

- (void).cxx_destruct
{
}

- (SEMFieldMatch)fieldMatch
{
  return self->_fieldMatch;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_fieldMatch, a2, v2, v3, v4, v5);
}

- (id)description
{
  return (id)objc_msgSend_description(self->_fieldMatch, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToFieldMatch:(id)a3
{
  fieldMatch = self->_fieldMatch;
  v7 = objc_msgSend_fieldMatch(a3, a2, (uint64_t)a3, v3, v4, v5);
  LOBYTE(fieldMatch) = objc_msgSend_isEqual_(fieldMatch, v8, (uint64_t)v7, v9, v10, v11);

  return (char)fieldMatch;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVFieldMatch *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToFieldMatch = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToFieldMatch = objc_msgSend_isEqualToFieldMatch_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToFieldMatch = 0;
  }

  return isEqualToFieldMatch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_fieldMatch, v11, (uint64_t)a3, v12, v13, v14);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isLabelMatch
{
  return 0;
}

- (BOOL)isValueMatch
{
  return 0;
}

- (int64_t)fieldType
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_entityFieldInfo(self->_fieldMatch, a2, v2, v3, v4, v5);
  id v17 = 0;
  int64_t v12 = objc_msgSend_toKVFieldType_(v7, v8, (uint64_t)&v17, v9, v10, v11);
  id v13 = v17;

  if (!v12)
  {
    uint64_t v14 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      fieldMatch = self->_fieldMatch;
      *(_DWORD *)buf = 136315650;
      v19 = "-[KVFieldMatch fieldType]";
      __int16 v20 = 2112;
      v21 = fieldMatch;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_error_impl(&dword_1BC3B6000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve fieldType from match: %@ error: %@", buf, 0x20u);
    }
  }

  return v12;
}

- (id)fieldSpanValue
{
  return (id)((uint64_t (*)(SEMFieldMatch *, char *))MEMORY[0x1F4181798])(self->_fieldMatch, sel_fieldSpanValue);
}

- (id)fieldSpanInfo
{
  uint64_t v3 = [KVSpanInfo alloc];
  uint64_t v9 = objc_msgSend_fieldSpanInfo(self->_fieldMatch, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_initWithSpanInfo_(v3, v10, (uint64_t)v9, v11, v12, v13);

  return v14;
}

- (KVFieldMatch)initWithFieldMatch:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)KVFieldMatch;
  uint64_t v6 = [(KVFieldMatch *)&v33 init];
  p_isa = (void **)&v6->super.isa;
  if (v6
    && (p_fieldMatch = (void **)&v6->_fieldMatch,
        objc_storeStrong((id *)&v6->_fieldMatch, a3),
        objc_msgSend_entityFieldInfo(p_isa[1], v9, v10, v11, v12, v13),
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v20 = objc_msgSend_entityType(v14, v15, v16, v17, v18, v19),
        v14,
        v20 != 1))
  {
    __int16 v22 = (void *)qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *p_fieldMatch;
      v25 = v22;
      v31 = objc_msgSend_entityFieldInfo(v24, v26, v27, v28, v29, v30);
      v32 = *p_fieldMatch;
      *(_DWORD *)buf = 136315650;
      v35 = "-[KVFieldMatch initWithFieldMatch:]";
      __int16 v36 = 2112;
      v37 = v31;
      __int16 v38 = 2112;
      v39 = v32;
      _os_log_error_impl(&dword_1BC3B6000, v25, OS_LOG_TYPE_ERROR, "%s Unsupported entityFieldInfo: %@ for match: %@", buf, 0x20u);
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