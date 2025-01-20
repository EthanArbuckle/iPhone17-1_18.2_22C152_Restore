@interface CRKBookmark
+ (BOOL)supportsSecureCoding;
+ (id)favoritesFolderWithChildren:(id)a3;
+ (id)folderWithName:(id)a3 children:(id)a4;
+ (id)folderWithName:(id)a3 children:(id)a4 identifier:(id)a5;
+ (id)leafBookmarkWithName:(id)a3 URL:(id)a4;
+ (id)readingListFolderWithChildren:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavoritesFolder;
- (BOOL)isFolder;
- (BOOL)isFolderWithIdentifier:(id)a3;
- (BOOL)isReadingListFolder;
- (CRKBookmark)initWithCoder:(id)a3;
- (CRKBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6;
- (NSArray)children;
- (NSString)identifier;
- (NSString)name;
- (NSURL)URL;
- (id)description;
- (id)urlString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChildren:(id)a3;
- (void)setName:(id)a3;
- (void)setURL:(id)a3;
- (void)setUrlString:(id)a3;
@end

@implementation CRKBookmark

+ (id)favoritesFolderWithChildren:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Favorites" value:&stru_26D7E7B00 table:0];

  v8 = [a1 folderWithName:v7 children:v5 identifier:@"com.apple.classroomkit.bookmark.favorites-folder"];

  return v8;
}

+ (id)readingListFolderWithChildren:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Reading List" value:&stru_26D7E7B00 table:0];

  v8 = [a1 folderWithName:v7 children:v5 identifier:@"com.apple.classroomkit.bookmark.reading-list-folder"];

  return v8;
}

+ (id)folderWithName:(id)a3 children:(id)a4
{
  return (id)[a1 folderWithName:a3 children:a4 identifier:0];
}

+ (id)folderWithName:(id)a3 children:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithName:v10 URL:0 children:v9 identifier:v8];

  return v11;
}

+ (id)leafBookmarkWithName:(id)a3 URL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 URL:v6 children:0 identifier:0];

  return v8;
}

- (CRKBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CRKBookmark;
  v14 = [(CRKBookmark *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_URL, a4);
    uint64_t v17 = [v12 copy];
    children = v14->_children;
    v14->_children = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v19;
  }
  return v14;
}

- (BOOL)isFolder
{
  v2 = [(CRKBookmark *)self children];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFavoritesFolder
{
  return [(CRKBookmark *)self isFolderWithIdentifier:@"com.apple.classroomkit.bookmark.favorites-folder"];
}

- (BOOL)isReadingListFolder
{
  return [(CRKBookmark *)self isFolderWithIdentifier:@"com.apple.classroomkit.bookmark.reading-list-folder"];
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (id)urlString
{
  v2 = [(CRKBookmark *)self URL];
  BOOL v3 = [v2 absoluteString];

  return v3;
}

- (void)setUrlString:(id)a3
{
  if (a3)
  {
    objc_msgSend(NSURL, "URLWithString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CRKBookmark *)self setURL:v4];
  }
  else
  {
    -[CRKBookmark setURL:](self, "setURL:");
  }
}

- (BOOL)isFolderWithIdentifier:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  if ([(CRKBookmark *)self isFolder])
  {
    uint64_t v5 = [(CRKBookmark *)self identifier];
    if (v4 | v5)
    {
      id v7 = [(CRKBookmark *)self identifier];
      char v6 = [v7 isEqual:v4];
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  BOOL v3 = [(CRKBookmark *)self name];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(CRKBookmark *)self URL];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(CRKBookmark *)self children];
  uint64_t v8 = [v7 hash];
  id v9 = [(CRKBookmark *)self identifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(@"name, URL, children, identifier", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_16;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  id v9 = (CRKBookmark *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKBookmark *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = v9;
          uint64_t v18 = [(CRKBookmark *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKBookmark *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CRKBookmark *)self name];
  uint64_t v6 = [(CRKBookmark *)self URL];
  id v7 = [v6 absoluteString];
  BOOL v8 = [(CRKBookmark *)self isFolder];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  id v10 = v9;
  id v11 = [(CRKBookmark *)self identifier];
  uint64_t v12 = NSNumber;
  uint64_t v13 = [(CRKBookmark *)self children];
  uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  uint64_t v15 = [v3 stringWithFormat:@"<%@: %p { name = %@, URL = %@, isFolder = %@, identifier = %@, childCount = %@ }>", v4, self, v5, v7, v10, v11, v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKBookmark;
  uint64_t v5 = [(CRKBookmark *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"children"];
    children = v5->_children;
    v5->_children = (NSArray *)v15;

    uint64_t v17 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKBookmark *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(CRKBookmark *)self URL];
  [v4 encodeObject:v6 forKey:@"URL"];

  uint64_t v7 = [(CRKBookmark *)self children];
  [v4 encodeObject:v7 forKey:@"children"];

  id v8 = [(CRKBookmark *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end