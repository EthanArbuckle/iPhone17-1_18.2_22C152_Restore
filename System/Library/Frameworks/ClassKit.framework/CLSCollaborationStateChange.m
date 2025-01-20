@interface CLSCollaborationStateChange
+ (BOOL)supportsSecureCoding;
- (BOOL)_addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8 assets:(id)a9;
- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8;
- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assets:(id)a8;
- (BOOL)addStates:(id)a3;
- (BOOL)addValidStates:(id)a3;
- (BOOL)hasChanges;
- (BOOL)setAssetURL:(id)a3 forDomain:(int64_t)a4;
- (BOOL)setClassID:(id)a3 forDomain:(int64_t)a4;
- (BOOL)setDomainVersion:(int64_t)a3 forDomain:(int64_t)a4;
- (BOOL)setFlags:(unint64_t)a3 forDomain:(int64_t)a4;
- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 forDomain:(int64_t)a5;
- (BOOL)setNote:(id)a3 forDomain:(int64_t)a4;
- (BOOL)setState:(int64_t)a3 forDomain:(int64_t)a4;
- (BOOL)validateObject:(id *)a3;
- (CLSCollaborationStateChange)initWithCoder:(id)a3;
- (CLSCollaborationStateChange)initWithObject:(id)a3 ownerPersonID:(id)a4 targetClassID:(id)a5 recipientPersonID:(id)a6;
- (NSArray)states;
- (NSSet)changedDomains;
- (NSSet)deletedDomains;
- (NSString)ownerPersonID;
- (NSString)recipientPersonID;
- (NSString)senderPersonID;
- (NSString)targetClassID;
- (NSString)targetEntityName;
- (NSString)targetObjectID;
- (id)_init;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateForDomain:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeChangesFrom:(id)a3;
- (void)mergeWithObject:(id)a3;
- (void)removeStateForDomain:(int64_t)a3;
- (void)setChangedDomains:(id)a3;
- (void)setDeletedDomains:(id)a3;
- (void)setOwnerPersonID:(id)a3;
- (void)setRecipientPersonID:(id)a3;
- (void)setSenderPersonID:(id)a3;
- (void)setStates:(id)a3;
- (void)setTargetClassID:(id)a3;
- (void)setTargetEntityName:(id)a3;
- (void)setTargetObjectID:(id)a3;
@end

@implementation CLSCollaborationStateChange

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)CLSCollaborationStateChange;
  v2 = [(CLSObject *)&v8 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[19];
    v2[19] = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)v2[20];
    v2[20] = v5;
  }
  return v2;
}

- (CLSCollaborationStateChange)initWithObject:(id)a3 ownerPersonID:(id)a4 targetClassID:(id)a5 recipientPersonID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CLSCollaborationStateChange;
  v16 = [(CLSObject *)&v27 _init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_objectID(v10, v14, v15);
    targetObjectID = v16->_targetObjectID;
    v16->_targetObjectID = (NSString *)v17;

    v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = NSStringFromClass(v19);
    targetEntityName = v16->_targetEntityName;
    v16->_targetEntityName = (NSString *)v20;

    objc_storeStrong((id *)&v16->_ownerPersonID, a4);
    objc_storeStrong((id *)&v16->_targetClassID, a5);
    objc_storeStrong((id *)&v16->_recipientPersonID, a6);
    uint64_t v22 = objc_opt_new();
    changedDomains = v16->_changedDomains;
    v16->_changedDomains = (NSMutableSet *)v22;

    uint64_t v24 = objc_opt_new();
    states = v16->_states;
    v16->_states = (NSMutableArray *)v24;
  }
  return v16;
}

