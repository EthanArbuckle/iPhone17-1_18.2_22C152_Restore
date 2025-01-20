@interface HMCharacteristic
@end

@implementation HMCharacteristic

uint64_t __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v5 characteristicType];
    uint64_t v9 = objc_msgSend(v7, "hf_sortPriorityForCharacteristicType:", v8);

    v10 = *(void **)(a1 + 32);
    v11 = [v6 characteristicType];
    uint64_t v12 = objc_msgSend(v10, "hf_sortPriorityForCharacteristicType:", v11);

    v13 = (uint64_t (**)(void *, id, id))&__block_literal_global_74_1;
    int v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v18 = NSStringFromSelector(*(SEL *)(a1 + 40));
      NSLog(&cfstr_UseOfWithUnkno.isa, v18, v5, v6);

      uint64_t v17 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "hf_sortPriorityForCharacteristicType:", v5);
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "hf_sortPriorityForCharacteristicType:", v6);
    int v14 = 0;
    v13 = 0;
  }
  v15 = [NSNumber numberWithInteger:v9];
  v16 = [NSNumber numberWithInteger:v12];
  uint64_t v17 = [v15 compare:v16];

  if (v14 && !v17) {
    uint64_t v17 = v13[2](v13, v5, v6);
  }
LABEL_11:

  return v17;
}

void __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFFA08];
  objc_msgSend(*(id *)(a1 + 32), "_hf_alarmCharacteristicTypeToAbnormalValueMap");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 allKeys];
  uint64_t v3 = [v1 setWithArray:v2];
  v4 = (void *)qword_26AB2F9B8;
  qword_26AB2F9B8 = v3;
}

void __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFFA08];
  objc_msgSend(*(id *)(a1 + 32), "_hf_valueRangeCharacteristicTypeToAbnormalValueMap");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v5 allKeys];
  uint64_t v3 = [v1 setWithArray:v2];
  v4 = (void *)qword_26AB2F998;
  qword_26AB2F998 = v3;
}

id __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2F9C0 != -1) {
    dispatch_once(&qword_26AB2F9C0, block);
  }
  v1 = (void *)qword_26AB2F9C8;
  return v1;
}

void __76__HMCharacteristic_Additions___hf_alarmCharacteristicTypeToAbnormalValueMap__block_invoke_2()
{
  v8[8] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BF80];
  v7[0] = *MEMORY[0x263F0C288];
  v7[1] = v0;
  v8[0] = MEMORY[0x263EFFA88];
  v8[1] = MEMORY[0x263EFFA88];
  uint64_t v1 = *MEMORY[0x263F0C238];
  v7[2] = *MEMORY[0x263F0BFB0];
  v7[3] = v1;
  v8[2] = MEMORY[0x263EFFA88];
  v8[3] = MEMORY[0x263EFFA88];
  uint64_t v2 = *MEMORY[0x263F0C3F0];
  v7[4] = *MEMORY[0x263F0C2C0];
  v7[5] = v2;
  v8[4] = MEMORY[0x263EFFA88];
  v8[5] = MEMORY[0x263EFFA88];
  v8[6] = &unk_26C0F7428;
  uint64_t v3 = *MEMORY[0x263F0BF40];
  v7[6] = *MEMORY[0x263F0C008];
  v7[7] = v3;
  v4 = [MEMORY[0x263F0E600] numberRangeWithMinValue:&unk_26C0F7440];
  v8[7] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:8];
  id v6 = (void *)qword_26AB2F9D8;
  qword_26AB2F9D8 = v5;
}

void __81__HMCharacteristic_Additions___hf_valueRangeCharacteristicTypeToAbnormalValueMap__block_invoke_2()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = *MEMORY[0x263F0BF40];
  uint64_t v0 = [MEMORY[0x263F0E600] numberRangeWithMinValue:&unk_26C0F7440];
  v7[0] = v0;
  v6[1] = *MEMORY[0x263F0C110];
  uint64_t v1 = [MEMORY[0x263F0E600] numberRangeWithMinValue:&unk_26C0F7458];
  v7[1] = v1;
  v6[2] = *MEMORY[0x263F0C0E0];
  uint64_t v2 = [MEMORY[0x263F0E600] numberRangeWithMaxValue:&unk_26C0F7470];
  v7[2] = v2;
  v6[3] = *MEMORY[0x263F0C0A0];
  uint64_t v3 = [MEMORY[0x263F0E600] numberRangeWithMaxValue:&unk_26C0F7488];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  uint64_t v5 = (void *)qword_26AB2F9E8;
  qword_26AB2F9E8 = v4;
}

