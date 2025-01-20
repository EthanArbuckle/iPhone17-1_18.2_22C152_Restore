@interface HUProgrammableSwitchEventOptionItem
+ (id)_buildOutTriggerEditorOptionsForCharacteristic:(id)a3 triggerValue:(id)a4 latestResults:(id)a5;
+ (id)_longformTitleForCharacteristic:(id)a3 latestResults:(id)a4;
+ (id)_sectionTitleForCharacteristic:(id)a3 latestResults:(id)a4;
+ (id)_shortformTitleForLatestResults:(id)a3;
+ (id)_triggerBuilderContextAwareTitleForCharacteristic:(id)a3 latestResults:(id)a4;
- (HFCharacteristicValueSource)valueSource;
- (HMCharacteristic)characteristic;
- (HUProgrammableSwitchEventOptionItem)initWithCharacteristic:(id)a3 triggerValue:(id)a4 valueSource:(id)a5;
- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4;
- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4;
- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HUProgrammableSwitchEventOptionItem

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristic:(id)a3 triggerValue:(id)a4 valueSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUProgrammableSwitchEventOptionItem.m", 29, @"Invalid parameter not satisfying: %@", @"characteristic" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"HUProgrammableSwitchEventOptionItem.m", 28, @"Invalid parameter not satisfying: %@", @"valueSource" object file lineNumber description];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"HUProgrammableSwitchEventOptionItem.m", 30, @"Invalid parameter not satisfying: %@", @"triggerValue" object file lineNumber description];

LABEL_4:
  v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  v18.receiver = self;
  v18.super_class = (Class)HUProgrammableSwitchEventOptionItem;
  v13 = [(HUCharacteristicEventOptionItem *)&v18 initWithCharacteristics:v12 triggerValue:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_valueSource, a5);
  }

  return v13;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUProgrammableSwitchEventOptionItem.m", 42, @"%s is unavailable; use %@ instead",
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:triggerValue:]",
    v7);

  return 0;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUProgrammableSwitchEventOptionItem.m", 47, @"%s is unavailable; use %@ instead",
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:triggerValueRange:]",
    v7);

  return 0;
}

- (HUProgrammableSwitchEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithCharacteristic_triggerValue_valueSource_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUProgrammableSwitchEventOptionItem.m", 52, @"%s is unavailable; use %@ instead",
    "-[HUProgrammableSwitchEventOptionItem initWithCharacteristics:thresholdValueRange:]",
    v7);

  return 0;
}

