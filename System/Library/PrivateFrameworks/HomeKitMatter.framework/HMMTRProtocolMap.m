@interface HMMTRProtocolMap
+ (BOOL)checkIfCharacteristicsIsOfTypeTemp:(id)a3;
+ (id)customMapEventForCharacteristic:(id)a3 event:(id)a4 value:(id)a5;
+ (id)customMapReadForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6;
+ (id)customMapWriteForCharacteristic:(id)a3 value:(id)a4;
+ (id)linearMapForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6;
+ (id)logCategory;
+ (id)mapActiveState:(id)a3;
+ (id)mapAirQuality:(id)a3;
+ (id)mapAirflowDirection:(id)a3;
+ (id)mapCurrentHeatingCoolingState:(id)a3;
+ (id)mapCurrentSystemMode:(id)a3;
+ (id)mapFanModeToActive:(id)a3;
+ (id)mapFanModeToTargetAirPurifier:(id)a3;
+ (id)mapFanModeToTargetFanState:(id)a3;
+ (id)mapPositionState:(id)a3;
+ (id)mapRotationDirection:(id)a3;
+ (id)mapTargetAirPuriferState:(id)a3;
+ (id)mapTargetFanState:(id)a3;
+ (id)mapTargetHeatingCoolingState:(id)a3;
+ (id)mapTargetSystemMode:(id)a3;
+ (id)protocolMap;
- (BOOL)_isValidCharacteristicValue:(id)a3 value:(id)a4;
- (BOOL)isRequiresOptionalMatterAttributeForCharacteristic:(id)a3;
- (BOOL)optionalServiceLabelIndexIncludedInService:(id)a3;
- (HMMTRProtocolMap)init;
- (NSDictionary)hapToCHIPClusterMappingArray;
- (NSDictionary)rawPlist;
- (NSNumber)schemaVersion;
- (NSNumber)version;
- (id)_buildEventMapper:(id)a3 characteristicsDict:(id)a4;
- (id)_buildExpectedValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 valueMapper:(id)a6;
- (id)_buildValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 forMTRCluster:(BOOL)a6;
- (id)_characteristicDescriptionForCharacteristicWithUUID:(id)a3 characteristicsDict:(id)a4 chipClusterName:(id)a5 operationType:(unint64_t)a6 value:(id)a7 forMTRCluster:(BOOL)a8;
- (id)_characteristicsDictionaryForCharacteristic:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5;
- (id)_characteristicsDictionaryForCharacteristicUUID:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5;
- (id)_chipClusterFunctionNameForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5 forMTRCluster:(BOOL)a6;
- (id)_chipParamsDictionaryForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5;
- (id)_descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 forMTRCluster:(BOOL)a6 endpointID:(unint64_t)a7 clusterIDCharacteristicMap:(id)a8;
- (id)_protocolMapCharacteristicsKeyForOperationType:(unint64_t)a3;
- (id)categoriesForDeviceTypes:(id)a3;
- (id)createClusterInstance;
- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 endpointID:(unint64_t)a5 clusterIDCharacteristicMap:(id)a6;
- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7;
- (id)descriptionOfMTRClusterForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7;
- (id)getCHIPAttributesForCharacteristic:(id)a3;
- (id)getClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5;
- (id)getIDForCharacteristic:(id)a3;
- (id)getMTRClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5;
- (id)getRequiredFeaturesBitmapForCharacteristic:(id)a3;
- (id)getUpdatedLinkedCharacteristics:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5;
- (id)mtrBaseClusterNameFromMTRClusterName:(id)a3;
- (id)mtrClusterNameFromMTRBaseClusterName:(id)a3;
- (id)mtrClusterReadFunctionNameFromBaseClusterFunctionName:(id)a3;
- (id)mtrClusterWriteFunctionNameFromBaseClusterFunctionName:(id)a3;
- (id)optionalCharacteristicsForService:(id)a3;
- (id)reportDescriptionForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5;
- (id)requiredCharacteristicsForService:(id)a3;
- (id)retrieveHAPToCHIPClusterMapping;
- (void)_selectedServiceTypeForServiceArray:(id)a3 device:(id)a4 mtrDevice:(id)a5 endpoint:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8;
- (void)servicesForDeviceTypes:(id)a3 device:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)servicesOfMTRDevice:(id)a3 forDeviceTypes:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7;
- (void)setCreateClusterInstance:(id)a3;
- (void)updateMetadataForCharacteristic:(id)a3 metadata:(id)a4 endpointID:(id)a5 topology:(id)a6 clusterIDCharacteristicMap:(id)a7;
@end

@implementation HMMTRProtocolMap

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createClusterInstance, 0);
  objc_storeStrong((id *)&self->_hapToCHIPClusterMappingArray, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setCreateClusterInstance:(id)a3
{
}

- (id)createClusterInstance
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)hapToCHIPClusterMappingArray
{
  return self->_hapToCHIPClusterMappingArray;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)updateMetadataForCharacteristic:(id)a3 metadata:(id)a4 endpointID:(id)a5 topology:(id)a6 clusterIDCharacteristicMap:(id)a7
{
  uint64_t v286 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v267 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v268 = v12;
  v16 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v12];
  v17 = (void *)MEMORY[0x2533B64D0]();
  v18 = self;
  v19 = HMFGetOSLogHandle();
  v20 = v19;
  if (v16)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v275 = v21;
      __int16 v276 = 2112;
      id v277 = v267;
      __int16 v278 = 2112;
      id v279 = v12;
      __int16 v280 = 2112;
      v281 = v13;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_INFO, "%{public}@Update Metadata %@ for characteristic %@ on endpoint %@", buf, 0x2Au);
    }
    v22 = [(HMMTRProtocolMap *)v18 getClusterClassForCharacteristic:v16 endpointID:v13 clusterIDCharacteristicMap:v15];
    id v266 = v13;
    v23 = [v14 getFeatureMapForClusterClassName:v22 endpoint:v13];
    if ((([v22 isEqualToString:@"HMMTRWindowCovering"] & 1) != 0
       || ([v22 isEqualToString:@"MTRBaseClusterWindowCovering"] & 1) != 0
       || [v22 isEqualToString:@"MTRClusterWindowCovering"])
      && [v12 isEqualToString:@"0000007C-0000-1000-8000-0026BB765291"])
    {
      if (([v23 unsignedIntValue] & 4) == 0)
      {
        v24 = v23;
        v25 = v22;
        v26 = v16;
        v27 = [v267 constraints];
        v28 = [v27 maximumValue];
        v29 = [v267 constraints];
        [v29 setStepValue:v28];

        v30 = (void *)MEMORY[0x2533B64D0]();
        v31 = v18;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v275 = v33;
          v34 = "%{public}@Accessory is not position aware, setting target position step size to maximum value.";
LABEL_21:
          _os_log_impl(&dword_252495000, v32, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);

          goto LABEL_22;
        }
        goto LABEL_22;
      }
      goto LABEL_58;
    }
    if ((([v22 isEqualToString:@"HMMTRWindowCovering"] & 1) != 0
       || ([v22 isEqualToString:@"MTRBaseClusterWindowCovering"] & 1) != 0
       || [v22 isEqualToString:@"MTRClusterWindowCovering"])
      && [v12 isEqualToString:@"000000C2-0000-1000-8000-0026BB765291"])
    {
      if (([v23 unsignedIntValue] & 0x10) == 0)
      {
        v24 = v23;
        v25 = v22;
        v26 = v16;
        v36 = [v267 constraints];
        v37 = [v36 maximumValue];
        v38 = [v267 constraints];
        [v38 setStepValue:v37];

        v30 = (void *)MEMORY[0x2533B64D0]();
        v31 = v18;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v275 = v33;
          v34 = "%{public}@Accessory is not position aware, setting target tilt step size to maximum value.";
          goto LABEL_21;
        }
LABEL_22:

        v16 = v26;
        v22 = v25;
        v23 = v24;
      }
