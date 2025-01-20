@interface FTRegion
- (FTRegion)_parentRegion;
- (FTRegion)parentRegion;
- (FTRegion)regionWithID:(id)a3;
- (NSArray)subRegions;
- (NSDictionary)_dictionary;
- (NSString)basePhoneNumber;
- (NSString)isoCode;
- (NSString)label;
- (NSString)regionID;
- (id)_initWithDictionary:(id)a3;
- (id)description;
- (void)_setParentRegion:(id)a3;
- (void)dealloc;
- (void)set_dictionary:(id)a3;
- (void)set_parentRegion:(id)a3;
@end

@implementation FTRegion

- (id)_initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FTRegion;
  v6 = [(FTRegion *)&v31 init];
  p_isa = (void **)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v10 = objc_msgSend_objectForKey_(p_isa[1], v9, @"subregions", 0);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, v32, 16);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * v15);
          v17 = [FTRegion alloc];
          v19 = objc_msgSend__initWithDictionary_(v17, v18, v16);
          v21 = v19;
          if (v19)
          {
            objc_msgSend__setParentRegion_(v19, v20, (uint64_t)p_isa);
            objc_msgSend_addObject_(v8, v22, (uint64_t)v21);
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v23, (uint64_t)&v27, v32, 16);
      }
      while (v13);
    }

    if (objc_msgSend_count(v8, v24, v25)) {
      objc_storeStrong(p_isa + 2, v8);
    }
  }
  return p_isa;
}

- (void)dealloc
{
  objc_msgSend_makeObjectsPerformSelector_withObject_(self->_subRegions, a2, (uint64_t)sel__setParentRegion_, 0);
  v3.receiver = self;
  v3.super_class = (Class)FTRegion;
  [(FTRegion *)&v3 dealloc];
}

- (void)_setParentRegion:(id)a3
{
}

- (FTRegion)parentRegion
{
  return self->_parentRegion;
}

- (NSArray)subRegions
{
  return self->_subRegions;
}

- (FTRegion)regionWithID:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_regionID(self, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v4);

  if (isEqualToString)
  {
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v13 = objc_msgSend_subRegions(self, v10, v11);
    sub_1A7BF0844(v4, v13);
    uint64_t v12 = (FTRegion *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (NSString)isoCode
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, @"iso-2");
}

- (NSString)label
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, @"label");
}

- (NSString)basePhoneNumber
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, @"base-phone-number");
}

- (NSString)regionID
{
  return (NSString *)objc_msgSend_objectForKey_(self->_dictionary, a2, @"id");
}

- (id)description
{
  id v4 = NSString;
  id v5 = objc_msgSend_label(self, a2, v2);
  id v8 = objc_msgSend_isoCode(self, v6, v7);
  uint64_t v11 = objc_msgSend_basePhoneNumber(self, v9, v10);
  uint64_t v14 = objc_msgSend_regionID(self, v12, v13);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v4, v15, @"[FTRegion] Label: %@   ISO: %@    BaseNumber: %@  Region ID: %@", v5, v8, v11, v14);

  return v16;
}

- (NSDictionary)_dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)set_dictionary:(id)a3
{
}

- (FTRegion)_parentRegion
{
  return (FTRegion *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_parentRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentRegion, 0);
  objc_storeStrong((id *)&self->_subRegions, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end