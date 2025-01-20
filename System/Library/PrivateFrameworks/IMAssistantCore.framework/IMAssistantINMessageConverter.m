@interface IMAssistantINMessageConverter
+ (id)INMessageForOutgoingIMMessage:(id)a3 toChat:(id)a4 messageType:(int64_t)a5 personProvider:(id)a6;
+ (id)INMessagesForSPIMessage:(id)a3 personProvider:(id)a4;
+ (id)INPersonsForSPIHandles:(id)a3 personProvider:(id)a4;
+ (id)INStickerForIMSPIAttachment:(id)a3;
+ (id)__INMessageLinkMetadataForLPLinkMetadata:(id)a3;
+ (id)__INSpeakableStringForChat:(id)a3;
+ (id)__INSpeakableStringForMessage:(id)a3;
+ (id)_stringByRemovingMessagesControlCharactersFromString:(id)a3;
+ (id)expressiveSendIdFromMessageEffectType:(int64_t)a3;
+ (id)makeINMessage:(int64_t)a3 message:(id)a4 numberOfAttachments:(int64_t)a5 personProvider:(id)a6 referencedINMessage:(id)a7 content:(id)a8 reaction:(id)a9;
+ (id)messageEffectTypeToExpressiveSendIdDictionary;
+ (id)prepareAttachments:(int64_t)a3 message:(id)a4;
+ (id)spiHandleForIMHandle:(id)a3 isMe:(BOOL)a4;
+ (int64_t)INMessageReactionTypeForIMSPIMessageType:(int64_t)a3;
+ (int64_t)messageEffectTypeFromExpressiveSendId:(id)a3;
@end

@implementation IMAssistantINMessageConverter

+ (id)messageEffectTypeToExpressiveSendIdDictionary
{
  if (qword_2684A55D8 != -1) {
    dispatch_once(&qword_2684A55D8, &unk_26DF9B778);
  }
  v2 = (void *)qword_2684A55D0;

  return v2;
}

+ (int64_t)messageEffectTypeFromExpressiveSendId:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 length])
  {
LABEL_9:
    int64_t v7 = 0;
    goto LABEL_10;
  }
  v4 = +[IMAssistantINMessageConverter messageEffectTypeToExpressiveSendIdDictionary];
  v5 = [v4 objectForKeyedSubscript:v3];
  v6 = v5;
  if (!v5)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "No effect for effect identifier: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    goto LABEL_9;
  }
  int64_t v7 = [v5 integerValue];

LABEL_10:
  return v7;
}

