@interface MPModelLibraryRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)disableImplicitSectioning;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpgradedSmartPlaylistLegacyMediaQuery;
- (BOOL)sortUsingAllowedItemIdentifiers;
- (BOOL)wantsDetailedKeepLocalRequestableResponse;
- (MPMediaLibrary)_mediaLibrary;
- (MPMediaLibrary)mediaLibrary;
- (MPMediaQuery)legacyMediaQuery;
- (MPModelLibraryRequest)initWithCoder:(id)a3;
- (NSArray)allowedItemIdentifiers;
- (NSArray)allowedSectionIdentifiers;
- (NSArray)itemPropertyFilters;
- (NSArray)scopedContainers;
- (NSArray)sectionPropertyFilters;
- (NSString)description;
- (NSString)filterText;
- (NSString)sectionFilterText;
- (_NSRange)contentRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemTranslationContext;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)sectionTranslationContext;
- (unint64_t)filteringOptions;
- (void)encodeWithCoder:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setAllowedItemIdentifiers:(id)a3;
- (void)setAllowedSectionIdentifiers:(id)a3;
- (void)setContentRange:(_NSRange)a3;
- (void)setDisableImplicitSectioning:(BOOL)a3;
- (void)setFilterText:(id)a3;
- (void)setFilteringOptions:(unint64_t)a3;
- (void)setItemPropertyFilters:(id)a3;
- (void)setLegacyMediaQuery:(id)a3;
- (void)setLegacyMediaQuery:(id)a3 forTransport:(BOOL)a4;
- (void)setMediaLibrary:(id)a3;
- (void)setScopedContainers:(id)a3;
- (void)setSectionFilterText:(id)a3;
- (void)setSectionPropertyFilters:(id)a3;
- (void)setSortUsingAllowedItemIdentifiers:(BOOL)a3;
- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3;
@end

@implementation MPModelLibraryRequest

- (void)setMediaLibrary:(id)a3
{
}

- (void)setFilteringOptions:(unint64_t)a3
{
  self->_filteringOptions = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performWithResponseHandler:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MPModelLibraryRequest;
  [(MPModelRequest *)&v3 performWithResponseHandler:a3];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryRequestOperation);
  [(MPModelLibraryRequestOperation *)v5 setResponseHandler:v4];
  [(MPModelLibraryRequestOperation *)v5 setRequest:self];

  return v5;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)MPModelLibraryRequest;
  objc_super v3 = [(MPModelRequest *)&v13 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if (self->_legacyMediaQuery) {
    [v4 appendFormat:@" legacyMediaQuery=%@", self->_legacyMediaQuery];
  }
  if ([(NSArray *)self->_allowedItemIdentifiers count])
  {
    v5 = [(NSArray *)self->_allowedItemIdentifiers valueForKeyPath:@"humanDescription"];
    v6 = [v5 componentsJoinedByString:@", "];
    [v4 appendFormat:@" allowedItemIdentifiers=[%@]", v6];
  }
  if ([(NSArray *)self->_allowedSectionIdentifiers count])
  {
    v7 = [(NSArray *)self->_allowedSectionIdentifiers valueForKeyPath:@"humanDescription"];
    v8 = [v7 componentsJoinedByString:@", "];
    [v4 appendFormat:@" allowedSectionIdentifiers=[%@]", v8];
  }
  if ([(NSArray *)self->_scopedContainers count])
  {
    v9 = [(NSArray *)self->_scopedContainers valueForKeyPath:@"humanDescription"];
    v10 = [v9 componentsJoinedByString:@", "];
    [v4 appendFormat:@" scopedContainers=[%@]", v10];
  }
  if ([(NSString *)self->_filterText length]) {
    [v4 appendFormat:@" filterText=\"%@\"", self->_filterText];
  }
  if (self->_sortUsingAllowedItemIdentifiers) {
    [v4 appendString:@" sortUsingAllowedItemIdentifiers=YES"];
  }
  if ([(NSArray *)self->_itemPropertyFilters count]) {
    [v4 appendFormat:@" itemPropertyFilters=%@", self->_itemPropertyFilters];
  }
  if ([(NSArray *)self->_sectionPropertyFilters count]) {
    [v4 appendFormat:@" sectionPropertyFilters=%@", self->_sectionPropertyFilters];
  }
  [v4 appendString:@">"];
  v11 = (void *)[v4 copy];

  return (NSString *)v11;
}

