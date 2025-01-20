@interface BBAttachments
+ (BOOL)supportsSecureCoding;
- (BBAttachments)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttachments:(id)a3;
- (NSCountedSet)additionalAttachments;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)primaryType;
- (unint64_t)hash;
- (unint64_t)numberOfAdditionalAttachments;
- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3;
- (void)addAttachmentOfType:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalAttachments:(id)a3;
- (void)setPrimaryType:(int64_t)a3;
@end

@implementation BBAttachments

- (void)addAttachmentOfType:(int64_t)a3
{
  additionalAttachments = self->_additionalAttachments;
  if (!additionalAttachments)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    v7 = self->_additionalAttachments;
    self->_additionalAttachments = v6;

    additionalAttachments = self->_additionalAttachments;
  }
  id v8 = [NSNumber numberWithInteger:a3];
  [(NSCountedSet *)additionalAttachments addObject:v8];
}

- (unint64_t)numberOfAdditionalAttachments
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  do
    v4 += [(BBAttachments *)self numberOfAdditionalAttachmentsOfType:v3++];
  while (v3 != 7);
  return v4;
}

- (unint64_t)numberOfAdditionalAttachmentsOfType:(int64_t)a3
{
  additionalAttachments = self->_additionalAttachments;
  unint64_t v4 = [NSNumber numberWithInteger:a3];
  unint64_t v5 = [(NSCountedSet *)additionalAttachments countForObject:v4];

  return v5;
}

- (unint64_t)hash
{
  int64_t v3 = [(BBAttachments *)self primaryType];
  unint64_t v4 = [(BBAttachments *)self additionalAttachments];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (BBAttachments *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(BBAttachments *)self isEqualToAttachments:v4];
  }

  return v5;
}

- (BOOL)isEqualToAttachments:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BBAttachments *)self primaryType];
  if (v5 == [v4 primaryType])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [(BBAttachments *)self numberOfAdditionalAttachmentsOfType:v6];
      BOOL v8 = v7 == [v4 numberOfAdditionalAttachmentsOfType:v6];
      if (!v8) {
        break;
      }
    }
    while (v6++ < 6);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPrimaryType:", -[BBAttachments primaryType](self, "primaryType"));
  unint64_t v6 = [(BBAttachments *)self additionalAttachments];
  unint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAdditionalAttachments:v7];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAttachments)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BBAttachments;
  int64_t v5 = [(BBAttachments *)&v11 init];
  if (v5)
  {
    -[BBAttachments setPrimaryType:](v5, "setPrimaryType:", [v4 decodeIntegerForKey:@"primaryType"]);
    unint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    unint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    BOOL v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"additionalAttachments"];
    [(BBAttachments *)v5 setAdditionalAttachments:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBAttachments primaryType](self, "primaryType"), @"primaryType");
  id v5 = [(BBAttachments *)self additionalAttachments];
  [v4 encodeObject:v5 forKey:@"additionalAttachments"];
}

- (int64_t)primaryType
{
  return self->primaryType;
}

- (void)setPrimaryType:(int64_t)a3
{
  self->primaryType = a3;
}

- (NSCountedSet)additionalAttachments
{
  return self->_additionalAttachments;
}

- (void)setAdditionalAttachments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end