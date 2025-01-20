@interface LNArrayValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)objectIsMemberOfType:(id)a3;
- (Class)objectClass;
- (LNArrayValueType)initWithCoder:(id)a3;
- (LNArrayValueType)initWithMemberValueType:(id)a3;
- (LNArrayValueType)initWithMemberValueType:(id)a3 capabilities:(int64_t)a4;
- (LNValueType)memberValueType;
- (id)description;
- (int64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5;
@end

@implementation LNArrayValueType

- (LNArrayValueType)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memberValueType"];
  if (v5)
  {
    self = -[LNArrayValueType initWithMemberValueType:capabilities:](self, "initWithMemberValueType:capabilities:", v5, [v4 decodeIntegerForKey:@"capabilities"]);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNArrayValueType)initWithMemberValueType:(id)a3 capabilities:(int64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNArrayValueType.m", 25, @"Invalid parameter not satisfying: %@", @"![memberValueType isKindOfClass:[LN_TYPE(ArrayValueType) class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNArrayValueType;
  v8 = [(LNValueType *)&v14 _init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    memberValueType = v8->_memberValueType;
    v8->_memberValueType = (LNValueType *)v9;

    v8->_capabilities = a4;
    v11 = v8;
  }

  return v8;
}

- (LNArrayValueType)initWithMemberValueType:(id)a3
{
  return [(LNArrayValueType *)self initWithMemberValueType:a3 capabilities:3];
}

- (BOOL)objectIsMemberOfType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LOBYTE(v12) = 0;
            goto LABEL_16;
          }
          v11 = [(LNArrayValueType *)self memberValueType];
          int v12 = [v11 valueIsKindOfType:v10];

          if (!v12) {
            goto LABEL_16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(v12) = 1;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v12) = 1;
    }
LABEL_16:
  }
  else
  {

    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(LNArrayValueType *)self memberValueType];
  [v5 encodeObject:v4 forKey:@"memberValueType"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNArrayValueType capabilities](self, "capabilities"), @"capabilities");
}

- (LNValueType)memberValueType
{
  return self->_memberValueType;
}

- (int64_t)capabilities
{
  return self->_capabilities;
}

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "arrayWithObjects:", v3, objc_opt_class(), 0);
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNArrayValueType *)a3;
  id v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v7 = [(LNArrayValueType *)self memberValueType];
    uint64_t v8 = [(LNArrayValueType *)v6 memberValueType];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        BOOL v13 = 0;
        goto LABEL_15;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_14;
      }
    }
    int64_t v14 = [(LNArrayValueType *)self capabilities];
    BOOL v13 = v14 == [(LNArrayValueType *)v6 capabilities];
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(LNArrayValueType *)self memberValueType];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(LNArrayValueType *)self capabilities] ^ v4;

  return v5;
}

- (id)description
{
  if ([(LNArrayValueType *)self capabilities] == 3)
  {
    uint64_t v3 = @"Array";
  }
  else if ([(LNArrayValueType *)self capabilities] == 2)
  {
    uint64_t v3 = @"OrderedSet";
  }
  else
  {
    uint64_t v3 = @"Set";
  }
  uint64_t v4 = NSString;
  unint64_t v5 = [(LNArrayValueType *)self memberValueType];
  uint64_t v6 = [v4 stringWithFormat:@"%@<%@>", v3, v5];

  return v6;
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(LNArrayValueType *)self memberValueType];
  int v12 = [v8 isEqual:v11];

  if (v12)
  {
    id v13 = [v9 value];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = v13;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              uint64_t v19 = objc_msgSend(v18, "valueType", (void)v20);
              [v19 enumerateValuesOfValueType:v8 value:v18 block:v10];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v15);
        }
      }
    }
  }
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end