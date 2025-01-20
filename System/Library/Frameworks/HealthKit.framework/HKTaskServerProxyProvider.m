@interface HKTaskServerProxyProvider
- (HKTaskConfiguration)taskConfiguration;
- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7 taskUUID:(id)a8;
- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 taskUUID:(id)a6;
- (NSURL)pluginURL;
- (NSUUID)taskUUID;
- (id)debugIdentifier;
- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5;
- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6;
- (void)setPluginURL:(id)a3;
- (void)setTaskConfiguration:(id)a3;
@end

@implementation HKTaskServerProxyProvider

- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 taskUUID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v11 exportedInterface];
  v15 = [v11 remoteInterface];
  v16 = [(HKTaskServerProxyProvider *)self initWithHealthStore:v13 taskIdentifier:v12 exportedObject:v11 exportedInterface:v14 remoteInterface:v15 taskUUID:v10];

  return v16;
}

- (HKTaskServerProxyProvider)initWithHealthStore:(id)a3 taskIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7 taskUUID:(id)a8
{
  id v14 = a8;
  v21.receiver = self;
  v21.super_class = (Class)HKTaskServerProxyProvider;
  v15 = [(HKProxyProvider *)&v21 initWithSource:a3 serviceIdentifier:a4 exportedObject:a5 exportedInterface:a6 remoteInterface:a7];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    taskUUID = v15->_taskUUID;
    v15->_taskUUID = (NSUUID *)v16;

    v18 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    instanceUUID = v15->_instanceUUID;
    v15->_instanceUUID = v18;
  }
  return v15;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  return (id)[a3 taskServerEndpointForIdentifier:a4 pluginURL:self->_pluginURL taskUUID:self->_taskUUID instanceUUID:self->_instanceUUID configuration:self->_taskConfiguration error:a5];
}

- (id)debugIdentifier
{
  v3 = NSString;
  v4 = [(HKProxyProvider *)self serviceIdentifier];
  v5 = [v3 stringWithFormat:@"%@:%@", v4, self->_taskUUID];

  return v5;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (NSURL)pluginURL
{
  return self->_pluginURL;
}

- (void)setPluginURL:(id)a3
{
}

- (HKTaskConfiguration)taskConfiguration
{
  return (HKTaskConfiguration *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTaskConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskConfiguration, 0);
  objc_storeStrong((id *)&self->_pluginURL, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);

  objc_storeStrong((id *)&self->_instanceUUID, 0);
}

@end