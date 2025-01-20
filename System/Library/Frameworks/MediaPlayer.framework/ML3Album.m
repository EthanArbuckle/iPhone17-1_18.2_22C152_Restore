@interface ML3Album
@end

@implementation ML3Album

void __63__ML3Album_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v14[15] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v13[0] = @"albumPersistentID";
  v13[1] = @"albumName";
  uint64_t v1 = *MEMORY[0x1E4F79060];
  v14[0] = v0;
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79068];
  v13[2] = @"albumSortName";
  v13[3] = @"albumAlbumArtistPersistentID";
  uint64_t v3 = *MEMORY[0x1E4F79038];
  v14[2] = v2;
  v14[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F79030];
  v13[4] = @"albumAlbumArtist";
  v13[5] = @"albumRepresentativeItemPersistentID";
  uint64_t v5 = *MEMORY[0x1E4F790F0];
  v14[4] = v4;
  v14[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F790E8];
  v13[6] = @"albumCloudStatus";
  v13[7] = @"albumAlbumYear";
  uint64_t v7 = *MEMORY[0x1E4F79020];
  v14[6] = v6;
  v14[7] = v7;
  uint64_t v8 = *MEMORY[0x1E4F79050];
  v13[8] = @"albumLikedState";
  v13[9] = @"albumStoreID";
  uint64_t v9 = *MEMORY[0x1E4F79070];
  v14[8] = v8;
  v14[9] = v9;
  v13[10] = @"albumLikedStateChangedDate";
  v13[11] = @"albumDatePlayedLocal";
  uint64_t v10 = *MEMORY[0x1E4F79048];
  v14[10] = *MEMORY[0x1E4F79058];
  v14[11] = v10;
  v13[12] = @"albumCloudLibraryID";
  v13[13] = @"_albumLikedState";
  v14[12] = *MEMORY[0x1E4F79040];
  v14[13] = v8;
  v13[14] = @"albumCanonicalID";
  v14[14] = *MEMORY[0x1E4F79078];
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:15];
  v12 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_8;
  propertyForMPMediaEntityProperty__ML3ForMP_8 = v11;
}

@end