- (MPMediaLibrary)mediaLibrary
{
  mediaLibrary = self->_mediaLibrary;
  if (mediaLibrary)
  {
    objc_super v3 = mediaLibrary;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB87B8] activeAccount];
    objc_super v3 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v4];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MPModelLibraryRequest;
  id v4 = [(MPModelRequest *)&v9 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 10, self->_allowedItemIdentifiers);
    objc_storeStrong(v5 + 11, self->_allowedSectionIdentifiers);
    objc_storeStrong(v5 + 12, self->_scopedContainers);
    *(_NSRange *)(v5 + 19) = self->_contentRange;
    v5[13] = self->_filteringOptions;
    objc_storeStrong(v5 + 14, self->_filterText);
    objc_storeStrong(v5 + 15, self->_sectionFilterText);
    *((unsigned char *)v5 + 64) = self->_wantsDetailedKeepLocalRequestableResponse;
    *((unsigned char *)v5 + 65) = self->_sortUsingAllowedItemIdentifiers;
    *((unsigned char *)v5 + 67) = self->_disableImplicitSectioning;
    objc_storeStrong(v5 + 9, self->_mediaLibrary);
    uint64_t v6 = [(MPMediaQuery *)self->_legacyMediaQuery copy];
    id v7 = v5[18];
    v5[18] = (id)v6;

    objc_storeStrong(v5 + 16, self->_itemPropertyFilters);
    objc_storeStrong(v5 + 17, self->_sectionPropertyFilters);
    *((unsigned char *)v5 + 66) = self->_isUpgradedSmartPlaylistLegacyMediaQuery;
  }
  return v5;
}

- (MPMediaQuery)legacyMediaQuery
{
  return self->_legacyMediaQuery;
}

- (void)setDisableImplicitSectioning:(BOOL)a3
{
  self->_disableImplicitSectioning = a3;
}

- (MPMediaLibrary)_mediaLibrary
{
  return self->_mediaLibrary;
}

- (id)itemTranslationContext
{
  objc_super v3 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  id v4 = [(MPModelLibraryRequest *)self allowedItemIdentifiers];
  [(MPMediaLibraryEntityTranslationContext *)v3 setAllowedEntityIdentifiers:v4];

  v5 = [(MPModelLibraryRequest *)self filterText];
  [(MPMediaLibraryEntityTranslationContext *)v3 setFilterText:v5];

  [(MPMediaLibraryEntityTranslationContext *)v3 setFilteringOptions:[(MPModelLibraryRequest *)self filteringOptions]];
  uint64_t v6 = [(MPModelLibraryRequest *)self mediaLibrary];
  [(MPMediaLibraryEntityTranslationContext *)v3 setMediaLibrary:v6];

  id v7 = [(MPModelRequest *)self itemKind];
  [(MPMediaLibraryEntityTranslationContext *)v3 setModelKind:v7];

  v8 = [(MPModelRequest *)self itemKind];
  -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v3, "setMultiQuery:", [v8 modelClass] == objc_opt_class());

  if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
  {
    objc_super v9 = [(MPModelLibraryRequest *)self mediaLibrary];
    v10 = [v9 userIdentity];
    v11 = [v10 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v3 setPersonID:v11];
  }
  v12 = [(MPModelLibraryRequest *)self itemPropertyFilters];
  [(MPMediaLibraryEntityTranslationContext *)v3 setPropertyFilters:v12];

  uint64_t v13 = [(MPModelLibraryRequest *)self scopedContainers];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  [(MPMediaLibraryEntityTranslationContext *)v3 setScopedContainers:v15];

  return v3;
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (NSArray)itemPropertyFilters
{
  return self->_itemPropertyFilters;
}

- (NSString)filterText
{
  return self->_filterText;
}

