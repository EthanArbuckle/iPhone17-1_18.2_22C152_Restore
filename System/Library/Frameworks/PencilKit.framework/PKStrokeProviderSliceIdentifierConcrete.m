@interface PKStrokeProviderSliceIdentifierConcrete
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKStrokeProviderSliceIdentifierConcrete)initWithCoder:(id)a3;
- (PKStrokeProviderSliceIdentifierConcrete)initWithUUID:(id)a3 version:(_PKStrokeID *)a4 tStart:(double)a5 tEnd:(double)a6;
- (_PKStrokeID)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKStrokeProviderSliceIdentifierConcrete

- (PKStrokeProviderSliceIdentifierConcrete)initWithUUID:(id)a3 version:(_PKStrokeID *)a4 tStart:(double)a5 tEnd:(double)a6
{
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  result = [(PKStrokeProviderSliceIdentifier *)&v9 initWithUUID:a3 tStart:a5 tEnd:a6];
  uint64_t v8 = *(void *)&a4->replicaUUID[12];
  *(_OWORD *)&result->_version.clock = *(_OWORD *)&a4->clock;
  *(void *)&result->_version.replicaUUID[12] = v8;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (PKStrokeProviderSliceIdentifierConcrete *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    v10.receiver = self;
    v10.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
    if (![(PKStrokeProviderSliceIdentifier *)&v10 isEqual:v6]) {
      goto LABEL_10;
    }
    [(PKStrokeProviderSliceIdentifierConcrete *)self version];
    if (v6)
    {
      [(PKStrokeProviderSliceIdentifierConcrete *)v6 version];
      int v7 = v11[0];
    }
    else
    {
      int v7 = 0;
      v11[0] = 0;
      v11[1] = 0;
      uint64_t v12 = 0;
    }
    if (v13 == v7 && !uuid_compare(v14, (const unsigned __int8 *)v11 + 4)) {
      BOOL v8 = v15 == HIDWORD(v12);
    }
    else {
LABEL_10:
    }
      BOOL v8 = 0;
  }
  return v8;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  unint64_t v3 = [(PKStrokeProviderSliceIdentifier *)&v5 hash];
  return PKHashBytes((uint64_t)&self->_version, 24) ^ v3;
}

- (id)description
{
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:self->_version.replicaUUID];
  v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  int v7 = [(PKStrokeProviderSliceIdentifier *)self strokeUUID];
  BOOL v8 = objc_msgSend(v7, "PK_shortDescription");
  objc_super v9 = objc_msgSend(v3, "PK_shortDescription");
  uint64_t clock = self->_version.clock;
  subuint64_t clock = self->_version.subclock;
  [(PKStrokeProviderSliceIdentifier *)self tStart];
  uint64_t v13 = v12;
  [(PKStrokeProviderSliceIdentifier *)self tEnd];
  int v15 = [v4 stringWithFormat:@"<%@: %p id=%@ v=%@:%d.%d t=%0.2f->%0.2f>", v6, self, v8, v9, clock, subclock, v13, v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  [(PKStrokeProviderSliceIdentifier *)&v9 encodeWithCoder:v4];
  p_version = &self->_version;
  uint64_t clock = self->_version.clock;
  subuint64_t clock = self->_version.subclock;
  [v4 encodeInteger:clock forKey:@"versionClock"];
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:p_version->replicaUUID];
  [v4 encodeObject:v8 forKey:@"versionReplica"];
  [v4 encodeInteger:subclock forKey:@"versionSubclock"];
}

- (PKStrokeProviderSliceIdentifierConcrete)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKStrokeProviderSliceIdentifierConcrete;
  objc_super v5 = [(PKStrokeProviderSliceIdentifier *)&v10 initWithCoder:v4];
  if (v5)
  {
    unsigned int v6 = [v4 decodeIntegerForKey:@"versionClock"];
    int v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versionReplica"];
    unsigned int v8 = [v4 decodeIntegerForKey:@"versionSubclock"];
    v5->_version.uint64_t clock = v6;
    [v7 getUUIDBytes:v5->_version.replicaUUID];
    v5->_version.subuint64_t clock = v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PKStrokeID)version
{
  *retstr = *(_PKStrokeID *)((char *)self + 32);
  return self;
}

@end