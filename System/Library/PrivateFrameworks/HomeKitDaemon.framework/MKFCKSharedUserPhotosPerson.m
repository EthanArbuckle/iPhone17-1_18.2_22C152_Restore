@interface MKFCKSharedUserPhotosPerson
+ (id)fetchRequest;
- (id)createHMPerson;
- (void)updateWithHMPerson:(id)a3;
@end

@implementation MKFCKSharedUserPhotosPerson

- (id)createHMPerson
{
  id v3 = objc_alloc(MEMORY[0x263F0E5C0]);
  v4 = [(MKFCKSharedUserPhotosPerson *)self modelID];
  v5 = (void *)[v3 initWithUUID:v4];

  v6 = [(MKFCKSharedUserPhotosPerson *)self name];
  [v5 setName:v6];

  v7 = [(MKFCKSharedUserPhotosPerson *)self photoLibraryPersonUUID];
  [v5 setExternalPersonUUID:v7];

  v8 = (void *)[v5 copy];
  return v8;
}

- (void)updateWithHMPerson:(id)a3
{
  id v12 = a3;
  v4 = [(MKFCKSharedUserPhotosPerson *)self name];
  v5 = [v12 name];
  char v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    v7 = [v12 name];
    [(MKFCKSharedUserPhotosPerson *)self setName:v7];
  }
  v8 = [(MKFCKSharedUserPhotosPerson *)self photoLibraryPersonUUID];
  v9 = [v12 externalPersonUUID];
  char v10 = HMFEqualObjects();

  if ((v10 & 1) == 0)
  {
    v11 = [v12 externalPersonUUID];
    [(MKFCKSharedUserPhotosPerson *)self setPhotoLibraryPersonUUID:v11];
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserPhotosPerson"];
}

@end