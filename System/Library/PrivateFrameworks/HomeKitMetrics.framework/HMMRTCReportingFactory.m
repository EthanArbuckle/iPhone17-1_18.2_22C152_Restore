@interface HMMRTCReportingFactory
- (id)sessionWithServiceName:(id)a3 samplingUUID:(id)a4 containsRealtime:(BOOL)a5;
@end

@implementation HMMRTCReportingFactory

- (id)sessionWithServiceName:(id)a3 samplingUUID:(id)a4 containsRealtime:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F94660];
  uint64_t v20 = *MEMORY[0x1E4F94658];
  uint64_t v21 = v8;
  v27 = (__CFString *)&unk_1F2C87778;
  v28 = &unk_1F2C877C0;
  uint64_t v9 = *MEMORY[0x1E4F94648];
  uint64_t v22 = *MEMORY[0x1E4F94680];
  uint64_t v23 = v9;
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  if (v5) {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  v29 = &unk_1F2C87790;
  uint64_t v30 = v10;
  uint64_t v24 = *MEMORY[0x1E4F94678];
  v11 = [a4 UUIDString];
  v31 = v11;
  uint64_t v25 = *MEMORY[0x1E4F94668];
  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  uint64_t v26 = *MEMORY[0x1E4F94650];
  v32 = v12;
  v33 = @"com.apple.HomeKitDaemon";
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v20 count:7];

  uint64_t v14 = *MEMORY[0x1E4F94690];
  uint64_t v20 = *MEMORY[0x1E4F94688];
  uint64_t v21 = v14;
  v27 = @"home";
  v28 = v7;
  v15 = (void *)MEMORY[0x1E4F1C9E8];
  id v16 = v7;
  v17 = [v15 dictionaryWithObjects:&v27 forKeys:&v20 count:2];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F94620]) initWithSessionInfo:v13 userInfo:v17 frameworksToCheck:0];
  return v18;
}

@end