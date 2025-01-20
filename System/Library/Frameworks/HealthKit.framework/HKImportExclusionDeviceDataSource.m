@interface HKImportExclusionDeviceDataSource
+ (BOOL)isDeviceSerialNumberOnAllowedListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3;
+ (BOOL)isDeviceSerialNumberOnTIBListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3;
+ (BOOL)isDeviceTypeAllowedForHKFeatureIdentifierOxygenSaturationRecording:(id)a3;
- (BOOL)isDeviceSerialNumberOnPreImportExclusionList:(id)a3 featureIdentifier:(id)a4;
- (BOOL)isDeviceSerialNumberOnTIBList:(id)a3 featureIdentifier:(id)a4;
- (BOOL)isDeviceTypeNotOnImportExclusionList:(id)a3 featureIdentifier:(id)a4;
- (HKImportExclusionDeviceDataSource)initWithPairedDeviceRegistry:(id)a3;
- (NRPairedDeviceRegistry)pairedDeviceRegistry;
- (id)activePairedDevice;
- (id)isActiveWatchProdFusedWithBehavior:(id)a3;
- (id)isImportAllowedForActiveWatchWithBehavior:(id)a3 featureIdentifier:(id)a4;
@end

@implementation HKImportExclusionDeviceDataSource

+ (BOOL)isDeviceTypeAllowedForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  return [&unk_1EECE6780 containsObject:a3];
}

+ (BOOL)isDeviceSerialNumberOnAllowedListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
  size_t v4 = v32;
  int v5 = (char)v32;
  v6 = __p;
  if ((v32 & 0x80u) == 0) {
    p_p = (char *)&__p;
  }
  else {
    p_p = (char *)__p;
  }
  if ((v32 & 0x80u) != 0) {
    size_t v4 = v31;
  }
  unsigned __int16 v36 = 0;
  unsigned int v35 = 0;
  if (v4 == 10)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = p_p[v8] - 48;
      if (v10 > 0x29 || ((0x3D77DD802FFuLL >> v10) & 1) == 0) {
        break;
      }
      unint64_t v9 = qword_19C3D3440[v10] + 27 * v9;
      if (++v8 == 10)
      {
        for (uint64_t i = 5; i != -1; --i)
        {
          *((unsigned char *)&v35 + i) = v9;
          v9 >>= 8;
        }
        unint64_t v12 = v35 | ((unint64_t)v36 << 32);
        goto LABEL_15;
      }
    }
  }
  unint64_t v12 = 0;
LABEL_15:
  int v33 = v12;
  unsigned __int16 v34 = WORD2(v12);
  if (v5 < 0) {
    operator delete(v6);
  }
  if (v33 | v34)
  {
    unint64_t v13 = 107284;
    v14 = (char *)&hk_HKFeatureIdentifierOxygenSaturationRecording::allowed_encoded_serial_numbers;
    do
    {
      uint64_t v15 = 0;
      unint64_t v16 = v13 >> 1;
      v17 = &v14[6 * (v13 >> 1)];
      do
      {
        unsigned int v18 = v17[v15];
        unsigned int v19 = *((unsigned __int8 *)&v33 + v15);
      }
      while (v18 == v19 && v15++ != 5);
      v13 += ~v16;
      if (v18 < v19) {
        v14 = v17 + 6;
      }
      else {
        unint64_t v13 = v16;
      }
    }
    while (v13);
    if (v14 == (char *)&unk_19C3D343E)
    {
      BOOL v25 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      do
      {
        unsigned int v22 = *((unsigned __int8 *)&v33 + v21);
        unsigned int v23 = v14[v21];
      }
      while (v22 == v23 && v21++ != 5);
      BOOL v25 = v22 >= v23;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
    LOBYTE(v35) = 0;
    uint64_t v26 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::string_view const*,std::string_view const*,std::string,std::__identity,std::__less<void,void>>((uint64_t)&hk_HKFeatureIdentifierOxygenSaturationRecording::additional_allowed_serial_numbers, (uint64_t)&__block_descriptor_32_e35_v24__0__NSString_8__NSDictionary_16l, &__p);
    if ((_UNKNOWN *)v26 == &__block_descriptor_32_e35_v24__0__NSString_8__NSDictionary_16l)
    {
      BOOL v25 = 0;
    }
    else
    {
      if ((v32 & 0x80u) == 0) {
        v27 = &__p;
      }
      else {
        v27 = __p;
      }
      if ((v32 & 0x80u) == 0) {
        size_t v28 = v32;
      }
      else {
        size_t v28 = v31;
      }
      BOOL v25 = (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(*(const void **)v26, *(void *)(v26 + 8), v27, v28) << 24) < 1;
    }
    if ((char)v32 < 0) {
      operator delete(__p);
    }
  }

  return v25;
}

- (HKImportExclusionDeviceDataSource)initWithPairedDeviceRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKImportExclusionDeviceDataSource;
  v6 = [(HKImportExclusionDeviceDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairedDeviceRegistry, a3);
  }

  return v7;
}

