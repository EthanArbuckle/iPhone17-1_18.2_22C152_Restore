@interface DMFBookmark
+ (BOOL)supportsSecureCoding;
+ (id)favoritesFolderWithChildren:(id)a3;
+ (id)folderWithName:(id)a3 children:(id)a4;
+ (id)folderWithName:(id)a3 children:(id)a4 identifier:(id)a5;
+ (id)leafBookmarkWithName:(id)a3 URL:(id)a4;
+ (id)readingListFolderWithChildren:(id)a3;
- (BOOL)_isFolderWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavoritesFolder;
- (BOOL)isFolder;
- (BOOL)isReadingListFolder;
- (DMFBookmark)initWithCoder:(id)a3;
- (DMFBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6;
- (NSArray)children;
- (NSString)identifier;
- (NSString)name;
- (NSURL)URL;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFBookmark

+ (id)favoritesFolderWithChildren:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Favorites" value:&stru_1F18939E8 table:@"DMFUserInterface"];

  v8 = [a1 folderWithName:v7 children:v5 identifier:@"com.apple.dmf.bookmark.favorites-folder"];

  return v8;
}

+ (id)readingListFolderWithChildren:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"Reading List" value:&stru_1F18939E8 table:@"DMFUserInterface"];

  v8 = [a1 folderWithName:v7 children:v5 identifier:@"com.apple.dmf.bookmark.reading-list-folder"];

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

- (DMFBookmark)initWithName:(id)a3 URL:(id)a4 children:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)DMFBookmark;
  v14 = [(DMFBookmark *)&v22 init];
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
  v2 = [(DMFBookmark *)self children];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFavoritesFolder
{
  return [(DMFBookmark *)self _isFolderWithIdentifier:@"com.apple.dmf.bookmark.favorites-folder"];
}

- (BOOL)isReadingListFolder
{
  return [(DMFBookmark *)self _isFolderWithIdentifier:@"com.apple.dmf.bookmark.reading-list-folder"];
}

- (BOOL)_isFolderWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(DMFBookmark *)self isFolder])
  {
    id v5 = [(DMFBookmark *)self identifier];
    char v6 = [v5 isEqualToString:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DMFBookmark;
  id v5 = [(DMFBookmark *)&v21 init];
  if (v5)
  {
    char v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"children"];
    children = v5->_children;
    v5->_children = (NSArray *)v15;

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DMFBookmark *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  char v6 = [(DMFBookmark *)self URL];
  [v4 encodeObject:v6 forKey:@"URL"];

  uint64_t v7 = [(DMFBookmark *)self children];
  [v4 encodeObject:v7 forKey:@"children"];

  id v8 = [(DMFBookmark *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];
}

- (unint64_t)hash
{
  BOOL v3 = [(DMFBookmark *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(DMFBookmark *)self URL];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(DMFBookmark *)self children];
  uint64_t v8 = [v7 hash];
  id v9 = [(DMFBookmark *)self identifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DMFBookmark *)a3;
  if (self == v4 || ![(DMFBookmark *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v23 = 1;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = [(DMFBookmark *)self name];
    uint64_t v7 = [(DMFBookmark *)v5 name];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    if (v8 | v9 && (int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
    {
      char v23 = 0;
    }
    else
    {
      id v11 = [(DMFBookmark *)self URL];
      id v12 = [(DMFBookmark *)v5 URL];
      unint64_t v13 = v11;
      unint64_t v14 = v12;
      if (v13 | v14
        && (int v15 = [(id)v13 isEqual:v14], (id)v14, (id)v13, !v15))
      {
        char v23 = 0;
      }
      else
      {
        v16 = [(DMFBookmark *)self children];
        uint64_t v17 = [(DMFBookmark *)v5 children];
        unint64_t v18 = v16;
        unint64_t v19 = v17;
        if (v18 | v19
          && (int v20 = [(id)v18 isEqual:v19], (id)v19, (id)v18, !v20))
        {
          char v23 = 0;
        }
        else
        {
          unint64_t v25 = v8;
          uint64_t v21 = [(DMFBookmark *)self identifier];
          uint64_t v22 = [(DMFBookmark *)v5 identifier];
          if (v21 | v22) {
            char v23 = [(id)v21 isEqual:v22];
          }
          else {
            char v23 = 1;
          }

          unint64_t v8 = v25;
        }
      }
    }
  }
  return v23;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFBookmark *)self name];
  [v3 appendFormat:@"\tName        : %@\n", v4];

  id v5 = [(DMFBookmark *)self URL];
  uint64_t v6 = [v5 absoluteString];
  [v3 appendFormat:@"\tURL         : %@\n", v6];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFBookmark isFolder](self, "isFolder"));
  [v3 appendFormat:@"\tisFolder    : %@\n", v7];

  unint64_t v8 = NSNumber;
  unint64_t v9 = [(DMFBookmark *)self children];
  int v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  [v3 appendFormat:@"\tChild Count : %@\n", v10];

  id v11 = [(DMFBookmark *)self identifier];
  [v3 appendFormat:@"\tIdentifier  : %@\n", v11];

  [v3 appendString:@"}>"];
  id v12 = (void *)[v3 copy];

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSArray)children
{
  return self->_children;
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