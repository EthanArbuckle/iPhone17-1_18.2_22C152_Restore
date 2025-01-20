@interface HMMTRHAPDescriptionAtEndpoint
- (HMMTRHAPDescriptionAtEndpoint)init;
- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4;
- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4 name:(id)a5 partsList:(id)a6 fixedLabels:(id)a7;
- (NSArray)categories;
- (NSArray)fixedLabels;
- (NSArray)partsList;
- (NSArray)serviceDescriptions;
- (NSString)name;
- (id)attributeDescriptions;
- (id)getCategories;
- (id)getFixedLabels;
- (id)getName;
- (id)getPartsList;
- (id)getServiceDescriptions;
- (void)setCategories:(id)a3;
- (void)setServiceDescriptions:(id)a3;
@end

@implementation HMMTRHAPDescriptionAtEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedLabels, 0);
  objc_storeStrong((id *)&self->_partsList, 0);
  objc_storeStrong((id *)&self->_serviceDescriptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

- (NSArray)fixedLabels
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)partsList
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceDescriptions:(id)a3
{
}

- (NSArray)serviceDescriptions
{
  return self->_serviceDescriptions;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMMTRHAPDescriptionAtEndpoint *)self categories];
  v4 = (void *)[v3 initWithName:@"Categories" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v6 = [(HMMTRHAPDescriptionAtEndpoint *)self serviceDescriptions];
  v7 = (void *)[v5 initWithName:@"ServiceDescriptions" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(HMMTRHAPDescriptionAtEndpoint *)self name];
  v10 = (void *)[v8 initWithName:@"Name" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(HMMTRHAPDescriptionAtEndpoint *)self partsList];
  v13 = (void *)[v11 initWithName:@"PartsList" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = [(HMMTRHAPDescriptionAtEndpoint *)self fixedLabels];
  v16 = (void *)[v14 initWithName:@"FixedLabels" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (id)getName
{
  return self->_name;
}

- (id)getFixedLabels
{
  return self->_fixedLabels;
}

- (id)getPartsList
{
  return self->_partsList;
}

- (id)getServiceDescriptions
{
  return self->_serviceDescriptions;
}

- (id)getCategories
{
  return self->_categories;
}

- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4 name:(id)a5 partsList:(id)a6 fixedLabels:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(HMMTRHAPDescriptionAtEndpoint *)self init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_categories, a3);
    objc_storeStrong((id *)&v18->_serviceDescriptions, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    if (v15)
    {
      v19 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      partsList = v18->_partsList;
      v18->_partsList = v19;

      objc_storeStrong((id *)&v18->_partsList, a6);
    }
    if (v16)
    {
      v21 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      fixedLabels = v18->_fixedLabels;
      v18->_fixedLabels = v21;

      objc_storeStrong((id *)&v18->_fixedLabels, a7);
    }
  }

  return v18;
}

- (HMMTRHAPDescriptionAtEndpoint)initWithType:(id)a3 serviceDescriptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(HMMTRHAPDescriptionAtEndpoint *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categories, a3);
    objc_storeStrong((id *)&v10->_serviceDescriptions, a4);
  }

  return v10;
}

- (HMMTRHAPDescriptionAtEndpoint)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMMTRHAPDescriptionAtEndpoint;
  v2 = [(HMMTRHAPDescriptionAtEndpoint *)&v8 init];
  if (v2)
  {
    id v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    categories = v2->_categories;
    v2->_categories = v3;

    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    serviceDescriptions = v2->_serviceDescriptions;
    v2->_serviceDescriptions = v5;
  }
  return v2;
}

@end