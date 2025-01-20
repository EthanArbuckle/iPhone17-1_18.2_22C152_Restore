@interface IMDCoreSpotlightMessageBalloonPluginIndexer
+ (BOOL)_isMediaSpecialization:(id)a3;
+ (BOOL)_richLinkPluginHasRichContentForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5 outURL:(id *)a6 outTitle:(id *)a7 outLPMetadata:(id *)a8;
+ (id)_addressComponentStringsFromMapMetadata:(id)a3;
+ (id)_linkSubTypeForMediaSpecialization:(id)a3;
+ (id)_linkTypeForMediaSpecialization:(id)a3;
+ (id)_newSummaryTextForPayloadData:(id)a3 item:(id)a4;
+ (id)_pluginPayloadAttachmentPathsForItem:(id)a3;
+ (id)lpDescriptionCustomKey;
+ (id)lpHasRichMediaCustomKey;
+ (id)lpPluginPathsCustomKey;
+ (void)_indexLinkMetadata:(id)a3 metadataToUpdate:(id)a4;
+ (void)_insertLPType:(id)a3 subType:(id)a4 metadata:(id)a5;
+ (void)_insertURLDescription:(id)a3 metadataToUpdate:(id)a4;
+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7;
@end

@implementation IMDCoreSpotlightMessageBalloonPluginIndexer

+ (void)_insertLPType:(id)a3 subType:(id)a4 metadata:(id)a5
{
  id v21 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v21)
  {
    v9 = [v8 detectedEventTypes];
    v10 = (void *)[v9 mutableCopy];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    v13 = v12;

    [v13 addObject:v21];
    v14 = (void *)[v13 copy];
    [v8 setDetectedEventTypes:v14];

    v15 = [v8 mediaTypes];
    v16 = (void *)[v15 mutableCopy];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    v19 = v18;

    [v19 addObject:v21];
    v20 = (void *)[v19 copy];
    [v8 setMediaTypes:v20];

    [v8 setLinkType:v21];
  }
  if (v7) {
    [v8 setLinkSubType:v7];
  }
}

+ (BOOL)_isMediaSpecialization:(id)a3
{
  id v3 = a3;
  v4 = [v3 specialization];

  if (v4)
  {
    if (qword_1E9AF8098 != -1) {
      dispatch_once(&qword_1E9AF8098, &unk_1F084BFE0);
    }
    v4 = (void *)qword_1E9AF8090;
    v5 = [v3 specialization];
    LOBYTE(v4) = [v4 containsObject:objc_opt_class()];
  }
  return (char)v4;
}

+ (id)_linkTypeForMediaSpecialization:(id)a3
{
  id v3 = a3;
  v4 = [v3 specialization];
  sub_1AFBAED94();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = (id *)MEMORY[0x1E4F22968];
LABEL_15:
    id v21 = *v6;
    goto LABEL_16;
  }
  id v7 = [v3 specialization];
  sub_1AFBAEE78();
  char v8 = objc_opt_isKindOfClass();

  if (v8)
  {
    v6 = (id *)MEMORY[0x1E4F22920];
    goto LABEL_15;
  }
  v9 = [v3 specialization];
  sub_1AFBAEF5C();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    v6 = (id *)MEMORY[0x1E4F22928];
    goto LABEL_15;
  }
  v11 = [v3 specialization];
  sub_1AFBAF040();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    v6 = (id *)MEMORY[0x1E4F22940];
    goto LABEL_15;
  }
  v13 = [v3 specialization];
  sub_1AFBAF124();
  char v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0
    || ([v3 specialization],
        v15 = objc_claimAutoreleasedReturnValue(),
        sub_1AFBAF208(),
        char v16 = objc_opt_isKindOfClass(),
        v15,
        (v16 & 1) != 0))
  {
    v6 = (id *)MEMORY[0x1E4F22958];
    goto LABEL_15;
  }
  v17 = [v3 specialization];
  sub_1AFBAF2EC();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0
    || ([v3 specialization],
        v19 = objc_claimAutoreleasedReturnValue(),
        sub_1AFBAF3D0(),
        char v20 = objc_opt_isKindOfClass(),
        v19,
        (v20 & 1) != 0))
  {
    v6 = (id *)MEMORY[0x1E4F22960];
    goto LABEL_15;
  }
  v23 = [v3 specialization];
  sub_1AFBAF4B4();
  char v24 = objc_opt_isKindOfClass();

  if (v24)
  {
    v6 = (id *)MEMORY[0x1E4F22950];
    goto LABEL_15;
  }
  v25 = [v3 specialization];
  sub_1AFBAF598();
  char v26 = objc_opt_isKindOfClass();

  if ((v26 & 1) != 0
    || ([v3 specialization],
        v27 = objc_claimAutoreleasedReturnValue(),
        sub_1AFBAF67C(),
        char v28 = objc_opt_isKindOfClass(),
        v27,
        (v28 & 1) != 0))
  {
    v6 = (id *)MEMORY[0x1E4F22938];
    goto LABEL_15;
  }
  v29 = [v3 specialization];
  sub_1AFBAFA58();
  char v30 = objc_opt_isKindOfClass();

  if ((v30 & 1) == 0)
  {
    v31 = [v3 specialization];
    sub_1AFBAFB3C();
    char v32 = objc_opt_isKindOfClass();

    if (v32)
    {
      v6 = (id *)MEMORY[0x1E4F22948];
      goto LABEL_15;
    }
  }
  id v21 = 0;
