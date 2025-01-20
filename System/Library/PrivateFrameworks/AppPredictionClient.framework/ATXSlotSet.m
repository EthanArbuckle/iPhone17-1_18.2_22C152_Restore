@interface ATXSlotSet
+ (BOOL)supportsSecureCoding;
- (ATXSlotSet)initWithCoder:(id)a3;
- (ATXSlotSet)initWithOpaqueParameters;
- (ATXSlotSet)initWithOpaqueParametersUuid:(id)a3;
- (ATXSlotSet)initWithParameters:(id)a3;
- (ATXSlotSet)initWithParameters:(id)a3 uuid:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSlotSet:(id)a3;
- (NSSet)parameters;
- (NSUUID)uuid;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ATXSlotSet

- (ATXSlotSet)initWithParameters:(id)a3
{
  return [(ATXSlotSet *)self initWithParameters:a3 uuid:0];
}

- (ATXSlotSet)initWithParameters:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXSlotSet;
  v8 = [(ATXSlotSet *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_uuid, a4);
  }

  return v8;
}

- (ATXSlotSet)initWithOpaqueParameters
{
  return [(ATXSlotSet *)self initWithOpaqueParametersUuid:0];
}

- (ATXSlotSet)initWithOpaqueParametersUuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSlotSet;
  id v6 = [(ATXSlotSet *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ATXSlotSet)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"parameters"];

  if (v8) {
    objc_super v9 = [(ATXSlotSet *)self initWithParameters:v8];
  }
  else {
    objc_super v9 = [(ATXSlotSet *)self initWithOpaqueParameters];
  }
  v10 = v9;

  return v10;
}

- (unint64_t)hash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  LODWORD(v2) = self->_hash;
  if (!v2)
  {
    NSUInteger v4 = [(NSSet *)self->_parameters count];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_parameters;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v4 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hash", (void)v11);
        }
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    unint64_t v2 = v4 ^ HIDWORD(v4);
    if (v2 <= 1) {
      LODWORD(v2) = 1;
    }
    self->_hash = v2;
  }
  return v2;
}

- (BOOL)isEqualToSlotSet:(id)a3
{
  NSUInteger v4 = a3;
  unint64_t v5 = [(ATXSlotSet *)self hash];
  if (v5 == [v4 hash])
  {
    parameters = self->_parameters;
    uint64_t v7 = (NSSet *)v4[2];
    if (parameters == v7)
    {
      char v8 = 1;
    }
    else if (v7)
    {
      char v8 = -[NSSet isEqualToSet:](parameters, "isEqualToSet:");
    }
    else
    {
      objc_super v9 = objc_opt_new();
      char v8 = [(NSSet *)parameters isEqualToSet:v9];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXSlotSet *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSlotSet *)self isEqualToSlotSet:v5];

  return v6;
}

- (id)description
{
  unint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<ATXSlotSet: %@>", self->_parameters];

  return v2;
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

@end