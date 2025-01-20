@interface CTStewieOffGridModeMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieOffGridModeMessage)initWithCoder:(id)a3;
- (CTStewieOffGridModeMessage)initWithOffGridModeKey:(id)a3 error:(id *)p_isa;
- (NSData)offGridModeKey;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOffGridModeKey:(id)a3;
@end

@implementation CTStewieOffGridModeMessage

- (CTStewieOffGridModeMessage)initWithOffGridModeKey:(id)a3 error:(id *)p_isa
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (!v7)
  {
    if (!p_isa) {
      goto LABEL_12;
    }
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"offGridModeKey is missing";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *p_isa = [v10 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v11];

LABEL_10:
    p_isa = 0;
    goto LABEL_12;
  }
  if ([v7 length] && objc_msgSend(v8, "length") != 16)
  {
    if (!p_isa) {
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17 = @"offGridModeKey size is incorrect.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *p_isa = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v13];

    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)CTStewieOffGridModeMessage;
  v9 = [(CTStewieOffGridModeMessage *)&v15 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offGridModeKey, a3);
    self = p_isa;
    p_isa = (id *)&self->super.isa;
  }
  else
  {
    self = 0;
  }
LABEL_12:

  return (CTStewieOffGridModeMessage *)p_isa;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieOffGridModeMessage *)self offGridModeKey];
  [v3 appendFormat:@", offGridModeKey size=%lu", objc_msgSend(v4, "length")];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4 = a3;
  v5 = [(CTStewieOffGridModeMessage *)self offGridModeKey];
  v6 = [v4 offGridModeKey];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(CTStewieOffGridModeMessage *)self offGridModeKey];
    v8 = [v4 offGridModeKey];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieOffGridModeMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieOffGridModeMessage *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTStewieOffGridModeMessage *)self offGridModeKey];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setOffGridModeKey:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CTStewieOffGridModeMessage *)self offGridModeKey];
  [v5 encodeObject:v4 forKey:@"offGridModeKey"];
}

- (CTStewieOffGridModeMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offGridModeKey"];
  v6 = [(CTStewieOffGridModeMessage *)self initWithOffGridModeKey:v5 error:0];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)offGridModeKey
{
  return self->_offGridModeKey;
}

- (void)setOffGridModeKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end