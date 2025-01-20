@interface PKBadgeLabel
- (PKBadgeLabel)init;
@end

@implementation PKBadgeLabel

- (PKBadgeLabel)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKBadgeLabel;
  v2 = -[PKBadgeLabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(PKBadgeLabel *)v2 setAdjustsFontForContentSizeCategory:1];
    v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] design:*MEMORY[0x1E4FB0938] weight:*MEMORY[0x1E4FB09E0]];
    [(PKBadgeLabel *)v3 setFont:v4];

    v5 = objc_msgSend(MEMORY[0x1E4FB1618], "_pk_betaLabelTextColor");
    [(PKBadgeLabel *)v3 setTextColor:v5];

    id v6 = objc_alloc_init(MEMORY[0x1E4F24388]);
    v7 = objc_msgSend(MEMORY[0x1E4FB1618], "_pk_betaLabelTextEncapsulationColor");
    [v6 setColor:v7];

    [v6 setScale:1];
    [v6 setStyle:1];
    [v6 setShape:2];
    [v6 setPlatterSize:0];
    [(PKBadgeLabel *)v3 _setTextEncapsulation:v6];
  }
  return v3;
}

@end