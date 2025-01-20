@interface _SFOpenInOtherAppActivityViewController
+ (BOOL)canOpenWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5;
+ (id)_activityItemsForFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5;
+ (id)_applicationsForDocumentProxy:(id)a3;
- (NSString)filePath;
- (_SFOpenInOtherAppActivityViewController)initWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5;
- (void)_prepareActivity:(id)a3;
- (void)setFilePath:(id)a3;
@end

@implementation _SFOpenInOtherAppActivityViewController

+ (id)_applicationsForDocumentProxy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v5 = [v4 applicationsAvailableForOpeningDocument:v3];
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "bundleIdentifier", (void)v18);
        int v16 = [v15 isEqualToString:v8];

        if (v16)
        {
          [v9 removeObject:v14];
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)_activityItemsForFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F22430];
    v13 = [v8 lastPathComponent];
    v14 = objc_msgSend(v12, "sf_documentProxyForName:type:MIMEType:sourceURL:", v13, v9, 0, v10);

    if (v14)
    {
      v15 = [a1 _applicationsForDocumentProxy:v14];
      if ([v15 count])
      {
        id v28 = v10;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v27 = v15;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v30 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v22 = [_SFOpenWithAppUIActivity alloc];
              uint64_t v23 = [v21 bundleIdentifier];
              v24 = [(_SFOpenWithAppUIActivity *)v22 initWithApplicationIdentifier:v23 andFilePath:v8];
              [v11 addObject:v24];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v18);
        }

        id v25 = v11;
        id v10 = v28;
        v15 = v27;
      }
      else
      {
        id v25 = 0;
      }
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (BOOL)canOpenWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  v5 = [a1 _activityItemsForFilePath:a3 UTI:a4 sourceURL:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (_SFOpenInOtherAppActivityViewController)initWithFilePath:(id)a3 UTI:(id)a4 sourceURL:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [[_SFOpenInOtherAppActivityItemsSource alloc] initWithFilePath:v8];
  uint64_t v12 = [(id)objc_opt_class() _activityItemsForFilePath:v8 UTI:v10 sourceURL:v9];

  if (v12)
  {
    v18[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v17.receiver = self;
    v17.super_class = (Class)_SFOpenInOtherAppActivityViewController;
    v14 = [(_SFActivityViewController *)&v17 initWithActivityItems:v13 applicationActivities:v12 sharingURL:v9 sourceURL:v9];

    if (v14) {
      [(_SFOpenInOtherAppActivityViewController *)v14 setFilePath:v8];
    }
    self = v14;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_prepareActivity:(id)a3
{
  id v7 = a3;
  v4 = [v7 activityType];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F435B0]];

  if (v5)
  {
    BOOL v6 = [(NSString *)self->_filePath lastPathComponent];
    [v7 setSubject:v6];
  }
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end