- (NSArray)allowedItemIdentifiers
{
  return self->_allowedItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMediaQuery, 0);
  objc_storeStrong((id *)&self->_sectionPropertyFilters, 0);
  objc_storeStrong((id *)&self->_itemPropertyFilters, 0);
  objc_storeStrong((id *)&self->_sectionFilterText, 0);
  objc_storeStrong((id *)&self->_filterText, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (MPModelLibraryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MPModelLibraryRequest;
  v5 = [(MPModelRequest *)&v41 initWithCoder:v4];
  if (v5)
  {
    v5->_wantsDetailedKeepLocalRequestableResponse = [v4 decodeBoolForKey:@"MPModelLibraryRequestWantsDetailedKeepLocalRequestableResponse"];
    v5->_sortUsingAllowedItemIdentifiers = [v4 decodeBoolForKey:@"_MPModelLibraryRequestCodingKeySortUsingAllowedItemIdentifiers"];
    v5->_disableImplicitSectioning = [v4 decodeBoolForKey:@"MPModelLibraryRequestDisableImplicitSectioning"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:&stru_1EE680640];
    scopedContainers = v5->_scopedContainers;
    v5->_scopedContainers = (NSArray *)v9;

    uint64_t v11 = [v4 decodeIntegerForKey:@"MPModelLibraryRequestContentRangeLocation"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"MPModelLibraryRequestContentRangeLength"];
    v5->_contentRange.location = v11;
    v5->_contentRange.length = v12;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"MPModelLibraryRequestAllowedItemIdentifiers"];
    allowedItemIdentifiers = v5->_allowedItemIdentifiers;
    v5->_allowedItemIdentifiers = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"MPModelLibraryRequestAllowedSectionIdentifiers"];
    allowedSectionIdentifiers = v5->_allowedSectionIdentifiers;
    v5->_allowedSectionIdentifiers = (NSArray *)v21;

    v5->_filteringOptions = [v4 decodeIntegerForKey:@"MPModelLibraryRequestFilteringOptions"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibraryRequestFilterText"];
    filterText = v5->_filterText;
    v5->_filterText = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibraryRequestSectionFilterText"];
    sectionFilterText = v5->_sectionFilterText;
    v5->_sectionFilterText = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibraryRequestMediaLibrary"];
    mediaLibrary = v5->_mediaLibrary;
    v5->_mediaLibrary = (MPMediaLibrary *)v27;

    v5->_isUpgradedSmartPlaylistLegacyMediaQuery = [v4 decodeBoolForKey:@"MPModelLibraryRequestCodingKeyIsUpgradedSmartPlaylistLegacyMediaQuery"];
    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibraryRequestLegacyMediaQuery"];
    if (v29) {
      [(MPModelLibraryRequest *)v5 setLegacyMediaQuery:v29];
    }
    v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"_MPModelLibraryRequestPropertyFilter"];
    itemPropertyFilters = v5->_itemPropertyFilters;
    v5->_itemPropertyFilters = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"MPModelLibraryRequestSectionPropertyFilters"];
    sectionPropertyFilters = v5->_sectionPropertyFilters;
    v5->_sectionPropertyFilters = (NSArray *)v38;
  }
  return v5;
}

- (void)setLegacyMediaQuery:(id)a3 forTransport:(BOOL)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (MPMediaQuery *)a3;
  uint64_t v7 = v6;
  if (self->_legacyMediaQuery != v6)
  {
    v8 = (MPMediaQuery *)[(MPMediaQuery *)v6 copy];
    legacyMediaQuery = self->_legacyMediaQuery;
    self->_legacyMediaQuery = v8;

    v10 = self->_legacyMediaQuery;
    if (v10)
    {
      if (!a4)
      {
        uint64_t v11 = [(MPMediaQuery *)v10 mediaLibrary];
        mediaLibrary = self->_mediaLibrary;
        self->_mediaLibrary = v11;

        uint64_t v13 = [(MPMediaQuery *)self->_legacyMediaQuery _representativeCollection];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([v13 playlistAttributes] & 2) != 0)
          {
            self->_isUpgradedSmartPlaylistLegacyMediaQuery = 1;
            uint64_t v14 = self->_legacyMediaQuery;
            self->_legacyMediaQuery = 0;

            uint64_t v15 = [MPModelPlaylist alloc];
            uint64_t v16 = [MPIdentifierSet alloc];
            v17 = +[MPModelPlaylistKind identityKind];
            uint64_t v27 = MEMORY[0x1E4F143A8];
            uint64_t v28 = 3221225472;
            v29 = __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke;
            v30 = &unk_1E57F95D0;
            uint64_t v31 = self;
            id v32 = v13;
            v18 = [(MPIdentifierSet *)v16 initWithSource:@"LibraryRequest" modelKind:v17 block:&v27];
            uint64_t v19 = -[MPModelObject initWithIdentifiers:](v15, "initWithIdentifiers:", v18, v27, v28, v29, v30, v31);
            v33[0] = v19;
            v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
            scopedContainers = self->_scopedContainers;
            self->_scopedContainers = v20;
          }
          v22 = +[MPModelPlaylistKind identityKind];
          [(MPModelRequest *)self setSectionKind:v22];

          uint64_t v23 = +[MPModelPlaylistEntryKind identityKind];
          [(MPModelRequest *)self setItemKind:v23];
        }
        else
        {
          unint64_t v24 = [v13 groupingType] - 1;
          if (v24 >= 5)
          {
            uint64_t v25 = 0;
          }
          else
          {
            uint64_t v25 = [(__objc2_class *)*off_1E57EEEC8[v24] identityKind];
          }
          [(MPModelRequest *)self setSectionKind:v25];
          v26 = +[MPModelSongKind identityKind];
          [(MPModelRequest *)self setItemKind:v26];
        }
      }
    }
  }
}

