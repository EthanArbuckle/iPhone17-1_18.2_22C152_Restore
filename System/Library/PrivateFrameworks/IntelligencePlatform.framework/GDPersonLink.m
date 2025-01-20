@interface GDPersonLink
- (GDEntityIdentifier)linkedPersonEntityIdentifier;
- (GDPersonLink)initWithRelationshipIdTriplesIterator:(id)a3;
- (GDRelationshipIdentifier)relationshipIdentifier;
- (NSString)relationshipLabel;
@end

@implementation GDPersonLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPersonEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipLabel, 0);

  objc_storeStrong((id *)&self->_relationshipIdentifier, 0);
}

- (GDEntityIdentifier)linkedPersonEntityIdentifier
{
  return self->_linkedPersonEntityIdentifier;
}

- (NSString)relationshipLabel
{
  return self->_relationshipLabel;
}

- (GDRelationshipIdentifier)relationshipIdentifier
{
  return self->_relationshipIdentifier;
}

- (GDPersonLink)initWithRelationshipIdTriplesIterator:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)GDPersonLink;
  v5 = [(GDPersonLink *)&v55 init];
  if (!v5)
  {
LABEL_18:
    v48 = v5;
    goto LABEL_21;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v50 = v4;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v51, (uint64_t)v56, 16);
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v13 = v8;
  uint64_t v14 = *(void *)v52;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v52 != v14) {
        objc_enumerationMutation(v6);
      }
      v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
      if (!v5->_relationshipIdentifier)
      {
        v17 = [GDRelationshipIdentifier alloc];
        v22 = objc_msgSend_relationshipId(v16, v18, v19, v20, v21);
        uint64_t v26 = objc_msgSend_initWithString_(v17, v23, (uint64_t)v22, v24, v25);
        relationshipIdentifier = v5->_relationshipIdentifier;
        v5->_relationshipIdentifier = (GDRelationshipIdentifier *)v26;
      }
      v28 = objc_msgSend_relationshipPredicate(v16, v9, v10, v11, v12);
      if (objc_msgSend_isEqual_(v28, v29, @"nm_relationshipLabel", v30, v31))
      {
        uint64_t v36 = objc_msgSend_object(v16, v32, v33, v34, v35);
        relationshipLabel = v5->_relationshipLabel;
        v5->_relationshipLabel = (NSString *)v36;
      }
      else
      {
        if (!objc_msgSend_isEqual_(v28, v32, @"nm_personIdentifier", v34, v35)) {
          goto LABEL_14;
        }
        v38 = [GDEntityIdentifier alloc];
        relationshipLabel = objc_msgSend_object(v16, v39, v40, v41, v42);
        uint64_t v46 = objc_msgSend_initWithString_(v38, v43, (uint64_t)relationshipLabel, v44, v45);
        linkedPersonEntityIdentifier = v5->_linkedPersonEntityIdentifier;
        v5->_linkedPersonEntityIdentifier = (GDEntityIdentifier *)v46;
      }
LABEL_14:

      ++v15;
    }
    while (v13 != v15);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v51, (uint64_t)v56, 16);
  }
  while (v13);
LABEL_16:

  if (v5->_relationshipIdentifier)
  {
    id v4 = v50;
    if (v5->_linkedPersonEntityIdentifier) {
      goto LABEL_18;
    }
    v48 = 0;
  }
  else
  {
    v48 = 0;
    id v4 = v50;
  }
LABEL_21:

  return v48;
}

@end