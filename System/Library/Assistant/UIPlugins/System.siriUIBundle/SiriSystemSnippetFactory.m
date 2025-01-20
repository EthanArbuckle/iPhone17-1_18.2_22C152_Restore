@interface SiriSystemSnippetFactory
- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4;
- (id)filteredDisambiguationListItems:(id)a3;
- (id)viewControllerForAceObject:(id)a3;
- (id)viewControllerForSnippet:(id)a3 error:(id *)a4;
@end

@implementation SiriSystemSnippetFactory

- (id)viewControllerForSnippet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[ACAssistantAlternateProviderController alloc] initWithAlternateProviderSnippet:v5];
LABEL_8:
    v8 = v6;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = SiriPronunciationDataViewController;
LABEL_7:
    v6 = (ACAssistantAlternateProviderController *)objc_alloc_init(v7);
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = SiriAttributionViewController;
    goto LABEL_7;
  }
  if (a4)
  {
    +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:100 userInfo:0];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (id)viewControllerForAceObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_18370;
LABEL_10:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = &off_18238;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = off_18228;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v4 = off_18230;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = off_18368;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = off_18360;
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_11:

  return v5;
}

- (id)filteredDisambiguationListItems:(id)a3
{
  id v3 = a3;
  v4 = [v3 firstObject];
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = v3;
  if (isKindOfClass)
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
    v26 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v3;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (!v9) {
      goto LABEL_17;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
        v14 = [v13 object];
        v15 = [v14 appIdentifyingInfo];
        v16 = [v15 bundleId];

        uint64_t v27 = 0;
        if (!v16) {
          goto LABEL_11;
        }
        v17 = [v13 object];
        v18 = [v17 appIdentifyingInfo];
        if (objc_msgSend(v18, "sruif_isSurfAppInfo"))
        {

LABEL_11:
          [v7 addObject:v13];
          goto LABEL_12;
        }
        unsigned int v19 = [v26 canOpenApplication:v16 reason:&v27];

        if (v19) {
          goto LABEL_11;
        }
        v20 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          v22 = FBSOpenApplicationErrorCodeToString();
          *(_DWORD *)buf = 136315650;
          v33 = "-[SiriSystemSnippetFactory filteredDisambiguationListItems:]";
          __int16 v34 = 2112;
          v35 = v16;
          __int16 v36 = 2112;
          v37 = v22;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%s Filtering app %@ for reason %@", buf, 0x20u);
        }
LABEL_12:

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v23 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
      id v10 = v23;
      if (!v23)
      {
LABEL_17:

        id v3 = v25;
        break;
      }
    }
  }

  return v7;
}

- (id)disambiguationItemForListItem:(id)a3 disambiguationKey:(id)a4
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = +[SiriUIDisambiguationItem disambiguationItem];
    id v8 = [v4 title];
    [v7 setTitle:v8];

    id v9 = [v4 object];
    id v10 = [v9 appIdentifyingInfo];
    uint64_t v11 = [v10 bundleId];

    v12 = [v4 object];
    v13 = [v12 appIdentifyingInfo];
    unsigned int v14 = objc_msgSend(v13, "sruif_isSurfAppInfo");

    if (v14)
    {
      v15 = +[NSBundle bundleForClass:objc_opt_class()];
      v16 = +[UIImage imageNamed:@"ApplePay" inBundle:v15];
      v17 = +[UIScreen mainScreen];
      [v17 scale];
      v18 = objc_msgSend(v16, "_applicationIconImageForFormat:precomposed:scale:", 2, 0);
    }
    else
    {
      v15 = +[UIScreen mainScreen];
      [v15 scale];
      v18 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v11, 2);
    }

    id v19 = [objc_alloc((Class)UIImageView) initWithImage:v18];
    [v7 setImageView:v19];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end