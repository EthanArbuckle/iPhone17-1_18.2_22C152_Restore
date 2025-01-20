@interface _MFAtomFieldEditor
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGRect)_rectForScrollToVisible:(_NSRange)a3;
- (CGRect)convertGlyphRect:(CGRect)a3;
- (_MFAtomFieldEditor)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)_enclosingScrollView;
- (id)selectionRectsForRange:(id)a3;
- (id)textInputTraits;
- (id)undoManager;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)paste:(id)a3;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
@end

@implementation _MFAtomFieldEditor

- (_MFAtomFieldEditor)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MFAtomFieldEditor;
  v10 = -[_MFAtomFieldEditor initWithFrame:textContainer:](&v15, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(_MFAtomFieldEditor *)v10 setClipsToBounds:0];
    v12 = [(_MFAtomFieldEditor *)v11 textContainer];
    [v12 setLineFragmentPadding:3.0];

    v13 = [(_MFAtomFieldEditor *)v11 textContainer];
    [v13 setMaximumNumberOfLines:1];

    -[_MFAtomFieldEditor setTextContainerInset:](v11, "setTextContainerInset:", 3.0, 0.0, 3.0, 0.0);
  }

  return v11;
}

- (id)_enclosingScrollView
{
  v2 = [(_MFAtomFieldEditor *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (id)textInputTraits
{
  v2 = [(_MFAtomFieldEditor *)self _hostView];
  uint64_t v3 = [v2 textInputTraits];

  return v3;
}

- (CGRect)convertGlyphRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_MFAtomFieldEditor *)self textContainerInset];
  double v9 = x + v8;
  [(_MFAtomFieldEditor *)self textContainerInset];
  double v11 = y + v10;
  double v12 = v9;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v11;
  result.origin.double x = v12;
  return result;
}

- (id)undoManager
{
  v2 = [(_MFAtomFieldEditor *)self _hostView];
  uint64_t v3 = [v2 undoManager];

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_paste_ == a3)
  {
    double v9 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    double v10 = [(_MFAtomFieldEditor *)self _hostView];
    double v11 = [v10 _supportedPasteboardTypes];

    unsigned __int8 v12 = [v9 containsPasteboardTypes:v11 inItemSet:0];
  }
  else if (sel__define_ == a3 || sel__share_ == a3 || sel__lookup_ == a3)
  {
    unsigned __int8 v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_MFAtomFieldEditor;
    unsigned __int8 v12 = [(_MFAtomFieldEditor *)&v14 canPerformAction:a3 withSender:v6];
  }

  return v12;
}

- (void)cut:(id)a3
{
  id v7 = a3;
  -[_MFAtomFieldEditor copy:](self, "copy:");
  v4 = [(_MFAtomFieldEditor *)self _hostView];
  uint64_t v5 = [(_MFAtomFieldEditor *)self selectedRange];
  objc_msgSend(v4, "_removeRepresentedObjectsInCharacterRange:", v5, v6);
}

- (void)copy:(id)a3
{
  id v5 = [(_MFAtomFieldEditor *)self _hostView];
  uint64_t v3 = [v5 selectedRepresentedObjects];
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v5 _storeRepresentedObjects:v3 onPasteboard:v4];
  }
}

- (void)paste:(id)a3
{
  id v8 = [(_MFAtomFieldEditor *)self _hostView];
  v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v5 = [v8 _representedObjectsFromPasteboard:v4];
  if ([v5 count])
  {
    uint64_t v6 = [(_MFAtomFieldEditor *)self selectedRange];
    objc_msgSend(v8, "_insertRepresentedObjects:atCharacterRange:", v5, v6, v7);
  }
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(_MFAtomFieldEditor *)self beginningOfDocument];
  uint64_t v7 = [v4 start];
  uint64_t v8 = [(_MFAtomFieldEditor *)self offsetFromPosition:v6 toPosition:v7];
  double v9 = [v4 start];
  double v10 = [v4 end];
  uint64_t v11 = [(_MFAtomFieldEditor *)self offsetFromPosition:v9 toPosition:v10];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke;
  aBlock[3] = &unk_1E5F793F0;
  id v12 = v5;
  id v27 = v12;
  double v13 = _Block_copy(aBlock);
  objc_super v14 = [(_MFAtomFieldEditor *)self textStorage];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_2;
  v21[3] = &unk_1E5F79458;
  uint64_t v24 = v8;
  uint64_t v25 = v11;
  v21[4] = self;
  id v15 = v13;
  id v23 = v15;
  id v16 = v12;
  id v22 = v16;
  objc_msgSend(v14, "enumerateAttributesInRange:options:usingBlock:", v8, v11, 0, v21);

  if ([v16 count])
  {
    id v17 = v16;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_MFAtomFieldEditor;
    id v17 = [(_MFAtomFieldEditor *)&v20 selectionRectsForRange:v4];
  }
  v18 = v17;

  return v18;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(_MFAtomFieldEditor *)self _enclosingScrollView];
  objc_msgSend(v10, "convertRect:fromView:", self, x, y, width, height);
  objc_msgSend(v10, "scrollRectToVisible:animated:", v4);
}

- (CGRect)_rectForScrollToVisible:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(_MFAtomFieldEditor *)self layoutManager];
  uint64_t v7 = [(_MFAtomFieldEditor *)self textContainer];
  uint64_t v8 = [(_MFAtomFieldEditor *)self textStorage];
  unint64_t v9 = [v8 length];

  if (location + length > v9)
  {
    id v10 = [(_MFAtomFieldEditor *)self textStorage];
    NSUInteger location = [v10 length] - 1;
    NSUInteger length = 1;
  }
  uint64_t v11 = objc_msgSend(v6, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0);
  objc_msgSend(v6, "boundingRectForGlyphRange:inTextContainer:", v11, v12, v7);
  [(_MFAtomFieldEditor *)self textContainerInset];
  [(UIView *)self mf_currentScreenScale];
  UIRectIntegralWithScale();
  CGRect v26 = CGRectInset(v25, -5.0, 0.0);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  [(_MFAtomFieldEditor *)self bounds];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v28 = CGRectIntersection(v27, v30);
  CGFloat v17 = v28.origin.x;
  CGFloat v18 = v28.origin.y;
  CGFloat v19 = v28.size.width;
  CGFloat v20 = v28.size.height;

  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

@end