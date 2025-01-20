@interface AXCaptionTextAllFontsController
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AXCaptionTextAllFontsController

- (id)specifiers
{
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v39 = OBJC_IVAR___PSListController__specifiers;
    v43 = self;
    id v42 = objc_alloc_init((Class)NSMutableArray);
    v4 = +[NSMutableArray array];
    v5 = AXCaptionFonts();
    v6 = +[NSMutableArray array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v54;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = [*(id *)(*((void *)&v53 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
          v12 = [v11 lowercaseString];

          id v13 = [v12 rangeOfString:@"-"];
          if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = [v12 substringToIndex:v13];

            v12 = (void *)v14;
          }
          [v6 addObject:v12];
        }
        id v8 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v8);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v15 = +[UIFont familyNames];
    id v16 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v50;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v15);
          }
          [v4 addObject:*(void *)(*((void *)&v49 + 1) + 8 * (void)j)];
        }
        id v17 = [v15 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v17);
    }

    [v4 sortUsingComparator:&__block_literal_global_62];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = v4;
    v21 = (char *)[v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v21)
    {
      v22 = v21;
      uint64_t v23 = *(void *)v46;
      uint64_t v41 = PSCellClassKey;
      uint64_t v40 = PSIDKey;
      do
      {
        for (k = 0; k != v22; ++k)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
          if (v25)
          {
            v26 = v25;
            v27 = (__CFString *)CTFontCopyFullName(v25);
            v28 = (id)CTFontCopyPostScriptName(v26);
            id v29 = [(__CFString *)v28 rangeOfString:@"-"];
            v30 = v28;
            if (v29 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v30 = [(__CFString *)v28 substringToIndex:v29];
            }
            CFRelease(v26);
            v31 = [(__CFString *)v28 lowercaseString];
            v38 = [v30 lowercaseString];
            LOBYTE(v37) = 1;
            _AXLogWithFacility();

            v32 = [v30 lowercaseString:v37, @"here: %@/%@", v31, v38];
            unsigned __int8 v33 = [v6 containsObject:v32];

            if ((v33 & 1) == 0)
            {
              v34 = +[PSSpecifier preferenceSpecifierNamed:v27 target:v43 set:0 get:0 detail:0 cell:3 edit:0];
              [v34 setProperty:objc_opt_class() forKey:v41];
              [v34 setProperty:v28 forKey:v40];
              [v34 setProperty:&__kCFBooleanTrue forKey:@"isFont"];
              [v34 setCellType:3];
              [v42 addObject:v34];
            }
          }
        }
        v22 = (char *)[v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v22);
    }

    v35 = *(void **)&v43->AXUISettingsBaseListController_opaque[v39];
    *(void *)&v43->AXUISettingsBaseListController_opaque[v39] = v42;

    v3 = *(void **)&v43->AXUISettingsBaseListController_opaque[v39];
  }

  return v3;
}

int64_t __45__AXCaptionTextAllFontsController_specifiers__block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a2 localizedCaseInsensitiveCompare:a3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v5 = [a3 cellForRowAtIndexPath:a4];
  v6 = [v5 specifier];
  id v7 = [v6 propertyForKey:PSIDKey];
  v18[0] = @"name";
  v18[1] = @"size";
  v19[0] = v7;
  v19[1] = &off_22A818;
  v18[2] = @"displayName";
  id v8 = [v6 name];
  v18[3] = @"isBold";
  v19[2] = v8;
  v19[3] = &__kCFBooleanFalse;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];

  AXCaptionAddExtraUserFont(v9);
  LOBYTE(v17) = 1;
  _AXLogWithFacility();
  v10 = [(AXCaptionTextAllFontsController *)self specifier];
  v11 = [v10 propertyForKey:@"TextCategory"];
  [v11 integerValue];

  v12 = [v10 propertyForKey:@"ProfileId"];
  id v13 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
  CGFontRef v14 = CTFontCopyGraphicsFont(v13, 0);
  if (v13) {
    CFRelease(v13);
  }
  if (v14)
  {
    MACaptionAppearancePrefSetFontForStyle();
    CFRelease(v14);
  }
  v15 = [(AXCaptionTextAllFontsController *)self navigationController];
  id v16 = [v15 popViewControllerAnimated:1];
}

@end