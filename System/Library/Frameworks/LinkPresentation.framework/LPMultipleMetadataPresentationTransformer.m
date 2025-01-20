@interface LPMultipleMetadataPresentationTransformer
- (LPMultipleMetadataPresentationTransformer)initWithMetadata:(id)a3;
- (id)_summaryCounts;
- (id)_summarySubtitle;
- (id)summary;
- (id)summaryImages;
- (id)summaryMetadata;
- (unint64_t)preferredSizeClass;
- (void)setPreferredSizeClass:(unint64_t)a3;
@end

@implementation LPMultipleMetadataPresentationTransformer

- (LPMultipleMetadataPresentationTransformer)initWithMetadata:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)LPMultipleMetadataPresentationTransformer;
  v6 = [(LPMultipleMetadataPresentationTransformer *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metadata, a3);
    uint64_t v8 = [(LPMultipleMetadataPresentationTransformer *)v7 _summaryCounts];
    summaryCounts = v7->_summaryCounts;
    v7->_summaryCounts = (NSDictionary *)v8;

    v7->_hasOnlyFiles = 1;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = v7->_metadata;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "originalURL", (void)v23);
          v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [v14 URL];
          }
          v18 = v17;

          v19 = [v14 specialization];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
          }
          else
          {
            char v20 = [v18 isFileURL];

            if ((v20 & 1) == 0) {
              v7->_hasOnlyFiles = 0;
            }
          }
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    v21 = v7;
  }

  return v7;
}

- (id)_summaryCounts
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__LPMultipleMetadataPresentationTransformer__summaryCounts__block_invoke;
  aBlock[3] = &unk_1E5B071A8;
  id v23 = v2;
  id v30 = v23;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = self->_metadata;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "specialization", v23);
        if (v9
          && ([v8 specialization],
              v10 = objc_claimAutoreleasedReturnValue(),
              int v11 = [v10 conformsToProtocol:&unk_1EF725E28],
              v10,
              v9,
              v11))
        {
          uint64_t v12 = [v8 specialization];
          uint64_t v13 = [v12 summaryTypeForTransformer:self];

          v3[2](v3, v13);
        }
        else
        {
          v14 = [v8 originalURL];
          if (v14 || ([v8 URL], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if ([v14 isFileURL]) {
              uint64_t v15 = 2;
            }
            else {
              uint64_t v15 = 0;
            }
            v3[2](v3, v15);
          }
          else
          {
            v16 = [v8 image];
            if (v16)
            {

              uint64_t v17 = 1;
            }
            else
            {
              v18 = [v8 alternateImages];
              BOOL v19 = v18 == 0;

              if (v19) {
                uint64_t v17 = 3;
              }
              else {
                uint64_t v17 = 1;
              }
            }
            v14 = 0;
            v3[2](v3, v17);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }

  id v21 = v23;
  return v21;
}

void __59__LPMultipleMetadataPresentationTransformer__summaryCounts__block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithInteger:a2];
  id v9 = [v4 objectForKey:v5];

  if (v9)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") + 1);

    id v10 = (id)v6;
  }
  else
  {
    id v10 = &unk_1EF7128B8;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [NSNumber numberWithInteger:a2];
  [v7 setObject:v10 forKey:v8];
}

- (id)summary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  summaryCounts = self->_summaryCounts;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke;
  v8[3] = &unk_1E5B071D0;
  id v5 = v3;
  id v9 = v5;
  [(NSDictionary *)summaryCounts enumerateKeysAndObjectsUsingBlock:v8];
  [v5 sortUsingComparator:&__block_literal_global_27];
  uint64_t v6 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v5];

  return v6;
}

void __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  switch([v12 intValue])
  {
    case 0u:
      uint64_t v6 = NSString;
      uint64_t v7 = LPLocalizedString(@"%ld Link(s)");
      uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
      goto LABEL_5;
    case 1u:
      id v9 = NSString;
      uint64_t v7 = LPLocalizedString(@"%ld Image(s)");
      uint64_t v8 = objc_msgSend(v9, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
      goto LABEL_5;
    case 2u:
      id v10 = NSString;
      uint64_t v7 = LPLocalizedString(@"%ld Document(s)");
      uint64_t v8 = objc_msgSend(v10, "stringWithFormat:", v7, objc_msgSend(v5, "longValue"));
LABEL_5:
      int v11 = (void *)v8;

      break;
    case 3u:
      int v11 = LPLocalizedString(@"Plain Text");
      break;
    default:
      int v11 = 0;
      break;
  }
  [*(id *)(a1 + 32) addObject:v11];
}

uint64_t __52__LPMultipleMetadataPresentationTransformer_summary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 localizedStandardCompare:a2];
}

