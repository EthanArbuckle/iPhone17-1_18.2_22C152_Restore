@interface HFPresenceEventFormatter
- (HFPresenceEventFormatter)initWithHome:(id)a3;
- (HFPresenceEventFormatter)initWithOptions:(id)a3;
- (HFTriggerNaturalLanguageOptions)options;
- (HMHome)home;
- (id)_formattedListForSelectedUsers:(id)a3 inHome:(id)a4;
- (id)stringForPresenceEvent:(id)a3;
- (id)stringForPresenceEventBuilder:(id)a3;
- (id)stringForPresenceEventBuilder:(id)a3 actionsDescription:(id)a4;
- (unint64_t)nameType;
- (unint64_t)style;
- (void)setHome:(id)a3;
- (void)setNameType:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation HFPresenceEventFormatter

- (HFPresenceEventFormatter)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFPresenceEventFormatter;
  v6 = [(HFPresenceEventFormatter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (HFPresenceEventFormatter)initWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  v6 = [(HFPresenceEventFormatter *)self initWithHome:v5];

  if (v6)
  {
    v6->_nameType = [v4 nameType];
    objc_storeWeak((id *)&v6->_options, v4);
  }

  return v6;
}

- (id)stringForPresenceEvent:(id)a3
{
  id v4 = a3;
  id v5 = [[HFPresenceEventBuilder alloc] initWithEvent:v4];

  v6 = [(HFPresenceEventFormatter *)self stringForPresenceEventBuilder:v5];

  return v6;
}

- (id)stringForPresenceEventBuilder:(id)a3
{
  return [(HFPresenceEventFormatter *)self stringForPresenceEventBuilder:a3 actionsDescription:0];
}

- (id)stringForPresenceEventBuilder:(id)a3 actionsDescription:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v61 = MEMORY[0x263EF8330];
  uint64_t v62 = 3221225472;
  v63 = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke;
  v64 = &unk_26408D648;
  id v8 = v6;
  id v65 = v8;
  uint64_t v9 = [v8 activationGranularity];
  v10 = @"ActivationGranularityUser";
  if (v9) {
    v10 = &stru_26C081158;
  }
  if (v9 == 1) {
    v10 = @"ActivationGranularityHome";
  }
  v11 = v10;
  uint64_t v56 = MEMORY[0x263EF8330];
  uint64_t v57 = 3221225472;
  v58 = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_2;
  v59 = &unk_26408D648;
  id v12 = v8;
  id v60 = v12;
  uint64_t v13 = [v12 locationEventType];
  v14 = @"Arriving";
  if (v13 != 1) {
    v14 = &stru_26C081158;
  }
  if (v13 == 2) {
    v14 = @"Leaving";
  }
  v15 = v14;
  v54[5] = MEMORY[0x263EF8330];
  v54[6] = 3221225472;
  v54[7] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_3;
  v54[8] = &unk_26408D648;
  v55 = self;
  unint64_t v16 = [(HFPresenceEventFormatter *)self style];
  if (v16 == 1)
  {
    v18 = @"HFPresenceEventActivationDescription";
  }
  else if (v16)
  {
    v18 = &stru_26C081158;
  }
  else
  {
    uint64_t v17 = [(HFPresenceEventFormatter *)v55 nameType];
    v18 = @"HFPresenceTriggerNameFullSentence";
    if (v17 == 1) {
      v18 = @"HFPresenceTriggerName";
    }
  }
  v19 = [NSString stringWithFormat:@"%@_%@_%@", v18, v11, v15];
  v20 = [v12 users];
  uint64_t v21 = [v20 type];

  if (!v21)
  {
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4;
    v54[3] = &unk_26408DB88;
    v54[4] = self;
    if (__77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4((uint64_t)v54)) {
      v28 = @"_CurrentUser";
    }
    else {
      v28 = @"_AllUsers";
    }
    goto LABEL_24;
  }
  v22 = [v12 users];
  v23 = [(HFPresenceEventFormatter *)self home];
  v24 = [v22 resolveSelectedUsersWithHome:v23];
  uint64_t v25 = [v24 count];

  if (v25 == 2)
  {
    if (![v12 activationGranularity])
    {
      v29 = [v19 stringByAppendingString:@"_ListOfUsers"];

      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_6;
      v46[3] = &unk_26408DBB0;
      id v47 = v7;
      v48 = self;
      id v49 = v12;
      v30 = _Block_copy(v46);

      v31 = v47;
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (v25 != 1)
  {
LABEL_26:
    v29 = [v19 stringByAppendingString:@"_NumberOfUsers"];

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_7;
    aBlock[3] = &unk_26408DBD8;
    id v44 = v7;
    uint64_t v45 = v25;
    v30 = _Block_copy(aBlock);
    v31 = v44;
LABEL_29:

    goto LABEL_30;
  }
  v26 = [v12 users];
  uint64_t v27 = [v26 type];

  if (v27 != 1)
  {
    v29 = [v19 stringByAppendingString:@"_SingleUser"];

    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_5;
    v50[3] = &unk_26408DBB0;
    id v51 = v7;
    v52 = self;
    id v53 = v12;
    v30 = _Block_copy(v50);

    v31 = v51;
    goto LABEL_29;
  }
  v28 = @"_CurrentUser";
LABEL_24:
  v29 = [v19 stringByAppendingString:v28];

  v30 = 0;
LABEL_30:
  if ([v7 length] && -[HFPresenceEventFormatter nameType](self, "nameType") == 2)
  {
    v32 = [v29 stringByAppendingString:@"_WithAction"];

    if (!v30)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_8;
      v41[3] = &unk_26408DC00;
      id v42 = v7;
      v30 = _Block_copy(v41);
    }
  }
  else
  {
    v32 = v29;
  }
  v33 = _HFLocalizedStringWithDefaultValue(@"HFUnknownLocationTriggerName", @"HFUnknownLocationTriggerName", 1);
  v34 = HFLocalizedStringWithFormatterBlock(v32, v33, v30);
  if ([v34 isEqualToString:v33])
  {
    v35 = HFLogForCategory(0x2FuLL);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v67 = v40;
      __int16 v68 = 2112;
      v69 = v32;
      _os_log_error_impl(&dword_20B986000, v35, OS_LOG_TYPE_ERROR, "%@: failed to localize string with key: %@", buf, 0x16u);
    }
  }
  if (![(HFPresenceEventFormatter *)self nameType])
  {
    v36 = (void *)MEMORY[0x263F0E878];
    v37 = [(HFPresenceEventFormatter *)self home];
    uint64_t v38 = objc_msgSend(v36, "hf_sanitizeTriggerName:home:", v34, v37);

    v34 = (void *)v38;
  }

  return v34;
}

