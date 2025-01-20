@interface MDMSharedDefinitions
+ (id)oidsAnonymous:(BOOL)a3 nonce:(BOOL)a4 coresidency:(BOOL)a5;
@end

@implementation MDMSharedDefinitions

+ (id)oidsAnonymous:(BOOL)a3 nonce:(BOOL)a4 coresidency:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v9 = (id *)getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr;
  uint64_t v40 = getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr)
  {
    v10 = (void *)DeviceIdentityLibrary();
    v38[3] = (uint64_t)dlsym(v10, "kMAOptionsBAAOIDEDASEPOSVersion");
    getkMAOptionsBAAOIDEDASEPOSVersionSymbolLoc_ptr = v38[3];
    v9 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v9) {
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
  }
  id v11 = *v9;
  v43[0] = v11;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v12 = (id *)getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr;
  uint64_t v40 = getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr)
  {
    v13 = (void *)DeviceIdentityLibrary();
    v38[3] = (uint64_t)dlsym(v13, "kMAOptionsBAAOIDEDAFirmwareVersion");
    getkMAOptionsBAAOIDEDAFirmwareVersionSymbolLoc_ptr = v38[3];
    v12 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v12) {
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
  }
  id v14 = *v12;
  v43[1] = v14;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v15 = (id *)getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr;
  uint64_t v40 = getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr)
  {
    v16 = (void *)DeviceIdentityLibrary();
    v38[3] = (uint64_t)dlsym(v16, "kMAOptionsBAAOIDEDAOSVersion");
    getkMAOptionsBAAOIDEDAOSVersionSymbolLoc_ptr = v38[3];
    v15 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v15) {
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
  }
  id v17 = *v15;
  v43[2] = v17;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v18 = (id *)getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr;
  uint64_t v40 = getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr;
  if (!getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr)
  {
    v19 = (void *)DeviceIdentityLibrary();
    v38[3] = (uint64_t)dlsym(v19, "kMAOptionsBAAOIDEDAProductType");
    getkMAOptionsBAAOIDEDAProductTypeSymbolLoc_ptr = v38[3];
    v18 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v18) {
    +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
  }
  id v44 = *v18;
  v20 = (void *)MEMORY[0x1E4F1C978];
  id v21 = v44;
  v22 = [v20 arrayWithObjects:v43 count:4];

  v23 = [v8 arrayWithArray:v22];

  if (!a3)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v24 = (id *)getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr;
    uint64_t v40 = getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr)
    {
      v25 = (void *)DeviceIdentityLibrary();
      v38[3] = (uint64_t)dlsym(v25, "kMAOptionsBAAOIDEDASerialNumber");
      getkMAOptionsBAAOIDEDASerialNumberSymbolLoc_ptr = v38[3];
      v24 = (id *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v24) {
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
    }
    id v26 = *v24;
    id v41 = v26;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v27 = (id *)getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr;
    uint64_t v40 = getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr)
    {
      v28 = (void *)DeviceIdentityLibrary();
      v38[3] = (uint64_t)dlsym(v28, "kMAOptionsBAAOIDEDAUDID");
      getkMAOptionsBAAOIDEDAUDIDSymbolLoc_ptr = v38[3];
      v27 = (id *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v27) {
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
    }
    id v42 = *v27;
    v29 = (void *)MEMORY[0x1E4F1C978];
    id v30 = v42;
    v31 = [v29 arrayWithObjects:&v41 count:2];

    [v23 addObjectsFromArray:v31];
  }
  if (v5 && [MEMORY[0x1E4F5E780] isMDACoResidencyEnabled])
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v32 = (void *)getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr;
    uint64_t v40 = getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr)
    {
      v33 = (void *)DeviceIdentityLibrary();
      v38[3] = (uint64_t)dlsym(v33, "kMAOptionsBAAOIDEDAAttestationPublicKey");
      getkMAOptionsBAAOIDEDAAttestationPublicKeySymbolLoc_ptr = v38[3];
      v32 = (void *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v32) {
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
    }
    [v23 addObject:*v32];
  }
  if (v6)
  {
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    v34 = (void *)getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr;
    uint64_t v40 = getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr)
    {
      v35 = (void *)DeviceIdentityLibrary();
      v38[3] = (uint64_t)dlsym(v35, "kMAOptionsBAAOIDEDANonce");
      getkMAOptionsBAAOIDEDANonceSymbolLoc_ptr = v38[3];
      v34 = (void *)v38[3];
    }
    _Block_object_dispose(&v37, 8);
    if (!v34) {
      +[MDMSharedDefinitions oidsAnonymous:nonce:coresidency:]();
    }
    [v23 addObject:*v34];
  }

  return v23;
}

+ (void)oidsAnonymous:nonce:coresidency:.cold.1()
{
}

@end