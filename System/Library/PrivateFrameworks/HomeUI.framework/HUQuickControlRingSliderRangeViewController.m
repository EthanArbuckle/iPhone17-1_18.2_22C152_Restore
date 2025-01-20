@interface HUQuickControlRingSliderRangeViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (HUQuickControlRingSliderView)ringSliderView;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (void)_getHeaterCoolerThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5;
- (void)_getTemperatureThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5;
- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4;
- (void)invalidateViewProfile;
- (void)modelValueDidChange;
- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4;
- (void)setRingSliderView:(id)a3;
- (void)updateMainStatusStringWithValue:(id)a3;
- (void)updateSupplementaryValue;
@end

@implementation HUQuickControlRingSliderRangeViewController

+ (id)controlItemPredicate
{
  v2 = [[HUQuickControlSingleItemPredicate alloc] initWithBlock:&__block_literal_global_62];

  return v2;
}

uint64_t __67__HUQuickControlRingSliderRangeViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  v4 = [v2 valueSource];
  v5 = [v4 allServices];
  int v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_5);

  return isKindOfClass & (v6 ^ 1u);
}

uint64_t __67__HUQuickControlRingSliderRangeViewController_controlItemPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F2DE30]];

  return v3;
}

- (id)createInteractionCoordinator
{
  uint64_t v3 = [HUQuickControlRingSliderView alloc];
  v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v5 = [(HUQuickControlRingSliderView *)v3 initWithProfile:v4];
  [(HUQuickControlRingSliderRangeViewController *)self setRingSliderView:v5];

  int v6 = [HUQuickControlRingSliderInteractionCoordinator alloc];
  v7 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
  v8 = [(HUQuickControlRingSliderInteractionCoordinator *)v6 initWithControlView:v7 delegate:self];

  v9 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
  [v9 setInteractionDelegate:v8];

  return v8;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createViewProfile
{
  uint64_t v3 = objc_alloc_init(HUQuickControlRingSliderViewProfile);
  [(HUQuickControlRingSliderViewProfile *)v3 setIsHandleViewVisible:0];
  [(HUQuickControlRingSliderViewProfile *)v3 setHasOffState:0];
  [(HUQuickControlRingSliderViewProfile *)v3 setHandleViewStyle:2];
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [v4 latestResults];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  uint64_t v7 = [v6 mode];
  if (v7 == 2)
  {
    [(HUQuickControlRingSliderViewProfile *)v3 setHasSecondaryValue:1];
    v30 = (void *)MEMORY[0x1E4F69660];
    v31 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v32 = [v31 minimumValueConstraints];
    v33 = [v32 validRange];
    v34 = [MEMORY[0x1E4F69678] sharedCoordinator];
    v13 = objc_msgSend(v30, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v33, objc_msgSend(v34, "isCelsius"));

    id v35 = objc_alloc(MEMORY[0x1E4F69370]);
    v36 = [v13 minValue];
    v37 = [v13 maxValue];
    v38 = [(HUQuickControlSingleControlViewController *)self controlItem];
    [v38 minimumValueConstraints];
    v39 = v106 = self;
    [v39 stepValue];
    v40 = v105 = v6;
    v22 = (void *)[v35 initWithMinValue:v36 maxValue:v37 stepValue:v40];

    v41 = (void *)MEMORY[0x1E4F69660];
    v42 = [(HUQuickControlSingleControlViewController *)v106 controlItem];
    v43 = [v42 maximumValueConstraints];
    v44 = [v43 validRange];
    v45 = [MEMORY[0x1E4F69678] sharedCoordinator];
    v27 = objc_msgSend(v41, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v44, objc_msgSend(v45, "isCelsius"));

    id v46 = objc_alloc(MEMORY[0x1E4F69370]);
    v47 = [v27 minValue];
    v48 = [v27 maxValue];
    v49 = [(HUQuickControlSingleControlViewController *)v106 controlItem];
    v50 = [v49 maximumValueConstraints];
    v51 = [v50 stepValue];
    v52 = (void *)[v46 initWithMinValue:v47 maxValue:v48 stepValue:v51];

    int v6 = v105;
    self = v106;

    v53 = [v13 unionRange:v27];
    v54 = [v53 minValue];
    [v54 floatValue];
    float v26 = v55;

    v56 = [v53 maxValue];
    [v56 floatValue];
    float v29 = v57;

    v58 = [v52 percentageConstraintsWithinRange:v53];
    [(HUQuickControlRingSliderViewProfile *)v3 setPrimaryValueConstraints:v58];

    v59 = [v22 percentageConstraintsWithinRange:v53];
    [(HUQuickControlRingSliderViewProfile *)v3 setSecondaryValueConstraints:v59];
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_47;
    }
    v8 = (void *)MEMORY[0x1E4F69660];
    v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v10 = [v9 targetValueConstraints];
    v11 = [v10 validRange];
    v12 = [MEMORY[0x1E4F69678] sharedCoordinator];
    v13 = objc_msgSend(v8, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v11, objc_msgSend(v12, "isCelsius"));

    id v14 = objc_alloc(MEMORY[0x1E4F69370]);
    v15 = [v13 minValue];
    v16 = [v13 maxValue];
    v17 = [(HUQuickControlSingleControlViewController *)self controlItem];
    [v17 targetValueConstraints];
    v19 = v18 = self;
    [v19 stepValue];
    v21 = v20 = v6;
    v22 = (void *)[v14 initWithMinValue:v15 maxValue:v16 stepValue:v21];

    int v6 = v20;
    self = v18;

    v23 = [v22 percentageConstraintsWithinRange:v13];
    [(HUQuickControlRingSliderViewProfile *)v3 setPrimaryValueConstraints:v23];

    v24 = [v13 minValue];
    [v24 floatValue];
    float v26 = v25;

    v27 = [v13 maxValue];
    [v27 floatValue];
    float v29 = v28;
  }

  if (v26 != v29)
  {
    double v60 = v26;
    double v61 = v29;
    v62 = [MEMORY[0x1E4F69678] sharedCoordinator];
    int v63 = [v62 isCelsius];

    if (!v63)
    {
      double v76 = v60 * 9.0 / 5.0 + 32.0;
      double v77 = v61 * 9.0 / 5.0 + 32.0;
      if (v76 <= v77)
      {
        double v79 = v61 - v60;
        uint64_t v78 = 1;
        do
        {
          double v80 = ((v76 + -32.0) * 5.0 / 9.0 - v60) / v79;
          *(float *)&double v80 = v80;
          v81 = [NSNumber numberWithFloat:v80];
          v82 = [(HUQuickControlRingSliderViewProfile *)v3 gradationMarkingValues];
          v83 = [v82 arrayByAddingObject:v81];
          [(HUQuickControlRingSliderViewProfile *)v3 setGradationMarkingValues:v83];

          double v76 = v76 + 1.0;
        }
        while (v76 <= v77);
      }
      else
      {
        uint64_t v78 = 1;
      }
LABEL_46:
      [(HUQuickControlRingSliderViewProfile *)v3 setGradationMarkingViewStyle:v78];
      goto LABEL_47;
    }
    objc_opt_class();
    v64 = [(HUQuickControlSingleControlViewController *)self controlItem];
    if (objc_opt_isKindOfClass()) {
      v65 = v64;
    }
    else {
      v65 = 0;
    }
    id v66 = v65;

    objc_opt_class();
    v67 = [(HUQuickControlSingleControlViewController *)self controlItem];
    if (objc_opt_isKindOfClass()) {
      v68 = v67;
    }
    else {
      v68 = 0;
    }
    id v69 = v68;

    uint64_t v70 = [v6 mode];
    if (v70 != 2)
    {
      if (v70 != 1) {
        goto LABEL_41;
      }
      v71 = [v66 targetValueConstraints];
      v72 = [v71 stepValue];

      if (v69)
      {
        v73 = [v69 targetValueConstraints];
        uint64_t v74 = [v73 stepValue];

        v72 = (void *)v74;
      }
      char v75 = [v72 isEqualToNumber:&unk_1F19B3F08];

      if ((v75 & 1) == 0) {
        goto LABEL_41;
      }
LABEL_39:
      double v96 = 1.0;
      uint64_t v78 = 1;
LABEL_42:
      if (v26 <= v29)
      {
        double v97 = v26;
        do
        {
          double v98 = (v97 - v60) / (v61 - v60);
          *(float *)&double v98 = v98;
          v99 = [NSNumber numberWithFloat:v98];
          v100 = [(HUQuickControlRingSliderViewProfile *)v3 gradationMarkingValues];
          v101 = [v100 arrayByAddingObject:v99];
          [(HUQuickControlRingSliderViewProfile *)v3 setGradationMarkingValues:v101];

          double v97 = v96 + v97;
        }
        while (v97 <= v61);
      }

      goto LABEL_46;
    }
    v84 = [v66 minimumValueConstraints];
    uint64_t v85 = [v84 stepValue];

    v86 = [v66 maximumValueConstraints];
    uint64_t v87 = [v86 stepValue];

    if (v69)
    {
      v88 = [v69 minimumValueConstraints];
      uint64_t v89 = [v88 stepValue];

      v90 = [v69 maximumValueConstraints];
      uint64_t v91 = [v90 stepValue];

      uint64_t v87 = v91;
      uint64_t v85 = v89;
    }
    if (v85 && v87)
    {
      int v92 = [(id)v85 intValue];
      int v93 = [(id)v87 intValue];
      if (v92 <= v93) {
        int v94 = v93;
      }
      else {
        int v94 = v92;
      }
      if (v94 != 1) {
        goto LABEL_40;
      }
    }
    else
    {
      if (!(v85 | v87))
      {
LABEL_40:

LABEL_41:
        double v96 = 0.5;
        uint64_t v78 = 2;
        goto LABEL_42;
      }
      if (v85) {
        v95 = (void *)v85;
      }
      else {
        v95 = (void *)v87;
      }
      [v95 isEqualToNumber:&unk_1F19B3F08];
    }

    goto LABEL_39;
  }
LABEL_47:
  [(HUQuickControlRingSliderViewProfile *)v3 setStyle:0];
  v102 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(HUQuickControlRingSliderViewProfile *)v3 setShouldShowSupplementaryValue:1];
  }
  else
  {
    v103 = [(HUQuickControlSingleControlViewController *)self controlItem];
    objc_opt_class();
    [(HUQuickControlRingSliderViewProfile *)v3 setShouldShowSupplementaryValue:objc_opt_isKindOfClass() & 1];
  }

  return v3;
}

