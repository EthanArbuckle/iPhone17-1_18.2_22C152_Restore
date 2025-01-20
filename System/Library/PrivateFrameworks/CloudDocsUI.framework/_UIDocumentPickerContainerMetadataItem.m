@interface _UIDocumentPickerContainerMetadataItem
- (BOOL)isEqual:(id)a3;
- (BOOL)renameable;
- (_UIDocumentPickerContainerMetadataItem)initWithMetadataItem:(id)a3;
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
- (unint64_t)hash;
- (unint64_t)indentationLevel;
- (void)_cacheIndentationLevelWithSortPathComponents:(id)a3;
- (void)_modelChanged;
- (void)_removeCachedValues;
- (void)cacheValues:(id)a3;
@end

@implementation _UIDocumentPickerContainerMetadataItem

- (_UIDocumentPickerContainerMetadataItem)initWithMetadataItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerContainerMetadataItem;
  v5 = [(_UIDocumentPickerContainerItem *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(_UIDocumentPickerContainerMetadataItem *)v5 cacheValues:v4];
    v6->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
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

  cachedURL = self->_cachedURL;
  self->_cachedURL = 0;

  cachedSortPath = self->_cachedSortPath;
  self->_cachedSortPath = 0;

  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = 0;

  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  self->_cachedURLInLocalContainer = 0;

  self->_cachedIndentation = 0x7FFFFFFFFFFFFFFFLL;
  self->_cachedRenameable = 0;
}

