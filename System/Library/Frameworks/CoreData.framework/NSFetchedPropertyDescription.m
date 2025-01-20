@interface NSFetchedPropertyDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)isTransient;
- (NSFetchRequest)fetchRequest;
- (NSFetchedPropertyDescription)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_propertyType;
- (void)_createCachesAndOptimizeState;
- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchRequest:(NSFetchRequest *)fetchRequest;
@end

@implementation NSFetchedPropertyDescription

- (unint64_t)_propertyType
{
  return 3;
}

- (void)_createCachesAndOptimizeState
{
  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  [(NSPropertyDescription *)&v3 _createCachesAndOptimizeState];
  [(NSFetchedPropertyDescription *)self setFetchRequest:[(NSFetchedPropertyDescription *)self fetchRequest]];
  [(NSFetchRequest *)self->_fetchRequest allowEvaluation];
}

- (void)setFetchRequest:(NSFetchRequest *)fetchRequest
{
  [(NSPropertyDescription *)self _throwIfNotEditable];
  if (self->_fetchRequest != fetchRequest)
  {
    if (fetchRequest)
    {
      v5 = [(NSEntityDescription *)[(NSPropertyDescription *)self entity] managedObjectModel];
      if (v5 != -[NSEntityDescription managedObjectModel](-[NSFetchRequest entity](fetchRequest, "entity"), "managedObjectModel"))[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Can't use fetch request with fetched property description (entity model mismatch)."]; {
    }
      }

    fetchRequest = fetchRequest;
    self->_fetchRequest = fetchRequest;
  }
  if (self->_lazyFetchRequestEntityName) {
    BOOL v6 = fetchRequest == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && ![(NSFetchRequest *)fetchRequest entity])
  {
    v7 = self->_fetchRequest;
    v8 = [(NSEntityDescription *)[(NSPropertyDescription *)self entity] managedObjectModel];
    if (v8) {
      uint64_t v9 = [(NSMutableDictionary *)v8->_entities objectForKey:self->_lazyFetchRequestEntityName];
    }
    else {
      uint64_t v9 = 0;
    }
    [(NSFetchRequest *)v7 setEntity:v9];
  }

  self->_lazyFetchRequestEntityName = 0;
}

- (NSFetchRequest)fetchRequest
{
  if (!self->_lazyFetchRequestEntityName) {
    return self->_fetchRequest;
  }
  fetchRequest = self->_fetchRequest;
  if (!fetchRequest || [(NSFetchRequest *)fetchRequest entity]) {
    return self->_fetchRequest;
  }
  v4 = (NSFetchRequest *)(id)[(NSFetchRequest *)self->_fetchRequest copy];
  BOOL v6 = [(NSEntityDescription *)[(NSPropertyDescription *)self entity] managedObjectModel];
  if (v6) {
    uint64_t v7 = [(NSMutableDictionary *)v6->_entities objectForKey:self->_lazyFetchRequestEntityName];
  }
  else {
    uint64_t v7 = 0;
  }
  [(NSFetchRequest *)v4 setEntity:v7];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchedPropertyDescription)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSFetchedPropertyDescription;
  v4 = -[NSPropertyDescription initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->_fetchRequest = (NSFetchRequest *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFetchRequest"];
    v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"_NSFetchRequestEntityName"];
    if (![(NSFetchRequest *)v4->_fetchRequest entity])
    {
      if (v5 && ([v5 isNSString] & 1) == 0)
      {
        objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4866, &unk_1ED7E1BA0));

        return 0;
      }
      else
      {
        v4->_lazyFetchRequestEntityName = (NSString *)v5;
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_fetchRequest = 0;
  self->_lazyFetchRequestEntityName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  [(NSPropertyDescription *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSFetchedPropertyDescription;
  id v5 = -[NSPropertyDescription encodeWithCoder:](&v9, sel_encodeWithCoder_);
  BOOL v6 = (void *)MEMORY[0x18C127630](v5);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest"), @"NSFetchRequest");
  objc_super v7 = [(NSFetchRequest *)[(NSFetchedPropertyDescription *)self fetchRequest] entity];
  if (v7) {
    lazyFetchRequestEntityName = [(NSEntityDescription *)v7 name];
  }
  else {
    lazyFetchRequestEntityName = self->_lazyFetchRequestEntityName;
  }
  [a3 encodeObject:lazyFetchRequestEntityName forKey:@"_NSFetchRequestEntityName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSFetchedPropertyDescription;
  v4 = [(NSPropertyDescription *)&v9 copyWithZone:a3];
  if (v4)
  {
    id v5 = (void *)[(NSFetchRequest *)self->_fetchRequest copy];
    v4[12] = v5;
    [v5 setEntity:0];
    BOOL v6 = [(NSFetchRequest *)self->_fetchRequest entity];
    if (v6) {
      uint64_t v7 = [(NSString *)[(NSEntityDescription *)v6 name] copy];
    }
    else {
      uint64_t v7 = [(NSString *)self->_lazyFetchRequestEntityName copy];
    }
    v4[13] = v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    v11.receiver = self;
    v11.super_class = (Class)NSFetchedPropertyDescription;
    LODWORD(v7) = -[NSPropertyDescription isEqual:](&v11, sel_isEqual_);
    if (v7)
    {
      v8 = [(NSFetchedPropertyDescription *)self fetchRequest];
      uint64_t v7 = [a3 fetchRequest];
      if (v8 == (NSFetchRequest *)v7)
      {
        LOBYTE(v7) = 1;
      }
      else
      {
        uint64_t v9 = v7;
        LOBYTE(v7) = 0;
        if (v8 && v9) {
          LOBYTE(v7) = -[NSFetchRequest isEqual:](v8, "isEqual:");
        }
      }
    }
  }
  return v7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSFetchedPropertyDescription;
  return (id)[NSString stringWithFormat:@"%@, fetchRequest %@", -[NSPropertyDescription description](&v3, sel_description), -[NSFetchedPropertyDescription fetchRequest](self, "fetchRequest")];
}

- (BOOL)isTransient
{
  return 1;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  _writeInt32IntoData(a3, 0);
  uint64_t v16 = [a3 length] - 4;
  v18.receiver = self;
  v18.super_class = (Class)NSFetchedPropertyDescription;
  [(NSPropertyDescription *)&v18 _appendPropertyFieldsToData:a3 propertiesDict:a4 uniquedPropertyNames:a5 uniquedStrings:a6 uniquedData:a7 entitiesSlots:a8];
  _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(a9, "objectForKey:", self->_fetchRequest), "unsignedIntValue"));
  unsigned int v17 = bswap32([a3 length] - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v16, 4, &v17);
}

@end