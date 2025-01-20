@interface GDSoftware
+ (unint64_t)triplesColumnsRequiredForRendering;
- (GDEntityIdentifier)entityIdentifier;
- (GDSoftware)initWithTriplesIterator:(id)a3;
- (NSArray)bundleIdentifiers;
- (id)description;
@end

@implementation GDSoftware

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  v12 = objc_msgSend_bundleIdentifiers(self, v8, v9, v10, v11);
  v16 = objc_msgSend_componentsJoinedByString_(v12, v13, @"|", v14, v15);
  v20 = objc_msgSend_stringWithFormat_(v6, v17, @"<GDSoftware id:%@ bs:%@>", v18, v19, v7, v16);

  return v20;
}

- (GDSoftware)initWithTriplesIterator:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)GDSoftware;
  v5 = [(GDSoftware *)&v58 init];
  if (v5)
  {
    v6 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v53 = v4;
    id v7 = v4;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v54, (uint64_t)v59, 16);
    if (v9)
    {
      uint64_t v14 = v9;
      uint64_t v15 = *(void *)v55;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v7);
          }
          v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
          if (!v5->_entityIdentifier)
          {
            uint64_t v18 = [GDEntityIdentifier alloc];
            v23 = objc_msgSend_subject(v17, v19, v20, v21, v22);
            uint64_t v27 = objc_msgSend_initWithString_(v18, v24, (uint64_t)v23, v25, v26);
            entityIdentifier = v5->_entityIdentifier;
            v5->_entityIdentifier = (GDEntityIdentifier *)v27;
          }
          v29 = objc_msgSend_predicate(v17, v10, v11, v12, v13);
          if (objc_msgSend_isEqual_(v29, v30, @"nm_bundleID", v31, v32))
          {
            v37 = objc_msgSend_object(v17, v33, v34, v35, v36);
            objc_msgSend_addObject_(v6, v38, (uint64_t)v37, v39, v40);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v54, (uint64_t)v59, 16);
      }
      while (v14);
    }

    if (!v5->_entityIdentifier || !objc_msgSend_count(v6, v41, v42, v43, v44))
    {

      v51 = 0;
      id v4 = v53;
      goto LABEL_18;
    }
    uint64_t v49 = objc_msgSend_copy(v6, v45, v46, v47, v48);
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v49;

    id v4 = v53;
  }
  v51 = v5;
LABEL_18:

  return v51;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end