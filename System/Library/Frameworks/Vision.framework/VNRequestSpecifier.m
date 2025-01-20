@interface VNRequestSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)_modelEquivalenciesRegistrar;
+ (id)allAvailableRequestClassNames;
+ (id)availablePrivateRequestClassNames;
+ (id)availableRequestClassNames;
+ (id)specifierForRequest:(id)a3;
+ (id)specifierForRequestClass:(Class)a3 revision:(unint64_t)a4 error:(id *)a5;
+ (id)specifierForRequestClassCode:(unsigned int *)a3 revision:(unint64_t)a4 error:(id *)a5;
+ (id)specifierForRequestClassName:(id)a3 revision:(unint64_t)a4 error:(id *)a5;
- (BOOL)hasModelEquivalencyToRequestSpecifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (BOOL)isPrivateRequestClass;
- (BOOL)isPrivateRevision;
- (BOOL)isPublic;
- (BOOL)isPublicRequestClass;
- (BOOL)isPublicRevision;
- (BOOL)observationProvidesBoundsNormalizedToROI;
- (BOOL)representsSupportedRequestAndReturnError:(id *)a3;
- (BOOL)specifiesAnyRequestClass:(Class)a3;
- (BOOL)specifiesAnyRequestClassName:(id)a3;
- (BOOL)specifiesRequestClass:(Class)a3;
- (BOOL)specifiesRequestClass:(Class)a3 revision:(unint64_t)a4;
- (BOOL)specifiesRequestClass:(Class)a3 withAnyRevision:(unint64_t)a4;
- (BOOL)specifiesRequestClassName:(id)a3;
- (BOOL)specifiesRequestClassName:(id)a3 revision:(unint64_t)a4;
- (BOOL)specifiesRequestClassName:(id)a3 withAnyRevision:(unint64_t)a4;
- (Class)requestClassAndReturnError:(id *)a3;
- (NSArray)allModelEquivalents;
- (NSString)requestClassName;
- (VNRequestSpecifier)initWithCoder:(id)a3;
- (VNRequestSpecifier)initWithRequestClass:(Class)a3 name:(id)a4 code:(unsigned int)a5 revision:(unint64_t)a6;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (unsigned)requestClassCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNRequestSpecifier

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v3 = [(VNRequestSpecifier *)self requestClassName];
  uint64_t v4 = [v3 hash];

  return [(VNRequestSpecifier *)self requestRevision] ^ __ROR8__(v4, 51);
}

