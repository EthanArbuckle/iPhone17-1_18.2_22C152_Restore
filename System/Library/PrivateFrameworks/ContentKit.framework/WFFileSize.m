@interface WFFileSize
+ (BOOL)supportsSecureCoding;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)formattedString;
- (WFFileSize)initWithByteCount:(int64_t)a3;
- (WFFileSize)initWithCoder:(id)a3;
- (id)wfSerializedRepresentation;
- (int64_t)byteCount;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileSize

- (int64_t)byteCount
{
  return self->_byteCount;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  int64_t byteCount = self->_byteCount;
  id v5 = a3;
  id v6 = [v3 numberWithLongLong:byteCount];
  [v5 encodeObject:v6 forKey:@"byteCount"];
}

- (WFFileSize)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"byteCount"];

  uint64_t v6 = [v5 longLongValue];
  return [(WFFileSize *)self initWithByteCount:v6];
}

- (id)wfSerializedRepresentation
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = @"link.contentkit.filesize";
  uint64_t v6 = @"byteCount";
  v2 = [NSNumber numberWithLongLong:self->_byteCount];
  v7 = v2;
  v3 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v4;
}

- (unint64_t)hash
{
  return [(WFFileSize *)self byteCount] ^ 0xCEDC;
}

- (int64_t)compare:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithLongLong:", -[WFFileSize byteCount](self, "byteCount"));
  v7 = NSNumber;
  uint64_t v8 = [v5 byteCount];

  v9 = [v7 numberWithLongLong:v8];
  int64_t v10 = [v6 compare:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFFileSize *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(WFFileSize *)self byteCount];
      BOOL v6 = v5 == [(WFFileSize *)v4 byteCount];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)formattedString
{
  v2 = (void *)MEMORY[0x263F086F0];
  int64_t v3 = [(WFFileSize *)self byteCount];
  return (NSString *)[v2 stringFromByteCount:v3 countStyle:0];
}

- (WFFileSize)initWithByteCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFFileSize;
  id v4 = [(WFFileSize *)&v8 init];
  int64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t byteCount = a3;
    BOOL v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.filesize"];

  BOOL v6 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"byteCount"];
  uint64_t v7 = [v6 longLongValue];

  objc_super v8 = (void *)[objc_alloc((Class)a1) initWithByteCount:v7];
  return v8;
}

@end