@interface MapsSuggestionsShortcut
+ (BOOL)supportsSecureCoding;
+ (id)shortcutWithData:(id)a3;
- (BOOL)derivedFromMeCard;
- (BOOL)isBackedPlaceholder;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFavoriteItem:(id)a3;
- (BOOL)isEqualToShortcut:(id)a3;
- (BOOL)isHidden;
- (BOOL)isSetupPlaceholder;
- (GEOMapItemStorage)geoMapItem;
- (MapsSuggestionsShortcut)initWithCoder:(id)a3;
- (MapsSuggestionsShortcut)initWithFavoriteItem:(id)a3;
- (MapsSuggestionsShortcut)initWithGEOMapItem:(id)a3 customName:(id)a4;
- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 geoMapItem:(id)a4 customName:(id)a5;
- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6;
- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6 contacts:(id)a7 isHidden:(BOOL)a8 originatingAddress:(id)a9;
- (NSArray)contacts;
- (NSArray)stringContacts;
- (NSDate)mapsSyncCreateTime;
- (NSString)customName;
- (NSString)identifier;
- (NSString)originatingAddressString;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)storageIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 customName:(id)a5;
- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 originatingAddress:(id)a5 customName:(id)a6;
- (id)initSetupPlaceholderOfType:(int64_t)a3;
- (int64_t)source;
- (int64_t)type;
- (uint64_t)_originalName;
- (void)addContact:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContact:(id)a3;
- (void)setContacts:(id)a3;
- (void)setCustomName:(id)a3;
- (void)setDerivedFromMeCard:(BOOL)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setMapsSyncCreateTime:(id)a3;
- (void)setOriginatingAddressString:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setStorageIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MapsSuggestionsShortcut

- (GEOMapItemStorage)geoMapItem
{
  return self->_geoMapItem;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(MapsSuggestionsShortcut *)self type];
  v6 = [(MapsSuggestionsShortcut *)self identifier];
  v7 = [(MapsSuggestionsShortcut *)self geoMapItem];
  v8 = [(MapsSuggestionsShortcut *)self customName];
  v9 = [(MapsSuggestionsShortcut *)self contacts];
  BOOL v10 = [(MapsSuggestionsShortcut *)self isHidden];
  v11 = [(MapsSuggestionsShortcut *)self originatingAddressString];
  v12 = (void *)[v4 initWithType:v5 identifier:v6 geoMapItem:v7 customName:v8 contacts:v9 isHidden:v10 originatingAddress:v11];

  v13 = [(MapsSuggestionsShortcut *)self storageIdentifier];
  [v12 setStorageIdentifier:v13];

  objc_msgSend(v12, "setDerivedFromMeCard:", -[MapsSuggestionsShortcut derivedFromMeCard](self, "derivedFromMeCard"));
  v14 = [(MapsSuggestionsShortcut *)self mapsSyncCreateTime];
  [v12 setMapsSyncCreateTime:v14];

  return v12;
}

- (NSString)customName
{
  return self->_customName;
}

