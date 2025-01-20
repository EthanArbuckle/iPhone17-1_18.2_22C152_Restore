@interface HREGoodNightTemplate
- (HREGoodNightTemplate)init;
- (id)_lazy_actionMap;
- (id)extraInvolvedTypes;
@end

@implementation HREGoodNightTemplate

- (HREGoodNightTemplate)init
{
  v8.receiver = self;
  v8.super_class = (Class)HREGoodNightTemplate;
  v2 = [(HREActionSetTemplate *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(HREActionSetTemplate *)v2 setActionSetType:*MEMORY[0x263F0B938]];
    id v4 = objc_alloc(MEMORY[0x263F47B68]);
    v5 = (void *)[v4 initWithImageIdentifier:*MEMORY[0x263F47998]];
    [(HREActionSetTemplate *)v3 setIconDescriptor:v5];

    if (_MergedGlobals_14 != -1) {
      dispatch_once(&_MergedGlobals_14, &__block_literal_global_3_0);
    }
    id v6 = (id)qword_268944AC8;
    [(HRETemplate *)v3 setIdentifier:v6];

    [(HRETemplate *)v3 setSortingPriority:1.0];
    [(HRETemplate *)v3 setStarterRank:1.6];
  }
  return v3;
}

void __28__HREGoodNightTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944AC8;
  qword_268944AC8 = @"goodNight";
}

- (id)extraInvolvedTypes
{
  if (qword_268944AD0 != -1) {
    dispatch_once(&qword_268944AD0, &__block_literal_global_8_0);
  }
  v2 = (void *)qword_268944AD8;

  return v2;
}

void __42__HREGoodNightTemplate_extraInvolvedTypes__block_invoke_2()
{
  v6[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0D6D8];
  v6[0] = *MEMORY[0x263F0D780];
  v6[1] = v1;
  v6[2] = *MEMORY[0x263F0D850];
  v2 = HRETelevisionProfileType();
  v6[3] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  v5 = (void *)qword_268944AD8;
  qword_268944AD8 = v4;
}

- (id)_lazy_actionMap
{
  v49[9] = *MEMORY[0x263EF8340];
  v42[0] = @"HREServiceTypeAll";
  uint64_t v2 = *MEMORY[0x263F0BEF8];
  v40[0] = *MEMORY[0x263F0C328];
  v40[1] = v2;
  v41[0] = MEMORY[0x263EFFA80];
  v41[1] = &unk_26EAB8890;
  v25 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  v24 = +[HRECharacteristicActionMap characteristicActionMap:v25];
  v49[0] = v24;
  v42[1] = *MEMORY[0x263F0D6A8];
  uint64_t v38 = *MEMORY[0x263F0C520];
  uint64_t v3 = v38;
  v39 = &unk_26EAB88A8;
  v23 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v22 = +[HRECharacteristicActionMap characteristicActionMap:v23];
  v49[1] = v22;
  v42[2] = *MEMORY[0x263F0D8A8];
  uint64_t v36 = v3;
  v37 = &unk_26EAB88A8;
  v21 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v20 = +[HRECharacteristicActionMap characteristicActionMap:v21];
  v49[2] = v20;
  uint64_t v43 = *MEMORY[0x263F0D7D8];
  uint64_t v4 = v43;
  uint64_t v34 = *MEMORY[0x263F0C548];
  uint64_t v5 = v34;
  v35 = &unk_26EAB8890;
  v19 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v18 = +[HRECharacteristicActionMap characteristicActionMap:v19];
  v49[3] = v18;
  uint64_t v44 = *MEMORY[0x263F0D6F8];
  uint64_t v32 = *MEMORY[0x263F0C4A8];
  v33 = &unk_26EAB88C0;
  v17 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v16 = +[HRECharacteristicActionMap characteristicActionMap:v17];
  v49[4] = v16;
  uint64_t v45 = *MEMORY[0x263F0D8B8];
  uint64_t v30 = v3;
  v31 = &unk_26EAB88A8;
  id v6 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  v7 = +[HRECharacteristicActionMap characteristicActionMap:v6];
  v49[5] = v7;
  uint64_t v46 = *MEMORY[0x263F0D798];
  uint64_t v28 = *MEMORY[0x263F0C510];
  v29 = &unk_26EAB88C0;
  objc_super v8 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v9 = +[HRECharacteristicActionMap characteristicActionMap:v8];
  v49[6] = v9;
  uint64_t v47 = v4;
  uint64_t v26 = v5;
  v27 = &unk_26EAB88D8;
  v10 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v11 = +[HRECharacteristicActionMap characteristicActionMap:v10];
  v49[7] = v11;
  v12 = NSStringFromProtocol((Protocol *)&unk_26EAC9D48);
  v48 = v12;
  v13 = +[HREMediaPlaybackActionMap actionMapWithState:2 volume:0 playbackArchive:0];
  v49[8] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v49 forKeys:v42 count:9];

  return v14;
}

@end