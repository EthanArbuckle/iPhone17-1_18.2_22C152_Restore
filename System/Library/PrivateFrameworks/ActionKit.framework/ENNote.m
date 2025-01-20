@interface ENNote
- (BOOL)isReminder;
- (BOOL)validateForLimits;
- (EDAMNote)serviceNote;
- (ENNote)init;
- (ENNote)initWithServiceNote:(id)a3;
- (ENNoteContent)content;
- (NSArray)resources;
- (NSArray)tagNames;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)edamAttributes;
- (NSString)cachedENMLContent;
- (NSString)sourceUrl;
- (NSString)title;
- (id)EDAMNote;
- (id)EDAMNoteToReplaceServiceNoteGUID:(id)a3;
- (id)enmlContent;
- (void)addResource:(id)a3;
- (void)generateHTMLData:(id)a3;
- (void)generateWebArchiveData:(id)a3;
- (void)invalidateCachedENML;
- (void)removeAllResources;
- (void)setCachedENMLContent:(id)a3;
- (void)setContent:(id)a3;
- (void)setEdamAttributes:(id)a3;
- (void)setIsReminder:(BOOL)a3;
- (void)setResources:(id)a3;
- (void)setServiceNote:(id)a3;
- (void)setSourceUrl:(id)a3;
- (void)setTagNames:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ENNote

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edamAttributes, 0);
  objc_storeStrong((id *)&self->_serviceNote, 0);
  objc_storeStrong((id *)&self->_cachedENMLContent, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_tagNames, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

- (void)setEdamAttributes:(id)a3
{
}

- (NSDictionary)edamAttributes
{
  return self->_edamAttributes;
}

- (void)setServiceNote:(id)a3
{
}

- (EDAMNote)serviceNote
{
  return self->_serviceNote;
}

- (void)setCachedENMLContent:(id)a3
{
}

- (NSString)cachedENMLContent
{
  return self->_cachedENMLContent;
}

- (void)setSourceUrl:(id)a3
{
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setIsReminder:(BOOL)a3
{
  self->_isReminder = a3;
}

- (BOOL)isReminder
{
  return self->_isReminder;
}

- (NSArray)tagNames
{
  return self->_tagNames;
}

- (ENNoteContent)content
{
  return self->_content;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)validateForLimits
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(ENNote *)self enmlContent];
  unint64_t v4 = [v3 length];
  if (v4 < +[EDAMLimitsConstants EDAM_NOTE_CONTENT_LEN_MIN])
  {

LABEL_4:
    v8 = +[ENSession sharedSession];
    v9 = [v8 logger];
    v10 = [NSString stringWithFormat:@"Note fails validation for content length: %@", self];
    [v9 evernoteLogInfoString:v10];

    return 0;
  }
  v5 = [(ENNote *)self enmlContent];
  unint64_t v6 = [v5 length];
  int v7 = +[EDAMLimitsConstants EDAM_NOTE_CONTENT_LEN_MAX];

  if (v6 > v7) {
    goto LABEL_4;
  }
  int v12 = +[EDAMLimitsConstants EDAM_RESOURCE_SIZE_MAX_FREE];
  v13 = +[ENSession sharedSession];
  int v14 = [v13 isPremiumUser];

  if (v14) {
    int v12 = +[EDAMLimitsConstants EDAM_RESOURCE_SIZE_MAX_PREMIUM];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v15 = [(ENNote *)self resources];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = v12;
    uint64_t v19 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = [*(id *)(*((void *)&v27 + 1) + 8 * i) data];
        unint64_t v22 = [v21 length];

        if (v22 > v18)
        {
          v23 = +[ENSession sharedSession];
          v24 = [v23 logger];
          v25 = [NSString stringWithFormat:@"Note fails validation for resource length: %@", self];
          [v24 evernoteLogInfoString:v25];

          BOOL v11 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (id)EDAMNoteToReplaceServiceNoteGUID:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v51 = a3;
  unint64_t v4 = [(ENNote *)self serviceNote];
  if (!v4) {
    goto LABEL_4;
  }
  v5 = [(ENNote *)self serviceNote];
  unint64_t v6 = [v5 guid];
  int v7 = [v6 isEqualToString:v51];

  if (v7)
  {
    v8 = [(ENNote *)self serviceNote];
    v9 = (EDAMNote *)[v8 copy];

    [(EDAMNote *)v9 setGuid:0];
    [(EDAMNote *)v9 setNotebookGuid:0];
    [(EDAMNote *)v9 setUpdateSequenceNum:0];
  }
  else
  {
LABEL_4:
    v9 = objc_alloc_init(EDAMNote);
  }
  v10 = [(ENNote *)self enmlContent];
  [(EDAMNote *)v9 setContent:v10];

  BOOL v11 = [(EDAMNote *)v9 content];

  if (!v11)
  {
    int v12 = +[ENNoteContent noteContentWithString:&stru_26F008428];
    v13 = [v12 enmlWithNote:self];
    [(EDAMNote *)v9 setContent:v13];
  }
  [(EDAMNote *)v9 setContentHash:0];
  [(EDAMNote *)v9 setContentLength:0];
  int v14 = [(ENNote *)self title];
  [(EDAMNote *)v9 setTitle:v14];

  v15 = [(EDAMNote *)v9 title];

  if (!v15) {
    [(EDAMNote *)v9 setTitle:@"Untitled Note"];
  }
  uint64_t v16 = [(EDAMNote *)v9 attributes];

  if (!v16)
  {
    uint64_t v17 = objc_alloc_init(EDAMNoteAttributes);
    [(EDAMNote *)v9 setAttributes:v17];
  }
  unint64_t v18 = +[ENSession sharedSession];
  v52 = [v18 sourceApplication];

  uint64_t v19 = [(EDAMNote *)v9 attributes];
  [v19 setSourceApplication:v52];

  v20 = [(EDAMNote *)v9 attributes];
  [v20 setSource:@"mobile.ios"];

  BOOL v21 = [(ENNote *)self isReminder];
  unint64_t v22 = [(EDAMNote *)v9 attributes];
  v23 = v22;
  if (v21)
  {
    v24 = [v22 reminderOrder];

    if (v24) {
      goto LABEL_16;
    }
    v25 = NSNumber;
    v23 = [MEMORY[0x263EFF910] date];
    [v23 timeIntervalSince1970];
    long long v27 = [v25 numberWithDouble:v26 * 1000.0];
    long long v28 = [(EDAMNote *)v9 attributes];
    [v28 setReminderOrder:v27];
  }
  else
  {
    [v22 setReminderOrder:0];
  }

LABEL_16:
  long long v29 = [(ENNote *)self sourceUrl];

  if (v29)
  {
    long long v30 = [(ENNote *)self sourceUrl];
    v31 = [(EDAMNote *)v9 attributes];
    [v31 setSourceURL:v30];
  }
  uint64_t v32 = [(ENNote *)self tagNames];

  if (v32)
  {
    v33 = [(ENNote *)self tagNames];
    v34 = (void *)[v33 mutableCopy];
    [(EDAMNote *)v9 setTagNames:v34];
  }
  v35 = [MEMORY[0x263EFF980] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v36 = [(ENNote *)self resources];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v36);
        }
        v40 = [*(id *)(*((void *)&v57 + 1) + 8 * i) EDAMResource];
        if (v40) {
          [v35 addObject:v40];
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v37);
  }

  [(EDAMNote *)v9 setResources:v35];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v41 = [(ENNote *)self edamAttributes];
  v42 = [v41 allKeys];

  uint64_t v43 = [v42 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        v47 = [(ENNote *)self edamAttributes];
        v48 = [v47 valueForKey:v46];

        v49 = [(EDAMNote *)v9 attributes];
        [v49 setValue:v48 forKey:v46];
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v43);
  }

  return v9;
}

