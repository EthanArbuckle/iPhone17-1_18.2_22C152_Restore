@interface CBSOPFPackageContents
- (CBSOPFPackageContents)initWithIdentifierType:(id)a3 identifier:(id)a4;
- (NSMutableArray)spineItemIdentifiers;
- (NSMutableDictionary)itemPathsByIdentifier;
- (NSString)author;
- (NSString)bookIdentifier;
- (NSString)bookIdentifierType;
- (NSString)coverImagePath;
- (NSString)tableOfContentsFilePath;
- (NSString)tableOfContentsMediaType;
- (NSString)title;
- (id)cfiWithItemIdentifier:(id)a3 fragment:(id)a4;
- (id)itemIdentifierForHref:(id)a3 fragment:(id *)a4;
- (id)urlWithItemIdentifier:(id)a3 fragment:(id)a4;
- (void)setAuthor:(id)a3;
- (void)setBookIdentifier:(id)a3;
- (void)setBookIdentifierType:(id)a3;
- (void)setCoverImagePath:(id)a3;
- (void)setTableOfContentsFilePath:(id)a3;
- (void)setTableOfContentsMediaType:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CBSOPFPackageContents

- (CBSOPFPackageContents)initWithIdentifierType:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CBSOPFPackageContents;
  v9 = [(CBSOPFPackageContents *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookIdentifier, a4);
    objc_storeStrong((id *)&v10->_bookIdentifierType, a3);
    uint64_t v11 = objc_opt_new();
    itemPathsByIdentifier = v10->_itemPathsByIdentifier;
    v10->_itemPathsByIdentifier = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    spineItemIdentifiers = v10->_spineItemIdentifiers;
    v10->_spineItemIdentifiers = (NSMutableArray *)v13;
  }
  return v10;
}

- (id)itemIdentifierForHref:(id)a3 fragment:(id *)a4
{
  v6 = +[NSURL URLWithString:a3];
  id v7 = [v6 path];
  id v8 = +[NSCharacterSet URLPathAllowedCharacterSet];
  v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  if (a4)
  {
    *a4 = [v6 fragment];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = [(CBSOPFPackageContents *)self itemPathsByIdentifier];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    v21 = v6;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_super v16 = [(CBSOPFPackageContents *)self itemPathsByIdentifier];
        v17 = [v16 objectForKeyedSubscript:v15];
        unsigned __int8 v18 = [v17 isEqualToString:v9];

        if (v18)
        {
          id v19 = v15;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v19 = 0;
LABEL_13:
    v6 = v21;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)cfiWithItemIdentifier:(id)a3 fragment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CBSOPFPackageContents *)self spineItemIdentifiers];
  id v9 = [v8 indexOfObject:v6];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v11 = +[NSNumber numberWithInteger:2 * (void)v9 + 2];
    id v12 = (void *)v11;
    if (v7) {
      +[NSString stringWithFormat:@"epubcfi(/6/%@[%@]!/4[%@])", v11, v6, v7];
    }
    else {
    v10 = +[NSString stringWithFormat:@"epubcfi(/6/%@[%@]!/4)", v11, v6, v14];
    }
  }

  return v10;
}

- (id)urlWithItemIdentifier:(id)a3 fragment:(id)a4
{
  v5 = [(CBSOPFPackageContents *)self cfiWithItemIdentifier:a3 fragment:a4];
  id v6 = [(CBSOPFPackageContents *)self bookIdentifierType];
  uint64_t v7 = [(CBSOPFPackageContents *)self bookIdentifier];
  id v8 = (void *)v7;
  if (v5) {
    +[NSString stringWithFormat:@"ibooks://%@/%@#%@", v6, v7, v5];
  }
  else {
  id v9 = +[NSString stringWithFormat:@"ibooks://%@/%@", v6, v7, v12];
  }
  v10 = +[NSURL URLWithString:v9];

  return v10;
}

- (NSString)bookIdentifier
{
  return self->_bookIdentifier;
}

- (void)setBookIdentifier:(id)a3
{
}

- (NSString)bookIdentifierType
{
  return self->_bookIdentifierType;
}

- (void)setBookIdentifierType:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)coverImagePath
{
  return self->_coverImagePath;
}

- (void)setCoverImagePath:(id)a3
{
}

- (NSString)tableOfContentsFilePath
{
  return self->_tableOfContentsFilePath;
}

- (void)setTableOfContentsFilePath:(id)a3
{
}

- (NSString)tableOfContentsMediaType
{
  return self->_tableOfContentsMediaType;
}

- (void)setTableOfContentsMediaType:(id)a3
{
}

- (NSMutableArray)spineItemIdentifiers
{
  return self->_spineItemIdentifiers;
}

- (NSMutableDictionary)itemPathsByIdentifier
{
  return self->_itemPathsByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPathsByIdentifier, 0);
  objc_storeStrong((id *)&self->_spineItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_tableOfContentsMediaType, 0);
  objc_storeStrong((id *)&self->_tableOfContentsFilePath, 0);
  objc_storeStrong((id *)&self->_coverImagePath, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bookIdentifierType, 0);

  objc_storeStrong((id *)&self->_bookIdentifier, 0);
}

@end