@interface WFTakePhotoNotificationView
- (WFTakePhotoNotificationView)initWithFrame:(CGRect)a3 shortcutAttribution:(id)a4;
@end

@implementation WFTakePhotoNotificationView

- (WFTakePhotoNotificationView)initWithFrame:(CGRect)a3 shortcutAttribution:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v37[4] = *MEMORY[0x263EF8340];
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WFTakePhotoNotificationView;
  v10 = -[WFTakePhotoNotificationView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v35 = v9;
    if (v9)
    {
      v12 = NSString;
      v13 = WFLocalizedString(@"“%@” is taking a photo...");
      v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v9);
      [v11 setText:v14];
    }
    else
    {
      v13 = WFLocalizedString(@"A shortcut is taking a photo...");
      [v11 setText:v13];
    }

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setAdjustsFontForContentSizeCategory:1];
    [v11 setNumberOfLines:0];
    [(WFTakePhotoNotificationView *)v10 addSubview:v11];
    uint64_t v15 = *MEMORY[0x263F83570];
    v34 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    v16 = [MEMORY[0x263F81708] fontWithDescriptor:v34 size:0.0];
    [v11 setFont:v16];

    v17 = [MEMORY[0x263F81708] _preferredFontForTextStyle:v15 weight:*MEMORY[0x263F81828]];
    [v11 setFont:v17];

    v28 = (void *)MEMORY[0x263F08938];
    v33 = [v11 leadingAnchor];
    v32 = [(WFTakePhotoNotificationView *)v10 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:18.0];
    v37[0] = v31;
    v30 = [v11 trailingAnchor];
    v29 = [(WFTakePhotoNotificationView *)v10 trailingAnchor];
    v18 = [v30 constraintEqualToAnchor:v29 constant:-18.0];
    v37[1] = v18;
    v19 = [v11 topAnchor];
    v20 = [(WFTakePhotoNotificationView *)v10 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:21.0];
    v37[2] = v21;
    v22 = [v11 bottomAnchor];
    v23 = [(WFTakePhotoNotificationView *)v10 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-21.0];
    v37[3] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [v28 activateConstraints:v25];

    v26 = v10;
    id v9 = v35;
  }

  return v10;
}

@end