- (HMCharacteristic)characteristic
{
  v2 = [(HUCharacteristicEventOptionItem *)self characteristics];
  v3 = [v2 anyObject];

  return (HMCharacteristic *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HUCharacteristicEventOptionItem *)self characteristics];
  uint64_t v6 = [v5 count];

  if (!v6) {
    NSLog(&cfstr_MustHaveCharac.isa);
  }
  v7 = [(HUCharacteristicEventOptionItem *)self characteristics];

  if (v7)
  {
    v8 = [(HUCharacteristicEventOptionItem *)self triggerValue];
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = (void *)MEMORY[0x1E4F2E7A8];
    id v11 = [(HUCharacteristicEventOptionItem *)self characteristics];
    uint64_t v12 = objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v11, v8);

    v87 = (void *)v12;
    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = MEMORY[0x1E4F1CC38];
    }
    v14 = (void *)MEMORY[0x1E4F68B10];
    if (v12) {
      v14 = (void *)MEMORY[0x1E4F68AB8];
    }
    [v9 setObject:v13 forKeyedSubscript:*v14];
    v15 = [(HUProgrammableSwitchEventOptionItem *)self characteristic];
    if (!v15) {
      NSLog(&cfstr_NoProgrammable.isa);
    }
    v16 = objc_msgSend(v15, "hf_home");
    uint64_t v17 = objc_msgSend(v15, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v8);
    uint64_t v18 = objc_msgSend(v16, "hf_remoteAccessState");
    BOOL v19 = v17 != 0;
    if (v18 != 1) {
      BOOL v19 = 1;
    }
    BOOL v81 = v19;
    if (v18 == 1) {
      int v20 = 1;
    }
    else {
      int v20 = objc_msgSend(v16, "hf_currentUserIsAdministrator") ^ 1;
    }
    unsigned int v83 = v20;
    v88 = v9;
    id v89 = v4;
    v85 = (void *)v17;
    v86 = v16;
    v91 = v8;
    if (v17)
    {
      v24 = (void *)MEMORY[0x1E4F1CAD0];
      v25 = [v9 allKeys];
      v26 = [v24 setWithArray:v25];

      v27 = (void *)[objc_alloc(MEMORY[0x1E4F696D8]) initWithHome:v16 trigger:v17];
      v28 = [v27 updateWithOptions:v4];
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke;
      v112[3] = &unk_1E638EB88;
      id v113 = v26;
      id v114 = v9;
      v115 = self;
      id v116 = v15;
      id v117 = v8;
      id v29 = v26;
      v90 = [v28 flatMap:v112];
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F7A0D8];
      v31 = [MEMORY[0x1E4F69228] outcomeWithResults:v9];
      v90 = [v30 futureWithResult:v31];
    }
    v32 = [v15 service];
    v33 = objc_msgSend(v32, "hf_labelNamespaceCharacteristic");

    v92 = v15;
    v34 = [v15 service];
    v35 = objc_msgSend(v34, "hf_labelIndexCharacteristic");

    v36 = objc_opt_new();
    v37 = [v33 service];
    objc_msgSend(v36, "na_safeAddObject:", v37);

    v38 = [v35 service];
    objc_msgSend(v36, "na_safeAddObject:", v38);

    v39 = [v33 service];
    v40 = [v39 accessory];
    v41 = objc_msgSend(v40, "hf_programmableSwitchNamespaceServices");
    uint64_t v42 = [v41 allObjects];
    v43 = (void *)v42;
    v44 = (void *)MEMORY[0x1E4F1CBF0];
    if (v42) {
      v44 = (void *)v42;
    }
    id v45 = v44;

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v108 objects:v121 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v109 != v49) {
            objc_enumerationMutation(v46);
          }
          [v36 addObject:*(void *)(*((void *)&v108 + 1) + 8 * i)];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v108 objects:v121 count:16];
      }
      while (v48);
    }

    uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2CF20], *MEMORY[0x1E4F2CF18], 0);
    v80 = (void *)v51;
    if ([v36 count])
    {
      v52 = [(HUProgrammableSwitchEventOptionItem *)self valueSource];
      v53 = [v52 readValuesForCharacteristicTypes:v51 inServices:v36];
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_3;
      v100[3] = &unk_1E638EBD8;
      id v101 = v46;
      id v102 = v33;
      id v103 = v35;
      id v104 = v92;
      id v105 = v8;
      BOOL v106 = v81;
      char v107 = v83;
      [v53 flatMap:v100];
      uint64_t v55 = v54 = self;

      v56 = v101;
      unint64_t v57 = 0x1E4F7A000;
    }
    else
    {
      v77 = self;
      v78 = v35;
      v56 = [v35 value];
      if (!v56)
      {
        v58 = NSNumber;
        v59 = [v92 service];
        v56 = objc_msgSend(v58, "numberWithUnsignedInteger:", objc_msgSend(v59, "hf_fallbackProgrammableSwitchIndex"));
      }
      v60 = (void *)MEMORY[0x1E4F1CA60];
      v119[0] = @"sectionNamespace";
      v61 = [NSNumber numberWithInteger:*MEMORY[0x1E4F697B0]];
      v120[0] = v61;
      v120[1] = v56;
      v119[1] = @"sectionElementIndex";
      v119[2] = @"sectionIndex";
      v120[2] = &unk_1F19B4B50;
      v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:3];
      v63 = [v60 dictionaryWithDictionary:v62];

      v64 = objc_msgSend(v92, "hf_eventTriggersForTriggerValue:", v8);
      objc_msgSend(v63, "na_safeSetObject:forKey:", v64, @"associateadTriggersKey");

      v65 = [NSNumber numberWithBool:v81];
      [v63 setObject:v65 forKey:@"itemIsEditable"];

      v66 = [NSNumber numberWithBool:v83];
      [v63 setObject:v66 forKey:*MEMORY[0x1E4F68C28]];

      unint64_t v57 = 0x1E4F7A000uLL;
      v67 = (void *)MEMORY[0x1E4F7A0D8];
      v68 = [MEMORY[0x1E4F69228] outcomeWithResults:v63];
      uint64_t v55 = [v67 futureWithResult:v68];

      v35 = v78;
      v54 = v77;
    }

    v69 = *(void **)(v57 + 216);
    v118[0] = v90;
    v118[1] = v55;
    v84 = (void *)v55;
    v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
    v70 = [v69 combineAllFutures:v82];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_64;
    v93[3] = &unk_1E638EC00;
    v93[4] = v54;
    id v94 = v92;
    id v95 = v91;
    id v96 = v35;
    id v97 = v33;
    id v98 = v85;
    id v99 = v46;
    id v79 = v46;
    id v71 = v85;
    id v72 = v33;
    id v73 = v35;
    id v74 = v91;
    id v75 = v92;
    v23 = [v70 flatMap:v93];

    id v4 = v89;
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F7A0D8];
    v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    v23 = [v21 futureWithError:v22];
  }

  return v23;
}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a2;
  v5 = [v4 results];
  uint64_t v6 = [v5 allKeys];
  v7 = [v3 setWithArray:v6];
  v8 = (void *)[v7 mutableCopy];

  [v8 minusSet:*(void *)(a1 + 32)];
  id v9 = [v4 results];

  id v10 = (void *)[*(id *)(a1 + 40) mutableCopy];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int v20 = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_2;
  v21 = &unk_1E638EB60;
  id v22 = v10;
  id v23 = v9;
  id v11 = v9;
  id v12 = v10;
  [v8 enumerateObjectsUsingBlock:&v18];
  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "_buildOutTriggerEditorOptionsForCharacteristic:triggerValue:latestResults:", *(void *)(a1 + 56), *(void *)(a1 + 64), v12, v18, v19, v20, v21);
  [v12 addEntriesFromDictionary:v13];
  v14 = (void *)MEMORY[0x1E4F7A0D8];
  v15 = [MEMORY[0x1E4F69228] outcomeWithResults:v12];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

