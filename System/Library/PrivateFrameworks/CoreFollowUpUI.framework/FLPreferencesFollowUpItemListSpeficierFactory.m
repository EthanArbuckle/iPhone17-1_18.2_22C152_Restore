@interface FLPreferencesFollowUpItemListSpeficierFactory
+ (id)detailSpecifiersForFollowUpItem:(id)a3 target:(id)a4 selector:(SEL)a5;
@end

@implementation FLPreferencesFollowUpItemListSpeficierFactory

+ (id)detailSpecifiersForFollowUpItem:(id)a3 target:(id)a4 selector:(SEL)a5
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc(MEMORY[0x263F35398]);
  v10 = [v7 groupIdentifier];
  v11 = (void *)[v9 initWithIdentifier:v10];

  v56 = v11;
  if ([v11 restrictionEnabled])
  {
    v12 = [MEMORY[0x263F35368] sharedFilter];
    uint64_t v13 = [v12 overrideGroupRestrictionsForItem:v7] ^ 1;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = [MEMORY[0x263EFF980] array];
  v15 = (void *)MEMORY[0x263F5FC40];
  v16 = [v7 uniqueIdentifier];
  uint64_t v17 = [v15 groupSpecifierWithID:v16];

  v55 = (void *)v17;
  [v14 addObject:v17];
  v18 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D45BC38 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v19 = objc_opt_class();
  uint64_t v62 = *MEMORY[0x263F5FFE0];
  objc_msgSend(v18, "setProperty:forKey:", v19);
  uint64_t v67 = *MEMORY[0x263F352A8];
  objc_msgSend(v18, "setProperty:forKey:", v7);
  v20 = [v7 representingBundlePath];

  v21 = (uint64_t *)MEMORY[0x263F60140];
  v68 = v18;
  if (v20)
  {
    uint64_t v22 = v13;
    v23 = (void *)MEMORY[0x263F086E0];
    v24 = [v7 representingBundlePath];
    v25 = [v23 bundleWithPath:v24];

    v26 = [v7 bundleIconName];

    v27 = (void *)MEMORY[0x263F1C6B0];
    if (v26)
    {
      v28 = [v7 bundleIconName];
      v29 = [v27 imageNamed:v28 inBundle:v25];

      v30 = SFAppTintColor();
      [v29 imageWithTintColor:v30];
    }
    else
    {
      v30 = [v25 bundleIdentifier];
      v29 = [MEMORY[0x263F1C920] mainScreen];
      [v29 scale];
      objc_msgSend(v27, "_applicationIconImageForBundleIdentifier:format:scale:", v30, 0);
    v31 = };

    v18 = v68;
    [v68 setProperty:v31 forKey:*v21];

    uint64_t v13 = v22;
  }
  [v14 addObject:v18];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [v7 actions];
  uint64_t v69 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v69)
  {
    uint64_t v66 = *(void *)v71;
    uint64_t v64 = *MEMORY[0x263F5FEF8];
    uint64_t v65 = *MEMORY[0x263F352A0];
    uint64_t v63 = *MEMORY[0x263F352D8];
    v57 = (void *)*MEMORY[0x263F35298];
    uint64_t v61 = *v21;
    id v58 = v7;
    uint64_t v59 = *MEMORY[0x263F600A8];
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v71 != v66) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v34 = (void *)MEMORY[0x263F5FC40];
        v35 = [v33 label];
        v36 = [v34 preferenceSpecifierNamed:v35 target:v8 set:0 get:0 detail:0 cell:13 edit:0];

        [v36 setProperty:v33 forKey:v65];
        [v36 setProperty:MEMORY[0x263EFFA88] forKey:v64];
        [v36 setProperty:v7 forKey:v67];
        [v36 setButtonAction:a5];
        v37 = [v7 groupIdentifier];
        if ([v37 isEqualToString:v63])
        {
          v38 = [v7 actions];
          if ([v38 count] == 1)
          {
            char v39 = [v7 displayStyle];

            if ((v39 & 2) == 0) {
              goto LABEL_20;
            }
            v37 = [v7 uniqueIdentifier];
            v38 = [v57 stringByAppendingString:v37];
            [v36 setIdentifier:v38];
          }
        }
LABEL_20:
        v40 = [v7 representingBundlePath];

        if (v40)
        {
          [v36 setProperty:objc_opt_class() forKey:v62];
          v41 = (void *)MEMORY[0x263F086E0];
          v42 = [v7 representingBundlePath];
          v43 = [v41 bundleWithPath:v42];

          v44 = [v7 bundleIconName];

          v45 = (void *)MEMORY[0x263F1C6B0];
          if (v44)
          {
            v46 = [v7 bundleIconName];
            v47 = [v45 imageNamed:v46 inBundle:v43];
          }
          else
          {
            v46 = [v43 bundleIdentifier];
            [MEMORY[0x263F1C920] mainScreen];
            uint64_t v48 = v13;
            v49 = v14;
            v50 = a5;
            v52 = id v51 = v8;
            [v52 scale];
            v47 = objc_msgSend(v45, "_applicationIconImageForBundleIdentifier:format:scale:", v46, 0);

            id v8 = v51;
            a5 = v50;
            v14 = v49;
            uint64_t v13 = v48;
            id v7 = v58;
          }

          v53 = objc_msgSend(v47, "_imageWithSize:", 29.0, 29.0);

          [v36 setProperty:v53 forKey:v61];
        }
        if (v13) {
          [v36 setProperty:MEMORY[0x263EFFA80] forKey:v59];
        }
        [v14 addObject:v36];

        v18 = v68;
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v69);
  }

  return v14;
}

@end