- (id)summaryImages
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[LPResources fileIcon];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[LPResources safariIcon];
  }
  uint64_t v6 = v5;

  if (self->_hasOnlyFiles && sizeClassPrefersPlaceholderIconForMultipleFiles(self->_preferredSizeClass))
  {
    if ([(NSArray *)self->_metadata count] < 2)
    {
      uint64_t v32 = v6;
      uint64_t v7 = &v32;
      uint64_t v8 = 1;
    }
    else
    {
      v33[0] = v6;
      v33[1] = v6;
      uint64_t v7 = (void **)v33;
      uint64_t v8 = 2;
    }
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:v8];
    goto LABEL_29;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = self->_metadata;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "specialization", (void)v27);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v17 = [v14 image];
          BOOL v18 = v17 == 0;

          if (v18)
          {
            [v9 addObject:v6];
            continue;
          }
LABEL_15:
          BOOL v19 = [v14 image];
          [v9 addObject:v19];
          goto LABEL_22;
        }
        uint64_t v20 = [v14 icon];

        if (v20)
        {
          BOOL v19 = [v14 icon];
          [v9 addObject:v19];
          goto LABEL_22;
        }
        id v21 = [v14 image];

        if (v21) {
          goto LABEL_15;
        }
        v22 = [v14 alternateImages];
        BOOL v23 = [v22 count] == 0;

        if (v23) {
          continue;
        }
        BOOL v19 = [v14 alternateImages];
        long long v24 = [v19 firstObject];
        [v9 addObject:v24];

LABEL_22:
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  if (![v9 count])
  {
    long long v25 = +[LPResources safariIcon];
    [v9 addObject:v25];
  }
LABEL_29:

  return v9;
}

- (id)_summarySubtitle
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_hasOnlyFiles) {
    goto LABEL_12;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = self->_metadata;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v4)
  {

LABEL_12:
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__LPMultipleMetadataPresentationTransformer__summarySubtitle__block_invoke;
    aBlock[3] = &unk_1E5B07218;
    id v12 = v11;
    id v29 = v12;
    uint64_t v13 = (void (**)(void *, void *))_Block_copy(aBlock);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_metadata;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (!v15) {
      goto LABEL_25;
    }
    uint64_t v16 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        BOOL v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        BOOL v19 = objc_msgSend(v18, "originalURL", (void)v24);
        uint64_t v20 = v19;
        if (v19)
        {
          if ([v19 isFileURL]) {
            goto LABEL_23;
          }
          id v21 = objc_msgSend(v20, "_lp_simplifiedDisplayString");
          v13[2](v13, v21);
        }
        else
        {
          v22 = [v18 summary];

          if (!v22) {
            goto LABEL_23;
          }
          id v21 = [v18 summary];
          v13[2](v13, v21);
        }

LABEL_23:
      }
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (!v15)
      {
LABEL_25:

        if ([v12 count])
        {
          id v10 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v12];
        }
        else
        {
          id v10 = 0;
        }

        goto LABEL_29;
      }
    }
  }
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v31;
  do
  {
    for (uint64_t j = 0; j != v4; ++j)
    {
      if (*(void *)v31 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = [*(id *)(*((void *)&v30 + 1) + 8 * j) specialization];
      uint64_t v9 = [v8 size];

      v5 += v9;
    }
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  }
  while (v4);

  if (!v5) {
    goto LABEL_12;
  }
  id v10 = [MEMORY[0x1E4F28B68] stringFromByteCount:v5 countStyle:0];
LABEL_29:

  return v10;
}

void __61__LPMultipleMetadataPresentationTransformer__summarySubtitle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)summaryMetadata
{
  if ([(NSArray *)self->_metadata count] == 1)
  {
    id v3 = [(NSArray *)self->_metadata firstObject];
  }
  else
  {
    id v3 = objc_alloc_init(LPLinkMetadata);
    uint64_t v4 = [(LPMultipleMetadataPresentationTransformer *)self summary];
    [(LPLinkMetadata *)v3 setTitle:v4];

    uint64_t v5 = [(LPMultipleMetadataPresentationTransformer *)self _summarySubtitle];
    [(LPLinkMetadata *)v3 setSummary:v5];

    uint64_t v6 = [(LPMultipleMetadataPresentationTransformer *)self summaryImages];
    if ([v6 count])
    {
      uint64_t v7 = [v6 firstObject];
      [(LPLinkMetadata *)v3 setIcon:v7];
    }
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      [(LPLinkMetadata *)v3 setAlternateImages:v8];
    }
    uint64_t v9 = objc_alloc_init(LPSummarizedLinkMetadata);
    [(LPLinkMetadata *)v3 setSpecialization:v9];
  }

  return v3;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (void)setPreferredSizeClass:(unint64_t)a3
{
  self->_preferredSizeClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCounts, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end