LABEL_16:

  return v21;
}

+ (id)_linkSubTypeForMediaSpecialization:(id)a3
{
  id v3 = a3;
  v4 = [v3 specialization];
  sub_1AFBAF124();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || ([v3 specialization],
        v6 = objc_claimAutoreleasedReturnValue(),
        sub_1AFBAF2EC(),
        char v7 = objc_opt_isKindOfClass(),
        v6,
        (v7 & 1) != 0))
  {
    char v8 = @"episode";
  }
  else
  {
    char v10 = [v3 specialization];
    sub_1AFBAF3D0();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      char v8 = @"season";
    }
    else
    {
      char v12 = [v3 specialization];
      sub_1AFBAF67C();
      char v13 = objc_opt_isKindOfClass();

      if (v13) {
        char v8 = @"bundle";
      }
      else {
        char v8 = 0;
      }
    }
  }

  return v8;
}

+ (id)_addressComponentStringsFromMapMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 address];

  if (v5)
  {
    v6 = [v3 address];
    [v4 addObject:v6];
  }
  char v7 = [v3 addressComponents];
  char v8 = [v7 street];

  if (v8)
  {
    v9 = [v7 street];
    [v4 addObject:v9];
  }
  char v10 = [v7 subLocality];

  if (v10)
  {
    char v11 = [v7 subLocality];
    [v4 addObject:v11];
  }
  char v12 = [v7 city];

  if (v12)
  {
    char v13 = [v7 city];
    [v4 addObject:v13];
  }
  char v14 = [v7 subAdministrativeArea];

  if (v14)
  {
    v15 = [v7 subAdministrativeArea];
    [v4 addObject:v15];
  }
  char v16 = [v7 state];

  if (v16)
  {
    v17 = [v7 state];
    [v4 addObject:v17];
  }
  char v18 = [v7 postalCode];

  if (v18)
  {
    v19 = [v7 postalCode];
    [v4 addObject:v19];
  }
  char v20 = [v7 country];

  if (v20)
  {
    id v21 = [v7 country];
    [v4 addObject:v21];
  }
  v22 = [v7 ISOCountryCode];

  if (v22)
  {
    v23 = [v7 ISOCountryCode];
    [v4 addObject:v23];
  }
  if ([v4 count]) {
    char v24 = (void *)[v4 copy];
  }
  else {
    char v24 = 0;
  }

  return v24;
}

+ (void)_insertURLDescription:(id)a3 metadataToUpdate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1AFBB008C;
  block[3] = &unk_1E5F8E798;
  id v7 = v6;
  id v9 = v7;
  if (qword_1E9AF80A8 != -1) {
    dispatch_once(&qword_1E9AF80A8, block);
  }
  if (qword_1E9AF80A0 == 1)
  {
    [v7 setUrlDescription:v5];
  }
  else if (!qword_1E9AF80A0)
  {
    [v7 setURLDescription:v5];
  }
}

