@interface HUGridMediaPlatterCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (double)cellHeight;
- (double)interPlatterSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCellHeight:(double)a3;
- (void)setInterPlatterSpacing:(double)a3;
@end

@implementation HUGridMediaPlatterCellLayoutOptions

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUGridMediaPlatterCellLayoutOptions;
  v4 = objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_);
  v11[0] = &unk_1F19B5030;
  v11[1] = &unk_1F19B5018;
  v12[0] = &unk_1F19B6370;
  v12[1] = &unk_1F19B6540;
  v11[2] = &unk_1F19B50A8;
  v11[3] = &unk_1F19B5060;
  v12[2] = &unk_1F19B64B0;
  v12[3] = &unk_1F19B6540;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  objc_msgSend(v4, "setCellHeight:", HUConstantForCellSizeSubclass(a3, v5));

  v9[0] = &unk_1F19B5030;
  v9[1] = &unk_1F19B5018;
  v10[0] = &unk_1F19B6490;
  v10[1] = &unk_1F19B6490;
  v9[2] = &unk_1F19B50A8;
  v9[3] = &unk_1F19B5060;
  v10[2] = &unk_1F19B6490;
  v10[3] = &unk_1F19B6490;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  objc_msgSend(v4, "setInterPlatterSpacing:", HUConstantForCellSizeSubclass(a3, v6));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUGridMediaPlatterCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v6 copyWithZone:a3];
  [(HUGridMediaPlatterCellLayoutOptions *)self cellHeight];
  objc_msgSend(v4, "setCellHeight:");
  [(HUGridMediaPlatterCellLayoutOptions *)self interPlatterSpacing];
  objc_msgSend(v4, "setInterPlatterSpacing:");
  return v4;
}

- (void)setInterPlatterSpacing:(double)a3
{
  self->_interPlatterSpacing = a3;
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (double)interPlatterSpacing
{
  return self->_interPlatterSpacing;
}

- (double)cellHeight
{
  return self->_cellHeight;
}

@end