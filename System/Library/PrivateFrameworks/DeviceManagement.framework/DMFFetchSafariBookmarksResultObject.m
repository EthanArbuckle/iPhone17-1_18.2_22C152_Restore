@interface DMFFetchSafariBookmarksResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchSafariBookmarksResultObject)initWithBookmarks:(id)a3;
- (DMFFetchSafariBookmarksResultObject)initWithCoder:(id)a3;
- (NSArray)bookmarks;
- (id)description;
- (void)_appendDescriptionOfBookmark:(id)a3 toString:(id)a4 level:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchSafariBookmarksResultObject

- (DMFFetchSafariBookmarksResultObject)initWithBookmarks:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchSafariBookmarksResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bookmarks"];
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchSafariBookmarksResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchSafariBookmarksResultObject *)self bookmarks];
  [v4 encodeObject:v5 forKey:@"bookmarks"];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DMFFetchSafariBookmarksResultObject *)self bookmarks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [(DMFFetchSafariBookmarksResultObject *)self _appendDescriptionOfBookmark:*(void *)(*((void *)&v11 + 1) + 8 * i) toString:v3 level:1];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [NSString stringWithFormat:@"<%@: %p {\n%@}>", objc_opt_class(), self, v3];

  return v9;
}

- (void)_appendDescriptionOfBookmark:(id)a3 toString:(id)a4 level:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [&stru_1F18939E8 stringByPaddingToLength:a5 withString:@"\t" startingAtIndex:0];
  if ([v8 isFolder])
  {
    long long v11 = NSNumber;
    long long v12 = [v8 children];
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  }
  else
  {
    long long v12 = [v8 URL];
    [v12 absoluteString];
  long long v13 = };

  long long v14 = [v8 name];
  [v9 appendFormat:@"%@%@ (%@)\n", v10, v14, v13];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v15 = [v8 children];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    unint64_t v19 = a5 + 1;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [(DMFFetchSafariBookmarksResultObject *)self _appendDescriptionOfBookmark:*(void *)(*((void *)&v21 + 1) + 8 * v20++) toString:v9 level:v19];
      }
      while (v17 != v20);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void).cxx_destruct
{
}

@end