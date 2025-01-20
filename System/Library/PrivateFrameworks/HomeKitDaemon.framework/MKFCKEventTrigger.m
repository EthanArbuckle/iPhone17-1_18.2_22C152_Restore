@interface MKFCKEventTrigger
+ (id)cloudUserWithModelID:(void *)a3 home:;
+ (id)fetchRequest;
+ (id)localUserWithModelID:(void *)a3 home:;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (_MKFCharacteristicRangeEvent)_decodeEventCharacteristicWithEntity:(void *)a3 eventDictionary:(void *)a4 trigger:(void *)a5 context:;
- (_MKFLocationEvent)_decodeEventLocation:(void *)a3 trigger:(void *)a4 context:;
- (_MKFPresenceEvent)_decodeEventPresence:(void *)a3 trigger:(void *)a4 context:;
- (_MKFSignificantTimeEvent)_decodeEventSignificantTime:(void *)a3 context:;
- (id)_decodeCharacteristicValueForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:;
- (id)_decodeDataForKey:(void *)a3 dictionary:(unsigned char *)a4 success:;
- (id)_decodeDataForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:;
- (id)_decodeDateComponentsData:(void *)a1;
- (id)_decodeEventAttributeValue:(id)a3 trigger:(id)a4 context:(id)a5;
- (id)_decodeEventDictionary:(id)a3 localModel:(id)a4 context:(id)a5;
- (id)_decodeNumberForKey:(void *)a3 dictionary:(unsigned char *)a4 success:;
- (id)_decodeStringForKey:(void *)a3 dictionary:(unsigned char *)a4 success:;
- (id)_decodeUUIDForKey:(void *)a3 dictionary:(unsigned char *)a4 success:;
- (id)_decodeValueForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:;
- (id)_encodeEvent:(id)a3 encodedEventInCloud:(id)a4 accessories:(id)a5 users:(id)a6 guests:(id)a7 shouldRemoveEvent:(BOOL *)a8 context:(id)a9;
- (id)_encodeEventAttributeValue:(id)a3 accessories:(id)a4 context:(id)a5;
- (id)_encodeEventCharacteristic:(void *)a3 accessories:(void *)a4 context:;
- (id)_encodeEventPresence:(void *)a3 users:(void *)a4 guests:(unsigned char *)a5 shouldRemoveEvent:(void *)a6 context:;
- (id)_encodeEventSignificantTime:(uint64_t)a1 context:(void *)a2;
@end

@implementation MKFCKEventTrigger

- (id)_encodeEventSignificantTime:(uint64_t)a1 context:(void *)a2
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 offsetSeconds];
    v6 = HMDTimeOffsetToDateComponents([v5 integerValue], 0);

    if (v6)
    {
      v14[0] = @"ST";
      v13[0] = @"TEt";
      v13[1] = @"TESs";
      v7 = [v4 significantEvent];
      v14[1] = v7;
      v13[2] = @"TESo";
      v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
      v14[2] = v8;
      v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    }
    else
    {
      v12[0] = @"ST";
      v11[0] = @"TEt";
      v11[1] = @"TESs";
      v7 = [v4 significantEvent];
      v12[1] = v7;
      v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_MKFSignificantTimeEvent)_decodeEventSignificantTime:(void *)a3 context:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    char v24 = 1;
    v7 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, @"TEm", v5, &v24);
    v8 = -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](a1, @"TESs", v5, &v24);
    v9 = -[MKFCKEventTrigger _decodeDataForKey:dictionary:optional:success:](a1, @"TESo", v5, 1, &v24);
    if (v24)
    {
      if (HMIsValidSignificantEvent())
      {
        if (v9)
        {
          v10 = NSNumber;
          v11 = -[MKFCKEventTrigger _decodeDateComponentsData:](a1, v9);
          v12 = objc_msgSend(v10, "numberWithInteger:", HMDTimeOffsetFromDateComponents(v11, 0));
        }
        else
        {
          v12 = 0;
        }
        v17 = +[_MKFModel modelWithModelID:v7 context:v6];
        if (!v17)
        {
          v17 = [[_MKFSignificantTimeEvent alloc] initWithContext:v6];
          [(_MKFSignificantTimeEvent *)v17 setModelID:v7];
          v18 = [a1 writerTimestamp];
          [(_MKFSignificantTimeEvent *)v17 setWriterTimestamp:v18];
        }
        v19 = [(_MKFSignificantTimeEvent *)v17 significantEvent];
        char v20 = HMFEqualObjects();

        if ((v20 & 1) == 0) {
          [(_MKFSignificantTimeEvent *)v17 setSignificantEvent:v8];
        }
        v21 = [(_MKFSignificantTimeEvent *)v17 offsetSeconds];
        char v22 = HMFEqualObjects();

        if ((v22 & 1) == 0) {
          [(_MKFSignificantTimeEvent *)v17 setOffsetSeconds:v12];
        }

        goto LABEL_18;
      }
      v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v26 = v16;
        __int16 v27 = 2112;
        v28 = v8;
        __int16 v29 = 2112;
        id v30 = v5;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown value '%@' for significant event: %@", buf, 0x20u);
      }
    }
    v17 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (id)_decodeEventAttributeValue:(id)a3 trigger:(id)a4 context:(id)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_MKFMatterAttributeValueEvent entity];
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  if (self)
  {
    char v71 = 1;
    v15 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, @"TEm", v12, &v71);
    uint64_t v16 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, @"TEATam", v12, &v71);
    v69 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, @"TEATmpm", v12, &v71);
    v67 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, @"TEATa", v12, &v71);
    v66 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, @"TEATc", v12, &v71);
    v65 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, @"TEATe", v12, &v71);
    v68 = (void *)v16;
    if (!v71)
    {
      v33 = (void *)MEMORY[0x230FBD990]();
      v34 = self;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v73 = v36;
        __int16 v74 = 2112;
        uint64_t v75 = (uint64_t)v12;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode attribute event from dictionary %@", buf, 0x16u);
      }
      v37 = 0;
      goto LABEL_45;
    }
    v17 = [v13 home];
    v18 = [v17 accessoryWithModelID:v16 context:v14];

    if (!v18)
    {
      v38 = (void *)MEMORY[0x230FBD990]();
      v39 = self;
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v73 = v41;
        __int16 v74 = 2160;
        uint64_t v75 = 1752392040;
        __int16 v76 = 2112;
        id v77 = v68;
        __int16 v78 = 2112;
        id v79 = v12;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory '%{mask.hash}@' matching event: %@", buf, 0x2Au);
      }
      v37 = 0;
      goto LABEL_44;
    }
    v64 = v15;
    id v19 = v18;
    objc_opt_class();
    int v20 = objc_opt_isKindOfClass() & 1;
    if (v20) {
      v21 = v19;
    }
    else {
      v21 = 0;
    }
    id v63 = v21;

    if (!v20)
    {
      v42 = (void *)MEMORY[0x230FBD990]();
      v43 = self;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v73 = v45;
        __int16 v74 = 2112;
        uint64_t v75 = (uint64_t)v19;
        __int16 v76 = 2112;
        id v77 = v12;
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a matter accessory in event: %@", buf, 0x20u);
      }
      v37 = 0;
      v46 = v63;
      v15 = v64;
      goto LABEL_43;
    }
    uint64_t v22 = [v19 findMatterPathsRelationWithModelID:v69];
    if (!v22)
    {
      v23 = [[_MKFMatterPath alloc] initWithContext:v14];
      [(_MKFMatterPath *)v23 setAttributeID:v67];
      [(_MKFMatterPath *)v23 setClusterID:v66];
      [(_MKFMatterPath *)v23 setEndpointID:v65];
      [(_MKFMatterPath *)v23 setModelID:v69];
      [(_MKFMatterPath *)v23 setAccessory:v19];
      char v70 = 0;
      char v24 = v23;
      id v25 = (id)[v19 materializeOrCreateMatterPathsRelationWithModelID:v69 createdNew:&v70];
      if (!v70)
      {
        v61 = v24;
        v47 = (void *)MEMORY[0x230FBD990](v25);
        v48 = self;
        v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v73 = v50;
          __int16 v74 = 2112;
          uint64_t v75 = (uint64_t)v69;
          __int16 v76 = 2112;
          id v77 = v19;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Unable to create relationship for matterPathModelID %@ on accessory %@", buf, 0x20u);
        }
        v37 = 0;
        uint64_t v31 = v61;
        v62 = v61;
        goto LABEL_35;
      }
      [v19 addMatterPathsObject:v24];

      uint64_t v22 = (uint64_t)v24;
    }
    v62 = (void *)v22;
    v26 = +[_MKFMatterAttributeValueEvent entity];
    int v27 = [v11 isEqual:v26];

    if (!v27)
    {
      v37 = 0;
      v46 = v63;
      v15 = v64;
LABEL_42:

LABEL_43:
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
    v28 = @"TEATv";
    id v60 = v12;
    uint64_t v29 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](self, @"TEATv", v60, 0, &v71);
    id v30 = (void *)v29;
    uint64_t v31 = 0;
    if (v29 && *MEMORY[0x263EFFD08] != v29)
    {
      if ((isAllowedCharType() & 1) == 0)
      {
        context = (void *)MEMORY[0x230FBD990]();
        v59 = self;
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v73 = v52;
          __int16 v74 = 2114;
          uint64_t v75 = @"TEATv";
          __int16 v76 = 2112;
          id v77 = v60;
          _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", buf, 0x20u);
        }
        uint64_t v31 = 0;
        char v71 = 0;
        BOOL v32 = 1;
        goto LABEL_33;
      }
      uint64_t v31 = v30;
    }
    BOOL v32 = v71 == 0;
