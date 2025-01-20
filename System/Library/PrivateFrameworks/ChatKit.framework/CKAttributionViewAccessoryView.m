@interface CKAttributionViewAccessoryView
- (BOOL)isContentVisible;
- (CKAttributionViewAccessoryView)initWithFrame:(CGRect)a3 chatItem:(id)a4 layoutBounds:(CGRect)a5 windowSize:(CGSize)a6 saveStickerHandler:(id)a7;
- (_TtC7ChatKit24CKTapbackAttributionView)attributionView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)saveStickerHandler;
- (void)setIsContentVisible:(BOOL)a3;
- (void)setSaveStickerHandler:(id)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4;
@end

@implementation CKAttributionViewAccessoryView

- (CKAttributionViewAccessoryView)initWithFrame:(CGRect)a3 chatItem:(id)a4 layoutBounds:(CGRect)a5 windowSize:(CGSize)a6 saveStickerHandler:(id)a7
{
  CGFloat width = a6.width;
  CGFloat height = a5.size.height;
  double v9 = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v30 = a3.origin.y;
  double v31 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.x;
  id v15 = a4;
  id v16 = *(id *)&width;
  v17 = +[CKUIBehavior sharedBehaviors];
  [v17 attributionViewAdditionalTopOffset];
  uint64_t v19 = v18;

  v20 = +[CKUIBehavior sharedBehaviors];
  int v21 = [v20 attributionViewShouldCenterInTranscript];

  double v22 = 0.0;
  if (v21 && v41 > 0.0)
  {
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = v9;
    v42.size.CGFloat height = height;
    double v22 = v9 * 0.5 + CGRectGetMinX(v42) - v41 * 0.5;
  }
  v40.receiver = self;
  v40.super_class = (Class)CKAttributionViewAccessoryView;
  long long v32 = xmmword_18F81D8B0;
  uint64_t v33 = 1;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  double v37 = v22;
  uint64_t v38 = v19;
  uint64_t v39 = 0;
  double v23 = v31;
  v24 = -[_UIContextMenuAccessoryView initWithFrame:configuration:](&v40, sel_initWithFrame_configuration_, &v32, v13, v30, v12, v31, *(void *)&v30, *(void *)&v31);
  if (v24)
  {
    v25 = _Block_copy(v16);
    id saveStickerHandler = v24->_saveStickerHandler;
    v24->_id saveStickerHandler = v25;

    v27 = [[_TtC7ChatKit24CKTapbackAttributionView alloc] initWithMessagePartChatItem:v15];
    -[CKTapbackAttributionView setFrame:](v27, "setFrame:", 0.0, 0.0, v12, v23);
    [(CKTapbackAttributionView *)v27 setDelegate:v24];
    [(CKAttributionViewAccessoryView *)v24 addSubview:v27];
    attributionView = v24->_attributionView;
    v24->_attributionView = v27;
  }
  return v24;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if ([(CKAttributionViewAccessoryView *)self isContentVisible] != a3)
  {
    [(CKAttributionViewAccessoryView *)self setIsContentVisible:v4];
    v6 = [(CKAttributionViewAccessoryView *)self attributionView];
    id v7 = v6;
    if (v4) {
      [v6 present];
    }
    else {
      [v6 dismiss];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CKAttributionViewAccessoryView *)self attributionView];
  double v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (void)tapbackAttributionView:(id)a3 didTapToSaveSticker:(id)a4
{
  id v7 = a4;
  v5 = [(CKAttributionViewAccessoryView *)self saveStickerHandler];

  if (v5)
  {
    v6 = [(CKAttributionViewAccessoryView *)self saveStickerHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (_TtC7ChatKit24CKTapbackAttributionView)attributionView
{
  return self->_attributionView;
}

- (id)saveStickerHandler
{
  return self->_saveStickerHandler;
}

- (void)setSaveStickerHandler:(id)a3
{
}

- (BOOL)isContentVisible
{
  return self->_isContentVisible;
}

- (void)setIsContentVisible:(BOOL)a3
{
  self->_isContentVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveStickerHandler, 0);

  objc_storeStrong((id *)&self->_attributionView, 0);
}

@end