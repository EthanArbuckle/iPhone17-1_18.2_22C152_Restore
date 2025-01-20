@interface CKContextDonation
- (IOSurface)internal_bestLeadImage;
- (IOSurface)internal_bestSnapshot;
- (NSString)internal_bestDebugUrlString;
- (NSString)internal_bestRawHTML;
- (NSString)internal_bestTitle;
@end

@implementation CKContextDonation

- (NSString)internal_bestTitle
{
  [(CKContextDonation *)self items];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "title", (void)v9);
      if ([v7 length]) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)internal_bestDebugUrlString
{
  [(CKContextDonation *)self items];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "debugUrlString", (void)v9);
      if ([v7 length]) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSString)internal_bestRawHTML
{
  [(CKContextDonation *)self items];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "rawHTML", (void)v9);
      if ([v7 length]) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }

  return (NSString *)v7;
}

- (IOSurface)internal_bestLeadImage
{
  id v2 = [(CKContextDonation *)self items];
  memset(v5, 0, sizeof(v5));
  if ([v2 countByEnumeratingWithState:v5 objects:v6 count:16])
  {
    id v3 = [**((id **)&v5[0] + 1) leadImage];
  }
  else
  {
    id v3 = 0;
  }

  return (IOSurface *)v3;
}

- (IOSurface)internal_bestSnapshot
{
  id v2 = [(CKContextDonation *)self items];
  memset(v5, 0, sizeof(v5));
  if ([v2 countByEnumeratingWithState:v5 objects:v6 count:16])
  {
    id v3 = [**((id **)&v5[0] + 1) snapshot];
  }
  else
  {
    id v3 = 0;
  }

  return (IOSurface *)v3;
}

@end