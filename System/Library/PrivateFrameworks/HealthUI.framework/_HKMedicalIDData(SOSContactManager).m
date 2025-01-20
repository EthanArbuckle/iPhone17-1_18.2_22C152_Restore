@interface _HKMedicalIDData(SOSContactManager)
- (uint64_t)consolidateSOSAndEmergencyContacts;
@end

@implementation _HKMedicalIDData(SOSContactManager)

- (uint64_t)consolidateSOSAndEmergencyContacts
{
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E4F29F58];
    uint64_t v8 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F58], OS_LOG_TYPE_DEFAULT)) {
      return v8;
    }
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "Contacts access not authorized, skipping SOS contact consolidation", (uint8_t *)v11, 2u);
    return 0;
  }
  if (!getSOSUtilitiesClass() || ([getSOSUtilitiesClass() isAllowedToMessageSOSContacts] & 1) != 0) {
    return 0;
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v2 = (void *)getSOSContactsManagerClass_softClass;
  uint64_t v15 = getSOSContactsManagerClass_softClass;
  if (!getSOSContactsManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getSOSContactsManagerClass_block_invoke;
    v11[3] = &unk_1E6D514F8;
    v11[4] = &v12;
    __getSOSContactsManagerClass_block_invoke((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  v3 = v2;
  _Block_object_dispose(&v12, 8);
  id v4 = objc_alloc_init(v3);
  if (!v4) {
    return 0;
  }
  v5 = v4;
  v6 = [a1 consolidatedSOSContactsWithSOSContactsManager:v4];
  v7 = (void *)[v6 mutableCopy];

  [a1 setEmergencyContacts:v7];
  uint64_t v8 = 1;
  [getSOSUtilitiesClass() setAllowedToMessageSOSContacts:1];

  return v8;
}

@end