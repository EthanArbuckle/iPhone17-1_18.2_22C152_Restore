@interface PasscodeContentViewBackground
- (void)_removePreviousBackgroundFromView:(id)a3;
- (void)applyBackgroundForStyle:(id)a3 toView:(id)a4;
@end

@implementation PasscodeContentViewBackground

- (void)applyBackgroundForStyle:(id)a3 toView:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  [(PasscodeContentViewBackground *)self _removePreviousBackgroundFromView:v6];
  if ([v18 backgroundStyle] == (id)1)
  {
    uint64_t v7 = 2020;
  }
  else
  {
    v8 = +[Passcode currentPasscode];
    if ([v8 isComplex]) {
      uint64_t v7 = 2029;
    }
    else {
      uint64_t v7 = 2020;
    }
  }
  id v9 = [v18 rawValue];
  if (v9 == (id)1) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 2030;
  }
  switch((unint64_t)[v18 backgroundStyle])
  {
    case 0uLL:
      v11 = +[_UIBackdropViewSettings settingsForPrivateStyle:v10];
      v12 = [v11 combinedTintColor];
      v13 = v12;
      double v14 = 1.0;
      goto LABEL_13;
    case 1uLL:
      v11 = +[_UIBackdropViewSettings settingsForPrivateStyle:v10 graphicsQuality:100];
      [v11 setStackingLevel:_UIBackdropViewSettingsStackingLevelHigh];
      if (v9 == (id)1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 2;
      }
      [v11 setRenderingHint:v16];
      v13 = [[PasscodeBackdropView alloc] initWithSettings:v11];
      [(PasscodeBackdropView *)v13 setAutoresizingMask:18];
      [(PasscodeBackdropView *)v13 setConfiguration:1];
      [(PasscodeBackdropView *)v13 setAlpha:1.0];
      [v6 addSubview:v13];
      [v6 sendSubviewToBack:v13];
      uint64_t v15 = +[UIColor clearColor];
      goto LABEL_20;
    case 2uLL:
      v11 = +[_UIBackdropViewSettings settingsForPrivateStyle:v10];
      v12 = [v11 combinedTintColor];
      v13 = v12;
      double v14 = 0.75;
LABEL_13:
      uint64_t v15 = [(PasscodeBackdropView *)v12 colorWithAlphaComponent:v14];
LABEL_20:
      v17 = (void *)v15;
      [v6 setBackgroundColor:v15];

      goto LABEL_23;
    case 3uLL:
      if (v9 == (id)1) {
        +[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
      }
      else {
      v11 = +[UIColor darkGrayColor];
      }
      [v6 setBackgroundColor:v11];
LABEL_23:

      break;
    default:
      break;
  }
}

- (void)_removePreviousBackgroundFromView:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [a3 subviews];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v7 isMemberOfClass:objc_opt_class()])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v4 removeFromSuperview];
}

@end