uint64_t __63__HMCharacteristic_Additions__hf_powerStateCharacteristicTypes__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C328], *MEMORY[0x263F0BEF8], 0);
  uint64_t v1 = qword_26AB2F988;
  qword_26AB2F988 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hf_alarmCharacteristicTypes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hf_valueRangeCharacteristicTypes");
  uint64_t v3 = [v5 setByAddingObjectsFromSet:v2];
  uint64_t v4 = (void *)qword_26AB2F9C8;
  qword_26AB2F9C8 = v3;
}

id __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2F990 != -1) {
    dispatch_once(&qword_26AB2F990, block);
  }
  uint64_t v1 = (void *)qword_26AB2F998;
  return v1;
}

id __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2F9B0 != -1) {
    dispatch_once(&qword_26AB2F9B0, block);
  }
  uint64_t v1 = (void *)qword_26AB2F9B8;
  return v1;
}

void __68__HMCharacteristic_Additions__hf_sortPriorityForCharacteristicType___block_invoke()
{
  v88[14] = *MEMORY[0x263EF8340];
  v87[0] = &unk_26C0F74B8;
  uint64_t v0 = *MEMORY[0x263F0BEF8];
  v86[0] = *MEMORY[0x263F0C328];
  v86[1] = v0;
  uint64_t v1 = *MEMORY[0x263F0C510];
  v86[2] = *MEMORY[0x263F0C4A8];
  v86[3] = v1;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:4];
  v88[0] = v62;
  v87[1] = &unk_26C0F74D0;
  uint64_t v2 = *MEMORY[0x263F0C378];
  v85[0] = *MEMORY[0x263F0BF68];
  v85[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0C548];
  v85[2] = *MEMORY[0x263F0C4D8];
  v85[3] = v3;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:4];
  v88[1] = v61;
  v87[2] = &unk_26C0F74E8;
  uint64_t v4 = *MEMORY[0x263F0C398];
  v84[0] = *MEMORY[0x263F0C1C0];
  v84[1] = v4;
  uint64_t v5 = *MEMORY[0x263F0C550];
  v84[2] = *MEMORY[0x263F0C520];
  v84[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C218];
  v84[4] = *MEMORY[0x263F0C498];
  v84[5] = v6;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:6];
  v88[2] = v60;
  v87[3] = &unk_26C0F7500;
  uint64_t v7 = *MEMORY[0x263F0C4E8];
  v83[0] = *MEMORY[0x263F0C530];
  v83[1] = v7;
  uint64_t v8 = *MEMORY[0x263F0C4B8];
  v83[2] = *MEMORY[0x263F0C568];
  v83[3] = v8;
  v83[4] = *MEMORY[0x263F0C3D0];
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:5];
  v88[3] = v59;
  v87[4] = &unk_26C0F7518;
  uint64_t v9 = *MEMORY[0x263F0C1A0];
  v82[0] = *MEMORY[0x263F0C020];
  v82[1] = v9;
  v82[2] = *MEMORY[0x263F0C488];
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:3];
  v88[4] = v58;
  v87[5] = &unk_26C0F7530;
  uint64_t v81 = *MEMORY[0x263F0C370];
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v81 count:1];
  v88[5] = v10;
  v87[6] = &unk_26C0F7548;
  uint64_t v11 = *MEMORY[0x263F0C578];
  v80[0] = *MEMORY[0x263F0C1B0];
  v80[1] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:2];
  v88[6] = v12;
  v87[7] = &unk_26C0F7560;
  uint64_t v79 = *MEMORY[0x263F0C260];
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v79 count:1];
  v88[7] = v13;
  v87[8] = &unk_26C0F7578;
  uint64_t v14 = *MEMORY[0x263F0C068];
  v78[0] = *MEMORY[0x263F0C040];
  v78[1] = v14;
  uint64_t v15 = *MEMORY[0x263F0C0B0];
  v78[2] = *MEMORY[0x263F0C080];
  v78[3] = v15;
  uint64_t v16 = *MEMORY[0x263F0C0E0];
  v78[4] = *MEMORY[0x263F0C0D0];
  v78[5] = v16;
  uint64_t v17 = *MEMORY[0x263F0C110];
  v78[6] = *MEMORY[0x263F0C0E8];
  v78[7] = v17;
  uint64_t v18 = *MEMORY[0x263F0C350];
  v78[8] = *MEMORY[0x263F0C128];
  v78[9] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:10];
  v88[8] = v19;
  v87[9] = &unk_26C0F74A0;
  uint64_t v20 = *MEMORY[0x263F0BF30];
  v77[0] = *MEMORY[0x263F0BF18];
  v77[1] = v20;
  uint64_t v21 = *MEMORY[0x263F0BF80];
  v77[2] = *MEMORY[0x263F0BF40];
  v77[3] = v21;
  uint64_t v22 = *MEMORY[0x263F0BFA0];
  v77[4] = *MEMORY[0x263F0BF90];
  v77[5] = v22;
  uint64_t v23 = *MEMORY[0x263F0BFC0];
  v77[6] = *MEMORY[0x263F0BFB0];
  v77[7] = v23;
  uint64_t v24 = *MEMORY[0x263F0C2F0];
  v77[8] = *MEMORY[0x263F0BFD0];
  v77[9] = v24;
  uint64_t v25 = *MEMORY[0x263F0C448];
  v77[10] = *MEMORY[0x263F0C2B0];
  v77[11] = v25;
  uint64_t v26 = *MEMORY[0x263F0C300];
  v77[12] = *MEMORY[0x263F0C318];
  v77[13] = v26;
  uint64_t v27 = *MEMORY[0x263F0C008];
  v77[14] = *MEMORY[0x263F0C598];
  v77[15] = v27;
  uint64_t v28 = *MEMORY[0x263F0C238];
  v77[16] = *MEMORY[0x263F0C0A0];
  v77[17] = v28;
  uint64_t v29 = *MEMORY[0x263F0C2B8];
  v77[18] = *MEMORY[0x263F0C288];
  v77[19] = v29;
  uint64_t v30 = *MEMORY[0x263F0C2D8];
  v77[20] = *MEMORY[0x263F0C2C0];
  v77[21] = v30;
  uint64_t v31 = *MEMORY[0x263F0C3A0];
  v77[22] = *MEMORY[0x263F0C320];
  v77[23] = v31;
  uint64_t v32 = *MEMORY[0x263F0C5B8];
  v77[24] = *MEMORY[0x263F0C3F0];
  v77[25] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:26];
  v88[9] = v33;
  v87[10] = &unk_26C0F7590;
  uint64_t v34 = *MEMORY[0x263F0C168];
  v76[0] = *MEMORY[0x263F0C430];
  v76[1] = v34;
  v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
  v88[10] = v35;
  v87[11] = &unk_26C0F75A8;
  uint64_t v36 = *MEMORY[0x263F0BFE8];
  v75[0] = *MEMORY[0x263F0BF58];
  v75[1] = v36;
  v75[2] = *MEMORY[0x263F0C178];
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:3];
  v88[11] = v37;
  v87[12] = &unk_26C0F75C0;
  uint64_t v38 = *MEMORY[0x263F0C418];
  v74[0] = *MEMORY[0x263F0C408];
  v74[1] = v38;
  v74[2] = *MEMORY[0x263F0C438];
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:3];
  v88[12] = v39;
  v87[13] = &unk_26C0F75D8;
  uint64_t v40 = *MEMORY[0x263F0C278];
  v73[0] = *MEMORY[0x263F0C270];
  v73[1] = v40;
  uint64_t v41 = *MEMORY[0x263F0C190];
  v73[2] = *MEMORY[0x263F0C298];
  v73[3] = v41;
  uint64_t v42 = *MEMORY[0x263F0C3C0];
  v73[4] = *MEMORY[0x263F0C198];
  v73[5] = v42;
  v73[6] = *MEMORY[0x263F0C400];
  v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:7];
  v88[13] = v43;
  v44 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:14];

  uint64_t v45 = objc_opt_new();
  v46 = (void *)qword_26AB2FA30;
  qword_26AB2FA30 = v45;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v47 = v44;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v68 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        v53 = [v47 objectForKeyedSubscript:v52];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v64 != v56) {
                objc_enumerationMutation(v53);
              }
              [(id)qword_26AB2FA30 setObject:v52 forKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * j)];
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v63 objects:v71 count:16];
          }
          while (v55);
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v49);
  }
}

