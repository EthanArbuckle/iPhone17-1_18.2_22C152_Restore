@interface CTXPCMessage
+ (BOOL)isSensitiveMessage;
+ (BOOL)supportsSecureCoding;
+ (NSSet)allowedClassesForArguments;
- (BOOL)isEqual:(id)a3;
- (CTXPCMessage)init;
- (CTXPCMessage)initWithCoder:(id)a3;
- (CTXPCMessage)initWithNamedArguments:(id)a3;
- (NSDictionary)namedArguments;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setNamedArguments:(id)a3;
@end

@implementation CTXPCMessage

- (void).cxx_destruct
{
}

+ (BOOL)isSensitiveMessage
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTXPCMessage)initWithNamedArguments:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCMessage;
  v6 = [(CTXPCMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_namedArguments, a3);
  }

  return v7;
}

- (CTXPCMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() allowedClassesForArguments];
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"namedArguments"];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)CTXPCMessage;
    v7 = [(CTXPCMessage *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_namedArguments, v6);
    }
    self = v8;
    objc_super v9 = self;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (NSSet)allowedClassesForArguments
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

void __27__CTXPCMessage_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKey:");
  if (a3) {
    v6 = @", %@=%@";
  }
  else {
    v6 = @" %@=%@";
  }
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", v6, v7, v5);
}

- (NSDictionary)namedArguments
{
  return self->_namedArguments;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(NSDictionary *)self->_namedArguments allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__CTXPCMessage_description__block_invoke;
  v10[3] = &unk_1E5267A60;
  v10[4] = self;
  id v6 = v3;
  id v11 = v6;
  [v5 enumerateObjectsUsingBlock:v10];
  [v6 appendString:@">"];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (CTXPCMessage)init
{
  return [(CTXPCMessage *)self initWithNamedArguments:MEMORY[0x1E4F1CC08]];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTXPCMessage *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      namedArguments = self->_namedArguments;
      id v6 = [(CTXPCMessage *)v4 namedArguments];
      char v7 = [(NSDictionary *)namedArguments isEqualToDictionary:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)setNamedArguments:(id)a3
{
}

@end