@interface BMComputeXPCPublisherClientDomainConfiguration
- (BMComputeXPCPublisherClientDomainConfiguration)initWithDomain:(unint64_t)a3;
- (NSString)XPCPublisherStreamName;
- (NSString)biomeLaunchNotification;
- (NSString)machServiceName;
- (unint64_t)domain;
@end

@implementation BMComputeXPCPublisherClientDomainConfiguration

- (BMComputeXPCPublisherClientDomainConfiguration)initWithDomain:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BMComputeXPCPublisherClientDomainConfiguration;
  v4 = [(BMComputeXPCPublisherClientDomainConfiguration *)&v14 init];
  if (v4)
  {
    v5 = +[BMDaemon systemComputePublisherServiceName];
    v6 = +[BMDaemon systemComputePublisherStreamName];
    uint64_t v7 = +[BMDaemon biomedLaunchNotification];
    machServiceName = v4->_machServiceName;
    v4->_domain = a3;
    v4->_machServiceName = v5;
    v9 = v5;

    XPCPublisherStreamName = v4->_XPCPublisherStreamName;
    v4->_XPCPublisherStreamName = v6;
    v11 = v6;

    biomeLaunchNotification = v4->_biomeLaunchNotification;
    v4->_biomeLaunchNotification = (NSString *)v7;
  }
  return v4;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (NSString)XPCPublisherStreamName
{
  return self->_XPCPublisherStreamName;
}

- (NSString)biomeLaunchNotification
{
  return self->_biomeLaunchNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeLaunchNotification, 0);
  objc_storeStrong((id *)&self->_XPCPublisherStreamName, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end