void __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = *(void **)(a1 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_4;
  v30[3] = &unk_1E638EBB0;
  id v6 = v3;
  id v31 = v6;
  v7 = [v5 sortedArrayUsingComparator:v30];
  v8 = [*(id *)(a1 + 40) service];
  uint64_t v9 = [v7 indexOfObject:v8];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v7 count]) {
      NSLog(&cfstr_UnableToFindNa_0.isa);
    }
    uint64_t v9 = 0;
  }
  id v10 = *(void **)(a1 + 40);
  if (!v10)
  {
    v14 = 0;
LABEL_11:
    uint64_t v15 = [NSNumber numberWithInteger:*MEMORY[0x1E4F697B0]];

    v14 = (void *)v15;
    goto LABEL_12;
  }
  uint64_t v11 = *MEMORY[0x1E4F2CF20];
  id v12 = [v10 service];
  uint64_t v13 = [v6 responseForCharacteristicType:v11 inService:v12];
  v14 = [v13 valueWithExpectedClass:objc_opt_class()];

  if (!v14)
  {
    v14 = [*(id *)(a1 + 40) value];
    if (!v14) {
      goto LABEL_11;
    }
  }
  [v14 integerValue];
  if ((HMCharacteristicValueLabelNamespaceValidate() & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v16 = *MEMORY[0x1E4F2CF18];
  uint64_t v17 = [*(id *)(a1 + 48) service];
  uint64_t v18 = [v6 responseForCharacteristicType:v16 inService:v17];
  uint64_t v19 = [v18 valueWithExpectedClass:objc_opt_class()];

  if (!v19)
  {
    uint64_t v19 = [*(id *)(a1 + 48) value];
    if (!v19)
    {
      int v20 = NSNumber;
      v21 = [*(id *)(a1 + 56) service];
      uint64_t v19 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "hf_fallbackProgrammableSwitchIndex"));
    }
  }
  id v22 = [NSNumber numberWithUnsignedInteger:v9];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v22, @"sectionIndex");

  objc_msgSend(v4, "na_safeSetObject:forKey:", v14, @"sectionNamespace");
  objc_msgSend(v4, "na_safeSetObject:forKey:", v19, @"sectionElementIndex");
  id v23 = objc_msgSend(*(id *)(a1 + 56), "hf_eventTriggersForTriggerValue:", *(void *)(a1 + 64));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v23, @"associateadTriggersKey");

  v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  [v4 setObject:v24 forKey:@"itemIsEditable"];

  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
  [v4 setObject:v25 forKey:*MEMORY[0x1E4F68C28]];

  v26 = (void *)MEMORY[0x1E4F7A0D8];
  v27 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v28 = [v26 futureWithResult:v27];

  return v28;
}