LABEL_33:

    if (!v32)
    {
      v37 = +[_MKFModel modelWithModelID:v64 context:v14];
      if (!v37)
      {
        v37 = [[_MKFMatterAttributeValueEvent alloc] initWithContext:v14];
        [(_MKFMatterAttributeValueEvent *)v37 setModelID:v64];
        v53 = [(MKFCKEventTrigger *)self writerTimestamp];
        [(_MKFMatterAttributeValueEvent *)v37 setWriterTimestamp:v53];

        [(_MKFMatterAttributeValueEvent *)v37 setMatterPath:v62];
      }
      v54 = [(_MKFMatterAttributeValueEvent *)v37 eventValue];
      v55 = v31;
      char v56 = HMFEqualObjects();

      v46 = v63;
      if ((v56 & 1) == 0) {
        [(_MKFMatterAttributeValueEvent *)v37 setEventValue:v55];
      }
      uint64_t v31 = v55;
      goto LABEL_41;
    }
    v37 = 0;
LABEL_35:
    v46 = v63;
LABEL_41:

    v15 = v64;
    goto LABEL_42;
  }
  v37 = 0;
LABEL_46:

  return v37;
}

- (id)_encodeEventAttributeValue:(id)a3 accessories:(id)a4 context:(id)a5
{
  v33[5] = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v31 = v8;
  if (self)
  {
    id v9 = v8;
    id v10 = a5;
    id v11 = a4;
    id v12 = v9;
    id v13 = [v12 matterPath];
    uint64_t v29 = [v13 modelID];

    id v14 = [v12 matterPath];
    v15 = [v14 accessory];
    uint64_t v16 = [v15 modelID];

    id v30 = -[MKFCKHomeObject _accessoryWithModelID:context:](self, v16, v10);

    [v11 addObject:v30];
    v17 = (void *)MEMORY[0x263EFF9A0];
    v32[0] = @"TEATam";
    v32[1] = @"TEATmpm";
    v33[0] = v16;
    v33[1] = v29;
    v32[2] = @"TEATa";
    v18 = [v12 matterPath];
    id v19 = [v18 attributeID];
    v33[2] = v19;
    v32[3] = @"TEATc";
    int v20 = [v12 matterPath];
    v21 = [v20 clusterID];
    v33[3] = v21;
    v32[4] = @"TEATe";
    uint64_t v22 = [v12 matterPath];

    v23 = [v22 endpointID];
    v33[4] = v23;
    char v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
    id v25 = [v17 dictionaryWithDictionary:v24];

    if (v25)
    {
      v26 = [v12 eventValue];
      [v25 setObject:v26 forKeyedSubscript:@"TEATv"];

      [v25 setObject:@"AV" forKeyedSubscript:@"TEt"];
      int v27 = (void *)[v25 copy];
      goto LABEL_6;
    }
  }
  else
  {
    id v25 = 0;
  }
  int v27 = 0;
LABEL_6:

  return v27;
}

- (id)_encodeEventCharacteristic:(void *)a3 accessories:(void *)a4 context:
{
  v23[3] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = [v9 service];
  id v11 = [v10 accessory];
  id v12 = [v11 modelID];

  id v13 = -[MKFCKHomeObject _accessoryWithModelID:context:](a1, v12, v7);

  [v8 addObject:v13];
  id v14 = (void *)MEMORY[0x263EFF9A0];
  v22[0] = @"TEAm";
  v15 = [v13 modelID];
  v23[0] = v15;
  v22[1] = @"TEAs";
  uint64_t v16 = [v9 service];
  v17 = [v16 instanceID];
  v23[1] = v17;
  v22[2] = @"TEAc";
  v18 = [v9 characteristicID];

  v23[2] = v18;
  id v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  int v20 = [v14 dictionaryWithDictionary:v19];

  return v20;
}