LABEL_58:

      id v13 = v266;
      goto LABEL_59;
    }
    if ([v12 isEqualToString:@"00000073-0000-1000-8000-0026BB765291"])
    {
      id v262 = v15;
      context = [(HMMTRProtocolMap *)v18 getClusterClassForCharacteristic:v16 endpointID:v266 clusterIDCharacteristicMap:v15];
      v39 = objc_msgSend(v14, "getFeatureMapForClusterClassName:endpoint:");
      int v40 = [v39 unsignedIntegerValue];
      v41 = [MEMORY[0x263EFF980] array];
      v42 = v41;
      if ((v40 & 2) != 0)
      {
        v43 = &unk_2702B5E20;
        v41 = (void *)[v41 addObject:&unk_2702B5E20];
      }
      else
      {
        v43 = 0;
      }
      v71 = v43;
      if ((~v40 & 0x16) == 0)
      {
        v71 = &unk_2702B5E38;
        v41 = (void *)[v42 addObject:&unk_2702B5E38];
      }
      v259 = v16;
      if ((~v40 & 0xELL) == 0)
      {
        v71 = &unk_2702B5E50;
        v41 = (void *)[v42 addObject:&unk_2702B5E50];
      }
      v72 = (void *)MEMORY[0x2533B64D0](v41);
      v73 = v18;
      v74 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v255 = v14;
        v75 = v39;
        v76 = v23;
        v78 = v77 = v22;
        *(_DWORD *)buf = 138543618;
        v275 = v78;
        __int16 v276 = 2112;
        id v277 = v42;
        _os_log_impl(&dword_252495000, v74, OS_LOG_TYPE_DEBUG, "%{public}@Constraining input-event characteristic valid values to %@", buf, 0x16u);

        v22 = v77;
        v23 = v76;
        v39 = v75;
        id v14 = v255;
      }

      v79 = [v267 constraints];

      if (!v79)
      {
        id v80 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v80];
      }
      v81 = [v267 constraints];
      [v81 setMinimumValue:v43];

      v82 = [v267 constraints];
      [v82 setMaximumValue:v71];

      v83 = [v267 constraints];
      [v83 setStepValue:&unk_2702B5E38];

      v84 = [v267 constraints];
      [v84 setValidValues:v42];

      v16 = v259;
      id v15 = v262;
      goto LABEL_58;
    }
    if ([v12 isEqualToString:@"000000CE-0000-1000-8000-0026BB765291"])
    {
      v247 = v22;
      v44 = [v267 constraints];

      if (!v44)
      {
        id v45 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v45];
      }
      v46 = [v267 constraints];
      [v46 setMinimumValue:&unk_2702B5D00];

      v47 = [v267 constraints];
      [v47 setMaximumValue:&unk_2702B5D18];

      v48 = [v267 constraints];
      [v48 setStepValue:&unk_2702B5E38];

      id v254 = v14;
      v49 = [v14 getAttributesForClusterClassName:v22 endpoint:v266];
      v50 = v49;
      id v263 = v15;
      if (v49)
      {
        v51 = [v49 objectForKeyedSubscript:@"ColorTempPhysicalMinMireds"];
        v258 = v16;
        if ([v51 count])
        {
          v52 = [v51 objectAtIndexedSubscript:0];
          v53 = [v267 constraints];
          [v53 setMinimumValue:v52];

          v54 = (void *)MEMORY[0x2533B64D0]();
          v55 = v18;
          v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            v57 = HMFGetLogIdentifier();
            v58 = [v267 constraints];
            [v58 minimumValue];
            v60 = v59 = v23;
            *(_DWORD *)buf = 138543618;
            v275 = v57;
            __int16 v276 = 2112;
            id v277 = v60;
            _os_log_impl(&dword_252495000, v56, OS_LOG_TYPE_DEBUG, "%{public}@ColorTempPhysicalMinMireds %@", buf, 0x16u);

            v23 = v59;
            v22 = v247;
          }
          v16 = v258;
        }
        v61 = [v50 objectForKeyedSubscript:@"ColorTempPhysicalMaxMireds"];

        if ([v61 count])
        {
          v62 = [v61 objectAtIndexedSubscript:0];
          v63 = [v267 constraints];
          [v63 setMaximumValue:v62];

          v64 = (void *)MEMORY[0x2533B64D0]();
          v65 = v18;
          v66 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            v67 = HMFGetLogIdentifier();
            v68 = [v267 constraints];
            [v68 maximumValue];
            v70 = v69 = v23;
            *(_DWORD *)buf = 138543618;
            v275 = v67;
            __int16 v276 = 2112;
            id v277 = v70;
            _os_log_impl(&dword_252495000, v66, OS_LOG_TYPE_DEBUG, "%{public}@ColorTempPhysicalMaxMireds %@", buf, 0x16u);

            v23 = v69;
            v22 = v247;
          }
          v16 = v258;
        }
      }
      else
      {
        v90 = v23;
        contexta = (void *)MEMORY[0x2533B64D0]();
        v91 = v18;
        v92 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v94 = v93 = v16;
          *(_DWORD *)buf = 138544386;
          v275 = v94;
          __int16 v276 = 2112;
          id v277 = v247;
          __int16 v278 = 2112;
          id v279 = v266;
          __int16 v280 = 2112;
          v281 = &unk_2702B5D00;
          __int16 v282 = 2112;
          v283 = &unk_2702B5D18;
          _os_log_impl(&dword_252495000, v92, OS_LOG_TYPE_ERROR, "%{public}@No attributes found for cluster %@ on endpoint %@. Use default ColorTemperature Min/Max %@, %@", buf, 0x34u);

          v16 = v93;
          v22 = v247;
        }

        v23 = v90;
      }

      id v14 = v254;
      id v15 = v263;
      goto LABEL_58;
    }
    if (([v12 isEqualToString:@"0000007B-0000-1000-8000-0026BB765291"] & 1) != 0
      || [v12 isEqualToString:@"0000007D-0000-1000-8000-0026BB765291"])
    {
      v85 = [v267 constraints];

      if (!v85)
      {
        id v86 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v86];
      }
      v87 = [v267 constraints];
      [v87 setMinimumValue:&unk_2702B5E20];

      v88 = [v267 constraints];
      [v88 setMaximumValue:&unk_2702B5E98];

      v89 = [v267 constraints];
      [v89 setStepValue:&unk_2702B5E38];

      goto LABEL_58;
    }
    if ([v12 isEqualToString:@"00000033-0000-1000-8000-0026BB765291"])
    {
      if ((([v22 isEqualToString:@"MTRBaseClusterThermostat"] & 1) != 0
         || [v22 isEqualToString:@"MTRClusterThermostat"])
        && v23)
      {
        v95 = v16;
        v96 = [v267 constraints];

        if (!v96)
        {
          id v97 = objc_alloc_init(MEMORY[0x263F359F0]);
          [v267 setConstraints:v97];
        }
        v98 = [MEMORY[0x263EFF980] array];
        [v98 addObject:&unk_2702B5E20];
        v99 = [v267 constraints];
        [v99 setMinimumValue:&unk_2702B5E20];

        v100 = [v267 constraints];
        [v100 setMaximumValue:&unk_2702B5E68];

        v101 = [v267 constraints];
        [v101 setStepValue:&unk_2702B5E38];

        if ([v23 unsignedIntValue]) {
          [v98 addObject:&unk_2702B5E38];
        }
        if (([v23 unsignedIntValue] & 2) != 0) {
          [v98 addObject:&unk_2702B5E50];
        }
        v16 = v95;
        if (([v23 unsignedIntValue] & 0x20) != 0) {
          [v98 addObject:&unk_2702B5E68];
        }
        v102 = [v267 constraints];
        [v102 setValidValues:v98];
      }
      goto LABEL_58;
    }
    if ([v12 isEqualToString:@"00000035-0000-1000-8000-0026BB765291"])
    {
      if (([v22 isEqualToString:@"HMMTRThermostat"] & 1) == 0
        && ([v22 isEqualToString:@"HMMTRSyncThermostat"] & 1) == 0
        && ![v22 isEqualToString:@"MTRClusterThermostat"]
        || !v23)
      {
        goto LABEL_58;
      }
      v103 = [v267 constraints];

      if (!v103)
      {
        id v104 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v104];
      }
      v105 = [v267 constraints];
      [v105 setMinimumValue:&unk_2702B5EB0];

      v106 = [v267 constraints];
      [v106 setMaximumValue:&unk_2702B5EC8];

      v107 = [v267 constraints];
      [v107 setStepValue:&unk_2702B6280];

      v108 = [v267 constraints];
      v109 = [v108 minimumValue];

      v110 = [v267 constraints];
      contextb = [v110 maximumValue];

      v111 = [v267 constraints];
      v112 = [v111 minimumValue];

      v113 = [v267 constraints];
      v246 = [v113 maximumValue];

      id v256 = v14;
      v114 = [v14 getAttributesForClusterClassName:v22 endpoint:v266];
      v115 = v114;
      if (v114)
      {
        v116 = v16;
        v117 = [v114 objectForKeyedSubscript:@"AbsMinCoolSetpointLimit"];
        if ([v117 count])
        {
          uint64_t v118 = [v117 objectAtIndexedSubscript:0];

          v109 = (void *)v118;
        }
        v119 = [v115 objectForKeyedSubscript:@"AbsMaxCoolSetpointLimit"];

        if ([v119 count])
        {
          uint64_t v120 = [v119 objectAtIndexedSubscript:0];

          contextb = (void *)v120;
        }
        v121 = [v115 objectForKeyedSubscript:@"AbsMinHeatSetpointLimit"];

        if ([v121 count])
        {
          uint64_t v122 = [v121 objectAtIndexedSubscript:0];

          v112 = (void *)v122;
        }
        v123 = [v115 objectForKeyedSubscript:@"AbsMaxHeatSetpointLimit"];

        if ([v123 count])
        {
          uint64_t v124 = [v123 objectAtIndexedSubscript:0];

          v246 = (void *)v124;
        }
        v16 = v116;
      }
      v260 = v16;
      id v264 = v15;
      v248 = v22;
      v244 = v109;
      if (([v23 unsignedIntValue] & 0x20) != 0)
      {
        uint64_t v187 = [v109 integerValue];
        if (v187 != [v112 integerValue]
          || (uint64_t v188 = [contextb integerValue], v188 != objc_msgSend(v246, "integerValue")))
        {
          v189 = (void *)MEMORY[0x2533B64D0]();
          v190 = v18;
          v191 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v193 = v192 = v112;
            *(_DWORD *)buf = 138543362;
            v275 = v193;
            _os_log_impl(&dword_252495000, v191, OS_LOG_TYPE_INFO, "%{public}@Thermostat min/max setpoints for heat and cool are not the same", buf, 0xCu);

            v112 = v192;
            v109 = v244;
          }
        }
        v194 = NSNumber;
        uint64_t v195 = objc_msgSend(v109, "integerValue", v244);
        v125 = v112;
        uint64_t v196 = [v112 integerValue];
        if (v195 >= v196) {
          uint64_t v197 = v196;
        }
        else {
          uint64_t v197 = v195;
        }
        v198 = [v194 numberWithInteger:v197];
        v199 = [v267 constraints];
        [v199 setMinimumValue:v198];

        v200 = NSNumber;
        uint64_t v201 = [contextb integerValue];
        uint64_t v202 = [v246 integerValue];
        if (v201 <= v202) {
          uint64_t v203 = v202;
        }
        else {
          uint64_t v203 = v201;
        }
        v129 = [v200 numberWithInteger:v203];
        v204 = [v267 constraints];
        [v204 setMaximumValue:v129];
      }
      else
      {
        v125 = v112;
        if (([v23 unsignedIntValue] & 2) != 0)
        {
          v126 = [v267 constraints];
          [v126 setMinimumValue:v244];

          v127 = [v267 constraints];
          [v127 setMaximumValue:contextb];
        }
        if ((objc_msgSend(v23, "unsignedIntValue", v244) & 1) == 0) {
          goto LABEL_137;
        }
        v128 = [v267 constraints];
        [v128 setMinimumValue:v112];

        v129 = [v267 constraints];
        [v129 setMaximumValue:v246];
      }

LABEL_137:
      v205 = NSNumber;
      v206 = [v267 constraints];
      v207 = [v206 minimumValue];
      v208 = objc_msgSend(v205, "numberWithDouble:", (double)objc_msgSend(v207, "integerValue") / 100.0);
      v209 = [v267 constraints];
      [v209 setMinimumValue:v208];

      v210 = NSNumber;
      v211 = [v267 constraints];
      v212 = [v211 maximumValue];
      v213 = objc_msgSend(v210, "numberWithDouble:", (double)objc_msgSend(v212, "integerValue") / 100.0);
      v214 = [v267 constraints];
      [v214 setMaximumValue:v213];

      v215 = (void *)MEMORY[0x2533B64D0]();
      v216 = v18;
      v217 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
      {
        v218 = HMFGetLogIdentifier();
        v219 = [v267 constraints];
        *(_DWORD *)buf = 138544642;
        v275 = v218;
        __int16 v276 = 2112;
        id v277 = v245;
        __int16 v278 = 2112;
        id v279 = contextb;
        __int16 v280 = 2112;
        v281 = v125;
        __int16 v282 = 2112;
        v283 = v246;
        __int16 v284 = 2112;
        v285 = v219;
        _os_log_impl(&dword_252495000, v217, OS_LOG_TYPE_INFO, "%{public}@Device Abs min/max cool setpoint: %@/%@, min/max heat setpoint: %@/%@. Setting metadata constraints: %@", buf, 0x3Eu);
      }

      goto LABEL_140;
    }
    if ([v12 isEqualToString:@"0000000D-0000-1000-8000-0026BB765291"])
    {
      if (([v22 isEqualToString:@"MTRBaseClusterThermostat"] & 1) == 0
        && ![v22 isEqualToString:@"MTRClusterThermostat"]
        || !v23)
      {
        goto LABEL_58;
      }
      v130 = [v267 constraints];

      if (!v130)
      {
        id v131 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v131];
      }
      v132 = [v267 constraints];
      [v132 setMinimumValue:&unk_2702B5EB0];

      v133 = [v267 constraints];
      [v133 setMaximumValue:&unk_2702B5EE0];

      v134 = [v267 constraints];
      [v134 setStepValue:&unk_2702B6280];

      v135 = [v267 constraints];
      v136 = [v135 minimumValue];

      v137 = [v267 constraints];
      v138 = [v137 maximumValue];

      id v256 = v14;
      v139 = [v14 getAttributesForClusterClassName:v22 endpoint:v266];
      v140 = v139;
      v260 = v16;
      id v264 = v15;
      v248 = v22;
      if (v139)
      {
        v141 = [v139 objectForKeyedSubscript:@"AbsMinCoolSetpointLimit"];
        if ([v141 count])
        {
          uint64_t v142 = [v141 objectAtIndexedSubscript:0];

          v136 = (void *)v142;
        }
        v143 = [v140 objectForKeyedSubscript:@"AbsMaxCoolSetpointLimit"];

        if ([v143 count])
        {
          uint64_t v144 = [v143 objectAtIndexedSubscript:0];

          v138 = (void *)v144;
        }
      }
      v145 = [v267 constraints];
      [v145 setMinimumValue:v136];

      v146 = [v267 constraints];
      contextc = v138;
      [v146 setMaximumValue:v138];

      v147 = NSNumber;
      v148 = [v267 constraints];
      v149 = [v148 minimumValue];
      v150 = objc_msgSend(v147, "numberWithDouble:", (double)objc_msgSend(v149, "integerValue") / 100.0);
      v151 = [v267 constraints];
      [v151 setMinimumValue:v150];

      v152 = NSNumber;
      v153 = [v267 constraints];
      v154 = [v153 maximumValue];
      v155 = objc_msgSend(v152, "numberWithDouble:", (double)objc_msgSend(v154, "integerValue") / 100.0);
      v156 = [v267 constraints];
      [v156 setMaximumValue:v155];

      v157 = (void *)MEMORY[0x2533B64D0]();
      v158 = v18;
      v159 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_INFO)) {
        goto LABEL_123;
      }
    }
    else
    {
      if (![v12 isEqualToString:@"00000012-0000-1000-8000-0026BB765291"])
      {
        if ([v12 isEqualToString:@"000000B2-0000-1000-8000-0026BB765291"]
          && (([v22 isEqualToString:@"HMMTRThermostat"] & 1) != 0
           || ([v22 isEqualToString:@"HMMTRSyncThermostat"] & 1) != 0
           || [v22 isEqualToString:@"MTRClusterThermostat"])
          && v23)
        {
          v220 = [v267 constraints];

          if (!v220)
          {
            id v221 = objc_alloc_init(MEMORY[0x263F359F0]);
            [v267 setConstraints:v221];
          }
          v222 = [MEMORY[0x263EFF980] array];
          if (([v23 unsignedIntValue] & 2) != 0) {
            [v222 addObject:&unk_2702B5E50];
          }
          if ([v23 unsignedIntValue]) {
            [v222 addObject:&unk_2702B5E38];
          }
          contextd = v23;
          id v257 = v14;
          v261 = v16;
          id v265 = v15;
          long long v271 = 0u;
          long long v272 = 0u;
          long long v269 = 0u;
          long long v270 = 0u;
          id v223 = v222;
          uint64_t v224 = [v223 countByEnumeratingWithState:&v269 objects:v273 count:16];
          if (v224)
          {
            uint64_t v225 = v224;
            id v226 = 0;
            id v227 = 0;
            uint64_t v228 = *(void *)v270;
            do
            {
              for (uint64_t i = 0; i != v225; ++i)
              {
                if (*(void *)v270 != v228) {
                  objc_enumerationMutation(v223);
                }
                v230 = *(void **)(*((void *)&v269 + 1) + 8 * i);
                if (!v226) {
                  id v226 = v230;
                }
                if (!v227) {
                  id v227 = v230;
                }
                unint64_t v231 = [v230 unsignedIntegerValue];
                if (v231 < [v226 unsignedIntegerValue])
                {
                  id v232 = v230;

                  id v226 = v232;
                }
                unint64_t v233 = [v230 unsignedIntegerValue];
                if (v233 > [v227 unsignedIntegerValue])
                {
                  id v234 = v230;

                  id v227 = v234;
                }
              }
              uint64_t v225 = [v223 countByEnumeratingWithState:&v269 objects:v273 count:16];
            }
            while (v225);
          }
          else
          {
            id v226 = 0;
            id v227 = 0;
          }

          v235 = [v267 constraints];
          [v235 setMinimumValue:v226];

          v236 = [v267 constraints];
          [v236 setMaximumValue:v227];

          v237 = [v267 constraints];
          [v237 setValidValues:v223];

          v238 = [v267 constraints];
          [v238 setStepValue:&unk_2702B5E38];

          v239 = (void *)MEMORY[0x2533B64D0]();
          v240 = v18;
          v241 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
          {
            v242 = HMFGetLogIdentifier();
            v243 = [v267 constraints];
            *(_DWORD *)buf = 138543874;
            v275 = v242;
            __int16 v276 = 2112;
            id v277 = v243;
            __int16 v278 = 2112;
            id v279 = v268;
            _os_log_impl(&dword_252495000, v241, OS_LOG_TYPE_INFO, "%{public}@Setting metadata constraints: %@ for characteristic %@", buf, 0x20u);
          }

          id v14 = v257;
          v16 = v261;
          id v15 = v265;
          v23 = contextd;
        }
        goto LABEL_58;
      }
      if (([v22 isEqualToString:@"MTRBaseClusterThermostat"] & 1) == 0
        && ![v22 isEqualToString:@"MTRClusterThermostat"]
        || !v23)
      {
        goto LABEL_58;
      }
      v160 = [v267 constraints];

      if (!v160)
      {
        id v161 = objc_alloc_init(MEMORY[0x263F359F0]);
        [v267 setConstraints:v161];
      }
      v162 = [v267 constraints];
      [v162 setMinimumValue:&unk_2702B5E20];

      v163 = [v267 constraints];
      [v163 setMaximumValue:&unk_2702B5EF8];

      v164 = [v267 constraints];
      [v164 setStepValue:&unk_2702B6280];

      v165 = [v267 constraints];
      v136 = [v165 minimumValue];

      v166 = [v267 constraints];
      v167 = [v166 maximumValue];

      id v256 = v14;
      v168 = [v14 getAttributesForClusterClassName:v22 endpoint:v266];
      v140 = v168;
      v260 = v16;
      id v264 = v15;
      v248 = v22;
      if (v168)
      {
        v169 = [v168 objectForKeyedSubscript:@"AbsMinHeatSetpointLimit"];
        if ([v169 count])
        {
          uint64_t v170 = [v169 objectAtIndexedSubscript:0];

          v136 = (void *)v170;
        }
        v171 = [v140 objectForKeyedSubscript:@"AbsMaxHeatSetpointLimit"];

        if ([v171 count])
        {
          uint64_t v172 = [v171 objectAtIndexedSubscript:0];

          v167 = (void *)v172;
        }
      }
      v173 = [v267 constraints];
      [v173 setMinimumValue:v136];

      v174 = [v267 constraints];
      contextc = v167;
      [v174 setMaximumValue:v167];

      v175 = NSNumber;
      v176 = [v267 constraints];
      v177 = [v176 minimumValue];
      v178 = objc_msgSend(v175, "numberWithDouble:", (double)objc_msgSend(v177, "integerValue") / 100.0);
      v179 = [v267 constraints];
      [v179 setMinimumValue:v178];

      v180 = NSNumber;
      v181 = [v267 constraints];
      v182 = [v181 maximumValue];
      v183 = objc_msgSend(v180, "numberWithDouble:", (double)objc_msgSend(v182, "integerValue") / 100.0);
      v184 = [v267 constraints];
      [v184 setMaximumValue:v183];

      v157 = (void *)MEMORY[0x2533B64D0]();
      v158 = v18;
      v159 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v159, OS_LOG_TYPE_INFO)) {
        goto LABEL_123;
      }
    }
    v185 = HMFGetLogIdentifier();
    v186 = [v267 constraints];
    *(_DWORD *)buf = 138543874;
    v275 = v185;
    __int16 v276 = 2112;
    id v277 = v186;
    __int16 v278 = 2112;
    id v279 = v268;
    _os_log_impl(&dword_252495000, v159, OS_LOG_TYPE_INFO, "%{public}@Setting metadata constraints: %@ for characteristic %@", buf, 0x20u);

