@interface MFMailComposeRecipientTextView
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (CGRect)pointerRectForLineContainingGlyphIndex:(unint64_t)a3;
- (MFComposeDisplayMetrics)displayMetrics;
- (MFMailComposeRecipientTextView)initWithFrame:(CGRect)a3;
- (NSArray)people;
- (double)beamHeight;
- (id)nextResponder;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_displayMetricsDidChange;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_textInputDidChange:(id)a3;
- (void)addRecipient:(id)a3;
- (void)appendText:(id)a3;
- (void)dealloc;
- (void)layoutMarginsDidChange;
- (void)setDisplayMetrics:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFMailComposeRecipientTextView

- (MFMailComposeRecipientTextView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFMailComposeRecipientTextView;
  v3 = -[CNComposeRecipientTextView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__textInputDidChange_ name:*MEMORY[0x1E4FB3028] object:0];

    v5 = [(MFMailComposeRecipientTextView *)v3 inputAssistantItem];
    [v5 _setShowsBarButtonItemsInline:0];

    id v6 = objc_alloc_init(MEMORY[0x1E4F38E40]);
    [v6 setDelegate:v3];
    [v6 setElementSource:v3];
    [(MFMailComposeRecipientTextView *)v3 addInteraction:v6];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(MFMailComposeRecipientTextView *)v3 addInteraction:v7];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeRecipientTextView;
  [(CNComposeRecipientTextView *)&v4 dealloc];
}

- (id)nextResponder
{
  v3 = [(MFMailComposeRecipientTextView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 nextResponderForRecipientView:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFMailComposeRecipientTextView;
    uint64_t v4 = [(MFMailComposeRecipientTextView *)&v7 nextResponder];
  }
  v5 = (void *)v4;

  return v5;
}

- (void)setDisplayMetrics:(id)a3
{
  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFMailComposeRecipientTextView *)self _displayMetricsDidChange];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v17 = [(MFMailComposeRecipientTextView *)self traitCollection];
  [(MFMailComposeRecipientTextView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeRecipientTextView *)self safeAreaInsets];
  v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v17, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeRecipientTextView *)self setDisplayMetrics:v16];
}

- (void)layoutMarginsDidChange
{
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeRecipientTextView;
  [(MFMailComposeRecipientTextView *)&v17 layoutMarginsDidChange];
  v3 = [(MFMailComposeRecipientTextView *)self traitCollection];
  [(MFMailComposeRecipientTextView *)self directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(MFMailComposeRecipientTextView *)self safeAreaInsets];
  v16 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
  [(MFMailComposeRecipientTextView *)self setDisplayMetrics:v16];
}

- (void)_displayMetricsDidChange
{
  id v3 = [(MFMailComposeRecipientTextView *)self displayMetrics];
  [v3 headerViewSeparatorInset];
  -[MFMailComposeRecipientTextView setSeparatorDirectionalEdgeInsets:](self, "setSeparatorDirectionalEdgeInsets:");

  id v4 = [(MFMailComposeRecipientTextView *)self displayMetrics];
  [v4 trailingButtonMidlineOffset];
  [(CNComposeRecipientTextView *)self setTrailingButtonMidlineInsetFromLayoutMargin:"setTrailingButtonMidlineInsetFromLayoutMargin:"];
}

- (void)_textInputDidChange:(id)a3
{
  id v7 = [(CNComposeRecipientTextView *)self textView];
  id v4 = [v7 text];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    int64_t v6 = [(UIResponder *)self mf_textAlignmentForActiveInputLanguage];
    id v8 = [(CNComposeRecipientTextView *)self textView];
    [v8 setTextAlignment:v6];
  }
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeRecipientTextView;
  [(CNComposeRecipientTextView *)&v6 addRecipient:v4];
  uint64_t v5 = [(MFMailComposeRecipientTextView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 composeRecipientView:self didFinishAddingRecipient:v4];
  }
}