- (void)setLegacyMediaQuery:(id)a3
{
}

- (BOOL)disableImplicitSectioning
{
  return self->_disableImplicitSectioning;
}

- (void)setSectionPropertyFilters:(id)a3
{
}

- (NSArray)sectionPropertyFilters
{
  return self->_sectionPropertyFilters;
}

- (void)setItemPropertyFilters:(id)a3
{
}

- (BOOL)isUpgradedSmartPlaylistLegacyMediaQuery
{
  return self->_isUpgradedSmartPlaylistLegacyMediaQuery;
}

- (void)setSortUsingAllowedItemIdentifiers:(BOOL)a3
{
  self->_sortUsingAllowedItemIdentifiers = a3;
}

- (BOOL)sortUsingAllowedItemIdentifiers
{
  return self->_sortUsingAllowedItemIdentifiers;
}

- (void)setWantsDetailedKeepLocalRequestableResponse:(BOOL)a3
{
  self->_wantsDetailedKeepLocalRequestableResponse = a3;
}

- (BOOL)wantsDetailedKeepLocalRequestableResponse
{
  return self->_wantsDetailedKeepLocalRequestableResponse;
}

- (void)setContentRange:(_NSRange)a3
{
  self->_contentRange = a3;
}

- (_NSRange)contentRange
{
  p_contentRange = &self->_contentRange;
  NSUInteger location = self->_contentRange.location;
  NSUInteger length = p_contentRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSectionFilterText:(id)a3
{
}

- (NSString)sectionFilterText
{
  return self->_sectionFilterText;
}

- (void)setFilterText:(id)a3
{
}

- (void)setScopedContainers:(id)a3
{
}

- (void)setAllowedSectionIdentifiers:(id)a3
{
}

- (NSArray)allowedSectionIdentifiers
{
  return self->_allowedSectionIdentifiers;
}

- (void)setAllowedItemIdentifiers:(id)a3
{
}

- (id)sectionTranslationContext
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(MPMediaLibraryEntityTranslationContext);
  id v4 = [(MPModelLibraryRequest *)self mediaLibrary];
  [(MPMediaLibraryEntityTranslationContext *)v3 setMediaLibrary:v4];

  uint64_t v28 = [(MPModelLibraryRequest *)self allowedSectionIdentifiers];
  v5 = [(MPModelLibraryRequest *)self scopedContainers];

  if (v5)
  {
    uint64_t v6 = [(MPModelLibraryRequest *)self scopedContainers];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (v28) {
      id v8 = (id)[v28 mutableCopy];
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v10 = v8;
    uint64_t v11 = [(MPModelRequest *)self sectionKind];
    uint64_t v12 = [v11 modelClass];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = [(MPModelLibraryRequest *)self scopedContainers];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_opt_class() == v12)
          {
            [v7 removeObject:v17];
            v18 = [v17 identifiers];
            [v10 addObject:v18];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [v10 copy];
    [(MPMediaLibraryEntityTranslationContext *)v3 setScopedContainers:v7];

    uint64_t v9 = (void *)v19;
  }
  else
  {
    uint64_t v9 = v28;
  }
  v29 = v9;
  -[MPMediaLibraryEntityTranslationContext setAllowedEntityIdentifiers:](v3, "setAllowedEntityIdentifiers:");
  v20 = [(MPModelRequest *)self sectionKind];
  -[MPMediaLibraryEntityTranslationContext setMultiQuery:](v3, "setMultiQuery:", [v20 modelClass] == objc_opt_class());

  [(MPMediaLibraryEntityTranslationContext *)v3 setFilteringOptions:[(MPModelLibraryRequest *)self filteringOptions]];
  uint64_t v21 = [(MPModelRequest *)self sectionKind];
  [(MPMediaLibraryEntityTranslationContext *)v3 setModelKind:v21];

  if ([MEMORY[0x1E4FB87C0] canAccessAccountStore])
  {
    v22 = [(MPModelLibraryRequest *)self mediaLibrary];
    uint64_t v23 = [v22 userIdentity];
    unint64_t v24 = [v23 accountDSID];
    [(MPMediaLibraryEntityTranslationContext *)v3 setPersonID:v24];
  }
  uint64_t v25 = [(MPModelLibraryRequest *)self sectionFilterText];
  [(MPMediaLibraryEntityTranslationContext *)v3 setFilterText:v25];

  v26 = [(MPModelLibraryRequest *)self sectionPropertyFilters];
  [(MPMediaLibraryEntityTranslationContext *)v3 setPropertyFilters:v26];

  return v3;
}

void __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 72) uniqueIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke_2;
  v5[3] = &unk_1E57F96A0;
  id v6 = *(id *)(a1 + 40);
  [v3 setLibraryIdentifiersWithDatabaseID:v4 block:v5];
}

