@interface MSFavoriteItem(MapsSuggestionsMapsSyncShortcutStorage)
+ (id)favoriteItemWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage;
- (void)updateWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage didChange:;
@end

@implementation MSFavoriteItem(MapsSuggestionsMapsSyncShortcutStorage)

+ (id)favoriteItemWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 storageIdentifier];

  if (!v4)
  {
    v5 = [v3 identifierForStorage];
    [v3 setStorageIdentifier:v5];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F74308]);
  [v6 setVersion:0];
  objc_msgSend(v6, "setType:", (__int16)objc_msgSend(v3, "type"));
  v7 = [v3 storageIdentifier];
  [v6 setIdentifier:v7];

  v8 = [v3 identifier];
  [v6 setShortcutIdentifier:v8];

  MapsSuggestionsMapsSyncSimulateCrashIfMapItemIsNil(v3);
  v9 = [v3 geoMapItem];
  [v6 setMapItemStorage:v9];

  v10 = [v3 customName];
  [v6 setCustomName:v10];

  objc_msgSend(v6, "setHidden:", objc_msgSend(v3, "isHidden"));
  v11 = [v3 originatingAddressString];
  [v6 setOriginatingAddressString:v11];

  objc_msgSend(v6, "setSource:", (__int16)objc_msgSend(v3, "source"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = objc_msgSend(v3, "contacts", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) handleValue];
        [v6 addContactHandle:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v6;
}

- (void)updateWithShortcut:()MapsSuggestionsMapsSyncShortcutStorage didChange:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *a4 = 0;
  MapsSuggestionsMapsSyncSimulateCrashIfMapItemIsNil(v6);
  v7 = [a1 muid];
  v8 = NSNumber;
  v9 = [v6 geoMapItem];
  v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "_muid"));
  char v11 = [v7 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    v12 = NSNumber;
    uint64_t v13 = [v6 geoMapItem];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "_muid"));
    [a1 setMuid:v14];

    *a4 = 1;
  }
  uint64_t v15 = [a1 latitude];
  v16 = NSNumber;
  v17 = [v6 geoMapItem];
  [v17 coordinate];
  v18 = objc_msgSend(v16, "numberWithDouble:");
  char v19 = [v15 isEqual:v18];

  if ((v19 & 1) == 0)
  {
    long long v20 = NSNumber;
    long long v21 = [v6 geoMapItem];
    [v21 coordinate];
    long long v22 = objc_msgSend(v20, "numberWithDouble:");
    [a1 setLatitude:v22];

    *a4 = 1;
  }
  v23 = [a1 longitude];
  uint64_t v24 = NSNumber;
  v25 = [v6 geoMapItem];
  [v25 coordinate];
  v27 = [v24 numberWithDouble:v26];
  char v28 = [v23 isEqual:v27];

  if ((v28 & 1) == 0)
  {
    v29 = NSNumber;
    v30 = [v6 geoMapItem];
    [v30 coordinate];
    v32 = [v29 numberWithDouble:v31];
    [a1 setLongitude:v32];

    *a4 = 1;
  }
  v33 = [a1 mapItemStorage];
  v34 = [v6 geoMapItem];
  char v35 = [v33 isEqual:v34];

  if ((v35 & 1) == 0)
  {
    v36 = [v6 geoMapItem];
    [a1 setMapItemStorage:v36];

    *a4 = 1;
  }
  v37 = [a1 shortcutIdentifier];
  v38 = [v6 identifier];
  char v39 = [v37 isEqualToString:v38];

  if ((v39 & 1) == 0)
  {
    v40 = [v6 identifier];
    [a1 setShortcutIdentifier:v40];

    *a4 = 1;
  }
  int v41 = [a1 hidden];
  if (v41 != [v6 isHidden])
  {
    objc_msgSend(a1, "setHidden:", objc_msgSend(v6, "isHidden"));
    *a4 = 1;
  }
  v42 = [a1 customName];
  v43 = [v6 customName];
  char v44 = [v42 isEqualToString:v43];

  if ((v44 & 1) == 0)
  {
    v45 = [v6 customName];
    [a1 setCustomName:v45];

    *a4 = 1;
  }
  v46 = [a1 shortcutIdentifier];
  v47 = [v6 identifier];
  char v48 = [v46 isEqualToString:v47];

  if ((v48 & 1) == 0)
  {
    v49 = [v6 identifier];
    [a1 setShortcutIdentifier:v49];

    *a4 = 1;
  }
  int v50 = [a1 type];
  if (v50 != (__int16)[v6 type])
  {
    objc_msgSend(a1, "setType:", (__int16)objc_msgSend(v6, "type"));
    *a4 = 1;
  }
  v51 = [a1 originatingAddressString];
  v52 = [v6 originatingAddressString];
  char v53 = [v51 isEqualToString:v52];

  if ((v53 & 1) == 0)
  {
    v54 = [v6 originatingAddressString];
    [a1 setOriginatingAddressString:v54];

    *a4 = 1;
  }
  int v55 = [a1 source];
  if (v55 != (__int16)[v6 source])
  {
    objc_msgSend(a1, "setSource:", (__int16)objc_msgSend(v6, "source"));
    *a4 = 1;
  }
  v56 = (void *)MEMORY[0x1E4F1CAD0];
  v57 = [a1 fetchContactHandles];
  v58 = [v56 setWithArray:v57];

  v59 = [MEMORY[0x1E4F1CA80] set];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v60 = [v6 contacts];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v87 objects:v93 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v88 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = [*(id *)(*((void *)&v87 + 1) + 8 * i) handleValue];
        [v59 addObject:v65];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v87 objects:v93 count:16];
    }
    while (v62);
  }

  v66 = (void *)[v59 mutableCopy];
  [v66 minusSet:v58];
  v78 = v58;
  v67 = (void *)[v58 mutableCopy];
  [v67 minusSet:v59];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v68 = v67;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v84;
    do
    {
      for (uint64_t j = 0; j != v70; ++j)
      {
        if (*(void *)v84 != v71) {
          objc_enumerationMutation(v68);
        }
        [a1 removeContactHandle:*(void *)(*((void *)&v83 + 1) + 8 * j)];
        *a4 = 1;
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v70);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v73 = v66;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v80;
    do
    {
      for (uint64_t k = 0; k != v75; ++k)
      {
        if (*(void *)v80 != v76) {
          objc_enumerationMutation(v73);
        }
        [a1 addContactHandle:*(void *)(*((void *)&v79 + 1) + 8 * k)];
        *a4 = 1;
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v75);
  }
}

@end