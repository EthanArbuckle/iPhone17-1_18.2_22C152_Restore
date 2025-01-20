@interface NSPredicate(PHPhotoLibrary)
+ (id)predicateForCloudInvitationsInAssetCollection:()PHPhotoLibrary;
+ (id)predicateForCommentsInAsset:()PHPhotoLibrary;
+ (id)predicateForLikesInAsset:()PHPhotoLibrary;
+ (uint64_t)predicateForAssetsInAssetCollectionWithID:()PHPhotoLibrary;
@end

@implementation NSPredicate(PHPhotoLibrary)

+ (id)predicateForLikesInAsset:()PHPhotoLibrary
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 objectID];
  v5 = [v3 predicateWithFormat:@"likedPhoto = %@", v4];

  return v5;
}

+ (id)predicateForCommentsInAsset:()PHPhotoLibrary
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 objectID];
  v5 = [v3 predicateWithFormat:@"commentedAsset = %@", v4];

  return v5;
}

+ (id)predicateForCloudInvitationsInAssetCollection:()PHPhotoLibrary
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 objectID];
  v5 = [v3 predicateWithFormat:@"album = %@", v4];

  return v5;
}

+ (uint64_t)predicateForAssetsInAssetCollectionWithID:()PHPhotoLibrary
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"albums CONTAINS %@", a3];
}

@end