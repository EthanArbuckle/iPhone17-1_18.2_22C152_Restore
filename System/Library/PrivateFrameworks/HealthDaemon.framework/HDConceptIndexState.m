@interface HDConceptIndexState
+ (BOOL)supportsSecureCoding;
+ (id)stateWithGeneration:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HDConceptIndexState)init;
- (HDConceptIndexState)initWithCoder:(id)a3;
- (HDConceptIndexState)initWithGeneration:(int64_t)a3 anchor:(id)a4;
- (HKQueryAnchor)anchor;
- (id)copyWithAnchor:(id)a3;
- (int64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDConceptIndexState

- (HDConceptIndexState)init
{
  return [(HDConceptIndexState *)self initWithGeneration:0 anchor:0];
}

+ (id)stateWithGeneration:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithGeneration:a3 anchor:0];

  return v3;
}

- (HDConceptIndexState)initWithGeneration:(int64_t)a3 anchor:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDConceptIndexState;
  v7 = [(HDConceptIndexState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_generation = a3;
    uint64_t v9 = [v6 copy];
    anchor = v8->_anchor;
    v8->_anchor = (HKQueryAnchor *)v9;
  }
  return v8;
}

- (id)copyWithAnchor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGeneration:self->_generation anchor:v4];

  return v5;
}

- (unint64_t)hash
{
  int64_t generation = self->_generation;
  return [(HKQueryAnchor *)self->_anchor hash] ^ generation;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDConceptIndexState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v8 = 0;
      if (self->_generation == v5->_generation)
      {
        anchor = self->_anchor;
        v7 = v5->_anchor;
        if (anchor == v7 || v7 && -[HKQueryAnchor isEqual:](anchor, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDConceptIndexState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDConceptIndexState;
  v5 = [(HDConceptIndexState *)&v9 init];
  if (v5)
  {
    v5->_int64_t generation = [v4 decodeIntegerForKey:@"Generation"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Anchor"];
    anchor = v5->_anchor;
    v5->_anchor = (HKQueryAnchor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t generation = self->_generation;
  id v5 = a3;
  [v5 encodeInteger:generation forKey:@"Generation"];
  [v5 encodeObject:self->_anchor forKey:@"Anchor"];
}

- (int64_t)generation
{
  return self->_generation;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
}

@end