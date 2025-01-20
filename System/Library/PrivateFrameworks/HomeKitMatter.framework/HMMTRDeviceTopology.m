@interface HMMTRDeviceTopology
- (BOOL)isHAPCharacteristicDisabledAtEndpoint:(id)a3 hapServiceType:(id)a4 hapCharacteristic:(id)a5;
- (HMMTRDeviceTopology)init;
- (HMMTRDeviceTopology)initWithNodeId:(id)a3 server:(id)a4;
- (HMMTRDeviceTopology)initWithTopologyDictionary:(id)a3;
- (NSMutableDictionary)clustersInUse;
- (NSMutableDictionary)deviceAttributeValues;
- (NSMutableDictionary)deviceFeatureMapValues;
- (NSMutableDictionary)fixedLabels;
- (NSMutableDictionary)hapCategories;
- (NSMutableDictionary)hapDisabledCharacteristics;
- (NSMutableDictionary)hapServiceTypes;
- (NSMutableDictionary)nodeLabels;
- (NSMutableDictionary)otaRequestorEndpoints;
- (NSMutableDictionary)partsList;
- (NSMutableDictionary)versions;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)getAttributesForClusterClassName:(id)a3 endpoint:(id)a4;
- (id)getBridgeAggregateNodeEndpoint;
- (id)getClustersInUseAtEndpoint:(id)a3;
- (id)getEnabledOTARequestorEndpoint;
- (id)getEndpoints;
- (id)getFeatureMapForClusterClassName:(id)a3 endpoint:(id)a4;
- (id)getFixedLabelsAtEndpoint:(id)a3;
- (id)getHAPCategoriesAtEndpoint:(id)a3;
- (id)getHAPServiceTypesAtEndpoint:(id)a3;
- (id)getNodeLabelAtEndpoint:(id)a3;
- (id)getOTARequestorEndpoints;
- (id)getPartsListAtEndpoint:(id)a3;
- (id)getVersionForKey:(id)a3;
- (void)setClustersInUse:(id)a3;
- (void)setDeviceAttributeValues:(id)a3;
- (void)setDeviceFeatureMapValues:(id)a3;
- (void)setFixedLabels:(id)a3;
- (void)setHapCategories:(id)a3;
- (void)setHapDisabledCharacteristics:(id)a3;
- (void)setHapServiceTypes:(id)a3;
- (void)setNodeLabels:(id)a3;
- (void)setOtaRequestorEndpoints:(id)a3;
- (void)setPartsList:(id)a3;
- (void)setVersions:(id)a3;
@end

@implementation HMMTRDeviceTopology

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaRequestorEndpoints, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_fixedLabels, 0);
  objc_storeStrong((id *)&self->_partsList, 0);
  objc_storeStrong((id *)&self->_hapCategories, 0);
  objc_storeStrong((id *)&self->_nodeLabels, 0);
  objc_storeStrong((id *)&self->_deviceAttributeValues, 0);
  objc_storeStrong((id *)&self->_deviceFeatureMapValues, 0);
  objc_storeStrong((id *)&self->_hapDisabledCharacteristics, 0);
  objc_storeStrong((id *)&self->_clustersInUse, 0);
  objc_storeStrong((id *)&self->_hapServiceTypes, 0);
}

- (void)setOtaRequestorEndpoints:(id)a3
{
}

- (NSMutableDictionary)otaRequestorEndpoints
{
  return self->_otaRequestorEndpoints;
}

- (void)setVersions:(id)a3
{
}

- (NSMutableDictionary)versions
{
  return self->_versions;
}

- (void)setFixedLabels:(id)a3
{
}

- (NSMutableDictionary)fixedLabels
{
  return self->_fixedLabels;
}

- (void)setPartsList:(id)a3
{
}

- (NSMutableDictionary)partsList
{
  return self->_partsList;
}

- (void)setHapCategories:(id)a3
{
}

