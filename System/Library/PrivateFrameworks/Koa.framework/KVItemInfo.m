@interface KVItemInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItemInfo:(id)a3;
- (KVItemInfo)initWithCascadeEntityInfo:(id)a3;
- (SEMCascadeEntityInfo)entityInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)item;
- (id)itemId;
- (id)originAppId;
- (id)priorInfo;
- (id)unindexedFields;
- (id)unindexedFieldsWithType:(int64_t)a3;
- (int64_t)itemType;
- (unint64_t)hash;
@end

@implementation KVItemInfo

- (void).cxx_destruct
{
}

- (SEMCascadeEntityInfo)entityInfo
{
  return self->_entityInfo;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_entityInfo, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToItemInfo:(id)a3
{
  entityInfo = self->_entityInfo;
  v7 = objc_msgSend_entityInfo(a3, a2, (uint64_t)a3, v3, v4, v5);
  LOBYTE(entityInfo) = objc_msgSend_isEqual_(entityInfo, v8, (uint64_t)v7, v9, v10, v11);

  return (char)entityInfo;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVItemInfo *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToItemInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToItemInfo = objc_msgSend_isEqualToItemInfo_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToItemInfo = 0;
  }

  return isEqualToItemInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v10 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_entityInfo, v11, (uint64_t)a3, v12, v13, v14);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (id)description
{
  return (id)objc_msgSend_description(self->_entityInfo, a2, v2, v3, v4, v5);
}

- (id)unindexedFieldsWithType:(int64_t)a3
{
  return 0;
}

- (id)unindexedFields
{
  return 0;
}

- (id)priorInfo
{
  return 0;
}

- (id)originAppId
{
  return (id)((uint64_t (*)(SEMCascadeEntityInfo *, char *))MEMORY[0x1F4181798])(self->_entityInfo, sel_sourceIdentifier);
}

- (int64_t)itemType
{
  v6 = objc_msgSend_item(self, a2, v2, v3, v4, v5);
  int64_t v12 = objc_msgSend_itemType(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)itemId
{
  v6 = objc_msgSend_item(self, a2, v2, v3, v4, v5);
  int64_t v12 = objc_msgSend_itemId(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)item
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  entityInfo = self->_entityInfo;
  id v12 = 0;
  uint64_t v7 = objc_msgSend_toKVItem_(entityInfo, a2, (uint64_t)&v12, v2, v3, v4);
  id v8 = v12;
  if (!v7)
  {
    uint64_t v9 = qword_1EB5EE458;
    if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = self->_entityInfo;
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[KVItemInfo item]";
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_error_impl(&dword_1BC3B6000, v9, OS_LOG_TYPE_ERROR, "%s Failed to resolve KVItem from entityInfo: %@ error: %@", buf, 0x20u);
    }
  }

  return v7;
}

- (KVItemInfo)initWithCascadeEntityInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVItemInfo;
  v6 = [(KVItemInfo *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entityInfo, a3);
  }

  return v7;
}

@end