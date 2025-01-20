@interface GEOSearchCategory
+ (BOOL)supportsSecureCoding;
+ (id)categoryForURL:(id)a3;
+ (void)sendFeedbackForVisibleCategories:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubCategorySameAsTopLevel;
- (GEOFeatureStyleAttributes)styleAttributes;
- (GEOPDAutocompleteEntry)_autocompleteEntry;
- (GEOSearchCategory)initWithAutocompleteEntry:(id)a3;
- (GEOSearchCategory)initWithBrowseCategory:(id)a3;
- (GEOSearchCategory)initWithCoder:(id)a3;
- (GEOSearchCategory)initWithStorage:(id)a3;
- (GEOVenueIdentifier)venueIdentifier;
- (NSArray)subcategories;
- (NSData)_suggestionEntryMetadata;
- (NSString)displayString;
- (NSString)popularTokenString;
- (NSString)shortDisplayString;
- (NSURL)mapsURL;
- (id)_browseCategory;
- (id)serverMetadata;
- (int)displayMode;
- (int)sortOrder;
- (int)subCategoryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOSearchCategory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOSearchCategory)initWithBrowseCategory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = (id *)a3;
  v25.receiver = self;
  v25.super_class = (Class)GEOSearchCategory;
  v6 = [(GEOSearchCategory *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_browseCategory, a3);
    if (v5)
    {
      -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)v5);
      if ([v5[7] count])
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
        -[GEOPDBrowseCategory _readSubCategorys]((uint64_t)v5);
        v9 = (NSArray *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v5[7], "count"));
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v10 = -[GEOPDBrowseCategory subCategorys](v5);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
              v16 = [GEOSearchCategory alloc];
              v17 = -[GEOSearchCategory initWithBrowseCategory:](v16, "initWithBrowseCategory:", v15, (void)v21);
              if (v17) {
                [(NSArray *)v9 addObject:v17];
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
          }
          while (v12);
        }

        subcategories = v7->_subcategories;
        v7->_subcategories = v9;
      }
    }
    v19 = v7;
  }

  return v7;
}

