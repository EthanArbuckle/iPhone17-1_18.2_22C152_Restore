@interface CTStewieFindMyMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFindMyMessage:(id)a3;
- (CTStewieFindMyMessage)initWithCoder:(id)a3;
- (CTStewieFindMyMessage)initWithData:(id)a3 error:(id *)p_isa;
- (NSData)encryptedData;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptedData:(id)a3;
@end

@implementation CTStewieFindMyMessage

- (CTStewieFindMyMessage)initWithData:(id)a3 error:(id *)p_isa
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7 && [v7 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)CTStewieFindMyMessage;
    v9 = [(CTStewieFindMyMessage *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_encryptedData, a3);
      self = p_isa;
      p_isa = (id *)&self->super.isa;
    }
    else
    {
      self = 0;
    }
  }
  else if (p_isa)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"Data provided is either nil or empty";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *p_isa = [v10 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v11];

    p_isa = 0;
  }

  return (CTStewieFindMyMessage *)p_isa;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieFindMyMessage *)self encryptedData];
  [v3 appendFormat:@", encryptedData=%@", v4];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToFindMyMessage:(id)a3
{
  id v4 = a3;
  v5 = [(CTStewieFindMyMessage *)self encryptedData];
  v6 = [v4 encryptedData];
  char v7 = [v5 isEqualToData:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieFindMyMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieFindMyMessage *)self isEqualToFindMyMessage:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v5 = [(CTStewieFindMyMessage *)self encryptedData];
  [v4 setEncryptedData:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CTStewieFindMyMessage *)self encryptedData];
  [v5 encodeObject:v4 forKey:@"encryptedData"];
}

- (CTStewieFindMyMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieFindMyMessage;
  id v5 = [(CTStewieFindMyMessage *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedData"];
    [(CTStewieFindMyMessage *)v5 setEncryptedData:v6];

    char v7 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end