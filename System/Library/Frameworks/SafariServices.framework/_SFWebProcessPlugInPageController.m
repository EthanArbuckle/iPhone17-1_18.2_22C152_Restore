@interface _SFWebProcessPlugInPageController
+ (id)pageControllerForBrowserContextController:(id)a3;
- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7;
@end

@implementation _SFWebProcessPlugInPageController

+ (id)pageControllerForBrowserContextController:(id)a3
{
  v3 = objc_getAssociatedObject(a3, &kContextControllerToPlugInPageControllerAssociationKey);

  return v3;
}

- (id)webProcessPlugInBrowserContextController:(id)a3 frame:(id)a4 willSendRequestForResource:(unint64_t)a5 request:(id)a6 redirectResponse:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v41 = v12;
  v13 = [(WBSWebProcessPlugInPageController *)self webProcessPlugIn];
  v14 = [v13 searchEnginesForRedirectToSafeSearch];

  if (v14)
  {
    id v12 = v12;
    id v39 = v14;
    v15 = [v12 URL];
    id v16 = v11;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v17 = v39;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v18)
    {
      id v40 = v10;
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v21 urlIsValidSearch:v15])
          {
            v23 = [v21 safeSearchURLForSearchURL:v15];
            id v10 = v40;
            id v11 = v16;
            if (v23 && ([v15 isEqual:v23] & 1) == 0)
            {
              v22 = (void *)[v12 mutableCopy];
              [v22 setURL:v23];
              [v22 setAttribution:1];
            }
            else
            {
              v22 = 0;
            }

            goto LABEL_18;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      v22 = 0;
      id v10 = v40;
    }
    else
    {
      v22 = 0;
    }
    id v11 = v16;
LABEL_18:

    if (v22)
    {
      id v24 = v22;

      id v12 = v24;
    }
  }
  id v25 = [(WBSWebProcessPlugInPageController *)self webProcessPlugIn];
  if (![v25 isABTestingEnabled]) {
    goto LABEL_24;
  }
  id v26 = [v10 mainFrame];
  if (v26 != v11) {
    goto LABEL_23;
  }
  v28 = [v41 URL];
  v29 = [v11 _provisionalURL];
  int v30 = WBSIsEqual();

  if (v30)
  {
    [v10 _bundlePageRef];
    char IsUsingEphemeralSession = WKBundlePageIsUsingEphemeralSession();
    v32 = [(WBSWebProcessPlugInPageController *)self webProcessPlugIn];
    id v12 = v12;
    id v33 = v32;
    v34 = [v12 URL];
    if (v34) {
      char v35 = IsUsingEphemeralSession;
    }
    else {
      char v35 = 1;
    }
    if ((v35 & 1) != 0 || (uint64_t v36 = [v33 abGroupIdentifier]) == 0)
    {
      id v25 = 0;
    }
    else
    {
      v37 = [v33 defaultSearchProvider];
      v38 = [v37 urlByIncorporatingGroupIdentifier:v36 ifIsValidSearchResultsURL:v34];

      if (v38 && (WBSIsEqual() & 1) == 0)
      {
        id v25 = (id)[v12 mutableCopy];
        [v25 setURL:v38];
        [v25 setAttribution:1];
      }
      else
      {
        id v25 = 0;
      }
    }
    if (!v25) {
      goto LABEL_24;
    }
    id v25 = v25;
    id v26 = v12;
    id v12 = v25;
LABEL_23:

LABEL_24:
  }

  return v12;
}

@end