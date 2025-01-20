@interface WFObjectType
+ (BOOL)supportsSecureCoding;
+ (WFObjectType)typeWithClass:(Class)a3;
+ (WFObjectType)typeWithClassName:(id)a3 frameworkName:(id)a4 location:(unint64_t)a5;
+ (id)typesWithClasses:(id)a3;
- (BOOL)conformsToClass:(Class)a3;
- (BOOL)conformsToType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClass:(Class)a3;
- (BOOL)isEqualToType:(id)a3;
- (Class)objectClass;
- (NSBundle)bundle;
- (NSString)className;
- (WFObjectType)initWithClassName:(id)a3 inBundle:(id)a4;
- (WFObjectType)initWithCoder:(id)a3;
- (WFObjectType)initWithObjectClass:(Class)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFObjectType

- (BOOL)isEqual:(id)a3
{
  return a3 == self || -[WFObjectType isEqualToType:](self, "isEqualToType:");
}

- (BOOL)isEqualToClass:(Class)a3
{
  v4 = NSStringFromClass(a3);
  v5 = [(WFObjectType *)self className];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)WFObjectType;
  unint64_t v3 = [(WFType *)&v7 hash];
  v4 = [(WFObjectType *)self className];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqualToType:(id)a3
{
  v4 = (WFObjectType *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(WFObjectType *)v4 className];
      char v6 = [(WFObjectType *)self className];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (NSString)className
{
  return self->_className;
}

+ (WFObjectType)typeWithClass:(Class)a3
{
  unint64_t v3 = (void *)[objc_alloc((Class)a1) initWithObjectClass:a3];
  return (WFObjectType *)v3;
}

- (WFObjectType)initWithObjectClass:(Class)a3
{
  if (!a3)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFObjectType.m", 81, @"Invalid parameter not satisfying: %@", @"objectClass" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFObjectType;
  unint64_t v5 = [(WFObjectType *)&v13 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_objectClass, a3);
    uint64_t v7 = NSStringFromClass(a3);
    className = v6->_className;
    v6->_className = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_objectClass, 0);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(WFObjectType *)self className];
  [v4 encodeObject:v5 forKey:@"className"];

  id v7 = [(WFObjectType *)self bundle];
  char v6 = [v7 bundlePath];
  [v4 encodeObject:v6 forKey:@"bundlePath"];
}

- (WFObjectType)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"className"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];

  if (v6)
  {
    id v7 = [MEMORY[0x263F086E0] bundleWithPath:v6];
    if (v7)
    {
      self = [(WFObjectType *)self initWithClassName:v5 inBundle:v7];

      id v7 = self;
    }
  }
  else
  {
    Class v8 = NSClassFromString(v5);
    if (v8)
    {
      self = [(WFObjectType *)self initWithObjectClass:v8];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (Class)objectClass
{
  Class objectClass = self->_objectClass;
  if (!objectClass)
  {
    unint64_t v5 = [(WFObjectType *)self bundle];
    id v16 = 0;
    char v6 = [v5 loadAndReturnError:&v16];
    id v7 = v16;
    if (v6)
    {
      Class v8 = [(WFObjectType *)self className];
      NSClassFromString(v8);
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
      Class v10 = self->_objectClass;
      self->_Class objectClass = v9;

      Class v11 = self->_objectClass;
      if (v11)
      {
        unint64_t v3 = v11;

        goto LABEL_6;
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Unable to load bundle %@: %@", v5, v7 format];
      __break(1u);
    }
    objc_super v13 = (void *)MEMORY[0x263EFF940];
    uint64_t v14 = *MEMORY[0x263EFF498];
    v15 = [(WFObjectType *)self className];
    [v13 raise:v14, @"Unable to load object class named %@ from bundle: %@", v15, v5 format];

    __break(1u);
    return result;
  }
  unint64_t v3 = objectClass;
LABEL_6:
  return v3;
}

- (BOOL)conformsToClass:(Class)a3
{
  id v4 = [(WFObjectType *)self objectClass];
  return [(objc_class *)v4 isSubclassOfClass:a3];
}

- (BOOL)conformsToType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v4 className];
    char v6 = [(WFObjectType *)self objectClass];
    do
    {
      id v7 = NSStringFromClass(v6);
      char v8 = [v7 isEqualToString:v5];

      if (v8) {
        break;
      }
      char v6 = (objc_class *)[(objc_class *)v6 superclass];
    }
    while (v6);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (WFObjectType)initWithClassName:(id)a3 inBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFObjectType.m", 68, @"Invalid parameter not satisfying: %@", @"className" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFObjectType.m", 69, @"Invalid parameter not satisfying: %@", @"bundle" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFObjectType;
  Class v10 = [(WFObjectType *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    className = v10->_className;
    v10->_className = (NSString *)v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    objc_super v13 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (WFObjectType)typeWithClassName:(id)a3 frameworkName:(id)a4 location:(unint64_t)a5
{
  id v8 = a4;
  v9 = (objc_class *)NSURL;
  id v10 = a3;
  uint64_t v11 = (void *)[[v9 alloc] initFileURLWithPath:@"/" isDirectory:1];
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2 && _CFMZEnabled())
  {
    uint64_t v12 = [v11 URLByAppendingPathComponent:@"/System/iOSSupport/" isDirectory:1];

    uint64_t v11 = (void *)v12;
  }
  objc_super v13 = [v11 URLByAppendingPathComponent:@"/System/Library/" isDirectory:1];

  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    uint64_t v14 = @"PrivateFrameworks";
  }
  else
  {
    if ((a5 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      goto LABEL_9;
    }
    uint64_t v14 = @"Frameworks";
  }
  uint64_t v15 = [v13 URLByAppendingPathComponent:v14 isDirectory:1];

  objc_super v13 = (void *)v15;
LABEL_9:
  id v16 = [NSString stringWithFormat:@"%@.framework", v8];
  objc_super v17 = [v13 URLByAppendingPathComponent:v16 isDirectory:1];

  v18 = [MEMORY[0x263F086E0] bundleWithURL:v17];
  v19 = (void *)[objc_alloc((Class)a1) initWithClassName:v10 inBundle:v18];

  return (WFObjectType *)v19;
}

+ (id)typesWithClasses:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFObjectType.m", 37, @"Invalid parameter not satisfying: %@", @"objectClasses" object file lineNumber description];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__WFObjectType_typesWithClasses___block_invoke;
  v9[3] = &__block_descriptor_40_e25___WFObjectType_24__0_8Q16l;
  v9[4] = a1;
  char v6 = objc_msgSend(v5, "if_map:", v9);

  return v6;
}

id __33__WFObjectType_typesWithClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[objc_alloc(*(Class *)(a1 + 32)) initWithObjectClass:a2];
  return v2;
}

@end