@interface CARSession(Analytics)
- (id)analytics_dictionaryRepresentationWithVehicle:()Analytics;
@end

@implementation CARSession(Analytics)

- (id)analytics_dictionaryRepresentationWithVehicle:()Analytics
{
  id v4 = a3;
  v5 = [a1 configuration];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v7 = [v5 PPID];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"(no value)";
  }
  [v6 setObject:v9 forKeyedSubscript:@"ppid"];

  uint64_t v10 = [v5 name];
  v11 = (void *)v10;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  else {
    v12 = @"(no value)";
  }
  [v6 setObject:v12 forKeyedSubscript:@"name"];

  uint64_t v13 = [v5 modelName];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = @"(no value)";
  }
  [v6 setObject:v15 forKeyedSubscript:@"airplayModel"];

  uint64_t v16 = [v5 manufacturerName];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"(no value)";
  }
  [v6 setObject:v18 forKeyedSubscript:@"manufacturer"];

  uint64_t v19 = [v5 vehicleName];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = @"(no value)";
  }
  [v6 setObject:v21 forKeyedSubscript:@"iAPName"];

  uint64_t v22 = [v5 vehicleModelName];
  v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"(no value)";
  }
  [v6 setObject:v24 forKeyedSubscript:@"iAPModel"];

  uint64_t v25 = [v5 vehicleManufacturer];
  v26 = (void *)v25;
  if (v25) {
    v27 = (__CFString *)v25;
  }
  else {
    v27 = @"(no value)";
  }
  [v6 setObject:v27 forKeyedSubscript:@"iAPManufacturer"];

  uint64_t v28 = [v5 vehicleFirmwareVersion];
  v29 = (void *)v28;
  if (v28) {
    v30 = (__CFString *)v28;
  }
  else {
    v30 = @"(no value)";
  }
  [v6 setObject:v30 forKeyedSubscript:@"firmwareVersion"];

  uint64_t v31 = [v5 vehicleHardwareVersion];
  v32 = (void *)v31;
  if (v31) {
    v33 = (__CFString *)v31;
  }
  else {
    v33 = @"(no value)";
  }
  [v6 setObject:v33 forKeyedSubscript:@"hardwareVersion"];

  int v34 = [v5 supportsVehicleData];
  uint64_t v35 = MEMORY[0x263EFFA80];
  uint64_t v36 = MEMORY[0x263EFFA88];
  if (v34) {
    uint64_t v37 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v37 = MEMORY[0x263EFFA80];
  }
  [v6 setObject:v37 forKeyedSubscript:@"nextGenCarPlaySession"];
  v38 = NSNumber;
  int v39 = [v4 supportsWirelessCarPlay];
  int v40 = [v4 supportsUSBCarPlay];

  v41 = [v38 numberWithInt:(v40 + v39)];
  v42 = NSString;
  v43 = [v5 descriptionForTransportType];
  v44 = [v42 stringWithFormat:@"%@ %@", v43, v41];

  if (v44) {
    v45 = v44;
  }
  else {
    v45 = @"(no value)";
  }
  [v6 setObject:v45 forKeyedSubscript:@"transports"];
  v46 = [a1 systemNightMode];
  if (v46) {
    uint64_t v47 = v36;
  }
  else {
    uint64_t v47 = v35;
  }
  [v6 setObject:v47 forKeyedSubscript:@"systemNightMode"];

  uint64_t v48 = [v5 descriptionForLimitableUserInterfaces];
  v49 = (void *)v48;
  if (v48) {
    v50 = (__CFString *)v48;
  }
  else {
    v50 = @"(no value)";
  }
  [v6 setObject:v50 forKeyedSubscript:@"limitableUITypes"];

  [a1 voiceTriggerMode];
  uint64_t v51 = CARStringFromVoiceTriggerMode();
  v52 = (void *)v51;
  if (v51) {
    v53 = (__CFString *)v51;
  }
  else {
    v53 = @"(no value)";
  }
  [v6 setObject:v53 forKeyedSubscript:@"voiceTriggerMode"];

  v54 = [v5 screens];
  uint64_t v55 = [v54 count];
  v56 = [NSNumber numberWithInteger:v55];
  [v6 setObject:v56 forKeyedSubscript:@"screenCount"];

  if ([v5 vehicleSupportsDestinationSharing]) {
    uint64_t v57 = v36;
  }
  else {
    uint64_t v57 = v35;
  }
  [v6 setObject:v57 forKeyedSubscript:@"supportsDestinationSharing"];
  uint64_t v58 = [a1 sourceVersion];
  v59 = (void *)v58;
  if (v58) {
    v60 = (__CFString *)v58;
  }
  else {
    v60 = @"(no value)";
  }
  [v6 setObject:v60 forKeyedSubscript:@"SourceVersion"];

  v61 = [v5 screens];
  v62 = [v61 firstObject];

  if (v62)
  {
    uint64_t v63 = [v62 descriptionForPrimaryInteractionModel];
    v64 = (void *)v63;
    if (v63) {
      v65 = (__CFString *)v63;
    }
    else {
      v65 = @"(no value)";
    }
    [v6 setObject:v65 forKeyedSubscript:@"primaryInteraction"];

    uint64_t v66 = [v62 descriptionForAvailableInteractionModels];
    v67 = (void *)v66;
    if (v66) {
      v68 = (__CFString *)v66;
    }
    else {
      v68 = @"(no value)";
    }
    [v6 setObject:v68 forKeyedSubscript:@"availableInteractions"];

    if ([v62 supportsHighFidelityTouch]) {
      uint64_t v69 = v36;
    }
    else {
      uint64_t v69 = v35;
    }
    [v6 setObject:v69 forKeyedSubscript:@"supportsHiFiTouch"];
  }

  return v6;
}

@end