- (_MKFCharacteristicRangeEvent)_decodeEventCharacteristicWithEntity:(void *)a3 eventDictionary:(void *)a4 trigger:(void *)a5 context:
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v87 = 1;
  id v13 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, @"TEm", v10, &v87);
  id v14 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, @"TEAm", v10, &v87);
  v15 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, @"TEAs", v10, &v87);
  uint64_t v16 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, @"TEAc", v10, &v87);
  if (!v87)
  {
    v26 = 0;
    goto LABEL_48;
  }
  id v86 = v16;
  v17 = [v11 home];
  v18 = [v17 accessoryWithModelID:v14 context:v12];

  v85 = v18;
  if (!v18)
  {
    v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = a1;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v82 = v15;
      v37 = id v36 = v9;
      *(_DWORD *)buf = 138544130;
      v89 = v37;
      __int16 v90 = 2160;
      uint64_t v91 = 1752392040;
      __int16 v92 = 2112;
      id v93 = v14;
      __int16 v94 = 2112;
      id v95 = v10;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory '%{mask.hash}@' matching event: %@", buf, 0x2Au);

      id v9 = v36;
      v15 = v82;
    }

    v26 = 0;
    goto LABEL_47;
  }
  id v19 = v18;
  objc_opt_class();
  int v20 = objc_opt_isKindOfClass() & 1;
  if (v20) {
    v21 = v19;
  }
  else {
    v21 = 0;
  }
  id v84 = v21;

  if (!v20)
  {
    id v78 = v12;
    v38 = v14;
    id v39 = v11;
    v40 = v13;
    id v41 = v9;
    v42 = (void *)MEMORY[0x230FBD990]();
    id v43 = a1;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = v83 = v15;
      *(_DWORD *)buf = 138543874;
      v89 = v45;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v19;
      __int16 v92 = 2112;
      id v93 = v10;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Accessory %@ is not a HAP accessory in event: %@", buf, 0x20u);

      v15 = v83;
    }

    v26 = 0;
    id v9 = v41;
    id v13 = v40;
    id v11 = v39;
    id v14 = v38;
    id v12 = v78;
    goto LABEL_46;
  }
  id v77 = [v19 serviceWithID:v15 context:v12];
  if (!v77)
  {
    id v79 = v12;
    v46 = v14;
    id v47 = v11;
    v48 = v13;
    id v49 = v9;
    v50 = (void *)MEMORY[0x230FBD990]();
    id v51 = a1;
    v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = v53 = v15;
      *(_DWORD *)buf = 138543618;
      v89 = v54;
      __int16 v90 = 2112;
      uint64_t v91 = (uint64_t)v10;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Could not find service matching event: %@", buf, 0x16u);

      v15 = v53;
    }

    v26 = 0;
    id v9 = v49;
    id v13 = v48;
    id v11 = v47;
    id v14 = v46;
    id v12 = v79;
    goto LABEL_45;
  }
  v81 = v15;
  uint64_t v22 = +[_MKFCharacteristicRangeEvent entity];
  int v23 = [v9 isEqual:v22];

  if (v23)
  {
    uint64_t v24 = -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, @"TEAn", v10, 1, &v87);
    uint64_t v25 = -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, @"TEAx", v10, 1, &v87);
    if (v87)
    {
      __int16 v74 = (void *)v25;
      uint64_t v75 = (void *)v24;
      if (v24 | v25)
      {
        v26 = +[_MKFModel modelWithModelID:v13 context:v12];
        if (!v26)
        {
          v26 = [[_MKFCharacteristicRangeEvent alloc] initWithContext:v12];
          [(_MKFCharacteristicRangeEvent *)v26 setModelID:v13];
          int v27 = [a1 writerTimestamp];
          [(_MKFCharacteristicRangeEvent *)v26 setWriterTimestamp:v27];
        }
        v28 = [(_MKFCharacteristicRangeEvent *)v26 min];
        char v29 = HMFEqualObjects();

        if ((v29 & 1) == 0) {
          [(_MKFCharacteristicRangeEvent *)v26 setMin:v75];
        }
        id v30 = [(_MKFCharacteristicRangeEvent *)v26 max];
        char v31 = HMFEqualObjects();

        if ((v31 & 1) == 0) {
          [(_MKFCharacteristicRangeEvent *)v26 setMax:v74];
        }

        BOOL v32 = v75;
LABEL_34:

        v61 = [(_MKFCharacteristicRangeEvent *)v26 service];
        char v62 = HMFEqualObjects();

        if ((v62 & 1) == 0) {
          [(_MKFCharacteristicRangeEvent *)v26 setService:v77];
        }
        id v63 = [(_MKFCharacteristicRangeEvent *)v26 characteristicID];
        char v64 = HMFEqualObjects();

        if ((v64 & 1) == 0) {
          [(_MKFCharacteristicRangeEvent *)v26 setCharacteristicID:v86];
        }
        goto LABEL_44;
      }
      id v80 = v12;
      v65 = v14;
      id v66 = v11;
      v67 = v13;
      id v68 = v9;
      v69 = (void *)MEMORY[0x230FBD990]();
      id v70 = a1;
      char v71 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        v72 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v72;
        __int16 v90 = 2112;
        uint64_t v91 = (uint64_t)v10;
        _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode any range values in event: %@", buf, 0x16u);
      }
      id v9 = v68;
      id v13 = v67;
      id v11 = v66;
      id v14 = v65;
      id v12 = v80;
      uint64_t v25 = (uint64_t)v74;
      uint64_t v24 = (uint64_t)v75;
    }
  }
  else
  {
    v55 = +[_MKFCharacteristicValueEvent entity];
    int v56 = [v9 isEqual:v55];

    if (v56)
    {
      v57 = -[MKFCKEventTrigger _decodeCharacteristicValueForKey:dictionary:optional:success:](a1, @"TEAv", v10, 0, &v87);
      if (v87)
      {
        __int16 v76 = v57;
        v26 = +[_MKFModel modelWithModelID:v13 context:v12];
        if (!v26)
        {
          v26 = [[_MKFCharacteristicValueEvent alloc] initWithContext:v12];
          [(_MKFCharacteristicRangeEvent *)v26 setModelID:v13];
          v58 = [a1 writerTimestamp];
          [(_MKFCharacteristicRangeEvent *)v26 setWriterTimestamp:v58];
        }
        v59 = [(_MKFCharacteristicRangeEvent *)v26 eventValue];
        BOOL v32 = v76;
        char v60 = HMFEqualObjects();

        if ((v60 & 1) == 0) {
          [(_MKFCharacteristicRangeEvent *)v26 setEventValue:v76];
        }
        goto LABEL_34;
      }
    }
  }
  v26 = 0;
LABEL_44:
  v15 = v81;
LABEL_45:

LABEL_46:
LABEL_47:

  uint64_t v16 = v86;
