@interface GSAddition
+ (id)makeNameForUser:(unsigned int)a3 name:(id)a4;
- (BOOL)copyAdditionContentToURL:(id)a3 error:(id *)a4;
- (BOOL)internalStat:(stat *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSavedConflict;
- (BOOL)isSavedConflictResolved;
- (BOOL)markSavedConflictAsResolved:(BOOL)a3 error:(id *)a4;
- (BOOL)mergeUserInfo:(id)a3 error:(id *)a4;
- (BOOL)refreshWithError:(id *)a3;
- (BOOL)setDisplayName:(id)a3 error:(id *)a4;
- (BOOL)setNameSpace:(id)a3 error:(id *)a4;
- (BOOL)setOptions:(unint64_t)a3 error:(id *)a4;
- (GSAddition)init;
- (GSAdditionStoring)storage;
- (NSCopying)persistentIdentifier;
- (NSData)sandboxExtension;
- (NSDictionary)userInfo;
- (NSNumber)size;
- (NSString)displayName;
- (NSString)name;
- (NSString)nameSpace;
- (NSString)originalPOSIXName;
- (NSURL)url;
- (id)_initWithStorage:(id)a3 andDictionary:(id)a4;
- (id)description;
- (id)displayNameWithError:(id *)a3;
- (id)originalPOSIXNameWithError:(id *)a3;
- (id)replaceItemAtURL:(id)a3 error:(id *)a4;
- (id)userInfoWithError:(id *)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (void)_refreshWithDictionary:(id)a3;
@end

@implementation GSAddition

- (NSData)sandboxExtension
{
  v3 = self->_storage;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSURL *)self->_url pathComponents];
    v5 = objc_msgSend(v4, "objectAtIndex:", (char *)objc_msgSend(v4, "count") - 5);
    unsigned int v6 = [v5 isEqualToString:@"PerUID"];

    if (v6) {
      [(GSAdditionStoring *)v3 privExtension];
    }
    else {
    v7 = [(GSAdditionStoring *)v3 pubExtension];
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSData *)v7;
}

- (BOOL)isSavedConflict
{
  if ((self->_options & 4) != 0) {
    return [(NSString *)self->_namespace isEqualToString:@"com.apple.documentVersions"];
  }
  else {
    return 0;
  }
}

- (BOOL)isSavedConflictResolved
{
  BOOL v3 = [(NSString *)self->_namespace isEqualToString:@"com.apple.ubiquity"];
  if (v3) {
    LOBYTE(v3) = self->_savedConflictResolved;
  }
  return v3;
}

- (NSNumber)size
{
  if (!self->_size)
  {
    uint64_t v3 = sub_10000E0AC((char *)[(NSURL *)self->_url fileSystemRepresentation], 0);
    if ((v3 & 0x8000000000000000) == 0)
    {
      v4 = +[NSNumber numberWithLongLong:v3];
      size = self->_size;
      self->_size = v4;
    }
  }
  unsigned int v6 = self->_size;
  return v6;
}

- (NSString)name
{
  return [(NSURL *)self->_url lastPathComponent];
}

- (NSCopying)persistentIdentifier
{
  p_isa = self->_namespace;
  if ([(NSString *)self->_namespace isEqualToString:@"com.apple.ubiquity"]
    || [(NSString *)self->_namespace isEqualToString:@"com.apple.FileProvider.conflict"])
  {
    v4 = @"com.apple.documentVersions";

    p_isa = &v4->isa;
  }
  v5 = [(GSAdditionStoring *)self->_storage persistentIdentifier];
  unsigned int v6 = [(GSAddition *)self name];
  v9[2] = v6;
  v7 = +[NSArray arrayWithObjects:v9 count:3];

  return (NSCopying *)v7;
}

- (id)displayNameWithError:(id *)a3
{
  p_displayName = &self->_displayName;
  displayName = self->_displayName;
  if (displayName)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = sub_10000DC94((char *)[(NSURL *)self->_url fileSystemRepresentation], a3);
    if ([v6 rangeOfString:@":"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

      unsigned int v6 = (void *)v7;
    }
    objc_storeStrong((id *)p_displayName, v6);
    displayName = *p_displayName;
  }
  v8 = displayName;

  return v8;
}

- (NSString)displayName
{
  return (NSString *)[(GSAddition *)self displayNameWithError:0];
}

- (id)originalPOSIXNameWithError:(id *)a3
{
  p_originalName = &self->_originalName;
  originalName = self->_originalName;
  if (!originalName)
  {
    uint64_t v8 = sub_10000DA54((char *)[(NSURL *)self->_url fileSystemRepresentation], a3);
    if (v8)
    {
      id v6 = (id)v8;
    }
    else
    {
      v9 = [(GSAddition *)self displayName];
      id v6 = v9;
      if (v9)
      {
        v10 = [v9 pathExtension];
        v11 = [(GSAddition *)self name];
        v12 = [v11 pathExtension];

        if ([v10 caseInsensitiveCompare:v12])
        {
          uint64_t v13 = [v6 stringByAppendingPathExtension:v12];

          id v6 = (id)v13;
        }
        if ([v6 rangeOfString:@"/"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

          id v6 = (id)v14;
        }
        id v6 = v6;

        uint64_t v7 = v6;
        goto LABEL_12;
      }
    }
    uint64_t v7 = 0;
LABEL_12:
    objc_storeStrong((id *)p_originalName, v6);
    originalName = *p_originalName;
    goto LABEL_13;
  }
  id v6 = 0;
  uint64_t v7 = 0;
LABEL_13:
  v15 = originalName;

  return v15;
}

- (NSString)originalPOSIXName
{
  return (NSString *)[(GSAddition *)self originalPOSIXNameWithError:0];
}

- (id)userInfoWithError:(id *)a3
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    sub_10000D258([(NSURL *)self->_url fileSystemRepresentation], a3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_userInfo;
    self->_userInfo = v5;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)[(GSAddition *)self userInfoWithError:0];
}

