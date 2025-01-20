@interface ACCredentialItem
+ (BOOL)supportsSecureCoding;
- (ACAccountStore)accountStore;
- (ACCredentialItem)initWithAccountIdentifier:(id)a3 serviceName:(id)a4;
- (ACCredentialItem)initWithCoder:(id)a3;
- (ACCredentialItem)initWithManagedCredentialItem:(id)a3;
- (ACCredentialItem)initWithManagedCredentialItem:(id)a3 accountStore:(id)a4;
- (BOOL)isDirty;
- (BOOL)isExpired;
- (BOOL)isPersistent;
- (BOOL)isPropertyDirty:(id)a3;
- (NSDate)expirationDate;
- (NSSet)dirtyProperties;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)serviceName;
- (NSURL)objectID;
- (id)_encodeProtobuf;
- (id)_encodeProtobufData;
- (id)_initWithProtobuf:(id)a3;
- (id)_initWithProtobufData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fullDescription;
- (void)_markPropertyDirty:(id)a3;
- (void)clearDirtyProperties;
- (void)encodeWithCoder:(id)a3;
- (void)markAllPropertiesDirty;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setPersistent:(BOOL)a3;
- (void)setServiceName:(id)a3;
@end

@implementation ACCredentialItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACCredentialItem)initWithManagedCredentialItem:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  v7 = [(ACCredentialItem *)self initWithManagedCredentialItem:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_accountStore, v6);
  }

  return v8;
}

- (ACCredentialItem)initWithManagedCredentialItem:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ACCredentialItem;
  v5 = [(ACCredentialItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountIdentifier];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 expirationDate];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v8;

    uint64_t v10 = [v4 serviceName];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    v12 = [v4 persistent];
    v5->_persistent = [v12 BOOLValue];

    v13 = [v4 objectID];
    uint64_t v14 = [v13 URIRepresentation];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v14;

    v16 = v5;
  }

  return v5;
}

- (ACCredentialItem)initWithAccountIdentifier:(id)a3 serviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACCredentialItem;
  uint64_t v8 = [(ACCredentialItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v11;

    [(ACCredentialItem *)v8 _markPropertyDirty:@"accountIdentifier"];
    [(ACCredentialItem *)v8 _markPropertyDirty:@"serviceName"];
    [(ACCredentialItem *)v8 _markPropertyDirty:@"persistent"];
  }

  return v8;
}

- (ACCredentialItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ACCredentialItem;
  v5 = [(ACCredentialItem *)&v24 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    uint64_t v7 = [v6 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceName"];
    uint64_t v12 = [v11 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v12;

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistent"];
    v5->_persistent = [v14 BOOLValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
    uint64_t v16 = [v15 copy];
    objectID = v5->_objectID;
    v5->_objectID = (NSURL *)v16;

    objc_super v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"dirtyProperties"];
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ACCredentialItem *)self accountIdentifier];
  [v4 encodeObject:v5 forKey:@"accountIdentifier"];

  id v6 = [(ACCredentialItem *)self expirationDate];
  [v4 encodeObject:v6 forKey:@"expirationDate"];

  uint64_t v7 = [(ACCredentialItem *)self serviceName];
  [v4 encodeObject:v7 forKey:@"serviceName"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ACCredentialItem isPersistent](self, "isPersistent"));
  [v4 encodeObject:v8 forKey:@"persistent"];

  uint64_t v9 = [(ACCredentialItem *)self objectID];
  [v4 encodeObject:v9 forKey:@"objectID"];

  id v10 = [(ACCredentialItem *)self dirtyProperties];
  [v4 encodeObject:v10 forKey:@"dirtyProperties"];
}