void __58__MPModelLibraryRequest_setLegacyMediaQuery_forTransport___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) == 0) {
    goto LABEL_52;
  }
  v5 = [(MPModelRequest *)self itemKind];
  id v6 = [v4 itemKind];
  id v7 = v5;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    char v10 = [v7 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_52;
    }
  }
  uint64_t v11 = [(MPModelRequest *)self sectionKind];
  uint64_t v12 = [v4 sectionKind];
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {
  }
  else
  {
    uint64_t v15 = v14;
    char v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_52;
    }
  }
  v17 = [(MPModelRequest *)self itemSortDescriptors];
  v18 = [v4 itemSortDescriptors];
  id v19 = v17;
  id v20 = v18;
  if (v19 == v20)
  {
  }
  else
  {
    uint64_t v21 = v20;
    char v22 = [v19 isEqual:v20];

    if ((v22 & 1) == 0) {
      goto LABEL_52;
    }
  }
  uint64_t v23 = [(MPModelRequest *)self sectionSortDescriptors];
  unint64_t v24 = [v4 sectionSortDescriptors];
  id v25 = v23;
  id v26 = v24;
  if (v25 == v26)
  {
  }
  else
  {
    uint64_t v27 = v26;
    char v28 = [v25 isEqual:v26];

    if ((v28 & 1) == 0) {
      goto LABEL_52;
    }
  }
  v29 = [(MPModelLibraryRequest *)self allowedItemIdentifiers];
  long long v30 = [v4 allowedItemIdentifiers];
  id v31 = v29;
  id v32 = v30;
  if (v31 == v32)
  {
  }
  else
  {
    long long v33 = v32;
    char v34 = [v31 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_52;
    }
  }
  uint64_t v35 = [(MPModelLibraryRequest *)self allowedSectionIdentifiers];
  uint64_t v36 = [v4 allowedSectionIdentifiers];
  id v37 = v35;
  id v38 = v36;
  if (v37 == v38)
  {
  }
  else
  {
    v39 = v38;
    char v40 = [v37 isEqual:v38];

    if ((v40 & 1) == 0) {
      goto LABEL_52;
    }
  }
  objc_super v41 = [(MPModelLibraryRequest *)self scopedContainers];
  v42 = [v4 scopedContainers];
  id v43 = v41;
  id v44 = v42;
  if (v43 == v44)
  {
  }
  else
  {
    v45 = v44;
    char v46 = [v43 isEqual:v44];

    if ((v46 & 1) == 0) {
      goto LABEL_52;
    }
  }
  uint64_t v47 = [(MPModelLibraryRequest *)self contentRange];
  if (v47 != [v4 contentRange]) {
    goto LABEL_52;
  }
  [(MPModelLibraryRequest *)self contentRange];
  uint64_t v49 = v48;
  [v4 contentRange];
  if (v49 != v50) {
    goto LABEL_52;
  }
  v51 = [(MPModelLibraryRequest *)self filterText];
  v52 = [v4 filterText];
  id v53 = v51;
  id v54 = v52;
  if (v53 == v54)
  {
  }
  else
  {
    v55 = v54;
    char v56 = [v53 isEqual:v54];

    if ((v56 & 1) == 0) {
      goto LABEL_52;
    }
  }
  v57 = [(MPModelLibraryRequest *)self sectionFilterText];
  v58 = [v4 sectionFilterText];
  id v59 = v57;
  id v60 = v58;
  if (v59 == v60)
  {
  }
  else
  {
    v61 = v60;
    char v62 = [v59 isEqual:v60];

    if ((v62 & 1) == 0) {
      goto LABEL_52;
    }
  }
  int v63 = [(MPModelLibraryRequest *)self sortUsingAllowedItemIdentifiers];
  if (v63 != [v4 sortUsingAllowedItemIdentifiers]) {
    goto LABEL_52;
  }
  v64 = [(MPModelLibraryRequest *)self mediaLibrary];
  v65 = [v4 mediaLibrary];
  id v66 = v64;
  id v67 = v65;
  if (v66 == v67)
  {
  }
  else
  {
    v68 = v67;
    char v69 = [v66 isEqual:v67];

    if ((v69 & 1) == 0) {
      goto LABEL_52;
    }
  }
  unint64_t v70 = [(MPModelLibraryRequest *)self filteringOptions];
  if (v70 != [v4 filteringOptions])
  {
LABEL_52:
    char v83 = 0;
    goto LABEL_53;
  }
  v71 = [(MPModelLibraryRequest *)self itemPropertyFilters];
  v72 = [v4 itemPropertyFilters];
  id v73 = v71;
  id v74 = v72;
  if (v73 == v74)
  {
  }
  else
  {
    v75 = v74;
    char v76 = [v73 isEqual:v74];

    if ((v76 & 1) == 0) {
      goto LABEL_52;
    }
  }
  v77 = [(MPModelLibraryRequest *)self sectionPropertyFilters];
  v78 = [v4 sectionPropertyFilters];
  id v79 = v77;
  id v80 = v78;
  if (v79 == v80)
  {
  }
  else
  {
    v81 = v80;
    char v82 = [v79 isEqual:v80];

    if ((v82 & 1) == 0) {
      goto LABEL_52;
    }
  }
  v85 = [(MPModelLibraryRequest *)self legacyMediaQuery];
  v86 = [v4 legacyMediaQuery];
  id v87 = v85;
  id v88 = v86;
  if (v87 == v88) {
    char v83 = 1;
  }
  else {
    char v83 = [v87 isEqual:v88];
  }

