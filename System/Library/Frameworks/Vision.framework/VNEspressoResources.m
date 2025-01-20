@interface VNEspressoResources
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- (NSString)modelPath;
- (NSString)networkConfigurationName;
- (VNEspressoResources)initWithModelPath:(id)a3 networkConfigurationName:(id)a4 network:(id)a5 plan:(void *)a6 context:(void *)a7;
- (id)description;
- (void)context;
- (void)dealloc;
- (void)free;
- (void)plan;
@end

@implementation VNEspressoResources

- (void)plan
{
  return self->_plan;
}

- (VNEspressoResources)initWithModelPath:(id)a3 networkConfigurationName:(id)a4 network:(id)a5 plan:(void *)a6 context:(void *)a7
{
  uint64_t v9 = *(void *)&a5.var1;
  var0 = a5.var0;
  id v13 = a3;
  id v14 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VNEspressoResources;
  v15 = [(VNEspressoResources *)&v22 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    modelPath = v15->_modelPath;
    v15->_modelPath = (NSString *)v16;

    uint64_t v18 = [v14 copy];
    networkConfigurationName = v15->_networkConfigurationName;
    v15->_networkConfigurationName = (NSString *)v18;

    v15->_network.plan = var0;
    *(void *)&v15->_network.network_index = v9;
    v15->_plan = a6;
    v15->_context = a7;
    v20 = v15;
  }

  return v15;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  objc_copyStruct(v4, &self->_network, 16, 1, 0);
  v2 = (void *)v4[0];
  uint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationName, 0);

  objc_storeStrong((id *)&self->_modelPath, 0);
}

- (NSString)networkConfigurationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)modelPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)context
{
  return self->_context;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(VNEspressoResources *)self modelPath];
  v5 = (void *)[v3 initWithFormat:@"Model: %@, network: %p, plan: %p: context: %p", v4, &self->_network, self->_plan, self->_context];

  return v5;
}

- (void)dealloc
{
  [(VNEspressoResources *)self free];
  v3.receiver = self;
  v3.super_class = (Class)VNEspressoResources;
  [(VNEspressoResources *)&v3 dealloc];
}

- (void)free
{
  self->_plan = 0;
  espresso_context_destroy();
  self->_context = 0;
  self->_network.plan = 0;
  self->_network.network_index = 0;
}

@end