@interface HUTriggerListSubheadlineCell
- (BOOL)respectLayoutMargins;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HFItem)item;
- (HUGridLayoutOptions)layoutOptions;
- (HUTriggerListSubheadlineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUTriggerListSubheadlineCellDelegate)delegate;
- (NSArray)constraints;
- (UITextView)descriptionView;
- (id)_descriptionTextAttributes;
- (void)prepareForReuse;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setRespectLayoutMargins:(BOOL)a3;
- (void)updateConstraints;
- (void)updateUIWithAnimation:(BOOL)a3;
- (void)updateUIWithDescription:(id)a3;
- (void)updateUIWithResults:(id)a3 animation:(BOOL)a4;
@end

@implementation HUTriggerListSubheadlineCell

- (HUTriggerListSubheadlineCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)HUTriggerListSubheadlineCell;
  v4 = [(HUTriggerListSubheadlineCell *)&v22 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HUTriggerListSubheadlineCell *)v4 setSelectionStyle:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUTriggerListSubheadlineCell *)v5 setBackgroundColor:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F42F58]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(HUTriggerListSubheadlineCell *)v5 setDescriptionView:v8];

    v9 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v10 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v10 setDelegate:v5];

    v11 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v11 setEditable:0];

    v12 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v12 _setInteractiveTextSelectionDisabled:1];

    v13 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v13 setScrollEnabled:0];

    v14 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    v15 = [v14 textContainer];
    [v15 setLineFragmentPadding:0.0];

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    v17 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v17 setBackgroundColor:v16];

    v18 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v18 setClipsToBounds:0];

    v19 = [(HUTriggerListSubheadlineCell *)v5 contentView];
    v20 = [(HUTriggerListSubheadlineCell *)v5 descriptionView];
    [v19 addSubview:v20];

    v5->_respectLayoutMargins = 1;
    [(HUTriggerListSubheadlineCell *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)setLayoutOptions:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_layoutOptions] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    [(HUTriggerListSubheadlineCell *)self setNeedsUpdateConstraints];
  }
}

- (void)prepareForReuse
{
  [(HUTriggerListSubheadlineCell *)self setRespectLayoutMargins:1];
  v3.receiver = self;
  v3.super_class = (Class)HUTriggerListSubheadlineCell;
  [(HUTriggerListSubheadlineCell *)&v3 prepareForReuse];
}

- (void)setRespectLayoutMargins:(BOOL)a3
{
  if (self->_respectLayoutMargins != a3)
  {
    self->_respectLayoutMargins = a3;
    [(HUTriggerListSubheadlineCell *)self setNeedsUpdateConstraints];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUTriggerListSubheadlineCell *)self item];
  id v6 = [v5 latestResults];

  [(HUTriggerListSubheadlineCell *)self updateUIWithResults:v6 animation:v3];
}

- (void)updateUIWithResults:(id)a3 animation:(BOOL)a4
{
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F68980], a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HUTriggerListSubheadlineCell *)self updateUIWithDescription:v5];
}

