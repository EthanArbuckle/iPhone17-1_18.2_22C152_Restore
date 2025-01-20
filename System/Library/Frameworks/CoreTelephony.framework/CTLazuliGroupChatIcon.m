@interface CTLazuliGroupChatIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliGroupChatIcon:(id)a3;
- (CTLazuliGroupChatIcon)initWithCoder:(id)a3;
- (CTLazuliGroupChatIcon)initWithReflection:(const void *)a3;
- (NSData)data;
- (NSString)name;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CTLazuliGroupChatIcon

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliGroupChatIcon *)self name];
  [v3 appendFormat:@", name = %@", v4];

  v5 = [(CTLazuliGroupChatIcon *)self data];
  [v3 appendFormat:@", data = %@", v5];

  v6 = [(CTLazuliGroupChatIcon *)self type];
  [v3 appendFormat:@", type = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliGroupChatIcon:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliGroupChatIcon *)self name];
  v6 = [v4 name];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliGroupChatIcon *)self data];
    v8 = [v4 data];
    if ([v7 isEqualToData:v8])
    {
      v9 = [(CTLazuliGroupChatIcon *)self type];
      v10 = [v4 type];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliGroupChatIcon *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliGroupChatIcon *)self isEqualToCTLazuliGroupChatIcon:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliGroupChatIcon allocWithZone:a3];
  [(CTLazuliGroupChatIcon *)v4 setName:self->_name];
  [(CTLazuliGroupChatIcon *)v4 setData:self->_data];
  [(CTLazuliGroupChatIcon *)v4 setType:self->_type];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"kNameKey"];
  [v4 encodeObject:self->_data forKey:@"kDataKey"];
  [v4 encodeObject:self->_type forKey:@"kTypeKey"];
}

- (CTLazuliGroupChatIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliGroupChatIcon;
  v5 = [(CTLazuliGroupChatIcon *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDataKey"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTypeKey"];
    type = v5->_type;
    v5->_type = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliGroupChatIcon)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliGroupChatIcon;
  id v4 = [(CTLazuliGroupChatIcon *)&v17 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    name = v4->_name;
    v4->_name = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*((void *)a3 + 3) length:*((void *)a3 + 4) - *((void *)a3 + 3)];
    data = v4->_data;
    v4->_data = (NSData *)v8;

    v12 = (char *)*((void *)a3 + 6);
    char v11 = (char *)a3 + 48;
    uint64_t v10 = v12;
    if (v11[23] >= 0) {
      objc_super v13 = v11;
    }
    else {
      objc_super v13 = v10;
    }
    uint64_t v14 = [NSString stringWithUTF8String:v13];
    type = v4->_type;
    v4->_type = (NSString *)v14;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end