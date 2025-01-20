@interface MSFavoriteItem
- (NSArray)participants;
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (unint64_t)participationAccess;
- (void)_ds_stopSharing;
- (void)_ds_stopSharingWithParticipant:(id)a3;
@end

@implementation MSFavoriteItem

- (NSString)displayDetail
{
  return (NSString *)@"Favorite";
}

- (NSString)displayName
{
  v3 = [(MSFavoriteItem *)self customName];

  if (v3)
  {
    id v4 = [(MSFavoriteItem *)self customName];
  }
  else
  {
    v5 = [(MSFavoriteItem *)self mapItemStorage];
    v6 = [v5 name];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = [(MSFavoriteItem *)self mapItemStorage];
      id v8 = [v9 shortAddress];
    }
    unsigned int v10 = [(MSFavoriteItem *)self type];
    v11 = 0;
    if (v10 <= 5 && ((1 << v10) & 0x2C) != 0)
    {
      [(MSFavoriteItem *)self type];
      v11 = MapsSuggestionsLocalizedTitleForShortcutType();
    }
    if ([v11 length] && objc_msgSend(v8, "length"))
    {
      v12 = +[NSBundle bundleWithIdentifier:@"com.apple.Maps.DigitalSeparation"];
      v13 = [v12 localizedStringForKey:@"[Digital Separation] Shortcut Name and Place for Maps Favorite" value:@"localized string not found" table:0];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v11, v8);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = v8;
    }
  }

  return (NSString *)v4;
}

- (NSArray)participants
{
  v2 = [(MSFavoriteItem *)self fetchContactHandles];
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_alloc((Class)MSPSharedTripContact);
        id v11 = objc_msgSend(v10, "initWithContactHandle:", v9, (void)v13);
        if (v11) {
          [v3 addObject:v11];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (int64_t)visibility
{
  return 1;
}

- (unint64_t)participationAccess
{
  return 1;
}

- (void)_ds_stopSharing
{
  id v3 = [(MSFavoriteItem *)self fetchContactHandles];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(MSFavoriteItem *)self removeContactHandle:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_ds_stopSharingWithParticipant:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v5 stringValue];
    [(MSFavoriteItem *)self removeContactHandle:v4];
  }
}

@end