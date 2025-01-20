@interface MSEmailModel
+ (BOOL)supportsSecureCoding;
- (MSEmailModel)initWithCoder:(id)a3;
- (NSArray)bcc;
- (NSArray)cc;
- (NSArray)to;
- (NSString)body;
- (NSString)sender;
- (NSString)subject;
- (NSURL)reference;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBcc:(id)a3;
- (void)setBody:(id)a3;
- (void)setCc:(id)a3;
- (void)setReference:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTo:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MSEmailModel

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:1 forKey:@"MSCodingKeyVersion"];
  [v4 encodeObject:self->_subject forKey:@"MSCodingKeySubject"];
  [v4 encodeObject:self->_sender forKey:@"MSCodingKeySender"];
  [v4 encodeObject:self->_to forKey:@"MSCodingKeyTo"];
  [v4 encodeObject:self->_cc forKey:@"MSCodingKeyCc"];
  [v4 encodeObject:self->_bcc forKey:@"MSCodingKeyBcc"];
  [v4 encodeObject:self->_body forKey:@"MSCodingKeyBody"];
  [v4 encodeObject:self->_reference forKey:@"MSCodingKeyReference"];
  [v4 encodeInt32:LODWORD(self->_type) forKey:@"MSCodingKeyType"];
}

- (MSEmailModel)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MSEmailModel *)self init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"MSCodingKeyVersion"]
      && [v4 decodeInt32ForKey:@"MSCodingKeyVersion"] == 1)
    {
      v6 = (void *)MEMORY[0x263EFFA08];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      v8 = [v6 setWithArray:v7];

      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSCodingKeySubject"];
      subject = v5->_subject;
      v5->_subject = (NSString *)v9;

      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSCodingKeyBody"];
      body = v5->_body;
      v5->_body = (NSString *)v11;

      uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"MSCodingKeySender"];
      sender = v5->_sender;
      v5->_sender = (NSString *)v13;

      uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"MSCodingKeyTo"];
      to = v5->_to;
      v5->_to = (NSArray *)v15;

      uint64_t v17 = [v4 decodeObjectOfClasses:v8 forKey:@"MSCodingKeyCc"];
      cc = v5->_cc;
      v5->_cc = (NSArray *)v17;

      uint64_t v19 = [v4 decodeObjectOfClasses:v8 forKey:@"MSCodingKeyBcc"];
      bcc = v5->_bcc;
      v5->_bcc = (NSArray *)v19;

      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSCodingKeyReference"];
      reference = v5->_reference;
      v5->_reference = (NSURL *)v21;

      v5->_type = (int)[v4 decodeInt32ForKey:@"MSCodingKeyType"];
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
}

- (NSArray)bcc
{
  return self->_bcc;
}

- (void)setBcc:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSURL)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_subject, 0);
}

@end