- (id)isActiveWatchProdFusedWithBehavior:(id)a3
{
  id v4 = a3;
  if ([v4 isAppleWatch])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isProdFused"));
  }
  else
  {
    v6 = [(HKImportExclusionDeviceDataSource *)self activePairedDevice];
    if (v6)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2020000000;
      v7 = (void *)getNRDevicePropertySigningFuseSymbolLoc_ptr;
      uint64_t v13 = getNRDevicePropertySigningFuseSymbolLoc_ptr;
      if (!getNRDevicePropertySigningFuseSymbolLoc_ptr)
      {
        uint64_t v8 = (void *)NanoRegistryLibrary_3();
        v11[3] = (uint64_t)dlsym(v8, "NRDevicePropertySigningFuse");
        getNRDevicePropertySigningFuseSymbolLoc_ptr = v11[3];
        v7 = (void *)v11[3];
      }
      _Block_object_dispose(&v10, 8);
      if (!v7) {
        -[HKImportExclusionDeviceDataSource isActiveWatchProdFusedWithBehavior:]();
      }
      id v5 = [v6 valueForProperty:*v7];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)activePairedDevice
{
  v2 = [(HKImportExclusionDeviceDataSource *)self pairedDeviceRegistry];
  id v3 = [getNRPairedDeviceRegistryClass_0() activeDeviceSelectorBlock];
  id v4 = [v2 getDevicesMatching:v3];
  id v5 = [v4 firstObject];

  return v5;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  pairedDeviceRegistry = self->_pairedDeviceRegistry;
  if (pairedDeviceRegistry)
  {
    id v3 = pairedDeviceRegistry;
  }
  else
  {
    id v3 = [getNRPairedDeviceRegistryClass_0() sharedInstance];
  }

  return v3;
}