__CFString *__77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) activationGranularity];
  v2 = &stru_26C081158;
  if (!v1) {
    v2 = @"ActivationGranularityUser";
  }
  if (v1 == 1) {
    return @"ActivationGranularityHome";
  }
  else {
    return v2;
  }
}

__CFString *__77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) locationEventType];
  v2 = &stru_26C081158;
  if (v1 == 1) {
    v2 = @"Arriving";
  }
  if (v1 == 2) {
    return @"Leaving";
  }
  else {
    return v2;
  }
}

__CFString *__77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) style];
  if (v2 == 1) {
    return @"HFPresenceEventActivationDescription";
  }
  if (v2) {
    return &stru_26C081158;
  }
  if ([*(id *)(a1 + 32) nameType] == 1) {
    return @"HFPresenceTriggerName";
  }
  return @"HFPresenceTriggerNameFullSentence";
}

BOOL __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) options];
  if ([v2 shouldUseFirstPersonPronounIfPossible])
  {
    v3 = [*(id *)(a1 + 32) home];
    id v4 = objc_msgSend(v3, "hf_allUsersIncludingCurrentUser");
    BOOL v5 = [v4 count] == 1 && objc_msgSend(*(id *)(a1 + 32), "nameType") != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = NSString;
  if (*(void *)(a1 + 32))
  {
    uint64_t v21 = 0;
    id v6 = *(void **)(a1 + 40);
    BOOL v5 = *(void **)(a1 + 48);
    id v7 = a2;
    id v8 = [v5 users];
    uint64_t v9 = [*(id *)(a1 + 40) home];
    v10 = [v6 _formattedListForSelectedUsers:v8 inHome:v9];
    uint64_t v19 = *(void *)(a1 + 32);
    v11 = (id *)&v21;
    [v4 stringWithValidatedFormat:v7, @"%@%@", &v21, v10, v19, v20, 0 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v13 = *(void **)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v14 = a2;
    id v8 = [v12 users];
    uint64_t v9 = [*(id *)(a1 + 40) home];
    v10 = [v13 _formattedListForSelectedUsers:v8 inHome:v9];
    v11 = (id *)&v20;
    [v4 stringWithValidatedFormat:v14, @"%@", &v20, v10, v18, 0, v21 validFormatSpecifiers error];
  v15 = };

  id v16 = *v11;
  return v15;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = NSString;
  if (*(void *)(a1 + 32))
  {
    uint64_t v21 = 0;
    id v6 = *(void **)(a1 + 40);
    BOOL v5 = *(void **)(a1 + 48);
    id v7 = a2;
    id v8 = [v5 users];
    uint64_t v9 = [*(id *)(a1 + 40) home];
    v10 = [v6 _formattedListForSelectedUsers:v8 inHome:v9];
    uint64_t v19 = *(void *)(a1 + 32);
    v11 = (id *)&v21;
    [v4 stringWithValidatedFormat:v7, @"%@%@", &v21, v10, v19, v20, 0 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v13 = *(void **)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v14 = a2;
    id v8 = [v12 users];
    uint64_t v9 = [*(id *)(a1 + 40) home];
    v10 = [v13 _formattedListForSelectedUsers:v8 inHome:v9];
    v11 = (id *)&v20;
    [v4 stringWithValidatedFormat:v14, @"%@", &v20, v10, v18, 0, v21 validFormatSpecifiers error];
  v15 = };

  id v16 = *v11;
  return v15;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v8 = 0;
    v3 = (id *)&v8;
    [NSString localizedStringWithValidatedFormat:a2, @"%ld%@", &v8, *(void *)(a1 + 40), v2, v7, 0 validFormatSpecifiers error];
  }
  else
  {
    uint64_t v7 = 0;
    v3 = (id *)&v7;
    objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", a2, @"%ld", &v7, *(void *)(a1 + 40), v6, 0, v8);
  id v4 = };

  return v4;
}

id __77__HFPresenceEventFormatter_stringForPresenceEventBuilder_actionsDescription___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = 0;
  uint64_t v2 = [NSString stringWithValidatedFormat:a2, @"%@", &v5, v4 validFormatSpecifiers error];
  return v2;
}