- (id)EDAMNote
{
  return [(ENNote *)self EDAMNoteToReplaceServiceNoteGUID:0];
}

- (void)setResources:(id)a3
{
  unint64_t v4 = [MEMORY[0x263EFF980] arrayWithArray:a3];
  resources = self->_resources;
  self->_resources = v4;
}

- (id)enmlContent
{
  v3 = [(ENNote *)self cachedENMLContent];

  if (!v3)
  {
    unint64_t v4 = [(ENNote *)self content];
    v5 = [v4 enmlWithNote:self];
    [(ENNote *)self setCachedENMLContent:v5];
  }
  return [(ENNote *)self cachedENMLContent];
}

- (void)invalidateCachedENML
{
}

- (void)generateHTMLData:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v31 = v4;
    uint64_t v6 = [(ENNote *)self enmlContent];
    if (!v6)
    {
      int v7 = +[ENNoteContent noteContentWithString:&stru_26F008428];
      uint64_t v6 = [v7 enmlWithNote:self];
    }
    long long v30 = (void *)v6;
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [(ENNote *)self resources];
    v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v11 = [(ENNote *)self resources];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v17 = [v16 EDAMResource];
          unint64_t v18 = [v17 attributes];
          uint64_t v19 = [v18 sourceURL];

          if (!v19)
          {
            v20 = [v16 dataHash];
            BOOL v21 = [v20 enlowercaseHexDigits];

            unint64_t v22 = [v16 mimeType];
            v23 = +[ENMIMEUtils fileExtensionForMIMEType:v22];

            v24 = [NSString stringWithFormat:@"http://example.com/%@.%@", v21, v23];
            v25 = [v17 attributes];
            [v25 setSourceURL:v24];
          }
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v13);
    }

    double v26 = objc_alloc_init(ENMLUtility);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __27__ENNote_generateHTMLData___block_invoke;
    v32[3] = &unk_264E5B5E8;
    v5 = v31;
    id v33 = v31;
    [(ENMLUtility *)v26 generateHTMLFromENML:v30 referencedResources:v10 completion:v32];
  }
  else
  {
    long long v27 = +[ENSession sharedSession];
    long long v28 = [v27 logger];
    long long v29 = [NSString stringWithFormat:@"-generateHTMLData: requires a completion handler!"];
    [v28 evernoteLogErrorString:v29];
  }
}