- (id)isImportAllowedForActiveWatchWithBehavior:(id)a3 featureIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isAppleWatch])
  {
    uint64_t v8 = [v6 currentDeviceProductType];
    objc_super v9 = [v6 currentDeviceSerialNumber];
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v10 = [(HKImportExclusionDeviceDataSource *)self activePairedDevice];
    if (!v10)
    {
      unint64_t v16 = 0;
      goto LABEL_23;
    }
    v11 = (void *)v10;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v12 = (void *)getNRDevicePropertyProductTypeSymbolLoc_ptr_1;
    uint64_t v23 = getNRDevicePropertyProductTypeSymbolLoc_ptr_1;
    if (!getNRDevicePropertyProductTypeSymbolLoc_ptr_1)
    {
      uint64_t v13 = (void *)NanoRegistryLibrary_3();
      v21[3] = (uint64_t)dlsym(v13, "NRDevicePropertyProductType");
      getNRDevicePropertyProductTypeSymbolLoc_ptr_1 = v21[3];
      uint64_t v12 = (void *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v12) {
      -[HKImportExclusionDeviceDataSource isImportAllowedForActiveWatchWithBehavior:featureIdentifier:]();
    }
    uint64_t v8 = [v11 valueForProperty:*v12];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v14 = (void *)getNRDevicePropertySerialNumberSymbolLoc_ptr;
    uint64_t v23 = getNRDevicePropertySerialNumberSymbolLoc_ptr;
    if (!getNRDevicePropertySerialNumberSymbolLoc_ptr)
    {
      uint64_t v15 = (void *)NanoRegistryLibrary_3();
      v21[3] = (uint64_t)dlsym(v15, "NRDevicePropertySerialNumber");
      getNRDevicePropertySerialNumberSymbolLoc_ptr = v21[3];
      v14 = (void *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v14) {
      -[HKImportExclusionDeviceDataSource isImportAllowedForActiveWatchWithBehavior:featureIdentifier:]();
    }
    objc_super v9 = [v11 valueForProperty:*v14];

    if (!v8) {
      goto LABEL_14;
    }
  }
  if ([(HKImportExclusionDeviceDataSource *)self isDeviceTypeNotOnImportExclusionList:v8 featureIdentifier:v7])
  {
    unint64_t v16 = (void *)MEMORY[0x1E4F1CC38];
LABEL_21:

    goto LABEL_22;
  }
LABEL_14:
  if (v9)
  {
    v17 = NSNumber;
    BOOL v18 = [(HKImportExclusionDeviceDataSource *)self isDeviceSerialNumberOnTIBList:v9 featureIdentifier:v7]|| [(HKImportExclusionDeviceDataSource *)self isDeviceSerialNumberOnPreImportExclusionList:v9 featureIdentifier:v7];
    unint64_t v16 = [v17 numberWithInt:v18];
    goto LABEL_21;
  }
  unint64_t v16 = (void *)MEMORY[0x1E4F1CC28];
LABEL_22:

LABEL_23:

  return v16;
}

- (BOOL)isDeviceTypeNotOnImportExclusionList:(id)a3 featureIdentifier:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"OxygenSaturationRecording"]) {
    char v6 = [(id)objc_opt_class() isDeviceTypeAllowedForHKFeatureIdentifierOxygenSaturationRecording:v5];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isDeviceSerialNumberOnTIBList:(id)a3 featureIdentifier:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"OxygenSaturationRecording"]) {
    char v6 = [(id)objc_opt_class() isDeviceSerialNumberOnTIBListForHKFeatureIdentifierOxygenSaturationRecording:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isDeviceSerialNumberOnPreImportExclusionList:(id)a3 featureIdentifier:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"OxygenSaturationRecording"]) {
    char v6 = [(id)objc_opt_class() isDeviceSerialNumberOnAllowedListForHKFeatureIdentifierOxygenSaturationRecording:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

+ (BOOL)isDeviceSerialNumberOnTIBListForHKFeatureIdentifierOxygenSaturationRecording:(id)a3
{
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
  size_t v4 = v32;
  int v5 = (char)v32;
  char v6 = __p;
  if ((v32 & 0x80u) == 0) {
    p_p = (char *)&__p;
  }
  else {
    p_p = (char *)__p;
  }
  if ((v32 & 0x80u) != 0) {
    size_t v4 = v31;
  }
  unsigned __int16 v36 = 0;
  unsigned int v35 = 0;
  if (v4 == 10)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = p_p[v8] - 48;
      if (v10 > 0x29 || ((0x3D77DD802FFuLL >> v10) & 1) == 0) {
        break;
      }
      unint64_t v9 = qword_19C3D4730[v10] + 27 * v9;
      if (++v8 == 10)
      {
        for (uint64_t i = 5; i != -1; --i)
        {
          *((unsigned char *)&v35 + i) = v9;
          v9 >>= 8;
        }
        unint64_t v12 = v35 | ((unint64_t)v36 << 32);
        goto LABEL_15;
      }
    }
  }
  unint64_t v12 = 0;
LABEL_15:
  int v33 = v12;
  unsigned __int16 v34 = WORD2(v12);
  if (v5 < 0) {
    operator delete(v6);
  }
  if (v33 | v34)
  {
    unint64_t v13 = 285;
    v14 = (char *)&hk_HKFeatureIdentifierOxygenSaturationRecording::allowed_encoded_serial_numbers_tib;
    do
    {
      uint64_t v15 = 0;
      unint64_t v16 = v13 >> 1;
      v17 = &v14[6 * (v13 >> 1)];
      do
      {
        unsigned int v18 = v17[v15];
        unsigned int v19 = *((unsigned __int8 *)&v33 + v15);
      }
      while (v18 == v19 && v15++ != 5);
      v13 += ~v16;
      if (v18 < v19) {
        v14 = v17 + 6;
      }
      else {
        unint64_t v13 = v16;
      }
    }
    while (v13);
    if (v14 == (char *)&unk_19C3D472C)
    {
      BOOL v25 = 0;
    }
    else
    {
      uint64_t v21 = 0;
      do
      {
        unsigned int v22 = *((unsigned __int8 *)&v33 + v21);
        unsigned int v23 = v14[v21];
      }
      while (v22 == v23 && v21++ != 5);
      BOOL v25 = v22 >= v23;
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 UTF8String]);
    LOBYTE(v35) = 0;
    uint64_t v26 = std::__lower_bound[abi:ne180100]<std::_ClassicAlgPolicy,std::string_view const*,std::string_view const*,std::string,std::__identity,std::__less<void,void>>((uint64_t)&hk_HKFeatureIdentifierOxygenSaturationRecording::additional_allowed_serial_numbers_tib, (uint64_t)HKConceptAttributeValueTrue, &__p);
    if ((__CFString **)v26 == HKConceptAttributeValueTrue)
    {
      BOOL v25 = 0;
    }
    else
    {
      if ((v32 & 0x80u) == 0) {
        v27 = &__p;
      }
      else {
        v27 = __p;
      }
      if ((v32 & 0x80u) == 0) {
        size_t v28 = v32;
      }
      else {
        size_t v28 = v31;
      }
      BOOL v25 = (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(*(const void **)v26, *(void *)(v26 + 8), v27, v28) << 24) < 1;
    }
    if ((char)v32 < 0) {
      operator delete(__p);
    }
  }

  return v25;
}

- (void)isActiveWatchProdFusedWithBehavior:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySigningFuse(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKImportExclusionDeviceDataSource.m", 22, @"%s", dlerror());

  __break(1u);
}

- (void)isImportAllowedForActiveWatchWithBehavior:featureIdentifier:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertyProductType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKImportExclusionDeviceDataSource.m", 20, @"%s", dlerror());

  __break(1u);
}

- (void)isImportAllowedForActiveWatchWithBehavior:featureIdentifier:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getNRDevicePropertySerialNumber(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"HKImportExclusionDeviceDataSource.m", 21, @"%s", dlerror());

  __break(1u);
}

@end