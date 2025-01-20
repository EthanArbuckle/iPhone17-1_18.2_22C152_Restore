@interface UIAccessibilityPickerComponent
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (CGRect)accessibilityFrame;
- (_NSRange)accessibilityRowRange;
- (double)_accessibilityNumberValue;
- (id)_accessibilityDateTimePickerValues;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityViewForComponent;
- (id)_axSpeechInputLabelForDateCalendarUnit:(uint64_t)a1;
- (id)_axSpeechInputLabelForTimeIntervalCalendarUnit:(uint64_t)a1;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)automationElements;
- (id)picker;
- (id)setPicker:(id *)result;
- (int64_t)_accessibilityIndexForPickerString:(id)a3;
- (int64_t)_accessibilityPickerType;
- (uint64_t)_axIsInDatePickerView;
- (uint64_t)_isRowDisabledInWebKit:(uint64_t)a1;
- (uint64_t)component;
- (uint64_t)setComponent:(uint64_t)result;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityDatePickerComponentType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityMoveSelection:(uint64_t)a1;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation UIAccessibilityPickerComponent

- (unint64_t)_accessibilityAutomationType
{
  return 39;
}

- (id)accessibilityLabel
{
  v18 = self;
  v17[1] = (id)a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v14 = component < [WeakRetained numberOfComponents];

  if (v14)
  {
    id v11 = objc_loadWeakRetained((id *)&v18->_picker);
    v17[0] = (id)[v11 delegate];

    id v16 = 0;
    if (objc_opt_respondsToSelector())
    {
      id v10 = -[UIAccessibilityPickerComponent picker]((uint64_t)v18);
      id location = (id)objc_msgSend(v17[0], "pickerView:accessibilityAttributedLabelForComponent:");

      if (location)
      {
        v2 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:location];
        id v3 = v16;
        id v16 = v2;
      }
      objc_storeStrong(&location, 0);
    }
    if (!v16 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v8 = v17[0];
      id v9 = -[UIAccessibilityPickerComponent picker]((uint64_t)v18);
      id v4 = (id)objc_msgSend(v8, "pickerView:accessibilityLabelForComponent:");
      id v5 = v16;
      id v16 = v4;
    }
    id v19 = v16;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(v17, 0);
  }
  else
  {
    id v19 = 0;
  }
  v6 = v19;

  return v6;
}

- (id)picker
{
  if (a1) {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)accessibilityHint
{
  v15 = self;
  v14[1] = (id)a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v11 = component < [WeakRetained numberOfComponents];

  if (v11)
  {
    id v8 = objc_loadWeakRetained((id *)&v15->_picker);
    v14[0] = (id)[v8 delegate];

    id v13 = 0;
    if (objc_opt_respondsToSelector())
    {
      id location = (id)[v14[0] pickerView:v15 accessibilityAttributedHintForComponent:v15->_component];
      if (location)
      {
        v2 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:location];
        id v3 = v13;
        id v13 = v2;
      }
      objc_storeStrong(&location, 0);
    }
    if (!v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v4 = (id)[v14[0] pickerView:v15 accessibilityHintForComponent:v15->_component];
      id v5 = v13;
      id v13 = v4;
    }
    id v16 = v13;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
  }
  else
  {
    id v16 = 0;
  }
  v6 = v16;

  return v6;
}

- (int64_t)_accessibilityPickerType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  int64_t v4 = [WeakRetained _accessibilityPickerType];

  return v4;
}

- (uint64_t)_axIsInDatePickerView
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    NSClassFromString(&cfstr_Uidatepickervi.isa);
    char v3 = objc_opt_isKindOfClass() & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (id)automationElements
{
  v28 = self;
  v27[1] = (id)a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  NSClassFromString(&cfstr_Uidatepickervi_1.isa);
  char v17 = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    char v17 = -[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v28);
  }

  if (v17)
  {
    id v29 = 0;
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)&v28->_picker);
    id v14 = (id)[v15 safeValueForKey:@"_tables"];
    v27[0] = (id)[v14 objectAtIndex:v28->_component];

    id v26 = (id)[v27[0] safeValueForKey:@"_middleTable"];
    uint64_t v25 = [v26 numberOfRowsInSection:0];
    uint64_t v24 = 0;
    id v23 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:v25];
    while (v24 < v25)
    {
      id v12 = v26;
      id v13 = (id)[MEMORY[0x263F088C8] indexPathForRow:v24 inSection:0];
      id v22 = (id)objc_msgSend(v12, "accessibilityCellForRowAtIndexPath:");

      if (objc_opt_respondsToSelector())
      {
        id v10 = (void *)MEMORY[0x263F21670];
        id v11 = (id)[v22 title];
        id v21 = (id)objc_msgSend(v10, "axAttributedStringWithString:");

        [v23 addObject:v21];
        objc_storeStrong(&v21, 0);
      }
      else
      {
        NSClassFromString(&cfstr_Uipickertablev.isa);
        if (objc_opt_isKindOfClass())
        {
          id v20 = (id)[v22 safeUIViewForKey:@"wrappedView"];
          id v19 = (id)[v20 accessibilityLabel];
          if (![v19 length])
          {
            id v9 = (id)[v20 _accessibleSubviews];
            id v2 = (id)MEMORY[0x2455E6560]();
            id v3 = v19;
            id v19 = v2;
          }
          if (![v19 length])
          {
            id v8 = (id)[v20 accessibilityElements];
            id v4 = (id)MEMORY[0x2455E6560]();
            id v5 = v19;
            id v19 = v4;
          }
          if (v19)
          {
            id v18 = (id)[MEMORY[0x263F21670] axAttributedStringWithString:v19];
            [v23 addObject:v18];
            objc_storeStrong(&v18, 0);
          }
          objc_storeStrong(&v19, 0);
          objc_storeStrong(&v20, 0);
        }
      }
      objc_storeStrong(&v22, 0);
      ++v24;
    }
    id v29 = v23;
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(v27, 0);
  }
  v6 = v29;

  return v6;
}

