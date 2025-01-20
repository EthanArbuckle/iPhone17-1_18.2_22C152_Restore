@interface HKDisplayTypeContextItemAttributedLabelOverride
+ (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelOverrideWithText:(id)a3 selectedText:(id)a4;
- (BOOL)_isEqualToAttributedLabelOverride:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedLabelText;
- (NSAttributedString)selectedAttributedLabelText;
- (id)attributedLabelTextWithSelectionState:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HKDisplayTypeContextItemAttributedLabelOverride

+ (HKDisplayTypeContextItemAttributedLabelOverride)attributedLabelOverrideWithText:(id)a3 selectedText:(id)a4
{
  v5 = (NSAttributedString *)a3;
  v6 = (NSAttributedString *)a4;
  v7 = objc_alloc_init(HKDisplayTypeContextItemAttributedLabelOverride);
  attributedLabelText = v7->_attributedLabelText;
  v7->_attributedLabelText = v5;
  v9 = v5;

  selectedAttributedLabelText = v7->_selectedAttributedLabelText;
  v7->_selectedAttributedLabelText = v6;

  return v7;
}

- (id)attributedLabelTextWithSelectionState:(BOOL)a3
{
  if (a3) {
    [(HKDisplayTypeContextItemAttributedLabelOverride *)self selectedAttributedLabelText];
  }
  else {
  v3 = [(HKDisplayTypeContextItemAttributedLabelOverride *)self attributedLabelText];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSAttributedString *)self->_attributedLabelText hash];
  return [(NSAttributedString *)self->_selectedAttributedLabelText hash] & v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKDisplayTypeContextItemAttributedLabelOverride *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(HKDisplayTypeContextItemAttributedLabelOverride *)self _isEqualToAttributedLabelOverride:v4];
  }

  return v5;
}

- (BOOL)_isEqualToAttributedLabelOverride:(id)a3
{
  id v4 = a3;
  attributedLabelText = self->_attributedLabelText;
  v6 = [v4 attributedLabelText];
  if ([(NSAttributedString *)attributedLabelText isEqualToAttributedString:v6])
  {
    selectedAttributedLabelText = self->_selectedAttributedLabelText;
    v8 = [v4 selectedAttributedLabelText];
    BOOL v9 = [(NSAttributedString *)selectedAttributedLabelText isEqualToAttributedString:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(HKDisplayTypeContextItemAttributedLabelOverride *)self attributedLabelText];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(HKDisplayTypeContextItemAttributedLabelOverride *)self selectedAttributedLabelText];
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (NSAttributedString)attributedLabelText
{
  return self->_attributedLabelText;
}

- (NSAttributedString)selectedAttributedLabelText
{
  return self->_selectedAttributedLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAttributedLabelText, 0);
  objc_storeStrong((id *)&self->_attributedLabelText, 0);
}

@end