void __27__ENNote_generateHTMLData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [a2 dataUsingEncoding:4];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    int v7 = +[ENSession sharedSession];
    v8 = [v7 logger];
    v9 = [NSString stringWithFormat:@"+webArchiveData failed to convert ENML to HTML: %@", v10];
    [v8 evernoteLogInfoString:v9];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)generateWebArchiveData:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v38 = v4;
    uint64_t v6 = [(ENNote *)self enmlContent];
    if (!v6)
    {
      int v7 = +[ENNoteContent noteContentWithString:&stru_26F008428];
      uint64_t v6 = [v7 enmlWithNote:self];
    }
    long long v37 = (void *)v6;
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [(ENNote *)self resources];
    id v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v36 = self;
    BOOL v11 = [(ENNote *)self resources];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v17 = [v16 EDAMResource];
          unint64_t v18 = [v17 attributes];
          uint64_t v19 = [v18 sourceURL];

          if (!v19)
          {
            v20 = [v16 dataHash];
            BOOL v21 = [v20 enlowercaseHexDigits];

            unint64_t v22 = [v16 mimeType];
            v23 = +[ENMIMEUtils fileExtensionForMIMEType:v22];

            v24 = [NSString stringWithFormat:@"http://example.com/%@.%@", v21, v23];
            v25 = [v17 attributes];
            [v25 setSourceURL:v24];
          }
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v13);
    }

    double v26 = objc_alloc_init(ENMLUtility);
    long long v27 = [(ENNote *)v36 sourceUrl];
    if (v27)
    {
      long long v28 = NSURL;
      long long v29 = [(ENNote *)v36 sourceUrl];
      long long v30 = [v28 URLWithString:v29];
    }
    else
    {
      long long v30 = 0;
    }

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __33__ENNote_generateWebArchiveData___block_invoke;
    v39[3] = &unk_264E5A7B8;
    uint64_t v5 = v38;
    id v41 = v10;
    id v42 = v38;
    id v40 = v30;
    id v34 = v10;
    id v35 = v30;
    [(ENMLUtility *)v26 generateHTMLFromENML:v37 referencedResources:v34 completion:v39];
  }
  else
  {
    v31 = +[ENSession sharedSession];
    uint64_t v32 = [v31 logger];
    id v33 = [NSString stringWithFormat:@"-generateWebArchiveData: requires a completion handler!"];
    [v32 evernoteLogErrorString:v33];
  }
}

void __33__ENNote_generateWebArchiveData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v30 = v5;
    long long v28 = [a2 dataUsingEncoding:4];
    long long v27 = [[ENWebResource alloc] initWithData:v28 URL:*(void *)(a1 + 32) MIMEType:@"text/html" textEncodingName:@"UTF-8" frameName:0];
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v29 = a1;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
          uint64_t v12 = [ENWebResource alloc];
          uint64_t v13 = [v11 data];
          uint64_t v14 = [v13 body];
          v15 = NSURL;
          uint64_t v16 = [v11 attributes];
          uint64_t v17 = [v16 sourceURL];
          unint64_t v18 = [v15 URLWithString:v17];
          uint64_t v19 = [v11 mime];
          v20 = [(ENWebResource *)v12 initWithData:v14 URL:v18 MIMEType:v19 textEncodingName:0 frameName:0];

          [v32 addObject:v20];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    BOOL v21 = [[ENWebArchive alloc] initWithMainResource:v27 subresources:v32 subframeArchives:0];
    uint64_t v22 = *(void *)(v29 + 48);
    v23 = [(ENWebArchive *)v21 data];
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

    uint64_t v6 = v30;
  }
  else
  {
    v24 = +[ENSession sharedSession];
    v25 = [v24 logger];
    double v26 = [NSString stringWithFormat:@"+webArchiveData failed to convert ENML to HTML: %@", v6];
    [v25 evernoteLogInfoString:v26];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)removeAllResources
{
  [(NSMutableArray *)self->_resources removeAllObjects];
  [(ENNote *)self invalidateCachedENML];
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    unint64_t v5 = [(NSMutableArray *)self->_resources count];
    if (v5 >= +[EDAMLimitsConstants EDAM_NOTE_RESOURCES_MAX])
    {
      uint64_t v6 = +[ENSession sharedSession];
      uint64_t v7 = [v6 logger];
      uint64_t v8 = [NSString stringWithFormat:@"Too many resources already on note. Ignoring %@. Note %@.", v9, self];
      [v7 evernoteLogInfoString:v8];
    }
    else
    {
      [(ENNote *)self invalidateCachedENML];
      [(NSMutableArray *)self->_resources addObject:v9];
    }
    id v4 = v9;
  }
}

