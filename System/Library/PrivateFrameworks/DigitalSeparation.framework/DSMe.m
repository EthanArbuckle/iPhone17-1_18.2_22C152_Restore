@interface DSMe
- (DSMe)init;
- (NSSet)emails;
- (NSSet)phoneNumbers;
- (NSString)meCardIdentifier;
- (void)setEmails:(id)a3;
- (void)setMeCardIdentifier:(id)a3;
- (void)setPhoneNumbers:(id)a3;
@end

@implementation DSMe

- (DSMe)init
{
  v8.receiver = self;
  v8.super_class = (Class)DSMe;
  v2 = [(DSMe *)&v8 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263EFEA58], "ds_meContactIdentifier");
    [(DSMe *)v2 setMeCardIdentifier:v3];

    v4 = objc_opt_new();
    v5 = objc_msgSend(v4, "ds_deviceOwnerEmails");
    [(DSMe *)v2 setEmails:v5];

    v6 = objc_msgSend(v4, "ds_deviceOwnerPhoneNumbers");
    [(DSMe *)v2 setPhoneNumbers:v6];
  }
  return v2;
}

- (NSString)meCardIdentifier
{
  return self->_meCardIdentifier;
}

- (void)setMeCardIdentifier:(id)a3
{
}

- (NSSet)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_meCardIdentifier, 0);
}

@end