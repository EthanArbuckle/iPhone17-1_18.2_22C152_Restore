@interface NSURL(dd_private)
- (BOOL)dd_isCloudLink;
- (id)dd_emailFromMailtoScheme;
- (id)dd_emailFromTelScheme;
- (id)dd_emailFromValidSchemes:()dd_private;
- (id)dd_handleFromFacetimeSchemeFilteringForEmail:()dd_private;
- (id)dd_phoneNumberFromTelScheme;
- (id)dd_phoneNumberFromTelSchemeAndExtractBody:()dd_private serviceID:suggestions:;
- (id)dd_phoneNumberFromValidSchemes:()dd_private;
- (id)dd_productIdentifierFromAppleStoreScheme;
- (id)dd_rdarLinkFromTelScheme;
- (uint64_t)dd_emailFromFacetimeScheme;
- (uint64_t)dd_hasHosts:()dd_private filterKey:filterValue:;
- (uint64_t)dd_isAnySimpleTelephonyScheme;
- (uint64_t)dd_isAppleApps;
- (uint64_t)dd_isAppleBooks;
- (uint64_t)dd_isAppleMusic;
- (uint64_t)dd_isApplePodcasts;
- (uint64_t)dd_isAppleStore;
- (uint64_t)dd_isAppleTV;
- (uint64_t)dd_isAppleiTunesStore;
- (uint64_t)dd_isMaps:()dd_private;
- (uint64_t)dd_isMaps:()dd_private isDirections:;
- (uint64_t)dd_phoneNumberFromFacetimeScheme;
- (uint64_t)dd_previewActionSupported;
- (void)dd_AppleOtherSchemes;
- (void)dd_AppleiTunesSchemes;
@end

@implementation NSURL(dd_private)

- (uint64_t)dd_isMaps:()dd_private
{
  return objc_msgSend(a1, "dd_isMaps:isDirections:", a3, 0);
}

