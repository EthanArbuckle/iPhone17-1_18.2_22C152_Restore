@interface GDLocation
+ (unint64_t)triplesColumnsRequiredForRendering;
- (GDEntityIdentifier)entityIdentifier;
- (GDLocation)initWithTriplesIterator:(id)a3;
- (NSArray)addresses;
- (NSArray)names;
- (id)description;
@end

@implementation GDLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_addresses, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)names
{
  return self->_names;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (GDEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)description
{
  v7 = NSString;
  v8 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  v17 = objc_msgSend_names(self, v9, v10, v11, v12);
  if (v17)
  {
    v5 = objc_msgSend_names(self, v13, v14, v15, v16);
    objc_msgSend_componentsJoinedByString_(v5, v18, @"|", v19, v20);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = &stru_1F0AE2ED0;
  }
  v22 = objc_msgSend_addresses(self, v13, v14, v15, v16);
  uint64_t v27 = objc_msgSend_count(v22, v23, v24, v25, v26);
  v32 = objc_msgSend_addresses(self, v28, v29, v30, v31);
  v37 = v32;
  if (v27 == 1)
  {
    uint64_t v38 = objc_msgSend_firstObject(v32, v33, v34, v35, v36);
LABEL_8:
    v46 = (void *)v38;
    v47 = objc_msgSend_stringWithFormat_(v7, v39, @"<GDLocation id:%@ n:%@ a:%@>", v40, v41, v8, v21, v38);

    goto LABEL_10;
  }
  if (objc_msgSend_count(v32, v33, v34, v35, v36))
  {
    uint64_t v38 = objc_msgSend_addresses(self, v42, v43, v44, v45);
    goto LABEL_8;
  }
  v47 = objc_msgSend_stringWithFormat_(v7, v42, @"<GDLocation id:%@ n:%@ a:%@>", v44, v45, v8, v21, &stru_1F0AE2ED0);
LABEL_10:

  if (v17)
  {
  }

  return v47;
}

- (GDLocation)initWithTriplesIterator:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)GDLocation;
  v5 = [(GDLocation *)&v93 init];
  if (v5)
  {
    v87 = objc_opt_new();
    v88 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v86 = v4;
    id v6 = v4;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v89, (uint64_t)v94, 16);
    if (v8)
    {
      uint64_t v13 = v8;
      uint64_t v14 = *(void *)v90;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v90 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = *(void **)(*((void *)&v89 + 1) + 8 * v15);
          if (!v5->_entityIdentifier)
          {
            v17 = [GDEntityIdentifier alloc];
            v22 = objc_msgSend_subject(v16, v18, v19, v20, v21);
            uint64_t v26 = objc_msgSend_initWithString_(v17, v23, (uint64_t)v22, v24, v25);
            entityIdentifier = v5->_entityIdentifier;
            v5->_entityIdentifier = (GDEntityIdentifier *)v26;
          }
          v28 = objc_msgSend_predicate(v16, v9, v10, v11, v12);
          if (objc_msgSend_isEqual_(v28, v29, @"PS33", v30, v31))
          {
            uint64_t v36 = objc_msgSend_object(v16, v32, v33, v34, v35);
            objc_msgSend_addObject_(v88, v37, (uint64_t)v36, v38, v39);
LABEL_11:

            goto LABEL_17;
          }
          if (objc_msgSend_isEqual_(v28, v32, @"PS317", v34, v35))
          {
            uint64_t v36 = objc_msgSend_relationshipPredicate(v16, v40, v41, v42, v43);
            if (!objc_msgSend_isEqual_(v36, v44, @"PS1", v45, v46)) {
              goto LABEL_11;
            }
            v51 = objc_msgSend_object(v16, v47, v48, v49, v50);
            int isEqual = objc_msgSend_isEqual_(v51, v52, @"CS97", v53, v54);

            if (isEqual)
            {
              v56 = [GDLocationAddress alloc];
              v61 = objc_msgSend_relationshipIdIterator(v6, v57, v58, v59, v60);
              uint64_t v36 = objc_msgSend_initWithRelationshipIdTriplesIterator_(v56, v62, (uint64_t)v61, v63, v64);

              if (v36) {
                objc_msgSend_addObject_(v87, v65, (uint64_t)v36, v66, v67);
              }
              goto LABEL_11;
            }
          }
LABEL_17:

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v89, (uint64_t)v94, 16);
      }
      while (v13);
    }

    if (!v5->_entityIdentifier
      || !objc_msgSend_count(v88, v68, v69, v70, v71) && !objc_msgSend_count(v87, v72, v73, v74, v75))
    {

      v84 = 0;
      id v4 = v86;
      goto LABEL_25;
    }
    uint64_t v76 = objc_msgSend_copy(v88, v72, v73, v74, v75);
    names = v5->_names;
    v5->_names = (NSArray *)v76;

    uint64_t v82 = objc_msgSend_copy(v87, v78, v79, v80, v81);
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v82;

    id v4 = v86;
  }
  v84 = v5;
LABEL_25:

  return v84;
}

+ (unint64_t)triplesColumnsRequiredForRendering
{
  return 31;
}

@end