- (MapsSuggestionsShortcut)initWithFavoriteItem:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 fetchContactHandles];
  int64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v24 = v4;
  v6 = [v4 sortedArrayUsingSelector:sel_compare_];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [[MapsSuggestionsContact alloc] initWithHandleValue:*(void *)(*((void *)&v25 + 1) + 8 * v10)];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
  uint64_t v12 = (int)[v3 type];
  v13 = [v3 shortcutIdentifier];
  v14 = [v3 mapItemStorage];
  v15 = [v3 customName];
  v16 = (void *)[v5 copy];
  uint64_t v17 = [v3 hidden];
  v18 = [v3 originatingAddressString];
  v19 = [(MapsSuggestionsShortcut *)self initWithType:v12 identifier:v13 geoMapItem:v14 customName:v15 contacts:v16 isHidden:v17 originatingAddress:v18];

  v20 = [v3 identifier];
  [(MapsSuggestionsShortcut *)v19 setStorageIdentifier:v20];

  -[MapsSuggestionsShortcut setSource:](v19, "setSource:", (int)[v3 source]);
  v21 = [v3 createTime];
  [(MapsSuggestionsShortcut *)v19 setMapsSyncCreateTime:v21];

  return v19;
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6 contacts:(id)a7 isHidden:(BOOL)a8 originatingAddress:(id)a9
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)MapsSuggestionsShortcut;
  v20 = [(MapsSuggestionsShortcut *)&v35 init];
  v21 = v20;
  if (a3 == 6 && !v17)
  {
    originatingAddressString = GEOFindOrCreateLog();
    if (os_log_type_enabled(originatingAddressString, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      __int16 v38 = 1024;
      int v39 = 49;
      __int16 v40 = 2082;
      v41 = "-[MapsSuggestionsShortcut initWithType:identifier:geoMapItem:customName:contacts:isHidden:originatingAddress:]";
      __int16 v42 = 2082;
      v43 = "nil == customName";
      _os_log_impl(&dword_1A70DF000, originatingAddressString, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Custom name cannot be nil in init for FavoriteButton Shortcut", buf, 0x26u);
    }
    goto LABEL_15;
  }
  if (v20)
  {
    v20->_type = a3;
    uint64_t v23 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    geoMapItem = v21->_geoMapItem;
    v21->_geoMapItem = (GEOMapItemStorage *)v25;

    if (v18)
    {
      uint64_t v27 = [v18 copy];
      contacts = v21->_contacts;
      v21->_contacts = (NSArray *)v27;
    }
    else
    {
      contacts = v21->_contacts;
      v21->_contacts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v29 = [v16 name];
    if (v29
      && ([v16 name],
          self = (MapsSuggestionsShortcut *)objc_claimAutoreleasedReturnValue(),
          [v17 isEqualToString:self]))
    {
      customName = v21->_customName;
      v21->_customName = 0;
    }
    else
    {
      uint64_t v31 = [v17 copy];
      v32 = v21->_customName;
      v21->_customName = (NSString *)v31;

      if (!v29)
      {
LABEL_14:

        v21->_isHidden = a8;
        uint64_t v33 = [v19 copy];
        originatingAddressString = v21->_originatingAddressString;
        v21->_originatingAddressString = (NSString *)v33;
LABEL_15:

        goto LABEL_16;
      }
    }

    goto LABEL_14;
  }
LABEL_16:

  return v21;
}

- (void)setStorageIdentifier:(id)a3
{
}

- (void)setMapsSyncCreateTime:(id)a3
{
}

- (void)setDerivedFromMeCard:(BOOL)a3
{
  self->_derivedFromMeCard = a3;
}

- (void)setSource:(int64_t)a3
{
  [(MapsSuggestionsShortcut *)self setDerivedFromMeCard:a3 == 1];
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (NSUUID)storageIdentifier
{
  return self->_storageIdentifier;
}

- (NSString)originatingAddressString
{
  return self->_originatingAddressString;
}

- (NSDate)mapsSyncCreateTime
{
  return self->_mapsSyncCreateTime;
}

- (BOOL)derivedFromMeCard
{
  return self->_derivedFromMeCard;
}

- (NSString)title
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsShortcut *)self isSetupPlaceholder]) {
    goto LABEL_2;
  }
  if ([(MapsSuggestionsShortcut *)self isBackedPlaceholder])
  {
    customName = self->_customName;
    if (customName)
    {
      id v3 = customName;
      goto LABEL_9;
    }
LABEL_2:
    MapsSuggestionsLocalizedTitleForShortcutType(self->_type);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    uint64_t v8 = v3;
    goto LABEL_10;
  }
  int64_t v5 = self;
  if ([(MapsSuggestionsShortcut *)v5 type] == 6)
  {
    v6 = [(MapsSuggestionsShortcut *)v5 identifier];
    int v7 = [v6 isEqualToString:@"NearbyTransit"];

    if (v7)
    {
      MapsSuggestionsLocalizedNearbyTransitShortString();
      id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (!v5) {
    goto LABEL_22;
  }
  uint64_t v10 = v5->_customName;
  if (v10)
  {
    uint64_t v8 = v10;
    [(MapsSuggestionsShortcut *)v5 isSetupPlaceholder];
    goto LABEL_10;
  }
  -[MapsSuggestionsShortcut _originalName]((uint64_t *)v5);
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (![(MapsSuggestionsShortcut *)v5 isSetupPlaceholder] && !v8)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      __int16 v14 = 1024;
      int v15 = 184;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsShortcut _name]";
      __int16 v18 = 2082;
      id v19 = "nil == (name)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. It doesn't make sense that there is no name at all", (uint8_t *)&v12, 0x26u);
    }