+ (void)_indexLinkMetadata:(id)a3 metadataToUpdate:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 specialization];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2050000000;
  id v9 = (void *)qword_1E9AF8170;
  uint64_t v51 = qword_1E9AF8170;
  if (!qword_1E9AF8170)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1AFBB4D50;
    v47[3] = &unk_1E5F8EB38;
    v47[4] = &v48;
    sub_1AFBB4D50((uint64_t)v47);
    id v9 = (void *)v49[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v48, 8);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v7 setMessageType:@"loc"];
    char v12 = [v6 specialization];
    [a1 _insertLPType:*MEMORY[0x1E4F22930] subType:0 metadata:v7];
    char v13 = [v12 name];
    [a1 _insertURLDescription:v13 metadataToUpdate:v7];

    char v14 = [v12 addressComponents];
    v15 = [v14 postalCode];
    [v7 setPostalCode:v15];

    char v16 = [v12 addressComponents];
    v17 = [v16 city];
    [v7 setCity:v17];

    char v18 = [v12 addressComponents];
    v19 = [v18 state];
    [v7 setStateOrProvince:v19];

    char v20 = [v12 addressComponents];
    id v21 = [v20 country];
    [v7 setCountry:v21];

    v22 = [a1 _addressComponentStringsFromMapMetadata:v12];
    [v7 setAddresses:v22];

    v23 = [v12 category];

    if (v23)
    {
      char v24 = [v12 category];
      v52[0] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
      [v7 setAddressCategories:v25];
    }
  }
  else if ([a1 _isMediaSpecialization:v6])
  {
    char v26 = [a1 _linkTypeForMediaSpecialization:v6];
    v27 = [a1 _linkSubTypeForMediaSpecialization:v6];
    [a1 _insertLPType:v26 subType:v27 metadata:v7];

    char v28 = [v6 siteName];
    [a1 _insertURLDescription:v28 metadataToUpdate:v7];

    char v12 = [v6 specialization];
    if (objc_opt_respondsToSelector())
    {
      v29 = [v12 name];
      [v7 setLinkName:v29];
    }
    if (objc_opt_respondsToSelector())
    {
      char v30 = [v12 artist];
      [v7 setArtist:v30];
    }
    if (objc_opt_respondsToSelector())
    {
      v31 = [v12 artist];
      [v7 setArtist:v31];
    }
    if (objc_opt_respondsToSelector())
    {
      char v32 = [v12 album];
      [v7 setAlbum:v32];
    }
    if (objc_opt_respondsToSelector())
    {
      v33 = [v12 genre];
      [v7 setGenre:v33];
    }
    if (objc_opt_respondsToSelector())
    {
      v34 = [v12 curator];
      [v7 setCurator:v34];
    }
    if (objc_opt_respondsToSelector())
    {
      v35 = [v12 episodeName];
      [v7 setEpisode:v35];
    }
    if (objc_opt_respondsToSelector())
    {
      v36 = [v12 podcastName];
      [v7 setPodcastName:v36];
    }
    if (objc_opt_respondsToSelector())
    {
      v37 = [v12 releaseDate];
      [v7 setRecordingDate:v37];
    }
    v38 = [v6 appleSummary];
    [v7 setContentDescription:v38];
  }
  else
  {
    v39 = [v6 specialization];
    sub_1AFBAFA58();
    char v40 = objc_opt_isKindOfClass();

    if (v40)
    {
      [a1 _insertLPType:*MEMORY[0x1E4F22960] subType:0 metadata:v7];
      v41 = [v6 siteName];
      [a1 _insertURLDescription:v41 metadataToUpdate:v7];

      char v12 = [v6 specialization];
      v42 = [v12 title];
      [v7 setLinkName:v42];

      v43 = [v6 summary];
      [v7 setContentDescription:v43];
    }
    else
    {
      v44 = [v6 specialization];
      sub_1AFBAFB3C();
      char v45 = objc_opt_isKindOfClass();

      if (v45)
      {
        [a1 _insertLPType:*MEMORY[0x1E4F22948] subType:0 metadata:v7];
      }
      else
      {
        [v7 setMessageType:@"lnk"];
        [a1 _insertLPType:*MEMORY[0x1E4F22970] subType:0 metadata:v7];
      }
      v46 = [v6 title];
      [a1 _insertURLDescription:v46 metadataToUpdate:v7];

      char v12 = [v6 summary];
      [v7 setContentDescription:v12];
    }
  }
}

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v62 = a4;
  id v11 = a6;
  id v63 = a7;
  char v12 = [v10 objectForKey:@"balloonBundleID"];
  v65 = [v10 objectForKey:@"payloadData"];
  char v13 = [v10 objectForKeyedSubscript:@"knownSender"];
  int v14 = [v13 BOOLValue];

  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      char v16 = @"NO";
      if (v14) {
        char v16 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "known sender: %@", buf, 0xCu);
    }
  }
  if (v12) {
    int v17 = v14;
  }
  else {
    int v17 = 0;
  }
  if (v17 != 1
    || !v65
    || (uint64_t v18 = *MEMORY[0x1E4F6CC10], ([v12 isEqualToString:*MEMORY[0x1E4F6CC10]] & 1) == 0)
    && ![v12 isEqualToString:*MEMORY[0x1E4F6CBE8]])
  {
    v25 = [v10 objectForKey:@"service"];
    int v26 = [v25 isEqualToString:*MEMORY[0x1E4F6E1A0]];

    v27 = [v10 objectForKey:@"attributedBody"];
    id v21 = v27;
    if (v26)
    {
      uint64_t v28 = [v27 length];
      if (v21)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *MEMORY[0x1E4F6C1D0];
        if (objc_msgSend(v21, "attribute:existsInRange:", *MEMORY[0x1E4F6C1D0], 0, v28))
        {
          *(_OWORD *)buf = 0uLL;
          v31 = objc_msgSend(v21, "attribute:atIndex:longestEffectiveRange:inRange:", v30, 0, buf, 0, v29);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && *(_OWORD *)buf == __PAIR128__(v29, 0))
          {
            char v32 = [MEMORY[0x1E4F6EA28] sharedManager];
            int v33 = [v32 isDataDetectedLinkAllowedForSWY:v31];

            if (v33)
            {
              if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled]
                && IMOSLoggingEnabled())
              {
                v34 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v66 = 0;
                  _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Found a non-rich SMS link to index", v66, 2u);
                }
              }
              v35 = (void *)MEMORY[0x1E4F1CB10];
              v36 = [v31 absoluteString];
              v37 = [v35 URLWithString:v36];
              [v11 setURL:v37];

              [v11 setMessageType:@"lnk"];
              v38 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
              v39 = [a1 lpHasRichMediaCustomKey];
              [v11 setValue:v38 forCustomKey:v39];
            }
          }
        }
      }
    }
    else
    {
      char v40 = IMDCoreSpotlightURLFromAttributedMessageBody(v27);
      if (v40)
      {
        v41 = [MEMORY[0x1E4F6EA28] sharedManager];
        int v42 = [v41 isDataDetectedLinkAllowedForSWY:v40];

        if (v42)
        {
          [v11 setURL:v40];
          [v11 setMessageType:@"lnk"];
          v43 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
          v44 = [a1 lpHasRichMediaCustomKey];
          [v11 setValue:v43 forCustomKey:v44];
        }
      }
    }
    goto LABEL_53;
  }
  if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v12;
      _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Indexing balloon with bundle ID %@", buf, 0xCu);
    }
  }
  if ([v12 isEqualToString:v18])
  {
    if ([MEMORY[0x1E4F6E700] verboseLoggingEnabled] && IMOSLoggingEnabled())
    {
      char v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Found a rich link to index", buf, 2u);
      }
    }
    id v21 = [v10 objectForKey:@"attributedBody"];
    v22 = IMDCoreSpotlightURLFromAttributedMessageBody(v21);
    v61 = [v22 absoluteString];

    v23 = (void *)[a1 _newSummaryTextForPayloadData:v65 item:v10];
    if ([v23 length] || !v61)
    {
      if (!v23)
      {
        if (IMOSLoggingEnabled())
        {
          v56 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AFB53000, v56, OS_LOG_TYPE_INFO, "IMDCoreSpotlightMessageBalloonPluginIndexer - Failed to get summary text", buf, 2u);
          }
        }
        v23 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      id v24 = v61;

      v23 = v24;
    }
    [v11 setTextContent:v23];
    char v45 = [a1 lpDescriptionCustomKey];
    [v11 setValue:v23 forCustomKey:v45];

    [v11 setMessageType:@"lnk"];