- (NSMutableDictionary)hapCategories
{
  return self->_hapCategories;
}

- (void)setNodeLabels:(id)a3
{
}

- (NSMutableDictionary)nodeLabels
{
  return self->_nodeLabels;
}

- (void)setDeviceAttributeValues:(id)a3
{
}

- (NSMutableDictionary)deviceAttributeValues
{
  return self->_deviceAttributeValues;
}

- (void)setDeviceFeatureMapValues:(id)a3
{
}

- (NSMutableDictionary)deviceFeatureMapValues
{
  return self->_deviceFeatureMapValues;
}

- (void)setHapDisabledCharacteristics:(id)a3
{
}

- (NSMutableDictionary)hapDisabledCharacteristics
{
  return self->_hapDisabledCharacteristics;
}

- (void)setClustersInUse:(id)a3
{
}

- (NSMutableDictionary)clustersInUse
{
  return self->_clustersInUse;
}

- (void)setHapServiceTypes:(id)a3
{
}

- (NSMutableDictionary)hapServiceTypes
{
  return self->_hapServiceTypes;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMMTRDeviceTopology *)self _dictionaryRepresentation];
  v4 = [v2 stringWithFormat:@"Device Topology:%@", v3];

  return v4;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(HMMTRDeviceTopology *)self hapServiceTypes];
  [v3 setObject:v4 forKey:@"HAPServiceTypes"];

  v5 = [(HMMTRDeviceTopology *)self clustersInUse];
  [v3 setObject:v5 forKey:@"ClustersInUse"];

  v6 = [(HMMTRDeviceTopology *)self hapCategories];
  [v3 setObject:v6 forKey:@"HAPCategories"];

  v7 = [(HMMTRDeviceTopology *)self hapDisabledCharacteristics];
  [v3 setObject:v7 forKey:@"HAPDisabledCharacteristics"];

  v8 = [(HMMTRDeviceTopology *)self deviceFeatureMapValues];
  [v3 setObject:v8 forKey:@"DeviceFeatureMapValues"];

  v9 = [(HMMTRDeviceTopology *)self deviceAttributeValues];
  [v3 setObject:v9 forKey:@"DeviceAttributeValues"];

  v10 = [(HMMTRDeviceTopology *)self nodeLabels];
  [v3 setObject:v10 forKey:@"NodeLabels"];

  v11 = [(HMMTRDeviceTopology *)self partsList];
  [v3 setObject:v11 forKey:@"PartsList"];

  v12 = [(HMMTRDeviceTopology *)self fixedLabels];
  [v3 setObject:v12 forKey:@"FixedLabels"];

  v13 = [(HMMTRDeviceTopology *)self versions];
  [v3 setObject:v13 forKey:@"Versions"];

  v14 = [(HMMTRDeviceTopology *)self otaRequestorEndpoints];
  [v3 setObject:v14 forKey:@"OTARequestorEndpoints"];

  return v3;
}

- (id)getEnabledOTARequestorEndpoint
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(NSMutableDictionary *)self->_otaRequestorEndpoints allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [(NSMutableDictionary *)self->_otaRequestorEndpoints objectForKey:v7];
        v9 = [NSNumber numberWithBool:1];
        char v10 = [v8 isEqualToNumber:v9];

        if (v10)
        {
          v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue"));
          goto LABEL_11;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)getOTARequestorEndpoints
{
  return self->_otaRequestorEndpoints;
}

- (id)getVersionForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRDeviceTopology *)self versions];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)getFixedLabelsAtEndpoint:(id)a3
{
  fixedLabels = self->_fixedLabels;
  id v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)fixedLabels objectForKeyedSubscript:v4];

  return v5;
}

- (id)getPartsListAtEndpoint:(id)a3
{
  partsList = self->_partsList;
  id v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)partsList objectForKeyedSubscript:v4];

  return v5;
}