- (id)controlToViewValueTransformer
{
  uint64_t v3 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [MEMORY[0x1E4F69760] transformerForRingSliderViewProfile:v3 rangeControlItem:v4];

  return v5;
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  id v6 = a4;
  [(HUQuickControlSingleControlViewController *)&v7 interactionCoordinator:a3 viewValueDidChange:v6];
  -[HUQuickControlRingSliderRangeViewController updateMainStatusStringWithValue:](self, "updateMainStatusStringWithValue:", v6, v7.receiver, v7.super_class);

  [(HUQuickControlRingSliderRangeViewController *)self updateSupplementaryValue];
}

- (void)invalidateViewProfile
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  [(HUQuickControlSingleControlViewController *)&v4 invalidateViewProfile];
  uint64_t v3 = [(HUQuickControlSingleControlViewController *)self modelValue];
  [(HUQuickControlRingSliderRangeViewController *)self updateMainStatusStringWithValue:v3];
}

- (void)updateMainStatusStringWithValue:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)0x1E4F69000;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    if (!v6)
    {
LABEL_12:
      id v6 = HFLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v41 = (id)objc_opt_class();
        __int16 v42 = 2112;
        id v43 = v4;
        id v21 = v41;
        _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "value is neither HFRangeCotrolItemValue, NSNumber, or HFNumberRange class. Value's class type is %@. value = %@", buf, 0x16u);
      }
      goto LABEL_42;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
    }
    objc_super v7 = (void *)MEMORY[0x1E4F69760];
    v8 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v10 = [v7 transformerForRingSliderViewProfile:v8 rangeControlItem:v9];

    v11 = [v10 valueForTransformedValue:v4];
    v12 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v13 = [v12 normalizedValueForValue:v11];

    objc_opt_class();
    id v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

    if (!v6) {
      goto LABEL_12;
    }
  }
  id v14 = [(HUQuickControlSingleControlViewController *)self controlItem];
  uint64_t v15 = [v14 latestResults];
  v16 = [(id)v15 objectForKey:*MEMORY[0x1E4F683A8]];

  v17 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_opt_class();
  LOBYTE(v15) = objc_opt_isKindOfClass();

  id v35 = v16;
  if (v15)
  {
    id v38 = 0;
    id v39 = 0;
    [(HUQuickControlRingSliderRangeViewController *)self _getTemperatureThresholdControlItemStateString:&v39 temperatureString:&v38 withRangeControlItemValue:v6];
    id v18 = v39;
    id v19 = v38;
    v20 = (void *)MEMORY[0x1E4F2CFF0];
  }
  else
  {
    v22 = [(HUQuickControlSingleControlViewController *)self controlItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v18 = 0;
      id v19 = 0;
      BOOL v26 = 0;
      goto LABEL_21;
    }
    id v36 = 0;
    id v37 = 0;
    [(HUQuickControlRingSliderRangeViewController *)self _getHeaterCoolerThresholdControlItemStateString:&v37 temperatureString:&v36 withRangeControlItemValue:v6];
    id v18 = v37;
    id v19 = v36;
    v20 = (void *)MEMORY[0x1E4F2CE48];
  }
  v24 = [v16 objectForKey:*v20];
  float v25 = v24;
  if (v24) {
    BOOL v26 = [v24 integerValue] == 0;
  }
  else {
    BOOL v26 = 0;
  }

