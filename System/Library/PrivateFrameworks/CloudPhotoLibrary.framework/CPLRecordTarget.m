@interface CPLRecordTarget
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForTargetState:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldUploadToOtherRecord;
- (CPLRecordTarget)initWithCoder:(id)a3;
- (CPLRecordTarget)initWithScopedIdentifier:(id)a3;
- (CPLRecordTarget)initWithScopedIdentifier:(id)a3 otherScopedIdentifier:(id)a4 targetState:(int64_t)a5;
- (CPLScopedIdentifier)otherScopedIdentifier;
- (CPLScopedIdentifier)resourceScopedIdentifier;
- (CPLScopedIdentifier)scopedIdentifier;
- (NSArray)targetScopedIdentifiers;
- (NSString)simpleDescription;
- (id)description;
- (int64_t)targetState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLRecordTarget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
}

- (CPLScopedIdentifier)otherScopedIdentifier
{
  return self->_otherScopedIdentifier;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLRecordTarget *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_targetState == self->_targetState
      && [(CPLScopedIdentifier *)v4->_scopedIdentifier isEqual:self->_scopedIdentifier])
    {
      id v5 = v4->_otherScopedIdentifier;
      v6 = self->_otherScopedIdentifier;
      v7 = v6;
      BOOL v8 = v5 && v6 && ([v5 isEqual:v6] & 1) != 0 || ((unint64_t)v5 | (unint64_t)v7) == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)simpleDescription
{
  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    v4 = [(CPLScopedIdentifier *)otherScopedIdentifier identifier];
    id v5 = [(CPLScopedIdentifier *)self->_scopedIdentifier identifier];
    int v6 = [v4 isEqualToString:v5];

    id v7 = [NSString alloc];
    BOOL v8 = [(CPLScopedIdentifier *)self->_scopedIdentifier descriptionWithNoScopeIndex];
    v9 = self->_otherScopedIdentifier;
    if (v6) {
      [(CPLScopedIdentifier *)v9 scopeIdentifier];
    }
    else {
    v11 = [(CPLScopedIdentifier *)v9 descriptionWithNoScopeIndex];
    }
    v12 = +[CPLRecordTarget descriptionForTargetState:self->_targetState];
    v10 = (void *)[v7 initWithFormat:@"%@->%@ (%@)>", v8, v11, v12];
  }
  else
  {
    v10 = [(CPLScopedIdentifier *)self->_scopedIdentifier descriptionWithNoScopeIndex];
  }
  return (NSString *)v10;
}

- (id)description
{
  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    v4 = [(CPLScopedIdentifier *)otherScopedIdentifier identifier];
    id v5 = [(CPLScopedIdentifier *)self->_scopedIdentifier identifier];
    int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      uint64_t v7 = [(CPLScopedIdentifier *)self->_otherScopedIdentifier scopeIndex];
      id v8 = [NSString alloc];
      scopedIdentifier = self->_scopedIdentifier;
      v10 = [(CPLScopedIdentifier *)self->_otherScopedIdentifier scopeIdentifier];
      if (v7 < 1)
      {
        v18 = +[CPLRecordTarget descriptionForTargetState:self->_targetState];
        v13 = (void *)[v8 initWithFormat:@"<Target %@->%@ (%@)>", scopedIdentifier, v10, v18];
      }
      else
      {
        int64_t v11 = [(CPLScopedIdentifier *)self->_otherScopedIdentifier scopeIndex];
        v12 = +[CPLRecordTarget descriptionForTargetState:self->_targetState];
        v13 = (void *)[v8 initWithFormat:@"<Target %@->%@(%lu) (%@)>", scopedIdentifier, v10, v11, v12];
      }
    }
    else
    {
      id v14 = [NSString alloc];
      v15 = self->_otherScopedIdentifier;
      v16 = self->_scopedIdentifier;
      v17 = +[CPLRecordTarget descriptionForTargetState:self->_targetState];
      v13 = (void *)[v14 initWithFormat:@"<Target %@->%@ (%@)>", v16, v15, v17];
    }
  }
  else
  {
    v13 = (void *)[[NSString alloc] initWithFormat:@"<Target %@>", self->_scopedIdentifier];
  }
  return v13;
}

- (CPLScopedIdentifier)resourceScopedIdentifier
{
  uint64_t v2 = 8;
  if ((self->_targetState & 0xFFFFFFFFFFFFFFFELL) == 2) {
    uint64_t v2 = 24;
  }
  return (CPLScopedIdentifier *)*(id *)((char *)&self->super.isa + v2);
}

- (NSArray)targetScopedIdentifiers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  otherScopedIdentifier = self->_otherScopedIdentifier;
  if (otherScopedIdentifier)
  {
    scopedIdentifier = self->_scopedIdentifier;
    v10 = otherScopedIdentifier;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_scopedIdentifier = &scopedIdentifier;
    uint64_t v5 = 2;
  }
  else
  {
    id v8 = self->_scopedIdentifier;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_scopedIdentifier = &v8;
    uint64_t v5 = 1;
  }
  int v6 = objc_msgSend(v3, "arrayWithObjects:count:", p_scopedIdentifier, v5, v8, scopedIdentifier, v10, v11);
  return (NSArray *)v6;
}

- (BOOL)shouldUploadToOtherRecord
{
  return self->_targetState > 1uLL;
}

- (void)encodeWithCoder:(id)a3
{
  scopedIdentifier = self->_scopedIdentifier;
  id v5 = a3;
  [v5 encodeObject:scopedIdentifier forKey:@"i"];
  [v5 encodeObject:self->_otherScopedIdentifier forKey:@"o"];
  [v5 encodeInteger:self->_targetState forKey:@"t"];
}

- (CPLRecordTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
  int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"o"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"t"];

  id v8 = [(CPLRecordTarget *)self initWithScopedIdentifier:v5 otherScopedIdentifier:v6 targetState:v7];
  return v8;
}

- (CPLRecordTarget)initWithScopedIdentifier:(id)a3
{
  return [(CPLRecordTarget *)self initWithScopedIdentifier:a3 otherScopedIdentifier:0 targetState:1];
}

- (CPLRecordTarget)initWithScopedIdentifier:(id)a3 otherScopedIdentifier:(id)a4 targetState:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLRecordTarget;
  uint64_t v11 = [(CPLRecordTarget *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_scopedIdentifier, a3);
    v12->_targetState = a5;
    objc_storeStrong((id *)&v12->_otherScopedIdentifier, a4);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForTargetState:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", a3);
  }
  else {
    v3 = off_1E60A76B8[a3];
  }
  return v3;
}

@end