+ (id)expressiveSendIdFromMessageEffectType:(int64_t)a3
{
  if (a3)
  {
    v4 = +[IMAssistantINMessageConverter messageEffectTypeToExpressiveSendIdDictionary];
    v5 = [NSNumber numberWithInteger:a3];
    v6 = [v4 allKeysForObject:v5];

    if ([v6 count])
    {
      int64_t v7 = [v6 firstObject];
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (id)__INMessageLinkMetadataForLPLinkMetadata:(id)a3
{
  id v3 = a3;
  v4 = [v3 images];
  v79 = objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_26DF9B798);

  v5 = [v3 icons];
  v78 = objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_26DF9B7B8);

  v42 = v3;
  v6 = [v3 specialization];
  MEMORY[0x230F626D0](@"LPiTunesMediaSongMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaAlbumMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaMusicVideoMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaArtistMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaPlaylistMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaRadioMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaSoftwareMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaBookMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaAudioBookMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaPodcastEpisodeMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaPodcastMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaTVEpisodeMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaTVSeasonMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaMovieMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPiTunesMediaMovieBundleMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPAppleTVMetadata", @"LinkPresentation");
  MEMORY[0x230F626D0](@"LPAppleMusicTVShowMetadata", @"LinkPresentation");
  v37 = v6;
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v76 = [v7 storeFrontIdentifier];
    v77 = [v7 storeIdentifier];
    v45 = [v7 name];
    v44 = [v7 artist];
    v43 = [v7 album];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    uint64_t v11 = 1;
LABEL_29:
    id v38 = (id)v11;
    goto LABEL_30;
  }
  if (objc_opt_isKindOfClass())
  {
    id v12 = v6;
    v76 = [v12 storeFrontIdentifier];
    v77 = [v12 storeIdentifier];
    v49 = [v12 name];
    v48 = [v12 artist];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 2;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v13 = v6;
    v76 = [v13 storeFrontIdentifier];
    v77 = [v13 storeIdentifier];
    v51 = [v13 name];
    v50 = [v13 artist];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 3;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    v76 = [v14 storeFrontIdentifier];
    v77 = [v14 storeIdentifier];
    v53 = [v14 name];
    v52 = [v14 genre];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 4;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v15 = v6;
    v76 = [v15 storeFrontIdentifier];
    v77 = [v15 storeIdentifier];
    v57 = [v15 name];
    v56 = [v15 curator];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 5;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v16 = v6;
    v76 = [v16 storeFrontIdentifier];
    v77 = [v16 storeIdentifier];
    v58 = [v16 name];
    v75 = [v16 curator];

    v73 = 0;
    v74 = 0;
    v71 = 0;
    v72 = 0;
    v69 = 0;
    v70 = 0;
    v67 = 0;
    v68 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 6;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v17 = v6;
    v76 = [v17 storeFrontIdentifier];
    v77 = [v17 storeIdentifier];
    v74 = [v17 name];
    v73 = [v17 genre];
    v72 = [v17 platform];

    v75 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 7;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v18 = v6;
    v76 = [v18 storeFrontIdentifier];
    v77 = [v18 storeIdentifier];
    v71 = [v18 name];
    v69 = [v18 author];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v67 = 0;
    v68 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 8;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v19 = v6;
    v76 = [v19 storeFrontIdentifier];
    v77 = [v19 storeIdentifier];
    v70 = [v19 name];
    v67 = [v19 author];
    v68 = [v19 narrator];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v71 = 0;
    v69 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 9;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v20 = v6;
    v76 = [v20 storeFrontIdentifier];
    v77 = [v20 storeIdentifier];
    v66 = [v20 episodeName];
    v62 = [v20 podcastName];
    v63 = [v20 artist];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 11;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v21 = v6;
    v76 = [v21 storeFrontIdentifier];
    v77 = [v21 storeIdentifier];
    v64 = [v21 name];
    v65 = [v21 artist];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 10;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v22 = v6;
    v76 = [v22 storeFrontIdentifier];
    v77 = [v22 storeIdentifier];
    v59 = [v22 episodeName];
    v61 = [v22 seasonName];
    v60 = [v22 genre];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 12;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v23 = v6;
    v76 = [v23 storeFrontIdentifier];
    v77 = [v23 storeIdentifier];
    v46 = [v23 name];
    v55 = [v23 genre];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v54 = 0;
    v8 = 0;
    v47 = 0;
    v48 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 13;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    id v24 = v6;
    v76 = [v24 storeFrontIdentifier];
    v77 = [v24 storeIdentifier];
    v54 = [v24 name];
    uint64_t v25 = [v24 genre];

    v8 = (void *)v25;
    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v9 = 0;
    v40 = 0;
    v41 = 0;
    int v10 = 0;
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    uint64_t v11 = 14;
    goto LABEL_29;
  }
  if (objc_opt_isKindOfClass())
  {
    v47 = [v6 name];
    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v41 = 0;
LABEL_37:
    v40 = 0;
    int v10 = 0;
LABEL_38:
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v76 = 0;
    v77 = 0;
    id v38 = 0;
    goto LABEL_30;
  }
  if (objc_opt_isKindOfClass())
  {
    id v32 = v6;
    v9 = [v32 name];
    v41 = [v32 genre];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    goto LABEL_37;
  }
  if (objc_opt_isKindOfClass())
  {
    id v33 = v6;
    v40 = [v33 title];
    int v10 = [v33 subtitle];

    v74 = 0;
    v75 = 0;
    v72 = 0;
    v73 = 0;
    v70 = 0;
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v64 = 0;
    v65 = 0;
    v62 = 0;
    v63 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v46 = 0;
    v47 = 0;
    v55 = 0;
    v54 = 0;
    v8 = 0;
    v9 = 0;
    v41 = 0;
    goto LABEL_38;
  }
  v74 = 0;
  v75 = 0;
  v72 = 0;
  v73 = 0;
  v70 = 0;
  v71 = 0;
  v68 = 0;
  v69 = 0;
  v66 = 0;
  v67 = 0;
  v64 = 0;
  v65 = 0;
  v62 = 0;
  v63 = 0;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v46 = 0;
  v47 = 0;
  v55 = 0;
  v54 = 0;
  v9 = 0;
  v40 = 0;
  v41 = 0;
  int v10 = 0;
  v58 = 0;
  v56 = 0;
  v57 = 0;
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v76 = 0;
  v77 = 0;
  id v38 = 0;
  v8 = 0;
LABEL_30:
  id v34 = objc_alloc(MEMORY[0x263F0FC78]);
  v36 = [v42 siteName];
  v35 = [v42 summary];
  v26 = [v42 title];
  v27 = [v42 itemType];
  v28 = [v42 originalURL];
  v29 = [v28 absoluteString];
  v30 = [v42 creator];
  id v39 = (id)objc_msgSend(v34, "initWithSiteName:summary:title:itemType:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v36, v35, v26, v27, v29, v79, v78, v30, v38, v77, v76,
              v45,
              v44,
              v43,
              v49,
              v48,
              v51,
              v50,
              v53,
              v52,
              v57,
              v56,
              v58,
              v75,
              v74,
              v73,
              v72,
              v71,
              v69,
              v70,
              v67,
              v68,
              v64,
              v65,
              v66,
              v62,
              v63,
              0,
              v59,
              v61,
              v60,
              v46,
              v55,
              v54,
              v8,
              v47,
              v9,
              v41,
              v40,
              v10);

  return v39;
}

