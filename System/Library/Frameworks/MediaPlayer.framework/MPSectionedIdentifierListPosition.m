@interface MPSectionedIdentifierListPosition
+ (BOOL)supportsSecureCoding;
+ (id)positionForHeadOfSection:(id)a3;
+ (id)positionForItem:(id)a3 inSection:(id)a4;
+ (id)positionForTailOfSection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPSectionedIdentifierListPosition)initWithCoder:(id)a3;
- (NSString)itemIdentifier;
- (NSString)sectionIdentifier;
- (id)_init;
- (id)description;
- (int64_t)entryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPSectionedIdentifierListPosition

+ (id)positionForItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[MPSectionedIdentifierListPosition alloc] _init];
  v7[3] = 3;
  v8 = (void *)v7[1];
  v7[1] = v6;
  id v9 = v6;

  v10 = (void *)v7[2];
  v7[2] = v5;

  return v7;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPSectionedIdentifierListPosition;
  return [(MPSectionedIdentifierListPosition *)&v3 init];
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPSectionedIdentifierListPosition *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = v5;
      if (self->_entryType == v5->_entryType)
      {
        sectionIdentifier = self->_sectionIdentifier;
        v8 = v5->_sectionIdentifier;
        if (sectionIdentifier == v8)
        {
        }
        else
        {
          id v9 = v8;
          v10 = sectionIdentifier;
          int v11 = [(NSString *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_6;
          }
        }
        itemIdentifier = self->_itemIdentifier;
        v14 = v6->_itemIdentifier;
        v15 = itemIdentifier;
        v16 = v15;
        if (v15 == v14) {
          char v12 = 1;
        }
        else {
          char v12 = [(NSString *)v15 isEqual:v14];
        }

        goto LABEL_14;
      }
LABEL_6:
      char v12 = 0;
LABEL_14:

      goto LABEL_15;
    }
    char v12 = 0;
  }
LABEL_15:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t entryType = self->_entryType;
  id v5 = a3;
  [v5 encodeInteger:entryType forKey:@"t"];
  [v5 encodeObject:self->_sectionIdentifier forKey:@"sid"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"iid"];
}

- (MPSectionedIdentifierListPosition)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPSectionedIdentifierListPosition;
  id v5 = [(MPSectionedIdentifierListPosition *)&v11 init];
  if (v5)
  {
    v5->_int64_t entryType = [v4 decodeIntegerForKey:@"t"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iid"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v8;
  }
  return v5;
}

- (unint64_t)hash
{
  int64_t entryType = self->_entryType;
  NSUInteger v4 = [(NSString *)self->_sectionIdentifier hash] ^ entryType;
  return v4 ^ [(NSString *)self->_itemIdentifier hash];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> ", objc_opt_class(), self];
  NSUInteger v4 = v3;
  int64_t entryType = self->_entryType;
  switch(entryType)
  {
    case 2:
      [v3 appendFormat:@"Head: %@", self->_sectionIdentifier, v8];
      break;
    case 4:
      [v3 appendFormat:@"Tail: %@", self->_sectionIdentifier, v8];
      break;
    case 3:
      [v3 appendFormat:@"Item: %@ - %@", self->_sectionIdentifier, self->_itemIdentifier];
      break;
  }
  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)positionForTailOfSection:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = [[MPSectionedIdentifierListPosition alloc] _init];
  v4[3] = 4;
  id v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)positionForHeadOfSection:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = [[MPSectionedIdentifierListPosition alloc] _init];
  v4[3] = 2;
  id v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

@end