- (GEOSearchCategory)initWithAutocompleteEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchCategory;
  v6 = [(GEOSearchCategory *)&v9 init];
  if (v6 && [v5 type] == 3 && objc_msgSend(v5, "hasCategory"))
  {
    objc_storeStrong((id *)&v6->_autocompleteEntry, a3);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GEOSearchCategory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CategoryStorage"];

  if (v5)
  {
    v6 = [[GEOSearchCategoryStorage alloc] initWithData:v5];
    self = [(GEOSearchCategory *)self initWithStorage:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [[GEOSearchCategoryStorage alloc] initWithSearchCategory:self];
  id v5 = [(GEOSearchCategoryStorage *)v4 data];
  if (v5) {
    [v6 encodeObject:v5 forKey:@"CategoryStorage"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (GEOSearchCategory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(GEOPDBrowseCategory *)self->_browseCategory isEqual:v4->_browseCategory];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(GEOPDBrowseCategory *)self->_browseCategory hash];
}

- (NSString)displayString
{
  autocompleteEntry = self->_autocompleteEntry;
  if (autocompleteEntry)
  {
    id v4 = [(GEOPDAutocompleteEntry *)autocompleteEntry category];
    BOOL v5 = [v4 displayName];
    id v6 = [v5 stringValue];
  }
  else
  {
    id v6 = -[GEOPDBrowseCategory displayString]((id *)&self->_browseCategory->super.super.isa);
  }

  return (NSString *)v6;
}

- (NSString)shortDisplayString
{
  browseCategory = self->_browseCategory;
  if (browseCategory
    && (-[GEOPDBrowseCategory _readShortDisplayString]((uint64_t)self->_browseCategory),
        browseCategory->_shortDisplayString))
  {
    id v4 = -[GEOPDBrowseCategory shortDisplayString]((id *)&self->_browseCategory->super.super.isa);
  }
  else
  {
    id v4 = [(GEOSearchCategory *)self displayString];
  }

  return (NSString *)v4;
}

- (NSString)popularTokenString
{
  browseCategory = self->_browseCategory;
  if (browseCategory
    && (-[GEOPDBrowseCategory _readPopularDisplayToken]((uint64_t)self->_browseCategory),
        browseCategory->_popularDisplayToken))
  {
    id v4 = -[GEOPDBrowseCategory popularDisplayToken]((id *)&self->_browseCategory->super.super.isa);
  }
  else
  {
    id v4 = [(GEOSearchCategory *)self displayString];
  }

  return (NSString *)v4;
}

- (NSData)_suggestionEntryMetadata
{
  autocompleteEntry = self->_autocompleteEntry;
  if (autocompleteEntry)
  {
    id v4 = [(GEOPDAutocompleteEntry *)autocompleteEntry category];
    BOOL v5 = [v4 suggestionEntryMetadata];
  }
  else
  {
    BOOL v5 = -[GEOPDBrowseCategory suggestionEntryMetadata]((id *)&self->_browseCategory->super.super.isa);
  }

  return (NSData *)v5;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  autocompleteEntry = self->_autocompleteEntry;
  if (autocompleteEntry)
  {
    id v4 = [(GEOPDAutocompleteEntry *)autocompleteEntry category];
    BOOL v5 = [v4 styleAttributes];

    if (v5)
    {
LABEL_3:
      id v6 = [[GEOFeatureStyleAttributes alloc] initWithPlaceDataStyleAttributes:v5];
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v5 = -[GEOPDBrowseCategory styleAttributes]((id *)&self->_browseCategory->super.super.isa);
    if (v5) {
      goto LABEL_3;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (GEOVenueIdentifier)venueIdentifier
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry category];
  id v4 = [v3 venueIdentifier];

  if (v4)
  {
    BOOL v5 = [GEOVenueIdentifier alloc];
    id v6 = [(GEOPDAutocompleteEntry *)self->_autocompleteEntry category];
    v7 = [v6 venueIdentifier];
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    objc_super v9 = [(GEOVenueIdentifier *)v5 initWithVenueIdentifiers:v8];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (NSURL)mapsURL
{
  browseCategory = self->_browseCategory;
  if (browseCategory)
  {
    v3 = [(GEOPDBrowseCategory *)browseCategory data];
    id v4 = [v3 base64EncodedStringWithOptions:0];

    BOOL v5 = [NSString stringWithFormat:@"x-maps-category://?category=%@", v4];
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSURL *)v6;
}

+ (id)categoryForURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 query];
  v26 = v3;
  if (![v4 length])
  {
    uint64_t v5 = [v3 resourceSpecifier];

    id v4 = (void *)v5;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_super v25 = v4;
  v7 = [v4 componentsSeparatedByString:@"&"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ((unint64_t)[v12 count] >= 2)
        {
          uint64_t v13 = objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
          uint64_t v14 = [v13 componentsJoinedByString:@"="];
          uint64_t v15 = [v12 objectAtIndexedSubscript:0];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  v16 = [v6 objectForKeyedSubscript:@"user_session_entity"];
  if (v16)
  {
    v17 = [[GEOUserSessionEntity alloc] initWithSessionEntityString:v16];
    v18 = +[GEOUserSession sharedInstance];
    [v18 setMapsUserSessionEntity:v17];
  }
  v19 = [v6 objectForKeyedSubscript:@"category"];
  if (v19)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v19 options:0];
    if (v20)
    {
      long long v21 = [[GEOPDBrowseCategory alloc] initWithData:v20];
      if (v21) {
        long long v22 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBrowseCategory:v21];
      }
      else {
        long long v22 = 0;
      }
      long long v23 = v25;
    }
    else
    {
      long long v22 = 0;
      long long v23 = v25;
    }
  }
  else
  {
    long long v22 = 0;
    long long v23 = v25;
  }

  return v22;
}

- (id)_browseCategory
{
  return self->_browseCategory;
}

- (int)displayMode
{
  int v2 = -[GEOPDBrowseCategory displayMode]((uint64_t)self->_browseCategory);
  if (v2 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int)sortOrder
{
  int v2 = -[GEOPDBrowseCategory sortOrder]((uint64_t)self->_browseCategory);
  if (v2 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int)subCategoryType
{
  int v2 = -[GEOPDBrowseCategory subCategoryType]((uint64_t)self->_browseCategory);
  if (v2 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)isSubCategorySameAsTopLevel
{
  browseCategory = self->_browseCategory;
  return browseCategory && browseCategory->_isSubCategorySameAsTopLevel;
}

- (GEOPDAutocompleteEntry)_autocompleteEntry
{
  return self->_autocompleteEntry;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_autocompleteEntry, 0);

  objc_storeStrong((id *)&self->_browseCategory, 0);
}

- (GEOSearchCategory)initWithStorage:(id)a3
{
  id v4 = a3;
  if ([v4 hasBrowseCategory])
  {
    uint64_t v5 = [v4 browseCategory];

    id v6 = [(GEOSearchCategory *)self initWithBrowseCategory:v5];
  }
  else
  {
    uint64_t v5 = [v4 autocompleteEntry];

    id v6 = [(GEOSearchCategory *)self initWithAutocompleteEntry:v5];
  }
  v7 = v6;

  return v7;
}

+ (void)sendFeedbackForVisibleCategories:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) _suggestionEntryMetadata];
        if (v9)
        {
          if (!v6) {
            id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v10 = (void *)qword_1EB29FE38;
  qword_1EB29FE38 = (uint64_t)v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_263);
}

- (id)serverMetadata
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  id v3 = (id)qword_1EB29FE38;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_263);
  uint64_t v4 = objc_alloc_init(GEOMapsServerMetadata);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOMapsServerMetadata addSuggestionEntryMetadataDisplayed:](v4, "addSuggestionEntryMetadataDisplayed:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(GEOSearchCategory *)self _suggestionEntryMetadata];
  [(GEOMapsServerMetadata *)v4 setSuggestionEntryMetadataTappedOn:v10];

  return v4;
}

@end