LABEL_22:
    uint64_t v8 = 0;
  }
LABEL_10:
  return v8;
}

- (BOOL)isSetupPlaceholder
{
  return !self->_geoMapItem && self->_customName == 0;
}

- (BOOL)isBackedPlaceholder
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type > 6) {
    goto LABEL_9;
  }
  if (((1 << type) & 0x2C) != 0)
  {
    v6 = [(MapsSuggestionsShortcut *)self identifier];
    BOOL v5 = v6 != 0;

    return v5;
  }
  if (((1 << type) & 0x42) != 0) {
    return 0;
  }
  if (type)
  {
LABEL_9:
    int v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      __int16 v11 = 1024;
      int v12 = 272;
      __int16 v13 = 2082;
      __int16 v14 = "-[MapsSuggestionsShortcut isBackedPlaceholder]";
      __int16 v15 = 2082;
      __int16 v16 = "YES";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsShortcutType!", (uint8_t *)&v9, 0x26u);
    }

    return 0;
  }
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136446978;
    uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
    __int16 v11 = 1024;
    int v12 = 268;
    __int16 v13 = 2082;
    __int16 v14 = "-[MapsSuggestionsShortcut isBackedPlaceholder]";
    __int16 v15 = 2082;
    __int16 v16 = "YES";
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. A type should have been set!", (uint8_t *)&v9, 0x26u);
  }

  return self->_geoMapItem == 0;
}

