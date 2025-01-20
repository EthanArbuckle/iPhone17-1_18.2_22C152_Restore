@interface AAFamilyDetailsRequest
+ (Class)responseClass;
- (AAFamilyDetailsRequest)initWithAccount:(id)a3;
- (id)urlString;
@end

@implementation AAFamilyDetailsRequest

- (AAFamilyDetailsRequest)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [v4 accountStore];
  v6 = objc_msgSend(v5, "aida_accountForiCloudAccount:", v4);
  v7 = [(AAFamilyRequest *)self initWithAppleAccount:v4 grandSlamAccount:v6 accountStore:v5];

  return v7;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 getFamilyDetailsURL];

  return v3;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end