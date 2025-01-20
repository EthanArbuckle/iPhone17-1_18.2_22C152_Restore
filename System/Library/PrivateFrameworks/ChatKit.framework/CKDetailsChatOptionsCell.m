@interface CKDetailsChatOptionsCell
+ (BOOL)shouldHighlight;
+ (double)estimatedHeight;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
- (CKDetailsChatOptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UISwitch)controlSwitch;
- (void)_configureNewControlSwitch;
- (void)prepareForReuse;
- (void)setControlSwitch:(id)a3;
@end

@implementation CKDetailsChatOptionsCell

- (CKDetailsChatOptionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)CKDetailsChatOptionsCell;
  v4 = [(CKDetailsCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[CKUIBehavior sharedBehaviors];
    v6 = [v5 theme];
    v7 = [v6 detailsCellStaticTextColor];
    v8 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    [v8 setTextColor:v7];

    v9 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    [v9 setNumberOfLines:0];

    v10 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    [v10 setLineBreakMode:0];

    [(CKDetailsChatOptionsCell *)v4 _configureNewControlSwitch];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    v28 = [v29 leadingAnchor];
    v27 = [(CKDetailsChatOptionsCell *)v4 leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    v24 = [v25 trailingAnchor];
    v23 = [(CKDetailsChatOptionsCell *)v4 trailingAnchor];
    v21 = [v24 constraintEqualToAnchor:v23];
    v31[1] = v21;
    v11 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    v12 = [v11 topAnchor];
    v13 = [(CKDetailsChatOptionsCell *)v4 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v31[2] = v14;
    v15 = [(CKDetailsChatOptionsCell *)v4 textLabel];
    v16 = [v15 bottomAnchor];
    v17 = [(CKDetailsChatOptionsCell *)v4 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v31[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v22 activateConstraints:v19];
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsChatOptionsCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (UISwitch)controlSwitch
{
  controlSwitch = self->_controlSwitch;
  if (!controlSwitch)
  {
    [(CKDetailsChatOptionsCell *)self _configureNewControlSwitch];
    controlSwitch = self->_controlSwitch;
  }

  return controlSwitch;
}

- (void)_configureNewControlSwitch
{
  controlSwitch = self->_controlSwitch;
  if (controlSwitch)
  {
    [(UISwitch *)controlSwitch removeFromSuperview];
    [(UISwitch *)self->_controlSwitch removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  }
  id v4 = objc_alloc(MEMORY[0x1E4F42E78]);
  v5 = (UISwitch *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = self->_controlSwitch;
  self->_controlSwitch = v5;

  id v7 = [(CKDetailsChatOptionsCell *)self controlSwitch];
  [(CKDetailsChatOptionsCell *)self setAccessoryView:v7];
}

+ (double)preferredHeight
{
  return *MEMORY[0x1E4F43D18];
}

+ (double)estimatedHeight
{
  return 44.0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKDetailsChatOptionsCell;
  [(CKDetailsCell *)&v3 prepareForReuse];
  [(CKDetailsChatOptionsCell *)self _configureNewControlSwitch];
}

- (void)setControlSwitch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end