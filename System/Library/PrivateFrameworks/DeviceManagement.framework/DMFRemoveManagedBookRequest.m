@interface DMFRemoveManagedBookRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFRemoveManagedBookRequest)initWithCoder:(id)a3;
- (NSNumber)iTunesStoreID;
- (NSString)persistentID;
- (void)encodeWithCoder:(id)a3;
- (void)setITunesStoreID:(id)a3;
- (void)setPersistentID:(id)a3;
@end

@implementation DMFRemoveManagedBookRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABAC0;
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

- (DMFRemoveManagedBookRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFRemoveManagedBookRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"persistentID"];
    persistentID = v5->_persistentID;
    v5->_persistentID = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"iTunesStoreID"];
    iTunesStoreID = v5->_iTunesStoreID;
    v5->_iTunesStoreID = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFRemoveManagedBookRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFRemoveManagedBookRequest *)self persistentID];
  [v4 encodeObject:v5 forKey:@"persistentID"];

  v6 = [(DMFRemoveManagedBookRequest *)self iTunesStoreID];
  [v4 encodeObject:v6 forKey:@"iTunesStoreID"];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
}

@end