- (NSString)identifier
{
  v2 = self;
  objc_sync_enter(v2);
  identifier = v2->_identifier;
  if (identifier
    || (MapsSuggestionsShortcutUniqueIdentifier(v2),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = v2->_identifier,
        v2->_identifier = (NSString *)v4,
        v5,
        (identifier = v2->_identifier) != 0))
  {
    v6 = (void *)[(NSString *)identifier copy];
  }
  else
  {
    v6 = 0;
  }
  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsShortcut *)self isSetupPlaceholder])
  {
    uint64_t v3 = MapsSuggestionsShortcutSetupStringForType(self->_type, 0);
LABEL_6:
    int v7 = (__CFString *)v3;
    goto LABEL_22;
  }
  uint64_t v4 = self;
  if ([(MapsSuggestionsShortcut *)v4 type] == 6)
  {
    BOOL v5 = [(MapsSuggestionsShortcut *)v4 identifier];
    int v6 = [v5 isEqualToString:@"NearbyTransit"];

    if (v6)
    {
      uint64_t v3 = MapsSuggestionsLocalizedNearbyTransitShortSubtitleString();
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v8 = [(MapsSuggestionsShortcut *)v4 geoMapItem];
  MapsSuggestionsMapItemCityName(v8);
  int v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v4->_customName)
  {
    unint64_t type = v4->_type;
    if (type > 6)
    {
LABEL_12:
      __int16 v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446978;
        __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
        __int16 v17 = 1024;
        int v18 = 221;
        __int16 v19 = 2082;
        uint64_t v20 = "BOOL _isHomeOrWorkOrSchool(MapsSuggestionsShortcutType)";
        __int16 v21 = 2082;
        v22 = "YES";
        _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsShortcutType!", (uint8_t *)&v15, 0x26u);
      }

LABEL_15:
      int v12 = -[MapsSuggestionsShortcut _originalName]((uint64_t *)v4);
      if (v12) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (((1 << type) & 0x2C) == 0)
    {
      if (((1 << type) & 0x43) != 0) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
LABEL_16:
  int v12 = MapsSuggestionsMapItemStreetWithNumber(v8);
  if (!v12)
  {
    __int16 v13 = &stru_1EFC640F8;
    if (v9) {
      __int16 v13 = v9;
    }
    int v7 = v13;
    goto LABEL_21;
  }
LABEL_17:
  MapsSuggestionsLocalizedShortcutSubString(v12, v9);
  int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_mapsSyncCreateTime, 0);
  objc_storeStrong((id *)&self->_originatingAddressString, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_customName, 0);
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqualToFavoriteItem:(id)a3
{
  return MapsSuggestionsShortcutIsEqualToMapsSyncFavoriteItem(self, a3, 0);
}

- (int64_t)source
{
  return [(MapsSuggestionsShortcut *)self derivedFromMeCard];
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 identifier:(id)a4 geoMapItem:(id)a5 customName:(id)a6
{
  return [(MapsSuggestionsShortcut *)self initWithType:a3 identifier:a4 geoMapItem:a5 customName:a6 contacts:0 isHidden:0 originatingAddress:0];
}

- (MapsSuggestionsShortcut)initWithType:(int64_t)a3 geoMapItem:(id)a4 customName:(id)a5
{
  return [(MapsSuggestionsShortcut *)self initWithType:a3 identifier:0 geoMapItem:a4 customName:a5];
}

- (MapsSuggestionsShortcut)initWithGEOMapItem:(id)a3 customName:(id)a4
{
  return [(MapsSuggestionsShortcut *)self initWithType:1 geoMapItem:a3 customName:a4];
}

- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 originatingAddress:(id)a5 customName:(id)a6
{
  return [(MapsSuggestionsShortcut *)self initWithType:a3 identifier:a4 geoMapItem:0 customName:a6 contacts:0 isHidden:0 originatingAddress:a5];
}

- (id)initBackedPlaceholderWithType:(int64_t)a3 identifier:(id)a4 customName:(id)a5
{
  return [(MapsSuggestionsShortcut *)self initWithType:a3 identifier:a4 geoMapItem:0 customName:a5 contacts:0 isHidden:0 originatingAddress:0];
}

- (id)initSetupPlaceholderOfType:(int64_t)a3
{
  return [(MapsSuggestionsShortcut *)self initWithType:a3 identifier:0 geoMapItem:0 customName:0];
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  identifier = obj->_identifier;
  obj->_identifier = v4;

  objc_sync_exit(obj);
}

- (void)setCustomName:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[MapsSuggestionsShortcut _originalName]((uint64_t *)self);
  if ([v7 isEqualToString:v4])
  {
    customName = self->_customName;
    self->_customName = 0;
  }
  else
  {
    int v6 = (NSString *)[v7 copy];
    customName = self->_customName;
    self->_customName = v6;
  }
}

- (uint64_t)_originalName
{
  v1 = a1;
  if (a1)
  {
    if ([a1 isBackedPlaceholder])
    {
      MapsSuggestionsLocalizedTitleForShortcutType(v1[3]);
      v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = [v1 geoMapItem];
      v1 = [v2 name];
    }
  }
  return v1;
}

- (void)setGeoMapItem:(id)a3
{
  id v11 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v11 copy];
  geoMapItem = v4->_geoMapItem;
  v4->_geoMapItem = (GEOMapItemStorage *)v5;

  customName = v4->_customName;
  uint64_t v8 = [(GEOMapItemStorage *)v4->_geoMapItem name];
  LODWORD(customName) = [(NSString *)customName isEqualToString:v8];

  if (customName)
  {
    int v9 = v4->_customName;
    v4->_customName = 0;
  }
  identifier = v4->_identifier;
  v4->_identifier = 0;

  objc_sync_exit(v4);
}

- (void)addContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (![(NSArray *)self->_contacts containsObject:v4])
    {
      uint64_t v5 = (void *)[(NSArray *)self->_contacts mutableCopy];
      [v5 addObject:v4];
      int v6 = (NSArray *)[v5 copy];
      contacts = self->_contacts;
      self->_contacts = v6;
    }
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      __int16 v11 = 1024;
      int v12 = 287;
      __int16 v13 = 2082;
      __int16 v14 = "-[MapsSuggestionsShortcut addContact:]";
      __int16 v15 = 2082;
      __int16 v16 = "nil == (contact)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a contact", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)removeContact:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(NSArray *)self->_contacts containsObject:v4])
    {
      uint64_t v5 = (void *)[(NSArray *)self->_contacts mutableCopy];
      [v5 removeObject:v4];
      int v6 = (NSArray *)[v5 copy];
      contacts = self->_contacts;
      self->_contacts = v6;
    }
  }
  else
  {
    uint64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
      __int16 v11 = 1024;
      int v12 = 298;
      __int16 v13 = 2082;
      __int16 v14 = "-[MapsSuggestionsShortcut removeContact:]";
      __int16 v15 = 2082;
      __int16 v16 = "nil == (contact)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a contact", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (NSArray)stringContacts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_contacts, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_contacts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "handleValue", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"MapsSuggestionsShortcutTypeKey"];
  uint64_t v5 = [(MapsSuggestionsShortcut *)self identifier];
  [v6 encodeObject:v5 forKey:@"MapsSuggestionsShortcutIdentifierKey"];

  [v6 encodeObject:self->_customName forKey:@"MapsSuggestionsShortcutNameKey"];
  [v6 encodeObject:self->_geoMapItem forKey:@"MapsSuggestionsShortcutMapItemKey"];
  [v6 encodeObject:self->_contacts forKey:@"MapsSuggestionsShortcutETAContactsKey"];
  [v6 encodeBool:self->_isHidden forKey:@"MapsSuggestionsShortcutIsHiddenKey"];
  [v6 encodeObject:self->_originatingAddressString forKey:@"MapsSuggestionsShortcutOriginatingAddressKey"];
}

