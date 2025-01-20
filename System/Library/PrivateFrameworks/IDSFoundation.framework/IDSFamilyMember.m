@interface IDSFamilyMember
- (IDSFamilyMember)initWithDictionary:(id)a3;
- (IDSFamilyMember)initWithiCloudID:(id)a3 appleID:(id)a4 handles:(id)a5 devices:(id)a6;
- (NSArray)devices;
- (NSNumber)DSID;
- (NSSet)handles;
- (NSString)appleID;
- (id)dictionaryRepresentation;
- (int64_t)relationship;
@end

@implementation IDSFamilyMember

- (IDSFamilyMember)initWithiCloudID:(id)a3 appleID:(id)a4 handles:(id)a5 devices:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSFamilyMember;
  v15 = [(IDSFamilyMember *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_DSID, a3);
    objc_storeStrong((id *)&v16->_appleID, a4);
    objc_storeStrong((id *)&v16->_handles, a5);
    objc_storeStrong((id *)&v16->_devices, a6);
  }

  return v16;
}

- (IDSFamilyMember)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)IDSFamilyMember;
  v6 = [(IDSFamilyMember *)&v50 init];
  if (v6)
  {
    uint64_t v8 = objc_msgSend_objectForKey_(v4, v5, @"MemberDSID", v7);
    DSID = v6->_DSID;
    v6->_DSID = (NSNumber *)v8;

    uint64_t v12 = objc_msgSend_objectForKey_(v4, v10, @"MemberHandles", v11);
    handles = v6->_handles;
    v6->_handles = (NSSet *)v12;

    v16 = objc_msgSend_objectForKey_(v4, v14, @"MemberRelationship", v15);
    v6->_relationship = objc_msgSend_integerValue(v16, v17, v18, v19);

    uint64_t v22 = objc_msgSend_objectForKey_(v4, v20, @"AppleIDKey", v21);
    appleID = v6->_appleID;
    v6->_appleID = (NSString *)v22;

    v26 = objc_msgSend_objectForKey_(v4, v24, @"MemberDevices", v25);
    v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v28 = v26;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v46, v30, v51, 16);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v28);
          }
          uint64_t v35 = *(void *)(*((void *)&v46 + 1) + 8 * v34);
          v36 = [IDSFamilyDevice alloc];
          v39 = objc_msgSend_initWithDictionary_(v36, v37, v35, v38, (void)v46);
          objc_msgSend_addObject_(v27, v40, (uint64_t)v39, v41);

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v42, (uint64_t)&v46, v43, v51, 16);
      }
      while (v32);
    }

    devices = v6->_devices;
    v6->_devices = v27;
  }
  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend_setObject_forKey_(v3, v4, (uint64_t)self->_DSID, v5, @"MemberDSID");
  v9 = objc_msgSend_allObjects(self->_handles, v6, v7, v8);
  objc_msgSend_setObject_forKey_(v3, v10, (uint64_t)v9, v11, @"MemberHandles");

  id v14 = objc_msgSend_numberWithInteger_(NSNumber, v12, self->_relationship, v13);
  objc_msgSend_setObject_forKey_(v3, v15, (uint64_t)v14, v16, @"MemberRelationship");

  objc_msgSend_setObject_forKey_(v3, v17, (uint64_t)self->_appleID, v18, @"AppleIDKey");
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v20 = self->_devices;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v36, v22, v40, 16);
  if (v23)
  {
    uint64_t v27 = v23;
    uint64_t v28 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v20);
        }
        double v30 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v36 + 1) + 8 * i), v24, v25, v26, (void)v36);
        objc_msgSend_addObject_(v19, v31, (uint64_t)v30, v32);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v24, (uint64_t)&v36, v26, v40, 16);
    }
    while (v27);
  }

  objc_msgSend_setObject_forKey_(v3, v33, (uint64_t)v19, v34, @"MemberDevices");
  return v3;
}

- (int64_t)relationship
{
  return self->_relationship;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSSet)handles
{
  return self->_handles;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

@end