- (unint64_t)hash
{
  return [(NSNumber *)self->_cachedFileObjectID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[22] isEqual:self->_cachedFileObjectID];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)cacheValues:(id)a3
{
  id v75 = a3;
  [(_UIDocumentPickerContainerMetadataItem *)self _removeCachedValues];
  id v4 = [v75 valueForAttribute:*MEMORY[0x263F08360]];
  char v5 = (NSString *)[v4 copy];
  cachedTitle = self->_cachedTitle;
  self->_cachedTitle = v5;

  if (!self->_cachedTitle)
  {
    v7 = [v75 valueForAttribute:*MEMORY[0x263F08370]];
    objc_super v8 = (NSString *)[v7 copy];
    v9 = self->_cachedTitle;
    self->_cachedTitle = v8;
  }
  v10 = [v75 valueForAttribute:*MEMORY[0x263F08380]];
  v11 = (NSURL *)[v10 copy];
  cachedURL = self->_cachedURL;
  self->_cachedURL = v11;

  v13 = [v75 valueForAttribute:*MEMORY[0x263F08358]];
  v14 = (NSString *)[v13 copy];
  cachedContentType = self->_cachedContentType;
  self->_cachedContentType = v14;

  v16 = [v75 valueForAttribute:*MEMORY[0x263F083C0]];
  v17 = (NSURL *)[v16 copy];
  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  self->_cachedURLInLocalContainer = v17;

  v19 = [v75 valueForAttribute:@"BRMetadataItemFileObjectIdentifierKey"];
  cachedFileObjectID = self->_cachedFileObjectID;
  self->_cachedFileObjectID = v19;

  v21 = self->_cachedURL;
  v22 = [(NSURL *)v21 br_containerID];
  int v23 = [v22 isEqualToString:*MEMORY[0x263F324E8]];

  if (!v23)
  {
LABEL_11:

    goto LABEL_12;
  }
  v24 = [(NSURL *)v21 br_pathRelativeToMobileDocuments];
  uint64_t v25 = [v24 rangeOfString:@"/"];
  v26 = [(NSURL *)v21 lastPathComponent];
  uint64_t v27 = [v24 rangeOfString:v26 options:4];

  if (v25 && v25 + 1 == v27)
  {
    if ([(NSString *)self->_cachedTitle isEqualToString:*MEMORY[0x263F32500]])
    {
      v28 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v21 = v28;
      v29 = @"Desktop";
    }
    else
    {
      if (![(NSString *)self->_cachedTitle isEqualToString:*MEMORY[0x263F32510]]) {
        goto LABEL_12;
      }
      v28 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v21 = v28;
      v29 = @"Documents";
    }
    v30 = [(NSURL *)v28 localizedStringForKey:v29 value:v29 table:@"Localizable"];
    v31 = self->_cachedTitle;
    self->_cachedTitle = v30;

    goto LABEL_11;
  }
LABEL_12:
  v32 = [v75 valueForAttribute:*MEMORY[0x263F083B8]];
  v33 = [v75 valueForAttribute:*MEMORY[0x263F083B0]];
  if ([v32 BOOLValue])
  {
    v34 = [v75 valueForAttribute:*MEMORY[0x263F083D0]];
    if ([v34 isEqualToString:*MEMORY[0x263F083E8]])
    {
      v35 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v36 = [v35 localizedStringForKey:@"Shared by Me" value:@"Shared by Me" table:@"Localizable"];
      v37 = (NSString *)[v36 copy];
      cachedSubtitle = self->_cachedSubtitle;
      self->_cachedSubtitle = v37;

      self->_cachedRenameable = 1;
    }
    else
    {
      v45 = [v75 valueForAttribute:*MEMORY[0x263F083E0]];
      if (v45)
      {
        v46 = NSString;
        v47 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v48 = [v47 localizedStringForKey:@"Shared by SomeoneElseThanMe" value:@"Shared by %@" table:@"Localizable"];
        v49 = objc_msgSend(v46, "localizedStringWithFormat:", v48, v45);
        v50 = (NSString *)[v49 copy];
        v51 = self->_cachedSubtitle;
        self->_cachedSubtitle = v50;

        BOOL v52 = 0;
      }
      else
      {
        v47 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v48 = [v47 localizedStringForKey:@"Shared by unknown user" value:@"Shared by unknown user" table:@"Localizable"];
        v53 = (NSString *)[v48 copy];
        v49 = self->_cachedSubtitle;
        self->_cachedSubtitle = v53;
        BOOL v52 = 1;
      }

      self->_cachedRenameable = v52;
    }
  }
  else
  {
    if (![v33 BOOLValue])
    {
      self->_cachedRenameable = 1;
      goto LABEL_23;
    }
    v34 = [v75 valueForAttribute:*MEMORY[0x263F083A8]];
    v39 = NSString;
    v40 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v41 = [v40 localizedStringForKey:@"in ContainerDisplayName" value:@"in %@" table:@"Localizable"];
    v42 = objc_msgSend(v39, "localizedStringWithFormat:", v41, v34);
    v43 = (NSString *)[v42 copy];
    v44 = self->_cachedSubtitle;
    self->_cachedSubtitle = v43;

    self->_cachedRenameable = 0;
  }

LABEL_23:
  v54 = [v75 valueForAttribute:*MEMORY[0x263F083C8]];
  v55 = v54;
  if (!v54) {
    goto LABEL_29;
  }
  v56 = [v54 domain];
  if (![v56 isEqualToString:*MEMORY[0x263F07F70]])
  {

    goto LABEL_28;
  }
  uint64_t v57 = [v55 code];

  if (v57 != 4355)
  {
LABEL_28:
    v58 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v59 = [v58 localizedStringForKey:@"Error" value:@"Error" table:@"Localizable"];
    v60 = self->_cachedSubtitle;
    self->_cachedSubtitle = v59;
  }
LABEL_29:
  v61 = [v75 valueForAttribute:*MEMORY[0x263F08368]];
  v62 = (NSDate *)[v61 copy];
  cachedContentModifiedDate = self->_cachedContentModifiedDate;
  self->_cachedContentModifiedDate = v62;

  self->_cachedType = UTTypeConformsTo((CFStringRef)self->_cachedContentType, (CFStringRef)*MEMORY[0x263F01A30]) != 0;
  v64 = [v75 valueForAttribute:*MEMORY[0x263F08378]];
  v65 = v64;
  if (v64)
  {
    [v64 longLongValue];
    uint64_t v66 = NSLocalizedFileSizeDescription();
    p_cachedSubtitle = &self->_cachedSubtitle;
    if (self->_cachedSubtitle) {
      p_cachedSubtitle = &self->_cachedSubtitle2;
    }
    v68 = *p_cachedSubtitle;
    *p_cachedSubtitle = (NSString *)v66;
  }
  v69 = self->_cachedContentModifiedDate;
  if (v69 && self->_cachedType != 1 && !self->_cachedSubtitle2)
  {
    BRFormatModifiedAgoWithDate(v69);
    v70 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedSubtitle2 = self->_cachedSubtitle2;
    self->_cachedSubtitle2 = v70;
  }
  v72 = [v75 valueForKey:*MEMORY[0x263F32490]];
  v73 = (NSArray *)[v72 copy];
  cachedTags = self->_cachedTags;
  self->_cachedTags = v73;
}

- (int64_t)type
{
  return self->_cachedType;
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
  return self->_cachedURL;
}