- (MapsSuggestionsShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"MapsSuggestionsShortcutTypeKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsShortcutNameKey"];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  int v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"MapsSuggestionsShortcutETAContactsKey"];

  long long v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsShortcutIdentifierKey"];
  long long v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsShortcutMapItemKey"];
  uint64_t v13 = [v4 decodeBoolForKey:@"MapsSuggestionsShortcutIsHiddenKey"];
  long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MapsSuggestionsShortcutOriginatingAddressKey"];

  __int16 v15 = [(MapsSuggestionsShortcut *)self initWithType:v5 identifier:v11 geoMapItem:v12 customName:v6 contacts:v10 isHidden:v13 originatingAddress:v14];
  return v15;
}

- (id)data
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  [v3 finishEncoding];
  id v4 = [v3 encodedData];

  return v4;
}

+ (id)shortcutWithData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v12 = 0;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v12];
    uint64_t v5 = (uint64_t)v12;
    [v4 setDecodingFailurePolicy:1];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v4 finishDecoding];
    uint64_t v7 = [v4 error];
    if (v7 | v5)
    {
    }
    else if (v6)
    {
      id v8 = v6;
LABEL_15:

      goto LABEL_16;
    }
    GEOFindOrCreateLog();
    int v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (char *)v5;
      if (!v5)
      {
        uint64_t v10 = [v4 error];
      }
      *(_DWORD *)buf = 138412290;
      long long v14 = v10;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize MapsSuggestionsShortcut, error: %@", buf, 0xCu);
      if (!v5) {
    }
      }
    id v8 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    long long v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcut.m";
    __int16 v15 = 1024;
    int v16 = 390;
    __int16 v17 = 2082;
    int v18 = "+[MapsSuggestionsShortcut shortcutWithData:]";
    __int16 v19 = 2082;
    uint64_t v20 = "nil == (data)";
    _os_log_impl(&dword_1A70DF000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires serialized data", buf, 0x26u);
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

- (id)description
{
  if (self) {
    BOOL v3 = [(MapsSuggestionsShortcut *)self isBackedPlaceholder]
  }
      || [(MapsSuggestionsShortcut *)self isSetupPlaceholder];
  else {
    BOOL v3 = 0;
  }
  id v29 = [NSString alloc];
  uint64_t v4 = NSStringFromMapsSuggestionsShortcutType(self->_type);
  uint64_t v5 = [(MapsSuggestionsShortcut *)self title];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_1EFC640F8;
  }
  long long v28 = v7;
  uint64_t v8 = [(MapsSuggestionsShortcut *)self subtitle];
  int v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = &stru_1EFC640F8;
  }
  uint64_t v27 = v10;
  uint64_t v11 = [(MapsSuggestionsShortcut *)self geoMapItem];
  if (v11) {
    uint64_t v12 = 89;
  }
  else {
    uint64_t v12 = 78;
  }
  uint64_t v26 = v12;
  uint64_t v13 = "id";
  if (v3) {
    uint64_t v13 = "placeholder";
  }
  v24 = (void *)v11;
  uint64_t v25 = v13;
  long long v14 = [(MapsSuggestionsShortcut *)self identifier];
  __int16 v15 = @"Y";
  uint64_t v30 = (void *)v4;
  if (v14)
  {
    id v16 = [NSString alloc];
    uint64_t v23 = [(MapsSuggestionsShortcut *)self identifier];
    __int16 v17 = (__CFString *)[v16 initWithFormat:@"'%@'", v23];
  }
  else if (v3)
  {
    __int16 v17 = @"Y";
  }
  else
  {
    __int16 v17 = @"N";
  }
  if (self->_isHidden) {
    int v18 = @"Y";
  }
  else {
    int v18 = @"N";
  }
  if (!self->_derivedFromMeCard) {
    __int16 v15 = @"N";
  }
  originatingAddressString = self->_originatingAddressString;
  if (originatingAddressString) {
    uint64_t v20 = (__CFString *)[[NSString alloc] initWithFormat:@" ori='%@'", self->_originatingAddressString];
  }
  else {
    uint64_t v20 = &stru_1EFC640F8;
  }
  uint64_t v21 = (void *)[v29 initWithFormat:@"SHORTCUT{%@} '%@' / '%@' mapItem=%c %s=%@ hidden=%@ meCard=%@%@ sharedETAs=%u", v30, v28, v27, v26, v25, v17, v18, v15, v20, -[NSArray count](self->_contacts, "count")];
  if (originatingAddressString) {

  }
  if (v14)
  {
  }
  return v21;
}

