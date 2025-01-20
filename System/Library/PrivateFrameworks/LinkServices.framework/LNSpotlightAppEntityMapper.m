@interface LNSpotlightAppEntityMapper
+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 displayTitle:(id)a6 displaySubtitle:(id)a7 displaySynonyms:(id)a8 typeDisplayName:(id)a9 typeDisplaySynonyms:(id)a10 propertyDictionary:(id)a11 priority:(id)a12;
@end

@implementation LNSpotlightAppEntityMapper

+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 displayTitle:(id)a6 displaySubtitle:(id)a7 displaySynonyms:(id)a8 typeDisplayName:(id)a9 typeDisplaySynonyms:(id)a10 propertyDictionary:(id)a11 priority:(id)a12
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v46 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v45 = a11;
  id v24 = a12;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"LNSpotlightAppEntityMapper.m", 28, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, a1, @"LNSpotlightAppEntityMapper.m", 29, @"Invalid parameter not satisfying: %@", @"instanceIdentifier" object file lineNumber description];

LABEL_3:
  if (v46)
  {
    if (v19) {
      goto LABEL_5;
    }
LABEL_27:
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"LNSpotlightAppEntityMapper.m", 31, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

    if (v24) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, a1, @"LNSpotlightAppEntityMapper.m", 30, @"Invalid parameter not satisfying: %@", @"typeIdentifier" object file lineNumber description];

  if (!v19) {
    goto LABEL_27;
  }
LABEL_5:
  if (v24) {
    goto LABEL_6;
  }
LABEL_28:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, a1, @"LNSpotlightAppEntityMapper.m", 32, @"Invalid parameter not satisfying: %@", @"priority" object file lineNumber description];

LABEL_6:
  [v17 setAttribute:v18 forKey:@"_kMDItemAppEntityInstanceIdentifier"];
  [v17 setAttribute:v46 forKey:@"_kMDItemAppEntityTypeIdentifier"];
  [v17 setAttribute:v19 forKey:@"kMDItemAppEntityTitle"];
  if (v20) {
    [v17 setAttribute:v20 forKey:@"kMDItemAppEntitySubtitle"];
  }
  if (v21 && [v21 count]) {
    [v17 setAttribute:v21 forKey:@"kMDItemAppEntityDisplayRepresentationSynonyms"];
  }
  v42 = v19;
  if (v22) {
    [v17 setAttribute:v22 forKey:@"_kMDItemAppEntityTypeDisplayRepresentationName"];
  }
  v39 = v21;
  v40 = v20;
  v44 = v18;
  if (v23 && [v23 count]) {
    [v17 setAttribute:v23 forKey:@"_kMDItemAppEntityTypeDisplayRepresentationSynonyms"];
  }
  v38 = v23;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v25 = [v45 allKeys];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v48 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v31 = [NSString stringWithFormat:@"%@_%@_%@", @"kMDItemAppEntity", v46, v30];
        v32 = [v45 objectForKey:v30];
        [v17 setAttribute:v32 forKey:v31];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v27);
  }

  [v17 setAttribute:v24 forKey:@"_kMDItemAppEntityPriority"];
}

@end