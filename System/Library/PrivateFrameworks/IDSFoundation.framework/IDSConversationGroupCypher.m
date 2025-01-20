@interface IDSConversationGroupCypher
+ (BOOL)supportsSecureCoding;
- (IDSConversationGroupCypher)initWithCoder:(id)a3;
- (IDSConversationGroupCypher)initWithConversationGroup:(id)a3 deviceIdentity:(id)a4 participants:(id)a5;
- (IDSDeviceIdentity)deviceIdentity;
- (IDSMPConversationGroup)conversationGroup;
- (NSArray)participants;
- (NSString)identifier;
- (id)_memberList;
- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationGroup:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation IDSConversationGroupCypher

- (NSString)identifier
{
  return (NSString *)@"engram";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSConversationGroupCypher)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"IDSConversationGroupCypherGroupData");
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v14 = objc_msgSend_setWithObjects_(v9, v12, v10, v13, v11, 0);
  v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, v16, @"IDSConversationGroupCypherGroupParticipants");

  uint64_t v18 = objc_opt_class();
  v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, v20, @"IDSConversationGroupCypherGroupDeviceIdentity");

  v24 = objc_msgSend_conversationGroupWithPrivateDataRepresentation_(IDSMPConversationGroup, v22, (uint64_t)v8, v23);
  v27 = (IDSConversationGroupCypher *)objc_msgSend_initWithConversationGroup_deviceIdentity_participants_(self, v25, (uint64_t)v24, v26, v21, v17);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_conversationGroup(self, v5, v6, v7);
  id v35 = 0;
  uint64_t v11 = objc_msgSend_privateDataRepresentationWithError_(v8, v9, (uint64_t)&v35, v10);
  id v12 = v35;

  if (v11)
  {
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v11, v15, @"IDSConversationGroupCypherGroupData");
    v19 = objc_msgSend_participants(self, v16, v17, v18);
    objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, v21, @"IDSConversationGroupCypherGroupParticipants");

    uint64_t v25 = objc_msgSend_deviceIdentity(self, v22, v23, v24);
    objc_msgSend_encodeObject_forKey_(v4, v26, v25, v27, @"IDSConversationGroupCypherGroupDeviceIdentity");

    id v4 = (id)v25;
  }
  else
  {
    v28 = objc_msgSend_accountIdentity(IDSFoundationLog, v13, v14, v15);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend_conversationGroup(self, v29, v30, v31);
      *(_DWORD *)buf = 138543619;
      id v37 = v12;
      __int16 v38 = 2113;
      v39 = v32;
      _os_log_impl(&dword_19D9BE000, v28, OS_LOG_TYPE_DEFAULT, "Failed group.encodeWithCoder -- Could not create privateDataRepresentation {error: %{public}@, group: %{private}@}", buf, 0x16u);
    }
    objc_msgSend_failWithError_(v4, v33, (uint64_t)v12, v34);
  }
}

- (IDSConversationGroupCypher)initWithConversationGroup:(id)a3 deviceIdentity:(id)a4 participants:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSConversationGroupCypher;
  id v12 = [(IDSConversationGroupCypher *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversationGroup, a3);
    objc_storeStrong((id *)&v13->_deviceIdentity, a4);
    objc_storeStrong((id *)&v13->_participants, a5);
  }

  return v13;
}

- (id)cypherData:(id)a3 withAccountIdentity:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_accountIdentity(IDSFoundationLog, v11, v12, v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v45 = 0;
    _os_log_impl(&dword_19D9BE000, v14, OS_LOG_TYPE_INFO, "ConversationGroupCypher cypher data", v45, 2u);
  }

  double v18 = objc_msgSend_accountKey(v10, v15, v16, v17);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v23 = objc_msgSend_accountKey(v10, v20, v21, v22);
    double v27 = objc_msgSend__memberList(self, v24, v25, v26);
    double v31 = objc_msgSend_conversationGroup(self, v28, v29, v30);
    id v35 = objc_msgSend_signingIdentity(v23, v32, v33, v34);
    __int16 v38 = objc_msgSend_signAndProtectData_senderSigningIdentity_members_error_(v31, v36, (uint64_t)v9, v37, v35, v27, a6);
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v20, v21, v22);
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_FAULT)) {
      sub_19DB7F294(v10, v39, v40, v41);
    }

    if (a6)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v42, @"IDSConversationGroupCypherErroDomain", v43, -2000, 0);
      __int16 v38 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v38 = 0;
    }
  }

  return v38;
}

- (id)decypherData:(id)a3 withAccountIdentity:(id)a4 signingDevicePublicKey:(id)a5 identifier:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    uint64_t v21 = objc_msgSend_accountIdentity(IDSFoundationLog, v18, v19, v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_19D9BE000, v21, OS_LOG_TYPE_INFO, "ConversationGroupCypher decypher data", v58, 2u);
    }

    uint64_t v25 = objc_msgSend_accountIdentity(v17, v22, v23, v24);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v30 = objc_msgSend__memberList(self, v27, v28, v29);
      double v34 = objc_msgSend_conversationGroup(self, v31, v32, v33);
      __int16 v38 = objc_msgSend_accountIdentity(v17, v35, v36, v37);
      v42 = objc_msgSend_signingIdentity(v38, v39, v40, v41);
      v45 = objc_msgSend_verifyAndExposeData_senderSigningIdentity_members_error_(v34, v43, (uint64_t)v11, v44, v42, v30, a7);
    }
    else
    {
      objc_msgSend_accountIdentity(IDSFoundationLog, v27, v28, v29);
      v52 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_FAULT)) {
        sub_19DB7F294(v12, v52, v53, v54);
      }

      if (a7)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v55, @"IDSConversationGroupCypherErroDomain", v56, -2000, 0);
        v45 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
    }
    id v51 = v45;
  }
  else
  {
    objc_msgSend_accountIdentity(IDSFoundationLog, v14, v15, v16);
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_FAULT)) {
      sub_19DB7F294(v12, v46, v47, v48);
    }

    if (a7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v49, @"IDSConversationGroupCypherErroDomain", v50, -2000, 0);
      id v51 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v51 = 0;
    }
  }

  return v51;
}

- (id)_memberList
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  objc_msgSend_participants(self, v4, v5, 0.0);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v45, v7, v50, 16);
  if (v40)
  {
    uint64_t v39 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v12 = objc_msgSend_devices(v11, v8, v9, 0.0);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v14, v49, 16);
        if (v15)
        {
          uint64_t v19 = v15;
          uint64_t v20 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v42 != v20) {
                objc_enumerationMutation(v12);
              }
              double v22 = *(void **)(*((void *)&v41 + 1) + 8 * j);
              uint64_t v23 = objc_msgSend_devicePublicKey(v22, v16, v17, v18);
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                uint64_t v25 = objc_msgSend_devicePublicKey(v22, v16, v17, v18);
                double v29 = objc_msgSend_modernIdentity(v25, v26, v27, v28);

                if (v29)
                {
                  double v33 = objc_msgSend_modernIdentity(v25, v30, v31, v32);
                  objc_msgSend_addObject_(v3, v34, (uint64_t)v33, v35);
                }
              }
            }
            uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v41, v18, v49, 16);
          }
          while (v19);
        }
      }
      uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v45, v36, v50, 16);
    }
    while (v40);
  }

  return v3;
}

- (IDSMPConversationGroup)conversationGroup
{
  return self->_conversationGroup;
}

- (void)setConversationGroup:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (IDSDeviceIdentity)deviceIdentity
{
  return self->_deviceIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentity, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_conversationGroup, 0);
}

@end