@interface AXCKMentionSubelement
- (AXCKMentionSubelement)initWithTextView:(id)a3;
- (CGRect)accessibilityFrame;
- (UITextView)accessibilityContainerTextView;
- (_NSRange)range;
- (id)_textRangeForTextView:(id)a3;
- (int)type;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityContainerTextView:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setType:(int)a3;
@end

@implementation AXCKMentionSubelement

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  v3 = [(AXCKMentionSubelement *)self accessibilityContainer];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    char v5 = [v4 isSelectable];
    v6 = (unint64_t *)MEMORY[0x263F1CEE8];
    if ((v5 & 1) == 0 && ![v4 isEditable]) {
      v6 = (unint64_t *)MEMORY[0x263F1CF18];
    }
  }
  else
  {
    v6 = (unint64_t *)MEMORY[0x263F1CEE8];
  }
  unint64_t v7 = *v6;

  return v7;
}

- (AXCKMentionSubelement)initWithTextView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXCKMentionSubelement;
  return [(AXCKMentionSubelement *)&v4 initWithAccessibilityContainer:a3];
}

- (id)_textRangeForTextView:(id)a3
{
  id v4 = a3;
  char v5 = [v4 beginningOfDocument];
  v6 = objc_msgSend(v4, "positionFromPosition:offset:", v5, -[AXCKMentionSubelement range](self, "range"));
  uint64_t v7 = [(AXCKMentionSubelement *)self range];
  [(AXCKMentionSubelement *)self range];
  uint64_t v9 = [v4 positionFromPosition:v5 offset:v8 + v7];
  v10 = (void *)v9;
  v11 = 0;
  if (v6 && v9)
  {
    v11 = [v4 textRangeFromPosition:v6 toPosition:v9];
  }

  return v11;
}

- (CGRect)accessibilityFrame
{
  v3 = [(AXCKMentionSubelement *)self accessibilityContainer];
  uint64_t v4 = [(AXCKMentionSubelement *)self _textRangeForTextView:v3];
  char v5 = (void *)v4;
  if (!v3)
  {
    uint64_t v6 = *MEMORY[0x263F001A8];
    uint64_t v7 = *(void *)(MEMORY[0x263F001A8] + 8);
    uint64_t v8 = *(void *)(MEMORY[0x263F001A8] + 16);
    uint64_t v9 = *(void *)(MEMORY[0x263F001A8] + 24);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [(UIView *)v3 bounds];
  if (v5) {
LABEL_3:
  }
    [(UIView *)v3 firstRectForRange:v5];
LABEL_4:
  CGRect v18 = UIAccessibilityConvertFrameToScreenCoordinates(*(CGRect *)&v6, v3);
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (UITextView)accessibilityContainerTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityContainerTextView);

  return (UITextView *)WeakRetained;
}

- (void)setAccessibilityContainerTextView:(id)a3
{
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end