- (NSString)requestClassName
{
  return self->_cachedRequestClassName;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNRequestSpecifier *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNRequestSpecifier *)self requestRevision];
      if (v6 == [(VNRequestSpecifier *)v5 requestRevision])
      {
        unsigned int v7 = [(VNRequestSpecifier *)self requestClassCode];
        BOOL v8 = v7 == [(VNRequestSpecifier *)v5 requestClassCode];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (unsigned)requestClassCode
{
  return self->_requestClassCode;
}

+ (id)specifierForRequestClass:(Class)a3 revision:(unint64_t)a4 error:(id *)a5
{
  if (_validateRequestClass(a3, a5))
  {
    v9 = NSStringFromClass(a3);
    unsigned int v13 = 0;
    if (+[VNClassRegistrar getClassCode:&v13 forClassName:v9 error:a5])
    {
      id v10 = objc_alloc((Class)a1);
      v11 = (void *)[v10 initWithRequestClass:a3 name:v9 code:v13 revision:a4];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (VNRequestSpecifier)initWithRequestClass:(Class)a3 name:(id)a4 code:(unsigned int)a5 revision:(unint64_t)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VNRequestSpecifier;
  v11 = [(VNRequestSpecifier *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_requestClassCode = a5;
    v11->_requestRevision = a6;
    uint64_t v13 = [v10 copy];
    cachedRequestClassName = v12->_cachedRequestClassName;
    v12->_cachedRequestClassName = (NSString *)v13;

    v12->_cachedRequestClass = a3;
  }

  return v12;
}

- (BOOL)specifiesRequestClass:(Class)a3
{
  uint64_t v4 = [(VNRequestSpecifier *)self requestClassAndReturnError:0];
  return v4 && v4 == a3;
}

- (Class)requestClassAndReturnError:(id *)a3
{
  Class cachedRequestClass = self->_cachedRequestClass;
  if (cachedRequestClass)
  {
    uint64_t v4 = cachedRequestClass;
  }
  else if (a3)
  {
    unint64_t v6 = [(VNRequestSpecifier *)self requestClassName];
    *a3 = +[VNError errorForUnsupportedRequestClassName:v6];
  }

  return cachedRequestClass;
}

- (VNRequestSpecifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"code"];
  id v13 = 0;
  unint64_t v6 = +[VNClassRegistrar classNameForClassCode:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v12 = v7;
    BOOL v8 = +[VNClassRegistrar validateRequestClassName:v6 error:&v12];
    id v9 = v12;

    if (v8)
    {
      self = -[VNRequestSpecifier initWithRequestClass:name:code:revision:](self, "initWithRequestClass:name:code:revision:", NSClassFromString(v6), v6, v5, [v4 decodeIntegerForKey:@"rev"]);
      id v7 = v9;
      id v10 = self;
    }
    else
    {
      [v4 failWithError:v9];
      id v10 = 0;
      id v7 = v9;
    }
  }
  else
  {
    [v4 failWithError:v7];
    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t requestClassCode = self->_requestClassCode;
  id v5 = a3;
  [v5 encodeInt32:requestClassCode forKey:@"code"];
  [v5 encodeInteger:self->_requestRevision forKey:@"rev"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = [(VNRequestSpecifier *)self requestRevision];
  id v5 = [(VNRequestSpecifier *)self requestClassAndReturnError:0];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = VNRequestRevisionString(v5, v4);
    if (v7)
    {
      BOOL v8 = (void *)v7;
      [v3 appendString:v7];
    }
    else
    {
      v11 = NSStringFromClass(v6);
      [v3 appendString:v11];

      BOOL v8 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(VNRequestSpecifier *)self requestClassName];
    BOOL v8 = (void *)v9;
    id v10 = "";
    if (v4 > 0xDECAEFFF) {
      id v10 = "private ";
    }
    [v3 appendFormat:@"unavailable %@, %srevision %lu", v9, v10, v4];
  }

  return v3;
}

- (BOOL)isPrivate
{
  if ([(VNRequestSpecifier *)self isPrivateRevision]) {
    return 1;
  }

  return [(VNRequestSpecifier *)self isPrivateRequestClass];
}

- (BOOL)isPublic
{
  BOOL v3 = [(VNRequestSpecifier *)self isPublicRevision];
  if (v3)
  {
    LOBYTE(v3) = [(VNRequestSpecifier *)self isPublicRequestClass];
  }
  return v3;
}

- (BOOL)isPrivateRevision
{
  return [(VNRequestSpecifier *)self requestRevision] > 0xDECAEFFF;
}

- (BOOL)isPublicRevision
{
  return [(VNRequestSpecifier *)self requestRevision] < 0xDECAF000;
}

- (BOOL)isPrivateRequestClass
{
  return +[VNClassRegistrar entryTypeForClassCode:[(VNRequestSpecifier *)self requestClassCode]] == 2;
}

- (BOOL)isPublicRequestClass
{
  return +[VNClassRegistrar entryTypeForClassCode:[(VNRequestSpecifier *)self requestClassCode]] == 1;
}

- (BOOL)observationProvidesBoundsNormalizedToROI
{
  uint64_t v3 = [(VNRequestSpecifier *)self requestClassCode];
  unint64_t v4 = [(VNRequestSpecifier *)self requestRevision];

  return +[VNClassRegistrar observationBoundsAreNormalizedToROIForRequestClassCode:v3 revision:v4];
}

- (BOOL)specifiesAnyRequestClassName:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRequestSpecifier *)self requestClassName];
  id v6 = v4;
  uint64_t v7 = v6;
  id v13 = (id *)&v14;
  if (v6)
  {
    BOOL v8 = v6;
    do
    {
      char v9 = [v5 isEqualToString:v8];
      if (v9) {
        break;
      }
      id v10 = v13++;
      id v11 = *v10;

      BOOL v8 = v11;
    }
    while (v11);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)specifiesRequestClassName:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRequestSpecifier *)self requestClassName];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)specifiesAnyRequestClass:(Class)a3
{
  id v4 = [(VNRequestSpecifier *)self requestClassAndReturnError:0];
  if (!v4) {
    return 0;
  }
  id v10 = (objc_class **)&v11;
  BOOL v5 = a3 != 0;
  if (v4 != a3 && a3)
  {
    do
    {
      char v6 = v10++;
      uint64_t v7 = *v6;
      BOOL v5 = *v6 != 0;
    }
    while (v7 != v4 && v7 != 0);
  }
  return v5;
}

