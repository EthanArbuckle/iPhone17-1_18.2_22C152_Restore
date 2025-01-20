@interface FIUIAppDisabledViewController
- (FIUIAppDisabledViewController)initWithAppName:(id)a3 disabledReason:(unint64_t)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation FIUIAppDisabledViewController

- (FIUIAppDisabledViewController)initWithAppName:(id)a3 disabledReason:(unint64_t)a4
{
  v38[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)FIUIAppDisabledViewController;
  v7 = [(FIUIAppDisabledViewController *)&v36 init];
  v8 = v7;
  if (v7)
  {
    [(FIUIAppDisabledViewController *)v7 setTitle:v6];
    if (a4 == 1)
    {
      v9 = FIUIBundle();
      v10 = v9;
      v11 = @"HEART_RATE_DISABLED_TITLE";
    }
    else
    {
      if (a4)
      {
        v12 = 0;
LABEL_8:
        int active = FIIsActivePairedDeviceSatellitePaired();
        id v35 = v6;
        if (a4 == 1)
        {
          v15 = FIUIBundle();
          v16 = v15;
          v17 = @"HEART_RATE_DISABLED_BODY";
          v18 = @"Localizable";
        }
        else
        {
          if (a4)
          {
            v19 = 0;
LABEL_16:
            v34 = [NSString stringWithFormat:@"%@\n%@", v12, v19];
            id v20 = objc_alloc_init(MEMORY[0x263F81650]);
            [v20 setAlignment:1];
            LODWORD(v21) = 1057803469;
            [v20 setHyphenationFactor:v21];
            v37[0] = *MEMORY[0x263F81500];
            uint64_t v22 = v37[0];
            v23 = [MEMORY[0x263F23950] systemGrayTextColor];
            v38[0] = v23;
            v37[1] = *MEMORY[0x263F814F0];
            v24 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
            v37[2] = *MEMORY[0x263F81540];
            v38[1] = v24;
            v38[2] = v20;
            v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

            v26 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v34 attributes:v25];
            v27 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v25];
            v28 = [MEMORY[0x263F825C8] whiteColor];
            [v27 setObject:v28 forKey:v22];

            objc_msgSend(v26, "setAttributes:range:", v27, 0, objc_msgSend(v12, "length"));
            v29 = [FIUITextView alloc];
            uint64_t v30 = -[FIUITextView initWithFrame:](v29, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
            textView = v8->_textView;
            v8->_textView = (FIUITextView *)v30;

            [(FIUITextView *)v8->_textView setEditable:0];
            [(FIUITextView *)v8->_textView setSelectable:0];
            v32 = [MEMORY[0x263F825C8] blackColor];
            [(FIUITextView *)v8->_textView setBackgroundColor:v32];

            [(FIUITextView *)v8->_textView setAttributedText:v26];
            id v6 = v35;
            goto LABEL_17;
          }
          int v14 = active;
          v15 = FIUIBundle();
          v16 = v15;
          if (v14)
          {
            v17 = @"FITNESS_TRACKING_DISABLED_BODY_TINKER";
            v18 = @"Localizable-tinker";
          }
          else
          {
            v17 = @"FITNESS_TRACKING_DISABLED_BODY";
            v18 = @"Localizable";
          }
        }
        v19 = [v15 localizedStringForKey:v17 value:&stru_26CF5F1B8 table:v18];

        goto LABEL_16;
      }
      v9 = FIUIBundle();
      v10 = v9;
      v11 = @"FITNESS_TRACKING_DISABLED_TITLE";
    }
    v12 = [v9 localizedStringForKey:v11 value:&stru_26CF5F1B8 table:@"Localizable"];

    goto LABEL_8;
  }
LABEL_17:

  return v8;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)FIUIAppDisabledViewController;
  [(FIUIAppDisabledViewController *)&v4 viewDidLoad];
  v3 = [(FIUIAppDisabledViewController *)self view];
  [v3 addSubview:self->_textView];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)FIUIAppDisabledViewController;
  [(FIUIAppDisabledViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(FIUIAppDisabledViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  v8 = [(FIUIAppDisabledViewController *)self view];
  v9 = [v8 window];
  v10 = [v9 windowScene];
  v11 = [v10 statusBarManager];
  [v11 statusBarFrame];
  double v13 = v12;

  -[FIUITextView setFrame:](self->_textView, "setFrame:", 0.0, v13, v5, v7 - v13);
  [(FIUITextView *)self->_textView centerTextVerticallyWithTopOffset:v13 * 0.5];
}

- (void).cxx_destruct
{
}

@end