- (BOOL)validateObject:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)CLSCollaborationStateChange;
  if (!-[CLSObject validateObject:](&v18, sel_validateObject_)) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_states;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, v19, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend_validateObject_(*(void **)(*((void *)&v14 + 1) + 8 * i), v8, (uint64_t)a3, (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, v19, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  return v12;
}

- (CLSCollaborationStateChange)initWithCoder:(id)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CLSCollaborationStateChange;
  uint64_t v5 = [(CLSObject *)&v47 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"targetObjectID");
    targetObjectID = v5->_targetObjectID;
    v5->_targetObjectID = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"targetEntityName");
    targetEntityName = v5->_targetEntityName;
    v5->_targetEntityName = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"ownerPersonID");
    ownerPersonID = v5->_ownerPersonID;
    v5->_ownerPersonID = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"senderPersonID");
    senderPersonID = v5->_senderPersonID;
    v5->_senderPersonID = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"targetClassID");
    targetClassID = v5->_targetClassID;
    v5->_targetClassID = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"recipientPersonID");
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v49[1] = objc_opt_class();
    v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v31, (uint64_t)v49, 2);
    v34 = objc_msgSend_setWithArray_(v30, v33, (uint64_t)v32);
    uint64_t v36 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v35, (uint64_t)v34, @"changedDomains");
    changedDomains = v5->_changedDomains;
    v5->_changedDomains = (NSMutableSet *)v36;

    v38 = (void *)MEMORY[0x1E4F1CAD0];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v39, (uint64_t)v48, 2);
    v42 = objc_msgSend_setWithArray_(v38, v41, (uint64_t)v40);
    uint64_t v44 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v43, (uint64_t)v42, @"states");
    states = v5->_states;
    v5->_states = (NSMutableArray *)v44;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSCollaborationStateChange;
  [(CLSObject *)&v14 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_targetObjectID, @"targetObjectID");
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_targetEntityName, @"targetEntityName");
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_ownerPersonID, @"ownerPersonID");
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_senderPersonID, @"senderPersonID");
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_targetClassID, @"targetClassID");
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_changedDomains, @"changedDomains");
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_states, @"states");
  recipientPersonID = self->_recipientPersonID;
  if (recipientPersonID) {
    objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)recipientPersonID, @"recipientPersonID");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  v22[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSCollaborationStateChange;
  [(CLSObject *)&v20 mergeWithObject:v4];
  v22[0] = @"targetObjectID";
  v22[1] = @"targetEntityName";
  v22[2] = @"ownerPersonID";
  v22[3] = @"senderPersonID";
  v22[4] = @"recipientPersonID";
  v22[5] = @"targetClassID";
  v22[6] = @"changedDomains";
  v22[7] = @"states";
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v22, 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_super v14 = objc_msgSend_valueForKey_(v4, v9, v13, (void)v16);
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }
}

- (void)setSenderPersonID:(id)a3
{
}

- (BOOL)hasChanges
{
  return objc_msgSend_count(self->_changedDomains, a2, v2) != 0;
}