- (BOOL)isEqualToShortcut:(id)a3
{
  uint64_t v4 = (MapsSuggestionsShortcut *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  if (self == v4)
  {
    BOOL v15 = 1;
    goto LABEL_16;
  }
  if (self->_type != v4->_type) {
    goto LABEL_14;
  }
  if (self->_isHidden != v4->_isHidden) {
    goto LABEL_14;
  }
  id v6 = [(MapsSuggestionsShortcut *)self identifier];
  uint64_t v7 = [(MapsSuggestionsShortcut *)v5 identifier];

  if (v6 != v7)
  {
    uint64_t v8 = [(MapsSuggestionsShortcut *)self identifier];
    int v9 = [(MapsSuggestionsShortcut *)v5 identifier];
    int v10 = [v8 isEqualToString:v9];

    if (!v10) {
      goto LABEL_14;
    }
  }
  if (((customName = self->_customName, customName == v5->_customName)
     || -[NSString isEqualToString:](customName, "isEqualToString:"))
    && ((originatingAddressString = self->_originatingAddressString,
         originatingAddressString == v5->_originatingAddressString)
     || -[NSString isEqualToString:](originatingAddressString, "isEqualToString:"))
    && ((geoMapItem = self->_geoMapItem, long long v14 = v5->_geoMapItem, geoMapItem == v14)
     || MapsSuggestionsMapItemsAreEqual(geoMapItem, v14, 1, 1, 1)))
  {
    BOOL v15 = [(NSArray *)self->_contacts isEqualToArray:v5->_contacts];
  }
  else
  {
LABEL_14:
    BOOL v15 = 0;
  }
LABEL_16:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MapsSuggestionsShortcut *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(MapsSuggestionsShortcut *)self isEqualToShortcut:v4];
  }

  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (void)setOriginatingAddressString:(id)a3
{
}

- (void)setContacts:(id)a3
{
}

@end