- (void)updateUIWithDescription:(id)a3
{
  id v11 = a3;
  v4 = [(HUTriggerListSubheadlineCell *)self descriptionView];
  [v4 setHidden:v11 == 0];

  if (v11)
  {
    id v5 = [(HUTriggerListSubheadlineCell *)self _descriptionTextAttributes];
    if ([v11 prefersDynamicString])
    {
      id v6 = [(HUTriggerListSubheadlineCell *)self descriptionView];
      [v6 bounds];
      v9 = objc_msgSend(v11, "dynamicStringForSize:attributes:", v5, v7, v8);
    }
    else
    {
      v9 = [v11 stringWithAttributes:v5];
    }
    v10 = [(HUTriggerListSubheadlineCell *)self descriptionView];
    [v10 setAttributedText:v9];
  }
  [(HUTriggerListSubheadlineCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v40[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HUTriggerListSubheadlineCell *)self layoutOptions];
  uint64_t v5 = [v4 viewSizeSubclass];

  v39[0] = &unk_1F19B48E0;
  v39[1] = &unk_1F19B48F8;
  v40[0] = &unk_1F19B6260;
  v40[1] = &unk_1F19B6270;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  double v7 = HUConstantFloatForViewSizeSubclass(v5, (void *)v6);

  LOBYTE(v6) = [(HUTriggerListSubheadlineCell *)self respectLayoutMargins];
  double v8 = [(HUTriggerListSubheadlineCell *)self contentView];
  v9 = v8;
  if (v6)
  {
    v10 = [v8 layoutMarginsGuide];
    id v11 = [v10 leadingAnchor];
  }
  else
  {
    id v11 = [v8 leadingAnchor];
  }

  BOOL v12 = [(HUTriggerListSubheadlineCell *)self respectLayoutMargins];
  v13 = [(HUTriggerListSubheadlineCell *)self contentView];
  v14 = v13;
  if (v12)
  {
    v15 = [v13 layoutMarginsGuide];
    v16 = [v15 trailingAnchor];
  }
  else
  {
    v16 = [v13 trailingAnchor];
  }

  v17 = [(HUTriggerListSubheadlineCell *)self descriptionView];
  v18 = [v17 topAnchor];
  v19 = [(HUTriggerListSubheadlineCell *)self contentView];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  objc_super v22 = [(HUTriggerListSubheadlineCell *)self descriptionView];
  v23 = [v22 leadingAnchor];
  v24 = [v23 constraintEqualToAnchor:v11];
  [v3 addObject:v24];

  v25 = [(HUTriggerListSubheadlineCell *)self descriptionView];
  v26 = [v25 trailingAnchor];
  v27 = [v26 constraintEqualToAnchor:v16];
  [v3 addObject:v27];

  v28 = [(HUTriggerListSubheadlineCell *)self descriptionView];
  uint64_t v29 = [v28 lastBaselineAnchor];
  v30 = [(HUTriggerListSubheadlineCell *)self contentView];
  v31 = [v30 bottomAnchor];
  v32 = [(id)v29 constraintEqualToAnchor:v31 constant:-v7];
  [v3 addObject:v32];

  v33 = [(HUTriggerListSubheadlineCell *)self constraints];
  LOBYTE(v29) = [v3 isEqualToArray:v33];

  if ((v29 & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v35 = [(HUTriggerListSubheadlineCell *)self constraints];
    [v34 deactivateConstraints:v35];

    [(HUTriggerListSubheadlineCell *)self setConstraints:v3];
    v36 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [(HUTriggerListSubheadlineCell *)self constraints];
    [v36 activateConstraints:v37];
  }
  v38.receiver = self;
  v38.super_class = (Class)HUTriggerListSubheadlineCell;
  [(HUTriggerListSubheadlineCell *)&v38 updateConstraints];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  if (!a6)
  {
    v10 = [(HUTriggerListSubheadlineCell *)self delegate];
    [v10 learnMoreLinkTapped:self];
  }
  return 0;
}

- (id)_descriptionTextAttributes
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v2 = [(HUTriggerListSubheadlineCell *)self layoutOptions];
  uint64_t v3 = [v2 viewSizeSubclass];

  v4 = [MEMORY[0x1E4F42678] defaultParagraphStyle];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 setAlignment:4];
  uint64_t v6 = (id *)MEMORY[0x1E4F43878];
  if (v3) {
    uint64_t v6 = (id *)MEMORY[0x1E4F43870];
  }
  double v7 = (void *)MEMORY[0x1E4F42A30];
  double v8 = *MEMORY[0x1E4F43930];
  id v9 = *v6;
  v10 = [v7 _preferredFontForTextStyle:v9 weight:v8];
  v16[0] = *MEMORY[0x1E4F42510];
  id v11 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v12 = *MEMORY[0x1E4F42540];
  v17[0] = v11;
  v17[1] = v5;
  uint64_t v13 = *MEMORY[0x1E4F42508];
  v16[1] = v12;
  v16[2] = v13;
  v17[2] = v10;
  __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v14;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UITextView)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
}

- (HUTriggerListSubheadlineCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerListSubheadlineCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)respectLayoutMargins
{
  return self->_respectLayoutMargins;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_descriptionView, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end