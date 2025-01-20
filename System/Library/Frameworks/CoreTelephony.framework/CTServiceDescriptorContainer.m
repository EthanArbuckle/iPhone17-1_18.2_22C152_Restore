@interface CTServiceDescriptorContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTServiceDescriptorContainer)initWithCoder:(id)a3;
- (CTServiceDescriptorContainer)initWithDescriptors:(id)a3;
- (NSArray)descriptors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptors:(id)a3;
@end

@implementation CTServiceDescriptorContainer

- (CTServiceDescriptorContainer)initWithDescriptors:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTServiceDescriptorContainer;
  v6 = [(CTServiceDescriptorContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptors, a3);
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTServiceDescriptorContainer *)self descriptors];
  [v3 appendFormat:@" descriptors=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTServiceDescriptorContainer *)a3;
  if (v4 == self) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CTServiceDescriptorContainer *)self descriptors];
    if (v5)
    {

LABEL_7:
      v8 = [(CTServiceDescriptorContainer *)self descriptors];
      objc_super v9 = [(CTServiceDescriptorContainer *)v4 descriptors];
      char v6 = [v8 isEqualToArray:v9];

      goto LABEL_9;
    }
    v7 = [(CTServiceDescriptorContainer *)v4 descriptors];

    if (v7) {
      goto LABEL_7;
    }
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }
  char v6 = 0;
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)[(NSArray *)self->_descriptors copy];
  [v4 setDescriptors:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTServiceDescriptorContainer)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTServiceDescriptorContainer;
  id v5 = [(CTServiceDescriptorContainer *)&v12 init];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"descriptors"];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end