LABEL_48:

  return v26;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  v55.receiver = self;
  v55.super_class = (Class)MKFCKEventTrigger;
  if ([(MKFCKTrigger *)&v55 exportFromLocalModel:v8 updatedProperties:v9 context:v10])
  {
    if ([(MKFCKModel *)self shouldExportUpdatedPropertyInSet:v9 name:@"events_"])
    {
      id v48 = v8;
      id v49 = v11;
      id v12 = v8;
      id v13 = v10;
      if (self)
      {
        id v14 = (void *)MEMORY[0x263EFF9C0];
        v15 = [v12 events];
        v50 = objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));

        v53 = [MEMORY[0x263EFF9C0] set];
        uint64_t v16 = [MEMORY[0x263EFF9C0] set];
        v17 = [MEMORY[0x263EFF9C0] set];
        v18 = objc_msgSend(v13, "hmd_currentChangeSet");
        id v19 = v12;
        int v20 = (void *)MEMORY[0x263EFF9A0];
        v21 = [(MKFCKEventTrigger *)self events];
        uint64_t v22 = objc_msgSend(v20, "dictionaryWithCapacity:", objc_msgSend(v21, "count"));

        int v23 = [(MKFCKEventTrigger *)self events];
        v72[0] = MEMORY[0x263EF8330];
        v72[1] = 3221225472;
        v72[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke;
        v72[3] = &unk_264A2F140;
        id v46 = v18;
        id v73 = v46;
        id v24 = v22;
        id v74 = v24;
        objc_msgSend(v23, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v72);

        uint64_t v68 = 0;
        v69 = &v68;
        uint64_t v70 = 0x2020000000;
        char v71 = 1;
        id v47 = v19;
        uint64_t v25 = [v19 events];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_2;
        v59[3] = &unk_264A24A20;
        id v26 = v24;
        id v60 = v26;
        v61 = self;
        id v54 = v53;
        id v62 = v54;
        id v52 = v16;
        id v63 = v52;
        id v27 = v17;
        id v64 = v27;
        id v65 = v13;
        v67 = &v68;
        id v28 = v50;
        id v66 = v28;
        objc_msgSend(v25, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v59);

        BOOL v29 = *((unsigned char *)v69 + 24) != 0;
        if (*((unsigned char *)v69 + 24))
        {
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_3;
          v56[3] = &unk_264A2F190;
          id v30 = v28;
          id v57 = v30;
          v58 = self;
          [v26 enumerateKeysAndObjectsUsingBlock:v56];
          id v45 = v28;
          id v31 = v26;
          BOOL v32 = (void *)MEMORY[0x263EFFA08];
          v33 = [(MKFCKEventTrigger *)self events];
          id v51 = [v32 setWithArray:v33];

          if ((HMFEqualObjects() & 1) == 0)
          {
            id v34 = [v30 allObjects];
            [(MKFCKEventTrigger *)self setEvents:v34];
          }
          v35 = [(MKFCKEventTrigger *)self accessories];
          char v36 = HMFEqualObjects();

          if ((v36 & 1) == 0)
          {
            v37 = (void *)[v54 copy];
            [(MKFCKEventTrigger *)self setAccessories:v37];
          }
          v38 = [(MKFCKEventTrigger *)self users];
          char v39 = HMFEqualObjects();

          if ((v39 & 1) == 0)
          {
            v40 = (void *)[v52 copy];
            [(MKFCKEventTrigger *)self setUsers:v40];
          }
          id v41 = [(MKFCKEventTrigger *)self guests];
          char v42 = HMFEqualObjects();

          if ((v42 & 1) == 0)
          {
            id v43 = (void *)[v27 copy];
            [(MKFCKEventTrigger *)self setGuests:v43];
          }
          id v26 = v31;
          id v28 = v45;
        }

        _Block_object_dispose(&v68, 8);
        id v12 = v47;
      }
      else
      {
        BOOL v29 = 0;
      }

      id v8 = v48;
      id v11 = v49;
    }
    else
    {
      BOOL v29 = 1;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 objectForKeyedSubscript:@"TEm"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) deletedModelIDs];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
  }
}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  char v14 = 0;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v6 modelID];
  id v8 = [v5 objectForKeyedSubscript:v7];

  id v9 = [*(id *)(a1 + 40) _encodeEvent:v6 encodedEventInCloud:v8 accessories:*(void *)(a1 + 48) users:*(void *)(a1 + 56) guests:*(void *)(a1 + 64) shouldRemoveEvent:&v14 context:*(void *)(a1 + 72)];
  id v10 = *(void **)(a1 + 32);
  id v11 = [v6 modelID];

  [v10 removeObjectForKey:v11];
  if (v9)
  {
    id v12 = *(void **)(a1 + 80);
    id v13 = (void *)[v9 copy];
    [v12 addObject:v13];
  }
  else if (!v14)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __57__MKFCKEventTrigger__exportEventsFromLocalModel_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) addObject:v6]);
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v6 objectForKeyedSubscript:@"TEt"];
    int v12 = 138543874;
    id v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Found new event type [%{public}@] not supported by this software. Adding it back to cloud: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)MKFCKEventTrigger;
  if ([(MKFCKTrigger *)&v23 importIntoLocalModel:v8 updatedProperties:a4 context:v9])
  {
    id v10 = v8;
    id v11 = v9;
    BOOL v12 = self != 0;
    if (self)
    {
      id v13 = (void *)MEMORY[0x263EFF9C0];
      __int16 v14 = [(MKFCKEventTrigger *)self events];
      v15 = objc_msgSend(v13, "setWithCapacity:", objc_msgSend(v14, "count"));

      __int16 v16 = [(MKFCKEventTrigger *)self events];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke;
      v27[3] = &unk_264A2F0F0;
      v27[4] = self;
      id v17 = v10;
      id v28 = v17;
      id v18 = v11;
      id v29 = v18;
      id v19 = v15;
      id v30 = v19;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);

      int v20 = [v17 events];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke_2;
      v24[3] = &unk_264A24A48;
      id v25 = v19;
      id v26 = v18;
      id v21 = v19;
      objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _decodeEventDictionary:a2 localModel:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  if (v3)
  {
    id v4 = v3;
    [v3 setTrigger:*(void *)(a1 + 40)];
    [*(id *)(a1 + 56) addObject:v4];
    id v3 = v4;
  }
}

void __57__MKFCKEventTrigger__importEventsIntoLocalModel_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

- (id)_decodeEventDictionary:(id)a3 localModel:(id)a4 context:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v44 = 1;
  id v11 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, @"TEd", v8, &v44);
  BOOL v12 = -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](self, @"TEt", v8, &v44);
  if (!v44)
  {
    id v21 = 0;
    id v15 = v11;
    goto LABEL_37;
  }
  int v13 = [v11 BOOLValue];
  __int16 v14 = (void *)MEMORY[0x263EFFA80];
  if (v13) {
    __int16 v14 = (void *)MEMORY[0x263EFFA88];
  }
  id v15 = v14;

  id v43 = v10;
  if ([v12 isEqualToString:@"C"])
  {
    id v42 = v9;
    id v16 = v10;
    if (self)
    {
      buf[0] = 1;
      id v17 = v8;
      id v18 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, @"TEm", v17, buf);
      id v19 = -[MKFCKEventTrigger _decodeDataForKey:dictionary:success:](self, @"TECd", v17, buf);

      if (buf[0])
      {
        int v20 = -[MKFCKEventTrigger _decodeDateComponentsData:](self, v19);
        if (v20)
        {
          id v21 = +[_MKFModel modelWithModelID:v18 context:v16];
          if (!v21)
          {
            id v21 = [[_MKFCalendarEvent alloc] initWithContext:v16];
            [(_MKFCalendarEvent *)v21 setModelID:v18];
            uint64_t v22 = [(MKFCKEventTrigger *)self writerTimestamp];
            [(_MKFCalendarEvent *)v21 setWriterTimestamp:v22];
          }
          objc_super v23 = [(_MKFCalendarEvent *)v21 fireDateComponents];
          char v24 = HMFEqualObjects();

          if ((v24 & 1) == 0) {
            [(_MKFCalendarEvent *)v21 setFireDateComponents:v20];
          }
        }
        else
        {
          id v21 = 0;
        }

        goto LABEL_33;
      }
LABEL_30:
      id v21 = 0;
LABEL_33:

      goto LABEL_34;
    }
    goto LABEL_55;
  }
  if ([v12 isEqualToString:@"CR"])
  {
    if (self)
    {
      id v25 = _MKFCharacteristicRangeEvent;
      goto LABEL_20;
    }
    goto LABEL_54;
  }
  if ([v12 isEqualToString:@"CV"])
  {
    if (self)
    {
      id v25 = _MKFCharacteristicValueEvent;
LABEL_20:
      id v26 = v10;
      id v27 = v9;
      id v28 = v8;
      id v29 = [(__objc2_class *)v25 entity];
      -[MKFCKEventTrigger _decodeEventCharacteristicWithEntity:eventDictionary:trigger:context:](self, v29, v28, v27, v26);
      id v21 = (_MKFCalendarEvent *)objc_claimAutoreleasedReturnValue();

      if (!v21) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    goto LABEL_54;
  }
  if ([v12 isEqualToString:@"D"])
  {
    id v42 = v9;
    id v16 = v10;
    if (self)
    {
      buf[0] = 1;
      id v30 = v8;
      id v18 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](self, @"TEm", v30, buf);
      id v19 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](self, @"TEDd", v30, buf);

      if (buf[0])
      {
        id v21 = +[_MKFModel modelWithModelID:v18 context:v16];
        if (!v21)
        {
          id v21 = [[_MKFDurationEvent alloc] initWithContext:v16];
          [(_MKFCalendarEvent *)v21 setModelID:v18];
          id v31 = [(MKFCKEventTrigger *)self writerTimestamp];
          [(_MKFCalendarEvent *)v21 setWriterTimestamp:v31];
        }
        BOOL v32 = [(_MKFCalendarEvent *)v21 duration];
        char v33 = HMFEqualObjects();

        if ((v33 & 1) == 0) {
          [(_MKFCalendarEvent *)v21 setDuration:v19];
        }
        goto LABEL_33;
      }
      goto LABEL_30;
    }