LABEL_123:

LABEL_140:
    id v14 = v256;
    v16 = v260;
    id v15 = v264;
    v22 = v248;
    goto LABEL_58;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v35 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v275 = v35;
    __int16 v276 = 2112;
    id v277 = v12;
    __int16 v278 = 2112;
    id v279 = 0;
    _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristicUUID. Does not convert to a short integer. UUID:%@ shortened: %@. Using default characteristic metadata", buf, 0x20u);
  }
LABEL_59:
}

- (id)getMTRClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:", v8, [v9 unsignedIntegerValue], v10);
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 objectForKeyedSubscript:@"CHIPCluster"];
    uint64_t v14 = [(HMMTRProtocolMap *)self mtrClusterNameFromMTRBaseClusterName:v13];
    id v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = v13;
    }
    id v17 = v16;
  }
  else
  {
    v18 = (void *)MEMORY[0x2533B64D0]();
    v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported", (uint8_t *)&v23, 0x16u);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)getClusterClassForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristic:endpointID:clusterIDCharacteristicMap:", v8, [v9 unsignedIntegerValue], v10);
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 objectForKeyedSubscript:@"CHIPCluster"];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v17;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported", (uint8_t *)&v19, 0x16u);
    }
    id v13 = 0;
  }

  return v13;
}

- (BOOL)isRequiresOptionalMatterAttributeForCharacteristic:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ConfigureCharacteristic"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"RequiresOptionalMatterAttribute"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)getRequiredFeaturesBitmapForCharacteristic:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ConfigureCharacteristic"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"RequiredFeaturesBitmap"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getIDForCharacteristic:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"HAPCharacteristic"];
}

- (id)getCHIPAttributesForCharacteristic:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPCharacteristics"];
  if (v5)
  {
    char v6 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([v6 isEqual:*(void *)(*((void *)&v21 + 1) + 8 * i)])
          {
            id v12 = [v7 objectForKeyedSubscript:v6];
            memset(v20, 0, sizeof(v20));
            id v13 = v12;
            if ([v13 countByEnumeratingWithState:v20 objects:v25 count:16])
            {
              uint64_t v14 = [**((id **)&v20[0] + 1) objectForKeyedSubscript:@"CHIPAttributes"];

              goto LABEL_17;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v14 = [MEMORY[0x263EFF8C0] array];
LABEL_17:
  }
  else
  {
    id v15 = (void *)MEMORY[0x2533B64D0]();
    v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPCharacteristic dictionary from HomeKitMatter's ProtocolMap.", buf, 0xCu);
    }
    uint64_t v14 = [MEMORY[0x263EFF8C0] array];
  }

  return v14;
}

- (void)servicesOfMTRDevice:(id)a3 forDeviceTypes:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v20 = a4;
  id v23 = a5;
  queue = a6;
  id v21 = a7;
  id v26 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"CHIPDeviceTypes"];
  if (v26)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__9208;
    v38[4] = __Block_byref_object_dispose__9209;
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v12 = dispatch_group_create();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v20;
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v17 = [v16 stringValue];
          v18 = [v26 objectForKeyedSubscript:v17];

          dispatch_group_enter(v12);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke;
          v31[3] = &unk_265378178;
          v33 = v38;
          v31[4] = self;
          v31[5] = v16;
          v32 = v12;
          [(HMMTRProtocolMap *)self _selectedServiceTypeForServiceArray:v18 device:0 mtrDevice:v24 endpoint:v23 callbackQueue:queue completionHandler:v31];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke_393;
    block[3] = &unk_2653781A0;
    v30 = v38;
    id v29 = v21;
    block[4] = self;
    id v28 = obj;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    int v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v19);
  }
}

void __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP service type for deviceType %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __96__HMMTRProtocolMap_servicesOfMTRDevice_forDeviceTypes_endpoint_callbackQueue_completionHandler___block_invoke_393(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:@"96"] & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:@"96"];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@The services for the device types  %@ : %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

- (void)servicesForDeviceTypes:(id)a3 device:(id)a4 endpoint:(id)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v24 = a4;
  id v23 = a5;
  queue = a6;
  id v21 = a7;
  id v26 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"CHIPDeviceTypes"];
  if (v26)
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__9208;
    v38[4] = __Block_byref_object_dispose__9209;
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    __int16 v12 = dispatch_group_create();
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v20;
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v17 = [v16 stringValue];
          v18 = [v26 objectForKeyedSubscript:v17];

          dispatch_group_enter(v12);
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke;
          v31[3] = &unk_265378178;
          v33 = v38;
          v31[4] = self;
          v31[5] = v16;
          v32 = v12;
          [(HMMTRProtocolMap *)self _selectedServiceTypeForServiceArray:v18 device:v24 mtrDevice:0 endpoint:v23 callbackQueue:queue completionHandler:v31];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v13);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke_392;
    block[3] = &unk_2653781A0;
    v30 = v38;
    id v29 = v21;
    block[4] = self;
    id v28 = obj;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v38, 8);
  }
  else
  {
    int v19 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    (*((void (**)(id, void, void *))v21 + 2))(v21, 0, v19);
  }
}

void __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v5];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP service type for deviceType %@", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __91__HMMTRProtocolMap_servicesForDeviceTypes_device_endpoint_callbackQueue_completionHandler___block_invoke_392(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) containsObject:@"96"] & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:@"96"];
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    v2 = (void *)MEMORY[0x2533B64D0]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@The services for the device types %@ : %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
  }
}

- (void)_selectedServiceTypeForServiceArray:(id)a3 device:(id)a4 mtrDevice:(id)a5 endpoint:(id)a6 callbackQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v57 = a4;
  id v54 = a5;
  id v55 = a6;
  queue = a7;
  id v48 = a8;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x3032000000;
  v83[3] = __Block_byref_object_copy__9208;
  v83[4] = __Block_byref_object_dispose__9209;
  id v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__9208;
  v81[4] = __Block_byref_object_dispose__9209;
  id v82 = objc_alloc_init(MEMORY[0x263EFF980]);
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__9208;
  v79[4] = __Block_byref_object_dispose__9209;
  id v80 = 0;
  id v52 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  group = dispatch_group_create();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v14)
  {
    uint64_t v60 = *(void *)v76;
    do
    {
      uint64_t v61 = v14;
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v76 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v17 = [v16 objectForKeyedSubscript:@"SelectionCriteria"];
        v18 = v17;
        if (v17)
        {
          int v19 = [v17 objectForKeyedSubscript:@"RequiredFeaturesBitmap"];
          id v20 = [v18 objectForKeyedSubscript:@"CHIPCluster"];
          id v21 = v20;
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22)
          {
            if (v57)
            {
              id v23 = (id)objc_msgSend(objc_alloc(NSClassFromString(v20)), "initWithDevice:endpoint:queue:", v57, (unsigned __int16)objc_msgSend(v55, "unsignedIntegerValue"), queue);
              if (objc_opt_respondsToSelector())
              {
                dispatch_group_enter(group);
                v70[0] = MEMORY[0x263EF8330];
                v70[1] = 3221225472;
                v70[2] = __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke;
                v70[3] = &unk_265378128;
                v70[4] = self;
                v71 = v21;
                v72 = group;
                id v73 = v52;
                v74 = v16;
                [v23 readAttributeFeatureMapWithCompletionHandler:v70];
              }
              else
              {
                long long v34 = (void *)MEMORY[0x2533B64D0]();
                long long v35 = self;
                HMFGetOSLogHandle();
                long long v36 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  long long v37 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  id v86 = v37;
                  __int16 v87 = 2112;
                  id v88 = v23;
                  _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);
                }
              }
            }
            else
            {
              if (!v54)
              {
                _HMFPreconditionFailure();
                __break(1u);
              }
              uint64_t v24 = [(HMMTRProtocolMap *)self mtrClusterNameFromMTRBaseClusterName:v20];
              __int16 v25 = (void *)v24;
              if (v24) {
                id v26 = (void *)v24;
              }
              else {
                id v26 = v21;
              }
              id v23 = v26;

              uint64_t v27 = [(HMMTRProtocolMap *)self createClusterInstance];
              id v28 = ((void (**)(void, id, id, id, NSObject *))v27)[2](v27, v23, v54, v55, queue);

              if (objc_opt_respondsToSelector())
              {
                id v29 = objc_alloc_init(MEMORY[0x263F10FA0]);
                v53 = [v28 readAttributeFeatureMapWithParams:v29];

                id v30 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v53 forIdentify:@"featureMap"];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v31 = v30;
                }
                else {
                  v31 = 0;
                }
                id v32 = v31;

                if (v32)
                {
                  v33 = [v16 objectForKeyedSubscript:@"HAPServiceType"];
                  [v52 setValue:v32 forKey:v33];
                }
                else
                {
                  context = (void *)MEMORY[0x2533B64D0]();
                  v42 = self;
                  HMFGetOSLogHandle();
                  v43 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    v49 = v42;
                    v44 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543618;
                    id v86 = v44;
                    __int16 v87 = 2112;
                    id v88 = v23;
                    _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cluster class %@ feature map is absent from cache", buf, 0x16u);

                    v42 = v49;
                  }
                }
              }
              else
              {
                v38 = (void *)MEMORY[0x2533B64D0]();
                id v39 = self;
                HMFGetOSLogHandle();
                int v40 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v41 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  id v86 = v41;
                  __int16 v87 = 2112;
                  id v88 = v28;
                  _os_log_impl(&dword_252495000, v40, OS_LOG_TYPE_ERROR, "%{public}@Feature map selector not found for cluster: %@", buf, 0x16u);
                }
              }
            }
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v14);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke_389;
  block[3] = &unk_265378150;
  id v63 = obj;
  id v64 = v52;
  v65 = self;
  id v66 = v48;
  v67 = v83;
  v68 = v79;
  v69 = v81;
  id v45 = v48;
  id v46 = v52;
  id v47 = obj;
  dispatch_group_notify(group, queue, block);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v83, 8);
}

