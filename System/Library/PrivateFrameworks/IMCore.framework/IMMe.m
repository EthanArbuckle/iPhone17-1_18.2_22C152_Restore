@interface IMMe
+ (id)fallbackUserName;
+ (id)firstNameFromFallbackUserName;
+ (id)imHandleForService:(id)a3;
+ (id)lastNameFromFallbackUserName;
+ (id)me;
- (BOOL)addIMHandle:(id)a3;
- (BOOL)addLoginIMHandle:(id)a3;
- (BOOL)isIMHandleLoginIMHandle:(id)a3;
- (BOOL)removeIMHandle:(id)a3;
- (BOOL)removeLoginIMHandle:(id)a3;
- (CNContact)cnContact;
- (IMHandle)bestIMHandle;
- (IMMe)init;
- (NSArray)cnEmails;
- (NSArray)emails;
- (NSArray)imHandles;
- (NSMutableArray)cnIMHandles;
- (NSMutableArray)loginIMHandles;
- (NSString)cnFirstName;
- (NSString)cnFullName;
- (NSString)cnLastName;
- (NSString)cnNickname;
- (NSString)email;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)guid;
- (NSString)lastName;
- (NSString)nickname;
- (id)_imHandlesWithIDs:(id)a3 onAccount:(id)a4;
- (id)description;
- (void)myPictureChanged;
- (void)rebuildIMHandles;
- (void)resetABPerson;
- (void)setCNContact:(id)a3;
- (void)setCnContact:(id)a3;
- (void)setCnEmails:(id)a3;
- (void)setCnFirstName:(id)a3;
- (void)setCnFullName:(id)a3;
- (void)setCnIMHandles:(id)a3;
- (void)setCnLastName:(id)a3;
- (void)setCnNickname:(id)a3;
- (void)setLoginIMHandles:(id)a3;
@end

@implementation IMMe

- (IMMe)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMMe;
  v2 = [(IMMe *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cnIMHandles = v2->_cnIMHandles;
    v2->_cnIMHandles = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    loginIMHandles = v2->_loginIMHandles;
    v2->_loginIMHandles = v5;
  }
  return v2;
}

- (void)setCNContact:(id)a3
{
  v5 = (CNContact *)a3;
  cnContact = self->_cnContact;
  p_cnContact = &self->_cnContact;
  if (cnContact != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)p_cnContact, a3);
    v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend___mainThreadPostNotificationName_object_(v11, v12, @"__kIMMeChangedNotification", 0);

    v5 = v13;
  }
}

+ (id)me
{
  v3 = (void *)qword_1EB3F23B8;
  if (!qword_1EB3F23B8)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1EB3F23B8;
    qword_1EB3F23B8 = (uint64_t)v4;

    if (qword_1EB3F23B8)
    {
      uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v6, v7, v8);
      v12 = objc_msgSend_fetchMeContactWithKeys_(v9, v10, MEMORY[0x1E4F1CBF0], v11);

      objc_msgSend_setCNContact_((void *)qword_1EB3F23B8, v13, (uint64_t)v12, v14);
      v3 = (void *)qword_1EB3F23B8;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (CNContact)cnContact
{
  return self->_cnContact;
}

- (BOOL)addLoginIMHandle:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_loginIMHandles, v5, (uint64_t)v4, v6) & 1) == 0) {
    objc_msgSend_addObject_(self->_loginIMHandles, v7, (uint64_t)v4, v8);
  }

  return 1;
}

- (void)rebuildIMHandles
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cnIMHandles = self->_cnIMHandles;
  self->_cnIMHandles = v3;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7, 0);
  uint64_t v11 = objc_msgSend_activeAccountsForService_(v8, v9, 0, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v11);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v21 = objc_msgSend_login(v20, v14, v15, v16);
        v24 = objc_msgSend_imHandleWithID_(v20, v22, (uint64_t)v21, v23);

        if (v24) {
          objc_msgSend_addObject_(self->_cnIMHandles, v25, (uint64_t)v24, v26);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v17);
  }
}

+ (id)fallbackUserName
{
  return 0;
}