+ (id)__INSpeakableStringForMessage:(id)a3
{
  id v3 = a3;
  if ([v3 isGroupChat])
  {
    v4 = [v3 displayName];
    if ([v4 length])
    {
      id v5 = objc_alloc(MEMORY[0x263F0FFA0]);
      v6 = [v3 chatIdentifier];
      id v7 = [v3 displayName];
      v8 = (void *)[v5 initWithVocabularyIdentifier:v6 spokenPhrase:v7 pronunciationHint:0];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Could not create INSpeakableString, chat did not have a display name", v11, 2u);
        }
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)__INSpeakableStringForChat:(id)a3
{
  id v3 = a3;
  if ([v3 isGroupChat])
  {
    v4 = [v3 displayName];
    if ([v4 length])
    {
      id v5 = objc_alloc(MEMORY[0x263F0FFA0]);
      v6 = [v3 chatIdentifier];
      id v7 = (void *)[v5 initWithVocabularyIdentifier:v6 spokenPhrase:v4 pronunciationHint:0];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v10 = 0;
          _os_log_impl(&dword_22C1AD000, v8, OS_LOG_TYPE_INFO, "Could not create INSpeakableString, chat did not have a display name", v10, 2u);
        }
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)spiHandleForIMHandle:(id)a3 isMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 originalID];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 ID];
  }
  v9 = v8;

  int v10 = [v5 countryCode];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F4A5F8]) initWithAddress:v9 countryCode:v10 isMe:v4];

  return v11;
}

+ (id)INPersonsForSPIHandles:(id)a3 personProvider:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22C1CFA34;
  v9[3] = &unk_264912AD0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "__imArrayByApplyingBlock:", v9);

  return v7;
}

