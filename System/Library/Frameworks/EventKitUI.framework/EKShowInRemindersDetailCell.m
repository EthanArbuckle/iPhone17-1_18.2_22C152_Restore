@interface EKShowInRemindersDetailCell
- (EKShowInRemindersDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation EKShowInRemindersDetailCell

- (EKShowInRemindersDetailCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)EKShowInRemindersDetailCell;
  id v37 = a3;
  v4 = -[EKEventDetailCell initWithEvent:editable:](&v42, sel_initWithEvent_editable_);
  if (v4)
  {
    v38 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v5 = EventKitUIBundle();
    v36 = [v5 localizedStringForKey:@"Show in Reminders" value:&stru_1F0CC2140 table:0];

    v35 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v44 = *MEMORY[0x1E4FB06F8];
    v45[0] = v35;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    v8 = (void *)[v6 initWithString:v36 attributes:v7];
    [v38 setAttributedTitle:v8];

    objc_msgSend(v38, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    objc_initWeak(&location, v4);
    v9 = (void *)MEMORY[0x1E4FB13F0];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke;
    v39[3] = &unk_1E6088B78;
    objc_copyWeak(&v40, &location);
    v23 = [v9 actionWithHandler:v39];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v38);
    button = v4->_button;
    v4->_button = (UIButton *)v10;

    [(UIButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(EKShowInRemindersDetailCell *)v4 contentView];
    [v12 addSubview:v4->_button];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UIButton *)v4->_button leadingAnchor];
    v34 = [(EKShowInRemindersDetailCell *)v4 contentView];
    v33 = [v34 layoutMarginsGuide];
    v31 = [v33 leadingAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:6.0];
    v43[0] = v30;
    v27 = [(UIButton *)v4->_button trailingAnchor];
    v29 = [(EKShowInRemindersDetailCell *)v4 contentView];
    v28 = [v29 layoutMarginsGuide];
    v26 = [v28 trailingAnchor];
    v25 = [v27 constraintLessThanOrEqualToAnchor:v26 constant:-6.0];
    v43[1] = v25;
    v13 = [(UIButton *)v4->_button topAnchor];
    v14 = [(EKShowInRemindersDetailCell *)v4 contentView];
    v15 = [v14 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v15 constant:15.0];
    v43[2] = v16;
    v17 = [(UIButton *)v4->_button bottomAnchor];
    v18 = [(EKShowInRemindersDetailCell *)v4 contentView];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintGreaterThanOrEqualToAnchor:v19 constant:-5.0];
    v43[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
    [v24 activateConstraints:v21];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 135);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E4F1CB10];
      v8 = v2;
      v5 = [v3 uniqueID];
      id v6 = [v4 URLWithString:v5];

      v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v7 openURL:v6 configuration:0 completionHandler:&__block_literal_global_50];

      v2 = v8;
    }
  }
}

void __54__EKShowInRemindersDetailCell_initWithEvent_editable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when Open in Reminders tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKShowInRemindersDetailCell;
  [(EKShowInRemindersDetailCell *)&v3 setSeparatorStyle:0];
}

- (void).cxx_destruct
{
}

@end