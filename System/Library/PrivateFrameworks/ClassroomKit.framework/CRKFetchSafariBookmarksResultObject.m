@interface CRKFetchSafariBookmarksResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchSafariBookmarksResultObject)initWithCoder:(id)a3;
- (NSArray)bookmarks;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmarks:(id)a3;
@end

@implementation CRKFetchSafariBookmarksResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchSafariBookmarksResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKFetchSafariBookmarksResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
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
  v6.super_class = (Class)CRKFetchSafariBookmarksResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchSafariBookmarksResultObject *)self bookmarks];
  [v4 encodeObject:v5 forKey:@"bookmarks"];
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end