- (id)_initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [(ACCredentialItem *)self init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 accountIdentifier];
    uint64_t v8 = [v7 copy];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    if ([v6 hasExpirationDate])
    {
      id v10 = [v6 expirationDate];
      uint64_t v11 = [v10 date];
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v11;
    }
    v13 = [v6 serviceName];
    uint64_t v14 = [v13 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v14;

    v5->_persistent = [v6 isPersistent];
    if ([v6 hasObjectID])
    {
      uint64_t v16 = [v6 objectID];
      uint64_t v17 = [v16 url];
      objectID = v5->_objectID;
      v5->_objectID = (NSURL *)v17;
    }
    uint64_t v19 = [v6 dirtyProperties];

    if (v19)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1CA80]);
      uint64_t v21 = [v6 dirtyProperties];
      uint64_t v22 = [v20 initWithArray:v21];
      dirtyProperties = v5->_dirtyProperties;
      v5->_dirtyProperties = (NSMutableSet *)v22;
    }
    objc_super v24 = v5;
  }
  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACCredentialItem.m", 140, @"Invalid parameter not satisfying: %@", @"data.length != 0" object file lineNumber description];
  }
  if ([v5 length])
  {
    id v6 = [[ACProtobufCredentialItem alloc] initWithData:v5];
    if (v6)
    {
      self = (ACCredentialItem *)[(ACCredentialItem *)self _initWithProtobuf:v6];
      uint64_t v7 = self;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  v3 = objc_opt_new();
  [v3 setAccountIdentifier:self->_accountIdentifier];
  id v4 = [[ACProtobufDate alloc] initWithDate:self->_expirationDate];
  [v3 setExpirationDate:v4];

  [v3 setServiceName:self->_serviceName];
  objc_msgSend(v3, "setIsPersistent:", -[ACCredentialItem isPersistent](self, "isPersistent"));
  id v5 = [[ACProtobufURL alloc] initWithURL:self->_objectID];
  [v3 setObjectID:v5];

  id v6 = [(ACCredentialItem *)self dirtyProperties];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = (void *)[v7 mutableCopy];
  [v3 setDirtyProperties:v8];

  return v3;
}

- (id)_encodeProtobufData
{
  v2 = [(ACCredentialItem *)self _encodeProtobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(ACCredentialItem *)self accountIdentifier];
  id v5 = [(ACCredentialItem *)self serviceName];
  id v6 = [v3 stringWithFormat:@"%@ (%@)", v4, v5];

  return (NSString *)v6;
}

- (id)fullDescription
{
  v3 = NSString;
  id v4 = [(ACCredentialItem *)self accountIdentifier];
  id v5 = [(ACCredentialItem *)self expirationDate];
  id v6 = [(ACCredentialItem *)self serviceName];
  if ([(ACCredentialItem *)self isPersistent]) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  uint64_t v8 = [(ACCredentialItem *)self objectID];
  uint64_t v9 = [v3 stringWithFormat:@"accountIdentifier: %@\nexpirationDate: %@\nserviceName: %@\npersistent: %@\nobjectID: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_serviceName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(unsigned char *)(v5 + 32) = self->_persistent;
  uint64_t v12 = [(NSURL *)self->_objectID copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);
  objc_storeWeak((id *)(v5 + 48), WeakRetained);

  uint64_t v15 = [(NSMutableSet *)self->_dirtyProperties mutableCopyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  return (id)v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  accountIdentifier = self->_accountIdentifier;
  self->_accountIdentifier = v4;

  [(ACCredentialItem *)self _markPropertyDirty:@"accountIdentifier"];
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  LOBYTE(expirationDate) = [(NSDate *)expirationDate compare:v3] != NSOrderedDescending;

  return (char)expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);

  [(ACCredentialItem *)self _markPropertyDirty:@"expirationDate"];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  serviceName = self->_serviceName;
  self->_serviceName = v4;

  [(ACCredentialItem *)self _markPropertyDirty:@"serviceName"];
}

- (BOOL)isPersistent
{
  return self->_persistent;
}

- (void)setPersistent:(BOOL)a3
{
  self->_persistent = a3;
  [(ACCredentialItem *)self _markPropertyDirty:@"persistent"];
}

- (NSURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);

  [(ACCredentialItem *)self _markPropertyDirty:@"objectID"];
}

- (BOOL)isDirty
{
  return [(NSMutableSet *)self->_dirtyProperties count] != 0;
}

- (BOOL)isPropertyDirty:(id)a3
{
  return [(NSMutableSet *)self->_dirtyProperties containsObject:a3];
}

- (void)markAllPropertiesDirty
{
  [(ACCredentialItem *)self _markPropertyDirty:@"accountIdentifier"];
  [(ACCredentialItem *)self _markPropertyDirty:@"expirationDate"];
  [(ACCredentialItem *)self _markPropertyDirty:@"serviceName"];
  [(ACCredentialItem *)self _markPropertyDirty:@"persistent"];

  [(ACCredentialItem *)self _markPropertyDirty:@"objectID"];
}

- (void)_markPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v8 = v4;
  if (!dirtyProperties)
  {
    uint64_t v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableSet *)dirtyProperties addObject:v4];
}

- (void)clearDirtyProperties
{
  self->_dirtyProperties = 0;
  MEMORY[0x1F41817F8]();
}

- (ACAccountStore)accountStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);

  return (ACAccountStore *)WeakRetained;
}

- (void)setAccountStore:(id)a3
{
}

- (NSSet)dirtyProperties
{
  return &self->_dirtyProperties->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_destroyWeak((id *)&self->_accountStore);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end