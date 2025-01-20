@interface IMBackgroundMessageRecipient
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IMBackgroundMessageRecipient)initWithCoder:(id)a3;
- (NSString)displayName;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation IMBackgroundMessageRecipient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMBackgroundMessageRecipient *)self phoneNumber];
  [v4 encodeObject:v5 forKey:@"kIMBackgroundMessageRecipientPhoneNumber"];

  id v6 = [(IMBackgroundMessageRecipient *)self displayName];
  [v4 encodeObject:v6 forKey:@"kIMBackgroundMessageRecipientDisplayName"];
}

- (IMBackgroundMessageRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMBackgroundMessageRecipient;
  v5 = [(IMBackgroundMessageRecipient *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIMBackgroundMessageRecipientPhoneNumber"];
    [(IMBackgroundMessageRecipient *)v5 setPhoneNumber:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIMBackgroundMessageRecipientDisplayName"];
    [(IMBackgroundMessageRecipient *)v5 setDisplayName:v7];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(IMBackgroundMessageRecipient *)self phoneNumber];
  [v4 setPhoneNumber:v5];

  id v6 = [(IMBackgroundMessageRecipient *)self displayName];
  [v4 setDisplayName:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(IMBackgroundMessageRecipient *)self phoneNumber];
  id v6 = [v4 phoneNumber];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(IMBackgroundMessageRecipient *)self phoneNumber];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end