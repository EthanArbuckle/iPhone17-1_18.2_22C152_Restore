@interface NSMergeConflict
+ (BOOL)supportsSecureCoding;
- (NSDictionary)cachedSnapshot;
- (NSDictionary)objectSnapshot;
- (NSDictionary)persistedSnapshot;
- (NSManagedObject)sourceObject;
- (NSMergeConflict)init;
- (NSMergeConflict)initWithCoder:(id)a3;
- (NSMergeConflict)initWithSource:(NSManagedObject *)srcObject newVersion:(NSUInteger)newvers oldVersion:(NSUInteger)oldvers cachedSnapshot:(NSDictionary *)cachesnap persistedSnapshot:(NSDictionary *)persnap;
- (NSMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 snapshot1:(id)a6 snapshot2:(id)a7 snapshot3:(id)a8;
- (NSUInteger)newVersionNumber;
- (NSUInteger)oldVersionNumber;
- (id)ancestorSnapshot;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMergeConflict

- (NSMergeConflict)initWithSource:(NSManagedObject *)srcObject newVersion:(NSUInteger)newvers oldVersion:(NSUInteger)oldvers cachedSnapshot:(NSDictionary *)cachesnap persistedSnapshot:(NSDictionary *)persnap
{
  v15.receiver = self;
  v15.super_class = (Class)NSMergeConflict;
  v12 = [(NSMergeConflict *)&v15 init];
  if (v12)
  {
    v12->_source = srcObject;
    v12->_snapshot1 = 0;
    if (!persnap)
    {
      if (dword_1EB2706EC) {
        v13 = [(NSManagedObject *)srcObject committedValuesForKeys:0];
      }
      else {
        v13 = -[NSManagedObject _newCommittedSnapshotValues]((uint64_t *)srcObject);
      }
      v12->_snapshot1 = v13;
    }
    v12->_snapshot2 = cachesnap;
    v12->_snapshot3 = persnap;
    v12->_newVersion = newvers;
    v12->_oldVersion = oldvers;
  }
  return v12;
}

- (NSMergeConflict)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSMergeConflict;
  return [(NSMergeConflict *)&v3 init];
}

- (NSMergeConflict)initWithSource:(id)a3 newVersion:(unint64_t)a4 oldVersion:(unint64_t)a5 snapshot1:(id)a6 snapshot2:(id)a7 snapshot3:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)NSMergeConflict;
  v14 = [(NSMergeConflict *)&v16 init];
  if (v14)
  {
    v14->_source = a3;
    v14->_snapshot1 = a6;
    v14->_snapshot2 = a7;
    v14->_snapshot3 = a8;
    v14->_newVersion = a4;
    v14->_oldVersion = a5;
  }
  return v14;
}

- (id)description
{
  id snapshot1 = self->_snapshot1;
  if (snapshot1)
  {
    p_snapshot2 = &self->_snapshot2;
    v5 = @"cached row";
    v6 = @"object snapshot";
  }
  else
  {
    id snapshot1 = self->_snapshot2;
    p_snapshot2 = &self->_snapshot3;
    v5 = @"database row";
    v6 = @"cached row";
  }
  id v7 = *p_snapshot2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id source = self->_source;
  if ((isKindOfClass & 1) == 0) {
    id source = (id)[self->_source objectID];
  }
  unint64_t newVersion = self->_newVersion;
  v11 = NSString;
  uint64_t v12 = objc_opt_class();
  id v13 = self->_source;
  uint64_t oldVersion_low = LODWORD(self->_oldVersion);
  if (newVersion) {
    return (id)[v11 stringWithFormat:@"%@ (%p) for NSManagedObject (%p) with objectID '%@' with oldVersion = %d and unint64_t newVersion = %d and old %@ = %@ and new %@ = %@", v12, self, v13, source, oldVersion_low, self->_newVersion, v6, snapshot1, v5, v7];
  }
  else {
    return (id)[v11 stringWithFormat:@"%@ (%p) for NSManagedObject (%p) with objectID '%@' with oldVersion = %d and unint64_t newVersion = <deleted> and old %@ = %@", v12, self, v13, source, oldVersion_low, v6, snapshot1, v16, v17, v18];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSMergeConflict;
  [(NSMergeConflict *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 delegate] && (objc_msgSend(a3, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    [a3 encodeObject:self->_source forKey:@"_source"];
    [a3 encodeObject:self->_snapshot1 forKey:@"_snapshot1"];
    [a3 encodeObject:self->_snapshot2 forKey:@"_snapshot2"];
    [a3 encodeObject:self->_snapshot3 forKey:@"_snapshot3"];
    [a3 encodeInteger:self->_oldVersion forKey:@"_oldVersion"];
    unint64_t newVersion = self->_newVersion;
    [a3 encodeInteger:newVersion forKey:@"_newVersion"];
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    NSLog((NSString *)@"Coder = %@ (%@)", a3, v6);
    uint64_t v7 = [a3 delegate];
    [a3 delegate];
    uint64_t v8 = objc_opt_class();
    NSLog((NSString *)@"Delegate = %@ (%@)", v7, v8);
    NSLog((NSString *)@"CoreData does not support encoding of conflict objects. Conflicts need to be resolved within the scope of a valid managed object context and should not be archived or serialized: %@", self);
    __break(1u);
  }
}

- (NSMergeConflict)initWithCoder:(id)a3
{
  if ([a3 requiresSecureCoding]
    && (objc_opt_respondsToSelector() & 1) != 0
    && ![a3 userInfo]
    && !objc_msgSend((id)objc_msgSend(a3, "userInfo"), "valueForKey:", @"PSCKey")
    || ([a3 requiresSecureCoding] & 1) == 0 && !objc_msgSend(a3, "delegate"))
  {
    NSLog((NSString *)@"This is probably not where you want to be");
  }
  uint64_t v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"_source");
  uint64_t v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"_snapshot1");
  uint64_t v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"_snapshot2");
  uint64_t v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"_snapshot3");
  uint64_t v9 = [a3 decodeIntegerForKey:@"_oldVersion"];
  uint64_t v10 = [a3 decodeIntegerForKey:@"_newVersion"];

  return [(NSMergeConflict *)self initWithSource:v5 newVersion:v10 oldVersion:v9 snapshot1:v6 snapshot2:v7 snapshot3:v8];
}