- (int64_t)_accessibilityIndexForPickerString:(id)a3
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v20->_picker);
  id v10 = (id)[WeakRetained safeValueForKey:@"_tables"];
  id v18 = (id)[v10 objectAtIndex:v20->_component];

  id v17 = (id)[v18 safeValueForKey:@"_middleTable"];
  uint64_t v16 = [v17 numberOfRowsInSection:0];
  for (int64_t i = 0; i < v16; ++i)
  {
    id v8 = v17;
    id v9 = (id)[MEMORY[0x263F088C8] indexPathForRow:i inSection:0];
    id v14 = (id)objc_msgSend(v8, "cellForRowAtIndexPath:");

    if (objc_opt_respondsToSelector())
    {
      id v6 = (id)[v14 title];
      char v7 = [v6 isEqualToString:location[0]];

      if (v7)
      {
        int64_t v21 = i;
        int v13 = 1;
        goto LABEL_13;
      }
LABEL_12:
      int v13 = 0;
      goto LABEL_13;
    }
    NSClassFromString(&cfstr_Uipickertablev.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v12 = (id)[v14 safeValueForKey:@"wrappedView"];
    id v4 = (id)[v12 accessibilityLabel];
    char v5 = [v4 isEqualToString:location[0]];

    if (v5)
    {
      int64_t v21 = i;
      int v13 = 1;
    }
    else
    {
      int v13 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (!v13) {
      goto LABEL_12;
    }
LABEL_13:
    objc_storeStrong(&v14, 0);
    if (v13) {
      goto LABEL_16;
    }
  }
  int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  int v13 = 1;
LABEL_16:
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)_accessibilityViewForComponent
{
  uint64_t v14 = a1;
  if (a1)
  {
    unint64_t v8 = *(void *)(v14 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 64));
    BOOL v10 = v8 < [WeakRetained numberOfComponents];

    if (v10)
    {
      uint64_t v13 = 0;
      id v4 = objc_loadWeakRetained((id *)(v14 + 64));
      uint64_t v5 = [v4 selectedRowInComponent:*(void *)(v14 + 56)];

      uint64_t v13 = v5;
      uint64_t v12 = 0;
      id v6 = objc_loadWeakRetained((id *)(v14 + 64));
      uint64_t v7 = [v6 numberOfRowsInComponent:*(void *)(v14 + 56)];

      uint64_t v12 = v7;
      if (v5 >= 0 && v13 < v12)
      {
        id v3 = objc_loadWeakRetained((id *)(v14 + 64));
        id v11 = (id)[v3 viewForRow:v13 forComponent:*(void *)(v14 + 56)];

        id v15 = v11;
        objc_storeStrong(&v11, 0);
      }
      else
      {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  v1 = v15;

  return v1;
}

- (id)_accessibilityDateTimePickerValues
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v49 = self;
  v48[1] = (id)a2;
  v48[0] = (id)[MEMORY[0x263EFF980] array];
  v47 = [(UIAccessibilityPickerComponent *)v49 _accessibilityDatePickerComponentType];
  if (!v47)
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x263EFFE88], 0.25, 0);
    v47 = [(UIAccessibilityPickerComponent *)v49 _accessibilityDatePickerComponentType];
  }
  id v46 = -[UIAccessibilityPickerComponent _accessibilityViewForComponent]((uint64_t)v49);
  id v45 = (id)[v46 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickervi.isa)];
  v38[1] = (id)MEMORY[0x263EF8330];
  int v39 = -1073741824;
  int v40 = 0;
  v41 = __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke;
  v42 = &__block_descriptor_40_e24___NSString_32__0_8q16q24l;
  v43 = v47;
  id v44 = (id)MEMORY[0x2455E7040]();
  v38[0] = (id)[v45 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v37 = (id)[v45 safeValueForKey:@"_mode"];
  uint64_t v36 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  int v33 = 0x20000000;
  int v34 = 32;
  uint64_t v35 = 0;
  id location = (id)AXLogUIA();
  os_log_type_t v29 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v51, (int)v47);
    _os_log_impl(&dword_2402B7000, (os_log_t)location, v29, "Date picker unit: %d", v51, 8u);
  }
  objc_storeStrong(&location, 0);
  if (v47 == (void *)2 || v47 == (void *)4) {
    goto LABEL_26;
  }
  if (v47 == (void *)8)
  {
    v32[3] = 12;
    goto LABEL_27;
  }
  if (v47 == (void *)16)
  {
    v32[3] = 31;
    goto LABEL_27;
  }
  if (v47 == (void *)32)
  {
    id v10 = (id)[v37 safeValueForKey:@"is24Hour"];
    char v11 = [v10 BOOLValue];

    char v28 = v11 & 1;
    if (v11) {
      int v2 = 24;
    }
    else {
      int v2 = 12;
    }
    v32[3] = v2;
    goto LABEL_27;
  }
  if (v47 == (void *)64)
  {
    if (v38[0]) {
      uint64_t v9 = [v38[0] minuteInterval];
    }
    else {
      uint64_t v9 = 60;
    }
    v32[3] = 60 / v9;
    goto LABEL_27;
  }
  if (v47 == (void *)128)
  {
    v32[3] = 60;
    goto LABEL_27;
  }
  if (v47 == (void *)536)
  {
LABEL_26:
    uint64_t v22 = MEMORY[0x263EF8330];
    int v23 = -1073741824;
    int v24 = 0;
    uint64_t v25 = __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_331;
    id v26 = &unk_2650AE6B8;
    v27[1] = &v31;
    v27[0] = v37;
    id v27[2] = v47;
    AXPerformSafeBlock();
    objc_storeStrong(v27, 0);
    goto LABEL_27;
  }
  if (v47 == (void *)0x10000) {
    v32[3] = 2;
  }
