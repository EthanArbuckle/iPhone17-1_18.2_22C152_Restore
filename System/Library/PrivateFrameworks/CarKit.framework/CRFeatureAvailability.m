@interface CRFeatureAvailability
- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4;
- (BOOL)isCarPlayAllowed;
- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5;
- (CRCarKitServiceClient)serviceClient;
- (CRFeatureAvailability)init;
- (id)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3;
- (unint64_t)deviceSupportedCarPlayFeatures;
- (unint64_t)supportedCarPlayFeaturesForSession:(id)a3;
- (void)deviceSupportedCarPlayFeatures;
- (void)fetchSupportedAirPlayFeaturesForVehicleIdentifier:(id)a3 completion:(id)a4;
- (void)isCarPlayAllowed;
- (void)setServiceClient:(id)a3;
@end

@implementation CRFeatureAvailability

- (CRFeatureAvailability)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRFeatureAvailability;
  v2 = [(CRFeatureAvailability *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    [(CRFeatureAvailability *)v2 setServiceClient:v3];
  }
  return v2;
}

- (BOOL)isCarPlayAllowed
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CRFeatureAvailability *)v3 isCarPlayAllowed];
  }

  v11 = [(CRFeatureAvailability *)self serviceClient];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke;
  v13[3] = &unk_1E5E3A9D0;
  v13[4] = &v14;
  [v11 performSynchronousServiceBlock:v13 errorHandler:&__block_literal_global_1];

  LOBYTE(v11) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v11;
}

uint64_t __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_2;
  v3[3] = &unk_1E5E3A9A8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 isCarPlayAllowedWithReply:v3];
}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      uint64_t v4 = @"YES";
    }
    else {
      uint64_t v4 = @"NO";
    }
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_INFO, "isCarPlayAllowed: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_27_cold_1();
  }
}

- (unint64_t)deviceSupportedCarPlayFeatures
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(CRFeatureAvailability *)v3 deviceSupportedCarPlayFeatures];
  }

  v11 = [(CRFeatureAvailability *)self serviceClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke;
  v14[3] = &unk_1E5E3A9D0;
  v14[4] = &v15;
  [v11 performSynchronousServiceBlock:v14 errorHandler:&__block_literal_global_32];

  unint64_t v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2;
  v3[3] = &unk_1E5E3A9F8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 deviceSupportedCarPlayFeaturesWithReply:v3];
}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue];
    uint64_t v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v8 = 134349056;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_INFO, "deviceSupportedFeatures %{public}lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1();
    }
  }
}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1();
  }
}

- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CRFeatureAvailability disablesCarPlayFeatures:forVehicleIdentifier:]((uint64_t)v6, a3, v7);
  }

  int v8 = [(CRFeatureAvailability *)self serviceClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke;
  v12[3] = &unk_1E5E3AA48;
  unint64_t v15 = a3;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v16;
  [v8 performSynchronousServiceBlock:v12 errorHandler:&__block_literal_global_35];

  char v10 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2;
  id v6 = &unk_1E5E3AA20;
  return objc_msgSend(a2, "disablesCarPlayFeatures:forVehicleIdentifier:reply:", MEMORY[0x1E4F143A8], 3221225472, __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2, &unk_1E5E3AA20, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      int v9 = 134349314;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      unint64_t v12 = v8;
      _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_INFO, "disablesCarPlayFeatures %{public}lu: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1();
    }
  }
}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_33(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1();
  }
}

- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v9 = CarGeneralLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    *(void *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_DEFAULT, "CRFeatureAvailability setCarPlayFeaturesDisabled: %{public}lu vehicleID: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v21 = 0;
  uint64_t v10 = [(CRFeatureAvailability *)self serviceClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke;
  v15[3] = &unk_1E5E3AA70;
  unint64_t v18 = a3;
  BOOL v19 = a4;
  id v11 = v8;
  id v16 = v11;
  uint64_t v17 = buf;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_36;
  v14[3] = &unk_1E5E3AA98;
  v14[4] = buf;
  [v10 performSynchronousServiceBlock:v15 errorHandler:v14];

  BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

uint64_t __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2;
  v6[3] = &unk_1E5E3A9A8;
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  return [a2 setCarPlayFeatures:v4 disabled:v2 forVehicleIdentifier:v3 reply:v6];
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = CarGeneralLogging();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    char v15 = 1;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2();
    }
    char v15 = 0;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v15;
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

- (unint64_t)supportedCarPlayFeaturesForSession:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CRFeatureAvailability supportedCarPlayFeaturesForSession:]();
  }

  id v6 = [v4 MFiCertificateSerialNumber];
  uint64_t v7 = [(CRFeatureAvailability *)self serviceClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke;
  v11[3] = &unk_1E5E3AAC0;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 performSynchronousServiceBlock:v11 errorHandler:&__block_literal_global_39];

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2;
  v4[3] = &unk_1E5E3A9F8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 supportedCarPlayFeaturesForCertificateSerial:v2 reply:v4];
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue];
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v8 = 134349056;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_INFO, "supportedFeaturesForSession: %{public}lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2_cold_1();
    }
  }
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_37_cold_1();
  }
}

- (id)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = __Block_byref_object_copy_;
  BOOL v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CRFeatureAvailability supportedAirPlayFeaturesForVehicleIdentifier:]();
  }

  id v6 = [(CRFeatureAvailability *)self serviceClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke;
  v12[3] = &unk_1E5E3AAC0;
  id v7 = v4;
  id v13 = v7;
  uint64_t v14 = &v15;
  [v6 performSynchronousServiceBlock:v12 errorHandler:&__block_literal_global_43];

  int v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v16[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "supportedAirPlayFeaturesForVehicleIdentifier: %{public}@", buf, 0xCu);
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2;
  v4[3] = &unk_1E5E3AAE8;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 supportedAirPlayFeaturesForVehicleIdentifier:v2 reply:v4];
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    int v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1();
    }
  }
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_41(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_41_cold_1();
  }
}

- (void)fetchSupportedAirPlayFeaturesForVehicleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CRFeatureAvailability fetchSupportedAirPlayFeaturesForVehicleIdentifier:completion:]();
  }

  uint64_t v9 = [(CRFeatureAvailability *)self serviceClient];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5E3AB38;
  id v15 = v6;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_44;
  v12[3] = &unk_1E5E3A910;
  id v13 = v16;
  id v10 = v16;
  id v11 = v6;
  [v9 performServiceBlock:v14 errorHandler:v12];
}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E5E3AB10;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 supportedAirPlayFeaturesForVehicleIdentifier:v3 reply:v4];
}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CarGeneralLogging();
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_41_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)isCarPlayAllowed
{
}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "isCarPlayAllowed call failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)deviceSupportedCarPlayFeatures
{
}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "deviceSupportedFeatures call failed: %{public}@", v2, v3, v4, v5, v6);
}

- (void)disablesCarPlayFeatures:(os_log_t)log forVehicleIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134349314;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1ABB00000, log, OS_LOG_TYPE_DEBUG, "CRFeatureAvailability disablesCarPlayFeatures: %{public}lu vehicleID: %@", (uint8_t *)&v3, 0x16u);
}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "disablesCarPlayFeatures call failed: %{public}@", v2, v3, v4, v5, v6);
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "setCarPlayFeaturesDisabled call failed: %@", v2, v3, v4, v5, v6);
}

- (void)supportedCarPlayFeaturesForSession:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1ABB00000, v0, v1, "CRFeatureAvailability supportedFeaturesForSession: %@", v2, v3, v4, v5, v6);
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "supportedFeaturesForSession: call failed: %{public}@", v2, v3, v4, v5, v6);
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "supportedFeaturesForSession call failed: %@", v2, v3, v4, v5, v6);
}

- (void)supportedAirPlayFeaturesForVehicleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1ABB00000, v0, v1, "CRFeatureAvailability supportedAirPlayFeaturesForVehicleIdentifier: %@", v2, v3, v4, v5, v6);
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier: call failed: %{public}@", v2, v3, v4, v5, v6);
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier call failed: %@", v2, v3, v4, v5, v6);
}

- (void)fetchSupportedAirPlayFeaturesForVehicleIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1ABB00000, v0, v1, "CRFeatureAvailability fetchSupportedAirPlayFeaturesForVehicleIdentifier: %@", v2, v3, v4, v5, v6);
}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1ABB00000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier: %{public}@", v2, v3, v4, v5, v6);
}

@end