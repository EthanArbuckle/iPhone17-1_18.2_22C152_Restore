@interface BYODRemoveMemberRequest
+ (Class)responseClass;
- (BYODRemoveMemberRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 domainStatus:(id)a6 domainMember:(id)a7;
- (id)bodyDictionary;
- (id)urlString;
- (void)performRequestWithCallback:(id)a3;
@end

@implementation BYODRemoveMemberRequest

- (BYODRemoveMemberRequest)initWithAccount:(id)a3 accountStore:(id)a4 domain:(id)a5 domainStatus:(id)a6 domainMember:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(BYODRemoveMemberRequest *)self urlString];
  v20.receiver = self;
  v20.super_class = (Class)BYODRemoveMemberRequest;
  v18 = [(BYODRequest *)&v20 initWithURLString:v17 accountStore:v13 appleAccount:v12 httpRequestType:@"POST" requestBody:0 httpHeader:0];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_domain, a5);
    objc_storeStrong((id *)&v18->_domainStatus, a6);
    objc_storeStrong((id *)&v18->_domainMember, a7);
  }

  return v18;
}

- (id)urlString
{
  v2 = [(BYODRequest *)self iCloudAppleAccount];
  v3 = [v2 propertiesForDataclass:@"com.apple.Dataclass.PremiumMailSettings"];
  v4 = [v3 objectForKeyedSubscript:@"domainDeleteMemberURL"];

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
  v5[2] = sub_60344;
  v5[3] = &unk_B97A0;
  id v6 = a3;
  id v4 = v6;
  [(BYODRequest *)self performRequestWithHandler:v5];
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setValue:self->_domain forKey:@"domain"];
  [v3 setValue:self->_domainStatus forKey:@"domainStatus"];
  id v4 = [(BYODUser *)self->_domainMember dsid];
  [v3 setValue:v4 forKey:@"dsid"];

  v5 = [(BYODUser *)self->_domainMember invitedEmail];
  [v3 setValue:v5 forKey:@"email"];

  id v6 = [(BYODUser *)self->_domainMember invitedPhoneNumber];
  [v3 setValue:v6 forKey:@"phoneNumber"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainMember, 0);
  objc_storeStrong((id *)&self->_domainStatus, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end