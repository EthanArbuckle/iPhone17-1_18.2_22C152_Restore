@interface MPMRInitPropertyPodcastEpisodeMap
@end

@implementation MPMRInitPropertyPodcastEpisodeMap

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  v6 = +[MPBaseEntityTranslator translatorForMPModelClass:objc_opt_class()];
  v19[0] = @"MPModelPropertyPodcastChapterTitle";
  v19[1] = @"MPModelPropertyPodcastChapterDuration";
  v19[2] = @"MPModelPropertyPodcastChapterStartTime";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v8 = +[MPPropertySet propertySetWithProperties:v7];

  v9 = [v5 sections];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_14;
  v15[3] = &unk_1E57F08A8;
  id v16 = v6;
  id v17 = v8;
  id v18 = v4;
  id v10 = v4;
  id v11 = v8;
  id v12 = v6;
  v13 = objc_msgSend(v9, "msv_map:", v15);

  return v13;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForPropertySet:*(void *)(a1 + 40) contentItem:a2 context:*(void *)(a1 + 48)];
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_12(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  unint64_t v3 = [a2 episodeType] - 1;
  if (v3 > 5) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_19568AA60[v3];
  }

  return [v2 numberWithInteger:v4];
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_11(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  unint64_t v3 = [v2 objectForKeyedSubscript:@"podEpShURL"];

  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_10(uint64_t a1, void *a2)
{
  v2 = [a2 userInfo];
  unint64_t v3 = [v2 objectForKeyedSubscript:@"podEpStrURL"];

  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_9(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  unint64_t v3 = [a2 deviceSpecificUserInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"rating"];
  [v4 floatValue];
  id v5 = objc_msgSend(v2, "numberWithFloat:");

  return v5;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_8(uint64_t a1, void *a2)
{
  BOOL v2 = ([a2 mediaType] & 0xFF00) != 0;
  unint64_t v3 = NSNumber;

  return [v3 numberWithBool:v2];
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_7(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 releaseDate];
  unint64_t v3 = _MPMRDateComponentsFromDate(v2);

  return v3;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_5(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 transcriptAlignments];
  unint64_t v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_223);

  return v3;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 mpTranscriptAlignment];
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"phold"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v7 = [v2 title];
    v8 = [v6 localizedStringForKey:v7 value:&stru_1EE680640 table:@"MediaPlayer"];
  }
  else
  {
    v8 = [v2 title];
  }

  return v8;
}

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 deviceSpecificUserInfo];
  v7 = [v6 objectForKeyedSubscript:@"did"];

  if ([v7 length])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_2;
    v20[3] = &unk_1E57F96A0;
    id v21 = v4;
    [v5 setLibraryIdentifiersWithDatabaseID:v7 block:v20];
  }
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_3;
  id v18 = &unk_1E57FA390;
  id v19 = v4;
  id v8 = v4;
  [v5 setUniversalStoreIdentifiersWithBlock:&v15];
  v9 = objc_msgSend(v8, "externalContentIdentifier", v15, v16, v17, v18);
  [v5 setVendorID:v9];

  id v10 = [v8 identifier];
  [v5 setContentItemID:v10];

  id v11 = [v8 userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"cntrUID"];
  [v5 setContainerUniqueID:v12];

  v13 = [v8 userInfo];
  v14 = [v13 objectForKeyedSubscript:@"phold"];
  objc_msgSend(v5, "setPlaceholder:", objc_msgSend(v14, "BOOLValue"));
}

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 deviceSpecificUserInfo];
  id v4 = [v5 objectForKeyedSubscript:@"pid"];
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));
}

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "storeID"));
}

@end