- (id)getNodeLabelAtEndpoint:(id)a3
{
  nodeLabels = self->_nodeLabels;
  id v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)nodeLabels objectForKeyedSubscript:v4];

  return v5;
}

- (id)getAttributesForClusterClassName:(id)a3 endpoint:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  deviceAttributeValues = self->_deviceAttributeValues;
  id v51 = v7;
  v9 = [v7 stringValue];
  char v10 = [(NSMutableDictionary *)deviceAttributeValues objectForKeyedSubscript:v9];

  v46 = (void *)[v6 copy];
  v11 = @"MTRCluster";
  if (([v6 hasPrefix:@"MTRCluster"] & 1) != 0
    || (v11 = @"MTRBaseCluster", ([v6 hasPrefix:@"MTRBaseCluster"] & 1) != 0)
    || (v11 = @"HMMTR", [v6 hasPrefix:@"HMMTR"]))
  {
    uint64_t v12 = objc_msgSend(v6, "substringFromIndex:", -[__CFString length](v11, "length"));

    v46 = (void *)v12;
  }
  if ([v10 count])
  {
    v42 = v10;
    id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v10;
    uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v52)
    {
      uint64_t v13 = *(void *)v55;
      long long v14 = @":";
      uint64_t v47 = *(void *)v55;
      id v49 = v6;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(obj);
          }
          long long v16 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "componentsSeparatedByString:", v14, v42);
          if ((unint64_t)[v16 count] > 2)
          {
            v22 = [v16 objectAtIndexedSubscript:0];
            uint64_t v23 = [v16 objectAtIndexedSubscript:1];
            v24 = (void *)v23;
            if (v22) {
              BOOL v25 = v23 == 0;
            }
            else {
              BOOL v25 = 1;
            }
            if (!v25 && [v22 hasSuffix:v46])
            {
              id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v53 = objc_alloc_init(MEMORY[0x263F08A30]);
              [v53 setNumberStyle:1];
              if ((unint64_t)[v16 count] < 3) {
                goto LABEL_29;
              }
              v44 = v24;
              v45 = v22;
              char v27 = 1;
              unsigned int v28 = 3;
              uint64_t v29 = 2;
              v30 = v26;
              v31 = v53;
              v48 = v30;
              do
              {
                v32 = [v16 objectAtIndexedSubscript:v29];
                v33 = [v31 numberFromString:v32];

                if (v33)
                {
                  [v30 addObject:v33];
                }
                else
                {
                  v34 = (void *)MEMORY[0x2533B64D0]();
                  v35 = self;
                  v36 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v37 = v14;
                    v39 = v38 = self;
                    *(_DWORD *)buf = 138544130;
                    v59 = v39;
                    __int16 v60 = 2112;
                    v61 = v16;
                    __int16 v62 = 2112;
                    uint64_t v63 = (uint64_t)v49;
                    __int16 v64 = 2112;
                    id v65 = v51;
                    _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to parse attribute string %@ for cluster %@ on endpoint %@, skipping.", buf, 0x2Au);

                    self = v38;
                    long long v14 = v37;
                    v30 = v48;
                  }

                  char v27 = 0;
                  v31 = v53;
                }

                uint64_t v29 = v28;
              }
              while ([v16 count] > (unint64_t)v28++);
              uint64_t v13 = v47;
              id v26 = v30;
              v24 = v44;
              v22 = v45;
              if (v27) {
LABEL_29:
              }
                [v43 setObject:v26 forKey:v24];

              id v6 = v49;
            }
          }
          else
          {
            long long v17 = (void *)MEMORY[0x2533B64D0]();
            v18 = self;
            uint64_t v19 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v20 = HMFGetLogIdentifier();
              uint64_t v21 = [v16 count];
              *(_DWORD *)buf = 138544386;
              v59 = v20;
              __int16 v60 = 2112;
              v61 = v16;
              __int16 v62 = 2048;
              uint64_t v63 = v21;
              __int16 v64 = 2112;
              id v65 = v6;
              __int16 v66 = 2112;
              id v67 = v51;
              _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid attribute string %@ and count %lu, for cluster %@ on endpoint %@", buf, 0x34u);

              uint64_t v13 = v47;
            }
          }
        }
        uint64_t v52 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v52);
    }

    char v10 = v42;
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