- (id)stateForDomain:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_states;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend_domain(v12, v7, v8, (void)v15) == a3)
        {
          id v13 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)addValidStates:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, v65, 16);
  if (!v7)
  {
    LOBYTE(v12) = 1;
    goto LABEL_52;
  }
  uint64_t v10 = v7;
  uint64_t v11 = *(void *)v62;
  uint64_t v12 = 1;
  uint64_t v50 = *(void *)v62;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v62 != v11) {
        objc_enumerationMutation(obj);
      }
      objc_super v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
      long long v17 = objc_msgSend_parentObjectID(v14, v8, v9);
      if (!v17)
      {
        v58 = objc_msgSend_targetObjectID(self, v15, v16);
        if (!v58)
        {
          v57 = v4;
          v58 = 0;
          char v56 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v3 = objc_msgSend_parentObjectID(v14, v15, v16);
      if (!v3)
      {
        v59 = 0;
        goto LABEL_39;
      }
      uint64_t v5 = objc_msgSend_targetObjectID(self, v18, v19);
      if (v5)
      {
        uint64_t v22 = v12;
        id v4 = objc_msgSend_parentObjectID(v14, v20, v21);
        v25 = objc_msgSend_targetObjectID(self, v23, v24);
        v53 = v25;
        if (objc_msgSend_isEqualToString_(v4, v26, (uint64_t)v25))
        {
          v57 = v4;
          char v56 = 1;
          uint64_t v12 = v22;
LABEL_17:
          v29 = objc_msgSend_ownerPersonID(v14, v15, v16);
          v59 = (void *)v3;
          if (!v29)
          {
            v52 = objc_msgSend_ownerPersonID(self, v27, v28);
            if (!v52)
            {
              v52 = 0;
              LODWORD(v3) = 1;
LABEL_33:
              char v44 = v56;
LABEL_36:

LABEL_37:
              id v4 = v57;
              if (v44)
              {
              }
LABEL_39:
              if (v17)
              {

                if (!v3) {
                  goto LABEL_44;
                }
              }
              else
              {

                if ((v3 & 1) == 0) {
                  goto LABEL_44;
                }
              }
              uint64_t v45 = objc_msgSend_domain(v14, v8, v9);
              objc_super v47 = objc_msgSend_stateForDomain_(self, v46, v45);

              if (!v47)
              {
                objc_msgSend_addObject_(self->_states, v8, (uint64_t)v14);
                goto LABEL_45;
              }
LABEL_44:
              uint64_t v12 = 0;
LABEL_45:
              uint64_t v3 = (uint64_t)v59;
              goto LABEL_46;
            }
          }
          v54 = v5;
          uint64_t v30 = v10;
          uint64_t v31 = objc_msgSend_ownerPersonID(v14, v27, v28);
          if (v31)
          {
            v34 = (void *)v31;
            uint64_t v35 = objc_msgSend_ownerPersonID(self, v32, v33);
            if (v35)
            {
              v38 = (void *)v35;
              unsigned int v51 = v12;
              v39 = objc_msgSend_ownerPersonID(v14, v36, v37);
              v42 = objc_msgSend_ownerPersonID(self, v40, v41);
              LODWORD(v3) = objc_msgSend_isEqualToString_(v39, v43, (uint64_t)v42);

              if (v29)
              {
                uint64_t v11 = v50;
                uint64_t v10 = v30;
                uint64_t v12 = v51;
                char v44 = v56;
LABEL_30:

                uint64_t v5 = v54;
                goto LABEL_37;
              }
              uint64_t v11 = v50;
              uint64_t v10 = v30;
              uint64_t v5 = v54;
              uint64_t v12 = v51;
              goto LABEL_33;
            }

            LODWORD(v3) = 0;
            char v44 = v56;
            if (v29)
            {
              uint64_t v11 = v50;
              goto LABEL_29;
            }
            uint64_t v11 = v50;
          }
          else
          {
            LODWORD(v3) = 0;
            char v44 = v56;
            if (v29)
            {
LABEL_29:
              uint64_t v10 = v30;
              goto LABEL_30;
            }
          }
          uint64_t v10 = v30;
          uint64_t v5 = v54;
          goto LABEL_36;
        }
      }
      if (v17) {

      }
      else {
      uint64_t v12 = 0;
      }
LABEL_46:
      ++v13;
    }
    while (v10 != v13);
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v61, v65, 16);
    uint64_t v10 = v48;
  }
  while (v48);
LABEL_52:

  return v12 & 1;
}

- (void)mergeChangesFrom:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = objc_msgSend_changedDomains(v4, v5, v6, 0);
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v28, v33, 16);
    if (v10)
    {
      uint64_t v13 = v10;
      uint64_t v14 = *(void *)v29;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v8);
          }
          uint64_t v16 = objc_msgSend_integerValue(*(void **)(*((void *)&v28 + 1) + 8 * v15), v11, v12);
          uint64_t v19 = objc_msgSend_stateForDomain_(v7, v17, v16);
          if (v19)
          {
            objc_msgSend_removeStateForDomain_(self, v18, v16);
            v32 = v19;
            uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v32, 1);
            int valid = objc_msgSend_addValidStates_(self, v22, (uint64_t)v21);

            if (valid)
            {
              changedDomains = self->_changedDomains;
              uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v24, v16);
              objc_msgSend_addObject_(changedDomains, v27, (uint64_t)v26);
            }
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v28, v33, 16);
      }
      while (v13);
    }
  }
}

- (BOOL)addStates:(id)a3
{
  uint64_t v3 = self;
  states = self->_states;
  id v5 = a3;
  objc_msgSend_removeAllObjects(states, v6, v7);
  objc_msgSend_removeAllObjects(v3->_changedDomains, v8, v9);
  LOBYTE(v3) = objc_msgSend_addValidStates_(v3, v10, (uint64_t)v5);

  return (char)v3;
}

- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8
{
  return objc_msgSend__addStateForDomain_domainVersion_state_flags_note_assetURL_assets_(self, a2, a3, a4, a5, a6, a7, a8, 0);
}

- (BOOL)addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assets:(id)a8
{
  return objc_msgSend__addStateForDomain_domainVersion_state_flags_note_assetURL_assets_(self, a2, a3, a4, a5, a6, a7, 0, a8);
}

- (BOOL)_addStateForDomain:(int64_t)a3 domainVersion:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6 note:(id)a7 assetURL:(id)a8 assets:(id)a9
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  uint64_t v19 = objc_msgSend_stateForDomain_(self, v18, a3);

  if (!v19)
  {
    int64_t v55 = a4;
    uint64_t v20 = [CLSCollaborationState alloc];
    v53 = v17;
    targetObjectID = self->_targetObjectID;
    Class v22 = NSClassFromString(self->_targetEntityName);
    uint64_t v24 = objc_msgSend_initForObjectWithID_targetClass_ownerPersonID_domain_state_flags_(v20, v23, (uint64_t)targetObjectID, v22, self->_ownerPersonID, a3, a5, a6);
    objc_msgSend_setDomainVersion_(v24, v25, v55);
    id v56 = v15;
    objc_msgSend_setNote_(v24, v26, (uint64_t)v15);
    id v54 = v16;
    objc_msgSend_setAssetURL_(v24, v27, (uint64_t)v16);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v28 = v53;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v57, v61, 16);
    if (v30)
    {
      uint64_t v33 = v30;
      uint64_t v34 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v58 != v34) {
            objc_enumerationMutation(v28);
          }
          uint64_t v36 = *(void *)(*((void *)&v57 + 1) + 8 * i);
          uint64_t v37 = objc_msgSend_assetsToAddOrUpdate(v24, v31, v32);
          objc_msgSend_addObject_(v37, v38, v36);
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v57, v61, 16);
      }
      while (v33);
    }

    uint64_t v41 = objc_msgSend_targetClassID(self, v39, v40);
    objc_msgSend_setClassID_(v24, v42, (uint64_t)v41);

    objc_msgSend_addObject_(self->_states, v43, (uint64_t)v24);
    changedDomains = self->_changedDomains;
    uint64_t v45 = NSNumber;
    uint64_t v48 = objc_msgSend_domain(v24, v46, v47);
    uint64_t v50 = objc_msgSend_numberWithInteger_(v45, v49, v48);
    objc_msgSend_addObject_(changedDomains, v51, (uint64_t)v50);

    id v16 = v54;
    id v15 = v56;
    id v17 = v53;
  }

  return v19 == 0;
}

- (void)removeStateForDomain:(int64_t)a3
{
  objc_msgSend_stateForDomain_(self, a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9) {
    objc_msgSend_removeObject_(self->_states, v5, (uint64_t)v9);
  }
  changedDomains = self->_changedDomains;
  uint64_t v7 = objc_msgSend_numberWithInteger_(NSNumber, v5, a3);
  objc_msgSend_removeObject_(changedDomains, v8, (uint64_t)v7);
}

- (BOOL)setDomainVersion:(int64_t)a3 forDomain:(int64_t)a4
{
  id v9 = objc_msgSend_stateForDomain_(self, a2, a4);
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_domainVersion(v9, v10, v11) != a3)
    {
      objc_msgSend_setDomainVersion_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    uint64_t v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18);
    uint64_t v22 = objc_msgSend_dateLastModified(v9, v20, v21);
    if (!(v22 | v19)) {
      goto LABEL_11;
    }
    v25 = (void *)v22;
    uint64_t v26 = objc_msgSend_dateLastModified(v9, v23, v24);
    long long v29 = v26;
    if (v26 && v19)
    {
      uint64_t v30 = objc_msgSend_dateLastModified(v9, v27, v28);
      char isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if (isEqualToDate) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v35, a4);
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);
  }
  return v9 != 0;
}

