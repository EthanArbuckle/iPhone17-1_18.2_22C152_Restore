@interface WebBookmark(SafariServicesExtras)
+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras;
+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras destinationSubtype:;
+ (void)_sf_webBookmarksFromDropSession:()SafariServicesExtras completionHandler:;
- (id)_sf_contextMenuUsingCollection:()SafariServicesExtras tabGroupActionProvider:analyticsPayload:withUserInfo:handler:;
- (id)_sf_icon;
- (id)_sf_iconKeyColor;
- (uint64_t)_sf_contextMenuUsingCollection:()SafariServicesExtras withUserInfo:handler:;
- (void)_sf_setIconKeyColor:()SafariServicesExtras;
@end

@implementation WebBookmark(SafariServicesExtras)

- (id)_sf_iconKeyColor
{
  v1 = [a1 localAttributes];
  v2 = [v1 objectForKeyedSubscript:@"IconKeyColor"];

  if (v2)
  {
    v3 = [v2 objectForKeyedSubscript:@"R"];
    [v3 doubleValue];
    double v5 = v4;

    v6 = [v2 objectForKeyedSubscript:@"G"];
    [v6 doubleValue];
    double v8 = v7;

    v9 = [v2 objectForKeyedSubscript:@"B"];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [v2 objectForKeyedSubscript:@"A"];
    [v12 doubleValue];
    double v14 = v13;

    v15 = [MEMORY[0x1E4FB1618] colorWithRed:v5 green:v8 blue:v11 alpha:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_sf_setIconKeyColor:()SafariServicesExtras
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [a1 localAttributes];
  v6 = (void *)[v5 mutableCopy];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v9 = v8;

  if (v4)
  {
    double v17 = 0.0;
    double v18 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    [v4 getRed:&v18 green:&v17 blue:&v16 alpha:&v15];
    v19[0] = @"R";
    double v10 = [NSNumber numberWithDouble:v18];
    v20[0] = v10;
    v19[1] = @"G";
    double v11 = [NSNumber numberWithDouble:v17];
    v20[1] = v11;
    v19[2] = @"B";
    v12 = [NSNumber numberWithDouble:v16];
    v20[2] = v12;
    v19[3] = @"A";
    double v13 = [NSNumber numberWithDouble:v15];
    v20[3] = v13;
    double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    [v9 setObject:v14 forKeyedSubscript:@"IconKeyColor"];
  }
  else
  {
    [v9 removeObjectForKey:@"IconKeyColor"];
  }
  [a1 setLocalAttributes:v9];
}

- (id)_sf_icon
{
  v1 = [a1 iconData];
  if ([v1 length])
  {
    v2 = [MEMORY[0x1E4FB1818] imageWithData:v1];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras
{
  return objc_msgSend(a1, "_sf_operationForDropSession:destinationSubtype:", a3, 0);
}

+ (uint64_t)_sf_operationForDropSession:()SafariServicesExtras destinationSubtype:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [a3 items];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v8 = 0;
    uint64_t v25 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "_sf_localTabGroup");

        if (v13)
        {
          uint64_t v22 = 1;
LABEL_31:

          goto LABEL_32;
        }
        double v14 = objc_msgSend(v12, "_sf_localBookmark");
        double v15 = v14;
        if (v14)
        {
          if (a4 == 1 && ([v14 isFolder] & 1) != 0)
          {

            uint64_t v22 = 0;
            goto LABEL_31;
          }
          ++v9;
          BOOL v8 = v8 || [v15 subtype] != a4;
        }
        else
        {
          double v16 = [v12 itemProvider];
          unsigned int v17 = [v16 canLoadObjectOfClass:objc_opt_class()];

          v25 += v17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }

    if (v9 == 1 && !v25)
    {
      double v18 = [v5 firstObject];
      v19 = objc_msgSend(v18, "_sf_localBookmark");
      int v20 = [v19 isReadingListItem];

      uint64_t v21 = 2;
      if (!v8) {
        uint64_t v21 = 3;
      }
      if (v20) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v21;
      }
      goto LABEL_32;
    }
    BOOL v23 = v25 != 0;
    if (!v9 && v25)
    {
      uint64_t v22 = 2;
      goto LABEL_32;
    }
  }
  else
  {

    BOOL v23 = 0;
    unint64_t v9 = 0;
  }
  if (!v9) {
    BOOL v23 = 0;
  }
  uint64_t v22 = v9 > 1 || v23;
LABEL_32:

  return v22;
}