- (id)getFeatureMapForClusterClassName:(id)a3 endpoint:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  deviceFeatureMapValues = self->_deviceFeatureMapValues;
  v8 = [a4 stringValue];
  v9 = [(NSMutableDictionary *)deviceFeatureMapValues objectForKeyedSubscript:v8];

  BOOL v25 = v6;
  BOOL v23 = ([v6 isEqualToString:@"MTRBaseClusterColorControl"] & 1) != 0
     || [v6 isEqualToString:@"HMMTRColorControl"];
  if ([v9 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v22 = v9;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v14 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "componentsSeparatedByString:", @":", v22);
          long long v15 = [v14 objectAtIndexedSubscript:0];
          id v16 = objc_alloc_init(MEMORY[0x263F08A30]);
          [v16 setNumberStyle:1];
          long long v17 = [v14 objectAtIndexedSubscript:1];
          v18 = [v16 numberFromString:v17];

          if (v15) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19
            && (v23 && ([v15 hasSuffix:@"ColorControl"] & 1) != 0
             || ([v25 isEqualToString:v15] & 1) != 0))
          {
            id v20 = v18;

            goto LABEL_22;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v20 = 0;
LABEL_22:
      v9 = v22;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (BOOL)isHAPCharacteristicDisabledAtEndpoint:(id)a3 hapServiceType:(id)a4 hapCharacteristic:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  hapDisabledCharacteristics = self->_hapDisabledCharacteristics;
  uint64_t v11 = [a3 stringValue];
  uint64_t v12 = [(NSMutableDictionary *)hapDisabledCharacteristics objectForKeyedSubscript:v11];

  if ([v12 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      BOOL v25 = v12;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) componentsSeparatedByString:@":"];
          BOOL v19 = [v18 objectAtIndexedSubscript:0];
          uint64_t v20 = [v18 objectAtIndexedSubscript:1];
          uint64_t v21 = (void *)v20;
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22
            && [v8 isEqualToString:v19]
            && ([v9 isEqualToString:v21] & 1) != 0)
          {

            BOOL v23 = 1;
            goto LABEL_18;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      BOOL v23 = 0;
LABEL_18:
      uint64_t v12 = v25;
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)getEndpoints
{
  v2 = [(NSMutableDictionary *)self->_clustersInUse allKeys];
  uint64_t v3 = [v2 valueForKeyPath:@"self.integerValue"];

  return v3;
}

- (id)getBridgeAggregateNodeEndpoint
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_hapCategories allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    unint64_t v7 = 0x263F08000uLL;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(*(id *)(v7 + 2584), "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "intValue"));
        uint64_t v10 = [(HMMTRDeviceTopology *)self getHAPCategoriesAtEndpoint:v9];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if (v16 && ([v16 isEqual:&unk_2702B54C0] & 1) != 0)
              {

                goto LABEL_20;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
        unint64_t v7 = 0x263F08000;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v9 = 0;
    }
    while (v5);
  }
  else
  {
    id v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)getHAPCategoriesAtEndpoint:(id)a3
{
  hapCategories = self->_hapCategories;
  uint64_t v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)hapCategories objectForKeyedSubscript:v4];

  return v5;
}

- (id)getClustersInUseAtEndpoint:(id)a3
{
  clustersInUse = self->_clustersInUse;
  uint64_t v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)clustersInUse objectForKeyedSubscript:v4];

  return v5;
}

- (id)getHAPServiceTypesAtEndpoint:(id)a3
{
  hapServiceTypes = self->_hapServiceTypes;
  uint64_t v4 = [a3 stringValue];
  uint64_t v5 = [(NSMutableDictionary *)hapServiceTypes objectForKeyedSubscript:v4];

  return v5;
}

