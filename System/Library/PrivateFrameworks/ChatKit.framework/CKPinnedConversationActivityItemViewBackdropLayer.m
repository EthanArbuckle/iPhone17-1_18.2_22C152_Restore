@interface CKPinnedConversationActivityItemViewBackdropLayer
- (CKPinnedConversationActivityItemViewBackdropLayer)init;
- (int64_t)userInterfaceStyle;
- (void)_updateBackgroundColor;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation CKPinnedConversationActivityItemViewBackdropLayer

- (CKPinnedConversationActivityItemViewBackdropLayer)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CKPinnedConversationActivityItemViewBackdropLayer;
  v2 = [(CKPinnedConversationActivityItemViewBackdropLayer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(CKPinnedConversationActivityItemViewBackdropLayer *)v2 _updateBackgroundColor];
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v4 setValue:@"default" forKeyPath:*MEMORY[0x1E4F3A1D0]];
    [v4 setValue:&unk_1EDF177B8 forKeyPath:*MEMORY[0x1E4F3A1D8]];
    uint64_t v5 = MEMORY[0x1E4F1CC38];
    [v4 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1A0]];
    [v4 setValue:v5 forKeyPath:*MEMORY[0x1E4F3A1B8]];
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    [v4 setValue:MEMORY[0x1E4F1CC28] forKeyPath:*MEMORY[0x1E4F3A170]];
    [v4 setValue:v6 forKeyPath:*MEMORY[0x1E4F3A1B0]];
    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v7 setValue:&unk_1EDF177C8 forKeyPath:*MEMORY[0x1E4F3A100]];
    v11[0] = v4;
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(CKPinnedConversationActivityItemViewBackdropLayer *)v3 setFilters:v8];
  }
  return v3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(CKPinnedConversationActivityItemViewBackdropLayer *)self _updateBackgroundColor];
  }
}

- (void)_updateBackgroundColor
{
  unint64_t userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle >= 2)
  {
    if (userInterfaceStyle != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x1E4F428B8];
    double v6 = 0.278431373;
    double v5 = 0.75;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F428B8];
    double v5 = 0.9;
    double v6 = 1.0;
  }
  v7 = [v4 colorWithWhite:v6 alpha:v5];
LABEL_7:
  id v8 = v7;
  -[CKPinnedConversationActivityItemViewBackdropLayer setBackgroundColor:](self, "setBackgroundColor:", [v8 CGColor]);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end