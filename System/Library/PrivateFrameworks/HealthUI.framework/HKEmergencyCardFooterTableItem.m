@interface HKEmergencyCardFooterTableItem
- (BOOL)hasPresentableData;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (NSAttributedString)attributedTitleForFooter;
- (UIEdgeInsets)separatorInset;
- (id)_cell;
- (id)initInEditMode:(BOOL)a3;
- (id)shouldInteractWithURLBlock;
- (void)setAttributedTitleForFooter:(id)a3;
- (void)setShouldInteractWithURLBlock:(id)a3;
@end

@implementation HKEmergencyCardFooterTableItem

- (id)initInEditMode:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardFooterTableItem;
  return [(HKEmergencyCardTableItem *)&v4 initInEditMode:a3];
}

- (BOOL)hasPresentableData
{
  return [(NSAttributedString *)self->_attributedTitleForFooter length] != 0;
}

- (UIEdgeInsets)separatorInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setAttributedTitleForFooter:(id)a3
{
  p_attributedTitleForFooter = &self->_attributedTitleForFooter;
  objc_storeStrong((id *)&self->_attributedTitleForFooter, a3);
  id v6 = a3;
  v7 = *p_attributedTitleForFooter;
  id v8 = [(HKEmergencyCardFooterCell *)self->_cell textLabel];
  [v8 setAttributedText:v7];
}

- (id)_cell
{
  cell = self->_cell;
  if (!cell)
  {
    double v4 = [[HKEmergencyCardFooterCell alloc] initWithStyle:0 reuseIdentifier:0x1F3BAE9C0];
    double v5 = self->_cell;
    self->_cell = v4;

    [(HKEmergencyCardFooterCell *)self->_cell setFooterText:self->_attributedTitleForFooter];
    [(HKEmergencyCardFooterCell *)self->_cell setTextViewDelegate:self];
    cell = self->_cell;
  }
  return cell;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  shouldInteractWithURLBlock = (uint64_t (**)(id, id))self->_shouldInteractWithURLBlock;
  if (shouldInteractWithURLBlock) {
    return shouldInteractWithURLBlock[2](shouldInteractWithURLBlock, a4);
  }
  else {
    return 1;
  }
}

- (NSAttributedString)attributedTitleForFooter
{
  return self->_attributedTitleForFooter;
}

- (id)shouldInteractWithURLBlock
{
  return self->_shouldInteractWithURLBlock;
}

- (void)setShouldInteractWithURLBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldInteractWithURLBlock, 0);
  objc_storeStrong((id *)&self->_attributedTitleForFooter, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end