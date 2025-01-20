@interface EAEmailAddressSet
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
+ (id)set;
+ (id)setWithCapacity:(unint64_t)a3;
- (BOOL)intersectsSet:(id)a3;
- (BOOL)isEqualToSet:(id)a3;
- (BOOL)isSubsetOfSet:(id)a3;
- (EAEmailAddressSet)init;
- (EAEmailAddressSet)initWithCapacity:(unint64_t)a3;
- (EAEmailAddressSet)initWithCoder:(id)a3;
- (EAEmailAddressSet)initWithSerializedRepresentation:(id)a3;
- (NSData)serializedRepresentation;
- (NSMutableSet)internalSet;
- (id)allObjects;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)intersectSet:(id)a3;
- (void)minusSet:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)setInternalSet:(id)a3;
- (void)setSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation EAEmailAddressSet

- (void).cxx_destruct
{
}

- (void)unionSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(EAEmailAddressSet *)self internalSet];
    v6 = [v4 internalSet];
    [v5 unionSet:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EAEmailAddressSet;
    [(EAEmailAddressSet *)&v7 unionSet:v4];
  }
}

- (void)addObject:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EAEmailAddressSet.m" lineNumber:173 description:@"Email must be string"];
  }
  v5 = [(EAEmailAddressSet *)self internalSet];
  v6 = [[_EAEmailAddress alloc] initWithEmailAddress:v8];
  [v5 addObject:v6];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(EAEmailAddressSet);
  v6 = [(EAEmailAddressSet *)self internalSet];
  objc_super v7 = (void *)[v6 mutableCopyWithZone:a3];
  [(EAEmailAddressSet *)v5 setInternalSet:v7];

  return v5;
}

- (id)member:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"EAEmailAddressSet.m" lineNumber:111 description:@"Email must be string"];
  }
  v6 = [[_EAEmailAddress alloc] initWithEmailAddress:v5];
  objc_super v7 = [(EAEmailAddressSet *)self internalSet];
  id v8 = [v7 member:v6];
  v9 = [v8 emailAddress];

  return v9;
}

- (NSMutableSet)internalSet
{
  return self->_internalSet;
}

- (EAEmailAddressSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)EAEmailAddressSet;
  v2 = [(EAEmailAddressSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:0];
    internalSet = v2->_internalSet;
    v2->_internalSet = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)setInternalSet:(id)a3
{
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__EAEmailAddressSet_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

void __24__EAEmailAddressSet_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

+ (id)set
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)setWithCapacity:(unint64_t)a3
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithCapacity:a3];
  return v3;
}

- (EAEmailAddressSet)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EAEmailAddressSet;
  id v4 = [(EAEmailAddressSet *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:a3];
    internalSet = v4->_internalSet;
    v4->_internalSet = (NSMutableSet *)v5;
  }
  return v4;
}

- (EAEmailAddressSet)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:0];
  objc_super v6 = [(EAEmailAddressSet *)self initWithCoder:v5];

  return v6;
}

- (NSData)serializedRepresentation
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [(EAEmailAddressSet *)self encodeWithCoder:v3];
  id v4 = [v3 encodedData];

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EAEmailAddressSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EAEmailAddressSet;
  uint64_t v5 = [(EAEmailAddressSet *)&v12 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_internalSet"];
    internalSet = v5->_internalSet;
    v5->_internalSet = (NSMutableSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EAEmailAddressSet;
  [(EAEmailAddressSet *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_internalSet"];
}

- (unint64_t)count
{
  id v2 = [(EAEmailAddressSet *)self internalSet];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)intersectsSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
    objc_super v6 = [v4 internalSet];
    unsigned __int8 v7 = [v5 intersectsSet:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    unsigned __int8 v7 = [(EAEmailAddressSet *)&v9 intersectsSet:v4];
  }

  return v7;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
  {
    uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
    objc_super v6 = [v4 internalSet];
    unsigned __int8 v7 = [v5 isSubsetOfSet:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    unsigned __int8 v7 = [(EAEmailAddressSet *)&v9 isSubsetOfSet:v4];
  }

  return v7;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (unint64_t v5 = -[EAEmailAddressSet count](self, "count"), v5 == [v4 count]))
  {
    unsigned __int8 v6 = [(EAEmailAddressSet *)self isSubsetOfSet:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    unsigned __int8 v6 = [(EAEmailAddressSet *)&v9 isEqualToSet:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (id)allObjects
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[EAEmailAddressSet count](self, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(EAEmailAddressSet *)self internalSet];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_super v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) emailAddress];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)objectEnumerator
{
  id v2 = [[_EAEmailAddressSetEnumerator alloc] initWithSet:self];
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  objc_super v8 = [(EAEmailAddressSet *)self internalSet];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      id v11 = a3->var1[i];
      a3->var1[i] = (id)[v11 emailAddress];
    }
  }
  return v9;
}

- (void)removeObject:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EAEmailAddressSet.m" lineNumber:178 description:@"Email must be string"];
  }
  uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
  uint64_t v6 = [[_EAEmailAddress alloc] initWithEmailAddress:v8];
  [v5 removeObject:v6];
}

- (void)removeAllObjects
{
  id v2 = [(EAEmailAddressSet *)self internalSet];
  [v2 removeAllObjects];
}

- (void)minusSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
    uint64_t v6 = [v4 internalSet];
    [v5 minusSet:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EAEmailAddressSet;
    [(EAEmailAddressSet *)&v7 minusSet:v4];
  }
}

- (void)intersectSet:(id)a3
{
  id v4 = (EAEmailAddressSet *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(EAEmailAddressSet *)self internalSet];
      uint64_t v6 = [(EAEmailAddressSet *)v4 internalSet];
      [v5 intersectSet:v6];
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)EAEmailAddressSet;
      [(EAEmailAddressSet *)&v7 intersectSet:v4];
    }
  }
}

- (void)setSet:(id)a3
{
  id v4 = (EAEmailAddressSet *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(EAEmailAddressSet *)v4 internalSet];
      uint64_t v6 = (void *)[v5 mutableCopy];
      [(EAEmailAddressSet *)self setInternalSet:v6];

      objc_super v7 = [(EAEmailAddressSet *)self internalSet];
      id v8 = [(EAEmailAddressSet *)v4 internalSet];
      [v7 unionSet:v8];
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)EAEmailAddressSet;
      [(EAEmailAddressSet *)&v9 setSet:v4];
    }
  }
}

- (void)initWithSerializedRepresentation:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_2146DB000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);
}

@end