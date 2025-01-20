@interface HKVerifiableClinicalRecordDisplayItem
+ (id)subtitleItemWithTitleText:(id)a3 detailText:(id)a4 style:(int64_t)a5;
+ (id)valueItemWithTitleText:(id)a3 attributedDetailText:(id)a4;
+ (id)valueItemWithTitleText:(id)a3 detailText:(id)a4;
- (NSAttributedString)attributedDetailText;
- (NSString)detailText;
- (NSString)titleText;
- (int64_t)subtitleStyle;
- (int64_t)type;
- (void)setAttributedDetailText:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setSubtitleStyle:(int64_t)a3;
- (void)setTitleText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation HKVerifiableClinicalRecordDisplayItem

+ (id)subtitleItemWithTitleText:(id)a3 detailText:(id)a4 style:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    v9 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    [(HKVerifiableClinicalRecordDisplayItem *)v9 setType:0];
    [(HKVerifiableClinicalRecordDisplayItem *)v9 setSubtitleStyle:a5];
    [(HKVerifiableClinicalRecordDisplayItem *)v9 setTitleText:v7];
    [(HKVerifiableClinicalRecordDisplayItem *)v9 setDetailText:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)valueItemWithTitleText:(id)a3 detailText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setType:1];
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setTitleText:v5];
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setDetailText:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)valueItemWithTitleText:(id)a3 attributedDetailText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(HKVerifiableClinicalRecordDisplayItem);
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setType:1];
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setTitleText:v5];
    [(HKVerifiableClinicalRecordDisplayItem *)v7 setAttributedDetailText:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)subtitleStyle
{
  return self->_subtitleStyle;
}

- (void)setSubtitleStyle:(int64_t)a3
{
  self->_subtitleStyle = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (NSAttributedString)attributedDetailText
{
  return self->_attributedDetailText;
}

- (void)setAttributedDetailText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end