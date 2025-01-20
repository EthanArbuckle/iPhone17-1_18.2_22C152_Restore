@interface WFFileLabelColorPickerParameter
- (Class)singleStateClass;
- (NSDictionary)localizedLabelsForLabelNumbers;
- (WFFileLabelColorPickerParameter)initWithDefinition:(id)a3;
- (id)accessoryColorForPossibleState:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFFileLabelColorPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLabelsForLabelNumbers, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (NSDictionary)localizedLabelsForLabelNumbers
{
  return self->_localizedLabelsForLabelNumbers;
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v4 = (void *)getUIColorClass_softClass;
  uint64_t v16 = getUIColorClass_softClass;
  if (!getUIColorClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getUIColorClass_block_invoke;
    v12[3] = &unk_264E5EC88;
    v12[4] = &v13;
    __getUIColorClass_block_invoke((uint64_t)v12);
    v4 = (void *)v14[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  v6 = [v3 number];
  int v7 = [v6 unsignedIntValue];

  switch(v7)
  {
    case 0:
      uint64_t v8 = [v5 clearColor];
      goto LABEL_12;
    case 1:
      uint64_t v8 = [v5 systemGrayColor];
      goto LABEL_12;
    case 2:
      uint64_t v8 = [v5 systemGreenColor];
      goto LABEL_12;
    case 3:
      uint64_t v8 = [v5 systemPurpleColor];
      goto LABEL_12;
    case 4:
      uint64_t v8 = [v5 systemBlueColor];
      goto LABEL_12;
    case 5:
      uint64_t v8 = [v5 systemYellowColor];
      goto LABEL_12;
    case 6:
      uint64_t v8 = [v5 systemRedColor];
      goto LABEL_12;
    case 7:
      uint64_t v8 = [v5 systemOrangeColor];
LABEL_12:
      v9 = (void *)v8;
      if (!v8) {
        goto LABEL_14;
      }
      v10 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithPlatformColor:v8];

      break;
    default:
LABEL_14:
      v10 = 0;
      break;
  }

  return v10;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFFileLabelColorPickerParameter *)self localizedLabelsForLabelNumbers];
  v6 = [v4 number];

  int v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFFileLabelColorPickerParameter)initWithDefinition:(id)a3
{
  v20[8] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)WFFileLabelColorPickerParameter;
  id v3 = [(WFFileLabelColorPickerParameter *)&v18 initWithDefinition:a3];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(&unk_26F0765A8, "if_map:", &__block_literal_global_209);
    possibleStates = v3->_possibleStates;
    v3->_possibleStates = (NSArray *)v4;

    v19[0] = &unk_26F074A78;
    v6 = WFLocalizedString(@"No Color");
    v20[0] = v6;
    v19[1] = &unk_26F074A90;
    int v7 = WFLocalizedString(@"Red");
    v20[1] = v7;
    v19[2] = &unk_26F074AA8;
    uint64_t v8 = WFLocalizedString(@"Orange");
    v20[2] = v8;
    v19[3] = &unk_26F074AC0;
    v9 = WFLocalizedString(@"Yellow");
    v20[3] = v9;
    v19[4] = &unk_26F074AD8;
    v10 = WFLocalizedString(@"Green");
    v20[4] = v10;
    v19[5] = &unk_26F074AF0;
    v11 = WFLocalizedString(@"Blue");
    v20[5] = v11;
    v19[6] = &unk_26F074B08;
    v12 = WFLocalizedString(@"Purple");
    v20[6] = v12;
    v19[7] = &unk_26F074B20;
    uint64_t v13 = WFLocalizedString(@"Gray");
    v20[7] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:8];
    localizedLabelsForLabelNumbers = v3->_localizedLabelsForLabelNumbers;
    v3->_localizedLabelsForLabelNumbers = (NSDictionary *)v14;

    uint64_t v16 = v3;
  }

  return v3;
}

id __54__WFFileLabelColorPickerParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86D50];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithNumber:v3];

  return v4;
}

@end