- (HMMTRDeviceTopology)initWithTopologyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRDeviceTopology *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    hapServiceTypes = v5->_hapServiceTypes;
    id v8 = [v4 objectForKey:@"HAPServiceTypes"];
    [(NSMutableDictionary *)hapServiceTypes addEntriesFromDictionary:v8];

    clustersInUse = v6->_clustersInUse;
    uint64_t v10 = [v4 objectForKey:@"ClustersInUse"];
    [(NSMutableDictionary *)clustersInUse addEntriesFromDictionary:v10];

    hapCategories = v6->_hapCategories;
    uint64_t v12 = [v4 objectForKey:@"HAPCategories"];
    [(NSMutableDictionary *)hapCategories addEntriesFromDictionary:v12];

    hapDisabledCharacteristics = v6->_hapDisabledCharacteristics;
    uint64_t v14 = [v4 objectForKey:@"HAPDisabledCharacteristics"];
    [(NSMutableDictionary *)hapDisabledCharacteristics addEntriesFromDictionary:v14];

    deviceFeatureMapValues = v6->_deviceFeatureMapValues;
    uint64_t v16 = [v4 objectForKey:@"DeviceFeatureMapValues"];
    [(NSMutableDictionary *)deviceFeatureMapValues addEntriesFromDictionary:v16];

    deviceAttributeValues = v6->_deviceAttributeValues;
    uint64_t v18 = [v4 objectForKey:@"DeviceAttributeValues"];
    [(NSMutableDictionary *)deviceAttributeValues addEntriesFromDictionary:v18];

    nodeLabels = v6->_nodeLabels;
    long long v20 = [v4 objectForKey:@"NodeLabels"];
    [(NSMutableDictionary *)nodeLabels addEntriesFromDictionary:v20];

    partsList = v6->_partsList;
    long long v22 = [v4 objectForKey:@"PartsList"];
    [(NSMutableDictionary *)partsList addEntriesFromDictionary:v22];

    fixedLabels = v6->_fixedLabels;
    long long v24 = [v4 objectForKey:@"FixedLabels"];
    [(NSMutableDictionary *)fixedLabels addEntriesFromDictionary:v24];

    versions = v6->_versions;
    long long v26 = [v4 objectForKeyedSubscript:@"Versions"];
    [(NSMutableDictionary *)versions addEntriesFromDictionary:v26];

    otaRequestorEndpoints = v6->_otaRequestorEndpoints;
    long long v28 = [v4 objectForKeyedSubscript:@"OTARequestorEndpoints"];
    [(NSMutableDictionary *)otaRequestorEndpoints addEntriesFromDictionary:v28];
  }
  return v6;
}

