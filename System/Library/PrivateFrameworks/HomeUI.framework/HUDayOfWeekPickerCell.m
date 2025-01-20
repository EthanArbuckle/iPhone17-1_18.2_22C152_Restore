@interface HUDayOfWeekPickerCell
- (HFItem)item;
- (HUDayOfWeekPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUDayOfWeekPickerCellDelegate)delegate;
- (NSArray)buttons;
- (NSSet)selectedRecurrences;
- (UIStackView)buttonStackView;
- (void)_setupConstraints;
- (void)_toggleWeekdayButton:(id)a3;
- (void)_updateSelectedDays;
- (void)setButtonStackView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setSelectedRecurrences:(id)a3;
- (void)tintColorDidChange;
@end

@implementation HUDayOfWeekPickerCell

- (HUDayOfWeekPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)HUDayOfWeekPickerCell;
  v4 = [(HUDayOfWeekPickerCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F42E20]);
    [(HUDayOfWeekPickerCell *)v4 setButtonStackView:v5];

    v6 = [(HUDayOfWeekPickerCell *)v4 buttonStackView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    v7 = [(HUDayOfWeekPickerCell *)v4 buttonStackView];
    [v7 setSpacing:14.0];

    v8 = [(HUDayOfWeekPickerCell *)v4 buttonStackView];
    [v8 setDistribution:1];

    v9 = [(HUDayOfWeekPickerCell *)v4 contentView];
    v10 = [(HUDayOfWeekPickerCell *)v4 buttonStackView];
    [v9 addSubview:v10];

    v11 = objc_opt_new();
    v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v13 = [v12 veryShortWeekdaySymbols];

    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v15 = [v14 firstWeekday];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__HUDayOfWeekPickerCell_initWithStyle_reuseIdentifier___block_invoke;
    v19[3] = &unk_1E6384D80;
    v16 = v4;
    id v21 = v11;
    uint64_t v22 = v15;
    v20 = v16;
    id v17 = v11;
    [v13 enumerateObjectsUsingBlock:v19];
    [(HUDayOfWeekPickerCell *)v16 setButtons:v17];
    [(HUDayOfWeekPickerCell *)v16 _setupConstraints];
    [(HUDayOfWeekPickerCell *)v16 _updateSelectedDays];
  }
  return v4;
}

void __55__HUDayOfWeekPickerCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v11 = +[HUDayOfWeekButton buttonWithType:0];
  v6 = [v5 lowercaseString];

  [v11 setDayOfWeek:v6];
  v7 = [*(id *)(a1 + 32) tintColor];
  [v11 setTintColor:v7];

  v8 = [v11 imageView];
  [v8 setContentMode:1];

  [v11 setTag:a3 + 1];
  [v11 addTarget:*(void *)(a1 + 32) action:sel__toggleWeekdayButton_ forControlEvents:64];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([v11 tag] >= *(void *)(a1 + 48))
  {
    uint64_t v10 = [v11 tag] - *(void *)(a1 + 48);
    [*(id *)(a1 + 40) insertObject:v11 atIndex:v10];
    v9 = [*(id *)(a1 + 32) buttonStackView];
    [v9 insertArrangedSubview:v11 atIndex:v10];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v11];
    v9 = [*(id *)(a1 + 32) buttonStackView];
    [v9 addArrangedSubview:v11];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HUDayOfWeekPickerCell;
  [(HUDayOfWeekPickerCell *)&v3 tintColorDidChange];
  [(HUDayOfWeekPickerCell *)self _updateSelectedDays];
}

- (void)setSelectedRecurrences:(id)a3
{
  v4 = (NSSet *)a3;
  if ([(NSSet *)v4 na_any:&__block_literal_global])
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 1;
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = [(HUDayOfWeekPickerCell *)self buttons];
    uint64_t v8 = [v7 count];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke_2;
    v12[3] = &unk_1E6384DC8;
    v12[4] = v13;
    v9 = objc_msgSend(v6, "na_arrayByRepeatingWithCount:generatorBlock:", v8, v12);
    uint64_t v10 = [v5 setWithArray:v9];

    _Block_object_dispose(v13, 8);
    v4 = (NSSet *)v10;
  }
  selectedRecurrences = self->_selectedRecurrences;
  self->_selectedRecurrences = v4;

  [(HUDayOfWeekPickerCell *)self _updateSelectedDays];
}

BOOL __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke(uint64_t a1, void *a2)
{
  return [a2 day] == 1;
}

id __48__HUDayOfWeekPickerCell_setSelectedRecurrences___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setWeekday:(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++];

  return v2;
}