LABEL_27:
  if (v47 == (void *)536)
  {
    uint64_t v21 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v49->_picker);
    uint64_t v7 = [WeakRetained selectedRowInComponent:v49->_component];

    uint64_t v21 = v7;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v32[3] = 100;
    }
    else
    {
      int v20 = 0;
      uint64_t v19 = v21 - 50;
      if (v21 - 50 <= 0) {
        uint64_t v6 = v20;
      }
      else {
        uint64_t v6 = v19;
      }
      uint64_t v18 = v6;
      uint64_t v36 = v6;
      id v17 = 0;
      id v17 = v32[3];
      uint64_t v16 = (v21 + 50);
      if ((uint64_t)v17 >= v21 + 50) {
        uint64_t v5 = v16;
      }
      else {
        uint64_t v5 = v17;
      }
      oslog[1] = v5;
      v32[3] = (uint64_t)v5;
    }
  }
  oslog[0] = (os_log_t)(id)AXLogUIA();
  os_log_type_t v14 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v50, v36, v32[3]);
    _os_log_impl(&dword_2402B7000, oslog[0], v14, "Date picker start %d: end %d", v50, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  for (uint64_t i = v36; i < v32[3]; ++i)
  {
    id v12 = (id)(*((uint64_t (**)(id, id, uint64_t, unint64_t))v44 + 2))(v44, v37, i, v49->_component);
    if (!v12) {
      _AXAssert();
    }
    if ([v12 length]) {
      [v48[0] addObject:v12];
    }
    if (v47 == (void *)4 && v32[3] > 1000 && i != v32[3] - 1) {
      uint64_t i = v32[3] - 2;
    }
    objc_storeStrong(&v12, 0);
  }
  id v4 = v48[0];
  _Block_object_dispose(&v31, 8);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(v38, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v48, 0);

  return v4;
}

id __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v18 = a3;
  id v17 = a4;
  v16[1] = a1;
  uint64_t v10 = 0;
  char v11 = &v10;
  int v12 = 838860800;
  int v13 = 48;
  os_log_type_t v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  v16[0] = 0;
  v9[0] = location[0];
  v9[2] = a1[4];
  v9[3] = v18;
  v9[1] = &v10;
  v9[4] = v17;
  AXPerformSafeBlock();
  id v5 = (id)v11[5];
  objc_storeStrong(v9, 0);
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);

  return v5;
}

