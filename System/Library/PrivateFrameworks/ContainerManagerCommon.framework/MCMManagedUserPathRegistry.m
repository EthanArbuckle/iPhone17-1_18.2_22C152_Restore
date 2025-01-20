@interface MCMManagedUserPathRegistry
- (MCMManagedPath)containermanagerUserCaches;
- (MCMManagedPath)containermanagerUserDeathrow;
- (MCMManagedPath)containermanagerUserDeleteOperations;
- (MCMManagedPath)containermanagerUserLibrary;
- (MCMManagedPath)containermanagerUserPendingUpdates;
- (MCMManagedPath)containermanagerUserReplaceOperations;
- (MCMManagedPath)userCaches;
- (MCMManagedPath)userHome;
- (MCMManagedPath)userLibrary;
- (MCMManagedUserPathRegistry)initWithUserIdentity:(id)a3 daemonUser:(id)a4;
- (MCMUserIdentity)userIdentity;
- (void)_initPathPropertiesWithUserIdentity:(id)a3;
@end

@implementation MCMManagedUserPathRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containermanagerUserDeleteOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerUserReplaceOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerUserPendingUpdates, 0);
  objc_storeStrong((id *)&self->_containermanagerUserLibrary, 0);
  objc_storeStrong((id *)&self->_containermanagerUserDeathrow, 0);
  objc_storeStrong((id *)&self->_containermanagerUserCaches, 0);
  objc_storeStrong((id *)&self->_userCaches, 0);
  objc_storeStrong((id *)&self->_userLibrary, 0);
  objc_storeStrong((id *)&self->_userHome, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (MCMManagedPath)containermanagerUserDeleteOperations
{
  return self->_containermanagerUserDeleteOperations;
}

- (MCMManagedPath)containermanagerUserReplaceOperations
{
  return self->_containermanagerUserReplaceOperations;
}

- (MCMManagedPath)containermanagerUserPendingUpdates
{
  return self->_containermanagerUserPendingUpdates;
}

- (MCMManagedPath)containermanagerUserLibrary
{
  return self->_containermanagerUserLibrary;
}

- (MCMManagedPath)containermanagerUserDeathrow
{
  return self->_containermanagerUserDeathrow;
}

- (MCMManagedPath)containermanagerUserCaches
{
  return self->_containermanagerUserCaches;
}

- (MCMManagedPath)userCaches
{
  return self->_userCaches;
}

- (MCMManagedPath)userLibrary
{
  return self->_userLibrary;
}

- (MCMManagedPath)userHome
{
  return self->_userHome;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)_initPathPropertiesWithUserIdentity:(id)a3
{
  id v4 = a3;
  id v30 = [v4 homeDirectoryURL];
  v5 = [v4 posixUser];
  v6 = [[MCMManagedPath alloc] initWithURL:v30 flags:0 ACLConfig:0 mode:493 dpClass:0xFFFFFFFFLL owner:v5 parent:0];
  userHome = self->_userHome;
  self->_userHome = v6;

  v8 = [(MCMManagedPath *)self->_userHome managedPathByAppendingPathComponent:@"Library" flags:2 ACLConfig:2 mode:493 dpClass:0xFFFFFFFFLL owner:v5];
  userLibrary = self->_userLibrary;
  self->_userLibrary = v8;

  if ([v4 isDataSeparated]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = [(MCMManagedPath *)self->_userLibrary managedPathByAppendingPathComponent:@"Caches" flags:v10 ACLConfig:2 mode:493 dpClass:0xFFFFFFFFLL owner:v5];
  userCaches = self->_userCaches;
  self->_userCaches = v11;

  v13 = [(MCMManagedPath *)self->_userCaches managedPathByAppendingPathComponent:@"com.apple.containermanagerd" flags:3 ACLConfig:1 mode:493 dpClass:4 owner:v5];
  containermanagerUserCaches = self->_containermanagerUserCaches;
  self->_containermanagerUserCaches = v13;

  v15 = [(MCMManagedPath *)self->_containermanagerUserCaches managedPathByAppendingPathComponent:@"Dead" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v5];
  containermanagerUserDeathrow = self->_containermanagerUserDeathrow;
  self->_containermanagerUserDeathrow = v15;

  containermanagerUserLibrary = self->_containermanagerUserLibrary;
  self->_containermanagerUserLibrary = 0;

  containermanagerUserPendingUpdates = self->_containermanagerUserPendingUpdates;
  self->_containermanagerUserPendingUpdates = 0;

  containermanagerUserReplaceOperations = self->_containermanagerUserReplaceOperations;
  self->_containermanagerUserReplaceOperations = 0;

  containermanagerUserDeleteOperations = self->_containermanagerUserDeleteOperations;
  self->_containermanagerUserDeleteOperations = 0;

  char v21 = [v4 isDataSeparated];
  if ((v21 & 1) == 0)
  {
    v22 = [(MCMManagedPath *)self->_userLibrary managedPathByAppendingPathComponent:@"MobileContainerManager" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v5];
    v23 = self->_containermanagerUserLibrary;
    self->_containermanagerUserLibrary = v22;

    v24 = [(MCMManagedPath *)self->_containermanagerUserLibrary managedPathByAppendingPathComponent:@"PendingUpdates" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v5];
    v25 = self->_containermanagerUserPendingUpdates;
    self->_containermanagerUserPendingUpdates = v24;

    v26 = [(MCMManagedPath *)self->_containermanagerUserLibrary managedPathByAppendingPathComponent:@"Replace" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v5];
    v27 = self->_containermanagerUserReplaceOperations;
    self->_containermanagerUserReplaceOperations = v26;

    v28 = [(MCMManagedPath *)self->_containermanagerUserLibrary managedPathByAppendingPathComponent:@"Delete" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v5];
    v29 = self->_containermanagerUserDeleteOperations;
    self->_containermanagerUserDeleteOperations = v28;
  }
}

- (MCMManagedUserPathRegistry)initWithUserIdentity:(id)a3 daemonUser:(id)a4
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MCMManagedUserPathRegistry;
  v8 = [(MCMManagedPathRegistry *)&v16 initWithDaemonUser:a4 privileged:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userIdentity, a3);
    [(MCMManagedUserPathRegistry *)v9 _initPathPropertiesWithUserIdentity:v7];
    v18[0] = v9->_userHome;
    v18[1] = v9->_userLibrary;
    v18[2] = v9->_userCaches;
    v18[3] = v9->_containermanagerUserCaches;
    v18[4] = v9->_containermanagerUserDeathrow;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    [(MCMManagedPathRegistry *)v9 _addPaths:v10];

    if (v9->_containermanagerUserLibrary)
    {
      containermanagerUserPendingUpdates = v9->_containermanagerUserPendingUpdates;
      if (containermanagerUserPendingUpdates)
      {
        containermanagerUserReplaceOperations = v9->_containermanagerUserReplaceOperations;
        if (containermanagerUserReplaceOperations)
        {
          containermanagerUserDeleteOperations = v9->_containermanagerUserDeleteOperations;
          if (containermanagerUserDeleteOperations)
          {
            v17[0] = v9->_containermanagerUserLibrary;
            v17[1] = containermanagerUserPendingUpdates;
            v17[2] = containermanagerUserReplaceOperations;
            v17[3] = containermanagerUserDeleteOperations;
            v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
            [(MCMManagedPathRegistry *)v9 _addPaths:v14];
          }
        }
      }
    }
  }

  return v9;
}

@end