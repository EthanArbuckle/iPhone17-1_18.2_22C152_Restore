@interface BYODDeleteEmailRequest
+ (Class)responseClass;
- (BYODDeleteEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7;
- (BYODDeleteEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7 invitedEmail:(id)a8 invitedPhone:(id)a9;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODDeleteEmailRequest

- (BYODDeleteEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7
{
  return -[BYODDeleteEmailRequest initWithAccount:accountStore:domain:emailArray:dsid:invitedEmail:invitedPhone:](self, "initWithAccount:accountStore:domain:emailArray:dsid:invitedEmail:invitedPhone:", a3, a4, a5, a6, a7, &stru_B9F70);
}

- (BYODDeleteEmailRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 emailArray:(id)a6 dsid:(id)a7 invitedEmail:(id)a8 invitedPhone:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v26 = a5;
  id v17 = a6;
  id v25 = a7;
  id v24 = a8;
  id v18 = a9;
  v19 = [(BYODDeleteEmailRequest *)self urlString];
  v27.receiver = self;
  v27.super_class = (Class)BYODDeleteEmailRequest;
  v20 = [(BYODRequest *)&v27 initWithURLString:v19 accountStore:v16 appleAccount:v15 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_domainName, a5);
    v21 = (NSArray *)[v17 copy];
    emailArray = v20->_emailArray;
    v20->_emailArray = v21;

    objc_storeStrong((id *)&v20->_dsid, a7);
    objc_storeStrong((id *)&v20->_invitedEmail, a8);
    objc_storeStrong((id *)&v20->_invitedPhone, a9);
  }

  return v20;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"deleteCustomEmailURL"];

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
  v5[2] = sub_5C948;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedPhone, 0);
  objc_storeStrong((id *)&self->_invitedEmail, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_domainName, 0);

  objc_storeStrong((id *)&self->_emailArray, 0);
}

@end