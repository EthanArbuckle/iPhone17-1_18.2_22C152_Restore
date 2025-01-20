@interface HKPairedFeatureAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAttributes)companionAttributes;
- (HKFeatureAttributes)localAttributes;
- (HKFeatureAttributes)pairedAttributes;
- (HKFeatureAttributes)watchAttributes;
- (HKPairedFeatureAttributes)initWithCoder:(id)a3;
- (HKPairedFeatureAttributes)initWithLocalAttributes:(id)a3 pairedAttributes:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKPairedFeatureAttributes

- (HKPairedFeatureAttributes)initWithLocalAttributes:(id)a3 pairedAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPairedFeatureAttributes;
  v8 = [(HKPairedFeatureAttributes *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localAttributes = v8->_localAttributes;
    v8->_localAttributes = (HKFeatureAttributes *)v9;

    uint64_t v11 = [v7 copy];
    pairedAttributes = v8->_pairedAttributes;
    v8->_pairedAttributes = (HKFeatureAttributes *)v11;
  }
  return v8;
}

- (HKFeatureAttributes)companionAttributes
{
  v3 = +[_HKBehavior sharedBehavior];
  int v4 = [v3 isAppleWatch];
  uint64_t v5 = 8;
  if (v4) {
    uint64_t v5 = 16;
  }
  id v6 = (HKFeatureAttributes *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (HKFeatureAttributes)watchAttributes
{
  v3 = +[_HKBehavior sharedBehavior];
  int v4 = [v3 isAppleWatch];
  uint64_t v5 = 16;
  if (v4) {
    uint64_t v5 = 8;
  }
  id v6 = (HKFeatureAttributes *)*(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKPairedFeatureAttributes;
  if (![(HKPairedFeatureAttributes *)&v12 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_14;
    }
    id v6 = v4;
    localAttributes = self->_localAttributes;
    v8 = (HKFeatureAttributes *)v6[1];
    if (localAttributes != v8 && (!v8 || !-[HKFeatureAttributes isEqual:](localAttributes, "isEqual:"))) {
      goto LABEL_11;
    }
    pairedAttributes = self->_pairedAttributes;
    v10 = (HKFeatureAttributes *)v6[2];
    if (pairedAttributes == v10)
    {
      char v5 = 1;
      goto LABEL_13;
    }
    if (v10) {
      char v5 = -[HKFeatureAttributes isEqual:](pairedAttributes, "isEqual:");
    }
    else {
LABEL_11:
    }
      char v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKFeatureAttributes *)self->_localAttributes hash];
  return [(HKFeatureAttributes *)self->_pairedAttributes hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKPairedFeatureAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKPairedFeatureAttributes;
  char v5 = [(HKPairedFeatureAttributes *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localAttributes"];
    localAttributes = v5->_localAttributes;
    v5->_localAttributes = (HKFeatureAttributes *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedAttributes"];
    pairedAttributes = v5->_pairedAttributes;
    v5->_pairedAttributes = (HKFeatureAttributes *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localAttributes = self->_localAttributes;
  id v5 = a3;
  [v5 encodeObject:localAttributes forKey:@"localAttributes"];
  [v5 encodeObject:self->_pairedAttributes forKey:@"pairedAttributes"];
}

- (HKFeatureAttributes)localAttributes
{
  return self->_localAttributes;
}

- (HKFeatureAttributes)pairedAttributes
{
  return self->_pairedAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAttributes, 0);

  objc_storeStrong((id *)&self->_localAttributes, 0);
}

@end