@interface MediaControlsBluetoothListeningModeButton
- (MediaControlsBluetoothListeningModeButton)initWithFrame:(CGRect)a3;
- (NSSet)availableListeningModes;
- (NSString)selectedListeningMode;
- (UIColor)offColor;
- (id)initForControlCenter;
- (void)playRequiresBothBudsInEarErrorHaptic;
- (void)setAvailableListeningModes:(id)a3;
- (void)setOffColor:(id)a3;
- (void)setSelectedListeningMode:(id)a3;
- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4;
@end

@implementation MediaControlsBluetoothListeningModeButton

- (MediaControlsBluetoothListeningModeButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MediaControlsBluetoothListeningModeButton;
  v3 = -[MediaControlsExpandableButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[MRUStringsProvider listeningModeTitle];
    [(MediaControlsExpandableButton *)v3 setTitle:v4];

    uint64_t v5 = [MEMORY[0x1E4FB1618] systemGray3Color];
    offColor = v3->_offColor;
    v3->_offColor = (UIColor *)v5;

    -[MediaControlsExpandableButton setButtonImageSize:](v3, "setButtonImageSize:", 54.0, 54.0);
  }
  return v3;
}

- (id)initForControlCenter
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsBluetoothListeningModeButton;
  v2 = [(MediaControlsExpandableButton *)&v6 initForControlCenter];
  v3 = v2;
  if (v2)
  {
    v4 = (void *)v2[79];
    v2[79] = 0;
  }
  return v3;
}

- (void)setAvailableListeningModes:(id)a3
{
  id v29 = a3;
  if (!-[NSSet isEqualToSet:](self->_availableListeningModes, "isEqualToSet:"))
  {
    objc_storeStrong((id *)&self->_availableListeningModes, a3);
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v29, "count"));
    uint64_t v6 = *MEMORY[0x1E4F15F48];
    if ([v29 containsObject:*MEMORY[0x1E4F15F48]])
    {
      v7 = objc_alloc_init(MediaControlsExpandableButtonOption);
      [(MediaControlsExpandableButtonOption *)v7 setIdentifier:v6];
      objc_super v8 = +[MRUAsset packageAssetNamed:@"ListeningModeAuto"];
      [(MediaControlsExpandableButtonOption *)v7 setAsset:v8];

      v9 = +[MRUStringsProvider listeningModeAutomatic];
      [(MediaControlsExpandableButtonOption *)v7 setTitle:v9];

      [(MediaControlsExpandableButtonOption *)v7 setSelectedState:@"on"];
      v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(MediaControlsExpandableButtonOption *)v7 setSelectedBackgroundColor:v10];

      [v5 addObject:v7];
    }
    uint64_t v11 = *MEMORY[0x1E4F15F40];
    if ([v29 containsObject:*MEMORY[0x1E4F15F40]])
    {
      v12 = objc_alloc_init(MediaControlsExpandableButtonOption);
      [(MediaControlsExpandableButtonOption *)v12 setIdentifier:v11];
      v13 = +[MRUAsset packageAssetNamed:@"ListeningModeTransparency"];
      [(MediaControlsExpandableButtonOption *)v12 setAsset:v13];

      v14 = +[MRUStringsProvider listeningModeTransparency];
      [(MediaControlsExpandableButtonOption *)v12 setTitle:v14];

      [(MediaControlsExpandableButtonOption *)v12 setSelectedState:@"on"];
      v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(MediaControlsExpandableButtonOption *)v12 setSelectedBackgroundColor:v15];

      [v5 addObject:v12];
    }
    uint64_t v16 = *MEMORY[0x1E4F15F50];
    if ([v29 containsObject:*MEMORY[0x1E4F15F50]])
    {
      v17 = objc_alloc_init(MediaControlsExpandableButtonOption);
      [(MediaControlsExpandableButtonOption *)v17 setIdentifier:v16];
      v18 = +[MRUAsset packageAssetNamed:@"ListeningModeOff"];
      [(MediaControlsExpandableButtonOption *)v17 setAsset:v18];

      v19 = +[MRUStringsProvider listeningModeOff];
      [(MediaControlsExpandableButtonOption *)v17 setTitle:v19];

      [(MediaControlsExpandableButtonOption *)v17 setSelectedState:@"on"];
      [(MediaControlsExpandableButtonOption *)v17 setSelectedBackgroundColor:self->_offColor];
      [v5 addObject:v17];
    }
    uint64_t v20 = *MEMORY[0x1E4F15F38];
    if ([v29 containsObject:*MEMORY[0x1E4F15F38]])
    {
      v21 = objc_alloc_init(MediaControlsExpandableButtonOption);
      [(MediaControlsExpandableButtonOption *)v21 setIdentifier:v20];
      v22 = +[MRUAsset packageAssetNamed:@"ListeningModeNoiseCancellation"];
      [(MediaControlsExpandableButtonOption *)v21 setAsset:v22];

      v23 = +[MRUStringsProvider listeningModeNoiseCancellation];
      [(MediaControlsExpandableButtonOption *)v21 setTitle:v23];

      [(MediaControlsExpandableButtonOption *)v21 setSelectedState:@"on"];
      v24 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(MediaControlsExpandableButtonOption *)v21 setSelectedBackgroundColor:v24];

      [v5 addObject:v21];
    }
    v25 = [(MediaControlsBluetoothListeningModeButton *)self traitCollection];
    uint64_t v26 = [v25 layoutDirection];

    if (v26 == 1)
    {
      v27 = [v5 reverseObjectEnumerator];
      v28 = [v27 allObjects];
      [(MediaControlsExpandableButton *)self setOptions:v28];
    }
    else
    {
      v27 = (void *)[v5 copy];
      [(MediaControlsExpandableButton *)self setOptions:v27];
    }
  }
}

- (NSString)selectedListeningMode
{
  v2 = [(MediaControlsExpandableButton *)self selectedOption];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setSelectedListeningMode:(id)a3
{
}

- (void)setSelectedListeningMode:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(MediaControlsExpandableButton *)self options];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__MediaControlsBluetoothListeningModeButton_setSelectedListeningMode_animated___block_invoke;
  v10[3] = &unk_1E5F0F028;
  id v11 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v10];

  [(MediaControlsExpandableButton *)self setSelectedOptionIndex:v9 animated:v4];
}

uint64_t __79__MediaControlsBluetoothListeningModeButton_setSelectedListeningMode_animated___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)playRequiresBothBudsInEarErrorHaptic
{
  id v3 = +[MRUStringsProvider listeningModeErrorMessage];
  [(MediaControlsExpandableButton *)self playFailedValueChangedEventHapticWithMessage:v3];
}

- (NSSet)availableListeningModes
{
  return self->_availableListeningModes;
}

- (UIColor)offColor
{
  return self->_offColor;
}

- (void)setOffColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offColor, 0);

  objc_storeStrong((id *)&self->_availableListeningModes, 0);
}

@end