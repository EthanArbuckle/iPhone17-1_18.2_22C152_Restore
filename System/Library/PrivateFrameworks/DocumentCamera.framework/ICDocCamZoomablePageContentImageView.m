@interface ICDocCamZoomablePageContentImageView
- (BOOL)_accessibilityRespondsToUserInteraction;
- (ICDocCamZoomablePageContentViewDelegate)pageContentViewDelegate;
- (id)_accessibilityScrollAncestorForSelector:(SEL)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setPageContentViewDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ICDocCamZoomablePageContentImageView

- (BOOL)_accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityScrollAncestorForSelector:(SEL)a3
{
  BOOL v3 = sel_accessibilityScrollRightPage == a3 || sel_accessibilityScrollLeftPage == a3;
  if (v3
    && ([(ICDocCamZoomablePageContentImageView *)self nextResponder],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v5 nextResponder];

      v5 = (void *)v6;
      if (!v6) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamZoomablePageContentImageView _accessibilityScrollAncestorForSelector:](v7);
    }

    v5 = 0;
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  uint64_t v9 = [v8 type];

  if (v9 == 2)
  {
    v10 = [(ICDocCamZoomablePageContentImageView *)self pageContentViewDelegate];

    if (v10)
    {
      v11 = [(ICDocCamZoomablePageContentImageView *)self pageContentViewDelegate];
      [v11 pageContentViewDidPencilDown];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamZoomablePageContentImageView;
  [(ICDocCamZoomablePageContentImageView *)&v12 touchesBegan:v6 withEvent:v7];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(ICDocCamZoomablePageContentImageView *)self pageContentViewDelegate];
  int v9 = objc_msgSend(v8, "isTouchingAnalyzableContentAtPoint:withEvent:", v7, x, y);

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDocCamZoomablePageContentImageView;
    -[ICDocCamZoomablePageContentImageView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (ICDocCamZoomablePageContentImageView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = self;
  }
  v11 = v10;

  return v11;
}

- (ICDocCamZoomablePageContentViewDelegate)pageContentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageContentViewDelegate);

  return (ICDocCamZoomablePageContentViewDelegate *)WeakRetained;
}

- (void)setPageContentViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_accessibilityScrollAncestorForSelector:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "scrollAncestor";
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end