+ (void)_sf_webBookmarksFromDropSession:()SafariServicesExtras completionHandler:
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F78578];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke;
  v8[3] = &unk_1E5C72BA8;
  id v9 = v5;
  id v7 = v5;
  [v6 dropSession:a3 loadObjectsUsingLocalObjectLoader:localObjectLoader objectLoader:objectLoader completionHandler:v8];
}

- (uint64_t)_sf_contextMenuUsingCollection:()SafariServicesExtras withUserInfo:handler:
{
  return objc_msgSend(a1, "_sf_contextMenuUsingCollection:tabGroupActionProvider:analyticsPayload:withUserInfo:handler:", a3, 0, 0, a4, a5);
}

- (id)_sf_contextMenuUsingCollection:()SafariServicesExtras tabGroupActionProvider:analyticsPayload:withUserInfo:handler:
{
  v115[3] = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v74 = a4;
  id v73 = a5;
  id v76 = a6;
  id v72 = a7;
  objc_initWeak(&location, v72);
  v78 = [MEMORY[0x1E4F1CA48] array];
  v77 = [a1 address];
  int v75 = [v80 bookmarkContainsLeafBookmark:a1];
  if (([a1 isFolder] & 1) != 0 || !objc_msgSend(v77, "length"))
  {
    if (([a1 isFolder] & v75) != 1) {
      goto LABEL_7;
    }
    double v18 = (void *)MEMORY[0x1E4FB13F0];
    v19 = _WBSLocalizedString();
    int v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    double v16 = v112;
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_2;
    v112[3] = &unk_1E5C72BF0;
    v112[4] = v80;
    v112[5] = a1;
    uint64_t v21 = [v18 actionWithTitle:v19 image:v20 identifier:0 handler:v112];
    [v78 addObject:v21];
  }
  else
  {
    double v13 = (void *)MEMORY[0x1E4FB13F0];
    double v14 = _WBSLocalizedString();
    double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    double v16 = v113;
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke;
    v113[3] = &unk_1E5C72170;
    v113[4] = v77;
    unsigned int v17 = [v13 actionWithTitle:v14 image:v15 identifier:0 handler:v113];
    [v78 addObject:v17];
  }
LABEL_7:
  v79 = [MEMORY[0x1E4F1CA48] array];
  if (v75)
  {
    int v22 = [a1 isFolder];
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_4;
    v110[3] = &__block_descriptor_33_e18___NSString_16__0q8l;
    char v111 = v22;
    BOOL v23 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v110);
    v104[0] = MEMORY[0x1E4F143A8];
    v104[1] = 3221225472;
    v104[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_5;
    v104[3] = &unk_1E5C72C60;
    char v109 = v22;
    id v24 = v74;
    id v105 = v24;
    v106 = a1;
    objc_copyWeak(&v108, &location);
    id v107 = v76;
    uint64_t v25 = (void *)MEMORY[0x1AD0C36A0](v104);
    long long v26 = (void *)MEMORY[0x1E4FB13F0];
    long long v27 = v23[2](v23, 0);
    long long v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_7;
    v102[3] = &unk_1E5C72C88;
    id v29 = v25;
    id v103 = v29;
    v30 = [v26 actionWithTitle:v27 image:v28 identifier:0 handler:v102];
    [v79 addObject:v30];

    if (v24)
    {
      uint64_t v31 = [v80 descendantsOfBookmarkFolder:a1];
      uint64_t v32 = [v31 count];
      v33 = (void *)MEMORY[0x1E4F1CB10];
      if (v32)
      {
        id v7 = [v31 objectAtIndexedSubscript:0];
        v34 = [v7 address];
      }
      else
      {
        v34 = v77;
      }
      v35 = [v33 URLWithString:v34];
      if (v32)
      {
      }
      if (!v22
        || ([a1 isBookmarksBarFolder] & 1) != 0
        || ([a1 isBookmarksMenuFolder] & 1) != 0)
      {
        v36 = 0;
      }
      else
      {
        v36 = [a1 localizedTitle];
      }
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_8;
      v100[3] = &unk_1E5C72CB0;
      id v101 = v29;
      v37 = [v24 openInTabGroupMenuWithNewTabGroupName:v36 URL:v35 descendantCount:v32 handler:v100];
      [v79 addObject:v37];
    }
    objc_destroyWeak(&v108);
  }
  v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = objc_msgSend(v80, "bookmarkWithID:", objc_msgSend(a1, "parentID"));
  uint64_t v40 = [a1 subtype];
  int v41 = [a1 isEditable];
  if (v40 == 5) {
    int v42 = 0;
  }
  else {
    int v42 = v41;
  }
  if (v42 == 1
    && ([v39 isWebFilterAllowedSitesFolder] & 1) == 0
    && ([a1 isReadingListItem] & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E4FB13F0];
    v44 = _WBSLocalizedString();
    v45 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.pencil"];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_9;
    v97[3] = &unk_1E5C721E8;
    objc_copyWeak(&v99, &location);
    v97[4] = a1;
    id v98 = v76;
    v46 = [v43 actionWithTitle:v44 image:v45 identifier:0 handler:v97];
    [v38 addObject:v46];

    objc_destroyWeak(&v99);
  }
  id v47 = objc_loadWeakRetained(&location);
  char v48 = objc_opt_respondsToSelector();

  if (v48)
  {
    if (([a1 isFolder] & 1) != 0 || !objc_msgSend(v77, "length"))
    {
      if (([a1 isFolder] & v75) == 1)
      {
        v53 = (void *)MEMORY[0x1E4FB13F0];
        v54 = _WBSLocalizedString();
        v55 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_11;
        v88[3] = &unk_1E5C72D00;
        id v89 = v80;
        v90 = a1;
        objc_copyWeak(&v92, &location);
        id v91 = v76;
        v56 = [v53 actionWithTitle:v54 image:v55 identifier:0 handler:v88];
        [v38 addObject:v56];

        objc_destroyWeak(&v92);
      }
    }
    else
    {
      v49 = (void *)MEMORY[0x1E4FB13F0];
      v50 = _WBSLocalizedString();
      v51 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_10;
      v93[3] = &unk_1E5C72CD8;
      objc_copyWeak(&v96, &location);
      v93[4] = a1;
      id v94 = v77;
      id v95 = v76;
      v52 = [v49 actionWithTitle:v50 image:v51 identifier:0 handler:v93];
      [v38 addObject:v52];

      objc_destroyWeak(&v96);
    }
  }
  if ([a1 isDeletable] && (objc_msgSend(v39, "isWebFilterAllowedSitesFolder") & 1) == 0)
  {
    v57 = (void *)MEMORY[0x1E4FB13F0];
    v58 = _WBSLocalizedString();
    if (v40 == 5)
    {
      v63 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_13;
      v84[3] = &unk_1E5C72CD8;
      v60 = &v87;
      objc_copyWeak(&v87, &location);
      v84[4] = a1;
      id v85 = v76;
      id v86 = v73;
      v64 = [v57 actionWithTitle:v58 image:v63 identifier:0 handler:v84];

      [v38 addObject:v64];
      v62 = &v85;
      v61 = v86;
    }
    else
    {
      v59 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_14;
      v81[3] = &unk_1E5C721E8;
      v60 = &v83;
      objc_copyWeak(&v83, &location);
      v81[4] = a1;
      id v82 = v76;
      v61 = [v57 actionWithTitle:v58 image:v59 identifier:0 handler:v81];

      [v61 setAttributes:2];
      [v38 addObject:v61];
      v62 = &v82;
    }

    objc_destroyWeak(v60);
  }
  v65 = (void *)MEMORY[0x1E4FB1970];
  v66 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v78];
  v115[0] = v66;
  v67 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v79];
  v115[1] = v67;
  v68 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EFB97EB8 image:0 identifier:0 options:1 children:v38];
  v115[2] = v68;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:3];
  v70 = [v65 menuWithTitle:&stru_1EFB97EB8 children:v69];

  objc_destroyWeak(&location);

  return v70;
}

@end