uint64_t __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F2CF20];
  v8 = [*(id *)(a1 + 32) responseForCharacteristicType:*MEMORY[0x1E4F2CF20] inService:v5];
  uint64_t v9 = [v8 valueWithExpectedClass:objc_opt_class()];

  id v10 = [*(id *)(a1 + 32) responseForCharacteristicType:v7 inService:v6];
  uint64_t v11 = [v10 valueWithExpectedClass:objc_opt_class()];

  uint64_t v12 = [v9 compare:v11];
  if (!v12)
  {
    uint64_t v13 = [v5 uniqueIdentifier];
    v14 = [v13 UUIDString];
    uint64_t v15 = [v6 uniqueIdentifier];
    uint64_t v16 = [v15 UUIDString];
    uint64_t v12 = [v14 compare:v16];
  }
  return v12;
}

id __67__HUProgrammableSwitchEventOptionItem__subclass_updateWithOptions___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addResultsFromOutcome:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  id v10 = objc_opt_class();
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = [v4 results];
  v14 = [v10 _buildOutTriggerEditorOptionsForCharacteristic:v11 triggerValue:v12 latestResults:v13];

  [v4 addResultsFromDictionary:v14];
  uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v15, "na_safeAddObject:", *(void *)(a1 + 56));
  objc_msgSend(v15, "na_safeAddObject:", *(void *)(a1 + 64));
  objc_msgSend(v15, "na_safeAddObject:", *(void *)(a1 + 72));
  uint64_t v16 = [*(id *)(a1 + 32) characteristics];
  uint64_t v17 = [v16 allObjects];
  [v15 addObjectsFromArray:v17];

  [v15 addObjectsFromArray:*(void *)(a1 + 80)];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v4 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68AF0]];
  uint64_t v19 = (void *)MEMORY[0x1E4F7A0D8];
  int v20 = (void *)[v4 copy];
  v21 = [v19 futureWithResult:v20];

  return v21;
}

+ (id)_shortformTitleForLatestResults:(id)a3
{
  return (id)[a3 objectForKey:*MEMORY[0x1E4F68AB8]];
}

+ (id)_longformTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _shortformTitleForLatestResults:v7];
  uint64_t v9 = [v6 service];
  id v10 = [v9 accessory];
  uint64_t v11 = objc_msgSend(v10, "hf_numberOfProgrammableSwitches");

  if (v11 == 1)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v13 = [v8 lowercaseStringWithLocale:v12];
  }
  else
  {
    uint64_t v12 = [a1 _sectionTitleForCharacteristic:v6 latestResults:v7];
    int v20 = HULocalizedStringWithFormat(@"HUProgrammableSwitchEventOptionLongFormTitleFormatString", @"%@%@", v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    v21 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v13 = [v20 lowercaseStringWithLocale:v21];
  }

  return v13;
}