LABEL_55:
    id v21 = 0;
LABEL_34:

    id v9 = v42;
    if (!v21)
    {
LABEL_36:
      id v10 = v43;
      goto LABEL_37;
    }
LABEL_35:
    [(_MKFCalendarEvent *)v21 setEndEvent:v15];
    goto LABEL_36;
  }
  if ([v12 isEqualToString:@"L"])
  {
    uint64_t v35 = -[MKFCKEventTrigger _decodeEventLocation:trigger:context:](self, v8, v9, v10);
    goto LABEL_49;
  }
  if ([v12 isEqualToString:@"P"])
  {
    uint64_t v35 = -[MKFCKEventTrigger _decodeEventPresence:trigger:context:](self, v8, v9, v10);
    goto LABEL_49;
  }
  if ([v12 isEqualToString:@"ST"])
  {
    uint64_t v35 = -[MKFCKEventTrigger _decodeEventSignificantTime:context:](self, v8, v10);
    goto LABEL_49;
  }
  if (![v12 isEqualToString:@"AV"])
  {
    v38 = (void *)MEMORY[0x230FBD990]();
    char v39 = self;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v46 = v41;
      __int16 v47 = 2114;
      id v48 = v12;
      __int16 v49 = 2112;
      id v50 = v8;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unknown event type '%{public}@', ignoring: %@", buf, 0x20u);
    }
    goto LABEL_54;
  }
  char v36 = +[HMDCoreData featuresDataSource];
  int v37 = [v36 isRVCEnabled];

  if (v37)
  {
    uint64_t v35 = [(MKFCKEventTrigger *)self _decodeEventAttributeValue:v8 trigger:v9 context:v10];
LABEL_49:
    id v21 = (_MKFCalendarEvent *)v35;
    if (!v35) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_54:
  id v21 = 0;
LABEL_37:

  return v21;
}

- (id)_decodeNumberForKey:(void *)a3 dictionary:(unsigned char *)a4 success:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
      objc_opt_class();
      int v12 = objc_opt_isKindOfClass() & 1;
      if (v12) {
        int v13 = v11;
      }
      else {
        int v13 = 0;
      }
      id v14 = v13;

      if (v12)
      {
        a1 = v11;
      }
      else
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = a1;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          int v20 = 138543874;
          id v21 = v18;
          __int16 v22 = 2114;
          id v23 = v7;
          __int16 v24 = 2112;
          id v25 = v8;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);
        }
        a1 = 0;
        *a4 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)_decodeStringForKey:(void *)a3 dictionary:(unsigned char *)a4 success:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
      objc_opt_class();
      int v12 = objc_opt_isKindOfClass() & 1;
      if (v12) {
        int v13 = v11;
      }
      else {
        int v13 = 0;
      }
      id v14 = v13;

      if (v12)
      {
        a1 = v11;
      }
      else
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = a1;
        id v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = HMFGetLogIdentifier();
          int v20 = 138543874;
          id v21 = v18;
          __int16 v22 = 2114;
          id v23 = v7;
          __int16 v24 = 2112;
          id v25 = v8;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);
        }
        a1 = 0;
        *a4 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)_decodeValueForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = v10;
  if (*a5)
  {
    int v12 = [v10 objectForKeyedSubscript:v9];
    if (!v12 && (a4 & 1) == 0)
    {
      int v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = a1;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        int v18 = 138543874;
        id v19 = v16;
        __int16 v20 = 2114;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing value for '%{public}@' in event: %@", (uint8_t *)&v18, 0x20u);
      }
      int v12 = 0;
      *a5 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)_encodeEvent:(id)a3 encodedEventInCloud:(id)a4 accessories:(id)a5 users:(id)a6 guests:(id)a7 shouldRemoveEvent:(BOOL *)a8 context:(id)a9
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v82 = a6;
  id v81 = a7;
  id v18 = a9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v77 = v16;
    id v79 = v17;
    id v19 = v15;
    id v20 = v18;
    if (self)
    {
      id v21 = (void *)MEMORY[0x263F08910];
      __int16 v22 = [v19 fireDateComponents];
      id v83 = 0;
      id v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v83];
      id v24 = v83;

      if (v23)
      {
        id v86 = @"TEt";
        char v87 = @"TECd";
        *(void *)buf = @"C";
        *(void *)&buf[8] = v23;
        self = [NSDictionary dictionaryWithObjects:buf forKeys:&v86 count:2];
      }
      else
      {
        char v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = self;
        uint64_t v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          char v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v24;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode fireDateComponents: %{public}@", buf, 0x16u);
        }
        self = 0;
      }
    }
    id v16 = v77;
    id v17 = v79;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v15;
      if (self)
      {
        uint64_t v26 = -[MKFCKEventTrigger _encodeEventCharacteristic:accessories:context:](self, v25, v17, v18);
        if (v26)
        {
          id v27 = [v25 min];

          if (v27)
          {
            id v28 = [v25 min];
            [v26 setObject:v28 forKeyedSubscript:@"TEAn"];
          }
          id v29 = [v25 max];

          if (v29)
          {
            id v30 = [v25 max];
            [v26 setObject:v30 forKeyedSubscript:@"TEAx"];
          }
          [v26 setObject:@"CR" forKeyedSubscript:@"TEt"];
          self = (MKFCKEventTrigger *)[v26 copy];
        }
        else
        {
          self = 0;
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (self)
          {
            *(void *)buf = @"D";
            id v86 = @"TEt";
            char v87 = @"TEDd";
            int v37 = [v15 duration];
            *(void *)&buf[8] = v37;
            self = [NSDictionary dictionaryWithObjects:buf forKeys:&v86 count:2];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v80 = v17;
            id v38 = v15;
            id v39 = v82;
            id v75 = v18;
            id v40 = v18;
            if (self)
            {
              id v41 = (void *)MEMORY[0x263F08910];
              id v42 = [v38 region];
              id v83 = 0;
              id v43 = [v41 archivedDataWithRootObject:v42 requiringSecureCoding:1 error:&v83];
              id v76 = v83;

              if (v43)
              {
                id v74 = v40;
                char v44 = v39;
                id v78 = v16;
                id v45 = [v38 user];

                if (v45)
                {
                  id v46 = [v38 user];
                  __int16 v47 = [v46 modelID];
                  id v48 = [(MKFCKEventTrigger *)self home];
                  __int16 v49 = +[MKFCKEventTrigger cloudUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v47, v48);
                }
                else
                {
                  v67 = [(MKFCKEventTrigger *)self home];
                  __int16 v49 = [v67 owner];

                  uint64_t v68 = (void *)MEMORY[0x230FBD990]();
                  v69 = self;
                  uint64_t v70 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                  {
                    char v71 = HMFGetLogIdentifier();
                    v72 = [v49 modelID];
                    *(_DWORD *)buf = 138543874;
                    *(void *)&uint8_t buf[4] = v71;
                    *(_WORD *)&buf[12] = 2160;
                    *(void *)&buf[14] = 1752392040;
                    *(_WORD *)&buf[22] = 2112;
                    __int16 v90 = v72;
                    _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@(Export) : FixUP: No user found for the MKFLocationEvent.user. Assigning owner of the home as owner of this location event: '%{mask.hash}@'", buf, 0x20u);
                  }
                }
                id v39 = v44;
                [v44 addObject:v49];
                id v86 = @"TEt";
                char v87 = @"TELl";
                *(void *)buf = @"L";
                *(void *)&buf[8] = v43;
                v88 = @"TELu";
                id v73 = [v49 modelID];
                *(void *)&buf[16] = v73;
                self = [NSDictionary dictionaryWithObjects:buf forKeys:&v86 count:3];

                id v16 = v78;
                id v40 = v74;
              }
              else
              {
                id v59 = v39;
                id v60 = (void *)MEMORY[0x230FBD990]();
                v61 = self;
                id v62 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                {
                  id v63 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v63;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v76;
                  _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode region: %{public}@", buf, 0x16u);
                }
                self = 0;
                id v39 = v59;
              }
            }
            id v17 = v80;
            id v18 = v75;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              -[MKFCKEventTrigger _encodeEventPresence:users:guests:shouldRemoveEvent:context:](self, v15, v82, v81, a8, v18);
              v58 = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                -[MKFCKEventTrigger _encodeEventSignificantTime:context:]((uint64_t)self, v15);
                v58 = (MKFCKEventTrigger *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_50;
                }
                id v64 = +[HMDCoreData featuresDataSource];
                int v65 = [v64 isRVCEnabled];

                if (!v65) {
                  goto LABEL_50;
                }
                v58 = [(MKFCKEventTrigger *)self _encodeEventAttributeValue:v15 accessories:v17 context:v18];
              }
            }
            self = v58;
          }
        }
        goto LABEL_35;
      }
      id v25 = v15;
      if (self)
      {
        id v31 = -[MKFCKEventTrigger _encodeEventCharacteristic:accessories:context:](self, v25, v17, v18);
        if (v31)
        {
          BOOL v32 = [v25 eventValue];
          [v31 setObject:v32 forKeyedSubscript:@"TEAv"];

          [v31 setObject:@"CV" forKeyedSubscript:@"TEt"];
          self = (MKFCKEventTrigger *)[v31 copy];
        }
        else
        {
          self = 0;
        }
      }
    }
  }
