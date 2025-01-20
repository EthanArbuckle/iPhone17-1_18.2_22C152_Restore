@interface IDSStewiePhoneNumberInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSAuthenticationCertificate)authenticationCertificate;
- (IDSStewiePhoneNumberInfo)initWithCoder:(id)a3;
- (IDSStewiePhoneNumberInfo)initWithPhoneNumber:(id)a3 uniqueIdentifier:(id)a4 authenticationCertificate:(id)a5 index:(id)a6;
- (IDSStewiePhoneNumberInfo)initWithUser:(id)a3 authenticationCertificate:(id)a4;
- (NSString)index;
- (NSString)phoneNumber;
- (NSString)uniqueIdentifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(id)a3;
@end

@implementation IDSStewiePhoneNumberInfo

- (IDSStewiePhoneNumberInfo)initWithPhoneNumber:(id)a3 uniqueIdentifier:(id)a4 authenticationCertificate:(id)a5 index:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSStewiePhoneNumberInfo;
  v15 = [(IDSStewiePhoneNumberInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_phoneNumber, a3);
    objc_storeStrong((id *)&v16->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v16->_authenticationCertificate, a5);
    objc_storeStrong((id *)&v16->_index, a6);
  }

  return v16;
}

- (IDSStewiePhoneNumberInfo)initWithUser:(id)a3 authenticationCertificate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 phoneNumber];
  v9 = [v7 uniqueIdentifier];

  v10 = [(IDSStewiePhoneNumberInfo *)self initWithPhoneNumber:v8 uniqueIdentifier:v9 authenticationCertificate:v6 index:0];
  return v10;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 authenticationCertificate];
    id v6 = [v5 dataRepresentation];
    id v7 = [(IDSStewiePhoneNumberInfo *)self authenticationCertificate];
    v8 = [v7 dataRepresentation];
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(IDSStewiePhoneNumberInfo *)self authenticationCertificate];
  v3 = [v2 dataRepresentation];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(IDSStewiePhoneNumberInfo *)self authenticationCertificate];
  if (v4) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  id v6 = [(IDSStewiePhoneNumberInfo *)self phoneNumber];
  id v7 = [(IDSStewiePhoneNumberInfo *)self index];
  v8 = +[NSString stringWithFormat:@"<%@: %p { sig: %@, pn: %@, index: %@ }>", v3, self, v5, v6, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(IDSStewiePhoneNumberInfo *)self phoneNumber];
  [v4 encodeObject:v5 forKey:@"phoneNumber"];

  id v6 = [(IDSStewiePhoneNumberInfo *)self uniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"id"];

  id v7 = [(IDSStewiePhoneNumberInfo *)self authenticationCertificate];
  v8 = [v7 dataRepresentation];
  [v4 encodeObject:v8 forKey:@"cert"];

  id v9 = [(IDSStewiePhoneNumberInfo *)self index];
  [v4 encodeObject:v9 forKey:@"index"];
}

- (IDSStewiePhoneNumberInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cert"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"index"];

  id v9 = [objc_alloc((Class)IDSAuthenticationCertificate) initWithDataRepresentation:v7];
  v10 = [(IDSStewiePhoneNumberInfo *)self initWithPhoneNumber:v5 uniqueIdentifier:v6 authenticationCertificate:v9 index:v8];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (IDSAuthenticationCertificate)authenticationCertificate
{
  return (IDSAuthenticationCertificate *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)index
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_authenticationCertificate, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end