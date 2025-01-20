@interface _MKFHomePerson
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFHomePersonDatabaseID)databaseID;
- (id)createHMPerson;
- (id)photosPersonForPersonLink:(id)a3;
- (void)updateWithHMPerson:(id)a3;
@end

@implementation _MKFHomePerson

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E555160;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_155011 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_155011, &__block_literal_global_155012);
  }
  v2 = (void *)homeRelation__hmf_once_v1_155013;
  return (NSPredicate *)v2;
}

- (MKFHomePersonDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFHomePersonDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)photosPersonForPersonLink:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(_MKFHomePerson *)self home];
  v6 = [v5 users];

  v7 = (void *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = (void *)MEMORY[0x263F0E648];
        v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) modelID];
        v12 = [v10 personManagerUUIDFromUserUUID:v11];

        v13 = [v4 personManagerUUID];
        char v14 = [v13 isEqual:v12];

        if (v14)
        {
          v15 = [v4 personUUID];
          v7 = +[HMCContext findPhotosPersonWithModelID:v15];

          goto LABEL_11;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)createHMPerson
{
  id v3 = objc_alloc(MEMORY[0x263F0E5C0]);
  id v4 = [(_MKFHomePerson *)self modelID];
  v5 = (void *)[v3 initWithUUID:v4];

  v6 = [(_MKFHomePerson *)self name];
  [v5 setName:v6];

  v7 = [MEMORY[0x263EFF9C0] set];
  uint64_t v8 = [(_MKFHomePerson *)self linkedPhotosPerson];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x263F0E648];
    v11 = [v8 user];
    v12 = [v11 modelID];
    v13 = [v10 personManagerUUIDFromUserUUID:v12];

    id v14 = objc_alloc(MEMORY[0x263F0E630]);
    v15 = [v9 modelID];
    v16 = (void *)[v14 initWithPersonUUID:v15 personManagerUUID:v13];

    [v7 addObject:v16];
  }
  [v5 setPersonLinks:v7];
  long long v17 = (void *)[v5 copy];

  return v17;
}

- (void)updateWithHMPerson:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_MKFHomePerson *)self name];
  v6 = [v4 name];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [v4 name];
    [(_MKFHomePerson *)self setName:v8];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = objc_msgSend(v4, "personLinks", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(_MKFHomePerson *)self photosPersonForPersonLink:*(void *)(*((void *)&v15 + 1) + 8 * v13)];
        if (v14) {
          [(_MKFHomePerson *)self setLinkedPhotosPerson:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFHomePerson"];
}

@end