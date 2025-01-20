@interface CKMessageEntryViewSnapshot
- (CKMessageEntryViewSnapshot)initWithFrame:(CGRect)a3 entryView:(id)a4;
- (UIButton)browserButton;
- (void)setBrowserButton:(id)a3;
@end

@implementation CKMessageEntryViewSnapshot

- (CKMessageEntryViewSnapshot)initWithFrame:(CGRect)a3 entryView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CKMessageEntryViewSnapshot;
  v10 = -[CKMessageEntryViewSnapshot initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(CKMessageEntryViewSnapshot *)v10 setBackgroundColor:0];
    [(CKMessageEntryViewSnapshot *)v11 setClipsToBounds:1];
    v12 = [v9 snapshotForCompactBrowserAnimation];
    [v12 setAutoresizingMask:18];
    [(CKMessageEntryViewSnapshot *)v11 bounds];
    objc_msgSend(v12, "setFrame:");
    [(CKMessageEntryViewSnapshot *)v11 addSubview:v12];
    v13 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [v13 setOpaque:0];
    v14 = (void *)MEMORY[0x1E4F42A80];
    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 entryViewAppButtonName];
    v17 = [v14 _systemImageNamed:v16];
    v18 = [v17 imageWithRenderingMode:2];

    int v19 = CKIsRunningInMacCatalyst();
    double v20 = 32.0;
    if (v19) {
      double v20 = 16.0;
    }
    v21 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:v20];
    v22 = [v18 imageWithSymbolConfiguration:v21];

    v23 = [v13 imageView];
    [v23 setContentMode:1];

    [v13 setImage:v22 forState:0];
    double v24 = *MEMORY[0x1E4F1DAD8];
    double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v22 size];
    objc_msgSend(v13, "setBounds:", v24, v25, v26, v27);
    [v9 browserButtonFrame];
    objc_msgSend(v13, "setFrame:");
    v28 = CKFrameworkBundle();
    v29 = [v28 localizedStringForKey:@"SUMMARY_SNAPSHOT_APPS_ACCESSIBILITY_LABEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v13 setAccessibilityLabel:v29];

    [(CKMessageEntryViewSnapshot *)v11 setBrowserButton:v13];
    [(CKMessageEntryViewSnapshot *)v11 addSubview:v13];
  }
  return v11;
}

- (UIButton)browserButton
{
  return self->_browserButton;
}

- (void)setBrowserButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end