+ (id)firstNameFromFallbackUserName
{
  id v4 = objc_msgSend_fallbackUserName(IMMe, a2, v2, v3);
  uint64_t v7 = objc_msgSend_componentsSeparatedByString_(v4, v5, @" ", v6);
  uint64_t v11 = objc_msgSend___imFirstObject(v7, v8, v9, v10);

  return v11;
}

+ (id)lastNameFromFallbackUserName
{
  id v4 = objc_msgSend_fallbackUserName(IMMe, a2, v2, v3);
  uint64_t v7 = objc_msgSend_componentsSeparatedByString_(v4, v5, @" ", v6);
  uint64_t v11 = objc_msgSend_mutableCopy(v7, v8, v9, v10);

  objc_msgSend_removeFirstObject(v11, v12, v13, v14);
  uint64_t v17 = objc_msgSend_componentsJoinedByString_(v11, v15, @" ", v16);

  return v17;
}

- (NSString)guid
{
  return (NSString *)@"me";
}

- (id)_imHandlesWithIDs:(id)a3 onAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_msgSend_count(v5, v8, v9, v10))
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = objc_msgSend_objectAtIndex_(v5, v11, v13, v12);
      uint64_t v17 = objc_msgSend_imHandleWithID_(v6, v15, (uint64_t)v14, v16);

      if (v17) {
        objc_msgSend_addObject_(v7, v18, (uint64_t)v17, v19);
      }

      ++v13;
    }
    while (v13 < objc_msgSend_count(v5, v20, v21, v22));
  }

  return v7;
}

- (void)resetABPerson
{
  cnFirstName = self->_cnFirstName;
  self->_cnFirstName = 0;

  cnLastName = self->_cnLastName;
  self->_cnLastName = 0;

  cnFullName = self->_cnFullName;
  self->_cnFullName = 0;

  cnEmails = self->_cnEmails;
  self->_cnEmails = 0;

  cnNickname = self->_cnNickname;
  self->_cnNickname = 0;

  objc_msgSend_rebuildIMHandles(self, v8, v9, v10);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v15, v14, @"__kIMMeChangedNotification", 0);
}

- (BOOL)removeLoginIMHandle:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_containsObjectIdenticalTo_(self->_loginIMHandles, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_removeObject_(self->_loginIMHandles, v7, (uint64_t)v4, v8);
    uint64_t v12 = objc_msgSend_sharedInstance(IMHandleRegistrar, v9, v10, v11);
    objc_msgSend_unregisterIMHandle_(v12, v13, (uint64_t)v4, v14);

    uint64_t v18 = objc_msgSend_sharedInstance(IMHandleRegistrar, v15, v16, v17);
    uint64_t v21 = objc_msgSend_cnContactWithKeys_(v4, v19, MEMORY[0x1E4F1CBF0], v20);
    v25 = objc_msgSend_identifier(v21, v22, v23, v24);
    objc_msgSend_removeHandleFromCNIDMap_withCNID_(v18, v26, (uint64_t)v4, (uint64_t)v25);
  }
  return 1;
}

- (NSMutableArray)loginIMHandles
{
  return self->_loginIMHandles;
}

- (BOOL)addIMHandle:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_containsObjectIdenticalTo_(self->_cnIMHandles, v5, (uint64_t)v4, v6) & 1) == 0)
  {
    objc_msgSend_addObject_(self->_cnIMHandles, v7, (uint64_t)v4, v8);
    if ((objc_msgSend_hasLocation(v4, v9, v10, v11) & 1) == 0)
    {
      id v15 = objc_msgSend_dependentIMHandles(v4, v12, v13, v14);
      int v19 = objc_msgSend_count(v15, v16, v17, v18);
      if (v19 >= 1)
      {
        unint64_t v22 = v19 + 1;
        do
        {
          uint64_t v23 = objc_msgSend_objectAtIndex_(v15, v20, (v22 - 2), v21);
          objc_msgSend_addIMHandle_(self, v24, (uint64_t)v23, v25);

          --v22;
        }
        while (v22 > 1);
      }
    }
  }

  return 0;
}

