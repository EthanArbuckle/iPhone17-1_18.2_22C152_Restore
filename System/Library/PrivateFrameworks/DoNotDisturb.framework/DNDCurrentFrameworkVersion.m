@interface DNDCurrentFrameworkVersion
@end

@implementation DNDCurrentFrameworkVersion

void ___DNDCurrentFrameworkVersion_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  long long v6 = 0uLL;
  uint64_t v7 = 0;
  DNDOperatingSystemVersionFromString(v1, &v6);
  if ((void)v6)
  {
    _DNDCurrentFrameworkVersion_currentVersion = v6;
    qword_1EB502100 = v7;
  }
  else
  {
    v2 = DNDLogSettings;
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR)) {
      ___DNDCurrentFrameworkVersion_block_invoke_cold_1((uint64_t)v1, v2);
    }
  }
  v3 = (void *)DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)buf = _DNDCurrentFrameworkVersion_currentVersion;
    *(void *)&buf[16] = qword_1EB502100;
    v4 = v3;
    v5 = DNDStringFromOperatingSystemVersion(buf);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v1;
    _os_log_impl(&dword_19CC2C000, v4, OS_LOG_TYPE_DEFAULT, "Parsed current version: %@; source: %@", buf, 0x16u);
  }
}

void ___DNDCurrentFrameworkVersion_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_ERROR, "Unexpected Project Source Version: %@", (uint8_t *)&v2, 0xCu);
}

@end