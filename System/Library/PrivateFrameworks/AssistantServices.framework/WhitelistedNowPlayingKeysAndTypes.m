@interface WhitelistedNowPlayingKeysAndTypes
@end

@implementation WhitelistedNowPlayingKeysAndTypes

void ___WhitelistedNowPlayingKeysAndTypes_block_invoke()
{
  v20[22] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4F77540];
  v19[0] = *MEMORY[0x1E4F77500];
  v19[1] = v6;
  v20[0] = v1;
  v20[1] = v1;
  uint64_t v7 = *MEMORY[0x1E4F775F0];
  v19[2] = *MEMORY[0x1E4F77550];
  v19[3] = v7;
  v20[2] = v0;
  v20[3] = v0;
  uint64_t v8 = *MEMORY[0x1E4F77430];
  v19[4] = *MEMORY[0x1E4F77418];
  v19[5] = v8;
  v20[4] = v0;
  v20[5] = v0;
  uint64_t v9 = *MEMORY[0x1E4F77580];
  v19[6] = *MEMORY[0x1E4F77588];
  v19[7] = v9;
  v20[6] = v4;
  v20[7] = v1;
  uint64_t v10 = *MEMORY[0x1E4F77560];
  v19[8] = *MEMORY[0x1E4F77608];
  v19[9] = v10;
  v20[8] = v1;
  v20[9] = v1;
  uint64_t v11 = *MEMORY[0x1E4F77640];
  v19[10] = *MEMORY[0x1E4F77638];
  v19[11] = v11;
  v20[10] = v1;
  v20[11] = v1;
  uint64_t v12 = *MEMORY[0x1E4F774E0];
  v19[12] = *MEMORY[0x1E4F77630];
  v19[13] = v12;
  v20[12] = v4;
  v20[13] = v0;
  uint64_t v13 = *MEMORY[0x1E4F77470];
  v19[14] = *MEMORY[0x1E4F77478];
  v19[15] = v13;
  v20[14] = v0;
  v20[15] = v2;
  uint64_t v14 = *MEMORY[0x1E4F774C8];
  v19[16] = *MEMORY[0x1E4F774A0];
  v19[17] = v14;
  v20[16] = v2;
  v20[17] = v1;
  uint64_t v15 = *MEMORY[0x1E4F775E8];
  v19[18] = *MEMORY[0x1E4F774D0];
  v19[19] = v15;
  v20[18] = v1;
  v20[19] = v5;
  uint64_t v16 = *MEMORY[0x1E4F775B8];
  v19[20] = *MEMORY[0x1E4F77490];
  v19[21] = v16;
  v20[20] = v3;
  v20[21] = v1;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:22];
  v18 = (void *)_WhitelistedNowPlayingKeysAndTypes_schema;
  _WhitelistedNowPlayingKeysAndTypes_schema = v17;
}

@end