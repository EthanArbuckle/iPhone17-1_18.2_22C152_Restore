@interface LNAsyncSequenceValueType
+ (BOOL)supportsSecureCoding;
+ (id)objectClassesForCoding;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNAsyncSequenceValueType)initWithCoder:(id)a3;
- (LNAsyncSequenceValueType)initWithMemberValueType:(id)a3 capabilities:(int64_t)a4;
- (LNValueType)memberValueType;
- (id)description;
- (int64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAsyncSequenceValueType

+ (id)objectClassesForCoding
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", objc_opt_class(), 0);
}

- (void).cxx_destruct
{
}

- (LNValueType)memberValueType
{
  return self->_memberValueType;
}

- (int64_t)capabilities
{
  return self->_capabilities;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAsyncSequenceValueType *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [(LNAsyncSequenceValueType *)self memberValueType];
    v8 = [(LNAsyncSequenceValueType *)v6 memberValueType];
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
    int64_t v14 = [(LNAsyncSequenceValueType *)self capabilities];
    BOOL v13 = v14 == [(LNAsyncSequenceValueType *)v6 capabilities];
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(LNAsyncSequenceValueType *)self memberValueType];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(LNAsyncSequenceValueType *)self capabilities] ^ v4;

  return v5;
}

- (id)description
{
  v2 = NSString;
  v3 = [(LNAsyncSequenceValueType *)self memberValueType];
  uint64_t v4 = [v2 stringWithFormat:@"AsyncSequence<%@>", v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAsyncSequenceValueType capabilities](self, "capabilities"), @"capabilities");
  id v5 = [(LNAsyncSequenceValueType *)self memberValueType];
  [v4 encodeObject:v5 forKey:@"memberValueType"];
}

- (LNAsyncSequenceValueType)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"capabilities"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memberValueType"];

  if (v6)
  {
    self = [(LNAsyncSequenceValueType *)self initWithMemberValueType:v6 capabilities:v5];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (LNAsyncSequenceValueType)initWithMemberValueType:(id)a3 capabilities:(int64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"LNAsyncSequenceValueType.m", 21, @"Invalid parameter not satisfying: %@", @"![memberValueType isKindOfClass:[LN_TYPE(ArrayValueType) class]]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)LNAsyncSequenceValueType;
  v8 = [(LNValueType *)&v15 _init];
  id v9 = v8;
  if (v8)
  {
    v8->_capabilities = a4;
    uint64_t v10 = [v7 copy];
    memberValueType = v9->_memberValueType;
    v9->_memberValueType = (LNValueType *)v10;

    int v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end