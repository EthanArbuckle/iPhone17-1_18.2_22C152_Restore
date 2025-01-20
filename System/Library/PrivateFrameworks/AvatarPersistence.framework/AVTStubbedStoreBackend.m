@interface AVTStubbedStoreBackend
- (AVTAvatarRecordChangeTracker)recordChangeTracker;
- (AVTStoreBackendDelegate)backendDelegate;
- (BOOL)canCreateAvatarWithError:(id *)a3;
- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)saveAvatar:(id)a3 error:(id *)a4;
- (BOOL)saveAvatars:(id)a3 error:(id *)a4;
- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4;
- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4;
@end

@implementation AVTStubbedStoreBackend

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [AVTAvatarRecord alloc];
  v6 = [v4 avatarData];
  v7 = (void *)[v6 copy];
  v8 = [v4 orderDate];

  v9 = [v8 dateByAddingTimeInterval:1.0];
  v10 = [(AVTAvatarRecord *)v5 initWithAvatarData:v7 orderDate:v9];

  return v10;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  return 0;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  return 0;
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return 0;
}

@end