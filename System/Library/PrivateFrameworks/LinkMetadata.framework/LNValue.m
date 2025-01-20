@interface LNValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDisplayRepresentation)displayRepresentation;
- (LNExportedContent)exportedContent;
- (LNValue)initWithCoder:(id)a3;
- (LNValue)initWithValue:(id)a3 valueType:(id)a4;
- (LNValue)initWithValue:(id)a3 valueType:(id)a4 displayRepresentation:(id)a5;
- (LNValue)initWithValue:(id)a3 valueType:(id)a4 exportedContent:(id)a5 displayRepresentation:(id)a6;
- (LNValue)initWithValues:(id)a3 memberValueType:(id)a4;
- (LNValueType)valueType;
- (id)description;
- (id)value;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayRepresentation:(id)a3;
- (void)setExportedContent:(id)a3;
@end

@implementation LNValue

- (void)setDisplayRepresentation:(id)a3
{
}

- (LNValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueType"];
  if (v5)
  {
    v6 = LNValueTypeObjectClassesForCoding();
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"value"];

    if (v7)
    {
      v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2050000000;
      v9 = (void *)getLNExportedContentClass_softClass;
      uint64_t v18 = getLNExportedContentClass_softClass;
      if (!getLNExportedContentClass_softClass)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __getLNExportedContentClass_block_invoke;
        v14[3] = &unk_1E590DCB8;
        v14[4] = &v15;
        __getLNExportedContentClass_block_invoke((uint64_t)v14);
        v9 = (void *)v16[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v15, 8);
      v11 = [v4 decodeObjectOfClass:v10 forKey:@"exportedContent"];
      self = [(LNValue *)self initWithValue:v7 valueType:v5 exportedContent:v11 displayRepresentation:v8];

      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4 exportedContent:(id)a5 displayRepresentation:(id)a6
{
  id v11 = a5;
  v12 = [(LNValue *)self initWithValue:a3 valueType:a4 displayRepresentation:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_exportedContent, a5);
    v14 = v13;
  }

  return v13;
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4 displayRepresentation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNValue.m", 35, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_13:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"LNValue.m", 36, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_13;
  }
LABEL_3:
  if (([v10 objectIsMemberOfType:v9] & 1) == 0
    && ([v10 objectIsMemberOfType:v9] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [v10 description];
    [v23 handleFailureInMethod:a2, self, @"LNValue.m", 39, @"Value %@ is not member of type %@", v9, v24 object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)LNValue;
  v12 = [(LNValue *)&v25 init];
  if (v12)
  {
    if (objc_opt_respondsToSelector()) {
      id v13 = (id)[v9 copy];
    }
    else {
      id v13 = v9;
    }
    id value = v12->_value;
    v12->_id value = v13;

    uint64_t v15 = [v10 copy];
    valueType = v12->_valueType;
    v12->_valueType = (LNValueType *)v15;

    uint64_t v17 = [v11 copy];
    displayRepresentation = v12->_displayRepresentation;
    v12->_displayRepresentation = (LNDisplayRepresentation *)v17;

    v19 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNValue *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  v6 = [(LNValue *)self valueType];
  [v4 encodeObject:v6 forKey:@"valueType"];

  v7 = [(LNValue *)self displayRepresentation];
  [v4 encodeObject:v7 forKey:@"displayRepresentation"];

  id v8 = [(LNValue *)self exportedContent];
  [v4 encodeObject:v8 forKey:@"exportedContent"];
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (id)value
{
  return self->_value;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (LNExportedContent)exportedContent
{
  return self->_exportedContent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedContent, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (LNValue)initWithValues:(id)a3 memberValueType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[LNArrayValueType alloc] initWithMemberValueType:v6];

  id v9 = [(LNValue *)self initWithValue:v7 valueType:v8 displayRepresentation:0];
  return v9;
}

- (void)setExportedContent:(id)a3
{
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(LNValue *)self value];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 value];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
    {
      int64_t v9 = 0;
      goto LABEL_7;
    }
    v5 = [(LNValue *)self value];
    id v8 = [v4 value];
    int64_t v9 = [v5 compare:v8];
  }
  else
  {
    int64_t v9 = 0;
  }

LABEL_7:
  return v9;
}

- (unint64_t)hash
{
  v3 = [(LNValue *)self valueType];
  uint64_t v4 = [v3 hash];
  v5 = [(LNValue *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNValue *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v7 = [(LNValue *)self valueType];
      id v8 = [(LNValue *)v6 valueType];
      if ([v7 isEqual:v8])
      {
        int64_t v9 = [(LNValue *)self value];
        id v10 = [(LNValue *)v6 value];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(LNValue *)self valueType];
  v5 = [(LNValue *)self value];
  unint64_t v6 = [v3 stringWithFormat:@"(%@) %@", v4, v5];

  return v6;
}

- (LNValue)initWithValue:(id)a3 valueType:(id)a4
{
  return [(LNValue *)self initWithValue:a3 valueType:a4 displayRepresentation:0];
}

@end