void __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_318(uint64_t a1)
{
  v9[2] = (id)a1;
  v9[1] = (id)a1;
  NSClassFromString(&cfstr_Uidatepickermo_0.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(void *)(a1 + 48) == 536)
  {
    v9[0] = (id)[*(id *)(a1 + 32) dateForRow:*(void *)(a1 + 56) inCalendarUnit:*(void *)(a1 + 48)];
    id v8 = (id)[*(id *)(a1 + 32) dateFormatterForCalendarUnit:*(void *)(a1 + 48)];
    id v1 = (id)[v8 stringFromDate:v9[0]];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v1;

    objc_storeStrong(&v8, 0);
    objc_storeStrong(v9, 0);
  }
  else
  {
    id v4 = (id)[*(id *)(a1 + 32) titleForRow:*(void *)(a1 + 56) inComponent:*(void *)(a1 + 64)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

uint64_t __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_331(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfRowsForCalendarUnit:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_accessibilityDatePickerComponentType
{
  id v3 = -[UIAccessibilityPickerComponent _accessibilityViewForComponent]((uint64_t)self);
  unint64_t v4 = [v3 _accessibilityDatePickerComponentType];

  return v4;
}

- (double)_accessibilityNumberValue
{
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v9 = component < [WeakRetained numberOfComponents];

  if (!v9) {
    return 0.0;
  }
  id v3 = objc_loadWeakRetained((id *)&self->_picker);
  uint64_t v4 = [v3 selectedRowInComponent:self->_component];

  id v5 = objc_loadWeakRetained((id *)&self->_picker);
  uint64_t v6 = [v5 numberOfRowsInComponent:self->_component];

  if (v4 >= 0 && v4 < v6) {
    return (double)v4;
  }
  else {
    return 0.0;
  }
}

- (id)accessibilityValue
{
  v63 = self;
  SEL v62 = a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v44 = component < [WeakRetained numberOfComponents];

  if (v44)
  {
    uint64_t v61 = 0;
    id v38 = objc_loadWeakRetained((id *)&v63->_picker);
    uint64_t v39 = [v38 selectedRowInComponent:v63->_component];

    uint64_t v61 = v39;
    uint64_t v60 = 0;
    id v40 = objc_loadWeakRetained((id *)&v63->_picker);
    uint64_t v41 = [v40 numberOfRowsInComponent:v63->_component];

    uint64_t v60 = v41;
    if (v39 >= 0 && v61 < v60)
    {
      id v37 = objc_loadWeakRetained((id *)&v63->_picker);
      id v59 = (id)[v37 viewForRow:v61 forComponent:v63->_component];

      id v58 = (id)[v59 accessibilityLabel];
      if ([v58 length])
      {
        id v45 = (id)[v59 accessibilityLanguage];
        if ([v45 length])
        {
          char v11 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:v58];
          id v12 = v58;
          id v58 = v11;

          [v58 setAttribute:v45 forKey:*MEMORY[0x263F1CE90]];
        }
        objc_storeStrong(&v45, 0);
      }
      else
      {
        id v35 = objc_loadWeakRetained((id *)&v63->_picker);
        id v34 = (id)[v35 delegate];
        char v36 = objc_opt_respondsToSelector();

        if (v36)
        {
          id v31 = objc_loadWeakRetained((id *)&v63->_picker);
          id v30 = (id)[v31 delegate];
          id v29 = objc_loadWeakRetained((id *)&v63->_picker);
          id location = (id)objc_msgSend(v30, "pickerView:attributedTitleForRow:forComponent:");

          id v32 = (id)[location accessibilityLabel];
          BOOL v33 = [v32 length] == 0;

          if (v33) {
            id v2 = (id)[objc_alloc(MEMORY[0x263F21660]) initWithCFAttributedString:location];
          }
          else {
            id v2 = (id)[v58 accessibilityLabel];
          }
          id v3 = v58;
          id v58 = v2;

          objc_storeStrong(&location, 0);
        }
        char v55 = 0;
        char v53 = 0;
        char v28 = 0;
        if (![v58 length])
        {
          id v56 = objc_loadWeakRetained((id *)&v63->_picker);
          char v55 = 1;
          id v54 = (id)[v56 delegate];
          char v53 = 1;
          char v28 = objc_opt_respondsToSelector();
        }
        if (v53) {

        }
        if (v55) {
        if (v28)
        }
        {
          id v27 = objc_loadWeakRetained((id *)&v63->_picker);
          id v26 = (id)[v27 delegate];
          id v25 = objc_loadWeakRetained((id *)&v63->_picker);
          id v4 = (id)objc_msgSend(v26, "pickerView:titleForRow:forComponent:");
          id v5 = v58;
          id v58 = v4;

          id v52 = (id)[v58 accessibilityLabel];
          if ([v52 length]) {
            objc_storeStrong(&v58, v52);
          }
          objc_storeStrong(&v52, 0);
        }
        char v50 = 0;
        char v48 = 0;
        char v24 = 0;
        if (![v58 length])
        {
          id v51 = objc_loadWeakRetained((id *)&v63->_picker);
          char v50 = 1;
          id v49 = (id)[v51 delegate];
          char v48 = 1;
          char v24 = objc_opt_respondsToSelector();
        }
        if (v48) {

        }
        if (v50) {
        if (v24)
        }
        {
          id v23 = objc_loadWeakRetained((id *)&v63->_picker);
          id v22 = (id)[v23 delegate];
          id v21 = objc_loadWeakRetained((id *)&v63->_picker);
          id v47 = (id)objc_msgSend(v22, "pickerView:viewForRow:forComponent:reusingView:");

          id v6 = (id)[v47 accessibilityLabel];
          id v7 = v58;
          id v58 = v6;

          id v46 = (id)[v47 accessibilityLanguage];
          if ([v46 length])
          {
            id v8 = objc_alloc(MEMORY[0x263F21660]);
            BOOL v9 = (void *)[v8 initWithString:v58];
            id v10 = v58;
            id v58 = v9;

            [v58 setAttribute:v46 forKey:*MEMORY[0x263F1CE90]];
          }
          objc_storeStrong(&v46, 0);
          objc_storeStrong(&v47, 0);
        }
      }
      if (![v58 length])
      {
        id v20 = (id)[v59 _accessibleSubviews];
        id v13 = (id)MEMORY[0x2455E6560]();
        id v14 = v58;
        id v58 = v13;
      }
      if (![v58 length])
      {
        id v19 = (id)[v59 accessibilityElements];
        id v15 = (id)MEMORY[0x2455E6560]();
        id v16 = v58;
        id v58 = v15;
      }
      id v64 = v58;
      objc_storeStrong(&v58, 0);
      objc_storeStrong(&v59, 0);
    }
    else
    {
      id v64 = 0;
    }
  }
  else
  {
    id v64 = 0;
  }
  id v17 = v64;

  return v17;
}

- (_NSRange)accessibilityRowRange
{
  id v56 = self;
  SEL v55 = a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v17 = component < [WeakRetained numberOfComponents];

  if (v17)
  {
    uint64_t v54 = 0;
    id v11 = objc_loadWeakRetained((id *)&v56->_picker);
    uint64_t v12 = [v11 selectedRowInComponent:v56->_component];

    uint64_t v54 = v12;
    uint64_t v53 = 0;
    id v13 = objc_loadWeakRetained((id *)&v56->_picker);
    uint64_t v14 = [v13 numberOfRowsInComponent:v56->_component];

    uint64_t v53 = v14;
    if (v12 >= 0 && v54 < v53)
    {
      id v10 = objc_loadWeakRetained((id *)&v56->_picker);
      id v52 = (id)[v10 viewForRow:v54 forComponent:v56->_component];

      NSClassFromString(&cfstr_Uidatepickerco.isa);
      if (objc_opt_isKindOfClass())
      {
        id v51 = (id)[v52 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidatepickervi.isa)];
        id v50 = (id)[v51 safeValueForKey:@"_mode"];
        long long v49 = 0uLL;
        uint64_t v42 = 0;
        v43 = &v42;
        int v44 = 0x10000000;
        int v45 = 48;
        id v46 = &unk_24046C852;
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        v36[3] = (id)MEMORY[0x263EF8330];
        int v37 = -1073741824;
        int v38 = 0;
        uint64_t v39 = __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke;
        id v40 = &unk_2650AE390;
        v41[1] = &v42;
        v41[0] = v50;
        AXPerformSafeBlock();
        long long v49 = *((_OWORD *)v43 + 2);
        objc_storeStrong(v41, 0);
        _Block_object_dispose(&v42, 8);
        v36[0] = (id)[v51 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
        char v34 = 0;
        id v9 = (id)[v50 safeValueForKey:@"_selectedDateComponents"];
        id v33 = (id)__UIAccessibilitySafeClass();

        id v32 = v33;
        objc_storeStrong(&v33, 0);
        id v35 = v32;
        id v7 = objc_loadWeakRetained((id *)&v56->_picker);
        unint64_t v8 = [v7 _accessibilityPickerType];

        unint64_t v31 = v8;
        if (v8 <= 2)
        {
          unint64_t v3 = v8 - 2;
          char v2 = 0;
        }
        else
        {
          unint64_t v3 = v8 - 2;
          char v2 = 1;
        }
        if (v2)
        {
LABEL_39:
          int v30 = 0;
        }
        else
        {
          switch(v3)
          {
            case 0uLL:
              if (!v56->_component)
              {
                uint64_t v25 = 0;
                uint64_t v20 = 0;
                id v21 = &v20;
                int v22 = 0x20000000;
                int v23 = 32;
                uint64_t v24 = 0;
                v19[1] = &v20;
                v19[0] = v50;
                AXPerformSafeBlock();
                uint64_t v18 = v21[3];
                objc_storeStrong(v19, 0);
                _Block_object_dispose(&v20, 8);
                uint64_t v25 = v18;
                uint64_t v76 = v54;
                uint64_t v75 = v18;
                uint64_t v77 = v54;
                uint64_t v78 = v18;
                uint64_t v57 = v54;
                uint64_t v58 = v18;
                int v30 = 1;
                break;
              }
              if (v56->_component != 1) {
                goto LABEL_39;
              }
              uint64_t v72 = v54 % 60;
              uint64_t v71 = 60;
              uint64_t v73 = v54 % 60;
              uint64_t v74 = 60;
              uint64_t v57 = v54 % 60;
              uint64_t v58 = 60;
              int v30 = 1;
              break;
            case 1uLL:
              if (!v56->_component)
              {
                unint64_t v116 = (unint64_t)v54 % *((void *)&v49 + 1);
                uint64_t v115 = *((void *)&v49 + 1);
                unint64_t v117 = (unint64_t)v54 % *((void *)&v49 + 1);
                uint64_t v118 = *((void *)&v49 + 1);
                uint64_t v57 = (unint64_t)v54 % *((void *)&v49 + 1);
                uint64_t v58 = *((void *)&v49 + 1);
                int v30 = 1;
                break;
              }
              if (v56->_component == 1)
              {
                uint64_t v112 = v54 % 60;
                uint64_t v111 = 60;
                uint64_t v113 = v54 % 60;
                uint64_t v114 = 60;
                uint64_t v57 = v54 % 60;
                uint64_t v58 = 60;
                int v30 = 1;
                break;
              }
              if (v56->_component != 2) {
                goto LABEL_39;
              }
              uint64_t v108 = v54;
              uint64_t v107 = v53;
              uint64_t v109 = v54;
              uint64_t v110 = v53;
              uint64_t v57 = v54;
              uint64_t v58 = v53;
              int v30 = 1;
              break;
            case 2uLL:
              switch(v56->_component)
              {
                case 0uLL:
                  uint64_t v92 = 0x7FFFFFFFLL;
                  uint64_t v91 = 0;
                  uint64_t v93 = 0x7FFFFFFFLL;
                  uint64_t v94 = 0;
                  uint64_t v57 = 0x7FFFFFFFLL;
                  uint64_t v58 = 0;
                  int v30 = 1;
                  goto LABEL_40;
                case 1uLL:
                  unint64_t v88 = (unint64_t)v54 % *((void *)&v49 + 1);
                  uint64_t v87 = *((void *)&v49 + 1);
                  unint64_t v89 = (unint64_t)v54 % *((void *)&v49 + 1);
                  uint64_t v90 = *((void *)&v49 + 1);
                  uint64_t v57 = (unint64_t)v54 % *((void *)&v49 + 1);
                  uint64_t v58 = *((void *)&v49 + 1);
                  int v30 = 1;
                  goto LABEL_40;
                case 2uLL:
                  uint64_t v84 = v54 % 60;
                  uint64_t v83 = 60;
                  uint64_t v85 = v54 % 60;
                  uint64_t v86 = 60;
                  uint64_t v57 = v54 % 60;
                  uint64_t v58 = 60;
                  int v30 = 1;
                  goto LABEL_40;
              }
              if (v56->_component != 3) {
                goto LABEL_39;
              }
              uint64_t v80 = v54;
              uint64_t v79 = v53;
              uint64_t v81 = v54;
              uint64_t v82 = v53;
              uint64_t v57 = v54;
              uint64_t v58 = v53;
              int v30 = 1;
              break;
            case 3uLL:
              if (!v56->_component)
              {
                uint64_t v104 = v54 % 12;
                uint64_t v103 = 12;
                uint64_t v105 = v54 % 12;
                uint64_t v106 = 12;
                uint64_t v57 = v54 % 12;
                uint64_t v58 = 12;
                int v30 = 1;
                break;
              }
              if (v56->_component == 1)
              {
                id v29 = (id)[v36[0] calendar];
                id v28 = (id)[v29 dateFromComponents:v35];
                uint64_t v26 = [v29 rangeOfUnit:16 inUnit:8 forDate:v28];
                uint64_t v27 = v4;
                uint64_t v100 = v54 % 31;
                uint64_t v99 = v4;
                uint64_t v101 = v54 % 31;
                uint64_t v102 = v4;
                uint64_t v57 = v54 % 31;
                uint64_t v58 = v4;
                int v30 = 1;
                objc_storeStrong(&v28, 0);
                objc_storeStrong(&v29, 0);
                break;
              }
              if (v56->_component != 2) {
                goto LABEL_39;
              }
              uint64_t v96 = 0x7FFFFFFFLL;
              uint64_t v95 = 0;
              uint64_t v97 = 0x7FFFFFFFLL;
              uint64_t v98 = 0;
              uint64_t v57 = 0x7FFFFFFFLL;
              uint64_t v58 = 0;
              int v30 = 1;
              break;
            default:
              JUMPOUT(0);
          }
        }
LABEL_40:
        objc_storeStrong(&v35, 0);
        objc_storeStrong(v36, 0);
        objc_storeStrong(&v50, 0);
        objc_storeStrong(&v51, 0);
        if (!v30)
        {
          uint64_t v60 = 0x7FFFFFFFLL;
          uint64_t v59 = 0;
          uint64_t v61 = 0x7FFFFFFFLL;
          uint64_t v62 = 0;
          uint64_t v57 = 0x7FFFFFFFLL;
          uint64_t v58 = 0;
          int v30 = 1;
        }
      }
      else
      {
        NSClassFromString(&cfstr_Uidatepickerwe.isa);
        if (objc_opt_isKindOfClass())
        {
          uint64_t v68 = 0x7FFFFFFFLL;
          uint64_t v67 = 0;
          uint64_t v69 = 0x7FFFFFFFLL;
          uint64_t v70 = 0;
          uint64_t v57 = 0x7FFFFFFFLL;
          uint64_t v58 = 0;
        }
        else
        {
          uint64_t v64 = v54;
          uint64_t v63 = v53;
          uint64_t v65 = v54;
          uint64_t v66 = v53;
          uint64_t v57 = v54;
          uint64_t v58 = v53;
        }
        int v30 = 1;
      }
      objc_storeStrong(&v52, 0);
    }
    else
    {
      uint64_t v57 = 0x7FFFFFFFLL;
      uint64_t v58 = 0;
    }
  }
  else
  {
    uint64_t v57 = 0x7FFFFFFFLL;
    uint64_t v58 = 0;
  }
  NSUInteger v5 = v57;
  NSUInteger v6 = v58;
  result.length = v6;
  result.id location = v5;
  return result;
}

__n128 __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke(uint64_t a1)
{
  v4.n128_u64[0] = [*(id *)(a1 + 32) rangeForCalendarUnit:32];
  v4.n128_u64[1] = v1;
  __n128 result = v4;
  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v4;
  return result;
}

uint64_t __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfRowsForCalendarUnit:32];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGRect)accessibilityFrame
{
  int v37 = self;
  v36[1] = (id)a2;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  id v2 = (id)[WeakRetained accessibilityUserDefinedFrame];
  BOOL v28 = v2 == 0;

  if (v28)
  {
    unint64_t component = v37->_component;
    id v23 = objc_loadWeakRetained((id *)&v37->_picker);
    BOOL v24 = component < [v23 numberOfComponents];

    if (v24)
    {
      id v20 = objc_loadWeakRetained((id *)&v37->_picker);
      v36[0] = (id)[v20 safeValueForKey:@"_tables"];

      unint64_t v21 = v37->_component;
      if (v21 < [v36[0] count])
      {
        char v34 = (UIView *)(id)[v36[0] objectAtIndex:v37->_component];
        v33.origin = (CGPoint)*MEMORY[0x263F001A8];
        v33.size = *(CGSize *)(MEMORY[0x263F001A8] + 16);
        NSClassFromString(&cfstr_Uipickercolumn.isa);
        if (objc_opt_isKindOfClass())
        {
          id v19 = (id)[(UIView *)v34 safeValueForKey:@"_tableFrame"];
          [v19 rectValue];
          v31.x = v7;
          v31.y = v8;
          v32.width = v9;
          v32.height = v10;
          v33.origin = v31;
          v33.size = v32;
        }
        else
        {
          NSClassFromString(&cfstr_Uipickertablev_0.isa);
          if (objc_opt_isKindOfClass())
          {
            [(UIView *)v34 bounds];
            v29.x = v11;
            v29.y = v12;
            v30.width = v13;
            v30.height = v14;
            v33.origin = v29;
            v33.size = v30;
          }
        }
        CGRect v40 = UIAccessibilityConvertFrameToScreenCoordinates(v33, v34);
        *(CGFloat *)&long long v38 = v40.origin.x;
        *((void *)&v38 + 1) = *(void *)&v40.origin.y;
        *(CGFloat *)&long long v39 = v40.size.width;
        *((void *)&v39 + 1) = *(void *)&v40.size.height;
        int v35 = 1;
        objc_storeStrong((id *)&v34, 0);
      }
      else
      {
        long long v38 = *MEMORY[0x263F001A8];
        long long v39 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
        int v35 = 1;
      }
      objc_storeStrong(v36, 0);
    }
    else
    {
      long long v38 = *MEMORY[0x263F001A8];
      long long v39 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    }
  }
  else
  {
    id v26 = objc_loadWeakRetained((id *)&v37->_picker);
    id v25 = (id)[v26 accessibilityUserDefinedFrame];
    [v25 CGRectValue];
    *(void *)&long long v38 = v3;
    *((void *)&v38 + 1) = v4;
    *(void *)&long long v39 = v5;
    *((void *)&v39 + 1) = v6;
  }
  double v16 = *((double *)&v38 + 1);
  double v15 = *(double *)&v38;
  double v18 = *((double *)&v39 + 1);
  double v17 = *(double *)&v39;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_accessibilityMoveSelection:(uint64_t)a1
{
  uint64_t v34 = a1;
  uint64_t v33 = a2;
  if (a1)
  {
    unint64_t v19 = *(void *)(v34 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(v34 + 64));
    BOOL v21 = v19 < [WeakRetained numberOfComponents];

    if (v21)
    {
      CGSize v32 = 0;
      id v15 = objc_loadWeakRetained((id *)(v34 + 64));
      uint64_t v16 = [v15 selectedRowInComponent:*(void *)(v34 + 56)];

      CGSize v32 = (char *)(v16 + v33);
      id v17 = objc_loadWeakRetained((id *)(v34 + 64));
      BOOL v18 = v16 + v33 < [v17 numberOfRowsInComponent:*(void *)(v34 + 56)];

      if (v18)
      {
        if ((uint64_t)v32 < 0) {
          CGSize v32 = 0;
        }
      }
      else
      {
        id v14 = objc_loadWeakRetained((id *)(v34 + 64));
        CGSize v32 = (char *)([v14 numberOfRowsInComponent:*(void *)(v34 + 56)] - 1);
      }
      char v31 = 1;
      id v13 = objc_loadWeakRetained((id *)(v34 + 64));
      id v30 = (id)[v13 viewForRow:v32 forComponent:*(void *)(v34 + 56)];

      if (v30)
      {
        NSClassFromString(&cfstr_Uidatepickerco.isa);
        if (objc_opt_isKindOfClass())
        {
          id v12 = (id)[v30 safeValueForKey:@"titleLabel"];
          id v11 = (id)[v12 safeValueForKey:@"isEnabled"];
          char v31 = [v11 BOOLValue] & 1;
        }
      }
      if (v31)
      {
        if (v33 > 0)
        {
          while (1)
          {
            id v8 = objc_loadWeakRetained((id *)(v34 + 64));
            char v9 = 0;
            if ((uint64_t)v32 < [v8 numberOfRowsInComponent:*(void *)(v34 + 56)] - 1) {
              char v9 = -[UIAccessibilityPickerComponent _isRowDisabledInWebKit:](v34, (uint64_t)v32);
            }

            if ((v9 & 1) == 0) {
              break;
            }
            ++v32;
          }
        }
      }
      else if (v33 >= 0 || (uint64_t)v32 <= 0)
      {
        char v28 = 0;
        BOOL v10 = 0;
        if (v33 > 0)
        {
          id v29 = objc_loadWeakRetained((id *)(v34 + 64));
          char v28 = 1;
          BOOL v10 = (uint64_t)v32 < [v29 numberOfRowsInComponent:*(void *)(v34 + 56)];
        }
        if (v28) {

        }
        if (v10) {
          ++v32;
        }
      }
      else
      {
        --v32;
      }
      id v5 = objc_loadWeakRetained((id *)(v34 + 64));
      id v4 = (id)[v5 safeValueForKey:@"_tables"];
      id v27 = (id)[v4 objectAtIndex:*(void *)(v34 + 56)];

      id v26 = (id)[v27 safeValueForKey:@"_middleTable"];
      id v6 = (id)[v26 safeValueForKey:@"_contentOffsetAnimationDuration"];
      [v6 doubleValue];
      CGFloat v7 = v2;

      id v25 = v7;
      id v22 = v26;
      id v23 = (id)v34;
      v24[0] = v27;
      v24[1] = v32;
      v24[2] = v25;
      AXPerformSafeBlock();
      id v3 = (id)[v26 safeValueForKey:@"_scrollingFinished"];
      objc_storeStrong(v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v30, 0);
    }
  }
}

- (uint64_t)_isRowDisabledInWebKit:(uint64_t)a1
{
  uint64_t v21 = a1;
  uint64_t v20 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v21 + 64));
    BOOL v14 = v20 < [WeakRetained numberOfRowsInComponent:*(void *)(v21 + 56)];

    if (v14)
    {
      id v11 = objc_loadWeakRetained((id *)(v21 + 64));
      NSClassFromString(&cfstr_Wkselectsingle.isa);
      char v18 = 0;
      LOBYTE(v12) = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v19 = objc_loadWeakRetained((id *)(v21 + 64));
        char v18 = 1;
        NSClassFromString(&cfstr_Uiwebselectsin_0.isa);
        int v12 = objc_opt_isKindOfClass() ^ 1;
      }
      if (v18) {

      }
      if (v12)
      {
        char v22 = 0;
      }
      else
      {
        id v9 = objc_loadWeakRetained((id *)(v21 + 64));
        id v8 = (id)[v9 delegate];
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          id v7 = objc_loadWeakRetained((id *)(v21 + 64));
          id v6 = (id)[v7 delegate];
          id v5 = objc_loadWeakRetained((id *)(v21 + 64));
          id v17 = (id)objc_msgSend(v6, "pickerView:attributedTitleForRow:forComponent:");

          if ([v17 length])
          {
            id location = (id)[v17 attribute:*MEMORY[0x263F81500] atIndex:0 effectiveRange:0];
            if (location
              && ([location alphaComponent], v2 > 0.0)
              && ([location alphaComponent], v3 < 1.0))
            {
              char v22 = 1;
              int v16 = 1;
            }
            else
            {
              char v22 = 0;
              int v16 = 1;
            }
            objc_storeStrong(&location, 0);
          }
          else
          {
            char v22 = 0;
            int v16 = 1;
          }
          objc_storeStrong(&v17, 0);
        }
        else
        {
          char v22 = 0;
        }
      }
    }
    else
    {
      char v22 = 0;
    }
  }
  else
  {
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t __62__UIAccessibilityPickerComponent__accessibilityMoveSelection___block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  [*(id *)(a1 + 32) _setContentOffsetAnimationDuration:0.01];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  char v7 = 0;
  char isKindOfClass = 1;
  if (([WeakRetained safeBoolForKey:@"allowsMultipleSelection"] & 1) == 0)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    char v7 = 1;
    NSClassFromString(&cfstr_Wkmultiplesele.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v7) {

  }
  if (isKindOfClass)
  {
    v6[0] = *(id *)(a1 + 48);
    v6[1] = *(id *)(a1 + 56);
    AXPerformSafeBlock();
    objc_storeStrong(v6, 0);
  }
  else
  {
    id v2 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
    [v2 _selectRow:*(void *)(a1 + 56) inComponent:*(void *)(*(void *)(a1 + 40) + 56) animated:1 notify:1];
  }
  return [*(id *)(a1 + 32) _setContentOffsetAnimationDuration:*(double *)(a1 + 64)];
}

