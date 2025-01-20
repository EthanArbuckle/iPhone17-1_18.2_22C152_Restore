@interface _UIDocumentPickerContainerURLItem
+ (id)defaultKeys;
- (BOOL)attributesModified:(id)a3;
- (BOOL)isAlias;
- (BOOL)renameable;
- (_UIDocumentPickerContainerURLItem)initWithURL:(id)a3;
- (id)contentType;
- (id)modificationDate;
- (id)sortPath;
- (id)sortPathComponents;
- (id)subtitle;
- (id)subtitle2;
- (id)tags;
- (id)title;
- (id)url;
- (id)urlInLocalContainer;
- (int64_t)type;
- (unint64_t)indentationLevel;
- (void)_cacheIndentationLevelWithSortPathComponents:(id)a3;
- (void)_modelChanged;
- (void)_removeCachedValues;
- (void)cacheValues;
@end

@implementation _UIDocumentPickerContainerURLItem

- (_UIDocumentPickerContainerURLItem)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerURLItem;
  v6 = [(_UIDocumentPickerContainerItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
    [(_UIDocumentPickerContainerURLItem *)v7 cacheValues];
  }

  return v7;
}

- (void)_removeCachedValues
{
  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = 0;

  cachedSubtitle2 = self->_cachedSubtitle2;
  self->_cachedSubtitle2 = 0;

  cachedTitle = self->_cachedTitle;
  self->_cachedTitle = 0;

  cachedTags = self->_cachedTags;
  self->_cachedTags = 0;

  cachedSortPath = self->_cachedSortPath;
  self->_cachedSortPath = 0;

  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = 0;

  cachedContentType = self->_cachedContentType;
  self->_cachedContentType = 0;

  id generationIdentifier = self->_generationIdentifier;
  self->_id generationIdentifier = 0;

  self->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)attributesModified:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4[22] isEqual:self->_generationIdentifier] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (id)defaultKeys
{
  v9[10] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFF750];
  v9[0] = *MEMORY[0x263EFF738];
  v9[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFF6A8];
  v9[2] = *MEMORY[0x263EFF688];
  v9[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFF698];
  v9[4] = *MEMORY[0x263EFF6D0];
  v9[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFF690];
  v9[6] = *MEMORY[0x263EFF5F8];
  v9[7] = v5;
  uint64_t v6 = *MEMORY[0x263EFF780];
  v9[8] = *MEMORY[0x263EFF5D8];
  v9[9] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:10];

  return v7;
}

- (void)cacheValues
{
  uint64_t v3 = [(_UIDocumentPickerContainerURLItem *)self url];
  uint64_t v4 = [(id)objc_opt_class() defaultKeys];
  uint64_t v5 = [v3 promisedItemResourceValuesForKeys:v4 error:0];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFF738]];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 objectForKey:*MEMORY[0x263EFF750]];
  }
  v31 = v8;

  v29 = [v5 objectForKey:*MEMORY[0x263EFF780]];
  v46[0] = 0;
  objc_msgSend(v3, "br_getTagNames:error:", v46, 0);
  id v28 = v46[0];
  objc_super v9 = [v5 objectForKey:*MEMORY[0x263EFF5D8]];
  v10 = [v5 valueForKey:*MEMORY[0x263EFF688]];
  v11 = v10;
  if (v10)
  {
    [v10 longLongValue];
    v12 = NSLocalizedFileSizeDescription();
  }
  else
  {
    v12 = 0;
  }
  v13 = [v5 valueForKey:*MEMORY[0x263EFF5F8]];
  v14 = v13;
  if (v13)
  {
    v15 = BRFormatModifiedAgoWithDate(v13);
  }
  else
  {
    v15 = 0;
  }
  v16 = [v5 valueForKey:*MEMORY[0x263EFF6A8]];
  [v5 valueForKey:*MEMORY[0x263EFF6D0]];
  v35 = v34 = v3;
  v32 = v11;
  v33 = (void *)v4;
  BOOL v17 = v16 && [v16 BOOLValue] && v35 && !objc_msgSend(v35, "BOOLValue");
  v18 = [v5 valueForKey:*MEMORY[0x263EFF698]];
  char v19 = [v18 BOOLValue];

  v20 = [v5 valueForKey:*MEMORY[0x263EFF690]];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __48___UIDocumentPickerContainerURLItem_cacheValues__block_invoke;
  v36[3] = &unk_26492D468;
  v36[4] = self;
  id v37 = v31;
  id v38 = v12;
  id v39 = v15;
  id v43 = v20;
  BOOL v44 = v17;
  id v40 = v28;
  id v41 = v29;
  id v42 = v9;
  char v45 = v19;
  id v21 = v20;
  id v22 = v9;
  id v30 = v29;
  id v23 = v28;
  id v24 = v15;
  id v25 = v12;
  id v26 = v31;
  v27 = (void (**)(void))MEMORY[0x230F72310](v36);
  v27[2]();
}