- (BOOL)isIMHandleLoginIMHandle:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = self->_loginIMHandles;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v36, 16);
  id v8 = 0;
  if (v7)
  {
    uint64_t v9 = *(void *)v33;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        id v8 = *(id *)(*((void *)&v32 + 1) + 8 * v10);

        id v15 = objc_msgSend_service(v8, v12, v13, v14, (void)v32);
        int v19 = objc_msgSend_service(v4, v16, v17, v18);

        if (v15 == v19)
        {
          uint64_t v23 = objc_msgSend_ID(v4, v20, v21, v22);
          long long v27 = objc_msgSend_ID(v8, v24, v25, v26);
          char v29 = objc_msgSend_equalID_andID_(v15, v28, (uint64_t)v23, (uint64_t)v27);

          if (v29)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }

        ++v10;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v30, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v7) {
        continue;
      }
      break;
    }
    id v15 = v8;
    id v8 = 0;
LABEL_12:
  }
  return v7;
}

- (BOOL)removeIMHandle:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_containsObjectIdenticalTo_(self->_cnIMHandles, v5, (uint64_t)v4, v6))
  {
    objc_msgSend_removeObject_(self->_cnIMHandles, v7, (uint64_t)v4, v8);
    if ((objc_msgSend_hasLocation(v4, v9, v10, v11) & 1) == 0)
    {
      id v15 = objc_msgSend_dependentIMHandles(v4, v12, v13, v14);
      int v19 = objc_msgSend_count(v15, v16, v17, v18);
      if (v19 >= 1)
      {
        unint64_t v22 = v19 + 1;
        do
        {
          uint64_t v23 = objc_msgSend_objectAtIndex_(v15, v20, (v22 - 2), v21);
          objc_msgSend_removeIMHandle_(self, v24, (uint64_t)v23, v25);

          --v22;
        }
        while (v22 > 1);
      }
    }
  }

  return 0;
}

- (NSString)nickname
{
  id v5 = objc_msgSend_cnContact(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6E6D8];
    uint64_t v10 = objc_msgSend_cnContact(self, v6, v7, v8);
    objc_msgSend_nickNameForCNContact_(v9, v11, (uint64_t)v10, v12);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnNickname = self->_cnNickname;
    self->_cnNickname = v13;
  }
  if (!objc_msgSend_length(self->_cnNickname, v6, v7, v8))
  {
    objc_msgSend_firstName(self, v15, v16, v17);
    uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v19 = self->_cnNickname;
    self->_cnNickname = v18;
  }
  uint64_t v20 = self->_cnNickname;

  return v20;
}

- (NSString)firstName
{
  id v5 = objc_msgSend_cnContact(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6E6D8];
    uint64_t v10 = objc_msgSend_cnContact(self, v6, v7, v8);
    objc_msgSend_firstNameForCNContact_(v9, v11, (uint64_t)v10, v12);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnFirstName = self->_cnFirstName;
    self->_cnFirstName = v13;
  }
  id v15 = self->_cnFirstName;
  if (v15)
  {
    uint64_t v16 = v15;
  }
  else
  {
    objc_msgSend_firstNameFromFallbackUserName(IMMe, v6, v7, v8);
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (NSArray)emails
{
  if (!self->_cnEmails)
  {
    id v5 = objc_msgSend_cnContact(self, a2, v2, v3);

    if (v5)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F6E6D8];
      uint64_t v10 = objc_msgSend_cnContact(self, v6, v7, v8);
      objc_msgSend_emailsForCNContact_(v9, v11, (uint64_t)v10, v12);
      uint64_t v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      cnEmails = self->_cnEmails;
      self->_cnEmails = v13;
    }
  }
  id v15 = self->_cnEmails;

  return v15;
}

- (NSString)email
{
  id v4 = objc_msgSend_emails(self, a2, v2, v3);
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend___imFirstObject(v4, v8, v9, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return (NSString *)v11;
}

- (NSString)lastName
{
  id v5 = objc_msgSend_cnContact(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6E6D8];
    uint64_t v10 = objc_msgSend_cnContact(self, v6, v7, v8);
    objc_msgSend_lastNameForCNContact_(v9, v11, (uint64_t)v10, v12);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnLastName = self->_cnLastName;
    self->_cnLastName = v13;
  }
  id v15 = self->_cnLastName;
  if (!v15)
  {
    objc_msgSend_lastNameFromFallbackUserName(IMMe, v6, v7, v8);
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self->_cnLastName;
    self->_cnLastName = v16;

    id v15 = self->_cnLastName;
  }

  return v15;
}

