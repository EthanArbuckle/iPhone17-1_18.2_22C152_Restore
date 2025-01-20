@interface BWMetadataObjectFormat
+ (id)formatWithMetadataIdentifiers:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (unsigned)mediaType;
- (void)dealloc;
@end

@implementation BWMetadataObjectFormat

+ (id)formatWithMetadataIdentifiers:(id)a3
{
  v4 = [BWMetadataObjectFormat alloc];
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)BWMetadataObjectFormat;
    v5 = objc_msgSendSuper2(&v7, sel_init);
    if (v5) {
      v5[1] = [a3 copy];
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  metadataIdentifiers = self->_metadataIdentifiers;
  uint64_t v6 = *((void *)a3 + 1);
  return [(NSArray *)metadataIdentifiers isEqualToArray:v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetadataObjectFormat;
  [(BWMetadataObjectFormat *)&v3 dealloc];
}

+ (void)initialize
{
}

- (unsigned)mediaType
{
  return 1835365473;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_metadataIdentifiers hash];
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"MetadataIdentifiers: "];
  int v4 = [(NSArray *)self->_metadataIdentifiers count];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4 - 1;
    uint64_t v7 = v4;
    do
    {
      objc_msgSend(v3, "appendString:", -[NSArray objectAtIndexedSubscript:](self->_metadataIdentifiers, "objectAtIndexedSubscript:", v5));
      if (v5 < v6) {
        [v3 appendString:@", "];
      }
      ++v5;
    }
    while (v7 != v5);
  }
  return v3;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWMetadataObjectFormat description](self, "description")];
}

@end