void __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received error response from accessory for cluster class %@, Error: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    __int16 v12 = *(void **)(a1 + 56);
    id v13 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"HAPServiceType"];
    [v12 setValue:v5 forKey:v13];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __114__HMMTRProtocolMap__selectedServiceTypeForServiceArray_device_mtrDevice_endpoint_callbackQueue_completionHandler___block_invoke_389(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (!v2) {
    goto LABEL_21;
  }
  uint64_t v3 = v2;
  uint64_t v54 = *(void *)v60;
  while (2)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      id v6 = [v5 objectForKeyedSubscript:@"SelectionCriteria"];
      if (!v6)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
        goto LABEL_21;
      }
      uint64_t v7 = v6;
      id v8 = [v6 objectForKeyedSubscript:@"PriorityOrder"];
      id v9 = [v7 objectForKeyedSubscript:@"RequiredFeaturesBitmap"];
      uint64_t v10 = [v5 objectForKeyedSubscript:@"HAPServiceType"];
      uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
      __int16 v12 = v11;
      if (!v8)
      {
        uint64_t v41 = (void *)MEMORY[0x2533B64D0]();
        id v42 = *(id *)(a1 + 48);
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v65 = v44;
          _os_log_impl(&dword_252495000, v43, OS_LOG_TYPE_ERROR, "%{public}@Error in protocol map plist. Required value for priority order not found", buf, 0xCu);
        }
        uint64_t v45 = *(void *)(a1 + 56);
        id v46 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
        (*(void (**)(uint64_t, void, void *))(v45 + 16))(v45, 0, v46);

        id v8 = 0;
        goto LABEL_43;
      }
      if (v9) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 0;
      }
      if (v13)
      {
        id v47 = (void *)MEMORY[0x2533B64D0]();
        id v48 = *(id *)(a1 + 48);
        v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v65 = v50;
          _os_log_impl(&dword_252495000, v49, OS_LOG_TYPE_ERROR, "%{public}@Could not get feature map value from accessory, aborting HAP service selection", buf, 0xCu);
        }
        uint64_t v51 = *(void *)(a1 + 56);
        __int16 v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:11];
        (*(void (**)(uint64_t, void, void *))(v51 + 16))(v51, 0, v12);
LABEL_43:

        goto LABEL_44;
      }
      if (!v9
        || (uint64_t v14 = [v11 unsignedIntegerValue],
            uint64_t v15 = [v9 unsignedIntegerValue] & v14,
            v15 == [v9 unsignedIntegerValue]))
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
          || (uint64_t v16 = [v8 integerValue],
              v16 < [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) integerValue]))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v8);
        }
      }
    }
    uint64_t v3 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v3) {
      continue;
    }
    break;
  }
LABEL_21:

  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v17)
  {
    __int16 v18 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v19 = [v17 objectForKeyedSubscript:@"HAPServiceType"];
    [v18 addObject:v19];

    uint64_t v20 = (void *)MEMORY[0x2533B64D0]();
    id v21 = *(id *)(a1 + 48);
    BOOL v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = HMFGetLogIdentifier();
      uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:@"Description"];
      __int16 v25 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:@"HAPServiceType"];
      *(_DWORD *)buf = 138543874;
      v65 = v23;
      __int16 v66 = 2112;
      v67 = v24;
      __int16 v68 = 2112;
      v69 = v25;
      _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_INFO, "%{public}@Primary selected service: %@, %@", buf, 0x20u);
    }
    id obj = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:@"OptionalHAPServiceTypes"];
    if (obj)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v26 = obj;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v56 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            id v32 = objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * j), "objectForKeyedSubscript:", @"HAPServiceType", obj);
            [v31 addObject:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v28);
      }
    }
    v33 = (void *)MEMORY[0x2533B64D0]();
    id v34 = *(id *)(a1 + 48);
    long long v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      long long v36 = HMFGetLogIdentifier();
      long long v37 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v65 = v36;
      __int16 v66 = 2112;
      v67 = v37;
      _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_INFO, "%{public}@All selected service types: %@", buf, 0x16u);
    }
    uint64_t v38 = *(void *)(a1 + 56);
    id v39 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) copy];
    (*(void (**)(uint64_t, void *, void))(v38 + 16))(v38, v39, 0);

LABEL_44:
  }
  else
  {
    uint64_t v40 = *(void *)(a1 + 56);
    id obja = [MEMORY[0x263F087E8] hmfErrorWithCode:2];
    (*(void (**)(uint64_t, void))(v40 + 16))(v40, 0);
  }
}

- (id)categoriesForDeviceTypes:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v34 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"CHIPDeviceTypes"];
  if (v34)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v31 = v4;
    id obj = v4;
    uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
    if (v35)
    {
      uint64_t v33 = *(void *)v44;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = v6;
          long long v37 = *(void **)(*((void *)&v43 + 1) + 8 * v6);
          uint64_t v7 = objc_msgSend(v37, "stringValue", v31);
          id v8 = [v34 objectForKeyedSubscript:v7];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v38 = v8;
          uint64_t v9 = [v38 countByEnumeratingWithState:&v39 objects:v53 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v40 != v11) {
                  objc_enumerationMutation(v38);
                }
                BOOL v13 = [*(id *)(*((void *)&v39 + 1) + 8 * i) objectForKeyedSubscript:@"HAPCategory"];
                uint64_t v14 = v13;
                if (v13)
                {
                  uint64_t v15 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v13, "integerValue"));
                  [v5 addObject:v15];
                }
                else
                {
                  uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
                  uint64_t v17 = self;
                  __int16 v18 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    id v19 = self;
                    id v21 = v20 = v5;
                    *(_DWORD *)buf = 138543618;
                    id v48 = v21;
                    __int16 v49 = 2112;
                    id v50 = v37;
                    _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find HAP category for deviceType %@", buf, 0x16u);

                    id v5 = v20;
                    self = v19;
                  }
                }
              }
              uint64_t v10 = [v38 countByEnumeratingWithState:&v39 objects:v53 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v36 + 1;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      }
      while (v35);
    }

    uint64_t v22 = [v5 count];
    id v23 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v24 = self;
    __int16 v25 = HMFGetOSLogHandle();
    id v26 = v25;
    if (v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v48 = v27;
        __int16 v49 = 2112;
        id v50 = obj;
        __int16 v51 = 2112;
        id v52 = v5;
        _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_DEBUG, "%{public}@The categories for the device types %@ : %@", buf, 0x20u);
      }
      id v28 = v5;
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v29;
        __int16 v49 = 2112;
        id v50 = obj;
        _os_log_impl(&dword_252495000, v26, OS_LOG_TYPE_ERROR, "%{public}@No valid HAP categories were found for the device types %@. Returning \"Other\" category.", buf, 0x16u);
      }
      id v28 = &unk_2702B6258;
    }

    id v4 = v31;
  }
  else
  {
    id v28 = &unk_2702B6240;
  }

  return v28;
}

- (BOOL)optionalServiceLabelIndexIncludedInService:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPServices"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v4];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"OptionalServiceLabelIndex"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      if (v11) {
        char v12 = [v11 BOOLValue];
      }
      else {
        char v12 = 0;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2533B64D0]();
      __int16 v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v22, 0x16u);
      }
      char v12 = 0;
    }
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      id v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v22, 0x16u);
    }
    char v12 = 0;
  }

  return v12;
}

- (id)optionalCharacteristicsForService:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPServices"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v4];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"OptionalHAPCharacteristics"];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)requiredCharacteristicsForService:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPServices"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v4];
    id v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"RequiredHAPCharacteristics"];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v19 = 138543618;
        id v20 = v17;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPService dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPServices dictionary from HomeKitMatter's ProtocolMap for service %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_buildEventMapper:(id)a3 characteristicsDict:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 type];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"HAPRange"];
  if (v9
    && (uint64_t v10 = (void *)v9,
        [v7 objectForKeyedSubscript:@"CHIPRange"],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    char v12 = (void *)MEMORY[0x2533B64D0]();
    BOOL v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v32 = v15;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Setting up Linear mappings for Characteristic %@", buf, 0x16u);
    }
    uint64_t v16 = [v7 objectForKeyedSubscript:@"HAPRange"];
    uint64_t v17 = [v7 objectForKeyedSubscript:@"CHIPRange"];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke;
    v26[3] = &unk_2653780D8;
    id v27 = v8;
    id v28 = v17;
    id v29 = v16;
    id v30 = v13;
    id v18 = v16;
    id v19 = v17;
    id v20 = (void *)MEMORY[0x2533B66E0](v26);
    __int16 v21 = (void *)MEMORY[0x2533B66E0]();
  }
  else
  {
    __int16 v21 = [v7 objectForKeyedSubscript:@"SpecialMappingRequired"];

    if (!v21) {
      goto LABEL_9;
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke_274;
    v24[3] = &unk_265378100;
    id v25 = v6;
    id v22 = (void *)MEMORY[0x2533B66E0](v24);
    __int16 v21 = (void *)MEMORY[0x2533B66E0]();

    id v19 = v25;
  }

LABEL_9:
  return v21;
}

id __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v6];
  id v8 = +[HMMTRProtocolMap linearMapForCharacteristic:*(void *)(a1 + 32) value:v7 fromRange:*(void *)(a1 + 40) toRange:*(void *)(a1 + 48)];
  uint64_t v9 = (void *)MEMORY[0x2533B64D0]();
  id v10 = *(id *)(a1 + 56);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    char v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Mapped event value from dictionary %@ to %@.", (uint8_t *)&v14, 0x20u);
  }

  return v8;
}

id __58__HMMTRProtocolMap__buildEventMapper_characteristicsDict___block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HMMTRProtocolMap customMapEventForCharacteristic:*(void *)(a1 + 32) event:a2 value:a3];
}

- (id)_buildExpectedValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 valueMapper:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [v8 objectForKeyedSubscript:@"Read"];
  if (a5 == 1)
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:@"Write"];

    id v10 = (void *)v11;
  }
  id v12 = [v10 objectForKeyedSubscript:@"Type"];
  if ([v12 isEqual:@"String"])
  {
    BOOL v13 = (id *)MEMORY[0x263F10C20];
  }
  else if ([v12 isEqual:@"BOOL"])
  {
    BOOL v13 = (id *)MEMORY[0x263F10B78];
  }
  else if (([v12 isEqual:@"UINT8"] & 1) != 0 {
         || ([v12 isEqual:@"UINT16"] & 1) != 0)
  }
  {
    BOOL v13 = (id *)MEMORY[0x263F10C28];
  }
  else
  {
    if (([v12 isEqual:@"INT8"] & 1) == 0
      && ![v12 isEqual:@"INT16"])
    {
      uint64_t v23 = 0;
      goto LABEL_16;
    }
    BOOL v13 = (id *)MEMORY[0x263F10C08];
  }
  id v14 = *v13;

  uint64_t v15 = (void *)MEMORY[0x263F08B08];
  __int16 v16 = [v8 objectForKeyedSubscript:@"CHIPClusterIDHex"];
  id v17 = [v15 scannerWithString:v16];

  uint64_t v30 = 0;
  [v17 scanHexLongLong:&v30];
  __int16 v18 = [NSNumber numberWithUnsignedLongLong:v30];
  id v19 = [v8 objectForKeyedSubscript:@"CHIPAttributes"];
  uint64_t v20 = 0;
  if ([v19 count] == 1)
  {
    uint64_t v20 = [v19 objectAtIndexedSubscript:0];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__HMMTRProtocolMap__buildExpectedValueMapper_characteristicsDict_operation_valueMapper___block_invoke;
  v25[3] = &unk_2653780B0;
  id v29 = v9;
  id v12 = v14;
  id v26 = v12;
  id v27 = v20;
  id v28 = v18;
  id v21 = v18;
  id v22 = v20;
  uint64_t v23 = (void *)MEMORY[0x2533B66E0](v25);

LABEL_16:
  return v23;
}

