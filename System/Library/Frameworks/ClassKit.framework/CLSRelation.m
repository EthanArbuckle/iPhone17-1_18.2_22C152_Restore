@interface CLSRelation
- (BOOL)isEquivalentToRelation:(id)a3;
- (BOOL)isFaultable;
- (BOOL)isInverseOfRelation:(id)a3;
- (CLSRelation)initWithFromEntity:(Class)a3 toEntity:(Class)a4 onFromKey:(id)a5 toKey:(id)a6 faultable:(BOOL)a7;
- (Class)fromEntity;
- (Class)toEntity;
- (NSString)fromKey;
- (NSString)toKey;
- (id)description;
@end

@implementation CLSRelation

- (CLSRelation)initWithFromEntity:(Class)a3 toEntity:(Class)a4 onFromKey:(id)a5 toKey:(id)a6 faultable:(BOOL)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CLSRelation;
  v15 = [(CLSRelation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromEntity, a3);
    objc_storeStrong((id *)&v16->_toEntity, a4);
    objc_storeStrong((id *)&v16->_fromKey, a5);
    objc_storeStrong((id *)&v16->_toKey, a6);
    v16->_faultable = a7;
  }

  return v16;
}

- (BOOL)isInverseOfRelation:(id)a3
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend_fromEntity(self, v8, v9);
  if (v10 == objc_msgSend_toEntity(v7, v11, v12))
  {
    uint64_t v15 = objc_msgSend_toEntity(self, v13, v14);
    if (v15 == objc_msgSend_fromEntity(v7, v16, v17))
    {
      v24 = objc_msgSend_fromKey(self, v18, v19);
      if (v24 || (objc_msgSend_toKey(v7, v22, v23), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v25 = objc_msgSend_fromKey(self, v22, v23);
        if (!v25)
        {
          char isEqualToString = 0;
          goto LABEL_26;
        }
        v3 = (void *)v25;
        v4 = objc_msgSend_toKey(v7, v26, v27);
        if (v4)
        {
          v30 = objc_msgSend_fromKey(self, v28, v29);
          v33 = objc_msgSend_toKey(v7, v31, v32);
          if (objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33))
          {
            v56 = v33;
            v57 = v30;
            char v35 = 1;
LABEL_16:
            v39 = objc_msgSend_toKey(self, v22, v23);
            if (!v39)
            {
              v55 = objc_msgSend_fromKey(v7, v37, v38);
              if (!v55)
              {
                v55 = 0;
                char isEqualToString = 1;
                goto LABEL_30;
              }
            }
            uint64_t v40 = objc_msgSend_toKey(self, v37, v38);
            if (v40)
            {
              v43 = (void *)v40;
              uint64_t v44 = objc_msgSend_fromKey(v7, v41, v42);
              if (v44)
              {
                v47 = (void *)v44;
                objc_msgSend_toKey(self, v45, v46);
                v48 = v54 = v5;
                objc_msgSend_fromKey(v7, v49, v50);
                v51 = char v53 = v35;
                char isEqualToString = objc_msgSend_isEqualToString_(v48, v52, (uint64_t)v51);

                char v35 = v53;
                v5 = v54;

                if (!v39)
                {
LABEL_30:

                  if ((v35 & 1) == 0)
                  {
LABEL_26:
                    BOOL v20 = isEqualToString;
                    if (!v24)
                    {
LABEL_27:

                      BOOL v20 = isEqualToString;
                    }
LABEL_28:

                    goto LABEL_4;
                  }
LABEL_25:

                  goto LABEL_26;
                }
LABEL_24:

                if ((v35 & 1) == 0) {
                  goto LABEL_26;
                }
                goto LABEL_25;
              }
            }
            char isEqualToString = 0;
            if (!v39) {
              goto LABEL_30;
            }
            goto LABEL_24;
          }
        }
        char isEqualToString = 0;
        BOOL v20 = 0;
        if (!v24) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      char v35 = 0;
      goto LABEL_16;
    }
  }
  BOOL v20 = 0;
LABEL_4:

  return v20;
}