- (NSArray)resources
{
  v2 = (void *)[(NSMutableArray *)self->_resources copy];
  return (NSArray *)v2;
}

- (NSDate)creationDate
{
  v2 = (void *)MEMORY[0x263EFF910];
  v3 = [(ENNote *)self serviceNote];
  id v4 = [v3 created];
  unint64_t v5 = objc_msgSend(v2, "dateWithEDAMTimestamp:", objc_msgSend(v4, "longValue"));

  return (NSDate *)v5;
}

- (NSDate)modificationDate
{
  v2 = (void *)MEMORY[0x263EFF910];
  v3 = [(ENNote *)self serviceNote];
  id v4 = [v3 updated];
  unint64_t v5 = objc_msgSend(v2, "dateWithEDAMTimestamp:", objc_msgSend(v4, "longValue"));

  return (NSDate *)v5;
}

- (void)setTagNames:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v12 = +[EDAMLimitsConstants EDAM_TAG_NAME_REGEX];
        uint64_t v13 = objc_msgSend(v11, "en_scrubUsingRegex:withMinLength:maxLength:", v12, (unsigned __int16)+[EDAMLimitsConstants EDAM_TAG_NAME_LEN_MIN](EDAMLimitsConstants, "EDAM_TAG_NAME_LEN_MIN"), (unsigned __int16)+[EDAMLimitsConstants EDAM_TAG_NAME_LEN_MAX](EDAMLimitsConstants, "EDAM_TAG_NAME_LEN_MAX"));

        if (v13) {
          [v5 addObject:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    uint64_t v14 = v5;
  }
  else {
    uint64_t v14 = 0;
  }
  objc_storeStrong((id *)&self->_tagNames, v14);
}

- (void)setContent:(id)a3
{
  id v4 = (ENNoteContent *)a3;
  [(ENNote *)self invalidateCachedENML];
  content = self->_content;
  self->_content = v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v7 = +[EDAMLimitsConstants EDAM_NOTE_TITLE_REGEX];
  objc_msgSend(v4, "en_scrubUsingRegex:withMinLength:maxLength:", v7, (unsigned __int16)+[EDAMLimitsConstants EDAM_NOTE_TITLE_LEN_MIN](EDAMLimitsConstants, "EDAM_NOTE_TITLE_LEN_MIN"), (unsigned __int16)+[EDAMLimitsConstants EDAM_NOTE_TITLE_LEN_MAX](EDAMLimitsConstants, "EDAM_NOTE_TITLE_LEN_MAX"));
  unint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  title = self->_title;
  self->_title = v5;
}

- (ENNote)initWithServiceNote:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ENNote;
  unint64_t v5 = [(ENNote *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 title];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 content];
    uint64_t v9 = +[ENNoteContent noteContentWithENML:v8];
    content = v5->_content;
    v5->_content = (ENNoteContent *)v9;

    BOOL v11 = [v4 attributes];
    uint64_t v12 = [v11 reminderOrder];
    v5->_isReminder = v12 != 0;

    uint64_t v13 = [v4 attributes];
    uint64_t v14 = [v13 sourceURL];
    sourceUrl = v5->_sourceUrl;
    v5->_sourceUrl = (NSString *)v14;

    uint64_t v16 = [v4 tagNames];
    tagNames = v5->_tagNames;
    v5->_tagNames = (NSArray *)v16;

    long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resources = v5->_resources;
    v5->_resources = v18;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v20 = objc_msgSend(v4, "resources", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = +[ENResource resourceWithServiceResource:*(void *)(*((void *)&v30 + 1) + 8 * v24)];
          if (v25) {
            [(NSMutableArray *)v5->_resources addObject:v25];
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v22);
    }

    double v26 = (void *)[v4 copy];
    [(ENNote *)v5 setServiceNote:v26];

    long long v27 = [(ENNote *)v5 serviceNote];
    [v27 setContent:0];

    long long v28 = [(ENNote *)v5 serviceNote];
    [v28 setResources:0];
  }
  return v5;
}

- (ENNote)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENNote;
  v2 = [(ENNote *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    resources = v2->_resources;
    v2->_resources = v3;
  }
  return v2;
}

@end