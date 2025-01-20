@interface SAHASearchCriteriaFilter(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHASearchCriteriaFilter(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F97088];
  v4 = [a1 homeIdentifier];
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E4F97090];
  v6 = [a1 homeName];
  appendToShortDescription(v2, v5, v6);

  v7 = (void *)*MEMORY[0x1E4F970E0];
  v8 = [a1 zoneIdentifier];
  appendToShortDescription(v2, v7, v8);

  v9 = (void *)*MEMORY[0x1E4F970E8];
  v10 = [a1 zoneName];
  appendToShortDescription(v2, v9, v10);

  v11 = (void *)*MEMORY[0x1E4F97098];
  v12 = [a1 roomIdentifier];
  appendToShortDescription(v2, v11, v12);

  v13 = (void *)*MEMORY[0x1E4F970A0];
  v14 = [a1 roomName];
  appendToShortDescription(v2, v13, v14);

  v15 = (void *)*MEMORY[0x1E4F970C0];
  v16 = [a1 serviceGroupIdentifier];
  appendToShortDescription(v2, v15, v16);

  v17 = (void *)*MEMORY[0x1E4F97080];
  v18 = [a1 groupName];
  appendToShortDescription(v2, v17, v18);

  v19 = (void *)*MEMORY[0x1E4F970B0];
  v20 = [a1 sceneName];
  appendToShortDescription(v2, v19, v20);

  v21 = (void *)*MEMORY[0x1E4F97078];
  v22 = [a1 entityType];
  appendToShortDescription(v2, v21, v22);

  v23 = (void *)*MEMORY[0x1E4F97060];
  v24 = [a1 accessoryIdentifier];
  appendToShortDescription(v2, v23, v24);

  v25 = (void *)*MEMORY[0x1E4F97068];
  v26 = [a1 accessoryName];
  appendToShortDescription(v2, v25, v26);

  v27 = (void *)*MEMORY[0x1E4F970D8];
  v28 = [a1 serviceType];
  appendToShortDescription(v2, v27, v28);

  v29 = (void *)*MEMORY[0x1E4F970C8];
  v30 = [a1 serviceIdentifier];
  appendToShortDescription(v2, v29, v30);

  v31 = (void *)*MEMORY[0x1E4F970D0];
  v32 = [a1 serviceName];
  appendToShortDescription(v2, v31, v32);

  v33 = (void *)*MEMORY[0x1E4F970A8];
  v34 = [a1 sceneIdentifier];
  appendToShortDescription(v2, v33, v34);

  v35 = (void *)*MEMORY[0x1E4F970B8];
  v36 = [a1 sceneType];
  appendToShortDescription(v2, v35, v36);

  v37 = (void *)*MEMORY[0x1E4F97070];
  v38 = [a1 attribute];
  appendToShortDescription(v2, v37, v38);

  [v2 appendString:@"  "];
  v39 = [a1 attribute];
  appendToShortDescription(v2, v37, v39);

  return v2;
}

@end