@interface HMDMobileAssetManagerFactory
+ (id)makeInstanceWithContext:(id)a3;
- (HMDMobileAssetManagerFactory)init;
@end

@implementation HMDMobileAssetManagerFactory

+ (id)makeInstanceWithContext:(id)a3
{
  v11 = &type metadata for DefaultMobileAssetManagerDataSource;
  v12 = &off_26E2D5168;
  type metadata accessor for MobileAssetManager();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, (uint64_t)&type metadata for DefaultMobileAssetManagerDataSource);
  MEMORY[0x270FA5388](v5);
  (*(void (**)(void))(v6 + 16))();
  id v7 = a3;
  v8 = (void *)sub_22F5B4F3C(v7, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);

  return v8;
}

- (HMDMobileAssetManagerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDMobileAssetManagerFactory;
  return [(HMDMobileAssetManagerFactory *)&v3 init];
}

@end