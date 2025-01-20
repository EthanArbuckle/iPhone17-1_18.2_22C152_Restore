@interface HRELeaveHomeTemplate
- (HRELeaveHomeTemplate)init;
- (id)_lazy_actionMap;
- (id)extraInvolvedTypes;
@end

@implementation HRELeaveHomeTemplate

- (HRELeaveHomeTemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HRELeaveHomeTemplate;
  v2 = [(HREActionSetTemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HREActionSetTemplate *)v2 setActionSetType:*MEMORY[0x263F0B918]];
    id v4 = objc_alloc(MEMORY[0x263F47B68]);
    v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x263F47978]];
    [(HREActionSetTemplate *)v3 setIconDescriptor:v5];

    if (_MergedGlobals_13 != -1) {
      dispatch_once(&_MergedGlobals_13, &__block_literal_global_3);
    }
    id v6 = (id)qword_268944AA8;
    [(HRETemplate *)v3 setIdentifier:v6];

    [(HRETemplate *)v3 setSortingPriority:4.0];
    [(HRETemplate *)v3 setStarterRank:2.2];
  }
  return v3;
}

void __28__HRELeaveHomeTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944AA8;
  qword_268944AA8 = @"leaveHome";
}

- (id)extraInvolvedTypes
{
  if (qword_268944AB0 != -1) {
    dispatch_once(&qword_268944AB0, &__block_literal_global_8);
  }
  v2 = (void *)qword_268944AB8;

  return v2;
}

void __42__HRELeaveHomeTemplate_extraInvolvedTypes__block_invoke_2()
{
  v8[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D6C8];
  v8[0] = *MEMORY[0x263F0D780];
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0D6D8];
  v8[2] = *MEMORY[0x263F0D890];
  v8[3] = v2;
  uint64_t v3 = *MEMORY[0x263F0D720];
  v8[4] = *MEMORY[0x263F0D850];
  v8[5] = v3;
  v8[6] = *MEMORY[0x263F0D618];
  id v4 = HRETelevisionProfileType();
  v8[7] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];
  uint64_t v6 = [v0 setWithArray:v5];
  v7 = (void *)qword_268944AB8;
  qword_268944AB8 = v6;
}

- (id)_lazy_actionMap
{
  v37[8] = *MEMORY[0x263EF8340];
  v36[0] = @"HREServiceTypeAll";
  uint64_t v2 = *MEMORY[0x263F0BEF8];
  v34[0] = *MEMORY[0x263F0C328];
  v34[1] = v2;
  v35[0] = MEMORY[0x263EFFA80];
  v35[1] = &unk_26EAB8848;
  v21 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  v20 = +[HRECharacteristicActionMap characteristicActionMap:v21];
  v37[0] = v20;
  v36[1] = *MEMORY[0x263F0D6A8];
  uint64_t v32 = *MEMORY[0x263F0C520];
  uint64_t v3 = v32;
  v33 = &unk_26EAB8860;
  v19 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v18 = +[HRECharacteristicActionMap characteristicActionMap:v19];
  v37[1] = v18;
  v36[2] = *MEMORY[0x263F0D8B8];
  uint64_t v30 = v3;
  v31 = &unk_26EAB8860;
  v17 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v16 = +[HRECharacteristicActionMap characteristicActionMap:v17];
  v37[2] = v16;
  v36[3] = *MEMORY[0x263F0D708];
  uint64_t v28 = *MEMORY[0x263F0C4D0];
  v29 = &unk_26EAB8848;
  v15 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v14 = +[HRECharacteristicActionMap characteristicActionMap:v15];
  v37[3] = v14;
  v36[4] = *MEMORY[0x263F0D6F8];
  uint64_t v26 = *MEMORY[0x263F0C4A8];
  v27 = &unk_26EAB8878;
  id v4 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v5 = +[HRECharacteristicActionMap characteristicActionMap:v4];
  v37[4] = v5;
  v36[5] = *MEMORY[0x263F0D798];
  uint64_t v24 = *MEMORY[0x263F0C510];
  v25 = &unk_26EAB8878;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v7 = +[HRECharacteristicActionMap characteristicActionMap:v6];
  v37[5] = v7;
  v36[6] = *MEMORY[0x263F0D7D8];
  uint64_t v22 = *MEMORY[0x263F0C548];
  v23 = &unk_26EAB8878;
  objc_super v8 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v9 = +[HRECharacteristicActionMap characteristicActionMap:v8];
  v37[6] = v9;
  v10 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  v36[7] = v10;
  v11 = +[HREMediaPlaybackActionMap actionMapWithState:2 volume:0 playbackArchive:0];
  v37[7] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:8];

  return v12;
}

@end