LABEL_35:
  if (!self)
  {
LABEL_50:
    id v57 = 0;
    goto LABEL_51;
  }
  id v50 = (void *)MEMORY[0x263EFF9A0];
  v84[0] = @"TEm";
  uint64_t v51 = [v15 modelID];
  v84[1] = @"TEd";
  v85[0] = v51;
  id v52 = [v15 endEvent];
  int v53 = [v52 BOOLValue];
  uint64_t v54 = MEMORY[0x263EFFA80];
  if (v53) {
    uint64_t v54 = MEMORY[0x263EFFA88];
  }
  v85[1] = v54;
  objc_super v55 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
  int v56 = [v50 dictionaryWithDictionary:v55];

  [v56 addEntriesFromDictionary:self];
  id v57 = +[MKFCKModel mergedDictionaryFromCloud:v16 localModifications:v56];

LABEL_51:
  return v57;
}

- (id)_decodeDateComponentsData:(void *)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v12 = 0;
  id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode date components: %{public}@", buf, 0x16u);
    }
  }

  return v4;
}

- (id)_decodeUUIDForKey:(void *)a3 dictionary:(unsigned char *)a4 success:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v7, v8, 0, a4);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    int v12 = objc_opt_isKindOfClass() & 1;
    if (v12) {
      int v13 = v11;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    if (v12)
    {
      id v15 = v11;
    }
    else
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = a1;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v21 = 138543874;
        __int16 v22 = v19;
        __int16 v23 = 2114;
        id v24 = v7;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v21, 0x20u);
      }
      id v15 = 0;
      *a4 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_decodeDataForKey:(void *)a3 dictionary:(unsigned char *)a4 success:
{
  id v4 = -[MKFCKEventTrigger _decodeDataForKey:dictionary:optional:success:](a1, a2, a3, 0, a4);
  return v4;
}

- (id)_decodeDataForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v9, v10, a4, a5);
  int v12 = v11;
  if (v11)
  {
    id v13 = v11;
    objc_opt_class();
    int v14 = objc_opt_isKindOfClass() & 1;
    if (v14) {
      id v15 = v13;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v14)
    {
      id v17 = v13;
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = a1;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = HMFGetLogIdentifier();
        int v23 = 138543874;
        id v24 = v21;
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v23, 0x20u);
      }
      id v17 = 0;
      *a5 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_decodeCharacteristicValueForKey:(void *)a3 dictionary:(char)a4 optional:(unsigned char *)a5 success:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = -[MKFCKEventTrigger _decodeValueForKey:dictionary:optional:success:](a1, v9, v10, a4, a5);
  int v12 = (void *)v11;
  id v13 = 0;
  if (v11 && *MEMORY[0x263EFFD08] != v11)
  {
    if (isAllowedCharType())
    {
      id v13 = v12;
    }
    else
    {
      int v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = a1;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = HMFGetLogIdentifier();
        int v19 = 138543874;
        id v20 = v17;
        __int16 v21 = 2114;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type for '%{public}@' in event: %@", (uint8_t *)&v19, 0x20u);
      }
      id v13 = 0;
      *a5 = 0;
    }
  }

  return v13;
}