+ (id)prepareAttachments:(int64_t)a3 message:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v34 = v4;
  id v5 = [v4 attachments];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = NSURL;
    id v8 = NSTemporaryDirectory();
    v9 = [v7 fileURLWithPath:v8];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [v4 attachments];
    id v10 = 0;
    uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v11)
    {
      uint64_t v37 = *(void *)v40;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v40 != v37) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
          id v14 = [v13 fileUrl];
          BOOL v15 = v14 == 0;

          if (v15)
          {
            if (IMOSLoggingEnabled())
            {
              v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "Error: Attachment fileURL is nil. Skipping copy", buf, 2u);
              }
            }
          }
          else
          {
            id v16 = [v13 fileUrl];
            id v17 = [v16 lastPathComponent];

            id v18 = [v9 URLByAppendingPathComponent:v17];
            id v19 = [MEMORY[0x263F08850] defaultManager];
            [v19 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];

            id v20 = [MEMORY[0x263F08850] defaultManager];
            id v21 = [v13 fileUrl];
            id v38 = v10;
            [v20 copyItemAtURL:v21 toURL:v18 error:&v38];
            id v22 = v38;

            if (v22 && [v22 code] != 516)
            {
              if (IMOSLoggingEnabled())
              {
                v30 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v44 = v22;
                  _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "Failed to copy attachment file to temp directory error %@", buf, 0xCu);
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                id v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  id v24 = [v13 fileUrl];
                  uint64_t v25 = [v22 code];
                  *(_DWORD *)buf = 138412802;
                  id v44 = v24;
                  __int16 v45 = 2112;
                  v46 = v18;
                  __int16 v47 = 2048;
                  uint64_t v48 = v25;
                  _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "File URL: %@ temp URL: %@, overwrite = %ld", buf, 0x20u);
                }
              }
              v26 = (void *)MEMORY[0x263F0FAF8];
              v27 = [v13 uti];
              v28 = [v26 fileWithFileURL:v18 filename:v17 typeIdentifier:v27];
              [v35 addObject:v28];
            }
            id v10 = v22;
          }
          ++v12;
        }
        while (v11 != v12);
        uint64_t v31 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
        uint64_t v11 = v31;
      }
      while (v31);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v32, OS_LOG_TYPE_INFO, "Error: Message does not have attachments!", buf, 2u);
    }
  }

  return v35;
}

+ (int64_t)INMessageReactionTypeForIMSPIMessageType:(int64_t)a3
{
  if ((unint64_t)(a3 - 200) >= 0x17)
  {
    int64_t result = 1;
    switch(a3)
    {
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
        goto LABEL_2;
      case 'i':
        id v5 = (int64_t *)MEMORY[0x263F10268];
        goto LABEL_16;
      case 'j':
        id v5 = (int64_t *)MEMORY[0x263F10248];
        goto LABEL_16;
      case 'k':
        id v5 = (int64_t *)MEMORY[0x263F10250];
        goto LABEL_16;
      case 'l':
        id v5 = (int64_t *)MEMORY[0x263F10270];
        goto LABEL_16;
      case 'm':
        id v5 = (int64_t *)MEMORY[0x263F10278];
        goto LABEL_16;
      case 'n':
        id v5 = (int64_t *)MEMORY[0x263F10260];
        goto LABEL_16;
      case 'p':
        id v5 = (int64_t *)MEMORY[0x263F10280];
        goto LABEL_16;
      case 'q':
        id v5 = (int64_t *)MEMORY[0x263F10240];
LABEL_16:
        int64_t result = *v5;
        break;
      default:
        return result;
    }
  }
  else
  {
LABEL_2:
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_22C1AD000, v3, OS_LOG_TYPE_INFO, "Error: This should only be called on a set of INMessageReaction subtypes. Returning INMessageReactionTypeGeneric.", v6, 2u);
      }
    }
    return 2;
  }
  return result;
}

