@interface _MKFPhotosPerson
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (MKFHome)home;
- (MKFPhotosPersonDatabaseID)databaseID;
- (id)createHMPerson;
- (void)updateWithHMPerson:(id)a3;
@end

@implementation _MKFPhotosPerson

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E492490;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_10585 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_10585, &__block_literal_global_10586);
  }
  v2 = (void *)homeRelation__hmf_once_v1_10587;
  return (NSPredicate *)v2;
}

- (MKFHome)home
{
  v2 = [(_MKFPhotosPerson *)self user];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFPhotosPersonDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFPhotosPersonDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)createHMPerson
{
  id v3 = objc_alloc(MEMORY[0x263F0E5C0]);
  v4 = [(_MKFPhotosPerson *)self modelID];
  v5 = (void *)[v3 initWithUUID:v4];

  v6 = [(_MKFPhotosPerson *)self name];
  [v5 setName:v6];

  v7 = [(_MKFPhotosPerson *)self photoLibraryPersonUUID];
  [v5 setExternalPersonUUID:v7];

  v8 = [MEMORY[0x263EFF9C0] set];
  v9 = [(_MKFPhotosPerson *)self linkedHomePerson];
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x263F0E3D0];
    v12 = [v9 home];
    v13 = [v12 modelID];
    v14 = [v11 personManagerUUIDFromHomeUUID:v13];

    id v15 = objc_alloc(MEMORY[0x263F0E630]);
    v16 = [v10 modelID];
    v17 = (void *)[v15 initWithPersonUUID:v16 personManagerUUID:v14];

    [v8 addObject:v17];
  }
  [v5 setPersonLinks:v8];
  v18 = (void *)[v5 copy];

  return v18;
}

- (void)updateWithHMPerson:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(_MKFPhotosPerson *)self name];
  v6 = [v4 name];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    v8 = [v4 name];
    [(_MKFPhotosPerson *)self setName:v8];
  }
  v9 = [(_MKFPhotosPerson *)self photoLibraryPersonUUID];
  v10 = [v4 externalPersonUUID];
  char v11 = HMFEqualObjects();

  if ((v11 & 1) == 0)
  {
    v12 = [v4 externalPersonUUID];
    [(_MKFPhotosPerson *)self setPhotoLibraryPersonUUID:v12];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = objc_msgSend(v4, "personLinks", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) personUUID];
        v19 = +[HMCContext findHomePersonWithModelID:v18];

        if (v19) {
          [(_MKFPhotosPerson *)self setLinkedHomePerson:v19];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFPhotosPerson"];
}

@end