LABEL_53:
  return v83;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPModelLibraryRequest;
  [(MPModelRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_wantsDetailedKeepLocalRequestableResponse forKey:@"MPModelLibraryRequestWantsDetailedKeepLocalRequestableResponse"];
  [v4 encodeBool:self->_sortUsingAllowedItemIdentifiers forKey:@"_MPModelLibraryRequestCodingKeySortUsingAllowedItemIdentifiers"];
  [v4 encodeBool:self->_disableImplicitSectioning forKey:@"MPModelLibraryRequestDisableImplicitSectioning"];
  [v4 encodeObject:self->_allowedItemIdentifiers forKey:@"MPModelLibraryRequestAllowedItemIdentifiers"];
  [v4 encodeObject:self->_allowedSectionIdentifiers forKey:@"MPModelLibraryRequestAllowedSectionIdentifiers"];
  [v4 encodeObject:self->_scopedContainers forKey:&stru_1EE680640];
  [v4 encodeInteger:self->_contentRange.location forKey:@"MPModelLibraryRequestContentRangeLocation"];
  [v4 encodeInteger:self->_contentRange.length forKey:@"MPModelLibraryRequestContentRangeLength"];
  [v4 encodeInt64:self->_filteringOptions forKey:@"MPModelLibraryRequestFilteringOptions"];
  [v4 encodeObject:self->_filterText forKey:@"MPModelLibraryRequestFilterText"];
  [v4 encodeObject:self->_sectionFilterText forKey:@"MPModelLibraryRequestSectionFilterText"];
  [v4 encodeObject:self->_mediaLibrary forKey:@"MPModelLibraryRequestMediaLibrary"];
  [v4 encodeObject:self->_legacyMediaQuery forKey:@"MPModelLibraryRequestLegacyMediaQuery"];
  [v4 encodeBool:self->_isUpgradedSmartPlaylistLegacyMediaQuery forKey:@"MPModelLibraryRequestCodingKeyIsUpgradedSmartPlaylistLegacyMediaQuery"];
  [v4 encodeObject:self->_itemPropertyFilters forKey:@"_MPModelLibraryRequestPropertyFilter"];
  [v4 encodeObject:self->_sectionPropertyFilters forKey:@"MPModelLibraryRequestSectionPropertyFilters"];
}

@end