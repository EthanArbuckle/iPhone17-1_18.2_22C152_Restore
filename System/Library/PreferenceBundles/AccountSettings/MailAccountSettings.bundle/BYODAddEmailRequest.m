@interface BYODAddEmailRequest
+ (Class)responseClass;
- (BYODAddEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7 withEmail:(id)a8 withPhone:(id)a9;
- (NSArray)emailArray;
- (NSString)domainName;
- (NSString)dsid;
- (NSString)invitedEmail;
- (NSString)invitedPhone;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
- (void)setDomainName:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEmailArray:(id)a3;
- (void)setInvitedEmail:(id)a3;
- (void)setInvitedPhone:(id)a3;
@end

@implementation BYODAddEmailRequest

- (BYODAddEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7 withEmail:(id)a8 withPhone:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v21 = a8;
  id v17 = a9;
  v18 = [(BYODAddEmailRequest *)self urlString];
  v25.receiver = self;
  v25.super_class = (Class)BYODAddEmailRequest;
  v19 = [(BYODRequest *)&v25 initWithURLString:v18 accountStore:v16 appleAccount:v15 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_domainName, a5);
    objc_storeStrong((id *)&v19->_emailArray, a6);
    objc_storeStrong((id *)&v19->_dsid, a7);
    objc_storeStrong((id *)&v19->_invitedEmail, a8);
    objc_storeStrong((id *)&v19->_invitedPhone, a9);
  }

  return v19;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"addCustomEmailURL"];

  return v4;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)performRequestWithCallback:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5CEEC;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:self->_domainName forKey:@"domain"];
  [v3 setValue:self->_dsid forKey:@"dsid"];
  [v3 setValue:self->_emailArray forKey:@"email"];
  [v3 setValue:self->_invitedEmail forKey:@"accountEmail"];
  [v3 setValue:self->_invitedPhone forKey:@"phoneNumber"];

  return v3;
}

- (NSArray)emailArray
{
  return self->_emailArray;
}

- (void)setEmailArray:(id)a3
{
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)invitedEmail
{
  return self->_invitedEmail;
}

- (void)setInvitedEmail:(id)a3
{
}

- (NSString)invitedPhone
{
  return self->_invitedPhone;
}

- (void)setInvitedPhone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedPhone, 0);
  objc_storeStrong((id *)&self->_invitedEmail, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_emailArray, 0);
}

@end