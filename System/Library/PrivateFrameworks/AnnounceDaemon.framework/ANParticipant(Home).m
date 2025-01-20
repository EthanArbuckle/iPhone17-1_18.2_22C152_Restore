@interface ANParticipant(Home)
+ (id)participantsFromUsersInHome:()Home;
- (id)initWithAccessory:()Home;
- (id)initWithUser:()Home;
- (id)initWithUser:()Home andAccessory:;
- (uint64_t)populateWithAccessory:()Home;
- (void)populateWithUser:()Home;
- (void)populateWithUser:()Home andAccessory:;
@end

@implementation ANParticipant(Home)

- (id)initWithAccessory:()Home
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F34BA4B0;
  id v5 = objc_msgSendSuper2(&v8, sel_init);
  id v6 = v5;
  if (v5) {
    [v5 populateWithAccessory:v4];
  }

  return v6;
}

- (id)initWithUser:()Home
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F34BA4B0;
  id v5 = objc_msgSendSuper2(&v8, sel_init);
  id v6 = v5;
  if (v5) {
    [v5 populateWithUser:v4];
  }

  return v6;
}

- (id)initWithUser:()Home andAccessory:
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1F34BA4B0;
  id v8 = objc_msgSendSuper2(&v11, sel_init);
  id v9 = v8;
  if (v8) {
    [v8 populateWithUser:v6 andAccessory:v7];
  }

  return v9;
}

- (uint64_t)populateWithAccessory:()Home
{
  if (a3)
  {
    v3 = (void *)result;
    id v4 = a3;
    [v3 setIsAccessory:1];
    id v5 = [v4 uniqueIdentifier];
    id v6 = [v5 UUIDString];
    [v3 setHomeKitID:v6];

    id v7 = [v4 name];
    [v3 setName:v7];

    uint64_t v8 = objc_msgSend(v4, "hmu_isEndpoint");
    return [v3 setIsEndpoint:v8];
  }
  return result;
}

- (void)populateWithUser:()Home
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 name];
    [a1 setName:v5];

    id v6 = [v4 uniqueIdentifier];
    id v7 = [v6 UUIDString];
    [a1 setHomeKitID:v7];

    uint64_t v8 = [v4 uniqueIdentifier];
    id v9 = [v8 UUIDString];
    [a1 setHomeKitUserID:v9];

    v10 = [v4 userIDSURI];
    objc_super v11 = [v10 prefixedURI];
    [a1 setIdsID:v11];

    id v12 = [v4 userID];

    [a1 setUserID:v12];
  }
}

- (void)populateWithUser:()Home andAccessory:
{
  id v12 = a3;
  [a1 populateWithAccessory:a4];
  if (v12)
  {
    id v6 = [v12 name];
    [a1 setName:v6];

    id v7 = [v12 uniqueIdentifier];
    uint64_t v8 = [v7 UUIDString];
    [a1 setHomeKitUserID:v8];

    id v9 = [v12 userIDSURI];
    v10 = [v9 prefixedURI];
    [a1 setIdsID:v10];

    objc_super v11 = [v12 userID];
    [a1 setUserID:v11];
  }
}

+ (id)participantsFromUsersInHome:()Home
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = +[ANHomeManager shared];
  id v6 = [v5 currentAccessory];

  if (v6) {
    objc_msgSend(v3, "hmu_allUsersIncludingCurrentUser");
  }
  else {
    objc_msgSend(v3, "hmu_users");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "announceAccessAllowedForUser:", v12, (void)v15))
        {
          v13 = (void *)[objc_alloc(MEMORY[0x1E4F4A910]) initWithUser:v12];
          [v4 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v4;
}

@end