- (BOOL)setState:(int64_t)a3 forDomain:(int64_t)a4
{
  id v9 = objc_msgSend_stateForDomain_(self, a2, a4);
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_state(v9, v10, v11) != a3)
    {
      objc_msgSend_setState_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    uint64_t v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18);
    uint64_t v22 = objc_msgSend_dateLastModified(v9, v20, v21);
    if (!(v22 | v19)) {
      goto LABEL_11;
    }
    v25 = (void *)v22;
    uint64_t v26 = objc_msgSend_dateLastModified(v9, v23, v24);
    long long v29 = v26;
    if (v26 && v19)
    {
      uint64_t v30 = objc_msgSend_dateLastModified(v9, v27, v28);
      char isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if (isEqualToDate) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v35, a4);
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);
  }
  return v9 != 0;
}

- (BOOL)setFlags:(unint64_t)a3 forDomain:(int64_t)a4
{
  id v9 = objc_msgSend_stateForDomain_(self, a2, a4);
  if (v9)
  {
    objc_msgSend_lock(self, v7, v8);
    if (objc_msgSend_flags(v9, v10, v11) != a3)
    {
      objc_msgSend_setFlags_(v9, v12, a3);
      objc_msgSend_setModified_(self, v14, 1);
    }
    objc_msgSend_unlock(self, v12, v13);
    objc_msgSend_lock(self, v15, v16);
    uint64_t v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18);
    uint64_t v22 = objc_msgSend_dateLastModified(v9, v20, v21);
    if (!(v22 | v19)) {
      goto LABEL_11;
    }
    v25 = (void *)v22;
    uint64_t v26 = objc_msgSend_dateLastModified(v9, v23, v24);
    long long v29 = v26;
    if (v26 && v19)
    {
      uint64_t v30 = objc_msgSend_dateLastModified(v9, v27, v28);
      char isEqualToDate = objc_msgSend_isEqualToDate_(v30, v31, v19);

      if (isEqualToDate) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend_setDateLastModified_(v9, v23, v19);
    objc_msgSend_setModified_(self, v33, 1);
LABEL_11:
    objc_msgSend_unlock(self, v23, v24);

    changedDomains = self->_changedDomains;
    uint64_t v36 = objc_msgSend_numberWithInteger_(NSNumber, v35, a4);
    objc_msgSend_addObject_(changedDomains, v37, (uint64_t)v36);
  }
  return v9 != 0;
}