id __88__HMMTRProtocolMap__buildExpectedValueMapper_characteristicsDict_operation_valueMapper___block_invoke(void *a1, uint64_t a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = a1[7];
  if (v6)
  {
    uint64_t v7 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

    id v5 = (id)v7;
  }
  id v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  uint64_t v9 = a1[4];
  uint64_t v10 = *MEMORY[0x263F10C30];
  v18[0] = *MEMORY[0x263F10C18];
  v18[1] = v10;
  v19[0] = v9;
  v19[1] = v5;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x263F10B90]];

  if (a1[5])
  {
    id v12 = (void *)MEMORY[0x263F10C50];
    BOOL v13 = [NSNumber numberWithUnsignedInteger:a2];
    id v14 = [v12 attributePathWithEndpointId:v13 clusterId:a1[6] attributeId:a1[5]];

    [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x263F10B70]];
  }
  id v17 = v8;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];

  return v15;
}

- (id)_buildValueMapper:(id)a3 characteristicsDict:(id)a4 operation:(unint64_t)a5 forMTRCluster:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v11 objectForKeyedSubscript:@"HAPRange"];
  if (v12)
  {
    BOOL v13 = (void *)v12;
    id v14 = [v11 objectForKeyedSubscript:@"CHIPRange"];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x2533B64D0]();
      __int16 v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __int16 v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v47 = v18;
        __int16 v48 = 2112;
        id v49 = v10;
        _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Setting up Linear mappings for Characteristic %@", buf, 0x16u);
      }
      id v19 = [v11 objectForKeyedSubscript:@"HAPRange"];
      uint64_t v20 = [v11 objectForKeyedSubscript:@"CHIPRange"];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke;
      v39[3] = &unk_265378040;
      unint64_t v44 = a5;
      BOOL v45 = v6;
      id v40 = v10;
      id v41 = v20;
      id v42 = v19;
      long long v43 = v16;
      id v21 = v19;
      id v22 = v20;
      uint64_t v23 = (void *)MEMORY[0x2533B66E0](v39);
      __int16 v24 = (void *)MEMORY[0x2533B66E0]();

      id v25 = v40;
      goto LABEL_8;
    }
  }
  id v26 = [v11 objectForKeyedSubscript:@"SpecialMappingRequired"];

  if (v26)
  {
    id v27 = [v11 objectForKeyedSubscript:@"HAPRange"];
    id v28 = [v11 objectForKeyedSubscript:@"CHIPRange"];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_252;
    v33[3] = &unk_265378068;
    unint64_t v37 = a5;
    BOOL v38 = v6;
    id v34 = v10;
    id v35 = v28;
    id v36 = v27;
    id v21 = v27;
    id v22 = v28;
    id v29 = (void *)MEMORY[0x2533B66E0](v33);
    __int16 v24 = (void *)MEMORY[0x2533B66E0]();

    id v25 = v34;
LABEL_8:

    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_17:
    __int16 v24 = 0;
    goto LABEL_9;
  }
  if (a5 == 4)
  {
LABEL_16:
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_2;
    v31[3] = &unk_265378868;
    id v32 = v10;
    __int16 v24 = (void *)MEMORY[0x2533B66E0](v31);

    goto LABEL_9;
  }
  if (a5 != 2)
  {
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  __int16 v24 = &__block_literal_global_254;
LABEL_9:

  return v24;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  switch(*(void *)(a1 + 64))
  {
    case 0:
    case 2:
    case 4:
      id v6 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;

      if (*(unsigned char *)(a1 + 72))
      {
        if (*(void *)(a1 + 64) == 2) {
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v6];
        }
        else {
        uint64_t v9 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v6 forIdentify:*(void *)(a1 + 32)];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        id v8 = v11;
      }
      if (v8)
      {
        id v5 = +[HMMTRProtocolMap linearMapForCharacteristic:*(void *)(a1 + 32) value:v8 fromRange:*(void *)(a1 + 40) toRange:*(void *)(a1 + 48)];
      }
      else
      {
        id v5 = 0;
      }

      goto LABEL_18;
    case 1:
      id v5 = +[HMMTRProtocolMap linearMapForCharacteristic:*(void *)(a1 + 32) value:v3 fromRange:*(void *)(a1 + 48) toRange:*(void *)(a1 + 40)];
LABEL_18:
      uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
      id v13 = *(id *)(a1 + 56);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        uint64_t v16 = *(void *)(a1 + 32);
        int v18 = 138544130;
        id v19 = v15;
        __int16 v20 = 2112;
        id v21 = v4;
        __int16 v22 = 2112;
        uint64_t v23 = v5;
        __int16 v24 = 2112;
        uint64_t v25 = v16;
        _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Mapped value from dictionary %@ to %@ for %@.", (uint8_t *)&v18, 0x2Au);
      }
      break;
    default:
      break;
  }

  return v5;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_252(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  switch(*(void *)(a1 + 56))
  {
    case 0:
    case 2:
    case 4:
      id v6 = v3;
      if (*(unsigned char *)(a1 + 64))
      {
        if (*(void *)(a1 + 56) == 2) {
          +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v6];
        }
        else {
        uint64_t v7 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v6 forIdentify:*(void *)(a1 + 32)];
        }

        id v6 = (id)v7;
      }
      id v5 = +[HMMTRProtocolMap customMapReadForCharacteristic:*(void *)(a1 + 32) value:v6 fromRange:*(void *)(a1 + 40) toRange:*(void *)(a1 + 48)];

      break;
    case 1:
      id v5 = +[HMMTRProtocolMap customMapWriteForCharacteristic:*(void *)(a1 + 32) value:v3];
      break;
    default:
      break;
  }

  return v5;
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:a2 forIdentify:*(void *)(a1 + 32)];
}

id __82__HMMTRProtocolMap__buildValueMapper_characteristicsDict_operation_forMTRCluster___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:a2];
}

- (id)getUpdatedLinkedCharacteristics:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v48 = [MEMORY[0x263EFF980] array];
  id v11 = [v8 type];
  uint64_t v12 = -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:", v11, [v9 unsignedIntegerValue], v10);

  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"LinkedCharacteristics"];
    if (v13)
    {
      BOOL v45 = v12;
      id v46 = v10;
      id v47 = v9;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      unint64_t v44 = v13;
      id obj = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v52;
        id v49 = self;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v52 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            id v19 = objc_msgSend(v8, "service", v44, v45, v46, v47);
            __int16 v20 = [v19 characteristicsOfType:v18];
            id v21 = [v20 firstObject];
            __int16 v22 = (void *)[v21 copy];

            if (v22)
            {
              uint64_t v23 = (void *)MEMORY[0x2533B64D0]();
              __int16 v24 = self;
              uint64_t v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                uint64_t v26 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                long long v56 = v26;
                __int16 v57 = 2112;
                long long v58 = v22;
                _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_INFO, "%{public}@Found a linkedCharacteristic %@, checking if it needs to be updated", buf, 0x16u);
              }
              id v27 = [v22 value];
              id v28 = [v8 value];

              if (v27 != v28)
              {
                id v29 = (void *)MEMORY[0x2533B64D0]();
                uint64_t v30 = v24;
                id v31 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  id v32 = HMFGetLogIdentifier();
                  __int16 v33 = [v8 value];
                  *(_DWORD *)buf = 138543874;
                  long long v56 = v32;
                  __int16 v57 = 2112;
                  long long v58 = v33;
                  __int16 v59 = 2112;
                  long long v60 = v22;
                  _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_INFO, "%{public}@Linked Characteristic value differs, forcing an update to %@ for characteristic %@", buf, 0x20u);

                  self = v49;
                }

                id v34 = [v8 value];
                BOOL v35 = [(HMMTRProtocolMap *)v30 _isValidCharacteristicValue:v22 value:v34];

                if (v35)
                {
                  id v36 = (void *)MEMORY[0x2533B64D0]();
                  unint64_t v37 = v30;
                  BOOL v38 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    long long v39 = HMFGetLogIdentifier();
                    id v40 = [v8 value];
                    *(_DWORD *)buf = 138543618;
                    long long v56 = v39;
                    __int16 v57 = 2112;
                    long long v58 = v40;
                    _os_log_impl(&dword_252495000, v38, OS_LOG_TYPE_INFO, "%{public}@Update linked characteristics since value is valid %@", buf, 0x16u);

                    self = v49;
                  }

                  id v41 = [v8 value];
                  [v22 setValue:v41];

                  id v42 = [v8 service];
                  [v22 setService:v42];

                  [v48 addObject:v22];
                }
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v15);
      }

      id v10 = v46;
      id v9 = v47;
      id v13 = v44;
      uint64_t v12 = v45;
    }
  }
  return v48;
}

- (BOOL)_isValidCharacteristicValue:(id)a3 value:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x2533B64D0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v18 = 138543874;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Validating value for characteristics %@ %@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v12 = [v6 validateValue:v7 outValue:0];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v14 = v9;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543874;
      id v19 = v16;
      __int16 v20 = 2112;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate value for characteristics %@ with error %@", (uint8_t *)&v18, 0x20u);
    }
  }

  return v12 == 0;
}

- (id)descriptionOfMTRClusterForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7
{
  return [(HMMTRProtocolMap *)self _descriptionForCharacteristicUUID:a3 operation:a4 value:a5 forMTRCluster:1 endpointID:a6 clusterIDCharacteristicMap:a7];
}

- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 endpointID:(unint64_t)a6 clusterIDCharacteristicMap:(id)a7
{
  return [(HMMTRProtocolMap *)self _descriptionForCharacteristicUUID:a3 operation:a4 value:a5 forMTRCluster:0 endpointID:a6 clusterIDCharacteristicMap:a7];
}

- (id)_descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 value:(id)a5 forMTRCluster:(BOOL)a6 endpointID:(unint64_t)a7 clusterIDCharacteristicMap:(id)a8
{
  BOOL v10 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [(HMMTRProtocolMap *)self _characteristicsDictionaryForCharacteristicUUID:v14 endpointID:a7 clusterIDCharacteristicMap:v16];
  int v18 = v17;
  if (v17)
  {
    id v19 = [v17 objectForKeyedSubscript:@"CHIPCluster"];
    __int16 v20 = v19;
    if (a4 == 3)
    {

      __int16 v20 = @"CHIPBinding";
    }
    else if (v10)
    {
      __int16 v22 = [(HMMTRProtocolMap *)self mtrClusterNameFromMTRBaseClusterName:v19];
      id v23 = v22;
      if (v22)
      {
        uint64_t v24 = v22;

        __int16 v20 = v24;
      }
      else
      {
        context = (void *)MEMORY[0x2533B64D0]();
        id v29 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v31 = v27;
          __int16 v32 = 2112;
          __int16 v33 = v20;
          _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Sync variation of base cluster class %@ is unknown", buf, 0x16u);
        }
      }
    }
    id v21 = [(HMMTRProtocolMap *)self _characteristicDescriptionForCharacteristicWithUUID:v14 characteristicsDict:v18 chipClusterName:v20 operationType:a4 value:v15 forMTRCluster:v10];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)mtrBaseClusterNameFromMTRClusterName:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"MTRCluster"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"MTRCluster", "length")];
    id v5 = @"MTRBaseCluster";
LABEL_5:
    id v6 = [(__CFString *)v5 stringByAppendingString:v4];

    goto LABEL_7;
  }
  if ([v3 hasPrefix:@"HMMTRSyncCluster"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"HMMTRSyncCluster", "length")];
    id v5 = @"HMMTR";
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)mtrClusterNameFromMTRBaseClusterName:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"MTRBaseCluster"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"MTRBaseCluster", "length")];
    id v5 = @"MTRCluster";
LABEL_5:
    id v6 = [(__CFString *)v5 stringByAppendingString:v4];

    goto LABEL_6;
  }
  if ([v3 hasPrefix:@"HMMTR"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"HMMTR", "length")];
    id v5 = @"HMMTRSyncCluster";
    goto LABEL_5;
  }
  if ([v3 hasPrefix:@"MTRCluster"]) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)_characteristicsDictionaryForCharacteristic:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPCharacteristics"];
  BOOL v38 = v8;
  id v11 = [v10 objectForKeyedSubscript:v8];
  if (v11)
  {
    unint64_t v33 = a4;
    uint64_t v34 = self;
    id v36 = v10;
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
    id v37 = v9;
    id v13 = [v9 objectForKey:v12];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    BOOL v35 = v11;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          __int16 v20 = [v19 objectForKeyedSubscript:@"CHIPClusterIDHex"];
          id v21 = [v13 objectForKeyedSubscript:v38];
          char v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            id v27 = v19;

            goto LABEL_14;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v23 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v24 = v34;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      BOOL v45 = v26;
      __int16 v46 = 2112;
      id v47 = v38;
      __int16 v48 = 2048;
      unint64_t v49 = v33;
      _os_log_impl(&dword_252495000, v25, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported for endpoint %lu", buf, 0x20u);
    }
    id v27 = 0;
LABEL_14:
    BOOL v10 = v36;
    id v9 = v37;
    id v11 = v35;
  }
  else
  {
    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      BOOL v45 = v31;
      __int16 v46 = 2112;
      id v47 = v38;
      __int16 v48 = 2048;
      unint64_t v49 = a4;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_ERROR, "%{public}@Mapping Characteristic %@ is not supported for endpoint %lu", buf, 0x20u);
    }
    id v27 = 0;
  }

  return v27;
}