- (int64_t)type
{
  return self->_cachedType;
}

- (id)contentType
{
  return self->_cachedContentType;
}

- (BOOL)isAlias
{
  return self->_cachedIsAlias;
}

- (id)title
{
  return self->_cachedTitle;
}

- (id)subtitle
{
  return self->_cachedSubtitle;
}

- (id)subtitle2
{
  return self->_cachedSubtitle2;
}

- (id)url
{
  return self->_url;
}

- (id)urlInLocalContainer
{
  return self->_url;
}

- (id)tags
{
  return self->_cachedTags;
}

- (id)modificationDate
{
  return self->_cachedContentModifiedDate;
}

- (void)_modelChanged
{
  id v7 = [(_UIDocumentPickerContainerItem *)self model];
  uint64_t v3 = [v7 modelObjects];
  uint64_t v4 = -[_UIDocumentPickerContainerItem _formattedSubtitleForNumberOfItems:](self, "_formattedSubtitleForNumberOfItems:", [v3 count]);
  uint64_t v5 = (NSString *)[v4 copy];
  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = v5;
}

- (void)_cacheIndentationLevelWithSortPathComponents:(id)a3
{
  self->_cachedIndentation = [a3 count] - 1;
}

- (unint64_t)indentationLevel
{
  unint64_t result = self->_cachedIndentation;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(_UIDocumentPickerContainerURLItem *)self sortPathComponents];
    [(_UIDocumentPickerContainerURLItem *)self _cacheIndentationLevelWithSortPathComponents:v4];

    return self->_cachedIndentation;
  }
  return result;
}

- (id)sortPathComponents
{
  uint64_t v3 = [(_UIDocumentPickerContainerURLItem *)self url];
  uint64_t v4 = objc_msgSend(v3, "br_containerID");
  int v5 = [v4 isEqualToString:*MEMORY[0x263F324E8]];

  uint64_t v6 = [(_UIDocumentPickerContainerURLItem *)self url];
  id v7 = objc_msgSend(v6, "br_pathRelativeToMobileDocuments");
  id v8 = [v7 pathComponents];
  objc_super v9 = (void *)[v8 mutableCopy];

  [v9 removeObjectAtIndex:v5 ^ 1u];

  return v9;
}

- (id)sortPath
{
  uint64_t v3 = (void *)MEMORY[0x230F720E0](self, a2);
  cachedSortPath = self->_cachedSortPath;
  if (!cachedSortPath)
  {
    int v5 = [(_UIDocumentPickerContainerURLItem *)self sortPathComponents];
    uint64_t v6 = [v5 componentsJoinedByString:@"/"];
    id v7 = self->_cachedSortPath;
    self->_cachedSortPath = v6;

    if (self->_cachedIndentation == 0x7FFFFFFFFFFFFFFFLL) {
      [(_UIDocumentPickerContainerURLItem *)self _cacheIndentationLevelWithSortPathComponents:v5];
    }

    cachedSortPath = self->_cachedSortPath;
  }
  id v8 = cachedSortPath;

  return v8;
}

- (BOOL)renameable
{
  uint64_t v3 = [(_UIDocumentPickerContainerURLItem *)self url];
  if (![(_UIDocumentPickerContainerURLItem *)self type])
  {
    uint64_t v4 = [v3 URLByDeletingLastPathComponent];

    uint64_t v3 = (void *)v4;
  }
  id v7 = 0;
  if ([v3 getResourceValue:&v7 forKey:*MEMORY[0x263EFF728] error:0]) {
    char v5 = [v7 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generationIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedContentModifiedDate, 0);
  objc_storeStrong((id *)&self->_cachedContentType, 0);
  objc_storeStrong((id *)&self->_cachedSortPath, 0);
  objc_storeStrong((id *)&self->_cachedTags, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle2, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle, 0);
  objc_storeStrong((id *)&self->_cachedTitle, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end