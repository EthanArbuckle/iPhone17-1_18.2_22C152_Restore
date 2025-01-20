@interface CNPRUISPosterConfigurationFinalizer
+ (id)finalizedConfiguration:(id)a3 forExtensionIdentifier:(id)a4;
@end

@implementation CNPRUISPosterConfigurationFinalizer

+ (id)finalizedConfiguration:(id)a3 forExtensionIdentifier:(id)a4
{
  v5 = (Class (__cdecl *)())getPRSPosterConfigurationAttributesClass[0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(v5());
  v9 = [v7 wrappedMutablePosterConfiguration];

  v10 = [v9 _path];
  v11 = (void *)[v8 initWithPath:v10 extensionIdentifier:v6];

  Class v12 = (Class)getPRPosterConfiguredPropertiesClass[0]();
  v13 = getPRSPosterRoleIncomingCall[0]();
  v14 = [(objc_class *)v12 defaultConfiguredPropertiesForRole:v13];

  v15 = [(Class)getPRUISPosterConfigurationFinalizerClass[0]() finalizedConfigurationForAttributes:v11 withConfiguredProperties:v14 error:0];
  v16 = [[CNPRSPosterConfiguration alloc] initWithPosterConfiguration:v15];

  return v16;
}

@end