- (uint64_t)dd_isMaps:()dd_private isDirections:
{
  v7 = [a1 scheme];
  v8 = [v7 lowercaseString];

  if (([v8 isEqualToString:@"maps"] & 1) != 0
    || [v8 isEqualToString:@"geo"])
  {
    v9 = [a1 absoluteString];
    v10 = [v9 componentsSeparatedByString:@":"];
    uint64_t v11 = (unint64_t)[v10 count] > 1;
LABEL_4:

    goto LABEL_5;
  }
  v14 = [a1 query];

  if (!v14)
  {
    if (!a3 || ([a1 path], v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
    {
      uint64_t v11 = 0;
      goto LABEL_17;
    }
    v19 = [a1 host];
    v9 = [v19 lowercaseString];

LABEL_21:
    v10 = [a1 path];
    v20 = [v10 lowercaseString];
    if ([v20 hasPrefix:@"/maps"])
    {
      if (([v9 isEqualToString:@"www.google.com"] & 1) != 0
        || ([v9 isEqualToString:@"www.bing.com"] & 1) != 0)
      {
        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v11 = [v9 isEqualToString:@"goo.gl"];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_4;
  }
  v15 = [a1 host];
  v9 = [v15 lowercaseString];

  unsigned int v16 = [v9 isEqualToString:@"maps.apple.com"];
  uint64_t v11 = a3 | v16;
  if (a3 && (v16 & 1) == 0)
  {
    if (([v9 isEqualToString:@"maps.google.com"] & 1) != 0
      || ([v9 isEqualToString:@"maps.bing.com"] & 1) != 0)
    {
      uint64_t v11 = 1;
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_5:

  if (a4 && v11)
  {
    v12 = [a1 resourceSpecifier];
    if ([v12 containsString:@"?daddr="]) {
      char v13 = 1;
    }
    else {
      char v13 = [v12 containsString:@"&daddr="];
    }
    *a4 = v13;

    uint64_t v11 = 1;
  }
LABEL_17:

  return v11;
}

- (uint64_t)dd_isAnySimpleTelephonyScheme
{
  v2 = [a1 scheme];
  v3 = [v2 lowercaseString];

  if ([&unk_1EF50FFA8 containsObject:v3])
  {
    uint64_t IsChatBot = 1;
  }
  else if ([v3 isEqualToString:@"sip"])
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
    v6 = [v5 path];
    uint64_t IsChatBot = dd_handleIsChatBot(v6);
  }
  else
  {
    uint64_t IsChatBot = 0;
  }

  return IsChatBot;
}

- (uint64_t)dd_hasHosts:()dd_private filterKey:filterValue:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [a1 host];
    v12 = [v11 lowercaseString];
    int v13 = [v8 containsObject:v12];

    if (v13)
    {
      if (!v9 || !v10) {
        goto LABEL_9;
      }
      v14 = [a1 absoluteString];
      v15 = [NSString stringWithFormat:@"%@=", v9];
      if ([v14 rangeOfString:v15] == 0x7FFFFFFFFFFFFFFFLL)
      {

LABEL_9:
        uint64_t v19 = 1;
        goto LABEL_10;
      }
      unsigned int v16 = [a1 absoluteString];
      v17 = [NSString stringWithFormat:@"%@=%@", v9, v10];
      uint64_t v18 = [v16 rangeOfString:v17];

      if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

- (void)dd_AppleiTunesSchemes
{
  return &unk_1EF50FFC0;
}

- (void)dd_AppleOtherSchemes
{
  return &unk_1EF50FFD8;
}

- (uint64_t)dd_isAppleiTunesStore
{
  v2 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
  if (objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v2, @"app", @"itunes"))
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(a1, "dd_AppleOtherSchemes");
    uint64_t v3 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v4, @"app", @"itunes");
  }
  return v3;
}

- (uint64_t)dd_isAppleApps
{
  v1 = [a1 host];
  v2 = [v1 lowercaseString];
  uint64_t v3 = [&unk_1EF50FFF0 containsObject:v2];

  return v3;
}

- (uint64_t)dd_isAppleBooks
{
  v2 = [a1 host];
  uint64_t v3 = [v2 lowercaseString];
  if ([@"books.apple.com" isEqualToString:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
    uint64_t v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, @"app", @"books");
  }
  return v4;
}

- (uint64_t)dd_isAppleMusic
{
  v2 = [a1 host];
  uint64_t v3 = [v2 lowercaseString];
  if ([&unk_1EF510008 containsObject:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
    uint64_t v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, @"app", @"music");
  }
  return v4;
}

- (uint64_t)dd_isApplePodcasts
{
  v2 = [a1 host];
  uint64_t v3 = [v2 lowercaseString];
  if ([@"podcasts.apple.com" isEqualToString:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
    uint64_t v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, @"app", @"podcast");
  }
  return v4;
}

- (uint64_t)dd_isAppleTV
{
  v2 = [a1 host];
  uint64_t v3 = [v2 lowercaseString];
  if ([@"tv.apple.com" isEqualToString:v3])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
    uint64_t v4 = objc_msgSend(a1, "dd_hasHosts:filterKey:filterValue:", v5, @"app", @"tv");
  }
  return v4;
}

- (uint64_t)dd_isAppleStore
{
  v2 = [a1 host];
  uint64_t v3 = [v2 lowercaseString];

  uint64_t v4 = objc_msgSend(a1, "dd_AppleiTunesSchemes");
  if ([v4 containsObject:v3])
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(a1, "dd_AppleOtherSchemes");
    uint64_t v5 = [v6 containsObject:v3];
  }
  return v5;
}

- (BOOL)dd_isCloudLink
{
  v1 = objc_msgSend(a1, "iCloudSharingURL_noFragment");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)dd_phoneNumberFromTelScheme
{
  v1 = objc_msgSend(a1, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, 0, 0);
  id v2 = 0;
  if (([v1 containsString:@"@"] & 1) == 0) {
    id v2 = v1;
  }

  return v2;
}

- (id)dd_emailFromTelScheme
{
  v1 = objc_msgSend(a1, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, 0, 0);
  id v2 = 0;
  if ([v1 containsString:@"@"]) {
    id v2 = v1;
  }

  return v2;
}

- (id)dd_phoneNumberFromTelSchemeAndExtractBody:()dd_private serviceID:suggestions:
{
  v92[1] = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "dd_isAnySimpleTelephonyScheme"))
  {
    id v36 = 0;
    goto LABEL_92;
  }
  id v8 = [a1 resourceSpecifier];
  if ([v8 hasPrefix:@"//"])
  {
    if ((unint64_t)[v8 length] < 3) {
      goto LABEL_42;
    }
    uint64_t v9 = [v8 substringFromIndex:2];

    id v8 = (void *)v9;
  }
  if ([v8 length])
  {
    id v10 = [a1 scheme];
    uint64_t v11 = [v10 lowercaseString];

    LODWORD(v10) = [v11 isEqualToString:@"sms"];
    int v12 = [v11 isEqualToString:@"sip"];
    v78 = a4;
    char v76 = (char)v10;
    if (v10)
    {
      int v13 = @";";
      unint64_t v14 = [v8 rangeOfString:@"?"];
      unint64_t v15 = [v8 rangeOfString:@"&"];
      unint64_t v16 = [v8 rangeOfString:@";"];
      if (v15 >= v14) {
        v17 = @"?";
      }
      else {
        v17 = @"&";
      }
      if (v15 >= v14) {
        unint64_t v18 = v14;
      }
      else {
        unint64_t v18 = v15;
      }
      if (v16 >= v18) {
        int v13 = v17;
      }
      uint64_t v19 = [v8 componentsSeparatedByString:v13];
      if ([v19 count])
      {
        [v19 firstObject];
        v20 = v67 = v19;
        v92[0] = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];

        uint64_t v19 = v67;
        if ((unint64_t)[v67 count] < 2)
        {
          v37 = 0;
        }
        else
        {
          int v74 = v12;
          v22 = objc_msgSend(v67, "subarrayWithRange:", 1, objc_msgSend(v67, "count") - 1);
          v23 = [v22 componentsJoinedByString:v13];

          v24 = [v23 componentsSeparatedByString:@"&"];
          v25 = v24;
          v70 = v11;
          v72 = v8;
          v68 = v21;
          v66 = v23;
          if ((a3 || a4 || a5)
            && (long long v88 = 0u,
                long long v89 = 0u,
                long long v86 = 0u,
                long long v87 = 0u,
                (uint64_t v26 = [v24 countByEnumeratingWithState:&v86 objects:v91 count:16]) != 0))
          {
            uint64_t v27 = v26;
            id v81 = 0;
            uint64_t v28 = *(void *)v87;
            uint64_t v77 = *(void *)v87;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v87 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v86 + 1) + 8 * i);
                v31 = [v30 componentsSeparatedByString:@"="];
                if ((unint64_t)[v31 count] >= 2)
                {
                  v32 = [v31 firstObject];
                  v33 = [v32 lowercaseString];

                  v34 = objc_msgSend(v30, "substringFromIndex:", objc_msgSend(v33, "length") + 1);
                  if (a3 && [v33 isEqualToString:@"body"])
                  {
                    *a3 = [v34 stringByRemovingPercentEncoding];
                  }
                  else if ([v33 isEqualToString:@"service_id"])
                  {
                    v35 = [v34 stringByRemovingPercentEncoding];

                    if (v78)
                    {
                      id v81 = v35;
                      void *v78 = v81;
                    }
                    else
                    {
                      id v81 = v35;
                    }
                    uint64_t v28 = v77;
                  }
                  else if (a5 && [v33 isEqualToString:@"suggestions"])
                  {
                    *a5 = v34;
                  }
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v86 objects:v91 count:16];
            }
            while (v27);
          }
          else
          {
            id v81 = 0;
          }
          v21 = [v68 arrayByAddingObjectsFromArray:v25];

          uint64_t v11 = v70;
          id v8 = v72;
          a4 = v78;
          int v12 = v74;
          v37 = v81;
          uint64_t v19 = v67;
        }
      }
      else
      {
        v37 = 0;
        v21 = 0;
      }
    }
    else
    {
      v21 = [v8 componentsSeparatedByString:@";"];
      v37 = 0;
    }
    v38 = [v21 firstObject];
    uint64_t v39 = [v38 length];

    if (!v39)
    {
      id v36 = 0;
LABEL_90:

      goto LABEL_91;
    }
    v40 = [v21 firstObject];
    v41 = [v40 stringByRemovingPercentEncoding];

    int v75 = v12;
    if (v76)
    {
      if (![(__CFString *)v41 isEqualToString:@"/open"])
      {
        v80 = v41;
LABEL_57:
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v43 = v21;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          v69 = v21;
          v71 = v11;
          v73 = v8;
          char v46 = 0;
          char v47 = 1;
          uint64_t v48 = *(void *)v83;
LABEL_59:
          uint64_t v49 = 0;
          char v50 = v46;
          while (1)
          {
            char v46 = v47;
            if (*(void *)v83 != v48) {
              objc_enumerationMutation(v43);
            }
            if (v46) {
              goto LABEL_74;
            }
            v51 = *(void **)(*((void *)&v82 + 1) + 8 * v49);
            v52 = [v51 componentsSeparatedByString:@"="];
            v53 = v52;
            if ((v50 & 1) != 0 && [v52 count] == 1)
            {
              if ([v51 length])
              {
                v54 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"1234567890#*"];
                v55 = [v54 invertedSet];

                if ([v51 rangeOfCharacterFromSet:v55] == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v65 = v51;
                  v59 = v80;
                  v60 = [NSString stringWithFormat:@"%@;%@", v80, v65];
LABEL_78:

                  uint64_t v11 = v71;
                  id v8 = v73;
                  a4 = v78;
                  v21 = v69;
                  goto LABEL_79;
                }
LABEL_72:
              }
            }
            else if ([v53 count] == 2)
            {
              v55 = [v53 objectAtIndexedSubscript:0];
              if ([v55 isEqualToString:@"ext"])
              {
                v56 = [v53 objectAtIndexedSubscript:1];
                uint64_t v57 = [v56 length];

                if (v57)
                {
                  v58 = NSString;
                  v55 = [v53 objectAtIndexedSubscript:1];
                  v59 = [v55 stringByRemovingPercentEncoding];
                  v60 = [v58 stringWithFormat:@"%@;%@", v80, v59];

                  goto LABEL_78;
                }
                goto LABEL_73;
              }
              goto LABEL_72;
            }
LABEL_73:

LABEL_74:
            char v47 = 0;
            ++v49;
            char v50 = v46;
            if (v45 == v49)
            {
              uint64_t v45 = [v43 countByEnumeratingWithState:&v82 objects:v90 count:16];
              char v47 = 0;
              if (v45) {
                goto LABEL_59;
              }
              uint64_t v11 = v71;
              id v8 = v73;
              a4 = v78;
              v21 = v69;
              break;
            }
          }
        }
        v60 = v80;
