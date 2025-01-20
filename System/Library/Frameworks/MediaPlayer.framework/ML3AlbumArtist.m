@interface ML3AlbumArtist
@end

@implementation ML3AlbumArtist

void __69__ML3AlbumArtist_MPMediaAdditions__propertyForMPMediaEntityProperty___block_invoke()
{
  v11[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F79350];
  v10[0] = @"albumArtistPersistentID";
  v10[1] = @"albumArtistName";
  uint64_t v1 = *MEMORY[0x1E4F79008];
  v11[0] = v0;
  v11[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79010];
  v10[2] = @"albumArtistSortName";
  v10[3] = @"albumArtistRepresentativeItemPersistentID";
  uint64_t v3 = *MEMORY[0x1E4F790F0];
  v11[2] = v2;
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F790E8];
  v10[4] = @"albumArtistCloudStatus";
  v10[5] = @"albumArtistStoreID";
  uint64_t v5 = *MEMORY[0x1E4F79018];
  v11[4] = v4;
  v11[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F78FF0];
  v10[6] = @"albumArtistCloudUniversalLibraryID";
  v10[7] = @"albumArtistFavoriteState";
  uint64_t v7 = *MEMORY[0x1E4F78FF8];
  v10[8] = @"albumArtistDateFavorited";
  v10[9] = @"_albumArtistLikedState";
  v11[6] = v6;
  v11[7] = v7;
  v11[8] = *MEMORY[0x1E4F79000];
  v11[9] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:10];
  v9 = (void *)propertyForMPMediaEntityProperty__ML3ForMP_18;
  propertyForMPMediaEntityProperty__ML3ForMP_18 = v8;
}

@end