- (HMMTRDeviceTopology)initWithNodeId:(id)a3 server:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMMTRDeviceTopology *)self init];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = [v7 topology];
  if (!v9)
  {
    uint64_t v18 = (void *)MEMORY[0x2533B64D0]();
    long long v19 = v8;
    long long v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v21;
      __int16 v49 = 2112;
      id v50 = v6;
      _os_log_impl(&dword_252495000, v20, OS_LOG_TYPE_ERROR, "%{public}@No enumeration/topology dictionary found for NodeId:%@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  uint64_t v10 = (void *)v9;
  id v46 = 0;
  id v11 = [MEMORY[0x263F08AC0] propertyListWithData:v9 options:0 format:0 error:&v46];
  id v12 = v46;
  if (!v12)
  {
    hapServiceTypes = v8->_hapServiceTypes;
    long long v24 = [v11 objectForKey:@"HAPServiceTypes"];
    [(NSMutableDictionary *)hapServiceTypes addEntriesFromDictionary:v24];

    clustersInUse = v8->_clustersInUse;
    long long v26 = [v11 objectForKey:@"ClustersInUse"];
    [(NSMutableDictionary *)clustersInUse addEntriesFromDictionary:v26];

    hapCategories = v8->_hapCategories;
    long long v28 = [v11 objectForKey:@"HAPCategories"];
    [(NSMutableDictionary *)hapCategories addEntriesFromDictionary:v28];

    hapDisabledCharacteristics = v8->_hapDisabledCharacteristics;
    v30 = [v11 objectForKey:@"HAPDisabledCharacteristics"];
    [(NSMutableDictionary *)hapDisabledCharacteristics addEntriesFromDictionary:v30];

    deviceFeatureMapValues = v8->_deviceFeatureMapValues;
    v32 = [v11 objectForKey:@"DeviceFeatureMapValues"];
    [(NSMutableDictionary *)deviceFeatureMapValues addEntriesFromDictionary:v32];

    deviceAttributeValues = v8->_deviceAttributeValues;
    v34 = [v11 objectForKey:@"DeviceAttributeValues"];
    [(NSMutableDictionary *)deviceAttributeValues addEntriesFromDictionary:v34];

    nodeLabels = v8->_nodeLabels;
    v36 = [v11 objectForKey:@"NodeLabels"];
    [(NSMutableDictionary *)nodeLabels addEntriesFromDictionary:v36];

    partsList = v8->_partsList;
    v38 = [v11 objectForKey:@"PartsList"];
    [(NSMutableDictionary *)partsList addEntriesFromDictionary:v38];

    fixedLabels = v8->_fixedLabels;
    v40 = [v11 objectForKey:@"FixedLabels"];
    [(NSMutableDictionary *)fixedLabels addEntriesFromDictionary:v40];

    versions = v8->_versions;
    v42 = [v11 objectForKeyedSubscript:@"Versions"];
    [(NSMutableDictionary *)versions addEntriesFromDictionary:v42];

    otaRequestorEndpoints = v8->_otaRequestorEndpoints;
    v44 = [v11 objectForKeyedSubscript:@"OTARequestorEndpoints"];
    [(NSMutableDictionary *)otaRequestorEndpoints addEntriesFromDictionary:v44];

LABEL_12:
    long long v22 = v8;
    goto LABEL_13;
  }
  uint64_t v13 = v12;
  uint64_t v14 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v15 = v8;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    long long v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v17;
    __int16 v49 = 2112;
    id v50 = v13;
    _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not decode string to generate topology dictionary. Error: %@", buf, 0x16u);
  }

LABEL_10:
  long long v22 = 0;
LABEL_13:

  return v22;
}

- (HMMTRDeviceTopology)init
{
  v26.receiver = self;
  v26.super_class = (Class)HMMTRDeviceTopology;
  v2 = [(HMMTRDeviceTopology *)&v26 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    hapServiceTypes = v2->_hapServiceTypes;
    v2->_hapServiceTypes = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clustersInUse = v2->_clustersInUse;
    v2->_clustersInUse = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    hapCategories = v2->_hapCategories;
    v2->_hapCategories = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    hapDisabledCharacteristics = v2->_hapDisabledCharacteristics;
    v2->_hapDisabledCharacteristics = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceFeatureMapValues = v2->_deviceFeatureMapValues;
    v2->_deviceFeatureMapValues = v11;

    uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    deviceAttributeValues = v2->_deviceAttributeValues;
    v2->_deviceAttributeValues = v13;

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    nodeLabels = v2->_nodeLabels;
    v2->_nodeLabels = v15;

    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    partsList = v2->_partsList;
    v2->_partsList = v17;

    long long v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fixedLabels = v2->_fixedLabels;
    v2->_fixedLabels = v19;

    long long v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    versions = v2->_versions;
    v2->_versions = v21;

    long long v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    otaRequestorEndpoints = v2->_otaRequestorEndpoints;
    v2->_otaRequestorEndpoints = v23;
  }
  return v2;
}

@end