+ (id)makeINMessage:(int64_t)a3 message:(id)a4 numberOfAttachments:(int64_t)a5 personProvider:(id)a6 referencedINMessage:(id)a7 content:(id)a8 reaction:(id)a9
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v61 = a6;
  id v55 = a7;
  id v60 = a8;
  id v56 = a9;
  id v14 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  LODWORD(a7) = [v14 isZelkovaEnabled];

  if (a7 && [v13 messageType] == 215)
  {
    BOOL v15 = [v13 extensionPayloadURL];
    uint64_t v16 = [v15 absoluteString];

    id v60 = (id)v16;
  }
  if (a3 == 15
    && ([v13 attachments],
        id v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 count],
        v17,
        v18 == 1))
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "IMAssistantINMessageConverter: Image type attachments", buf, 2u);
      }
    }
    v58 = [a1 prepareAttachments:15 message:v13];
    id v20 = objc_alloc(MEMORY[0x263F0FC68]);
    v53 = [v13 guid];
    id v21 = [v13 chatIdentifier];
    id v22 = [v13 date];
    id v23 = [v13 sender];
    id v24 = [v61 personFromSPIHandle:v23];
    uint64_t v25 = [v13 recipients];
    v26 = [a1 INPersonsForSPIHandles:v25 personProvider:v61];
    v27 = +[IMAssistantINMessageConverter __INSpeakableStringForMessage:v13];
    v28 = [v13 service];
    v29 = (void *)[v20 initWithIdentifier:v53 conversationIdentifier:v21 content:v60 dateSent:v22 sender:v24 recipients:v26 groupName:v27 messageType:15 serviceName:v28 attachmentFiles:v58];
  }
  else
  {
    id v30 = objc_alloc(MEMORY[0x263F0FC68]);
    v54 = [v13 guid];
    v52 = [v13 chatIdentifier];
    v51 = [v13 date];
    uint64_t v31 = [v13 sender];
    uint64_t v50 = [v61 personFromSPIHandle:v31];
    id v32 = [v13 recipients];
    v49 = [a1 INPersonsForSPIHandles:v32 personProvider:v61];
    id v33 = +[IMAssistantINMessageConverter __INSpeakableStringForMessage:v13];
    id v34 = [v13 dateForLastReadMessageInChat];
    id v35 = [NSNumber numberWithInteger:a5];
    v36 = [v13 effect];
    int64_t v37 = +[IMAssistantINMessageConverter messageEffectTypeFromExpressiveSendId:v36];
    id v38 = [v13 service];
    uint64_t v48 = objc_msgSend(v30, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v54, v52, v60, v51, v50, v49, v33, v34, v35, a3, v37, v55, v38, v56, 0,
            0,
            0);

    v29 = (void *)v48;
  }
  long long v39 = [v13 richLinkMetadata];
  if (v39)
  {
    long long v40 = objc_msgSend(a1, "__INMessageLinkMetadataForLPLinkMetadata:", v39);
    [v29 setLinkMetadata:v40];
    if (IMOSLoggingEnabled())
    {
      long long v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v40;
        _os_log_impl(&dword_22C1AD000, v41, OS_LOG_TYPE_INFO, "Link Metadata: %@", buf, 0xCu);
      }
    }
  }
  long long v42 = [v13 peerPaymentAmount];
  if (v42)
  {
    id v43 = objc_alloc(MEMORY[0x263F0FA48]);
    id v44 = [v42 amount];
    __int16 v45 = [v42 currency];
    v46 = (void *)[v43 initWithAmount:v44 currencyCode:v45];

    [v29 setPaymentAmount:v46];
  }

  return v29;
}

+ (id)INMessagesForSPIMessage:(id)a3 personProvider:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v48 = a4;
  uint64_t v6 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t spid = os_signpost_id_generate(v6);

  id v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "INMessagesForSPIMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v49 = [v5 guid];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v49;
      _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Converting IMSPIMessage to INMessages. Message to be converted: %@", buf, 0xCu);
    }
  }
  v51 = [v5 referencedMessage];
  uint64_t v50 = [v51 guid];
  if (v51)
  {
    id v44 = [NSString stringWithFormat:@"Yes, a reference to: %@", v50];
  }
  else
  {
    id v44 = @"No";
  }
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v49;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v44;
      _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Message (guid: %@) has a referenced message? %@", buf, 0x16u);
    }
  }
  if (!v51)
  {
    id v43 = 0;
    goto LABEL_35;
  }
  uint64_t v11 = [a1 INMessagesForSPIMessage:v51 personProvider:v48];
  if ((unint64_t)[v11 count] < 2)
  {
    BOOL v13 = [v11 count] == 0;
    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v67 = v49;
          __int16 v68 = 2112;
          uint64_t v69 = (uint64_t)v50;
          _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Message %@ has a reference to a message %@ that could not be converted to an INMessage.", buf, 0x16u);
        }
      }
      id v43 = 0;
      goto LABEL_34;
    }
    if (v14)
    {
      BOOL v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v67 = v49;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v50;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Message %@ has a reference to a single message %@.", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v49;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v50;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Message %@ has a reference to multi-part message %@. Reference should be to a single part, e.g. a tapback on a photo in a group of photos, but we do not have the infomration to resolve which part. Naively choosing the first part.", buf, 0x16u);
    }
  }
  id v43 = [v11 firstObject];
