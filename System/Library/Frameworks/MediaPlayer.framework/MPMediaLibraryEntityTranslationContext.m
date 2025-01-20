@interface MPMediaLibraryEntityTranslationContext
- (BOOL)isMultiQuery;
- (BOOL)sortUsingAllowedEntityIdentifiers;
- (MPMediaLibrary)mediaLibrary;
- (MPModelKind)modelKind;
- (NSArray)allowedEntityIdentifiers;
- (NSArray)propertyFilters;
- (NSArray)scopedContainers;
- (NSString)filterText;
- (NSString)personID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)filteringOptions;
- (void)setAllowedEntityIdentifiers:(id)a3;
- (void)setFilterText:(id)a3;
- (void)setFilteringOptions:(unint64_t)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setModelKind:(id)a3;
- (void)setMultiQuery:(BOOL)a3;
- (void)setPersonID:(id)a3;
- (void)setPropertyFilters:(id)a3;
- (void)setScopedContainers:(id)a3;
- (void)setSortUsingAllowedEntityIdentifiers:(BOOL)a3;
@end

@implementation MPMediaLibraryEntityTranslationContext

- (NSString)personID
{
  p_personID = &self->_personID;
  NSUInteger v3 = [(NSString *)self->_personID length];
  v4 = (void **)MEMORY[0x1E4FB8580];
  if (v3) {
    v4 = (void **)p_personID;
  }
  v5 = *v4;

  return (NSString *)v5;
}

- (MPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (MPModelKind)modelKind
{
  return self->_modelKind;
}

- (BOOL)isMultiQuery
{
  return self->_multiQuery;
}

- (void)setModelKind:(id)a3
{
}

- (void)setMediaLibrary:(id)a3
{
}

- (void)setPersonID:(id)a3
{
}

- (void)setScopedContainers:(id)a3
{
}

- (void)setPropertyFilters:(id)a3
{
}

- (void)setMultiQuery:(BOOL)a3
{
  self->_multiQuery = a3;
}

- (void)setFilteringOptions:(unint64_t)a3
{
  self->_filteringOptions = a3;
}

- (void)setFilterText:(id)a3
{
}

- (void)setAllowedEntityIdentifiers:(id)a3
{
}

- (NSArray)allowedEntityIdentifiers
{
  return self->_allowedEntityIdentifiers;
}

- (BOOL)sortUsingAllowedEntityIdentifiers
{
  return self->_sortUsingAllowedEntityIdentifiers;
}

- (NSArray)scopedContainers
{
  return self->_scopedContainers;
}

- (NSArray)propertyFilters
{
  return self->_propertyFilters;
}

- (NSString)filterText
{
  return self->_filterText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyFilters, 0);
  objc_storeStrong((id *)&self->_filterText, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_modelKind, 0);
  objc_storeStrong((id *)&self->_scopedContainers, 0);
  objc_storeStrong((id *)&self->_allowedEntityIdentifiers, 0);

  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

- (unint64_t)filteringOptions
{
  return self->_filteringOptions;
}

- (void)setSortUsingAllowedEntityIdentifiers:(BOOL)a3
{
  self->_sortUsingAllowedEntityIdentifiers = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = [(MPMediaLibraryEntityTranslationContext *)self mediaLibrary];
  [v5 setMediaLibrary:v6];

  v7 = [(MPMediaLibraryEntityTranslationContext *)self allowedEntityIdentifiers];
  v8 = (void *)[v7 copyWithZone:a3];
  [v5 setAllowedEntityIdentifiers:v8];

  v9 = [(MPMediaLibraryEntityTranslationContext *)self scopedContainers];
  v10 = (void *)[v9 copyWithZone:a3];
  [v5 setScopedContainers:v10];

  objc_msgSend(v5, "setMultiQuery:", -[MPMediaLibraryEntityTranslationContext isMultiQuery](self, "isMultiQuery"));
  objc_msgSend(v5, "setSortUsingAllowedEntityIdentifiers:", -[MPMediaLibraryEntityTranslationContext sortUsingAllowedEntityIdentifiers](self, "sortUsingAllowedEntityIdentifiers"));
  objc_msgSend(v5, "setFilteringOptions:", -[MPMediaLibraryEntityTranslationContext filteringOptions](self, "filteringOptions"));
  v11 = [(MPMediaLibraryEntityTranslationContext *)self modelKind];
  [v5 setModelKind:v11];

  v12 = [(MPMediaLibraryEntityTranslationContext *)self personID];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPersonID:v13];

  v14 = [(MPMediaLibraryEntityTranslationContext *)self filterText];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setFilterText:v15];

  v16 = [(MPMediaLibraryEntityTranslationContext *)self propertyFilters];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setPropertyFilters:v17];

  return v5;
}

@end