uint64_t __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_2()
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0BEF0];
  v5[0] = *MEMORY[0x263F0BED8];
  v5[1] = v0;
  v6[0] = @"R";
  v6[1] = @"W";
  uint64_t v1 = *MEMORY[0x263F0BEE8];
  v5[2] = *MEMORY[0x263F0BED0];
  v5[3] = v1;
  v6[2] = @"H";
  v6[3] = @"N";
  v5[4] = *MEMORY[0x263F0BEE0];
  void v6[4] = @"A";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  uint64_t v3 = qword_26AB2EEA8;
  qword_26AB2EEA8 = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

id __61__HMCharacteristic_HFDebugging__hf_descriptionForProperties___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = v3;
  }
  id v6 = v4;

  return v6;
}

id __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2F9A0 != -1) {
    dispatch_once(&qword_26AB2F9A0, block);
  }
  uint64_t v1 = (void *)qword_26AB2F9A8;
  return v1;
}

void __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "hf_valueRangeCharacteristicTypes");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0BF40]];
  uint64_t v2 = objc_msgSend(v4, "hmf_removedObjectsFromSet:", v1);
  id v3 = (void *)qword_26AB2F9A8;
  qword_26AB2F9A8 = v2;
}

void __91__HMCharacteristic_Additions___hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap__block_invoke_2()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F0C0E0];
  v3[0] = &unk_26C0F74A0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  uint64_t v1 = (void *)qword_26AB2F9F8;
  qword_26AB2F9F8 = v0;
}

