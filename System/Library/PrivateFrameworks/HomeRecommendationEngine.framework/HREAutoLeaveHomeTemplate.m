@interface HREAutoLeaveHomeTemplate
- (HREAutoLeaveHomeTemplate)init;
- (id)_lazy_actionMap;
@end

@implementation HREAutoLeaveHomeTemplate

- (HREAutoLeaveHomeTemplate)init
{
  v16[7] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)HREAutoLeaveHomeTemplate;
  v2 = [(HRETemplate *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(HREPresenceTriggerTemplate *)v2 setPresenceType:4];
    [(HREPresenceTriggerTemplate *)v3 setPresenceUserType:2];
    if (_MergedGlobals_17 != -1) {
      dispatch_once(&_MergedGlobals_17, &__block_literal_global_3_2);
    }
    id v4 = (id)qword_268944B68;
    [(HRETemplate *)v3 setIdentifier:v4];

    [(HRETemplate *)v3 setSortingPriority:0.2];
    [(HRETemplate *)v3 setStarterRank:1.8];
    id v5 = objc_alloc(MEMORY[0x263F47B68]);
    v6 = (void *)[v5 initWithImageIdentifier:*MEMORY[0x263F47978]];
    [(HRETriggerTemplate *)v3 setDefaultIconDescriptor:v6];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = *MEMORY[0x263F0D6C8];
    v16[0] = *MEMORY[0x263F0D780];
    v16[1] = v8;
    uint64_t v9 = *MEMORY[0x263F0D850];
    v16[2] = *MEMORY[0x263F0D890];
    v16[3] = v9;
    v10 = HRETelevisionProfileType();
    uint64_t v11 = *MEMORY[0x263F0D720];
    v16[4] = v10;
    v16[5] = v11;
    v16[6] = *MEMORY[0x263F0D618];
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:7];
    v13 = [v7 setWithArray:v12];
    [(HREActionTemplate *)v3 setExtraInvolvedTypes:v13];
  }
  return v3;
}

void __32__HREAutoLeaveHomeTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944B68;
  qword_268944B68 = @"autoLeaveHome";
}

- (id)_lazy_actionMap
{
  v41[8] = *MEMORY[0x263EF8340];
  v40[0] = @"HREServiceTypeAll";
  uint64_t v2 = *MEMORY[0x263F0BEF8];
  v38[0] = *MEMORY[0x263F0C328];
  v38[1] = v2;
  v39[0] = MEMORY[0x263EFFA80];
  v39[1] = MEMORY[0x263EFFA80];
  v26 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v25 = +[HRECharacteristicActionMap characteristicActionMap:v26];
  v41[0] = v25;
  v40[1] = *MEMORY[0x263F0D6A8];
  uint64_t v36 = *MEMORY[0x263F0C520];
  uint64_t v3 = v36;
  v37 = &unk_26EAB88F0;
  v24 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v23 = +[HRECharacteristicActionMap characteristicActionMap:v24];
  v41[1] = v23;
  v40[2] = *MEMORY[0x263F0D8B8];
  uint64_t v34 = v3;
  v35 = &unk_26EAB88F0;
  v22 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v21 = +[HRECharacteristicActionMap characteristicActionMap:v22];
  v41[2] = v21;
  v40[3] = *MEMORY[0x263F0D708];
  uint64_t v32 = *MEMORY[0x263F0C4D0];
  v33 = &unk_26EAB8908;
  v20 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v19 = +[HRECharacteristicActionMap characteristicActionMap:v20];
  v41[3] = v19;
  v40[4] = *MEMORY[0x263F0D6F8];
  uint64_t v30 = *MEMORY[0x263F0C4A8];
  v31 = &unk_26EAB8920;
  v18 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v17 = +[HRECharacteristicActionMap characteristicActionMap:v18];
  v41[4] = v17;
  v40[5] = *MEMORY[0x263F0D7D8];
  uint64_t v28 = *MEMORY[0x263F0C548];
  v29 = &unk_26EAB8920;
  id v4 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  id v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v41[5] = v5;
  v6 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  v40[6] = v6;
  v7 = +[HREMediaPlaybackActionMap actionMapWithState:2 volume:0 playbackArchive:0];
  v41[6] = v7;
  uint64_t v8 = HREMatterRVCType();
  v40[7] = v8;
  uint64_t v9 = [HREMatterCommandActionMap alloc];
  v10 = +[HREMatterCommandMap vacuumAndMop];
  v27[0] = v10;
  uint64_t v11 = +[HREMatterCommandMap selectAllRooms];
  v27[1] = v11;
  v12 = +[HREMatterCommandMap startCleaning];
  v27[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  v14 = [(HREMatterCommandActionMap *)v9 initWithCommands:v13];
  v41[7] = v14;
  id v16 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:8];

  return v16;
}

@end