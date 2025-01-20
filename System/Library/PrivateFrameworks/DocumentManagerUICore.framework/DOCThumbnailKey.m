@interface DOCThumbnailKey
- (BOOL)isEqual:(id)a3;
- (DOCNodeThumbnailIdentifier)primaryKey;
- (DOCThumbnailDescriptor)descriptor;
- (DOCThumbnailKey)initWithPrimaryKey:(id)a3 descriptor:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DOCThumbnailKey

- (unint64_t)hash
{
  uint64_t v3 = [(DOCNodeThumbnailIdentifier *)self->_primaryKey hash];
  return [(DOCThumbnailDescriptor *)self->_descriptor hash] + v3;
}

- (DOCThumbnailKey)initWithPrimaryKey:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCThumbnailKey;
  v9 = [(DOCThumbnailKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primaryKey, a3);
    objc_storeStrong((id *)&v10->_descriptor, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_primaryKey, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DOCThumbnailKey *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  if (![(DOCThumbnailKey *)v4 isMemberOfClass:objc_opt_class()]
    || (primaryKey = self->_primaryKey, primaryKey != v4->_primaryKey)
    && !-[DOCNodeThumbnailIdentifier isEqual:](primaryKey, "isEqual:"))
  {
    char v7 = 0;
    goto LABEL_9;
  }
  descriptor = self->_descriptor;
  if (descriptor == v4->_descriptor) {
LABEL_7:
  }
    char v7 = 1;
  else {
    char v7 = -[DOCThumbnailDescriptor isEqual:](descriptor, "isEqual:");
  }
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[DOCThumbnailKey allocWithZone:](DOCThumbnailKey, "allocWithZone:");
  v6 = [(DOCThumbnailKey *)self primaryKey];
  char v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(DOCThumbnailKey *)v5 initWithPrimaryKey:v7 descriptor:self->_descriptor];

  return v8;
}

- (DOCNodeThumbnailIdentifier)primaryKey
{
  return self->_primaryKey;
}

- (DOCThumbnailDescriptor)descriptor
{
  return self->_descriptor;
}

@end