uint64_t __59__HMCharacteristic_Additions__hf_formattedValueUpdatedTime__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)qword_26AB2FA00;
  qword_26AB2FA00 = (uint64_t)v0;

  uint64_t v2 = (void *)qword_26AB2FA00;
  return [v2 setDateFormat:@"HH:mm:ss.SSS"];
}

void __97__HMCharacteristic_Additions__hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType___block_invoke()
{
  v15[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C550];
  uint64_t v1 = *MEMORY[0x263F0C068];
  v14[0] = *MEMORY[0x263F0C110];
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C4D8];
  v15[0] = v0;
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0C530];
  uint64_t v4 = *MEMORY[0x263F0C040];
  v14[2] = *MEMORY[0x263F0C0E0];
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0C4A8];
  v15[2] = v3;
  v15[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C510];
  uint64_t v7 = *MEMORY[0x263F0C080];
  v14[4] = *MEMORY[0x263F0C0B0];
  v14[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0C4E8];
  v15[4] = v6;
  v15[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0C520];
  uint64_t v10 = *MEMORY[0x263F0C0E8];
  v14[6] = *MEMORY[0x263F0C0D0];
  v14[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0C548];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x263F0C128];
  v15[8] = *MEMORY[0x263F0C568];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];
  v13 = (void *)qword_26AB2FA10;
  qword_26AB2FA10 = v12;
}

void __97__HMCharacteristic_Additions__hf_currentStateCharacteristicTypeForTargetStateCharacteristicType___block_invoke()
{
  v15[9] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0C110];
  uint64_t v1 = *MEMORY[0x263F0C4D8];
  v14[0] = *MEMORY[0x263F0C550];
  v14[1] = v1;
  uint64_t v2 = *MEMORY[0x263F0C068];
  v15[0] = v0;
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x263F0C0E0];
  uint64_t v4 = *MEMORY[0x263F0C4A8];
  v14[2] = *MEMORY[0x263F0C530];
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x263F0C040];
  v15[2] = v3;
  v15[3] = v5;
  uint64_t v6 = *MEMORY[0x263F0C0B0];
  uint64_t v7 = *MEMORY[0x263F0C4E8];
  v14[4] = *MEMORY[0x263F0C510];
  v14[5] = v7;
  uint64_t v8 = *MEMORY[0x263F0C080];
  v15[4] = v6;
  v15[5] = v8;
  uint64_t v9 = *MEMORY[0x263F0C0D0];
  uint64_t v10 = *MEMORY[0x263F0C548];
  v14[6] = *MEMORY[0x263F0C520];
  v14[7] = v10;
  uint64_t v11 = *MEMORY[0x263F0C0E8];
  v15[6] = v9;
  v15[7] = v11;
  v14[8] = *MEMORY[0x263F0C568];
  v15[8] = *MEMORY[0x263F0C128];
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];
  v13 = (void *)qword_26AB2FA20;
  qword_26AB2FA20 = v12;
}