- (BOOL)isEquivalentToRelation:(id)a3
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend_fromEntity(self, v8, v9);
  if (v10 == objc_msgSend_fromEntity(v7, v11, v12))
  {
    uint64_t v15 = objc_msgSend_toEntity(self, v13, v14);
    if (v15 == objc_msgSend_toEntity(v7, v16, v17))
    {
      v24 = objc_msgSend_fromKey(self, v18, v19);
      if (v24 || (objc_msgSend_fromKey(v7, v22, v23), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v25 = objc_msgSend_fromKey(self, v22, v23);
        if (!v25)
        {
          char isEqualToString = 0;
          goto LABEL_26;
        }
        v3 = (void *)v25;
        v4 = objc_msgSend_fromKey(v7, v26, v27);
        if (v4)
        {
          v30 = objc_msgSend_fromKey(self, v28, v29);
          v33 = objc_msgSend_fromKey(v7, v31, v32);
          if (objc_msgSend_isEqualToString_(v30, v34, (uint64_t)v33))
          {
            v56 = v33;
            v57 = v30;
            char v35 = 1;
LABEL_16:
            v39 = objc_msgSend_toKey(self, v22, v23);
            if (!v39)
            {
              v55 = objc_msgSend_toKey(v7, v37, v38);
              if (!v55)
              {
                v55 = 0;
                char isEqualToString = 1;
                goto LABEL_30;
              }
            }
            uint64_t v40 = objc_msgSend_toKey(self, v37, v38);
            if (v40)
            {
              v43 = (void *)v40;
              uint64_t v44 = objc_msgSend_toKey(v7, v41, v42);
              if (v44)
              {
                v47 = (void *)v44;
                objc_msgSend_toKey(self, v45, v46);
                v48 = v54 = v5;
                objc_msgSend_toKey(v7, v49, v50);
                v51 = char v53 = v35;
                char isEqualToString = objc_msgSend_isEqualToString_(v48, v52, (uint64_t)v51);

                char v35 = v53;
                v5 = v54;

                if (!v39)
                {
LABEL_30:

                  if ((v35 & 1) == 0)
                  {
LABEL_26:
                    BOOL v20 = isEqualToString;
                    if (!v24)
                    {
LABEL_27:

                      BOOL v20 = isEqualToString;
                    }
LABEL_28:

                    goto LABEL_4;
                  }
LABEL_25:

                  goto LABEL_26;
                }
LABEL_24:

                if ((v35 & 1) == 0) {
                  goto LABEL_26;
                }
                goto LABEL_25;
              }
            }
            char isEqualToString = 0;
            if (!v39) {
              goto LABEL_30;
            }
            goto LABEL_24;
          }
        }
        char isEqualToString = 0;
        BOOL v20 = 0;
        if (!v24) {
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      char v35 = 0;
      goto LABEL_16;
    }
  }
  BOOL v20 = 0;
LABEL_4:

  return v20;
}

- (id)description
{
  v27.receiver = self;
  v27.super_class = (Class)CLSRelation;
  v3 = [(CLSRelation *)&v27 description];
  v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendString_(v6, v7, @"(fromEntity: ");
  uint64_t v10 = (objc_class *)objc_msgSend_fromEntity(self, v8, v9);
  v11 = NSStringFromClass(v10);
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11);

  objc_msgSend_appendString_(v6, v13, @" (toEntity: "));
  v16 = (objc_class *)objc_msgSend_toEntity(self, v14, v15);
  uint64_t v17 = NSStringFromClass(v16);
  objc_msgSend_appendString_(v6, v18, (uint64_t)v17);

  v21 = objc_msgSend_fromKey(self, v19, v20);
  v24 = objc_msgSend_toKey(self, v22, v23);
  objc_msgSend_appendFormat_(v6, v25, @" (on: fromEntity.%@ == toEntity.%@)"), v21, v24);

  return v6;
}

- (Class)fromEntity
{
  return self->_fromEntity;
}

- (NSString)fromKey
{
  return self->_fromKey;
}

- (Class)toEntity
{
  return self->_toEntity;
}

- (NSString)toKey
{
  return self->_toKey;
}

- (BOOL)isFaultable
{
  return self->_faultable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toKey, 0);
  objc_storeStrong((id *)&self->_toEntity, 0);
  objc_storeStrong((id *)&self->_fromKey, 0);

  objc_storeStrong((id *)&self->_fromEntity, 0);
}

@end