LABEL_34:

LABEL_35:
  id v17 = [v5 attributedText];
  if (!v17)
  {
    uint64_t v18 = [v5 body];
    id v19 = (void *)v18;
    id v20 = &stru_26DF9B8B8;
    if (v18) {
      id v20 = (__CFString *)v18;
    }
    id v21 = v20;

    id v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v21];
  }
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v5 attachments];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v62 != v26) {
          objc_enumerationMutation(v24);
        }
        v28 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v29 = [v28 guid];
        if ([v29 length]) {
          [v23 setObject:v28 forKeyedSubscript:v29];
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v25);
  }

  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = sub_22C1D0E68;
  v52[3] = &unk_264912B40;
  id v30 = v23;
  id v53 = v30;
  id v60 = a1;
  id v47 = v5;
  id v54 = v47;
  id v31 = v43;
  id v55 = v31;
  id v32 = v50;
  id v56 = v32;
  id v33 = v49;
  id v57 = v33;
  id v34 = v48;
  id v58 = v34;
  id v35 = v22;
  id v59 = v35;
  objc_msgSend(v17, "__im_visitMessageParts:", v52);
  if (IMOSLoggingEnabled())
  {
    v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      uint64_t v37 = [v35 count];
      *(_DWORD *)buf = 138412546;
      id v67 = v33;
      __int16 v68 = 2048;
      uint64_t v69 = v37;
      _os_log_impl(&dword_22C1AD000, v36, OS_LOG_TYPE_INFO, "Message %@ converted to %ld INMessages", buf, 0x16u);
    }
  }
  id v38 = _IMAssistantCoreGeneralSignpostLogHandle();
  long long v39 = v38;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v39, OS_SIGNPOST_INTERVAL_END, spid, "INMessagesForSPIMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  long long v40 = v59;
  id v41 = v35;

  return v41;
}

+ (id)INStickerForIMSPIAttachment:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 stickerUserInfo];
    uint64_t v6 = [v5 valueForKey:*MEMORY[0x263F4AE58]];

    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v31 = 138412290;
        id v32 = v6;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Sticker externalURI: %@", (uint8_t *)&v31, 0xCu);
      }
    }
    if (v6)
    {
      id v8 = [v6 stringByReplacingOccurrencesOfString:@"sticker:///" withString:&stru_26DF9B8B8];
      v9 = [v8 componentsSeparatedByString:@"/"];
      if ([v9 count] == 3)
      {
        id v10 = [v9 objectAtIndexedSubscript:0];
        int v11 = [v10 isEqualToString:@"memoji"];

        if (v11)
        {
          uint64_t v12 = [v9 objectAtIndexedSubscript:1];
          if ([v12 length])
          {
            BOOL v13 = [v9 objectAtIndexedSubscript:1];
          }
          else
          {
            BOOL v13 = @"memoji";
          }

          id v22 = [v9 objectAtIndexedSubscript:2];
          BOOL v15 = [v22 stringByReplacingOccurrencesOfString:v13 withString:&stru_26DF9B8B8];

          int v23 = [v15 hasPrefix:@"_"];
          uint64_t v17 = *MEMORY[0x263F102F0];
          if (v23)
          {
            uint64_t v24 = objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_26DF9B8B8);

            uint64_t v16 = 0;
            BOOL v15 = (void *)v24;
          }
          else
          {
            uint64_t v16 = 0;
          }
        }
        else
        {
          uint64_t v18 = [v9 objectAtIndexedSubscript:0];
          int v19 = [v18 isEqualToString:@"emoji"];

          if (v19)
          {
            uint64_t v16 = [v9 objectAtIndexedSubscript:2];
            BOOL v13 = 0;
            BOOL v15 = 0;
            uint64_t v17 = 1;
          }
          else
          {
            id v20 = [v9 objectAtIndexedSubscript:0];
            int v21 = [v20 isEqualToString:@"user"];

            BOOL v13 = 0;
            BOOL v15 = 0;
            uint64_t v16 = 0;
            if (v21) {
              uint64_t v17 = *MEMORY[0x263F102E8];
            }
            else {
              uint64_t v17 = 2;
            }
          }
        }
      }
      else
      {
        BOOL v13 = 0;
        BOOL v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 2;
      }

      int v14 = 0;
    }
    else
    {
      uint64_t v25 = [v3 objectAtIndexedSubscript:0];
      uint64_t v26 = [v25 stickerUserInfo];
      id v8 = [v26 valueForKey:*MEMORY[0x263F4AE68]];

      v27 = [v8 componentsSeparatedByString:@":"];
      int v14 = [v27 lastObject];

      if (v14)
      {
        BOOL v13 = 0;
        BOOL v15 = 0;
        uint64_t v16 = 0;
        if ([v14 length]) {
          uint64_t v17 = *MEMORY[0x263F102E0];
        }
        else {
          uint64_t v17 = 2;
        }
      }
      else
      {
        BOOL v13 = 0;
        BOOL v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 2;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
    int v14 = 0;
    BOOL v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 2;
  }
  v28 = (void *)[objc_alloc(MEMORY[0x263F0FFF8]) initWithType:v17 avatarDescriptor:v13 appBundleID:v14 stickerDescription:v15 emoji:v16];
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v28;
      _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "INStickerForIMSPIAttachment sticker: %@", (uint8_t *)&v31, 0xCu);
    }
  }

  return v28;
}