LABEL_21:
  v27 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
  [v27 updateSupplementaryLabelWithString:v18];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v28 = 40.0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      id v5 = v4;
      if (objc_opt_isKindOfClass()) {
        float v29 = v5;
      }
      else {
        float v29 = 0;
      }
      id v30 = v29;

      if ([v30 mode] == 2) {
        double v28 = 40.0;
      }
      else {
        double v28 = 65.0;
      }
    }
    else
    {
      double v28 = 65.0;
    }
  }
  v31 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
  [v31 updatePrimaryLabelWithString:v19 fontSize:v28];

  if (v26)
  {
    int v32 = 0;
    BOOL v33 = 1;
  }
  else
  {
    v31 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
    if ([v31 reachabilityState] == 1)
    {
      int v32 = 0;
      BOOL v33 = 1;
    }
    else
    {
      id v5 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
      BOOL v33 = [v5 reachabilityState] == 0;
      int v32 = 1;
    }
  }
  v34 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
  [v34 setShowOffState:v33];

  if (v32) {
  if (!v26)
  }

LABEL_42:
}

- (void)modelValueDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  [(HUQuickControlSingleControlViewController *)&v4 modelValueDidChange];
  uint64_t v3 = [(HUQuickControlSingleControlViewController *)self modelValue];
  [(HUQuickControlRingSliderRangeViewController *)self updateMainStatusStringWithValue:v3];

  [(HUQuickControlRingSliderRangeViewController *)self updateSupplementaryValue];
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v8 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  v9 = [v8 controlView];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  char v12 = [v11 isUserInteractionActive];
  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlRingSliderRangeViewController;
    [(HUQuickControlSingleControlViewController *)&v13 quickControlItemUpdater:v6 didUpdateResultsForControlItems:v7];
  }
  [(HUQuickControlRingSliderRangeViewController *)self updateSupplementaryValue];
}

