@interface PHPerson(HMDPhotoLibrary)
- (HMDPhotoLibraryPerson)createPhotoLibraryPerson;
@end

@implementation PHPerson(HMDPhotoLibrary)

- (HMDPhotoLibraryPerson)createPhotoLibraryPerson
{
  id v2 = objc_alloc(MEMORY[0x1E4F29128]);
  v3 = [a1 uuid];
  v4 = (void *)[v2 initWithUUIDString:v3];

  v5 = [a1 name];
  if ([v5 length])
  {
    v6 = [a1 name];
  }
  else
  {
    v6 = 0;
  }

  v7 = [[HMDPhotoLibraryPerson alloc] initWithUUID:v4 name:v6];
  return v7;
}

@end