+ (id)_sectionTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v5 = a4;
  id v6 = [a3 service];
  id v7 = [v6 accessory];
  uint64_t v8 = objc_msgSend(v7, "hf_numberOfProgrammableSwitches");

  if (v8 == 1)
  {
    uint64_t v9 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsItemManagerProgrammableSwitchDefaultSectionTitle", @"HUServiceDetailsItemManagerProgrammableSwitchDefaultSectionTitle", 1);
  }
  else
  {
    id v10 = [v5 objectForKey:@"sectionElementIndex"];
    uint64_t v11 = [v5 objectForKey:@"sectionNamespace"];
    [v11 unsignedIntegerValue];
    [v10 unsignedIntegerValue];
    uint64_t v9 = HFProgrammableSwitchLocalizableStringForAccessoryNamingSystemAndIndex();
  }

  return v9;
}

+ (id)_triggerBuilderContextAwareTitleForCharacteristic:(id)a3 latestResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _shortformTitleForLatestResults:v7];
  uint64_t v9 = [v6 service];
  id v10 = [v9 accessory];
  uint64_t v11 = objc_msgSend(v10, "hf_numberOfProgrammableSwitches");

  if (v11 == 1)
  {
    uint64_t v12 = [v8 localizedCapitalizedString];
  }
  else
  {
    uint64_t v13 = [a1 _sectionTitleForCharacteristic:v6 latestResults:v7];
    int v20 = HULocalizedStringWithFormat(@"HUProgrammableSwitchEventOptionLongFormTitleFormatString", @"%@%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    uint64_t v12 = [v20 localizedCapitalizedString];
  }

  return v12;
}

+ (id)_buildOutTriggerEditorOptionsForCharacteristic:(id)a3 triggerValue:(id)a4 latestResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [a1 _sectionTitleForCharacteristic:v8 latestResults:v9];
  uint64_t v12 = objc_opt_new();
  objc_msgSend(v12, "na_safeSetObject:forKey:", v11, @"sectionTitleKey");
  uint64_t v13 = objc_msgSend(v8, "hf_eventTriggersForTriggerValue:", v10);
  uint64_t v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = objc_msgSend(v8, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", v10);

  if (v15) {
    [v14 removeObject:v15];
  }
  uint64_t v16 = objc_opt_new();
  [v16 setShowTriggerSummary:0];
  [v16 setShowActionSetsInstructions:0];
  [v16 setShowConditionTriggers:0];
  [v16 setShowTriggerEnableSwitch:0];
  uint64_t v17 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryTestProgrammableButtonActionButtonTitle", @"HUTriggerSummaryTestProgrammableButtonActionButtonTitle", 1);
  [v16 setTestActionsInstructionDescription:v17];

  uint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryAddProgrammableButtonActionButtonTitle", @"HUTriggerSummaryAddProgrammableButtonActionButtonTitle", 1);
  [v16 setServiceActionsInstructionDescription:v18];

  uint64_t v19 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryDeleteProgrammableButtonActionTitle", @"HUTriggerSummaryDeleteProgrammableButtonActionTitle", 1);
  [v16 setDeleteInstructionDescription:v19];

  int v20 = _HULocalizedStringWithDefaultValue(@"HUTriggerActionEditorInstructionsDescriptionStringForProgrammableSwitch", @"HUTriggerActionEditorInstructionsDescriptionStringForProgrammableSwitch", 1);
  [v16 setActionEditorInstructionsDescription:v20];

  v21 = [a1 _triggerBuilderContextAwareTitleForCharacteristic:v8 latestResults:v9];

  [v16 setTriggerContextAwareTitle:v21];
  [v16 setUnsupportedTriggers:v14];
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    id v22 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryConfirmationAlertTitleMac", @"HUTriggerSummaryConfirmationAlertTitleMac", 1);
    [v16 setDeleteConfirmationAlertTitle:v22];
  }
  if ([v14 count])
  {
    long long v23 = @"HUTriggerSummaryConfirmationOfDeletingMultipleTriggers";
  }
  else
  {
    if (![MEMORY[0x1E4F69758] isAMac]) {
      goto LABEL_10;
    }
    long long v23 = @"HUTriggerSummaryConfirmationAlertMessageMac";
  }
  long long v24 = _HULocalizedStringWithDefaultValue(v23, v23, 1);
  [v16 setDeleteConfirmationAlertMessage:v24];

LABEL_10:
  objc_msgSend(v12, "na_safeSetObject:forKey:", v16, @"triggerBuilderContext");

  return v12;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end