- (void)updateSupplementaryValue
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v40 = [(HUQuickControlViewController *)self controlItems];
  uint64_t v3 = [v40 allObjects];
  objc_super v4 = [v3 firstObject];
  id v5 = [(HUQuickControlSingleControlViewController *)self controlItem];
  if ([v4 isEqual:v5])
  {
    id v6 = [(HUQuickControlSingleControlViewController *)self controlItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      id v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        return;
      }
    }
    v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v10 = [v9 latestResults];
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

    uint64_t v12 = [v11 mode];
    if (v12 == 2)
    {
      v17 = [(HUQuickControlSingleControlViewController *)self controlItem];
      id v14 = [v17 minimumValueConstraints];

      uint64_t v15 = [(HUQuickControlSingleControlViewController *)self controlItem];
      uint64_t v16 = [v15 maximumValueConstraints];
    }
    else
    {
      if (v12 != 1)
      {
        id v14 = 0;
        id v18 = 0;
        goto LABEL_16;
      }
      objc_super v13 = [(HUQuickControlSingleControlViewController *)self controlItem];
      id v14 = [v13 targetValueConstraints];

      uint64_t v15 = [(HUQuickControlSingleControlViewController *)self controlItem];
      uint64_t v16 = [v15 targetValueConstraints];
    }
    id v18 = (void *)v16;

    if (v14 && v18)
    {
      id v19 = [v14 validRange];
      v20 = [v18 validRange];
      id v21 = [v19 unionRange:v20];

      v22 = [(HUQuickControlSingleControlViewController *)self controlItem];
      v23 = [v22 latestResults];
      v24 = [v23 objectForKey:*MEMORY[0x1E4F683A8]];

      float v25 = [v24 objectForKey:*MEMORY[0x1E4F2CED8]];
      [v25 floatValue];
      float v27 = v26;
      double v28 = [v21 minValue];
      [v28 floatValue];
      float v30 = v27 - v29;
      v31 = [v21 maxValue];
      [v31 floatValue];
      float v33 = v32;
      v34 = [v21 minValue];
      [v34 floatValue];
      double v36 = (float)(v30 / (float)(v33 - v35));

      id v37 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
      [v37 setSupplementaryValue:v36];

LABEL_19:
      return;
    }
