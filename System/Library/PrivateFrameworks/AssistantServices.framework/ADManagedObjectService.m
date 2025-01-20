@interface ADManagedObjectService
- (ADManagedObjectService)initWithDomainName:(id)a3;
- (id)domains;
@end

@implementation ADManagedObjectService

- (void).cxx_destruct
{
}

- (id)domains
{
  domainName = self->_domainName;
  v2 = +[NSArray arrayWithObjects:&domainName count:1];
  return v2;
}

- (ADManagedObjectService)initWithDomainName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADManagedObjectService;
  v5 = [(ADManagedObjectService *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    domainName = v5->_domainName;
    v5->_domainName = v6;

    v8 = [@"com.apple.siri.ManagedObjectService." stringByAppendingString:v4];
    [(ADService *)v5 setIdentifier:v8];

    id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v5->_domainName, 0);
    [(ADService *)v5 setManagedStorageDomains:v9];
  }
  return v5;
}

@end