- (id)_characteristicsDictionaryForCharacteristicUUID:(id)a3 endpointID:(unint64_t)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v8];
  if (v10)
  {
    id v11 = [(HMMTRProtocolMap *)self _characteristicsDictionaryForCharacteristic:v10 endpointID:a4 clusterIDCharacteristicMap:v9];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      int v17 = 138543874;
      int v18 = v15;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristicUUID. Does not convert to a short integer. UUID:%@ shortened: %@", (uint8_t *)&v17, 0x20u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)_characteristicDescriptionForCharacteristicWithUUID:(id)a3 characteristicsDict:(id)a4 chipClusterName:(id)a5 operationType:(unint64_t)a6 value:(id)a7 forMTRCluster:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  int v18 = [(HMMTRProtocolMap *)self _protocolMapCharacteristicsKeyForOperationType:a6];
  id v64 = v16;
  if (v18)
  {
    __int16 v19 = [v15 objectForKeyedSubscript:v18];
    if (v19)
    {
      id v63 = v14;
      uint64_t v62 = [(HMMTRProtocolMap *)self _chipClusterFunctionNameForOperationType:a6 operationDictionary:v19 value:v17 forMTRCluster:v8];
      id v20 = [[HMMTRClusterDescription alloc] initWithClass:v16 selectorString:v62];
      uint64_t v21 = [v15 objectForKeyedSubscript:@"ConfigureReport"];
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        char v23 = [v64 hasPrefix:@"HMMTR"];

        if ((v23 & 1) == 0)
        {
          uint64_t v24 = [v15 objectForKeyedSubscript:@"CHIPAttributes"];
          if ([v24 count] == 1)
          {
            [v15 objectForKeyedSubscript:@"CHIPClusterIDHex"];
            long long v61 = v65 = 0;
            uint64_t v25 = objc_msgSend(MEMORY[0x263F08B08], "scannerWithString:");
            if ([v25 scanHexInt:&v65])
            {
              [v24 objectAtIndexedSubscript:0];
              uint64_t v26 = v59 = v25;
              [(HMMTRClusterDescription *)v20 setAttributeID:v26];

              id v27 = [NSNumber numberWithUnsignedInt:v65];
              [(HMMTRClusterDescription *)v20 setClusterID:v27];

              uint64_t v25 = v59;
            }
            else
            {
              context = (void *)MEMORY[0x2533B64D0]();
              long long v58 = self;
              log = HMFGetOSLogHandle();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                id v37 = v60 = v25;
                *(_DWORD *)buf = 138543874;
                v67 = v37;
                __int16 v68 = 2112;
                id v69 = v61;
                __int16 v70 = 2112;
                uint64_t v71 = v63;
                _os_log_impl(&dword_252495000, log, OS_LOG_TYPE_ERROR, "%{public}@Bad clusterId: %@ defined in protocol map for characteristic %@", buf, 0x20u);

                uint64_t v25 = v60;
              }
            }
          }
        }
      }
      if (v8)
      {
        if ([v62 hasPrefix:@"writeAttribute"]) {
          [(HMMTRClusterDescription *)v20 setSyncWriteFunc:1];
        }
        BOOL v39 = a6 != 2 || v62 == 0;
        long long v40 = [(HMMTRProtocolMap *)self _buildValueMapper:v63 characteristicsDict:v15 operation:a6 forMTRCluster:v39];
        [(HMMTRClusterDescription *)v20 setMapValue:v40];

        long long v41 = [(HMMTRClusterDescription *)v20 mapValue];
        long long v42 = [(HMMTRProtocolMap *)self _buildExpectedValueMapper:v63 characteristicsDict:v15 operation:a6 valueMapper:v41];
        [(HMMTRClusterDescription *)v20 setMapWriteValueToExpectedValues:v42];
      }
      else
      {
        long long v41 = [(HMMTRProtocolMap *)self _buildValueMapper:v63 characteristicsDict:v15 operation:a6 forMTRCluster:0];
        [(HMMTRClusterDescription *)v20 setMapValue:v41];
      }

      long long v43 = [(HMMTRProtocolMap *)self _chipParamsDictionaryForOperationType:a6 operationDictionary:v19 value:v17];
      if (v43)
      {
        id v44 = objc_alloc(MEMORY[0x263EFF9A0]);
        BOOL v45 = [v43 objectForKeyedSubscript:@"DefaultArgs"];
        __int16 v46 = (void *)[v44 initWithDictionary:v45];

        id v47 = [v43 objectForKeyedSubscript:@"PrimaryArgSelector"];
        if (v47)
        {
          __int16 v48 = [(HMMTRClusterDescription *)v20 mapValue];

          if (v48)
          {
            unint64_t v49 = [(HMMTRClusterDescription *)v20 mapValue];
            uint64_t v50 = ((void (**)(void, id))v49)[2](v49, v17);

            id v17 = (id)v50;
          }
          [v46 setObject:v17 forKey:v47];
        }
        long long v51 = [v43 objectForKeyedSubscript:@"ParamsClass"];
        [(HMMTRClusterDescription *)v20 setParamsClass:NSClassFromString(v51)];

        long long v52 = [v43 objectForKeyedSubscript:@"ParamsIndex"];
        [(HMMTRClusterDescription *)v20 setParamsIndex:v52];

        [(HMMTRClusterDescription *)v20 setParamsArguments:v46];
      }
      else
      {
        long long v53 = [v19 objectForKeyedSubscript:@"DefaultArgs"];
        [(HMMTRClusterDescription *)v20 setArguments:v53];

        __int16 v46 = [v19 objectForKeyedSubscript:@"ArgIndex"];
        [(HMMTRClusterDescription *)v20 setPrimaryArgIndex:v46];
      }

      long long v54 = [v19 objectForKeyedSubscript:@"Type"];
      [(HMMTRClusterDescription *)v20 setPrimaryArgType:v54];

      id v14 = v63;
    }
    else
    {
      unint64_t v33 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v34 = self;
      BOOL v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v67 = v36;
        __int16 v68 = 2112;
        id v69 = v14;
        _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_INFO, "%{public}@No Information for Characteristic %@", buf, 0x16u);
      }
      id v20 = 0;
    }
  }
  else
  {
    id v28 = (void *)MEMORY[0x2533B64D0]();
    id v29 = self;
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = HMFGetLogIdentifier();
      __int16 v32 = [NSNumber numberWithUnsignedInteger:a6];
      *(_DWORD *)buf = 138543874;
      v67 = v31;
      __int16 v68 = 2112;
      id v69 = v14;
      __int16 v70 = 2112;
      uint64_t v71 = v32;
      _os_log_impl(&dword_252495000, v30, OS_LOG_TYPE_INFO, "%{public}@No dictionary key for Characteristic %@ for operation type %@", buf, 0x20u);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)reportDescriptionForCharacteristic:(id)a3 endpointID:(id)a4 clusterIDCharacteristicMap:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 type];
  uint64_t v12 = +[HMMTRUtilities hmmtr_shortTypeFromUUID:v11];

  id v13 = [v10 objectForKeyedSubscript:v9];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    unsigned int v57 = 0;
    id v15 = [MEMORY[0x263F08B08] scannerWithString:v14];
    if ([v15 scanHexInt:&v57])
    {
      id v16 = [v8 type];
      id v17 = -[HMMTRProtocolMap _characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:](self, "_characteristicsDictionaryForCharacteristicUUID:endpointID:clusterIDCharacteristicMap:", v16, [v9 unsignedIntegerValue], v10);

      if (v17)
      {
        int v18 = [v17 objectForKeyedSubscript:@"ConfigureReport"];
        if (v18)
        {
          long long v51 = v15;
          uint64_t v19 = [v17 objectForKeyedSubscript:@"CHIPAttributes"];
          uint64_t v20 = [v17 objectForKeyedSubscript:@"CHIPEvents"];
          context = (void *)v19;
          if (v19 | v20)
          {
            [v8 type];
            uint64_t v21 = v54 = v18;
            unint64_t v49 = [(HMMTRProtocolMap *)self _buildValueMapper:v21 characteristicsDict:v17 operation:2 forMTRCluster:1];

            __int16 v48 = [(HMMTRProtocolMap *)self _buildEventMapper:v8 characteristicsDict:v17];
            uint64_t v22 = [HMMTRReportDescription alloc];
            char v23 = [NSNumber numberWithUnsignedInt:v57];
            uint64_t v24 = [(HMMTRReportDescription *)v22 initWithClusterId:v23 attributeIds:context eventIds:v20];

            [(HMMTRReportDescription *)v24 setMapValue:v49];
            [(HMMTRReportDescription *)v24 setMapEvent:v48];
            uint64_t v25 = [v17 objectForKeyedSubscript:@"CHIPCluster"];
            [(HMMTRReportDescription *)v24 setClusterClass:v25];

            uint64_t v26 = self;
            id v27 = context;
            id v28 = [(HMMTRProtocolMap *)v26 _chipClusterFunctionNameForOperationType:2 operationDictionary:v54 value:0 forMTRCluster:0];
            [(HMMTRReportDescription *)v24 setClusterSelector:v28];

            int v18 = v54;
          }
          else
          {
            uint64_t v50 = (void *)MEMORY[0x2533B64D0]();
            id v44 = self;
            BOOL v45 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              __int16 v46 = v56 = v18;
              *(_DWORD *)buf = 138543618;
              __int16 v59 = v46;
              __int16 v60 = 2112;
              id v61 = v8;
              _os_log_impl(&dword_252495000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Neither attributes array nor events array. Cannot handle reports for characteristic: %@", buf, 0x16u);

              int v18 = v56;
            }

            uint64_t v24 = 0;
            id v27 = context;
          }

          id v15 = v51;
        }
        else
        {
          contexta = (void *)MEMORY[0x2533B64D0]();
          long long v41 = self;
          long long v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            long long v43 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v59 = v43;
            __int16 v60 = 2112;
            id v61 = v8;
            _os_log_impl(&dword_252495000, v42, OS_LOG_TYPE_DEBUG, "%{public}@No subscription Dict. Cannot handle reports for characteristic: %@", buf, 0x16u);

            int v18 = 0;
          }

          uint64_t v24 = 0;
        }
      }
      else
      {
        id v37 = (void *)MEMORY[0x2533B64D0]();
        BOOL v38 = self;
        BOOL v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          long long v40 = v55 = v37;
          *(_DWORD *)buf = 138543618;
          __int16 v59 = v40;
          __int16 v60 = 2112;
          id v61 = v8;
          _os_log_impl(&dword_252495000, v39, OS_LOG_TYPE_DEBUG, "%{public}@No characteristic Dict. Cannot handle reports for characteristic: %@", buf, 0x16u);

          id v37 = v55;
        }

        uint64_t v24 = 0;
      }
    }
    else
    {
      unint64_t v33 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v34 = self;
      BOOL v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        id v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v59 = v36;
        __int16 v60 = 2112;
        id v61 = v8;
        _os_log_impl(&dword_252495000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Unknown ClusterId. Cannot handle reports for characteristic: %@", buf, 0x16u);
      }
      uint64_t v24 = 0;
    }
  }
  else
  {
    id v29 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v30 = self;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      __int16 v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v59 = v32;
      __int16 v60 = 2112;
      id v61 = v8;
      _os_log_impl(&dword_252495000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Cannot handle reports for characteristic: %@", buf, 0x16u);
    }
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)_protocolMapCharacteristicsKeyForOperationType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 < 5) {
    return off_2653781C0[a3];
  }
  id v6 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unsupported Operation type %lu", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (id)_chipClusterFunctionNameForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5 forMTRCluster:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  if (a3 == 1)
  {
    __int16 v12 = [v10 objectForKeyedSubscript:@"Type"];
    if ([v12 isEqualToString:@"BOOL"])
    {
      if ([v11 BOOLValue]) {
        unint64_t v13 = @"1";
      }
      else {
        unint64_t v13 = @"0";
      }
      uint64_t v14 = [v10 objectForKeyedSubscript:v13];
      id v15 = [v14 objectForKeyedSubscript:@"Selector"];

      if (!v6) {
        goto LABEL_16;
      }
      goto LABEL_12;
    }
    id v15 = [v10 objectForKeyedSubscript:@"Selector"];
    if (v6)
    {
LABEL_12:
      uint64_t v18 = [(HMMTRProtocolMap *)self mtrClusterWriteFunctionNameFromBaseClusterFunctionName:v15];

      id v15 = (void *)v18;
    }
  }
  else
  {
    id v16 = [v10 objectForKeyedSubscript:@"Selector"];
    __int16 v12 = v16;
    if (v6)
    {
      if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
        goto LABEL_17;
      }
      uint64_t v17 = [(HMMTRProtocolMap *)self mtrClusterReadFunctionNameFromBaseClusterFunctionName:v16];
    }
    else
    {
      if (a3 != 4) {
        goto LABEL_17;
      }
      uint64_t v17 = [v16 stringByReplacingOccurrencesOfString:@"WithCompletionHandler:" withString:@"WithAttributeCache:endpoint:queue:completionHandler:"];
    }
    id v15 = (void *)v17;
  }
LABEL_16:

  __int16 v12 = v15;
LABEL_17:

  return v12;
}

