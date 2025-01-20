@interface DMTManagedConfigurationBackedProfileInstallationPrimitives
- (BOOL)uninstallProfileWithIdentifier:(id)a3 error:(id *)a4;
- (id)installProfileData:(id)a3 error:(id *)a4;
@end

@implementation DMTManagedConfigurationBackedProfileInstallationPrimitives

- (id)installProfileData:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a3;
  v7 = [v5 sharedConnection];
  id v12 = 0;
  v8 = [v7 installProfileData:v6 options:MEMORY[0x263EFFA78] outError:&v12];

  id v9 = v12;
  if (!v8)
  {
    if (_DMTLogGeneral_onceToken_11 != -1) {
      dispatch_once(&_DMTLogGeneral_onceToken_11, &__block_literal_global_15);
    }
    v10 = _DMTLogGeneral_logObj_11;
    if (!os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_11, OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    -[DMTManagedConfigurationBackedProfileInstallationPrimitives installProfileData:error:]((uint64_t)v9, v10);
    if (a4) {
LABEL_6:
    }
      *a4 = v9;
  }
LABEL_7:

  return v8;
}

- (BOOL)uninstallProfileWithIdentifier:(id)a3 error:(id *)a4
{
  v4 = (void *)MEMORY[0x263F53C50];
  id v5 = a3;
  id v6 = [v4 sharedConnection];
  [v6 removeProfileWithIdentifier:v5];

  return 1;
}

- (void)installProfileData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D3D6000, a2, OS_LOG_TYPE_ERROR, "Failed to install profile: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end