- (BOOL)refreshWithError:(id *)a3
{
  v4 = [(GSAdditionStoring *)self->_storage getAdditionDictionary:self error:a3];
  if (v4) {
    [(GSAddition *)self _refreshWithDictionary:v4];
  }

  return v4 != 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GSAddition *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(GSAdditionStoring *)self->_storage isEqual:v5->_storage]
        && [(NSString *)self->_namespace isEqualToString:v5->_namespace])
      {
        id v6 = [(GSAddition *)self name];
        uint64_t v7 = [(GSAddition *)v5 name];
        unsigned __int8 v8 = [v6 isEqual:v7];
      }
      else
      {
        unsigned __int8 v8 = 0;
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(GSAdditionStoring *)self->_storage hash];
  unint64_t v4 = [(NSString *)self->_namespace hash] ^ v3;
  v5 = [(GSAddition *)self name];
  unint64_t v6 = v4 ^ (unint64_t)[v5 hash];

  return v6;
}

- (id)description
{
  unint64_t v3 = self->_namespace;
  unint64_t v4 = [(NSURL *)self->_url lastPathComponent];
  v5 = +[NSString stringWithFormat:@"<GSAddition %p ns:\"%@\" n:\"%@\" o:%llx, cr:%hhd>", self, v3, v4, self->_options, self->_savedConflictResolved];

  return v5;
}

- (GSAddition)init
{
  unint64_t v3 = _NSMethodExceptionProem();
  +[NSException raise:NSInvalidArgumentException, @"%@: cannot use -init for initialization", v3 format];

  return 0;
}

- (void)_refreshWithDictionary:(id)a3
{
  userInfo = self->_userInfo;
  self->_userInfo = 0;
  id v5 = a3;

  displayName = self->_displayName;
  self->_displayName = 0;

  originalName = self->_originalName;
  self->_originalName = 0;

  unsigned __int8 v8 = [v5 objectForKey:@"o"];
  self->_options = (unint64_t)[v8 longLongValue];

  v9 = [v5 objectForKey:@"ns"];
  v10 = self->_namespace;
  self->_namespace = v9;

  v11 = [v5 objectForKey:@"u"];
  url = self->_url;
  self->_url = v11;

  uint64_t v13 = [v5 objectForKey:@"sz"];
  size = self->_size;
  self->_size = v13;

  id v15 = [v5 objectForKey:@"cr"];

  self->_savedConflictResolved = [v15 BOOLValue];
}

- (id)_initWithStorage:(id)a3 andDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GSAddition;
  v9 = [(GSAddition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    [(GSAddition *)v10 _refreshWithDictionary:v8];
  }

  return v10;
}

- (BOOL)setOptions:(unint64_t)a3 error:(id *)a4
{
  unsigned int v6 = [(GSAdditionStoring *)self->_storage setAdditionOptions:self value:a3 error:a4];
  if (v6) {
    self->_options = a3;
  }
  return v6;
}

- (BOOL)setDisplayName:(id)a3 error:(id *)a4
{
  id v7 = a3;
  unsigned int v8 = [(GSAdditionStoring *)self->_storage setAdditionDisplayName:self value:v7 error:a4];
  if (v8) {
    objc_storeStrong((id *)&self->_displayName, a3);
  }

  return v8;
}

- (BOOL)setNameSpace:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(NSString *)self->_namespace isEqualToString:v6])
  {
    uint64_t v7 = [(GSAdditionStoring *)self->_storage setAdditionNameSpace:self value:v6 error:a4];
    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    unsigned int v8 = (void *)v7;
    [(GSAddition *)self _refreshWithDictionary:v7];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (BOOL)mergeUserInfo:(id)a3 error:(id *)a4
{
  unsigned int v5 = [(GSAdditionStoring *)self->_storage mergeAdditionUserInfo:self value:a3 error:a4];
  if (v5)
  {
    userInfo = self->_userInfo;
    self->_userInfo = 0;
  }
  return v5;
}

- (BOOL)internalStat:(stat *)a3
{
  return sub_100005E94([(NSURL *)self->_url fileSystemRepresentation], a3) == 0;
}

- (BOOL)copyAdditionContentToURL:(id)a3 error:(id *)a4
{
  url = self->_url;
  id v6 = a3;
  uint64_t v7 = [(NSURL *)url fileSystemRepresentation];
  id v8 = v6;
  BOOL v9 = (char *)[v8 fileSystemRepresentation];

  return sub_10000EED8(v7, v9, a4);
}

- (id)replaceItemAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100005AA8(v6, self, a4);
  id v8 = (void *)v7;
  if (v7 && (id)v7 != v6)
  {
    BOOL v9 = [(GSAddition *)self storage];
    v10 = [v9 documentURL];
    unsigned int v11 = [v10 isEqual:v6];

    if (v11) {
      [v9 setDocumentURL:v8];
    }
  }
  return v8;
}

+ (id)makeNameForUser:(unsigned int)a3 name:(id)a4
{
  return +[NSString stringWithFormat:@":%d:%@", *(void *)&a3, a4];
}

- (BOOL)markSavedConflictAsResolved:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(NSString *)self->_namespace isEqualToString:@"com.apple.ubiquity"];
  if (v7)
  {
    unsigned int v7 = [(GSAdditionStoring *)self->_storage setAdditionConflictResolved:self value:v5 error:a4];
    if (v7)
    {
      self->_savedConflictResolved = v5;
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)nameSpace
{
  return self->_namespace;
}

- (GSAdditionStoring)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_namespace, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end