- (NSString)fullName
{
  id v5 = objc_msgSend_cnContact(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6E6D8];
    uint64_t v10 = objc_msgSend_cnContact(self, v6, v7, v8);
    objc_msgSend_fullNameForCNContact_(v9, v11, (uint64_t)v10, v12);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    cnFullName = self->_cnFullName;
    self->_cnFullName = v13;
  }
  id v15 = self->_cnFullName;
  if (!v15)
  {
    objc_msgSend_fallbackUserName(IMMe, v6, v7, v8);
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = self->_cnFullName;
    self->_cnFullName = v16;

    id v15 = self->_cnFullName;
  }
  if (objc_msgSend_length(v15, v6, v7, v8))
  {
    uint64_t v21 = self->_cnFullName;
  }
  else
  {
    objc_msgSend_fallbackUserName(IMMe, v18, v19, v20);
    uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (id)imHandleForService:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = objc_msgSend_me(IMMe, v4, v5, v6, 0);
  uint64_t v11 = objc_msgSend_imHandles(v7, v8, v9, v10);

  id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend_service(v19, v13, v14, v15);
        id v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 == v3)
        {
          id v16 = v19;
          goto LABEL_11;
        }
      }
      id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v16;
}

- (IMHandle)bestIMHandle
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMAccountController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_bestConnectedAccountForService_(v5, v6, 0, v7);

  if (v8
    || (objc_msgSend_sharedInstance(IMAccountController, v9, v10, v11),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_bestActiveAccountForService_(v12, v13, 0, v14),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v12,
        v8))
  {
    uint64_t v15 = objc_msgSend_login(v8, v9, v10, v11);
    uint64_t v18 = objc_msgSend_imHandleWithID_(v8, v16, (uint64_t)v15, v17);
  }
  else
  {
    uint64_t v8 = objc_msgSend_imHandles(self, v9, v10, v11);
    uint64_t v18 = objc_msgSend_bestIMHandleInArray_(IMHandle, v20, (uint64_t)v8, v21);
  }

  return (IMHandle *)v18;
}

- (NSArray)imHandles
{
  return (NSArray *)objc_msgSend_arrayByAddingObjectsFromArray_(self->_cnIMHandles, a2, (uint64_t)self->_loginIMHandles, v2);
}

- (void)myPictureChanged
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v6, @"__kIMHandlePictureChangedNotification", 0);

  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v11, v10, @"__kIMMePictureChangedNotification", (uint64_t)self);
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v9 = objc_msgSend_cnContact(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v3, v10, @"<%@> (CNContact: %@)", v11, v5, v9);

  return v12;
}

- (void)setCnContact:(id)a3
{
}

- (NSString)cnNickname
{
  return self->_cnNickname;
}

- (void)setCnNickname:(id)a3
{
}

- (NSString)cnFirstName
{
  return self->_cnFirstName;
}

- (void)setCnFirstName:(id)a3
{
}

- (NSString)cnFullName
{
  return self->_cnFullName;
}

- (void)setCnFullName:(id)a3
{
}

- (NSString)cnLastName
{
  return self->_cnLastName;
}

- (void)setCnLastName:(id)a3
{
}

- (NSArray)cnEmails
{
  return self->_cnEmails;
}

- (void)setCnEmails:(id)a3
{
}

- (NSMutableArray)cnIMHandles
{
  return self->_cnIMHandles;
}

- (void)setCnIMHandles:(id)a3
{
}

- (void)setLoginIMHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginIMHandles, 0);
  objc_storeStrong((id *)&self->_cnIMHandles, 0);
  objc_storeStrong((id *)&self->_cnEmails, 0);
  objc_storeStrong((id *)&self->_cnLastName, 0);
  objc_storeStrong((id *)&self->_cnFullName, 0);
  objc_storeStrong((id *)&self->_cnFirstName, 0);
  objc_storeStrong((id *)&self->_cnNickname, 0);

  objc_storeStrong((id *)&self->_cnContact, 0);
}

@end