LABEL_79:

        if (dd_handleIsChatBot(v60))
        {
          if (a4 && !*a4) {
            *a4 = v60;
          }
          id v61 = v60;

          v62 = [v61 componentsSeparatedByString:@"@"];

          v63 = [v62 firstObject];

          v37 = v61;
          if (!v75) {
            goto LABEL_87;
          }
        }
        else
        {
          v63 = v60;
          if (!v75) {
            goto LABEL_87;
          }
        }
        if (!dd_handleIsChatBot(v37))
        {
          id v36 = 0;
          goto LABEL_89;
        }
LABEL_87:
        id v36 = v63;
LABEL_89:

        goto LABEL_90;
      }
      v42 = @"open";
    }
    else
    {
      v42 = [(__CFString *)v41 stringByReplacingOccurrencesOfString:@":" withString:@";"];
    }

    v80 = v42;
    goto LABEL_57;
  }
LABEL_42:
  id v36 = 0;
LABEL_91:

LABEL_92:
  return v36;
}

- (id)dd_emailFromMailtoScheme
{
  id v2 = [a1 scheme];
  uint64_t v3 = [v2 lowercaseString];
  int v4 = [v3 isEqualToString:@"mailto"];

  if (v4)
  {
    uint64_t v5 = [a1 resourceSpecifier];
    v6 = [v5 componentsSeparatedByString:@"?"];
    v7 = [v6 firstObject];
    id v8 = [v7 stringByRemovingPercentEncoding];

    [v8 rangeOfString:@"@"];
    if (v9) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)dd_handleFromFacetimeSchemeFilteringForEmail:()dd_private
{
  uint64_t v5 = [a1 scheme];
  v6 = [v5 lowercaseString];
  int v7 = [&unk_1EF510020 containsObject:v6];

  if (!v7)
  {
    id v14 = 0;
    goto LABEL_16;
  }
  id v8 = [a1 resourceSpecifier];
  if (![v8 hasPrefix:@"//"]) {
    goto LABEL_5;
  }
  if ((unint64_t)[v8 length] >= 3)
  {
    uint64_t v9 = [v8 substringFromIndex:2];

    id v8 = (void *)v9;
LABEL_5:
    id v10 = [v8 componentsSeparatedByString:@"?"];
    uint64_t v11 = [v10 firstObject];
    int v12 = [v11 stringByRemovingPercentEncoding];

    if (v12
      && (![v12 containsString:@"@"]
        ? (int v13 = 0)
        : (int v13 = dd_handleIsChatBot(v12) ^ 1),
          v13 == a3))
    {
      id v14 = v12;
    }
    else
    {
      id v14 = 0;
    }

    goto LABEL_15;
  }
  id v14 = 0;
LABEL_15:

LABEL_16:
  return v14;
}

- (uint64_t)dd_phoneNumberFromFacetimeScheme
{
  return objc_msgSend(a1, "dd_handleFromFacetimeSchemeFilteringForEmail:", 0);
}

- (uint64_t)dd_emailFromFacetimeScheme
{
  return objc_msgSend(a1, "dd_handleFromFacetimeSchemeFilteringForEmail:", 1);
}

- (id)dd_rdarLinkFromTelScheme
{
  id v2 = [a1 scheme];
  uint64_t v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"rdar"])
  {
    id v4 = a1;
  }
  else if ([v3 isEqualToString:@"tel"])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v6 = NSString;
    int v7 = objc_msgSend(a1, "dd_phoneNumberFromTelScheme");
    id v8 = [v6 stringWithFormat:@"rdar://problem/%@", v7];
    id v4 = (id)[v5 initWithString:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)dd_phoneNumberFromValidSchemes:()dd_private
{
  id v4 = a3;
  id v5 = [a1 scheme];
  v6 = [v5 lowercaseString];

  LODWORD(v5) = [v4 containsObject:v6];
  if (v5)
  {
    if ([&unk_1EF510038 containsObject:v6])
    {
      uint64_t v7 = objc_msgSend(a1, "dd_phoneNumberFromTelScheme");
LABEL_4:
      id v8 = (void *)v7;
      goto LABEL_8;
    }
    if ([&unk_1EF510050 containsObject:v6])
    {
      uint64_t v9 = objc_msgSend(a1, "dd_emailFromFacetimeScheme");

      if (!v9)
      {
        uint64_t v7 = objc_msgSend(a1, "dd_phoneNumberFromFacetimeScheme");
        goto LABEL_4;
      }
    }
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

- (id)dd_emailFromValidSchemes:()dd_private
{
  id v4 = a3;
  id v5 = [a1 scheme];
  v6 = [v5 lowercaseString];

  LODWORD(v5) = [v4 containsObject:v6];
  if (v5)
  {
    if ([v6 isEqualToString:@"mailto"])
    {
      uint64_t v7 = objc_msgSend(a1, "dd_emailFromMailtoScheme");
LABEL_7:
      id v8 = (void *)v7;
      goto LABEL_11;
    }
    if (([v6 isEqualToString:@"sms"] & 1) != 0
      || [v6 isEqualToString:@"sip"])
    {
      uint64_t v7 = objc_msgSend(a1, "dd_emailFromTelScheme");
      goto LABEL_7;
    }
    if ([&unk_1EF510068 containsObject:v6])
    {
      uint64_t v7 = objc_msgSend(a1, "dd_emailFromFacetimeScheme");
      goto LABEL_7;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (id)dd_productIdentifierFromAppleStoreScheme
{
  if (objc_msgSend(a1, "dd_isAppleStore"))
  {
    id v2 = [a1 pathComponents];
    uint64_t v3 = [v2 count];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      while (1)
      {
        v6 = [v2 objectAtIndex:v5];
        if ([v6 rangeOfString:@"^(id)?[0-9]+?$" options:1024] != 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }

        if (v4 == ++v5) {
          goto LABEL_6;
        }
      }
      id v8 = [v6 stringByReplacingOccurrencesOfString:@"id" withString:&stru_1EF5023D8];
      if ([v8 length])
      {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v8, "intValue"));
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
LABEL_6:
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (uint64_t)dd_previewActionSupported
{
  id v2 = [a1 scheme];
  if ([v2 hasPrefix:@"x-apple-data-detectors"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [v2 lowercaseString];
    uint64_t v3 = 1;
    if (([v4 hasPrefix:@"http"] & 1) == 0 && (objc_msgSend(a1, "dd_isMaps:", 1) & 1) == 0) {
      uint64_t v3 = objc_msgSend(a1, "dd_isAnySimpleTelephonyScheme");
    }
  }
  return v3;
}

@end