- (void)_updateSelectedDays
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUDayOfWeekPickerCell *)self selectedRecurrences];
  v26 = objc_msgSend(v3, "na_map:", &__block_literal_global_27);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v22 = self;
  id obj = [(HUDayOfWeekPickerCell *)self buttons];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      uint64_t v23 = v5;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "tag"));
        objc_msgSend(v7, "setSelected:", objc_msgSend(v26, "containsObject:", v8));

        v9 = NSString;
        uint64_t v10 = [v7 dayOfWeek];
        id v11 = [v9 stringWithFormat:@"%@.circle", v10];

        v12 = NSString;
        v13 = [v7 dayOfWeek];
        v14 = [v12 stringWithFormat:@"%@.circle.fill", v13];

        uint64_t v15 = [MEMORY[0x1E4F42A98] configurationWithPointSize:36.0];
        v16 = (void *)MEMORY[0x1E4F42A80];
        if ([v7 isSelected]) {
          id v17 = v14;
        }
        else {
          id v17 = v11;
        }
        v18 = [v16 systemImageNamed:v17 withConfiguration:v15];
        if (v18)
        {
          [v7 setImage:v18 forState:0];
        }
        else
        {
          v19 = [v7 dayOfWeek];
          [v7 setTitle:v19 forState:0];

          v20 = [MEMORY[0x1E4F428B8] systemWhiteColor];
          [v7 setTitleColor:v20 forState:0];

          if ([v7 isSelected]) {
            [(HUDayOfWeekPickerCell *)v22 tintColor];
          }
          else {
          id v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
          }
          [v7 setBackgroundColor:v21];

          uint64_t v5 = v23;
        }

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }
}

id __44__HUDayOfWeekPickerCell__updateSelectedDays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 weekday] < 1)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "weekday"));
  }

  return v3;
}

- (void)_toggleWeekdayButton:(id)a3
{
  id v4 = a3;
  if ([v4 tag] <= 0)
  {
    NSLog(&cfstr_ButtonTagWasNo.isa, v4);
  }
  else
  {
    uint64_t v5 = [v4 tag];
    char v6 = [v4 isSelected];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setWeekday:v5];
    uint64_t v8 = [(HUDayOfWeekPickerCell *)self selectedRecurrences];
    v9 = (void *)[v8 mutableCopy];

    if (v6)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __46__HUDayOfWeekPickerCell__toggleWeekdayButton___block_invoke;
      v13[3] = &__block_descriptor_40_e26_B16__0__NSDateComponents_8l;
      void v13[4] = v5;
      uint64_t v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v13);
      if (!v10) {
        NSLog(&cfstr_AskedToDeselec.isa, v7, v9);
      }
      [v9 removeObject:v10];
    }
    else
    {
      [v9 addObject:v7];
    }
    [(HUDayOfWeekPickerCell *)self setSelectedRecurrences:v9];
    id v11 = [(HUDayOfWeekPickerCell *)self delegate];
    v12 = [(HUDayOfWeekPickerCell *)self selectedRecurrences];
    [v11 dayOfWeekPickerCell:self didChangeSelectedRecurrences:v12];
  }
}

BOOL __46__HUDayOfWeekPickerCell__toggleWeekdayButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 weekday] == *(void *)(a1 + 32);
}

- (void)_setupConstraints
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v40 = self;
  id v4 = [(HUDayOfWeekPickerCell *)self buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v10 = [v9 widthAnchor];
        id v11 = [v10 constraintEqualToConstant:48.0];

        LODWORD(v12) = 1144733696;
        [v11 setPriority:v12];
        [v3 addObject:v11];
        v13 = [v9 heightAnchor];
        v14 = [v9 widthAnchor];
        uint64_t v15 = [v13 constraintEqualToAnchor:v14];
        [v3 addObject:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v6);
  }

  v16 = [(HUDayOfWeekPickerCell *)v40 buttonStackView];
  id v17 = [v16 topAnchor];
  v18 = [(HUDayOfWeekPickerCell *)v40 contentView];
  v19 = [v18 layoutMarginsGuide];
  v20 = [v19 topAnchor];
  id v21 = [v17 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  uint64_t v22 = [(HUDayOfWeekPickerCell *)v40 buttonStackView];
  uint64_t v23 = [v22 bottomAnchor];
  v24 = [(HUDayOfWeekPickerCell *)v40 contentView];
  uint64_t v25 = [v24 layoutMarginsGuide];
  v26 = [v25 bottomAnchor];
  long long v27 = [v23 constraintEqualToAnchor:v26];
  [v3 addObject:v27];

  long long v28 = [(HUDayOfWeekPickerCell *)v40 buttonStackView];
  long long v29 = [v28 leadingAnchor];
  long long v30 = [(HUDayOfWeekPickerCell *)v40 contentView];
  v31 = [v30 layoutMarginsGuide];
  uint64_t v32 = [v31 leadingAnchor];
  v33 = [v29 constraintEqualToAnchor:v32];
  [v3 addObject:v33];

  v34 = [(HUDayOfWeekPickerCell *)v40 buttonStackView];
  v35 = [v34 trailingAnchor];
  v36 = [(HUDayOfWeekPickerCell *)v40 contentView];
  v37 = [v36 layoutMarginsGuide];
  v38 = [v37 trailingAnchor];
  v39 = [v35 constraintEqualToAnchor:v38];
  [v3 addObject:v39];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (HUDayOfWeekPickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUDayOfWeekPickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)selectedRecurrences
{
  return self->_selectedRecurrences;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_selectedRecurrences, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end