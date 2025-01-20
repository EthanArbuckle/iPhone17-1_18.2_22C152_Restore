@interface DMFEnableLostModeRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFEnableLostModeRequest)initWithCoder:(id)a3;
- (NSString)footnote;
- (NSString)message;
- (NSString)phoneNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation DMFEnableLostModeRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB658;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFEnableLostModeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFEnableLostModeRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"footnote"];
    footnote = v5->_footnote;
    v5->_footnote = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFEnableLostModeRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFEnableLostModeRequest *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(DMFEnableLostModeRequest *)self phoneNumber];
  [v4 encodeObject:v6 forKey:@"phoneNumber"];

  uint64_t v7 = [(DMFEnableLostModeRequest *)self footnote];
  [v4 encodeObject:v7 forKey:@"footnote"];
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end