void __62__UIAccessibilityPickerComponent__accessibilityMoveSelection___block_invoke_2(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[MEMORY[0x263F088C8] indexPathForRow:*(void *)(a1 + 40) inSection:0];
  objc_msgSend(v1, "_scrollRowAtIndexPathToSelectionBar:animated:");
}

- (id)_accessibilityScrollStatus
{
  return [(UIAccessibilityPickerComponent *)self accessibilityValue];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, -8);
  }
  else if (a3 == 4)
  {
    -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, 8);
  }
  return 0;
}

- (unint64_t)accessibilityTraits
{
  id v30 = self;
  SEL v29 = a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v20 = component < [WeakRetained numberOfComponents];

  if (!v20) {
    return 0;
  }
  unint64_t v28 = 0;
  v27.receiver = v30;
  v27.super_class = (Class)UIAccessibilityPickerComponent;
  unint64_t v28 = [(UIAccessibilityPickerComponent *)&v27 accessibilityTraits];
  v28 |= *MEMORY[0x263F813B8] | *MEMORY[0x263F1CED8];
  uint64_t v26 = 0;
  id v14 = objc_loadWeakRetained((id *)&v30->_picker);
  uint64_t v15 = [v14 selectedRowInComponent:v30->_component];

  uint64_t v26 = v15;
  uint64_t v25 = 0;
  id v16 = objc_loadWeakRetained((id *)&v30->_picker);
  uint64_t v17 = [v16 numberOfRowsInComponent:v30->_component];

  uint64_t v25 = v17;
  if (v15 < 0 || v26 >= v25) {
    return v28;
  }
  id v12 = objc_loadWeakRetained((id *)&v30->_picker);
  id v11 = (id)[v12 delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    id v10 = objc_loadWeakRetained((id *)&v30->_picker);
    id v9 = (id)[v10 delegate];
    id v8 = objc_loadWeakRetained((id *)&v30->_picker);
    id v24 = (id)objc_msgSend(v9, "pickerView:viewForRow:forComponent:reusingView:");

    if (-[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v30))
    {
      id v5 = objc_loadWeakRetained((id *)&v30->_picker);
      id v23 = (id)[v5 safeValueForKey:@"_mode"];

      id v6 = (id)[(id)objc_opt_class() safeValueForKey:@"datePickerMode"];
      uint64_t v7 = [v6 integerValue];

      uint64_t v22 = v7;
      if (v7 == 1 || v22 == 2)
      {
        id v21 = (id)[v23 safeValueForKey:@"todayTextColor"];
        [v24 _accessibilitySetRetainedValue:v21 forKey:@"SelectedColor"];
        objc_storeStrong(&v21, 0);
      }
      objc_storeStrong(&v23, 0);
    }
    uint64_t v2 = objc_msgSend(v24, "accessibilityTraits", &v24);
    v28 |= v2;
    objc_storeStrong(v4, 0);
  }
  return v28;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_axSpeechInputLabelForDateCalendarUnit:(uint64_t)a1
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  if (a1)
  {
    id v6 = 0;
    if (v7 == 4 || v7 == 8 || v7 == 16 || v7 == 32 || v7 == 64 || v7 == 128 || v7 == 536 || v7 == 0x10000)
    {
      id v2 = (id)accessibilityUIKitLocalizedString();
      id v3 = v6;
      id v6 = v2;
    }
    else
    {
      _AXAssert();
    }
    id v9 = v6;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    id v9 = 0;
  }
  id v4 = v9;

  return v4;
}

