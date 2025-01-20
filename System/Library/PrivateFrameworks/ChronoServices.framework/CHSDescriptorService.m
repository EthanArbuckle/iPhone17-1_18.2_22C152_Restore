@interface CHSDescriptorService
- (CHSDescriptorService)init;
- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4;
@end

@implementation CHSDescriptorService

- (CHSDescriptorService)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHSDescriptorService;
  v2 = [(CHSDescriptorService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CHSChronoServicesConnection sharedInstance];
    connection = v2->_connection;
    v2->_connection = (CHSChronoServicesConnection *)v3;
  }
  return v2;
}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end