LABEL_48:
    v60 = _IMDCoreSpotlightStrippedBody(v10, @"plainBody", v61);
    v59 = [MEMORY[0x1E4F1CB10] URLWithString:v60];
    v46 = [a1 _pluginPayloadAttachmentPathsForItem:v10];
    id v68 = 0;
    id v69 = 0;
    id v67 = 0;
    int v47 = [a1 _richLinkPluginHasRichContentForItem:v10 attachmentPaths:v46 originalURL:v59 outURL:&v69 outTitle:&v68 outLPMetadata:&v67];
    id v48 = v69;
    id v57 = v68;
    id v49 = v67;
    if (v47)
    {
      uint64_t v50 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", 1, v57);
      uint64_t v51 = [a1 lpHasRichMediaCustomKey];
      [v11 setValue:v50 forCustomKey:v51];

      v52 = [a1 lpPluginPathsCustomKey];
      [v11 setValue:v46 forCustomKey:v52];
    }
    if (v48)
    {
      v53 = (void *)MEMORY[0x1E4F1CB10];
      v54 = [v48 absoluteString];
      v55 = [v53 URLWithString:v54];
      [v11 setURL:v55];
    }
    objc_msgSend(a1, "_indexLinkMetadata:metadataToUpdate:", v49, v11, v57);

