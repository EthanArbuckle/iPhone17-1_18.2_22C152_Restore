@interface AIAudiogramKeyboardToolbarForSensitivityPoint
- (AIAudiogramKeyboardToolbarForSensitivityPoint)initWithFrame:(CGRect)a3 target:(id)a4;
@end

@implementation AIAudiogramKeyboardToolbarForSensitivityPoint

- (AIAudiogramKeyboardToolbarForSensitivityPoint)initWithFrame:(CGRect)a3 target:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20[4] = *MEMORY[0x263EF8340];
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AIAudiogramKeyboardToolbarForSensitivityPoint;
  v10 = -[AIAudiogramKeyboardToolbarForSensitivityPoint initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MEMORY[0x263F824A8] fixedSpaceItemOfWidth:10.0];
    v12 = [MEMORY[0x263F824A8] flexibleSpaceItem];
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_keyboardDoneTapped];
    id v14 = objc_alloc(MEMORY[0x263F824A8]);
    v15 = [MEMORY[0x263F827E8] systemImageNamed:@"plus.slash.minus"];
    v16 = (void *)[v14 initWithImage:v15 style:0 target:v9 action:sel_keyboardNegationTapped];

    v20[0] = v11;
    v20[1] = v16;
    v20[2] = v12;
    v20[3] = v13;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
    [(AIAudiogramKeyboardToolbarForSensitivityPoint *)v10 setItems:v17];
  }
  return v10;
}

@end