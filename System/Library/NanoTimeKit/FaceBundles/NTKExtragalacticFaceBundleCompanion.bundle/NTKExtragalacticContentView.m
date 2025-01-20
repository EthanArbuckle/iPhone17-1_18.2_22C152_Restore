@interface NTKExtragalacticContentView
- (BOOL)isFrozen;
- (NTKExtragalacticColorPalette)palette;
- (NTKExtragalacticContentView)initWithFrame:(CGRect)a3 device:(id)a4 palette:(id)a5;
- (double)backgroundAlpha;
- (id)_digitNumbersFromFormatter:(id)a3;
- (void)_applyPalette;
- (void)_setupTimeFormatter;
- (void)_setupViews;
- (void)_updateTimeDigits;
- (void)setBackgroundAlpha:(double)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation NTKExtragalacticContentView

- (NTKExtragalacticContentView)initWithFrame:(CGRect)a3 device:(id)a4 palette:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NTKExtragalacticContentView;
  v14 = -[NTKExtragalacticContentView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_device, a4);
    v15->_backgroundAlpha = 1.0;
    v16 = [MEMORY[0x263F1C550] blackColor];
    [(NTKExtragalacticContentView *)v15 setBackgroundColor:v16];

    [(NTKExtragalacticContentView *)v15 _setupTimeFormatter];
    [(NTKExtragalacticContentView *)v15 _setupViews];
    objc_storeStrong((id *)&v15->_palette, a5);
    [(NTKExtragalacticContentView *)v15 _applyPalette];
  }

  return v15;
}

- (void)_setupViews
{
  v3 = [NTKExtragalacticBackgroundView alloc];
  [(NTKExtragalacticContentView *)self bounds];
  v4 = -[NTKExtragalacticBackgroundView initWithFrame:](v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(NTKExtragalacticContentView *)self addSubview:self->_backgroundView];
  v6 = [NTKExtragalacticDigitsView alloc];
  [(NTKExtragalacticContentView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  device = self->_device;
  v16 = [(NTKExtragalacticContentView *)self _digitNumbersFromFormatter:self->_timeFormatter];
  v17 = -[NTKExtragalacticDigitsView initWithFrame:device:digitNumbers:](v6, "initWithFrame:device:digitNumbers:", device, v16, v8, v10, v12, v14);
  digitsView = self->_digitsView;
  self->_digitsView = v17;

  v19 = self->_digitsView;

  [(NTKExtragalacticContentView *)self addSubview:v19];
}

- (void)setBackgroundAlpha:(double)a3
{
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);

  [(NTKExtragalacticContentView *)self _applyPalette];
}

- (void)_applyPalette
{
  v3 = +[NTKExtragalacticColors lutFilterFromPalette:self->_palette];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_246AFA0F8;
  v8[3] = &unk_2651F59D0;
  id v9 = v3;
  id v4 = v3;
  v5 = (void (**)(void, void))MEMORY[0x24C5415B0](v8);
  v6 = [(NTKExtragalacticBackgroundView *)self->_backgroundView layer];
  ((void (**)(void, void *))v5)[2](v5, v6);

  double v7 = [(NTKExtragalacticDigitsView *)self->_digitsView layer];
  ((void (**)(void, void *))v5)[2](v5, v7);
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
}

- (void)_setupTimeFormatter
{
  v3 = (CLKTimeFormatter *)[objc_alloc(MEMORY[0x263EFD220]) initWithForcesLatinNumbers:1];
  timeFormatter = self->_timeFormatter;
  self->_timeFormatter = v3;

  [(CLKTimeFormatter *)self->_timeFormatter setIncludeSeparatorInTimeSubstringFromSeparatorText:0];
  [(NTKExtragalacticContentView *)self _updateTimeDigits];
  v5 = self->_timeFormatter;

  MEMORY[0x270F9A6D0](v5, sel_addObserver_);
}

- (void)_updateTimeDigits
{
  digitsView = self->_digitsView;
  id v3 = [(NTKExtragalacticContentView *)self _digitNumbersFromFormatter:self->_timeFormatter];
  [(NTKExtragalacticDigitsView *)digitsView setDigitNumbers:v3];
}

- (id)_digitNumbersFromFormatter:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 timeSubstringToSeparatorText];
  v5 = [v3 timeSubstringFromSeparatorText];

  if ([v4 length] == 1)
  {
    int v6 = [v4 intValue];
    uint64_t v7 = 0;
  }
  else
  {
    double v8 = objc_msgSend(v4, "substringWithRange:", 0, 1);
    uint64_t v7 = (int)[v8 intValue];

    id v9 = objc_msgSend(v4, "substringWithRange:", 1, 1);
    int v6 = [v9 intValue];
  }
  double v10 = objc_msgSend(v5, "substringWithRange:", 0, 1);
  uint64_t v11 = (int)[v10 intValue];

  double v12 = objc_msgSend(v5, "substringWithRange:", 1, 1);
  uint64_t v13 = (int)[v12 intValue];

  v20[0] = &unk_26FB0C1C0;
  double v14 = [NSNumber numberWithUnsignedInteger:v7];
  v21[0] = v14;
  v20[1] = &unk_26FB0C1D8;
  v15 = [NSNumber numberWithUnsignedInteger:v6];
  v21[1] = v15;
  v20[2] = &unk_26FB0C1F0;
  v16 = [NSNumber numberWithUnsignedInteger:v11];
  v21[2] = v16;
  v20[3] = &unk_26FB0C208;
  v17 = [NSNumber numberWithUnsignedInteger:v13];
  v21[3] = v17;
  objc_super v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v18;
}

- (BOOL)isFrozen
{
  return self->frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->frozen = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (NTKExtragalacticColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_digitsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end