- (BOOL)specifiesRequestClassName:(id)a3 withAnyRevision:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(VNRequestSpecifier *)self requestClassName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    unint64_t v9 = [(VNRequestSpecifier *)self requestRevision];
    v15 = &v16;
    BOOL v10 = a4 != 0;
    if (a4 && v9 != a4)
    {
      do
      {
        uint64_t v11 = v15++;
        uint64_t v12 = *v11;
        BOOL v10 = v12 != 0;
        if (v12) {
          BOOL v13 = v9 == v12;
        }
        else {
          BOOL v13 = 1;
        }
      }
      while (!v13);
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)specifiesRequestClass:(Class)a3 withAnyRevision:(unint64_t)a4
{
  uint64_t v7 = [(VNRequestSpecifier *)self requestClassAndReturnError:0];
  BOOL result = 0;
  if (v7)
  {
    if (v7 == a3)
    {
      unint64_t v9 = [(VNRequestSpecifier *)self requestRevision];
      BOOL v13 = &v14;
      BOOL result = a4 != 0;
      if (a4)
      {
        if (v9 != a4)
        {
          do
          {
            BOOL v10 = v13++;
            uint64_t v11 = *v10;
            BOOL result = v11 != 0;
            if (v11) {
              BOOL v12 = v9 == v11;
            }
            else {
              BOOL v12 = 1;
            }
          }
          while (!v12);
        }
      }
    }
  }
  return result;
}

- (BOOL)specifiesRequestClassName:(id)a3 revision:(unint64_t)a4
{
  id v6 = a3;
  if ([(VNRequestSpecifier *)self requestRevision] == a4)
  {
    uint64_t v7 = [(VNRequestSpecifier *)self requestClassName];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)specifiesRequestClass:(Class)a3 revision:(unint64_t)a4
{
  if ([(VNRequestSpecifier *)self requestRevision] != a4) {
    return 0;
  }
  id v6 = [(VNRequestSpecifier *)self requestClassAndReturnError:0];
  return v6 && v6 == a3;
}

- (NSArray)allModelEquivalents
{
  uint64_t v3 = +[VNRequestSpecifier _modelEquivalenciesRegistrar]();
  id v4 = [v3 equivalenciesForRequestSpecifier:self];

  return (NSArray *)v4;
}

+ (id)_modelEquivalenciesRegistrar
{
  self;
  if (_modelEquivalenciesRegistrar_onceToken != -1) {
    dispatch_once(&_modelEquivalenciesRegistrar_onceToken, &__block_literal_global_2746);
  }
  v0 = (void *)_modelEquivalenciesRegistrar_modelEquivalenciesRegistrar;

  return v0;
}

void __50__VNRequestSpecifier__modelEquivalenciesRegistrar__block_invoke()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = MEMORY[0x1A6257080]();
  v1 = objc_alloc_init(VNRequestSpecifierEquivalenciesRegistrar);
  v2 = (void *)_modelEquivalenciesRegistrar_modelEquivalenciesRegistrar;
  _modelEquivalenciesRegistrar_modelEquivalenciesRegistrar = (uint64_t)v1;

  context = (void *)v0;
  if (VNRequestClasses::onceToken != -1) {
    dispatch_once(&VNRequestClasses::onceToken, &__block_literal_global_118_38087);
  }
  id v3 = (id)VNRequestClasses::ourRequestClasses;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        char v9 = [v8 recordSpecifierModelEquivalenciesInRegistrar:_modelEquivalenciesRegistrar_modelEquivalenciesRegistrar error:&v21];
        id v10 = v21;
        if ((v9 & 1) == 0)
        {
          NSStringFromClass((Class)v8);
          id v11 = objc_claimAutoreleasedReturnValue();
          uint64_t v12 = [v11 UTF8String];
          id v13 = [v10 localizedDescription];
          [v13 UTF8String];
          VNValidatedLog(4, @"Failed to record model equivalencies for %s - %s", v14, v15, v16, v17, v18, v19, v12);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasModelEquivalencyToRequestSpecifier:(id)a3
{
  id v4 = a3;
  if ([(VNRequestSpecifier *)self isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = +[VNRequestSpecifier _modelEquivalenciesRegistrar]();
    char v5 = [v6 isRequestSpecifier:self equivalentToRequestSpecifier:v4];
  }
  return v5;
}

- (BOOL)representsSupportedRequestAndReturnError:(id *)a3
{
  Class v5 = -[VNRequestSpecifier requestClassAndReturnError:](self, "requestClassAndReturnError:");
  if (v5)
  {
    LOBYTE(v5) = [(objc_class *)v5 supportsAnyRevision:[(VNRequestSpecifier *)self requestRevision]];
    if (a3)
    {
      if ((v5 & 1) == 0)
      {
        id v6 = +[VNError errorForUnsupportedRequestSpecifier:self];
        LOBYTE(v5) = 0;
        *a3 = v6;
      }
    }
  }
  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)specifierForRequestClassName:(id)a3 revision:(unint64_t)a4 error:(id *)a5
{
  char v8 = (NSString *)a3;
  if (+[VNClassRegistrar validateRequestClassName:error:](VNClassRegistrar, "validateRequestClassName:error:", v8, a5)&& (unsigned int v13 = 0, +[VNClassRegistrar getClassCode:&v13 forClassName:v8 error:a5]))
  {
    id v9 = objc_alloc((Class)a1);
    Class v10 = NSClassFromString(v8);
    id v11 = (void *)[v9 initWithRequestClass:v10 name:v8 code:v13 revision:a4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)specifierForRequest:(id)a3
{
  id v4 = a3;
  Class v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  unsigned int v12 = 0;
  +[VNClassRegistrar getClassCode:&v12 forClassName:v6 error:0];
  id v7 = objc_alloc((Class)a1);
  uint64_t v8 = v12;
  uint64_t v9 = [v4 revision];

  Class v10 = (void *)[v7 initWithRequestClass:v5 name:v6 code:v8 revision:v9];

  return v10;
}

+ (id)allAvailableRequestClassNames
{
  if (allAvailableRequestClassNames_onceToken != -1) {
    dispatch_once(&allAvailableRequestClassNames_onceToken, &__block_literal_global_39);
  }
  v2 = (void *)allAvailableRequestClassNames_allAvailableRequestClassNames;

  return v2;
}

void __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E5B20118;
  id v5 = v0;
  id v1 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:v4];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)allAvailableRequestClassNames_allAvailableRequestClassNames;
  allAvailableRequestClassNames_allAvailableRequestClassNames = v2;
}

uint64_t __51__VNRequestSpecifier_allAvailableRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if ((a2 - 1) <= 1) {
    return [*(id *)(result + 32) addObject:a4];
  }
  return result;
}

+ (id)availablePrivateRequestClassNames
{
  if (availablePrivateRequestClassNames_onceToken != -1) {
    dispatch_once(&availablePrivateRequestClassNames_onceToken, &__block_literal_global_37);
  }
  uint64_t v2 = (void *)availablePrivateRequestClassNames_availablePrivateRequestClassNames;

  return v2;
}

void __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E5B20118;
  id v5 = v0;
  id v1 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:v4];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)availablePrivateRequestClassNames_availablePrivateRequestClassNames;
  availablePrivateRequestClassNames_availablePrivateRequestClassNames = v2;
}