- (id)contentType
{
  return self->_cachedContentType;
}

- (id)urlInLocalContainer
{
  cachedURLInLocalContainer = self->_cachedURLInLocalContainer;
  if (!cachedURLInLocalContainer) {
    cachedURLInLocalContainer = self->_cachedURL;
  }
  return cachedURLInLocalContainer;
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
  v3 = [v7 modelObjects];
  id v4 = -[_UIDocumentPickerContainerItem _formattedSubtitleForNumberOfItems:](self, "_formattedSubtitleForNumberOfItems:", [v3 count]);
  char v5 = (NSString *)[v4 copy];
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
    id v4 = [(_UIDocumentPickerContainerMetadataItem *)self sortPathComponents];
    [(_UIDocumentPickerContainerMetadataItem *)self _cacheIndentationLevelWithSortPathComponents:v4];

    return self->_cachedIndentation;
  }
  return result;
}

- (id)sortPathComponents
{
  v2 = [(_UIDocumentPickerContainerMetadataItem *)self url];
  v3 = [v2 path];
  id v4 = [MEMORY[0x263F325A0] mobileDocumentsURL];
  char v5 = [v4 path];
  v6 = objc_msgSend(v3, "br_pathRelativeToPath:", v5);
  id v7 = [v6 pathComponents];
  objc_super v8 = (void *)[v7 mutableCopy];

  if (![v8 count])
  {
    id v17 = (id)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  v9 = [v8 objectAtIndexedSubscript:0];
  if ((unint64_t)[v8 count] >= 2)
  {
    char v10 = [v9 isEqualToString:*MEMORY[0x263F324F0]];
    v11 = [v8 objectAtIndexedSubscript:1];
    v12 = v11;
    if ((v10 & 1) == 0)
    {
      int v18 = [v11 isEqualToString:*MEMORY[0x263F324D0]];

      if (v18) {
        [v8 removeObjectAtIndex:1];
      }
      goto LABEL_12;
    }
    int v13 = [v11 isEqualToString:*MEMORY[0x263F32510]];

    if (v13)
    {
      v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v15 = v14;
      v16 = @"Documents";
LABEL_11:
      v21 = [v14 localizedStringForKey:v16 value:v16 table:@"Localizable"];
      [v8 setObject:v21 atIndexedSubscript:1];

      goto LABEL_12;
    }
    v19 = [v8 objectAtIndexedSubscript:1];
    int v20 = [v19 isEqualToString:*MEMORY[0x263F32500]];

    if (v20)
    {
      v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v15 = v14;
      v16 = @"Desktop";
      goto LABEL_11;
    }
  }
LABEL_12:
  v22 = objc_msgSend(v2, "br_cloudDocsContainer");
  int v23 = v22;
  if (v22)
  {
    v24 = [v22 localizedName];
    [v8 setObject:v24 atIndexedSubscript:0];
  }
  id v17 = v8;

LABEL_15:

  return v17;
}

- (id)sortPath
{
  v3 = (void *)MEMORY[0x230F720E0](self, a2);
  cachedSortPath = self->_cachedSortPath;
  if (!cachedSortPath)
  {
    char v5 = [(_UIDocumentPickerContainerMetadataItem *)self sortPathComponents];
    v6 = [v5 componentsJoinedByString:@"/"];
    id v7 = self->_cachedSortPath;
    self->_cachedSortPath = v6;

    if (self->_cachedIndentation == 0x7FFFFFFFFFFFFFFFLL) {
      [(_UIDocumentPickerContainerMetadataItem *)self _cacheIndentationLevelWithSortPathComponents:v5];
    }

    cachedSortPath = self->_cachedSortPath;
  }
  objc_super v8 = cachedSortPath;

  return v8;
}

- (BOOL)renameable
{
  return self->_cachedRenameable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFileObjectID, 0);
  objc_storeStrong((id *)&self->_cachedContentModifiedDate, 0);
  objc_storeStrong((id *)&self->_cachedContentType, 0);
  objc_storeStrong((id *)&self->_cachedSortPath, 0);
  objc_storeStrong((id *)&self->_cachedURLInLocalContainer, 0);
  objc_storeStrong((id *)&self->_cachedURL, 0);
  objc_storeStrong((id *)&self->_cachedTags, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle2, 0);
  objc_storeStrong((id *)&self->_cachedSubtitle, 0);

  objc_storeStrong((id *)&self->_cachedTitle, 0);
}

@end