- (void)appendText:(id)a3
{
  id v5 = a3;
  [(CNComposeRecipientTextView *)self becomeFirstResponder];
  id v4 = [(CNComposeRecipientTextView *)self textView];
  [v4 insertText:v5];
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = (void (**)(id, void *, uint64_t))a5;
  if ([(CNComposeRecipientTextView *)self isFirstResponder]) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v8 = [(MFMailComposeRecipientTextView *)self label];
  v10[0] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v6[2](v6, v9, v7);
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8 = (void (**)(id, void *))a6;
  [(CNComposeRecipientTextView *)self becomeFirstResponder];
  uint64_t v7 = [(CNComposeRecipientTextView *)self textView];
  v8[2](v8, v7);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  if ([(CNComposeRecipientTextView *)self usingActiveAppearance])
  {
    uint64_t v7 = [(CNComposeRecipientTextView *)self textView];
    [v6 location];
    -[MFMailComposeRecipientTextView convertPoint:toView:](self, "convertPoint:toView:", v7);
    double v9 = v8;
    double v11 = v10;
    double v12 = [v7 layoutManager];
    double v13 = [v7 textContainer];
    uint64_t v14 = objc_msgSend(v12, "glyphIndexForPoint:inTextContainer:", v13, v9, v11);
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(MFMailComposeRecipientTextView *)self pointerRectForLineContainingGlyphIndex:v14];
  double v15 = objc_msgSend(MEMORY[0x1E4FB1AD8], "regionWithRect:identifier:", 0);

  return v15;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB1AE0];
  [(MFMailComposeRecipientTextView *)self beamHeight];
  id v5 = objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);
  id v6 = [MEMORY[0x1E4FB1AE8] styleWithShape:v5 constrainedAxes:2];

  return v6;
}

- (CGRect)pointerRectForLineContainingGlyphIndex:(unint64_t)a3
{
  id v5 = [(CNComposeRecipientTextView *)self textView];
  id v6 = [v5 layoutManager];
  [v6 lineFragmentRectForGlyphAtIndex:a3 effectiveRange:0];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v33.origin.CGFloat x = v8;
  v33.origin.CGFloat y = v10;
  v33.size.CGFloat width = v12;
  v33.size.CGFloat height = v14;
  if (CGRectIsEmpty(v33))
  {
    double v15 = [v5 layoutManager];
    [v15 extraLineFragmentRect];
    CGFloat v8 = v16;
    CGFloat v10 = v17;
    CGFloat v12 = v18;
  }
  [(MFMailComposeRecipientTextView *)self beamHeight];
  double v20 = v19;
  [v5 textContainerInset];
  CGFloat v22 = v21;
  [v5 textContainerInset];
  CGFloat v24 = v23;
  v34.origin.CGFloat x = v8;
  v34.origin.CGFloat y = v10;
  v34.size.CGFloat width = v12;
  v34.size.CGFloat height = v20;
  CGRect v35 = CGRectOffset(v34, v22, v24);
  -[MFMailComposeRecipientTextView convertRect:fromView:](self, "convertRect:fromView:", v5, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
  CGRect v37 = CGRectInset(v36, 0.0, v20 * -0.75);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (double)beamHeight
{
  id v3 = [(CNComposeRecipientTextView *)self textView];
  id v4 = [(CNComposeRecipientTextView *)self textView];
  id v5 = [v4 endOfDocument];
  [v3 caretRectForPosition:v5];
  double Height = CGRectGetHeight(v8);

  return Height;
}

- (NSArray)people
{
  id v3 = [(CNComposeRecipientTextView *)self addresses];
  if (v3)
  {
    id v4 = [(CNComposeRecipientTextView *)self addresses];
    id v5 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_23);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

id __40__MFMailComposeRecipientTextView_people__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 emailAddressValue];
  id v3 = objc_msgSend(v2, "em_person");

  return v3;
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void).cxx_destruct
{
}

@end