- (id)_axSpeechInputLabelForTimeIntervalCalendarUnit:(uint64_t)a1
{
  uint64_t v8 = a1;
  uint64_t v7 = a2;
  if (a1)
  {
    id v6 = 0;
    if (v7 == 32 || v7 == 64 || v7 == 128)
    {
      id v2 = (id)accessibilityUIKitLocalizedString();
      id v3 = v6;
      id v6 = v2;
    }
    else
    {
      _AXAssert();
    }
    id v9 = v6;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    id v9 = 0;
  }
  id v4 = v9;

  return v4;
}

- (id)accessibilityUserInputLabels
{
  uint64_t v47 = self;
  v46[1] = (id)a2;
  unint64_t component = self->_component;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  BOOL v41 = component < [WeakRetained numberOfComponents];

  if (v41)
  {
    v46[0] = 0;
    id v38 = objc_loadWeakRetained((id *)&v47->_picker);
    id v45 = (id)[v38 delegate];

    if (objc_opt_respondsToSelector())
    {
      id v37 = -[UIAccessibilityPickerComponent picker]((uint64_t)v47);
      id location = (id)objc_msgSend(v45, "pickerView:accessibilityAttributedUserInputLabelsForComponent:");

      if ([location count])
      {
        id v2 = (id)objc_msgSend(location, "ax_mappedArrayUsingBlock:", &__block_literal_global_10);
        id v3 = v46[0];
        v46[0] = v2;
      }
      objc_storeStrong(&location, 0);
    }
    if (!v46[0] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v35 = v45;
      id v36 = -[UIAccessibilityPickerComponent picker]((uint64_t)v47);
      id v4 = (id)objc_msgSend(v35, "pickerView:accessibilityUserInputLabelsForComponent:");
      id v5 = v46[0];
      v46[0] = v4;
    }
    if (![v46[0] count])
    {
      id v34 = [(UIAccessibilityPickerComponent *)v47 accessibilityLabel];
      id v6 = (id)MEMORY[0x2455E6530]();
      id v7 = v46[0];
      v46[0] = v6;
    }
    if (![v46[0] count])
    {
      v43.receiver = v47;
      v43.super_class = (Class)UIAccessibilityPickerComponent;
      id v8 = [(UIAccessibilityPickerComponent *)&v43 accessibilityUserInputLabels];
      id v9 = v46[0];
      v46[0] = v8;
    }
    if (![v46[0] count])
    {
      id v33 = objc_loadWeakRetained((id *)&v47->_picker);
      [v33 selectedRowInComponent:v47->_component];

      if (-[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v47))
      {
        uint64_t v42 = [(UIAccessibilityPickerComponent *)v47 _accessibilityDatePickerComponentType];
        id v31 = objc_loadWeakRetained((id *)&v47->_picker);
        id v30 = (id)[v31 safeValueForKey:@"_mode"];
        char v32 = [v30 safeBoolForKey:@"isTimeIntervalMode"];

        if (v32)
        {
          id v29 = -[UIAccessibilityPickerComponent _axSpeechInputLabelForTimeIntervalCalendarUnit:]((uint64_t)v47, v42);
          id v10 = (id)MEMORY[0x2455E6530]();
          id v11 = v46[0];
          v46[0] = v10;
        }
        else
        {
          id v28 = -[UIAccessibilityPickerComponent _axSpeechInputLabelForDateCalendarUnit:]((uint64_t)v47, v42);
          id v12 = (id)MEMORY[0x2455E6530]();
          id v13 = v46[0];
          v46[0] = v12;
        }
      }
      else
      {
        id v26 = objc_loadWeakRetained((id *)&v47->_picker);
        id v25 = (id)[v26 delegate];
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          id v24 = objc_loadWeakRetained((id *)&v47->_picker);
          id v23 = (id)[v24 delegate];
          id v22 = objc_loadWeakRetained((id *)&v47->_picker);
          id v21 = (id)objc_msgSend(v23, "pickerView:viewForRow:forComponent:reusingView:");
          id v14 = (id)[v21 accessibilityUserInputLabels];
          id v15 = v46[0];
          v46[0] = v14;
        }
      }
      if (![v46[0] count])
      {
        id v20 = [(UIAccessibilityPickerComponent *)v47 accessibilityValue];
        id v16 = (id)MEMORY[0x2455E6530]();
        id v17 = v46[0];
        v46[0] = v16;
      }
    }
    id v48 = v46[0];
    objc_storeStrong(&v45, 0);
    objc_storeStrong(v46, 0);
  }
  else
  {
    id v48 = MEMORY[0x263EFFA68];
  }
  char v18 = v48;

  return v18;
}

id __62__UIAccessibilityPickerComponent_accessibilityUserInputLabels__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = objc_alloc(MEMORY[0x263F21660]);
  id v4 = (id)[v2 initWithCFAttributedString:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_accessibilitySetNativeFocus
{
  id v5 = -[UIAccessibilityPickerComponent picker]((uint64_t)self);
  id v4 = (id)[v5 safeArrayForKey:@"_tables"];
  id v3 = (id)[v4 axSafeObjectAtIndex:-[UIAccessibilityPickerComponent component]((uint64_t)self)];
  char v6 = [v3 _accessibilitySetNativeFocus];

  return v6 & 1;
}

- (uint64_t)component
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

- (uint64_t)setComponent:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (id)setPicker:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 8, a2);
  }
  return result;
}

- (void).cxx_destruct
{
}

@end