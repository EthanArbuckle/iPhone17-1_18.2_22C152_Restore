@interface HMDHomeMatterServicesCoordinatorFactory
- (HMDHomeMatterServicesCoordinatorFactory)init;
- (id)createHomeMatterServicesCoordinatorWithHome:(id)a3;
@end

@implementation HMDHomeMatterServicesCoordinatorFactory

- (id)createHomeMatterServicesCoordinatorWithHome:(id)a3
{
  id v5 = objc_allocWithZone((Class)HMDFeaturesDataSource);
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_init);
  id v9 = v6;
  id v10 = sub_22F6672B4();

  type metadata accessor for DefaultHomeMatterServicesFactory();
  uint64_t v11 = swift_allocObject();
  id v12 = sub_22F679DF8((uint64_t)v8, (uint64_t)v10, v11);

  return v12;
}

- (HMDHomeMatterServicesCoordinatorFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDHomeMatterServicesCoordinatorFactory;
  return [(HMDHomeMatterServicesCoordinatorFactory *)&v3 init];
}

@end