+ (id)localUserWithModelID:(void *)a3 home:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__187155;
  id v17 = __Block_byref_object_dispose__187156;
  id v18 = 0;
  id v6 = [v5 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__MKFCKEventTrigger_Helpers__localUserWithModelID_home___block_invoke;
  v10[3] = &unk_264A24A70;
  id v7 = v4;
  id v11 = v7;
  int v12 = &v13;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __56__MKFCKEventTrigger_Helpers__localUserWithModelID_home___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)cloudUserWithModelID:(void *)a3 home:
{
  id v4 = a2;
  id v5 = a3;
  self;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__187155;
  id v17 = __Block_byref_object_dispose__187156;
  id v18 = 0;
  id v6 = [v5 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__MKFCKEventTrigger_Helpers__cloudUserWithModelID_home___block_invoke;
  v10[3] = &unk_264A259F8;
  id v7 = v4;
  id v11 = v7;
  int v12 = &v13;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __56__MKFCKEventTrigger_Helpers__cloudUserWithModelID_home___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __57__MKFCKEventTrigger_Helpers__localGuestWithModelID_home___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __57__MKFCKEventTrigger_Helpers__cloudGuestWithModelID_home___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 modelID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_encodeEventPresence:(void *)a3 users:(void *)a4 guests:(unsigned char *)a5 shouldRemoveEvent:(void *)a6 context:
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a1)
  {
    uint64_t v15 = [v11 activation];
    id v16 = v15;
    if (v15)
    {
      [v15 unsignedIntegerValue];
      id v17 = [v11 presenceType];
      id v47 = v12;
      if (v17)
      {
        id v46 = v14;
        id v18 = (void *)MEMORY[0x263EFF980];
        int v19 = [v11 users];
        id v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

        __int16 v21 = [v11 users];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke;
        v51[3] = &unk_264A252A8;
        v51[4] = a1;
        id v22 = v20;
        id v52 = v22;
        id v53 = v12;
        objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v51);

        __int16 v23 = (void *)MEMORY[0x263EFF980];
        id v24 = [v11 guests];
        uint64_t v25 = objc_msgSend(v23, "arrayWithCapacity:", objc_msgSend(v24, "count"));

        id v26 = [v11 guests];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke_2;
        v48[3] = &unk_264A252D0;
        v48[4] = a1;
        id v27 = v25;
        id v49 = v27;
        id v50 = v13;
        objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v48);

        v54[0] = @"TEt";
        v54[1] = @"TEPa";
        v55[0] = @"P";
        v55[1] = v16;
        v55[2] = v17;
        v54[2] = @"TEPt";
        v54[3] = @"TEPu";
        id v28 = (void *)[v22 copy];
        v55[3] = v28;
        a1 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:4];

        if ([v27 count])
        {
          uint64_t v29 = (void *)[a1 mutableCopy];
          id v30 = (void *)[v27 copy];
          [v29 setObject:v30 forKeyedSubscript:@"TEPg"];

          uint64_t v31 = [v29 copy];
          a1 = (void *)v31;
        }

        id v14 = v46;
        id v12 = v47;
      }
      else
      {
        id v39 = (void *)MEMORY[0x230FBD990]();
        id v40 = a1;
        id v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v42 = v13;
          v44 = id v43 = v14;
          *(_DWORD *)buf = 138543618;
          id v57 = v44;
          __int16 v58 = 2112;
          id v59 = v11;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_ERROR, "%{public}@No presenceType for event: %@", buf, 0x16u);

          id v14 = v43;
          id v13 = v42;
        }

        a1 = 0;
        *a5 = 1;
        id v12 = v47;
      }
    }
    else
    {
      BOOL v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = a1;
      id v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v35 = v13;
        id v36 = v14;
        v38 = id v37 = v12;
        *(_DWORD *)buf = 138543618;
        id v57 = v38;
        __int16 v58 = 2112;
        id v59 = v11;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@No activation for event: %@", buf, 0x16u);

        id v12 = v37;
        id v14 = v36;
        id v13 = v35;
      }

      a1 = 0;
      *a5 = 1;
    }
  }
  return a1;
}

void __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke(id *a1, void *a2)
{
  id v5 = [a2 modelID];
  id v3 = [a1[4] home];
  id v4 = +[MKFCKEventTrigger cloudUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v5, v3);

  [a1[5] addObject:v5];
  [a1[6] addObject:v4];
}

void __91__MKFCKEventTrigger_Presence___encodeEventPresence_users_guests_shouldRemoveEvent_context___block_invoke_2(id *a1, void *a2)
{
  id v3 = [a2 modelID];
  id v4 = [a1[4] home];
  id v5 = v3;
  id v6 = v4;
  self;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__187155;
  id v17 = __Block_byref_object_dispose__187156;
  id v18 = 0;
  int v7 = [v6 guests];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__MKFCKEventTrigger_Helpers__cloudGuestWithModelID_home___block_invoke;
  v10[3] = &unk_264A24AC0;
  id v9 = v5;
  id v11 = v9;
  id v12 = &v13;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  [a1[5] addObject:v9];
  [a1[6] addObject:v8];
}

- (_MKFPresenceEvent)_decodeEventPresence:(void *)a3 trigger:(void *)a4 context:
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v54 = a3;
  id v53 = a4;
  if (a1)
  {
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    v63[0] = 1;
    id v8 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, @"TEm", v7, v63);
    id v9 = -[MKFCKEventTrigger _decodeNumberForKey:dictionary:success:](a1, @"TEPa", v7, (unsigned char *)v61 + 24);
    id v10 = -[MKFCKEventTrigger _decodeStringForKey:dictionary:success:](a1, @"TEPt", v7, (unsigned char *)v61 + 24);
    if (!*((unsigned char *)v61 + 24))
    {
      id v17 = 0;
LABEL_43:

      _Block_object_dispose(&v60, 8);
      goto LABEL_44;
    }
    [v9 unsignedIntegerValue];
    id v11 = [v7 objectForKeyedSubscript:@"TEPu"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (!v13)
    {
      id v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = a1;
      HMFGetOSLogHandle();
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"TEPu";
        *(_WORD *)&buf[22] = 2112;
        v69 = v7;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);
      }
      id v17 = 0;
      goto LABEL_42;
    }
    id v14 = [v54 home];
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v13, "count"));
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __68__MKFCKEventTrigger_Presence___decodeEventPresence_trigger_context___block_invoke;
    v55[3] = &unk_264A252F8;
    void v55[4] = a1;
    id v16 = v7;
    id v56 = v16;
    id v59 = &v60;
    id v51 = v14;
    id v57 = v51;
    id v52 = v15;
    id v58 = v52;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v55);
    if (!*((unsigned char *)v61 + 24))
    {
      id v17 = 0;
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    id v17 = +[_MKFModel modelWithModelID:v8 context:v53];
    if (!v17)
    {
      id v17 = [[_MKFPresenceEvent alloc] initWithContext:v53];
      [(_MKFPresenceEvent *)v17 setModelID:v8];
      id v18 = [a1 writerTimestamp];
      [(_MKFPresenceEvent *)v17 setWriterTimestamp:v18];
    }
    int v19 = [(_MKFPresenceEvent *)v17 activation];
    char v20 = HMFEqualObjects();

    if ((v20 & 1) == 0) {
      [(_MKFPresenceEvent *)v17 setActivation:v9];
    }
    __int16 v21 = [(_MKFPresenceEvent *)v17 presenceType];
    char v22 = HMFEqualObjects();

    if ((v22 & 1) == 0) {
      [(_MKFPresenceEvent *)v17 setPresenceType:v10];
    }
    id v50 = (void *)[v52 copy];
    __int16 v23 = [(_MKFPresenceEvent *)v17 users];
    char v24 = HMFEqualObjects();

    if ((v24 & 1) == 0) {
      [(_MKFPresenceEvent *)v17 setUsers_:v50];
    }
    id v25 = v16;
    id v48 = v51;
    id v49 = v25;
    id v26 = [v25 objectForKeyedSubscript:@"TEPg"];
    id v27 = v26;
    if (!v26)
    {
      BOOL v32 = 0;
      goto LABEL_37;
    }
    id v28 = v26;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v30 = v28;
    }
    else {
      id v30 = 0;
    }
    id v47 = v30;

    if (isKindOfClass)
    {
      if ([v28 count])
      {
        id v45 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v28, "count"));
        uint64_t v64 = 0;
        int v65 = &v64;
        uint64_t v66 = 0x2020000000;
        char v67 = 1;
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __77__MKFCKEventTrigger_Presence___decodeGuestsFromPresenceEventDictionary_home___block_invoke;
        v69 = &unk_264A252F8;
        uint64_t v70 = a1;
        id v71 = v49;
        id v74 = &v64;
        id v72 = v48;
        id v31 = v45;
        id v73 = v31;
        objc_msgSend(v28, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
        if (*((unsigned char *)v65 + 24)) {
          BOOL v32 = (void *)[v31 copy];
        }
        else {
          BOOL v32 = 0;
        }

        _Block_object_dispose(&v64, 8);
        goto LABEL_36;
      }
    }
    else
    {
      id v37 = (void *)MEMORY[0x230FBD990]();
      id v38 = a1;
      id v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"TEPg";
        *(_WORD *)&buf[22] = 2112;
        v69 = v49;
        id v46 = v37;
        id v41 = (void *)v40;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);

        id v37 = v46;
      }
    }
    BOOL v32 = 0;
