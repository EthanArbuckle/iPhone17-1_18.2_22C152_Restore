@interface IDSFamilyService
- (BOOL)isValidDestination:(id)a3 error:(id *)a4;
- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8;
- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (NSDictionary)dsidToDeviceList;
- (NSDictionary)dsidToFamilyMember;
- (NSSet)familyMembers;
- (id)familyHandles;
- (void)fetchFamilyMembersWithDevices:(id)a3;
- (void)service:(id)a3 familyInfoUpdated:(id)a4;
- (void)setDsidToDeviceList:(id)a3;
- (void)setDsidToFamilyMember:(id)a3;
- (void)setFamilyMembers:(id)a3;
@end

@implementation IDSFamilyService

- (BOOL)isValidDestination:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(IDSFamilyService *)self familyHandles];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v26 = a4;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v15 = [(IDSFamilyService *)self familyHandles];
          v16 = [v14 _stripFZIDPrefix];
          char v17 = [v15 containsObject:v16];

          if ((v17 & 1) == 0)
          {
            v19 = +[IDSLogging IDSService];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = [v14 _stripFZIDPrefix];
              *(_DWORD *)buf = 138412290;
              v34 = v20;
              _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_DEFAULT, "Handle: %@ is not in family.", buf, 0xCu);
            }
            if (v26)
            {
              uint64_t v31 = *MEMORY[0x1E4F28568];
              v32 = @"Could not send to non family member.";
              v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
              id *v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:50 userInfo:v21];
            }
            BOOL v18 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        BOOL v18 = 1;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    v22 = +[IDSLogging IDSService];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19190B000, v22, OS_LOG_TYPE_DEFAULT, "There are currently no family handles on service. Failing message, will try to fetch members.", buf, 2u);
    }

    v23 = +[IDSDaemonController sharedInstance];
    [v23 blockUntilConnected];

    v24 = +[IDSDaemonController sharedInstance];
    [v24 tryForceFamilyFetch];

    if (!a4)
    {
      BOOL v18 = 0;
      goto LABEL_22;
    }
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37[0] = @"Family handles not loaded on service.";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.identityservices.error" code:52 userInfo:v9];
    BOOL v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

LABEL_22:
  return v18;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if ([(IDSFamilyService *)self isValidDestination:v15 error:a8])
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    BOOL v17 = [(IDSService *)&v19 sendMessage:v14 toDestinations:v15 priority:a5 options:v16 identifier:a7 error:a8];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if ([(IDSFamilyService *)self isValidDestination:v15 error:a8])
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    BOOL v17 = [(IDSService *)&v19 sendData:v14 toDestinations:v15 priority:a5 options:v16 identifier:a7 error:a8];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if ([(IDSFamilyService *)self isValidDestination:v17 error:a9])
  {
    v21.receiver = self;
    v21.super_class = (Class)IDSFamilyService;
    BOOL v19 = [(IDSService *)&v21 sendResourceAtURL:v15 metadata:v16 toDestinations:v17 priority:a6 options:v18 identifier:a8 error:a9];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  if ([(IDSFamilyService *)self isValidDestination:v15 error:a8])
  {
    v19.receiver = self;
    v19.super_class = (Class)IDSFamilyService;
    BOOL v17 = [(IDSService *)&v19 sendProtobuf:v14 toDestinations:v15 priority:a5 options:v16 identifier:a7 error:a8];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)familyHandles
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  v4 = [(IDSService *)self accounts];
  v5 = [v4 anyObject];
  id v6 = [v5 serviceName];

  v7 = +[IDSDaemonController sharedInstance];
  uint64_t v8 = [v7 listener];
  id v9 = [v8 familyInfoForService:v6];

  uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F6AEF0]];
  familyHandles = self->familyHandles;
  self->familyHandles = v10;

  uint64_t v12 = self->familyHandles;
  return v12;
}

- (void)fetchFamilyMembersWithDevices:(id)a3
{
  id v4 = a3;
  v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  if (!self->listenerID)
  {
    id v6 = [NSString stringGUID];
    listenerID = self->listenerID;
    self->listenerID = v6;
  }
  uint64_t v8 = [(IDSService *)self accounts];
  id v9 = [v8 anyObject];
  id v12 = [v9 serviceName];

  uint64_t v10 = +[IDSDaemonController sharedInstance];
  uint64_t v11 = [v10 listener];
  [v11 familyDevicesForService:v12 listenerID:self->listenerID withCompletion:v4];
}

- (NSDictionary)dsidToFamilyMember
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  id v4 = [(IDSService *)self accounts];
  v5 = [v4 anyObject];
  uint64_t v6 = [v5 serviceName];

  v7 = +[IDSDaemonController sharedInstance];
  uint64_t v8 = [v7 listener];
  v22 = (void *)v6;
  id v9 = [v8 familyInfoForService:v6];

  uint64_t v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = [v9 objectForKey:*MEMORY[0x1E4F6AF10]];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6B458]) initWithDictionary:*(void *)(*((void *)&v23 + 1) + 8 * v15)];
        BOOL v17 = [v16 DSID];
        [(NSDictionary *)v10 setObject:v16 forKey:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  dsidToFamilyMember = self->_dsidToFamilyMember;
  self->_dsidToFamilyMember = v10;
  objc_super v19 = v10;

  v20 = self->_dsidToFamilyMember;
  return v20;
}

- (NSSet)familyMembers
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  id v4 = [(IDSService *)self accounts];
  v5 = [v4 anyObject];
  uint64_t v6 = [v5 serviceName];

  v7 = +[IDSDaemonController sharedInstance];
  uint64_t v8 = [v7 listener];
  id v9 = [v8 familyInfoForService:v6];

  uint64_t v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E4F6AF10], 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6B458]) initWithDictionary:*(void *)(*((void *)&v21 + 1) + 8 * v15)];
        [(NSSet *)v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  familyMembers = self->_familyMembers;
  self->_familyMembers = v10;
  id v18 = v10;

  objc_super v19 = self->_familyMembers;
  return v19;
}

- (void)service:(id)a3 familyInfoUpdated:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IDSService *)self accounts];
  id v9 = [v8 anyObject];
  uint64_t v10 = [v9 serviceName];
  int v11 = [v6 isEqualToString:v10];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F6C3B8] accountEnabled];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "Service received %@ familyInfoUpdated", buf, 0xCu);
    }

    uint64_t v13 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F6AF10], 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_super v19 = (void *)[objc_alloc(MEMORY[0x1E4F6B458]) initWithDictionary:*(void *)(*((void *)&v24 + 1) + 8 * v18)];
          [(NSSet *)v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    familyMembers = self->_familyMembers;
    self->_familyMembers = v13;
    long long v21 = v13;

    long long v22 = [v7 objectForKey:*MEMORY[0x1E4F6AEF0]];
    familyHandles = self->familyHandles;
    self->familyHandles = v22;
  }
}

- (void)setFamilyMembers:(id)a3
{
}

- (void)setDsidToFamilyMember:(id)a3
{
}

- (NSDictionary)dsidToDeviceList
{
  return self->_dsidToDeviceList;
}

- (void)setDsidToDeviceList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsidToDeviceList, 0);
  objc_storeStrong((id *)&self->_dsidToFamilyMember, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->listenerID, 0);

  objc_storeStrong((id *)&self->familyHandles, 0);
}

@end