+ (id)_stringByRemovingMessagesControlCharactersFromString:(id)a3
{
  id v3 = [a3 stringByReplacingOccurrencesOfString:*MEMORY[0x263F4A468] withString:&stru_26DF9B8B8];
  id v4 = [v3 stringByReplacingOccurrencesOfString:*MEMORY[0x263F4A470] withString:&stru_26DF9B8B8];

  return v4;
}

+ (id)INMessageForOutgoingIMMessage:(id)a3 toChat:(id)a4 messageType:(int64_t)a5 personProvider:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = _IMAssistantCoreGeneralSignpostLogHandle();
  BOOL v13 = v12;
  unint64_t v48 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "INMessageForOutgoingIMMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }
  os_signpost_id_t spid = v11;

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v51 = v9;
  BOOL v15 = [v9 participantsWithState:16];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [a1 spiHandleForIMHandle:*(void *)(*((void *)&v52 + 1) + 8 * i) isMe:0];
        int v21 = objc_msgSend(MEMORY[0x263F0FD18], "__im_personFromSPIHandle:contact:", v20, 0);
        [v14 addObject:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [v9 lastAddressedHandleID];
  int v23 = [v9 account];
  uint64_t v24 = [v23 countryCode];

  id v44 = (void *)v24;
  __int16 v45 = (void *)v22;
  id v43 = (void *)[objc_alloc(MEMORY[0x263F4A5F8]) initWithAddress:v22 countryCode:v24 isMe:1];
  uint64_t v50 = objc_msgSend(MEMORY[0x263F0FD18], "__im_personFromSPIHandle:contact:");
  uint64_t v25 = [v8 plainBody];
  uint64_t v26 = v25;
  if (v25)
  {
    id v42 = v25;
  }
  else
  {
    v27 = [v8 text];
    id v42 = [v27 string];
  }
  id v41 = objc_alloc(MEMORY[0x263F0FC68]);
  v28 = [v8 guid];
  v29 = [v9 chatIdentifier];
  id v30 = [v8 time];
  int v31 = (void *)[v14 copy];
  id v32 = +[IMAssistantINMessageConverter __INSpeakableStringForChat:v9];
  v49 = v8;
  uint64_t v33 = [v8 expressiveSendStyleID];
  int64_t v34 = +[IMAssistantINMessageConverter messageEffectTypeFromExpressiveSendId:v33];
  id v35 = [v51 account];
  v36 = [v35 serviceName];
  id v47 = (id)objc_msgSend(v41, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:", v28, v29, v32, 0, 0, a5, v34, 0, v36);

  uint64_t v37 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v38 = v37;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v38, OS_SIGNPOST_INTERVAL_END, spid, "INMessageForOutgoingIMMessage", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v47;
}

@end