- (id)_formattedListForSelectedUsers:(id)a3 inHome:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[HFUserNameFormatter alloc] initWithHome:v5];
  [(HFUserNameFormatter *)v7 setStyle:1];
  uint64_t v8 = [v6 resolveSelectedUsersWithHome:v5];

  uint64_t v9 = [v8 allObjects];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke;
  uint64_t v20 = &unk_26408DC28;
  id v21 = v5;
  v22 = v7;
  v10 = v7;
  id v11 = v5;
  id v12 = objc_msgSend(v9, "na_map:", &v17);
  uint64_t v13 = objc_msgSend(v12, "sortedArrayUsingSelector:", sel_localizedStandardCompare_, v17, v18, v19, v20);

  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_70_1);
  }
  id v14 = (id)qword_2676B69D8;
  [v14 setListStyle:1];
  v15 = [v14 stringForObjectValue:v13];

  return v15;
}

id __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 32), "hf_handleForUser:", a2);
  uint64_t v4 = [*(id *)(a1 + 40) stringForObjectValue:v3];

  return v4;
}

uint64_t __66__HFPresenceEventFormatter__formattedListForSelectedUsers_inHome___block_invoke_3()
{
  v0 = objc_alloc_init(HFListFormatter);
  uint64_t v1 = qword_2676B69D8;
  qword_2676B69D8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (unint64_t)nameType
{
  return self->_nameType;
}

- (void)setNameType:(unint64_t)a3
{
  self->_nameType = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFTriggerNaturalLanguageOptions)options
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_options);
  return (HFTriggerNaturalLanguageOptions *)WeakRetained;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_options);
  objc_storeStrong((id *)&self->_home, 0);
}

@end