- (void)_doCleanupForXPCStore:(id)a3 context:(id)a4
{
  uint64_t v7 = -[_NSQueryGenerationToken _generationalComponentForStore:]([a4 _queryGenerationToken], a3);
  uint64_t v8 = -[NSXPCStore _cachedRowForObjectWithID:generation:]((os_unfair_lock_s *)a3, self->_source, v7);
  id v9 = (id)[a4 objectWithID:self->_source];

  self->_id source = v9;
  self->_snapshot3 = self->_snapshot2;
  self->_snapshot2 = (id)[(os_unfair_lock_s *)v8 _propertyCache];

  self->_id snapshot1 = 0;
}

- (id)objectForKey:(id)a3
{
  if (a3 == @"object") {
    return self->_source;
  }
  if (a3 == @"snapshot") {
    return self->_snapshot1;
  }
  if (a3 == @"cachedRow") {
    return self->_snapshot2;
  }
  if (a3 == @"databaseRow") {
    return self->_snapshot3;
  }
  if (a3 == @"newVersion") {
    goto LABEL_16;
  }
  if (a3 == @"oldVersion")
  {
LABEL_18:
    uint64_t v6 = NSNumber;
    unint64_t oldVersion = self->_oldVersion;
    goto LABEL_19;
  }
  if ([a3 isEqual:@"object"]) {
    return self->_source;
  }
  if ([a3 isEqual:@"snapshot"]) {
    return self->_snapshot1;
  }
  if ([a3 isEqual:@"cachedRow"]) {
    return self->_snapshot2;
  }
  if ([a3 isEqual:@"databaseRow"]) {
    return self->_snapshot3;
  }
  if (![a3 isEqual:@"newVersion"])
  {
    if (![a3 isEqual:@"oldVersion"]) {
      return 0;
    }
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v6 = NSNumber;
  unint64_t oldVersion = self->_newVersion;
LABEL_19:

  return (id)[v6 numberWithUnsignedInteger:oldVersion];
}

- (id)valueForKey:(id)a3
{
  if (a3 == @"object") {
    return self->_source;
  }
  if (a3 == @"snapshot") {
    return self->_snapshot1;
  }
  if (a3 == @"cachedRow") {
    return self->_snapshot2;
  }
  if (a3 == @"databaseRow") {
    return self->_snapshot3;
  }
  if (a3 == @"newVersion") {
    goto LABEL_17;
  }
  if (a3 == @"oldVersion")
  {
LABEL_19:
    uint64_t v6 = NSNumber;
    unint64_t oldVersion = self->_oldVersion;
    goto LABEL_20;
  }
  if ([a3 isEqual:@"object"]) {
    return self->_source;
  }
  if ([a3 isEqual:@"snapshot"]) {
    return self->_snapshot1;
  }
  if ([a3 isEqual:@"cachedRow"]) {
    return self->_snapshot2;
  }
  if ([a3 isEqual:@"databaseRow"]) {
    return self->_snapshot3;
  }
  if (![a3 isEqual:@"newVersion"])
  {
    if (![a3 isEqual:@"oldVersion"])
    {
      v8.receiver = self;
      v8.super_class = (Class)NSMergeConflict;
      return [(NSMergeConflict *)&v8 valueForKey:a3];
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v6 = NSNumber;
  unint64_t oldVersion = self->_newVersion;
LABEL_20:

  return (id)[v6 numberWithUnsignedInteger:oldVersion];
}

- (id)ancestorSnapshot
{
  return 0;
}

- (NSManagedObject)sourceObject
{
  return (NSManagedObject *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)objectSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)cachedSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)persistedSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSUInteger)newVersionNumber
{
  return self->_newVersion;
}

- (NSUInteger)oldVersionNumber
{
  return self->_oldVersion;
}

@end