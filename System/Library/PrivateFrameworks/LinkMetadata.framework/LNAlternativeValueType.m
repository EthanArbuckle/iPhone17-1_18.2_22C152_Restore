@interface LNAlternativeValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)objectIsMemberOfType:(id)a3;
- (BOOL)valueIsKindOfType:(id)a3;
- (Class)objectClass;
- (LNAlternativeValueType)initWithCoder:(id)a3;
- (LNAlternativeValueType)initWithMemberValueTypes:(id)a3;
- (NSArray)memberValueTypes;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5;
@end

@implementation LNAlternativeValueType

+ (id)objectClassesForCoding
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "arrayWithObjects:", v3, objc_opt_class(), 0);
}

- (void).cxx_destruct
{
}

- (NSArray)memberValueTypes
{
  return self->_memberValueTypes;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (LNAlternativeValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v7 = [(LNAlternativeValueType *)v6 memberValueTypes];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            v13 = [(LNAlternativeValueType *)self memberValueTypes];
            LODWORD(v12) = [v13 containsObject:v12];

            if (!v12)
            {
              BOOL v14 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      BOOL v14 = 1;
LABEL_16:
    }
    else
    {

      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v2 = [(LNAlternativeValueType *)self memberValueTypes];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(LNAlternativeValueType *)self memberValueTypes];
  v4 = [v3 componentsJoinedByString:@" | "];
  v5 = [v2 stringWithFormat:@"(%@)", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNAlternativeValueType *)self memberValueTypes];
  [v4 encodeObject:v5 forKey:@"memberValueTypes"];
}

- (LNAlternativeValueType)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"memberValueTypes"];

  if (v8)
  {
    self = [(LNAlternativeValueType *)self initWithMemberValueTypes:v8];
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)enumerateValuesOfValueType:(id)a3 value:(id)a4 block:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(LNAlternativeValueType *)self memberValueTypes];
  int v11 = [v10 containsObject:v13];

  if (v11)
  {
    uint64_t v12 = [v8 valueType];
    [v12 enumerateValuesOfValueType:v13 value:v8 block:v9];
  }
}

- (BOOL)valueIsKindOfType:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(LNAlternativeValueType *)self memberValueTypes];
  uint64_t v6 = [v4 valueType];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (BOOL)objectIsMemberOfType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(LNAlternativeValueType *)self memberValueTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) objectIsMemberOfType:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (LNAlternativeValueType)initWithMemberValueTypes:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNAlternativeValueType;
  id v5 = [(LNValueType *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    memberValueTypes = v5->_memberValueTypes;
    v5->_memberValueTypes = (NSArray *)v6;

    id v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end