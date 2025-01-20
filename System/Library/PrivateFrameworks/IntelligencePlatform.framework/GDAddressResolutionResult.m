@interface GDAddressResolutionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddressResolutionResult:(id)a3;
- (GDAddressResolutionResult)initWithCoder:(id)a3;
- (GDAddressResolutionResult)initWithRankedEntities:(id)a3;
- (NSArray)rankedEntities;
- (NSString)topRankedContactId;
- (NSString)topRankedMdId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDAddressResolutionResult

- (void).cxx_destruct
{
}

- (NSArray)rankedEntities
{
  return self->_rankedEntities;
}

- (id)description
{
  v3 = objc_opt_new();
  objc_msgSend_appendString_(v3, v4, @"<GDAddressResolutionResult:", v5, v6);
  objc_msgSend_appendString_(v3, v7, @"rankedEntities: [", v8, v9);
  if (objc_msgSend_count(self->_rankedEntities, v10, v11, v12, v13))
  {
    unint64_t v17 = 0;
    do
    {
      v18 = objc_msgSend_objectAtIndexedSubscript_(self->_rankedEntities, v14, v17, v15, v16);
      v23 = objc_msgSend_description(v18, v19, v20, v21, v22);
      objc_msgSend_appendFormat_(v3, v24, @"'%@'", v25, v26, v23);

      if (v17 < objc_msgSend_count(self->_rankedEntities, v27, v28, v29, v30) - 1) {
        objc_msgSend_appendString_(v3, v31, @",", v33, v34);
      }
      ++v17;
    }
    while (v17 < objc_msgSend_count(self->_rankedEntities, v31, v32, v33, v34));
  }
  objc_msgSend_appendString_(v3, v14, @"]>", v15, v16);

  return v3;
}

- (NSString)topRankedContactId
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_count(self->_rankedEntities, a2, v2, v3, v4))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = self->_rankedEntities;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v6);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend_contactId(v15, v8, v9, v10, v11, (void)v23);
          uint64_t v21 = objc_msgSend_length(v16, v17, v18, v19, v20);

          if (v21)
          {
            uint64_t v12 = objc_msgSend_contactId(v15, v8, v9, v10, v11);
            goto LABEL_12;
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v23, (uint64_t)v27, 16);
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSString *)v12;
}

- (NSString)topRankedMdId
{
  if (objc_msgSend_count(self->_rankedEntities, a2, v2, v3, v4))
  {
    uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(self->_rankedEntities, v6, 0, v7, v8);
    v14 = objc_msgSend_mdId(v9, v10, v11, v12, v13);
  }
  else
  {
    v14 = 0;
  }

  return (NSString *)v14;
}

- (GDAddressResolutionResult)initWithRankedEntities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAddressResolutionResult;
  uint64_t v6 = [(GDAddressResolutionResult *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rankedEntities, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_rankedEntities, a2, v2, v3, v4);
}

- (BOOL)isEqualToAddressResolutionResult:(id)a3
{
  uint64_t v4 = (GDAddressResolutionResult *)a3;
  objc_super v9 = v4;
  if (v4 == self)
  {
    char isEqualToArray = 1;
  }
  else if (v4)
  {
    rankedEntities = self->_rankedEntities;
    uint64_t v11 = objc_msgSend_rankedEntities(v4, v5, v6, v7, v8);
    char isEqualToArray = objc_msgSend_isEqualToArray_(rankedEntities, v12, (uint64_t)v11, v13, v14);
  }
  else
  {
    char isEqualToArray = 0;
  }

  return isEqualToArray;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GDAddressResolutionResult *)a3;
  if (v4 == self)
  {
    char isEqualToAddressResolutionResult = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToAddressResolutionResult = objc_msgSend_isEqualToAddressResolutionResult_(self, v5, (uint64_t)v4, v6, v7);
    }
    else {
      char isEqualToAddressResolutionResult = 0;
    }
  }

  return isEqualToAddressResolutionResult;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(GDAddressResolutionResult, a2, (uint64_t)a3, v3, v4);
  rankedEntities = self->_rankedEntities;

  return (id)objc_msgSend_initWithRankedEntities_(v6, v7, (uint64_t)rankedEntities, v8, v9);
}

- (GDAddressResolutionResult)initWithCoder:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v12 = objc_msgSend_setWithObjects_(v5, v9, v6, v10, v11, v7, v8, 0);
  uint64_t v13 = NSStringFromSelector(sel_rankedEntities);
  uint64_t v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13, v15);

  if (v16)
  {
    self = (GDAddressResolutionResult *)(id)objc_msgSend_initWithRankedEntities_(self, v17, (uint64_t)v16, v19, v20);
    uint64_t v21 = self;
  }
  else
  {
    uint64_t v22 = objc_msgSend_error(v4, v17, v18, v19, v20);

    if (!v22)
    {
      long long v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"GDAddressResolutionResult rankedEntities could not be decoded";
      long long v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v33, (uint64_t)&v32, 1);
      v27 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, @"GDErrorDomain", 9, (uint64_t)v25);
      objc_msgSend_failWithError_(v4, v28, (uint64_t)v27, v29, v30);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  rankedEntities = self->_rankedEntities;
  id v4 = a3;
  NSStringFromSelector(sel_rankedEntities);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)rankedEntities, (uint64_t)v7, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end