@interface KGDatabaseNameCache
- (KGDatabaseNameCache)init;
- (id)attrIdentifierForPropertyName:(id)a3 database:(id)a4;
- (id)labelIdentifierForName:(id)a3 database:(id)a4;
- (id)labelNameForIdentifier:(id)a3 database:(id)a4;
- (id)propertyNameForIdentifier:(id)a3 database:(id)a4;
- (id)reportLabelIdentifiersByName;
- (id)reportLabelNamesByIdentifier;
- (void)_addLabelName:(id)a3 identifier:(id)a4 database:(id)a5;
- (void)_addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5;
- (void)_loadCacheIfNeeded:(id)a3;
- (void)addLabelName:(id)a3 identifier:(id)a4 database:(id)a5;
- (void)addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5;
- (void)setWritable;
- (void)transactionBegin;
- (void)transactionEnd;
- (void)unloadCache;
@end

@implementation KGDatabaseNameCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNameByAttrId, 0);
  objc_storeStrong((id *)&self->_attrIdByPropertyName, 0);
  objc_storeStrong((id *)&self->_labelNameById, 0);
  objc_storeStrong((id *)&self->_labelIdByName, 0);
}

- (id)reportLabelNamesByIdentifier
{
  return self->_labelNameById;
}

- (id)reportLabelIdentifiersByName
{
  return self->_labelIdByName;
}

- (void)unloadCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_loaded)
  {
    [(NSMutableDictionary *)self->_labelIdByName removeAllObjects];
    [(NSMutableDictionary *)self->_labelNameById removeAllObjects];
    [(NSMutableDictionary *)self->_attrIdByPropertyName removeAllObjects];
    [(NSMutableDictionary *)self->_propertyNameByAttrId removeAllObjects];
    self->_loaded = 0;
    self->_loadedInThisTransaction = 0;
    self->_highestLabelId = 0;
    self->_highestAttrId = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_loadCacheIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_loaded)
  {
    degas::LabelCursor::LabelCursor((uint64_t *)v22, self->_highestLabelId, (degas::LabelTable *)([v4 database] + 80), 5);
    while (degas::Statement::next((sqlite3_stmt **)v22[0]) == 1)
    {
      unint64_t v6 = sqlite3_column_int64(*(sqlite3_stmt **)v22[0], 0);
      unint64_t v7 = v6;
      if (v6 > self->_highestLabelId) {
        self->_highestLabelId = v6;
      }
      __p = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v22[0], 1, (uint64_t)&__p);
      id v8 = [NSString alloc];
      if (v21 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      v10 = (void *)[v8 initWithUTF8String:p_p];
      v11 = [NSNumber numberWithUnsignedLongLong:v7];
      [(KGDatabaseNameCache *)self _addLabelName:v10 identifier:v11 database:v5];

      if (SHIBYTE(v21) < 0) {
        operator delete(__p);
      }
    }
    degas::AttributeCursor::AttributeCursor((uint64_t *)v18, self->_highestAttrId, (degas::AttributeTable *)([v5 database] + 304), 5);
    while (degas::Statement::next((sqlite3_stmt **)v18[0]) == 1)
    {
      unint64_t v12 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
      unint64_t v13 = v12;
      if (v12 > self->_highestAttrId) {
        self->_highestAttrId = v12;
      }
      __p = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      degas::Statement::stringColumnValue((sqlite3_stmt **)v18[0], 1, (uint64_t)&__p);
      id v14 = [NSString alloc];
      if (v21 >= 0) {
        v15 = &__p;
      }
      else {
        v15 = __p;
      }
      v16 = (void *)[v14 initWithUTF8String:v15];
      v17 = [NSNumber numberWithUnsignedLongLong:v13];
      [(KGDatabaseNameCache *)self _addPropertyName:v16 identifier:v17 database:v5];

      if (SHIBYTE(v21) < 0) {
        operator delete(__p);
      }
    }
    self->_loaded = 1;
    self->_loadedInThisTransaction = self->_isInTransaction;
    degas::Cursor::~Cursor(v18);
    degas::Cursor::~Cursor(v22);
  }
}

- (void)_addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->_propertyNameByAttrId objectForKeyedSubscript:v9];
  unint64_t v12 = v11;
  if (!v11)
  {
LABEL_6:
    [(NSMutableDictionary *)self->_propertyNameByAttrId setObject:v8 forKeyedSubscript:v9];
    id v14 = [(NSMutableDictionary *)self->_attrIdByPropertyName objectForKeyedSubscript:v8];
    v15 = v14;
    if (v14 && ([v14 isEqualToNumber:v9] & 1) == 0)
    {
      [v10 setFatalError:@"duplicate property"];
      v16 = KGLoggingConnection();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v17 = [(NSMutableDictionary *)self->_attrIdByPropertyName objectForKeyedSubscript:v8];
        int v18 = 138543874;
        id v19 = v9;
        __int16 v20 = 2114;
        id v21 = v17;
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_fault_impl(&dword_1D1654000, v16, OS_LOG_TYPE_FAULT, "duplicate property by identifiers %{public}@ and %{public}@, name %{public}@", (uint8_t *)&v18, 0x20u);
      }
    }
    [(NSMutableDictionary *)self->_attrIdByPropertyName setObject:v9 forKeyedSubscript:v8];
    goto LABEL_14;
  }
  if ([v11 isEqualToString:v8])
  {
    unint64_t v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543618;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "redundant insert of property in cache name=%{public}@, identifier=%{public}@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_6;
  }
  [v10 setFatalError:@"duplicate property"];
  v15 = KGLoggingConnection();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    int v18 = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v12;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_fault_impl(&dword_1D1654000, v15, OS_LOG_TYPE_FAULT, "duplicate property by name=%{public}@, other name=%{public}@, identifier %{public}@", (uint8_t *)&v18, 0x20u);
  }
