@interface _SFSiriReaderPlaybackRateController
- (BOOL)isSelectedValue:(id)a3;
- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5;
- (NSArray)values;
- (id)accessibilityIdentifierForValue:(id)a3;
- (id)attributedStringForValue:(id)a3;
- (id)textStyleForValue:(id)a3;
- (void)setSelectedValue:(id)a3;
@end

@implementation _SFSiriReaderPlaybackRateController

- (NSArray)values
{
  return (NSArray *)&unk_1EFBDF9B8;
}

- (BOOL)isSelectedValue:(id)a3
{
  [a3 floatValue];
  float v4 = v3;
  v5 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  [v5 currentPlaybackRate];
  BOOL v7 = v4 == v6;

  return v7;
}

- (void)setSelectedValue:(id)a3
{
  [a3 floatValue];
  self->_playbackRate = v4;
  id v5 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  [v5 setPlaybackRate:self->_playbackRate];
}

- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  float v6 = NSString;
  id v7 = a5;
  v8 = [v6 stringWithFormat:@"%@x", a3, @"currentSpeakingRate"];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = WBSMakeAccessibilityIdentifier();
  [v7 setAccessibilityIdentifier:v10];

  return 1;
}

- (id)attributedStringForValue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v7 = NSString;
  v8 = (void *)MEMORY[0x1E4F28EE0];
  if (v4)
  {
    v9 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v4 numberStyle:1];
    v10 = [v7 stringWithFormat:@"%@x", v9];
    v11 = (void *)[v5 initWithString:v10];
  }
  else
  {
    *(float *)&double v6 = self->_playbackRate;
    if (*(float *)&v6 == 0.0) {
      *(float *)&double v6 = 1.0;
    }
    v9 = [NSNumber numberWithFloat:v6];
    v10 = [v8 localizedStringFromNumber:v9 numberStyle:1];
    uint64_t v12 = [v7 stringWithFormat:@"%@x", v10];
    v11 = (void *)[v5 initWithString:v12];
  }

  return v11;
}

- (id)textStyleForValue:(id)a3
{
  return (id)*MEMORY[0x1E4FB28C8];
}

- (id)accessibilityIdentifierForValue:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@x", a3];
}

@end