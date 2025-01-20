@interface DMFInstallManagedBookRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (DMFInstallManagedBookRequest)initWithCoder:(id)a3;
- (NSNumber)iTunesStoreID;
- (NSString)author;
- (NSString)originator;
- (NSString)persistentID;
- (NSString)title;
- (NSString)version;
- (NSURL)URL;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setITunesStoreID:(id)a3;
- (void)setOriginator:(id)a3;
- (void)setPersistentID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setURL:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation DMFInstallManagedBookRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB8F8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallManagedBookRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DMFInstallManagedBookRequest;
  v5 = [(CATTaskRequest *)&v29 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"originator"];
    originator = v5->_originator;
    v5->_originator = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"iTunesStoreID"];
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"author"];
    author = v5->_author;
    v5->_author = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v19;

    v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v22;

    v24 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v27 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)DMFInstallManagedBookRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v13 encodeWithCoder:v4];
  v5 = [(DMFInstallManagedBookRequest *)self originator];
  [v4 encodeObject:v5 forKey:@"originator"];

  v6 = [(DMFInstallManagedBookRequest *)self iTunesStoreID];
  [v4 encodeObject:v6 forKey:@"iTunesStoreID"];

  uint64_t v7 = [(DMFInstallManagedBookRequest *)self persistentID];
  [v4 encodeObject:v7 forKey:@"persistentID"];

  v8 = [(DMFInstallManagedBookRequest *)self author];
  [v4 encodeObject:v8 forKey:@"author"];

  v9 = [(DMFInstallManagedBookRequest *)self title];
  [v4 encodeObject:v9 forKey:@"title"];

  uint64_t v10 = [(DMFInstallManagedBookRequest *)self version];
  [v4 encodeObject:v10 forKey:@"version"];

  v11 = [(DMFInstallManagedBookRequest *)self URL];
  [v4 encodeObject:v11 forKey:@"URL"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFInstallManagedBookRequest type](self, "type"));
  [v4 encodeObject:v12 forKey:@"type"];
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (void)setITunesStoreID:(id)a3
{
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
  objc_storeStrong((id *)&self->_originator, 0);
}

@end