- (BOOL)setClassID:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_stateForDomain_(self, v7, a4);
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    uint64_t v11 = (uint64_t)v6;
    uint64_t v14 = objc_msgSend_classID(v10, v12, v13);
    if (!(v11 | v14)) {
      goto LABEL_9;
    }
    id v17 = (void *)v14;
    uint64_t v18 = objc_msgSend_classID(v10, v15, v16);
    uint64_t v21 = v18;
    if (v11 && v18)
    {
      uint64_t v22 = objc_msgSend_classID(v10, v19, v20);
      char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, v11);

      if (isEqualToString)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v26, v27);
        uint64_t v30 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v28, v29);
        uint64_t v33 = objc_msgSend_dateLastModified(v10, v31, v32);
        if (v33 | v30)
        {
          uint64_t v36 = (void *)v33;
          uint64_t v37 = objc_msgSend_dateLastModified(v10, v34, v35);
          uint64_t v40 = v37;
          if (v37 && v30)
          {
            uint64_t v41 = objc_msgSend_dateLastModified(v10, v38, v39);
            char isEqualToDate = objc_msgSend_isEqualToDate_(v41, v42, v30);

            if (isEqualToDate) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          objc_msgSend_setDateLastModified_(v10, v34, v30);
          objc_msgSend_setModified_(self, v44, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v34, v35);

        changedDomains = self->_changedDomains;
        uint64_t v47 = objc_msgSend_numberWithInteger_(NSNumber, v46, a4);
        objc_msgSend_addObject_(changedDomains, v48, (uint64_t)v47);

        goto LABEL_17;
      }
    }
    else
    {
    }
    objc_msgSend_setClassID_(v10, v15, v11);
    objc_msgSend_setModified_(self, v25, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setNote:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_stateForDomain_(self, v7, a4);
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    uint64_t v11 = (uint64_t)v6;
    uint64_t v14 = objc_msgSend_note(v10, v12, v13);
    if (!(v11 | v14)) {
      goto LABEL_9;
    }
    id v17 = (void *)v14;
    uint64_t v18 = objc_msgSend_note(v10, v15, v16);
    uint64_t v21 = v18;
    if (v11 && v18)
    {
      uint64_t v22 = objc_msgSend_note(v10, v19, v20);
      char isEqualToString = objc_msgSend_isEqualToString_(v22, v23, v11);

      if (isEqualToString)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v26, v27);
        uint64_t v30 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v28, v29);
        uint64_t v33 = objc_msgSend_dateLastModified(v10, v31, v32);
        if (v33 | v30)
        {
          uint64_t v36 = (void *)v33;
          uint64_t v37 = objc_msgSend_dateLastModified(v10, v34, v35);
          uint64_t v40 = v37;
          if (v37 && v30)
          {
            uint64_t v41 = objc_msgSend_dateLastModified(v10, v38, v39);
            char isEqualToDate = objc_msgSend_isEqualToDate_(v41, v42, v30);

            if (isEqualToDate) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          objc_msgSend_setDateLastModified_(v10, v34, v30);
          objc_msgSend_setModified_(self, v44, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v34, v35);

        changedDomains = self->_changedDomains;
        uint64_t v47 = objc_msgSend_numberWithInteger_(NSNumber, v46, a4);
        objc_msgSend_addObject_(changedDomains, v48, (uint64_t)v47);

        goto LABEL_17;
      }
    }
    else
    {
    }
    objc_msgSend_setNote_(v10, v15, v11);
    objc_msgSend_setModified_(self, v25, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setAssetURL:(id)a3 forDomain:(int64_t)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_stateForDomain_(self, v7, a4);
  if (v10)
  {
    objc_msgSend_lock(self, v8, v9);
    uint64_t v11 = (uint64_t)v6;
    uint64_t v14 = objc_msgSend_assetURL(v10, v12, v13);
    if (!(v11 | v14)) {
      goto LABEL_9;
    }
    id v17 = (void *)v14;
    uint64_t v18 = objc_msgSend_assetURL(v10, v15, v16);
    uint64_t v21 = v18;
    if (v11 && v18)
    {
      uint64_t v22 = objc_msgSend_assetURL(v10, v19, v20);
      v25 = objc_msgSend_absoluteString(v22, v23, v24);
      uint64_t v28 = objc_msgSend_absoluteString((void *)v11, v26, v27);
      uint64_t v55 = objc_msgSend_caseInsensitiveCompare_(v25, v29, (uint64_t)v28);

      if (!v55)
      {
LABEL_9:
        objc_msgSend_unlock(self, v15, v16);

        objc_msgSend_lock(self, v31, v32);
        uint64_t v35 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v33, v34);
        uint64_t v38 = objc_msgSend_dateLastModified(v10, v36, v37);
        if (v38 | v35)
        {
          uint64_t v41 = (void *)v38;
          v42 = objc_msgSend_dateLastModified(v10, v39, v40);
          uint64_t v45 = v42;
          if (v42 && v35)
          {
            v46 = objc_msgSend_dateLastModified(v10, v43, v44);
            char isEqualToDate = objc_msgSend_isEqualToDate_(v46, v47, v35);

            if (isEqualToDate) {
              goto LABEL_16;
            }
          }
          else
          {
          }
          objc_msgSend_setDateLastModified_(v10, v39, v35);
          objc_msgSend_setModified_(self, v49, 1);
        }
LABEL_16:
        objc_msgSend_unlock(self, v39, v40);

        changedDomains = self->_changedDomains;
        v52 = objc_msgSend_numberWithInteger_(NSNumber, v51, a4);
        objc_msgSend_addObject_(changedDomains, v53, (uint64_t)v52);

        goto LABEL_17;
      }
    }
    else
    {
    }
    objc_msgSend_setAssetURL_(v10, v15, v11);
    objc_msgSend_setModified_(self, v30, 1);
    goto LABEL_9;
  }
