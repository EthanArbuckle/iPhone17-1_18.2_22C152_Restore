@interface AXAuditTheme
+ (id)sharedTheme;
- (double)borderWidthForHighlightStyle:(unint64_t)a3;
- (id)backgroundColorForHighlightStyle:(unint64_t)a3;
- (id)borderColorForHighlightStyle:(unint64_t)a3;
@end

@implementation AXAuditTheme

+ (id)sharedTheme
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__AXAuditTheme_sharedTheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTheme_onceToken != -1) {
    dispatch_once(&sharedTheme_onceToken, block);
  }
  v2 = (void *)sharedTheme_instance;

  return v2;
}

uint64_t __27__AXAuditTheme_sharedTheme__block_invoke()
{
  sharedTheme_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)backgroundColorForHighlightStyle:(unint64_t)a3
{
  v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.75];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.298039216;
      double v7 = 0.850980392;
      double v8 = 0.392156863;
      double v9 = 0.6;
      goto LABEL_6;
    case 4uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v7 = 0.682352941;
      double v9 = 0.7;
      double v6 = 1.0;
      double v8 = 0.0;
      goto LABEL_6;
    case 5uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.698039216;
      double v8 = 0.498039216;
      double v7 = 1.0;
      double v9 = 0.5;
      goto LABEL_6;
    case 6uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.0;
      double v7 = 0.0;
      double v8 = 0.0;
      double v9 = 0.0;
LABEL_6:
      uint64_t v10 = [v5 colorWithRed:v6 green:v7 blue:v8 alpha:v9];

      v4 = (void *)v10;
      break;
    default:
      break;
  }

  return v4;
}

- (id)borderColorForHighlightStyle:(unint64_t)a3
{
  v4 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.75];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v6 = 0.4;
      double v7 = 0.0;
      double v8 = 0.0;
      goto LABEL_5;
    case 5uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v7 = 0.0;
      double v8 = 0.0;
      double v6 = 0.0;
      goto LABEL_5;
    case 6uLL:
      v5 = (void *)MEMORY[0x263F1C550];
      double v7 = 0.298039216;
      double v6 = 0.4;
      double v8 = 0.298039216;
LABEL_5:
      uint64_t v9 = [v5 colorWithRed:v7 green:v8 blue:0.0 alpha:v6];

      v4 = (void *)v9;
      break;
    default:
      break;
  }

  return v4;
}

- (double)borderWidthForHighlightStyle:(unint64_t)a3
{
  double result = 1.0;
  if (a3 - 3 <= 3) {
    return dbl_24726BCC8[a3 - 3];
  }
  return result;
}

@end