uint64_t __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 localizedDescription];
  uint64_t v6 = [v4 localizedDescription];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

void __78__HMCharacteristic_Additions__hf_shouldCaptureCharacteristicTypeInActionSets___block_invoke_2()
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = *MEMORY[0x263F0C218];
  v5[0] = *MEMORY[0x263F0C578];
  v5[1] = v1;
  v5[2] = *MEMORY[0x263F0C3D0];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)qword_26AB2FA48;
  qword_26AB2FA48 = v3;
}

id __65__HMCharacteristic_Additions__hf_programmableSwitchValidValueSet__block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F0E310];
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = objc_msgSend(v2, "hf_localizedStringForProgrammableSwitchCharacteristic:value:", WeakRetained, v4);

  if (v6)
  {
    uint64_t v9 = @"title";
    v10[0] = v6;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA78];
  }

  return v7;
}

uint64_t __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) service];
    uint64_t v8 = [v6 events];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke_2;
    v13[3] = &unk_264099078;
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = v9;
    id v10 = v7;
    uint64_t v11 = objc_msgSend(v8, "na_any:", v13);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 characteristic];
  uint64_t v8 = [v7 service];
  uint64_t v9 = *(void **)(a1 + 32);

  if (v8 == v9)
  {
    uint64_t v11 = [v7 uniqueIdentifier];
    uint64_t v12 = [*(id *)(a1 + 40) uniqueIdentifier];
    uint64_t v10 = [v11 isEqual:v12];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) service];
    uint64_t v8 = [v6 events];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke_2;
    v14[3] = &unk_2640990C8;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 40);
    id v15 = v7;
    uint64_t v16 = v9;
    id v17 = v10;
    id v11 = v7;
    uint64_t v12 = objc_msgSend(v8, "na_any:", v14);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 characteristic];
  uint64_t v8 = [v7 service];
  uint64_t v9 = *(void **)(a1 + 32);

  if (v8 == v9
    && ([v7 uniqueIdentifier],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 40) uniqueIdentifier],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v10 isEqual:v11],
        v11,
        v10,
        v12))
  {
    if (*(void *)(a1 + 48))
    {
      v13 = [v6 triggerValue];
      uint64_t v14 = [v13 isEqual:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __94__HMCharacteristic_Additions__hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isHomeAppCreatedTrigger");
}

void __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  uint64_t v5 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_2;
  v8[3] = &unk_264099160;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  objc_msgSend(v5, "na_each:", v8);
}

void __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 events];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_3;
  v6[3] = &unk_264099138;
  id v7 = *(id *)(a1 + 32);
  int v5 = objc_msgSend(v4, "na_any:", v6);

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

uint64_t __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 triggerValue];
  uint64_t v8 = [v7 isEqual:*(void *)(a1 + 32)];

  return v8;
}