LABEL_14:
}

- (void)_addLabelName:(id)a3 identifier:(id)a4 database:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->_labelNameById objectForKeyedSubscript:v9];
  unint64_t v12 = v11;
  if (!v11)
  {
LABEL_6:
    [(NSMutableDictionary *)self->_labelNameById setObject:v8 forKeyedSubscript:v9];
    id v14 = [(NSMutableDictionary *)self->_labelIdByName objectForKeyedSubscript:v8];
    v15 = v14;
    if (v14 && ([v14 isEqualToNumber:v9] & 1) == 0)
    {
      [v10 setFatalError:@"duplicate label"];
      v16 = KGLoggingConnection();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        int v17 = 138543874;
        int v18 = v9;
        __int16 v19 = 2114;
        __int16 v20 = v15;
        __int16 v21 = 2114;
        __int16 v22 = v8;
        _os_log_fault_impl(&dword_1D1654000, v16, OS_LOG_TYPE_FAULT, "duplicate label by identifiers %{public}@ and %{public}@, name %{public}@", (uint8_t *)&v17, 0x20u);
      }
    }
    [(NSMutableDictionary *)self->_labelIdByName setObject:v9 forKeyedSubscript:v8];
    goto LABEL_14;
  }
  if ([v11 isEqualToString:v8])
  {
    unint64_t v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      int v18 = v8;
      __int16 v19 = 2114;
      __int16 v20 = v9;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "redundant insert of label in cache name=%{public}@, identifier=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    goto LABEL_6;
  }
  [v10 setFatalError:@"duplicate label"];
  v15 = KGLoggingConnection();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    int v17 = 138543874;
    int v18 = v8;
    __int16 v19 = 2114;
    __int16 v20 = v12;
    __int16 v21 = 2114;
    __int16 v22 = v9;
    _os_log_fault_impl(&dword_1D1654000, v15, OS_LOG_TYPE_FAULT, "duplicate label by name=%{public}@, other name=%{public}@, identifier %{public}@", (uint8_t *)&v17, 0x20u);
  }
LABEL_14:
}

- (void)addPropertyName:(id)a3 identifier:(id)a4 database:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v9];
  [(NSMutableDictionary *)self->_propertyNameByAttrId setObject:v10 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_attrIdByPropertyName setObject:v8 forKeyedSubscript:v10];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addLabelName:(id)a3 identifier:(id)a4 database:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v9];
  [(NSMutableDictionary *)self->_labelNameById setObject:v10 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_labelIdByName setObject:v8 forKeyedSubscript:v10];
  os_unfair_lock_unlock(&self->_lock);
}

- (id)propertyNameForIdentifier:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
  uint64_t v8 = [(NSMutableDictionary *)self->_propertyNameByAttrId objectForKeyedSubscript:v6];
  id v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
      id v9 = [(NSMutableDictionary *)self->_propertyNameByAttrId objectForKeyedSubscript:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)attrIdentifierForPropertyName:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
  uint64_t v8 = [(NSMutableDictionary *)self->_attrIdByPropertyName objectForKeyedSubscript:v6];
  id v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
      id v9 = [(NSMutableDictionary *)self->_attrIdByPropertyName objectForKeyedSubscript:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)labelNameForIdentifier:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
  uint64_t v8 = [(NSMutableDictionary *)self->_labelNameById objectForKeyedSubscript:v6];
  id v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
      id v9 = [(NSMutableDictionary *)self->_labelNameById objectForKeyedSubscript:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (id)labelIdentifierForName:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
  uint64_t v8 = [(NSMutableDictionary *)self->_labelIdByName objectForKeyedSubscript:v6];
  id v9 = (void *)v8;
  if (self->_readOnly && !v8)
  {
    if (self->_isInTransaction && !self->_loadedInThisTransaction)
    {
      self->_loaded = 0;
      [(KGDatabaseNameCache *)self _loadCacheIfNeeded:v7];
      id v9 = [(NSMutableDictionary *)self->_labelIdByName objectForKeyedSubscript:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)transactionEnd
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  *(_WORD *)&self->_isInTransaction = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)transactionBegin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isInTransaction && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "KGDatabase name cache: transactionBegin is not reentrant", v4, 2u);
  }
  *(_WORD *)&self->_isInTransaction = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)setWritable
{
  self->_readOnly = 0;
}

- (KGDatabaseNameCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)KGDatabaseNameCache;
  v2 = [(KGDatabaseNameCache *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_loaded = 0;
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    labelIdByName = v3->_labelIdByName;
    v3->_labelIdByName = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    labelNameById = v3->_labelNameById;
    v3->_labelNameById = v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attrIdByPropertyName = v3->_attrIdByPropertyName;
    v3->_attrIdByPropertyName = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    propertyNameByAttrId = v3->_propertyNameByAttrId;
    v3->_propertyNameByAttrId = v10;

    v3->_highestLabelId = 0;
    v3->_highestAttrId = 0;
    *(_WORD *)&v3->_readOnly = 1;
    v3->_loadedInThisTransaction = 0;
  }
  return v3;
}

@end