LABEL_36:

LABEL_37:
    if (v32)
    {
      id v42 = [(_MKFPresenceEvent *)v17 guests];
      char v43 = HMFEqualObjects();

      if ((v43 & 1) == 0) {
        [(_MKFPresenceEvent *)v17 setGuests_:v32];
      }
    }

    goto LABEL_41;
  }
  id v17 = 0;
LABEL_44:

  return v17;
}

void __68__MKFCKEventTrigger_Presence___decodeEventPresence_trigger_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = +[MKFCKEventTrigger localUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v8, *(void **)(a1 + 48));
    if (v9)
    {
      [*(id *)(a1 + 56) addObject:v9];
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = *(id *)(a1 + 32);
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        uint64_t v19 = *(void *)(a1 + 40);
        int v20 = 138544130;
        __int16 v21 = v18;
        __int16 v22 = 2160;
        uint64_t v23 = 1752392040;
        __int16 v24 = 2112;
        id v25 = v8;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find user '%{mask.hash}@' matching event: %@", (uint8_t *)&v20, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      id v14 = *(void **)(a1 + 40);
      int v20 = 138543874;
      __int16 v21 = v13;
      __int16 v22 = 2114;
      uint64_t v23 = @"TEPu";
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", (uint8_t *)&v20, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __77__MKFCKEventTrigger_Presence___decodeGuestsFromPresenceEventDictionary_home___block_invoke(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t result, uint64_t a2), unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = *(void **)(a1 + 48);
    id v11 = v9;
    id v12 = v10;
    self;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v37 = __Block_byref_object_copy__187155;
    *(void *)&long long v38 = __Block_byref_object_dispose__187156;
    *((void *)&v38 + 1) = 0;
    id v13 = [v12 guests];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    BOOL v32 = __57__MKFCKEventTrigger_Helpers__localGuestWithModelID_home___block_invoke;
    id v33 = &unk_264A24A98;
    id v14 = v11;
    id v34 = v14;
    id v35 = buf;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v30);

    id v15 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v15, v30, v31, v32, v33);
    }
    else
    {
      id v25 = (void *)MEMORY[0x230FBD990](v16, v17, v18, v19);
      id v26 = *(id *)(a1 + 32);
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        uint64_t v29 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2160;
        *(void *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        id v37 = (uint64_t (*)(uint64_t, uint64_t))v14;
        LOWORD(v38) = 2112;
        *(void *)((char *)&v38 + 2) = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find guest '%{mask.hash}@' matching event: %@", buf, 0x2Au);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    int v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    __int16 v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"TEPg";
      *(_WORD *)&buf[22] = 2048;
      id v37 = a3;
      LOWORD(v38) = 2112;
      *(void *)((char *)&v38 + 2) = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@'[%tu] in event: %@", buf, 0x2Au);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (_MKFLocationEvent)_decodeEventLocation:(void *)a3 trigger:(void *)a4 context:
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    char v50 = 1;
    id v48 = -[MKFCKEventTrigger _decodeUUIDForKey:dictionary:success:](a1, @"TEm", v7, &v50);
    id v10 = -[MKFCKEventTrigger _decodeDataForKey:dictionary:success:](a1, @"TELl", v7, &v50);
    id v49 = 0;
    id v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v49];
    id v47 = v49;
    if (!v11)
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      uint64_t v23 = v47;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v52 = v27;
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v47;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode region: %{public}@", buf, 0x16u);
      }
      uint64_t v17 = 0;
      goto LABEL_26;
    }
    id v46 = v9;
    id v12 = [v7 objectForKeyedSubscript:@"TELu"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      id v15 = [v8 home];
      uint64_t v16 = +[MKFCKEventTrigger localUserWithModelID:home:]((uint64_t)MKFCKEventTrigger, v14, v15);

      if (v16)
      {
LABEL_8:
        uint64_t v17 = +[_MKFModel modelWithModelID:v48 context:v46];
        if (!v17)
        {
          uint64_t v17 = [[_MKFLocationEvent alloc] initWithContext:v46];
          [(_MKFLocationEvent *)v17 setModelID:v48];
          uint64_t v18 = [a1 writerTimestamp];
          [(_MKFLocationEvent *)v17 setWriterTimestamp:v18];

          [(_MKFLocationEvent *)v17 setUser:v16];
        }
        uint64_t v19 = [(_MKFLocationEvent *)v17 region];
        char v20 = HMFEqualObjects();

        if ((v20 & 1) == 0) {
          [(_MKFLocationEvent *)v17 setRegion:v11];
        }
        id v21 = [(_MKFLocationEvent *)v17 user];
        char v22 = HMFEqualObjects();

        uint64_t v23 = v47;
        if ((v22 & 1) == 0) {
          [(_MKFLocationEvent *)v17 setUser:v16];
        }
LABEL_25:

        id v9 = v46;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = a1;
      uint64_t v30 = HMFGetOSLogHandle();
      id v45 = v8;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v52 = v31;
        __int16 v53 = 2114;
        uint64_t v54 = @"TELu";
        __int16 v55 = 2112;
        id v56 = v7;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode '%{public}@' in event: %@", buf, 0x20u);

        id v8 = v45;
      }

      BOOL v32 = [v8 home];
      uint64_t v16 = [v32 owner];

      id v33 = (void *)MEMORY[0x230FBD990]();
      id v34 = v29;
      id v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        [v16 modelID];
        id v37 = v44 = v33;
        *(_DWORD *)buf = 138543874;
        id v52 = v36;
        __int16 v53 = 2160;
        uint64_t v54 = 1752392040;
        __int16 v55 = 2112;
        id v56 = v37;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@(Import) : FixUP: No user found for the MKFLocationEvent.user. Assigning owner of the home as owner of this location event: '%{mask.hash}@'", buf, 0x20u);

        id v33 = v44;
        id v8 = v45;
      }

      if (v16) {
        goto LABEL_8;
      }
    }
    long long v38 = (void *)MEMORY[0x230FBD990]();
    id v39 = a1;
    uint64_t v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v42 = id v41 = v8;
      *(_DWORD *)buf = 138544130;
      id v52 = v42;
      __int16 v53 = 2160;
      uint64_t v54 = 1752392040;
      __int16 v55 = 2112;
      id v56 = v14;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Could not find user '%{mask.hash}@' matching event: %@", buf, 0x2Au);

      id v8 = v41;
    }

    uint64_t v17 = 0;
    uint64_t v23 = v47;
    goto LABEL_25;
  }
  uint64_t v17 = 0;
LABEL_27:

  return v17;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKEventTrigger"];
}

@end