@interface CTLazuliCustomMetaDataWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliCustomMetaDataWrapper:(id)a3;
- (CTLazuliCustomMetaDataWrapper)initWithCoder:(id)a3;
- (CTLazuliCustomMetaDataWrapper)initWithReflection:(const void *)a3;
- (NSString)header;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setHeader:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CTLazuliCustomMetaDataWrapper

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliCustomMetaDataWrapper *)self header];
  [v3 appendFormat:@", header = %@", v4];

  v5 = [(CTLazuliCustomMetaDataWrapper *)self value];
  [v3 appendFormat:@", value = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliCustomMetaDataWrapper:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliCustomMetaDataWrapper *)self header];
  v6 = [v4 header];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliCustomMetaDataWrapper *)self value];
    v8 = [v4 value];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliCustomMetaDataWrapper *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliCustomMetaDataWrapper *)self isEqualToCTLazuliCustomMetaDataWrapper:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliCustomMetaDataWrapper allocWithZone:a3];
  [(CTLazuliCustomMetaDataWrapper *)v4 setHeader:self->_header];
  [(CTLazuliCustomMetaDataWrapper *)v4 setValue:self->_value];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_header forKey:@"kHeaderKey"];
  [v4 encodeObject:self->_value forKey:@"kValueKey"];
}

- (CTLazuliCustomMetaDataWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliCustomMetaDataWrapper;
  v5 = [(CTLazuliCustomMetaDataWrapper *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHeaderKey"];
    header = v5->_header;
    v5->_header = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kValueKey"];
    value = v5->_value;
    v5->_value = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliCustomMetaDataWrapper)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliCustomMetaDataWrapper;
  id v4 = [(CTLazuliCustomMetaDataWrapper *)&v15 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    header = v4->_header;
    v4->_header = (NSString *)v6;

    v10 = (char *)*((void *)a3 + 3);
    char v9 = (char *)a3 + 24;
    uint64_t v8 = v10;
    if (v9[23] >= 0) {
      objc_super v11 = v9;
    }
    else {
      objc_super v11 = v8;
    }
    uint64_t v12 = [NSString stringWithUTF8String:v11];
    value = v4->_value;
    v4->_value = (NSString *)v12;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end