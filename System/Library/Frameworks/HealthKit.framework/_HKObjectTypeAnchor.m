@interface _HKObjectTypeAnchor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)anchors;
- (_HKObjectTypeAnchor)initWithAnchors:(id)a3 databaseIdentifier:(id)a4;
- (_HKObjectTypeAnchor)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKObjectTypeAnchor

- (_HKObjectTypeAnchor)initWithAnchors:(id)a3 databaseIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKObjectTypeAnchor;
  v8 = [(_HKObjectTypeAnchor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    databaseIdentifier = v8->_databaseIdentifier;
    v8->_databaseIdentifier = (NSUUID *)v9;

    uint64_t v11 = [v6 copy];
    anchors = v8->_anchors;
    v8->_anchors = (NSDictionary *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSUUID *)self->_databaseIdentifier isEqual:v4[1]])
  {
    anchors = self->_anchors;
    id v6 = [v4 anchors];
    BOOL v7 = [(NSDictionary *)anchors isEqualToDictionary:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_databaseIdentifier hash];
  return [(NSDictionary *)self->_anchors hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKObjectTypeAnchor)initWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dbi"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:3];
    v8 = objc_msgSend(v6, "setWithArray:", v7, v12, v13);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"anchors"];

    if (v9)
    {
      self = [(_HKObjectTypeAnchor *)self initWithAnchors:v9 databaseIdentifier:v5];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  databaseIdentifier = self->_databaseIdentifier;
  id v5 = a3;
  [v5 encodeObject:databaseIdentifier forKey:@"dbi"];
  [v5 encodeObject:self->_anchors forKey:@"anchors"];
}

- (NSDictionary)anchors
{
  return self->_anchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchors, 0);

  objc_storeStrong((id *)&self->_databaseIdentifier, 0);
}

@end