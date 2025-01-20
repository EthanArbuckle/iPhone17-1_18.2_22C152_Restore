@interface CLSAuthTree
+ (BOOL)supportsSecureCoding;
- (CLSAuthTree)init;
- (CLSAuthTree)initWithCoder:(id)a3;
- (CLSAuthTree)initWithOverridingStatus:(int64_t)a3;
- (CLSAuthTree)initWithStatus:(int64_t)a3 statusID:(id)a4 identifier:(id)a5;
- (int64_t)authStatusAtIdentifierPath:(id)a3;
- (int64_t)authStatusFor:(id)a3;
- (void)_addNode:(id)a3 parentStatusID:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthStatus:(int64_t)a3 forIdentifier:(id)a4 statusID:(id)a5 parentStatusID:(id)a6;
@end

@implementation CLSAuthTree

- (CLSAuthTree)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSAuthTree)initWithOverridingStatus:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSAuthTree;
  v5 = [(CLSAuthTree *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, v4, a3);
    overridingStatus = v5->_overridingStatus;
    v5->_overridingStatus = (NSNumber *)v6;
  }
  return v5;
}

- (CLSAuthTree)initWithStatus:(int64_t)a3 statusID:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CLSAuthTree;
  v10 = [(CLSAuthTree *)&v18 init];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    graph = v10->_graph;
    v10->_graph = (NSMutableDictionary *)v11;

    v13 = [CLSAuthTreeNode alloc];
    v15 = objc_msgSend_initWithStatusID_identifier_status_(v13, v14, (uint64_t)v8, v9, a3);
    objc_msgSend__addNode_parentStatusID_(v10, v16, (uint64_t)v15, @"__ROOT__");
  }
  return v10;
}

- (CLSAuthTree)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLSAuthTree;
  v5 = [(CLSAuthTree *)&v24 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v12 = objc_msgSend_initWithObjects_(v6, v11, v7, v8, v9, v10, 0);
    v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"graph");
    uint64_t v17 = objc_msgSend_mutableCopy(v14, v15, v16);
    graph = v5->_graph;
    v5->_graph = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"overridingStatus");
    overridingStatus = v5->_overridingStatus;
    v5->_overridingStatus = (NSNumber *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  graph = self->_graph;
  id v7 = a3;
  objc_msgSend_encodeObject_forKey_(v7, v5, (uint64_t)graph, @"graph");
  objc_msgSend_encodeObject_forKey_(v7, v6, (uint64_t)self->_overridingStatus, @"overridingStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAuthStatus:(int64_t)a3 forIdentifier:(id)a4 statusID:(id)a5 parentStatusID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [CLSAuthTreeNode alloc];
  id v16 = (id)objc_msgSend_initWithStatusID_identifier_status_(v13, v14, (uint64_t)v11, v12, a3);

  objc_msgSend__addNode_parentStatusID_(self, v15, (uint64_t)v16, v10);
}

- (int64_t)authStatusAtIdentifierPath:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  overridingStatus = self->_overridingStatus;
  if (overridingStatus)
  {
    int64_t v8 = objc_msgSend_integerValue(overridingStatus, v4, v5);
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v38 = v6;
    id obj = v6;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v49, v54, 16);
    if (v41)
    {
      uint64_t v42 = *(void *)v50;
      id v11 = @"__ROOT__";
      v40 = self;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = (uint64_t)v11;
        do
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = v12;
          v44 = (__CFString *)v13;
          uint64_t v14 = *(void *)(*((void *)&v49 + 1) + 8 * v12);
          v15 = objc_msgSend_objectForKeyedSubscript_(self->_graph, v10, v13);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v16 = v15;
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v45, v53, 16);
          if (!v18)
          {
LABEL_28:

            int64_t v8 = 2;
            id v11 = v44;
            goto LABEL_30;
          }
          uint64_t v21 = v18;
          uint64_t v22 = *(void *)v46;
LABEL_10:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(v16);
            }
            objc_super v24 = *(void **)(*((void *)&v45 + 1) + 8 * v23);
            uint64_t v25 = objc_msgSend_identifier(v24, v19, v20);
            if (!(v25 | v14)) {
              break;
            }
            v26 = (void *)v25;
            v27 = objc_msgSend_identifier(v24, v19, v20);
            v30 = v27;
            if (v27) {
              BOOL v31 = v14 == 0;
            }
            else {
              BOOL v31 = 1;
            }
            if (v31)
            {
            }
            else
            {
              v32 = objc_msgSend_identifier(v24, v28, v29);
              char isEqualToString = objc_msgSend_isEqualToString_(v32, v33, v14);

              if (isEqualToString) {
                break;
              }
            }
            if (v21 == ++v23)
            {
              uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v45, v53, 16);
              if (v21) {
                goto LABEL_10;
              }
              goto LABEL_28;
            }
          }
          int64_t v8 = objc_msgSend_status(v24, v19, v20);
          objc_msgSend_statusID(v24, v35, v36);
          id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)(v8 - 3) > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_30;
          }
          uint64_t v12 = v43 + 1;
          uint64_t v13 = (uint64_t)v11;
          self = v40;
        }
        while (v43 + 1 != v41);
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, v54, 16);
        if (v41) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = @"__ROOT__";
      int64_t v8 = 2;
    }
LABEL_30:

    id v6 = v38;
  }

  return v8;
}

- (int64_t)authStatusFor:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t)a3;
  overridingStatus = self->_overridingStatus;
  if (overridingStatus)
  {
    int64_t v8 = objc_msgSend_integerValue(overridingStatus, v4, v5);
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(self->_graph, v4, @"__ROOT__");
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v28, v32, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_identifier(v17, v12, v13, (void)v28);
          if (!(v6 | v18))
          {
LABEL_17:
            int64_t v8 = objc_msgSend_status(v17, v12, v13);
            goto LABEL_18;
          }
          uint64_t v19 = (void *)v18;
          uint64_t v20 = objc_msgSend_identifier(v17, v12, v13);
          uint64_t v23 = v20;
          if (v6 && v20)
          {
            objc_super v24 = objc_msgSend_identifier(v17, v21, v22);
            int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, v6);

            if (isEqualToString) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v28, v32, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
    int64_t v8 = 2;
LABEL_18:
  }
  return v8;
}

- (void)_addNode:(id)a3 parentStatusID:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v7)
  {
    id v9 = objc_msgSend_objectForKeyedSubscript_(self->_graph, v6, (uint64_t)v7);
    if (!v9)
    {
      id v9 = objc_opt_new();
      objc_msgSend_setObject_forKeyedSubscript_(self->_graph, v10, (uint64_t)v9, v7);
    }
    objc_msgSend_addObject_(v9, v8, (uint64_t)v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingStatus, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end