LABEL_17:

  return v10 != 0;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 forDomain:(int64_t)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = objc_msgSend_stateForDomain_(self, v10, a5);
  uint64_t v14 = v11;
  if (v11)
  {
    id v15 = objc_msgSend_info(v11, v12, v13);

    if (v15)
    {
      uint64_t v18 = objc_msgSend_info(v14, v16, v17);
      uint64_t v21 = objc_msgSend_mutableCopy(v18, v19, v20);

      if (v8)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v21, v22, (uint64_t)v8, v9);
      }
      else
      {
        uint64_t v27 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v22, v23);
        objc_msgSend_setObject_forKeyedSubscript_(v21, v28, (uint64_t)v27, v9);
      }
      uint64_t v29 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v21);
      objc_msgSend_setInfo_(v14, v30, (uint64_t)v29);

      goto LABEL_10;
    }
    if (v8)
    {
      id v36 = v9;
      v37[0] = v8;
      uint64_t v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v37, &v36, 1);
      objc_msgSend_setInfo_(v14, v25, (uint64_t)v21);
LABEL_10:

      changedDomains = self->_changedDomains;
      uint64_t v33 = objc_msgSend_numberWithInteger_(NSNumber, v32, a5);
      objc_msgSend_addObject_(changedDomains, v34, (uint64_t)v33);

      BOOL v26 = 1;
      goto LABEL_11;
    }
  }
  BOOL v26 = 0;
LABEL_11:

  return v26;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CLSCollaborationStateChange;
  uint64_t v3 = [(CLSObject *)&v16 description];
  id v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_appendFormat_(v6, v7, @" (targetObjectID: %@)", self->_targetObjectID);
  objc_msgSend_appendFormat_(v6, v8, @" (targetEntityName: %@)", self->_targetEntityName);
  objc_msgSend_appendFormat_(v6, v9, @" (ownerPersonID: %@)", self->_ownerPersonID);
  objc_msgSend_appendFormat_(v6, v10, @" (senderPersonID: %@)", self->_senderPersonID);
  objc_msgSend_appendFormat_(v6, v11, @" (targetClassID: %@)", self->_targetClassID);
  objc_msgSend_appendFormat_(v6, v12, @" (changedDomains: %@)", self->_changedDomains);
  objc_msgSend_appendFormat_(v6, v13, @" (states: %@)", self->_states);
  if (self->_recipientPersonID) {
    objc_msgSend_appendFormat_(v6, v14, @" (recipientPersonID: %@)", self->_recipientPersonID);
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v14.receiver = self;
  v14.super_class = (Class)CLSCollaborationStateChange;
  uint64_t v3 = [(CLSObject *)&v14 dictionaryRepresentation];
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_targetObjectID, @"targetObjectID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_targetEntityName, @"targetEntityName");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_ownerPersonID, @"ownerPersonID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)self->_senderPersonID, @"senderPersonID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)self->_targetClassID, @"targetClassID");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)self->_changedDomains, @"changedDomains");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)self->_states, @"states");
  recipientPersonID = self->_recipientPersonID;
  if (recipientPersonID) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)recipientPersonID, @"recipientPersonID");
  }

  return v3;
}

- (NSString)targetObjectID
{
  return self->_targetObjectID;
}

- (void)setTargetObjectID:(id)a3
{
}

- (NSString)targetEntityName
{
  return self->_targetEntityName;
}

- (void)setTargetEntityName:(id)a3
{
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
}

- (NSString)targetClassID
{
  return self->_targetClassID;
}

- (void)setTargetClassID:(id)a3
{
}

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
}

- (NSSet)changedDomains
{
  return &self->_changedDomains->super;
}

- (void)setChangedDomains:(id)a3
{
}

- (NSString)senderPersonID
{
  return self->_senderPersonID;
}

- (NSSet)deletedDomains
{
  return self->_deletedDomains;
}

- (void)setDeletedDomains:(id)a3
{
}

- (NSArray)states
{
  return &self->_states->super;
}

- (void)setStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDomains, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_changedDomains, 0);
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_senderPersonID, 0);
  objc_storeStrong((id *)&self->_targetClassID, 0);
  objc_storeStrong((id *)&self->_targetEntityName, 0);
  objc_storeStrong((id *)&self->_targetObjectID, 0);

  objc_storeStrong((id *)&self->_ownerPersonID, 0);
}

@end