id __65__HMCharacteristic_Additions___hf_lightLevelVisibleTriggerValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue");
  if (v4)
  {
    int v5 = (void *)v4;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue");
    uint64_t v7 = [v3 compare:v6];

    if (v7 == -1) {
      goto LABEL_5;
    }
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue");
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue");
    uint64_t v11 = [v3 compare:v10];

    if (v11 == 1)
    {
LABEL_5:
      id v12 = 0;
      goto LABEL_11;
    }
  }
  v13 = [*(id *)(a1 + 32) metadata];
  uint64_t v14 = [v13 stepValue];
  if (v14)
  {
    id v15 = (void *)v14;
    [v3 floatValue];
    float v17 = v16;
    uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
    [v18 floatValue];
    float v20 = fmodf(v17, v19);

    if (v20 != 0.0)
    {
      uint64_t v21 = NSNumber;
      [v3 floatValue];
      float v23 = v22;
      uint64_t v24 = objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
      [v24 floatValue];
      float v26 = roundf(v23 / v25);
      uint64_t v27 = objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
      [v27 floatValue];
      id v12 = [v21 numberWithInteger:(uint64_t)(float)(v26 * v28)];

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v12 = v3;
LABEL_11:

  return v12;
}

uint64_t __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) metadata];
  id v3 = [v2 stepValue];
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);

    if (v4)
    {
      int v5 = objc_msgSend(*(id *)(a1 + 32), "_hf_stepValue");
      [v5 floatValue];
      float v7 = v6;
      [*(id *)(a1 + 40) floatValue];
      float v9 = roundf(v7 / v8);

      if (v9 < 1.0) {
        float v9 = 1.0;
      }
      [*(id *)(a1 + 40) floatValue];
      return (int)(float)(v10 * v9);
    }
  }
  else
  {
  }
  id v12 = *(void **)(a1 + 40);
  if (v12)
  {
    return [v12 intValue];
  }
  else
  {
    v13 = [*(id *)(a1 + 32) metadata];
    uint64_t v14 = [v13 stepValue];

    if (v14)
    {
      id v15 = [*(id *)(a1 + 32) metadata];
      float v16 = [v15 stepValue];
      uint64_t v17 = [v16 intValue];

      return v17;
    }
    else
    {
      return 1;
    }
  }
}

void __65__HMCharacteristic_Additions___hf_visibleLightLevelTriggerValues__block_invoke_2()
{
  uint64_t v0 = (void *)qword_26AB2FA58;
  qword_26AB2FA58 = (uint64_t)&unk_26C0F82C0;
}

id __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_2;
  block[3] = &unk_26408DDE0;
  id v4 = *(id *)(a1 + 32);
  if (_MergedGlobals_294 != -1) {
    dispatch_once(&_MergedGlobals_294, block);
  }
  id v1 = (id)qword_26AB2FA68;

  return v1;
}

void __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  void v3[2] = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3;
  v3[3] = &unk_264097A40;
  id v4 = *(id *)(a1 + 32);
  uint64_t v1 = __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3((uint64_t)v3);
  uint64_t v2 = (void *)qword_26AB2FA68;
  qword_26AB2FA68 = v1;
}

id __82__HMCharacteristic_HFActionSuggestions__hf_suggestionVendorForCharacteristicType___block_invoke_3(uint64_t a1)
{
  v14[8] = *MEMORY[0x263EF8340];
  v13[0] = *MEMORY[0x263F0C328];
  uint64_t v2 = [HFPrimaryStateCharacteristicActionSuggestionVendor alloc];
  id v3 = [(HFPrimaryStateCharacteristicActionSuggestionVendor *)v2 initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:MEMORY[0x263EFFA80]];
  v14[0] = v3;
  v13[1] = *MEMORY[0x263F0BEF8];
  id v4 = [[HFPrimaryStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:&unk_26C0F76E0];
  v14[1] = v4;
  v13[2] = *MEMORY[0x263F0C510];
  int v5 = [[HFPrimaryStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:&unk_26C0F76F8];
  v14[2] = v5;
  v13[3] = *MEMORY[0x263F0C548];
  float v6 = [[HFPrimaryStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:&unk_26C0F7710];
  v14[3] = v6;
  void v13[4] = *MEMORY[0x263F0C4A8];
  float v7 = [[HFPrimaryStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:&unk_26C0F76F8];
  void v14[4] = v7;
  v13[5] = *MEMORY[0x263F0C520];
  float v8 = [[HFPrimaryStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32) normalStateValue:&unk_26C0F7728 bucketingPolicy:1];
  v14[5] = v8;
  v13[6] = *MEMORY[0x263F0BF68];
  float v9 = [[HFIncrementalStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32)];
  v14[6] = v9;
  v13[7] = *MEMORY[0x263F0C378];
  float v10 = [[HFIncrementalStateCharacteristicActionSuggestionVendor alloc] initWithCharacteristicType:*(void *)(a1 + 32)];
  v14[7] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

@end