LABEL_53:
  }
}

+ (id)lpDescriptionCustomKey
{
  if (qword_1E9AF80B8 != -1) {
    dispatch_once(&qword_1E9AF80B8, &unk_1F084D358);
  }
  v2 = (void *)qword_1E9AF80B0;
  return v2;
}

+ (id)_newSummaryTextForPayloadData:(id)a3 item:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F6E718];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setData:v7];

  id v9 = [v6 objectForKey:@"guid"];
  [v8 setMessageGUID:v9];
  id v10 = [v6 objectForKey:@"flags"];

  unint64_t v11 = ((unint64_t)[v10 unsignedLongLongValue] >> 2) & 1;
  [v8 setIsFromMe:v11];
  char v12 = [MEMORY[0x1E4F6E9A8] previewSummaryWithPluginPayload:v8];
  char v13 = (void *)[v12 copy];

  return v13;
}

+ (id)_pluginPayloadAttachmentPathsForItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"attachments"];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", @"path", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)_richLinkPluginHasRichContentForItem:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5 outURL:(id *)a6 outTitle:(id *)a7 outLPMetadata:(id *)a8
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = MEMORY[0x1B3E89B10](@"LPLinkMetadataPresentationTransformer", @"LinkPresentation");
  if (v15)
  {
    char v16 = (objc_class *)v15;
    id v49 = a7;
    uint64_t v51 = a8;
    uint64_t v17 = [v12 objectForKey:@"payloadData"];
    id v18 = objc_alloc_init(MEMORY[0x1E4F6E718]);
    uint64_t v50 = (void *)v17;
    [v18 setData:v17];
    id v48 = [v12 objectForKey:@"guid"];
    objc_msgSend(v18, "setMessageGUID:");
    v19 = [v12 objectForKey:@"flags"];
    unint64_t v20 = ((unint64_t)[v19 unsignedLongLongValue] >> 2) & 1;

    [v18 setIsFromMe:v20];
    id v54 = v14;
    [v18 setUrl:v14];
    id v21 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v52 = v13;
    id v22 = v13;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v56 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v55 + 1) + 8 * i)];
          uint64_t v28 = v27;
          if (v21 && v27) {
            CFArrayAppendValue(v21, v27);
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v24);
    }

    [v18 setAttachments:v21];
    uint64_t v29 = [MEMORY[0x1E4F6E9A8] linkMetadataForPluginPayload:v18];
    uint64_t v30 = (void *)[v29 copy];

    id v31 = objc_alloc_init(v16);
    [v31 setMetadata:v30];
    [v31 setComplete:1];
    [v31 setPreferredSizeClass:5];
    char v32 = [v30 URL];
    int v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      uint64_t v36 = [v30 originalURL];
      v37 = (void *)v36;
      v38 = v14;
      if (v36) {
        v38 = (void *)v36;
      }
      id v34 = v38;
    }
    [v31 setURL:v34];
    char v35 = [v31 hasMedia];
    v39 = [v31 originalURL];
    id v40 = v39;
    if (v39)
    {
      v41 = [v39 scheme];
      uint64_t v42 = [v41 length];

      if (!v42)
      {
        v46 = (void *)MEMORY[0x1E4F1CB10];
        v43 = [v40 absoluteString];
        v44 = [@"https://" stringByAppendingString:v43];
        uint64_t v47 = [v46 URLWithString:v44];

        id v40 = (id)v47;
      }
      id v13 = v52;
      if (a6 && v40)
      {
        id v40 = v40;
        *a6 = v40;
      }
    }
    else
    {
      id v13 = v52;
    }
    if (v49)
    {
      id *v49 = [v30 title];
    }
    if (v51) {
      *uint64_t v51 = v30;
    }

    id v14 = v54;
  }
  else
  {
    char v35 = 0;
  }

  return v35;
}

+ (id)lpHasRichMediaCustomKey
{
  if (qword_1E9AF80C8 != -1) {
    dispatch_once(&qword_1E9AF80C8, &unk_1F084D378);
  }
  v2 = (void *)qword_1E9AF80C0;
  return v2;
}

+ (id)lpPluginPathsCustomKey
{
  if (qword_1E9AF80D8 != -1) {
    dispatch_once(&qword_1E9AF80D8, &unk_1F084C280);
  }
  v2 = (void *)qword_1E9AF80D0;
  return v2;
}

@end