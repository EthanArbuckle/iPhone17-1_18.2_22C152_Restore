@interface BiometricKitTemplateInfo
- (BiometricKitTemplateInfo)init;
- (NSArray)topology;
- (NSDictionary)details;
- (void)dealloc;
- (void)setDetails:(id)a3;
- (void)setTopology:(id)a3;
@end

@implementation BiometricKitTemplateInfo

- (BiometricKitTemplateInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)BiometricKitTemplateInfo;
  v2 = [(BiometricKitTemplateInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    topology = v2->_topology;
    v2->_topology = 0;

    details = v3->_details;
    v3->_details = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(BiometricKitTemplateInfo *)self setTopology:0];
  [(BiometricKitTemplateInfo *)self setDetails:0];
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitTemplateInfo;
  [(BiometricKitTemplateInfo *)&v3 dealloc];
}

- (NSArray)topology
{
  return self->_topology;
}

- (void)setTopology:(id)a3
{
}

- (NSDictionary)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_topology, 0);
}

@end