LABEL_16:
    id v38 = HFLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v42 = "-[HUQuickControlRingSliderRangeViewController updateSupplementaryValue]";
      __int16 v43 = 2112;
      uint64_t v44 = v14;
      __int16 v45 = 2112;
      id v46 = v18;
      _os_log_error_impl(&dword_1BE345000, v38, OS_LOG_TYPE_ERROR, "%s. Either HFNumberValueConstraints for min and max are nil. (minConstraints = %@, maxConstraints = %@)", buf, 0x20u);
    }

    id v39 = [(HUQuickControlRingSliderRangeViewController *)self ringSliderView];
    [v39 setSupplementaryValue:1.79769313e308];

    goto LABEL_19;
  }
}

- (void)_getTemperatureThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5
{
  id v8 = a5;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  float v55 = __Block_byref_object_copy__8;
  v56 = __Block_byref_object_dispose__8;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8;
  v50 = __Block_byref_object_dispose__8;
  id v51 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __138__HUQuickControlRingSliderRangeViewController__getTemperatureThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke;
  aBlock[3] = &unk_1E6388780;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[4] = &v52;
  aBlock[5] = &v46;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v10 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v11 = [v10 latestResults];
  uint64_t v12 = [v11 objectForKey:*MEMORY[0x1E4F683A8]];

  objc_super v13 = [MEMORY[0x1E4F69160] sharedInstance];
  id v14 = [v13 temperatureFormatter];

  [v14 setInputIsCelsius:1];
  uint64_t v15 = [v12 objectForKey:*MEMORY[0x1E4F2CED8]];
  uint64_t v16 = [v12 objectForKey:*MEMORY[0x1E4F2CFF0]];
  switch([v16 integerValue])
  {
    case 0:
      v17 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureNow", @"HUQuickControlTemperatureNow", 1);
      uint64_t v18 = [v17 localizedUppercaseString];
      id v19 = (void *)v53[5];
      v53[5] = v18;

      uint64_t v20 = [v14 stringForObjectValue:v15];
      id v21 = (void *)v47[5];
      v47[5] = v20;
      goto LABEL_14;
    case 1:
      v22 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureHeatTo", @"HUQuickControlTemperatureHeatTo", 1);
      uint64_t v23 = [v22 localizedUppercaseString];
      v24 = (void *)v53[5];
      v53[5] = v23;

      id v21 = [v8 targetValue];
      uint64_t v25 = [v14 stringForObjectValue:v21];
      goto LABEL_13;
    case 2:
      float v26 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureCoolTo", @"HUQuickControlTemperatureCoolTo", 1);
      uint64_t v27 = [v26 localizedUppercaseString];
      double v28 = (void *)v53[5];
      v53[5] = v27;

      id v21 = [v8 targetValue];
      uint64_t v25 = [v14 stringForObjectValue:v21];
      goto LABEL_13;
    case 3:
      if ([v16 integerValue] != 3) {
        goto LABEL_11;
      }
      float v29 = [v8 minimumValue];
      if (!v29) {
        goto LABEL_11;
      }
      float v30 = [v8 maximumValue];
      if (v30)
      {
        v31 = [v8 targetValue];

        if (v31)
        {
LABEL_18:
          double v36 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureKeepBetween", @"HUQuickControlTemperatureKeepBetween", 1);
          uint64_t v37 = [v36 localizedUppercaseString];
          id v38 = (void *)v53[5];
          v53[5] = v37;

          id v21 = [v8 maximumValue];
          uint64_t v44 = [v14 stringForObjectValue:v21];
          id v39 = [v8 minimumValue];
          id v40 = [v14 stringForObjectValue:v39];
          id v41 = HFLocalizedStringWithFormat();
          uint64_t v42 = objc_msgSend(v41, "localizedUppercaseString", v40, v44);
          __int16 v43 = (void *)v47[5];
          v47[5] = v42;

          goto LABEL_14;
        }
      }
      else
      {
      }
LABEL_11:
      if ([v16 integerValue] != 3) {
        goto LABEL_18;
      }
      float v32 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureSetTo", @"HUQuickControlTemperatureSetTo", 1);
      uint64_t v33 = [v32 localizedUppercaseString];
      v34 = (void *)v53[5];
      v53[5] = v33;

      id v21 = [v8 targetValue];
      uint64_t v25 = [v14 stringForObjectValue:v21];
LABEL_13:
      float v35 = (void *)v47[5];
      v47[5] = v25;

LABEL_14:
LABEL_15:

      if (v9) {
        v9[2](v9);
      }

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&v52, 8);

      return;
    default:
      goto LABEL_15;
  }
}