uint64_t __55__VNRequestSpecifier_availablePrivateRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2) {
    return [*(id *)(result + 32) addObject:a4];
  }
  return result;
}

+ (id)availableRequestClassNames
{
  if (availableRequestClassNames_onceToken != -1) {
    dispatch_once(&availableRequestClassNames_onceToken, &__block_literal_global_33);
  }
  uint64_t v2 = (void *)availableRequestClassNames_availablePublicRequestClassNames;

  return v2;
}

void __48__VNRequestSpecifier_availableRequestClassNames__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__VNRequestSpecifier_availableRequestClassNames__block_invoke_2;
  v4[3] = &unk_1E5B20118;
  id v5 = v0;
  id v1 = v0;
  +[VNClassRegistrar enumerateEntriesUsingBlock:v4];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)availableRequestClassNames_availablePublicRequestClassNames;
  availableRequestClassNames_availablePublicRequestClassNames = v2;
}

uint64_t __48__VNRequestSpecifier_availableRequestClassNames__block_invoke_2(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) addObject:a4];
  }
  return result;
}

+ (id)specifierForRequestClassCode:(unsigned int *)a3 revision:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = +[VNClassRegistrar classNameForClassCode:a3 error:a5];
  Class v10 = v9;
  if (v9 && ((v11 = NSClassFromString(v9), (Class v12 = v11) == 0) || _validateRequestClass(v11, a5))) {
    unsigned int v13 = (void *)[objc_alloc((Class)a1) initWithRequestClass:v12 name:v10 code:a3 revision:a4];
  }
  else {
    unsigned int v13 = 0;
  }

  return v13;
}

@end