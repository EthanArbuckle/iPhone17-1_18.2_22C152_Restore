@interface EMObjectID
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (id)_decodableClasses;
+ (id)objectIDFromSerializedRepresentation:(id)a3;
+ (void)addDecodableClass:(Class)a3;
- (BOOL)isEphemeral;
- (BOOL)isEqual:(id)a3;
- (EFStringHash)stringHash;
- (EMObjectID)initWithCoder:(id)a3;
- (EMObjectID)initWithRepresentedObjectID:(id)a3;
- (NSData)serializedRepresentation;
- (NSObject)representedObjectID;
- (NSString)description;
- (id)cachedSelf;
- (id)initAsEphemeralID:(BOOL)a3;
- (id)initAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4;
- (unint64_t)hash;
- (void)_commonInitAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMObjectID

- (EMObjectID)initWithRepresentedObjectID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMObjectID;
  v5 = [(EMObjectID *)&v8 init];
  v6 = v5;
  if (v5) {
    [(EMObjectID *)v5 _commonInitAsEphemeralID:0 representedObjectID:v4];
  }

  return v6;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(EMObjectID *)self representedObjectID];
  v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringHash, 0);
  objc_storeStrong((id *)&self->_representedObjectID, 0);
}

- (id)initAsEphemeralID:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EMObjectID;
  uint64_t v4 = [(EMObjectID *)&v7 init];
  if (v4)
  {
    if (v3)
    {
      v5 = [MEMORY[0x1E4F29128] UUID];
    }
    else
    {
      v5 = 0;
    }
    [(EMObjectID *)v4 _commonInitAsEphemeralID:v3 representedObjectID:v5];
  }
  return v4;
}

- (void)_commonInitAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4
{
  id v6 = a4;
  self->_ephemeral = a3;
  if (v6)
  {
    id v9 = v6;
    objc_super v7 = [v6 copyWithZone:0];
    representedObjectID = self->_representedObjectID;
    self->_representedObjectID = v7;

    self->_hash = [self->_representedObjectID hash];
    id v6 = v9;
  }
}

- (EMObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMObjectID;
  v5 = [(EMObjectID *)&v11 init];
  if (v5)
  {
    v5->_ephemeral = [v4 decodeBoolForKey:@"EFPropertyKey_ephemeral"];
    id v6 = +[EMObjectID _decodableClasses];
    objc_super v7 = [v4 decodeObjectOfClasses:v6 forKey:@"kRepresentedObjectIDKey"];

    uint64_t v8 = [v7 copyWithZone:0];
    representedObjectID = v5->_representedObjectID;
    v5->_representedObjectID = v8;

    v5->_hash = [v5->_representedObjectID hash];
  }

  return v5;
}

+ (id)_decodableClasses
{
  if (_decodableClasses_onceToken != -1) {
    dispatch_once(&_decodableClasses_onceToken, &__block_literal_global_7_1);
  }
  v2 = (void *)_decodableClasses_decodableClasses;
  return v2;
}

- (BOOL)isEphemeral
{
  return self->_ephemeral;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[EMObjectID isEphemeral](self, "isEphemeral"), @"EFPropertyKey_ephemeral");
  [v6 encodeObject:self->_representedObjectID forKey:@"kRepresentedObjectIDKey"];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v6 encodeObject:v5 forKey:@"kClassKey"];
}

- (id)cachedSelf
{
  if (cachedSelf_onceToken_3 != -1) {
    dispatch_once(&cachedSelf_onceToken_3, &__block_literal_global_40);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_3);
  BOOL v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs_3, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_3);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMObjectID *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(EMObjectID *)self isEphemeral];
      if (v6 == [(EMObjectID *)v5 isEphemeral])
      {
        representedObjectID = self->_representedObjectID;
        id v9 = [(EMObjectID *)v5 representedObjectID];
        char v7 = [representedObjectID isEqual:v9];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSObject)representedObjectID
{
  return self->_representedObjectID;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (EFStringHash)stringHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  stringHash = self->_stringHash;
  if (!stringHash)
  {
    v5 = [(EMObjectID *)self representedObjectID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = (EFStringHash *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithString:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v6 = (EFStringHash *)[objc_alloc(MEMORY[0x1E4F60F40]) initWithData:v5];
      }
      else {
        BOOL v6 = (EFStringHash *)objc_msgSend(objc_alloc(MEMORY[0x1E4F60F40]), "initWithHash:", -[EMObjectID hash](self, "hash"));
      }
    }
    char v7 = self->_stringHash;
    self->_stringHash = v6;

    stringHash = self->_stringHash;
  }
  uint64_t v8 = stringHash;
  os_unfair_lock_unlock(p_lock);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectIDFromSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
  BOOL v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kClassKey"];
  if ([(NSString *)v6 length]) {
    a1 = NSClassFromString(v6);
  }
  if ([a1 isSubclassOfClass:objc_opt_class()])
  {
    char v7 = (void *)[objc_alloc((Class)a1) initWithCoder:v5];
  }
  else
  {
    uint64_t v8 = +[EMObjectID log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[EMObjectID objectIDFromSerializedRepresentation:]((uint64_t)v6, v8);
    }

    char v7 = 0;
  }

  return v7;
}

- (id)initAsEphemeralID:(BOOL)a3 representedObjectID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EMObjectID;
  char v7 = [(EMObjectID *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    [(EMObjectID *)v7 _commonInitAsEphemeralID:v4 representedObjectID:v6];
  }

  return v8;
}

void __24__EMObjectID_cachedSelf__block_invoke()
{
  cachedSelf_sTableLock_3 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:0];
  v1 = (void *)cachedSelf_sUniqueObjectIDs_3;
  cachedSelf_sUniqueObjectIDs_3 = v0;
}

void __31__EMObjectID__decodableClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  v5 = (void *)_decodableClasses_decodableClasses;
  _decodableClasses_decodableClasses = v4;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__EMObjectID_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1) {
    dispatch_once(&log_onceToken_29, block);
  }
  uint64_t v2 = (void *)log_log_29;
  return (OS_os_log *)v2;
}

void __17__EMObjectID_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)log_log_29;
  log_log_29 = (uint64_t)v1;
}

+ (void)addDecodableClass:(Class)a3
{
  id v4 = [a1 _decodableClasses];
  [v4 addObject:a3];
}

- (NSData)serializedRepresentation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(EMObjectID *)self encodeWithCoder:v3];
  id v4 = [v3 encodedData];

  return (NSData *)v4;
}

+ (void)objectIDFromSerializedRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "objectIDFromSerializedRepresentation called with non ObjectID type %@", (uint8_t *)&v2, 0xCu);
}

+ (void)objectIDFromSerializedRepresentation:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);
}

@end