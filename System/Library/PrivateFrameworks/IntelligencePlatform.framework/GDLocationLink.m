@interface GDLocationLink
- (GDEntityIdentifier)locationEntityIdentifier;
- (GDLocationLink)initWithRelationshipIdTriplesIterator:(id)a3;
- (GDRelationshipIdentifier)relationshipIdentifier;
- (NSString)label;
@end

@implementation GDLocationLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_locationEntityIdentifier, 0);

  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (NSString)label
{
  return self->_label;
}

- (GDEntityIdentifier)locationEntityIdentifier
{
  return self->_locationEntityIdentifier;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDLocationLink)initWithRelationshipIdTriplesIterator:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)GDLocationLink;
  v5 = [(GDLocationLink *)&v58 init];
  if (!v5)
  {
LABEL_18:
    v51 = v5;
    goto LABEL_21;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v53 = v4;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v54, (uint64_t)v59, 16);
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)v55;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v55 != v14) {
        objc_enumerationMutation(v6);
      }
      v16 = *(void **)(*((void *)&v54 + 1) + 8 * v15);
      if (!v5->_relationshipIdentifier)
      {
        v17 = [GDRelationshipIdentifier alloc];
        v22 = objc_msgSend_relationshipId(v16, v18, v19, v20, v21);
        uint64_t v26 = objc_msgSend_initWithString_(v17, v23, (uint64_t)v22, v24, v25);
        relationshipIdentifier = v5->_relationshipIdentifier;
        v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v26;
      }
      v28 = objc_msgSend_relationshipPredicate(v16, v9, v10, v11, v12);
      if (objc_msgSend_isEqual_(v28, v29, @"PS107", v30, v31))
      {
        v35 = [GDEntityIdentifier alloc];
        label = objc_msgSend_object(v16, v36, v37, v38, v39);
        uint64_t v44 = objc_msgSend_initWithString_(v35, v41, (uint64_t)label, v42, v43);
        locationEntityIdentifier = v5->_locationEntityIdentifier;
        v5->_locationEntityIdentifier = (GDEntityIdentifier *)v44;
      }
      else
      {
        if (!objc_msgSend_isEqual_(v28, v32, @"PS733", v33, v34)) {
          goto LABEL_14;
        }
        uint64_t v50 = objc_msgSend_object(v16, v46, v47, v48, v49);
        label = v5->_label;
        v5->_label = (NSString *)v50;
      }

LABEL_14:
      ++v15;
    }
    while (v13 != v15);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v54, (uint64_t)v59, 16);
  }
  while (v13);
LABEL_16:

  if (v5->_relationshipIdentifier)
  {
    id v4 = v53;
    if (v5->_locationEntityIdentifier) {
      goto LABEL_18;
    }
    v51 = 0;
  }
  else
  {
    v51 = 0;
    id v4 = v53;
  }
LABEL_21:

  return v51;
}

@end