void *__138__HUQuickControlRingSliderRangeViewController__getTemperatureThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke(void *result)
{
  v1 = result;
  if (result[6])
  {
    result = *(id *)(*(void *)(result[4] + 8) + 40);
    *(void *)v1[6] = result;
  }
  if (v1[7])
  {
    result = *(id *)(*(void *)(v1[5] + 8) + 40);
    *(void *)v1[7] = result;
  }
  return result;
}

- (void)_getHeaterCoolerThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5
{
  id v8 = a5;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = __Block_byref_object_copy__8;
  v53 = __Block_byref_object_dispose__8;
  id v54 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__8;
  uint64_t v47 = __Block_byref_object_dispose__8;
  id v48 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__HUQuickControlRingSliderRangeViewController__getHeaterCoolerThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke;
  aBlock[3] = &unk_1E6388780;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[4] = &v49;
  aBlock[5] = &v43;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v10 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v11 = [v10 latestResults];
  uint64_t v12 = [v11 objectForKey:*MEMORY[0x1E4F683A8]];

  objc_super v13 = [MEMORY[0x1E4F69160] sharedInstance];
  id v14 = [v13 temperatureFormatter];

  [v14 setInputIsCelsius:1];
  uint64_t v15 = [v12 objectForKey:*MEMORY[0x1E4F2CED8]];
  uint64_t v16 = [v12 objectForKey:*MEMORY[0x1E4F2CFE8]];
  v17 = [v12 objectForKey:*MEMORY[0x1E4F2CE48]];
  if (![v17 integerValue])
  {
    uint64_t v27 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureNow", @"HUQuickControlTemperatureNow", 1);
    uint64_t v28 = [v27 localizedUppercaseString];
    float v29 = (void *)v50[5];
    v50[5] = v28;

    uint64_t v30 = [v14 stringForObjectValue:v15];
    uint64_t v23 = (void *)v44[5];
    v44[5] = v30;
    goto LABEL_13;
  }
  uint64_t v18 = [v16 integerValue];
  if (v18 == 2)
  {
    uint64_t v31 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureCoolingTo", @"HUQuickControlTemperatureCoolingTo", 1);
    float v32 = (void *)v50[5];
    v50[5] = v31;

    uint64_t v23 = [v8 targetValue];
    uint64_t v33 = [v14 stringForObjectValue:v23];
LABEL_12:
    id v39 = (void *)v44[5];
    v44[5] = v33;

    goto LABEL_13;
  }
  if (v18 == 1)
  {
    uint64_t v34 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureHeatingTo", @"HUQuickControlTemperatureHeatingTo", 1);
    float v35 = (void *)v50[5];
    v50[5] = v34;

    uint64_t v23 = [v8 targetValue];
    uint64_t v33 = [v14 stringForObjectValue:v23];
    goto LABEL_12;
  }
  if (v18) {
    goto LABEL_14;
  }
  id v19 = [v8 minimumValue];
  if (!v19
    || ([v8 maximumValue],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    double v36 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureSetTo", @"HUQuickControlTemperatureSetTo", 1);
    uint64_t v37 = [v36 localizedUppercaseString];
    id v38 = (void *)v50[5];
    v50[5] = v37;

    uint64_t v23 = [v8 targetValue];
    uint64_t v33 = [v14 stringForObjectValue:v23];
    goto LABEL_12;
  }
  uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUQuickControlTemperatureKeepBetween", @"HUQuickControlTemperatureKeepBetween", 1);
  v22 = (void *)v50[5];
  v50[5] = v21;

  uint64_t v23 = [v8 maximumValue];
  v24 = [v14 stringForObjectValue:v23];
  id v41 = [v8 minimumValue];
  id v40 = [v14 stringForObjectValue:v41];
  uint64_t v25 = HFLocalizedStringWithFormat();
  float v26 = (void *)v44[5];
  v44[5] = v25;

LABEL_13:
LABEL_14:

  if (v9) {
    v9[2](v9);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
}

void *__139__HUQuickControlRingSliderRangeViewController__getHeaterCoolerThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke(void *result)
{
  v1 = result;
  if (result[6])
  {
    result = *(id *)(*(void *)(result[4] + 8) + 40);
    *(void *)v1[6] = result;
  }
  if (v1[7])
  {
    result = *(id *)(*(void *)(v1[5] + 8) + 40);
    *(void *)v1[7] = result;
  }
  return result;
}

- (HUQuickControlRingSliderView)ringSliderView
{
  return self->_ringSliderView;
}

- (void)setRingSliderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end