- (id)mtrClusterWriteFunctionNameFromBaseClusterFunctionName:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasSuffix:@"WithCompletionHandler:"])
  {
    int v5 = [v4 hasPrefix:@"writeAttribute"];
    BOOL v6 = [v4 substringToIndex:objc_msgSend(v4, "length") - objc_msgSend(@"WithCompletionHandler:", "length")];
    if (v5) {
      id v7 = @"WithExpectedValueInterval:";
    }
    else {
      id v7 = @"WithExpectedValues:expectedValueInterval:completionHandler:";
    }
LABEL_12:
    id v10 = [v6 stringByAppendingString:v7];

    if (v10) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if ([v4 hasSuffix:@":completionHandler:"])
  {
    int v8 = [v4 hasPrefix:@"writeAttribute"];
    BOOL v6 = [v4 substringToIndex:objc_msgSend(v4, "length") - objc_msgSend(@":completionHandler:", "length")];
    if (!v8)
    {
      id v7 = @":expectedValues:expectedValueInterval:completionHandler:";
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ([v4 hasSuffix:@":completion:"])
  {
    int v9 = [v4 hasPrefix:@"writeAttribute"];
    BOOL v6 = [v4 substringToIndex:objc_msgSend(v4, "length") - objc_msgSend(@":completion:", "length")];
    if (!v9)
    {
      id v7 = @":expectedValues:expectedValueInterval:completion:";
      goto LABEL_12;
    }
LABEL_10:
    id v7 = @":expectedValueInterval:";
    goto LABEL_12;
  }
LABEL_13:
  id v11 = (void *)MEMORY[0x2533B64D0]();
  __int16 v12 = self;
  unint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot derive MTRCluster function name from a bad MTRBaseCluster function name: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = 0;
LABEL_16:

  return v10;
}

- (id)mtrClusterReadFunctionNameFromBaseClusterFunctionName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasSuffix:@"WithCompletionHandler:"])
  {
    uint64_t v5 = [v4 length];
    BOOL v6 = @"WithCompletionHandler:";
LABEL_5:
    id v7 = objc_msgSend(v4, "substringToIndex:", v5 - -[__CFString length](v6, "length"));
    id v8 = [v7 stringByAppendingString:@"WithParams:"];

    goto LABEL_6;
  }
  if ([v4 hasSuffix:@"WithCompletion:"])
  {
    uint64_t v5 = [v4 length];
    BOOL v6 = @"WithCompletion:";
    goto LABEL_5;
  }
  if ([v4 hasSuffix:@"WithParams:"])
  {
    id v8 = v4;
  }
  else
  {
    id v10 = (void *)MEMORY[0x2533B64D0]();
    id v11 = self;
    __int16 v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v13;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_252495000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot derive MTRCluster function name from a bad MTRBaseCluster function name: %@", (uint8_t *)&v14, 0x16u);
    }
    id v8 = 0;
  }
LABEL_6:

  return v8;
}

- (id)_chipParamsDictionaryForOperationType:(unint64_t)a3 operationDictionary:(id)a4 value:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 == 1)
  {
    int v9 = [v7 objectForKeyedSubscript:@"Type"];
    if ([v9 isEqualToString:@"BOOL"])
    {
      if ([v8 BOOLValue]) {
        id v10 = @"1";
      }
      else {
        id v10 = @"0";
      }
      id v11 = [v7 objectForKeyedSubscript:v10];
      __int16 v12 = [v11 objectForKeyedSubscript:@"Params"];
    }
    else
    {
      __int16 v12 = [v7 objectForKeyedSubscript:@"Params"];
    }
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

- (id)descriptionForCharacteristicUUID:(id)a3 operation:(unint64_t)a4 endpointID:(unint64_t)a5 clusterIDCharacteristicMap:(id)a6
{
  return [(HMMTRProtocolMap *)self descriptionForCharacteristicUUID:a3 operation:a4 value:0 endpointID:a5 clusterIDCharacteristicMap:a6];
}

- (id)retrieveHAPToCHIPClusterMapping
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [(NSDictionary *)self->_rawPlist objectForKeyedSubscript:@"HAPCharacteristics"];
  if (v3)
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v3;
    id v4 = v3;
    uint64_t v22 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v4);
          }
          uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
          id v8 = [v4 objectForKeyedSubscript:v6];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v24 != v11) {
                  objc_enumerationMutation(v8);
                }
                unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "objectForKeyedSubscript:", @"CHIPClusterIDHex", v19);
                if (v13) {
                  [v7 addObject:v13];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v10);
          }
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v7, v6, v19);
        }
        uint64_t v22 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }

    id v3 = v19;
  }
  else
  {
    int v14 = (void *)MEMORY[0x2533B64D0]();
    id v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v17;
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to read HAPCharacteristic dictionary from HomeKitMatter's ProtocolMap.", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

- (HMMTRProtocolMap)init
{
  v15.receiver = self;
  v15.super_class = (Class)HMMTRProtocolMap;
  uint64_t v2 = [(HMMTRProtocolMap *)&v15 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 pathForResource:@"chipplugin-protocol-map" ofType:@"plist"];

    uint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:v4];
    rawPlist = v2->_rawPlist;
    v2->_rawPlist = (NSDictionary *)v5;

    uint64_t v7 = [(NSDictionary *)v2->_rawPlist objectForKeyedSubscript:@"Version"];
    version = v2->_version;
    v2->_version = (NSNumber *)v7;

    uint64_t v9 = [(NSDictionary *)v2->_rawPlist objectForKeyedSubscript:@"SchemaVersion"];
    schemaVersion = v2->_schemaVersion;
    v2->_schemaVersion = (NSNumber *)v9;

    uint64_t v11 = [(HMMTRProtocolMap *)v2 retrieveHAPToCHIPClusterMapping];
    hapToCHIPClusterMappingArray = v2->_hapToCHIPClusterMappingArray;
    v2->_hapToCHIPClusterMappingArray = (NSDictionary *)v11;

    id createClusterInstance = v2->_createClusterInstance;
    v2->_id createClusterInstance = &__block_literal_global_183;
  }
  return v2;
}

id __24__HMMTRProtocolMap_init__block_invoke(uint64_t a1, NSString *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc(NSClassFromString(a2)) initWithDevice:v10 endpointID:v9 queue:v8];

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t86 != -1) {
    dispatch_once(&logCategory__hmf_once_t86, &__block_literal_global_463);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v87;
  return v2;
}

uint64_t __31__HMMTRProtocolMap_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v87;
  logCategory__hmf_once___int16 v87 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)customMapEventForCharacteristic:(id)a3 event:(id)a4 value:(id)a5
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 type];
  __int16 v12 = (void *)MEMORY[0x2533B64D0]();
  id v13 = a1;
  int v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_super v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v102 = v15;
    __int16 v103 = 2112;
    id v104 = v8;
    __int16 v105 = 2112;
    id v106 = v9;
    __int16 v107 = 2112;
    id v108 = v10;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_DEBUG, "%{public}@customMapEventForCharacteristic characteristic %@ event %@ value %@", buf, 0x2Au);
  }
  if ([v11 isEqualToString:@"00000073-0000-1000-8000-0026BB765291"])
  {
    __int16 v16 = [v8 metadata];
    id v17 = [v16 constraints];
    uint64_t v18 = [v17 validValues];

    id v19 = [v8 service];
    uint64_t v20 = [v19 accessory];
    id v21 = [v20 server];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;

    long long v24 = [v23 protocolMappingStateForCharacteristic:v8];

    uint64_t v90 = v18;
    if ([v9 isEqualToNumber:&unk_2702B5E38])
    {
      [v24 setShouldIgnoreSingleMultiPressComplete:0];
      if (([v18 containsObject:&unk_2702B5E38] & 1) == 0)
      {
        if ([v18 containsObject:&unk_2702B5E50]) {
          long long v25 = 0;
        }
        else {
          long long v25 = &unk_2702B5E20;
        }
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if ([v9 isEqualToNumber:&unk_2702B5E50])
    {
      if ([v18 containsObject:&unk_2702B5E50])
      {
        [v24 setShouldIgnoreSingleMultiPressComplete:1];
        long long v25 = &unk_2702B5E50;
      }
      else
      {
        id v47 = v24;
        __int16 v48 = (void *)MEMORY[0x2533B64D0]();
        id v49 = v13;
        uint64_t v50 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          long long v51 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v102 = v51;
          __int16 v103 = 2112;
          id v104 = v8;
          _os_log_impl(&dword_252495000, v50, OS_LOG_TYPE_ERROR, "%{public}@Unexpected (feature-map excluded) LongPress event for %@", buf, 0x16u);
        }
        long long v25 = 0;
        long long v24 = v47;
      }
      goto LABEL_92;
    }
    if ([v9 isEqualToNumber:&unk_2702B5E68])
    {
      if (([v18 containsObject:&unk_2702B5E38] & 1) == 0)
      {
        if ([v18 containsObject:&unk_2702B5E50]) {
          long long v25 = &unk_2702B5E20;
        }
        else {
          long long v25 = 0;
        }
        goto LABEL_92;
      }
      goto LABEL_91;
    }
    if ([v9 isEqualToNumber:&unk_2702B5E80])
    {
      __int16 v87 = v11;
      id v52 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v53 = v52;
      }
      else {
        long long v53 = 0;
      }
      id v54 = v53;

      v81 = v54;
      uint64_t v55 = [v54 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v56 = v55;
      }
      else {
        long long v56 = 0;
      }
      id v57 = v56;

      long long v58 = v57;
      __int16 v59 = [v57 objectForKeyedSubscript:*MEMORY[0x263F10C18]];
      int v60 = [v59 isEqual:*MEMORY[0x263F10C10]];

      id v61 = 0;
      if (v60)
      {
        uint64_t v62 = [v57 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v63 = v62;
        }
        else {
          id v63 = 0;
        }
        id v64 = v63;

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v65 = v64;
        uint64_t v66 = [v65 countByEnumeratingWithState:&v95 objects:v100 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          v89 = v24;
          id v83 = v10;
          id v85 = v9;
          uint64_t v68 = *(void *)v96;
          uint64_t v69 = *MEMORY[0x263F10B88];
          while (2)
          {
            for (uint64_t i = 0; i != v67; ++i)
            {
              if (*(void *)v96 != v68) {
                objc_enumerationMutation(v65);
              }
              uint64_t v71 = *(void **)(*((void *)&v95 + 1) + 8 * i);
              uint64_t v72 = [v71 objectForKeyedSubscript:v69];
              int v73 = [v72 isEqual:&unk_2702B5E38];

              if (v73)
              {
                long long v76 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v71];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  long long v77 = v76;
                }
                else {
                  long long v77 = 0;
                }
                id v61 = v77;

                goto LABEL_78;
              }
            }
            uint64_t v67 = [v65 countByEnumeratingWithState:&v95 objects:v100 count:16];
            if (v67) {
              continue;
            }
            break;
          }
          id v61 = 0;
LABEL_78:
          id v10 = v83;
          id v9 = v85;
          long long v24 = v89;
          uint64_t v18 = v90;
        }
        else
        {
          id v61 = 0;
        }
      }
      int v78 = [v24 shouldIgnoreSingleMultiPressComplete];
      [v24 setShouldIgnoreSingleMultiPressComplete:0];
      if (![v18 containsObject:&unk_2702B5E38])
      {
        long long v25 = 0;
        uint64_t v11 = v87;
LABEL_89:

        goto LABEL_92;
      }
      uint64_t v11 = v87;
      if (v61)
      {
        int v79 = [v61 unsignedCharValue];
        if (v79 == 2)
        {
          long long v25 = &unk_2702B5E38;
        }
        else if (v79 == 1)
        {
          if (v78) {
            long long v25 = 0;
          }
          else {
            long long v25 = &unk_2702B5E20;
          }
        }
        else
        {
          long long v25 = 0;
        }
        goto LABEL_89;
      }
    }
LABEL_91:
    long long v25 = 0;
    goto LABEL_92;
  }
  if ([v11 isEqualToString:@"0000001D-0000-1000-8000-0026BB765291"]
    && [v9 isEqualToNumber:&unk_2702B5E20])
  {
    id v86 = v11;
    id v26 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v27 = v26;
    }
    else {
      long long v27 = 0;
    }
    id v28 = v27;

    uint64_t v90 = v28;
    long long v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v30 = v29;
    }
    else {
      long long v30 = 0;
    }
    id v31 = v30;

    id v88 = v31;
    __int16 v32 = [v31 objectForKeyedSubscript:*MEMORY[0x263F10C18]];
    int v33 = [v32 isEqual:*MEMORY[0x263F10C10]];

    uint64_t v34 = 0;
    if (v33)
    {
      id v82 = v10;
      id v84 = v9;
      uint64_t v35 = [v31 objectForKeyedSubscript:*MEMORY[0x263F10C30]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v36 = v35;
      }
      else {
        id v36 = 0;
      }
      id v37 = v36;

      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id v38 = v37;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v91 objects:v99 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v92;
        uint64_t v42 = *MEMORY[0x263F10B88];
LABEL_26:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v92 != v41) {
            objc_enumerationMutation(v38);
          }
          id v44 = *(void **)(*((void *)&v91 + 1) + 8 * v43);
          BOOL v45 = [v44 objectForKeyedSubscript:v42];
          char v46 = [v45 isEqual:&unk_2702B5E20];

          if (v46) {
            break;
          }
          if (v40 == ++v43)
          {
            uint64_t v40 = [v38 countByEnumeratingWithState:&v91 objects:v99 count:16];
            if (v40) {
              goto LABEL_26;
            }
            goto LABEL_32;
          }
        }
        uint64_t v34 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:v44];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v74 = v34;
        }
        else {
          v74 = 0;
        }
        id v75 = v74;

        if (!v75) {
          goto LABEL_71;
        }
        id v10 = v82;
        id v9 = v84;
        if (![v75 isEqualToNumber:&unk_2702B5D30]) {
          goto LABEL_72;
        }

        long long v25 = &unk_2702B5DC0;
        goto LABEL_73;
      }
