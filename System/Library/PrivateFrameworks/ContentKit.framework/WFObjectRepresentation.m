@interface WFObjectRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)object:(id)a3;
+ (id)object:(id)a3 named:(id)a4;
+ (id)objects:(id)a3;
+ (id)objects:(id)a3 named:(id)a4;
- (BOOL)isEncodable;
- (NSString)specifiedName;
- (NSString)wfName;
- (WFObjectRepresentation)initWithCoder:(id)a3;
- (WFObjectRepresentation)initWithObject:(id)a3 named:(id)a4;
- (WFObjectType)wfType;
- (id)copyWithName:(id)a3 zone:(_NSZone *)a4;
- (id)object;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFObjectRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objects:(id)a3 named:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__WFObjectRepresentation_objects_named___block_invoke;
  v10[3] = &unk_264285D68;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  v8 = objc_msgSend(a3, "if_map:", v10);

  return v8;
}

uint64_t __40__WFObjectRepresentation_objects_named___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) object:a2 named:*(void *)(a1 + 32)];
}

+ (id)objects:(id)a3
{
  return (id)[a1 objects:a3 named:0];
}

+ (id)object:(id)a3 named:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithObject:v7 named:v6];

  return v8;
}

+ (id)object:(id)a3
{
  return (id)[a1 object:a3 named:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_wfName, 0);
}

- (id)object
{
  return self->_object;
}

- (BOOL)isEncodable
{
  v2 = [(WFObjectRepresentation *)self object];
  if ([v2 conformsToProtocol:&unk_26C745770]
    && [(id)objc_opt_class() supportsSecureCoding])
  {
    uint64_t v3 = objc_opt_class();
    BOOL v4 = v3 != objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if ([(WFObjectRepresentation *)self isEncodable])
  {
    wfName = self->_wfName;
    if (wfName) {
      [v6 encodeObject:wfName forKey:@"wfName"];
    }
    v5 = [(WFObjectRepresentation *)self object];
    [v6 encodeObject:v5 forKey:@"object"];
  }
}

- (WFObjectRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 allowedClasses];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"object"];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wfName"];

  v8 = [(WFObjectRepresentation *)self initWithObject:v6 named:v7];
  return v8;
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  id v6 = a3;
  id v7 = (void *)[(id)objc_opt_class() allocWithZone:a4];
  v8 = [(WFObjectRepresentation *)self object];
  if (v6)
  {
    v9 = (void *)[v7 initWithObject:v8 named:v6];
  }
  else
  {
    v10 = [(WFObjectRepresentation *)self wfName];
    v9 = (void *)[v7 initWithObject:v8 named:v10];
  }
  return v9;
}

- (WFObjectType)wfType
{
  v2 = [(WFObjectRepresentation *)self object];
  uint64_t v3 = [v2 wfType];

  return (WFObjectType *)v3;
}

- (NSString)wfName
{
  wfName = self->_wfName;
  if (wfName)
  {
    uint64_t v3 = wfName;
  }
  else
  {
    id v4 = [(WFObjectRepresentation *)self object];
    uint64_t v3 = [v4 wfName];
  }
  return v3;
}

- (NSString)specifiedName
{
  return self->_wfName;
}

- (WFObjectRepresentation)initWithObject:(id)a3 named:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFObjectRepresentation.m", 28, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v10 = [(WFObjectRepresentation *)self init];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      id v9 = 0;
    }
    objc_storeStrong(&v10->_object, a3);
    uint64_t v11 = [v9 copy];
    wfName = v10->_wfName;
    v10->_wfName = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

@end