LABEL_32:

LABEL_71:
      uint64_t v34 = 0;
      id v10 = v82;
      id v9 = v84;
    }
LABEL_72:

    long long v25 = 0;
LABEL_73:
    uint64_t v11 = v86;
    long long v24 = v88;
LABEL_92:

    goto LABEL_93;
  }
  long long v25 = 0;
LABEL_93:

  return v25;
}

+ (id)customMapWriteForCharacteristic:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[HMMTRProtocolMap checkIfCharacteristicsIsOfTypeTemp:v6])
  {
    id v8 = NSNumber;
    [v7 doubleValue];
    uint64_t v10 = [v8 numberWithDouble:v9 * 100.0];
LABEL_15:
    uint64_t v11 = (void *)v10;
    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"0000000F-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapCurrentHeatingCoolingState:v7];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"00000033-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapTargetHeatingCoolingState:v7];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"000000B0-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapActiveState:v7];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"000000BF-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapTargetFanState:v7];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"00000028-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapRotationDirection:v7];
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"000000A8-0000-1000-8000-0026BB765291"])
  {
    uint64_t v10 = [a1 mapTargetAirPuriferState:v7];
    goto LABEL_15;
  }
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

+ (id)customMapReadForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 isEqualToString:@"0000006B-0000-1000-8000-0026BB765291"])
  {
    if (([v10 isEqualToString:@"0000001D-0000-1000-8000-0026BB765291"] & 1) != 0
      || [v10 isEqualToString:@"0000001E-0000-1000-8000-0026BB765291"])
    {
      unint64_t v22 = [v11 integerValue];
      if (v22 < 3)
      {
        id v21 = (void *)qword_2653782D8[v22];
        goto LABEL_22;
      }
    }
    if (+[HMMTRProtocolMap checkIfCharacteristicsIsOfTypeTemp:](HMMTRProtocolMap, "checkIfCharacteristicsIsOfTypeTemp:", v10)|| [v10 isEqualToString:@"00000010-0000-1000-8000-0026BB765291"])
    {
      id v23 = NSNumber;
      id v24 = v11;
      id v21 = objc_msgSend(v23, "numberWithDouble:", (double)objc_msgSend(v24, "integerValue") / 100.0);

      goto LABEL_22;
    }
    if ([v10 isEqualToString:@"0000006A-0000-1000-8000-0026BB765291"])
    {
      int v37 = [v11 BOOLValue];
      id v38 = &unk_2702B5E38;
      if (v37) {
        id v38 = &unk_2702B5E20;
      }
      id v39 = v38;
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"0000000F-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapCurrentSystemMode:v11];
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"00000033-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapTargetSystemMode:v11];
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"00000072-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapPositionState:v11];
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"00000079-0000-1000-8000-0026BB765291"])
    {
      if ([v11 integerValue] <= 0) {
        id v21 = &unk_2702B5DA8;
      }
      else {
        id v21 = &unk_2702B5D90;
      }
      goto LABEL_22;
    }
    if ([v10 isEqualToString:@"0000008F-0000-1000-8000-0026BB765291"])
    {
      if ([v11 integerValue] == 1) {
        id v21 = &unk_2702B5D90;
      }
      else {
        id v21 = &unk_2702B5DA8;
      }
      goto LABEL_22;
    }
    if ([v10 isEqualToString:@"000000B0-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapFanModeToActive:v11];
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"000000BF-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapFanModeToTargetFanState:v11];
      goto LABEL_35;
    }
    if ([v10 isEqualToString:@"00000028-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapAirflowDirection:v11];
      goto LABEL_35;
    }
LABEL_51:
    if ([v10 isEqualToString:@"000000A8-0000-1000-8000-0026BB765291"])
    {
      id v39 = [a1 mapFanModeToTargetAirPurifier:v11];
    }
    else
    {
      if (![v10 isEqualToString:@"00000095-0000-1000-8000-0026BB765291"])
      {
        id v21 = 0;
        goto LABEL_22;
      }
      id v39 = [a1 mapAirQuality:v11];
    }
LABEL_35:
    id v21 = v39;
    goto LABEL_22;
  }
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_51;
  }
  id v14 = v11;
  objc_super v15 = v14;
  if (v14)
  {
    if ([v14 isEqualToNumber:&unk_2702B5E20])
    {
      __int16 v16 = (void *)MEMORY[0x2533B64D0]();
      id v17 = a1;
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = HMFGetLogIdentifier();
        uint64_t v20 = [v13 objectAtIndexedSubscript:0];
        int v40 = 138543618;
        uint64_t v41 = v19;
        __int16 v42 = 2112;
        uint64_t v43 = v20;
        _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Illuminance value was too low to be measured.  Return min HAP light level value %@", (uint8_t *)&v40, 0x16u);
      }
      id v21 = [v13 objectAtIndexedSubscript:0];
    }
    else
    {
      long long v29 = NSNumber;
      [v15 floatValue];
      double v31 = __exp10((float)((float)(v30 + -1.0) / 10000.0));
      *(float *)&double v31 = v31;
      id v21 = [v29 numberWithFloat:v31];
      __int16 v32 = (void *)MEMORY[0x2533B64D0]();
      id v33 = a1;
      uint64_t v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = HMFGetLogIdentifier();
        int v40 = 138543874;
        uint64_t v41 = v35;
        __int16 v42 = 2112;
        uint64_t v43 = v15;
        __int16 v44 = 2112;
        BOOL v45 = v21;
        _os_log_impl(&dword_252495000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Read CurrentLightLevel measured value: %@, lux value: %@", (uint8_t *)&v40, 0x20u);
      }
    }
  }
  else
  {
    long long v25 = (void *)MEMORY[0x2533B64D0]();
    id v26 = a1;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      id v28 = HMFGetLogIdentifier();
      int v40 = 138543362;
      uint64_t v41 = v28;
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Illuminance value was invalid, return nil.", (uint8_t *)&v40, 0xCu);
    }
    id v21 = 0;
  }

LABEL_22:
  return v21;
}

+ (BOOL)checkIfCharacteristicsIsOfTypeTemp:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"00000011-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v3 isEqualToString:@"00000035-0000-1000-8000-0026BB765291"] & 1) != 0
    || ([v3 isEqualToString:@"0000000D-0000-1000-8000-0026BB765291"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"00000012-0000-1000-8000-0026BB765291"];
  }

  return v4;
}

+ (id)mapPositionState:(id)a3
{
  char v3 = [a3 integerValue];
  if ((v3 & 3) == 3) {
    return 0;
  }
  else {
    return (id)qword_2653782C0[v3 & 3];
  }
}

+ (id)mapTargetSystemMode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 integerValue];
  if ((unint64_t)(v5 - 3) < 2) {
    goto LABEL_4;
  }
  if (v5 == 1)
  {
    id v6 = &unk_2702B5DD8;
  }
  else
  {
    if (!v5)
    {
LABEL_4:
      id v6 = [a1 mapCurrentSystemMode:v4];
      goto LABEL_9;
    }
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = a1;
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Target System Mode: Mapping unknown value:%@ to HomeKit HeatingCooling State Off", (uint8_t *)&v12, 0x16u);
    }
    id v6 = &unk_2702B5DA8;
  }
LABEL_9:

  return v6;
}

+ (id)mapCurrentSystemMode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 integerValue];
  if (v5 < 5 && ((0x1Bu >> v5) & 1) != 0)
  {
    id v10 = (void *)qword_265378298[v5];
  }
  else
  {
    id v6 = (void *)MEMORY[0x2533B64D0]();
    id v7 = a1;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Current System Mode: Mapping unknown value:%@ to HomeKit HeatingCooling State Off", (uint8_t *)&v12, 0x16u);
    }
    id v10 = &unk_2702B5DA8;
  }

  return v10;
}

+ (id)mapTargetHeatingCoolingState:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 integerValue];
  if (v5 >= 3)
  {
    if (v5 == 3) {
      id v6 = &unk_2702B5D90;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [a1 mapCurrentHeatingCoolingState:v4];
  }

  return v6;
}

+ (id)mapCurrentHeatingCoolingState:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 2) {
    return 0;
  }
  else {
    return (id)qword_265378280[v3];
  }
}

+ (id)mapAirQuality:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 6) {
    return 0;
  }
  else {
    return (id)qword_265378248[v3];
  }
}

+ (id)mapFanModeToTargetAirPurifier:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 5) {
    return 0;
  }
  else {
    return (id)qword_265378218[v3];
  }
}

+ (id)mapFanModeToTargetFanState:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 5) {
    return 0;
  }
  else {
    return (id)qword_265378218[v3];
  }
}

+ (id)mapAirflowDirection:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_2702B5D90;
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return &unk_2702B5DA8;
  }
}

+ (id)mapFanModeToActive:(id)a3
{
  unint64_t v3 = [a3 integerValue];
  if (v3 > 5) {
    return 0;
  }
  else {
    return (id)qword_2653781E8[v3];
  }
}

+ (id)mapTargetAirPuriferState:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_2702B5D60;
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return &unk_2702B5D48;
  }
}

+ (id)mapRotationDirection:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_2702B5D78;
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return &unk_2702B5D30;
  }
}

+ (id)mapTargetFanState:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_2702B5D60;
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return &unk_2702B5D48;
  }
}

+ (id)mapActiveState:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  id v4 = &unk_2702B5D48;
  if (v3 != 1) {
    id v4 = 0;
  }
  if (v3) {
    return v4;
  }
  else {
    return &unk_2702B5D30;
  }
}

+ (id)linearMapForCharacteristic:(id)a3 value:(id)a4 fromRange:(id)a5 toRange:(id)a6
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  int v47 = *(unsigned __int8 *)[v14 objCType];
  id v15 = (void *)MEMORY[0x2533B64D0]();
  id v16 = a1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    id v49 = v18;
    __int16 v50 = 2112;
    id v51 = v14;
    __int16 v52 = 2112;
    id v53 = v10;
    __int16 v54 = 2112;
    id v55 = v12;
    __int16 v56 = 2112;
    id v57 = v13;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Scaling value:%@ for characteristic: %@ linearly from %@ to %@", buf, 0x34u);
  }
  [v14 doubleValue];
  double v20 = v19;
  id v21 = [v12 objectAtIndexedSubscript:0];
  [v21 doubleValue];
  double v23 = v20 - v22;
  id v24 = [v12 objectAtIndexedSubscript:1];
  [v24 doubleValue];
  double v26 = v25;
  long long v27 = [v12 objectAtIndexedSubscript:0];
  [v27 doubleValue];
  double v29 = v23 / (v26 - v28);
  float v30 = [v13 objectAtIndexedSubscript:1];
  [v30 doubleValue];
  double v32 = v31;
  id v33 = [v13 objectAtIndexedSubscript:0];
  [v33 doubleValue];
  double v35 = v32 - v34;
  id v36 = [v13 objectAtIndexedSubscript:0];
  [v36 doubleValue];
  double v38 = v37 + v29 * v35;

  if ((v47 | 2) == 0x66)
  {
    id v39 = [NSNumber numberWithDouble:v38];
    goto LABEL_9;
  }
  int v40 = [NSNumber numberWithLong:llround(v38)];
  uint64_t v41 = [v13 objectAtIndexedSubscript:0];
  if (v40 != v41) {
    goto LABEL_6;
  }
  uint64_t v44 = [v12 objectAtIndexedSubscript:0];
  if ((id)v44 == v14)
  {

    uint64_t v41 = v40;
LABEL_6:

    goto LABEL_7;
  }
  BOOL v45 = (void *)v44;
  int v46 = [v10 isEqualToString:@"00000008-0000-1000-8000-0026BB765291"];

  if (v46)
  {
    id v42 = [NSNumber numberWithLong:vcvtpd_s64_f64(v38)];
    goto LABEL_8;
  }
LABEL_7:
  id v42 = v40;
LABEL_8:
  id v39 = v42;

LABEL_9:
  return v39;
}

+ (id)protocolMap
{
  if (protocolMap_onceToken != -1) {
    dispatch_once(&protocolMap_onceToken, &__block_literal_global_9481);
  }
  uint64_t v2 = (void *)cachedProtocolmap;
  return v2;
}

uint64_t __31__HMMTRProtocolMap_protocolMap__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMMTRProtocolMap);
  uint64_t v1 = cachedProtocolmap;
  cachedProtocolmap = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end