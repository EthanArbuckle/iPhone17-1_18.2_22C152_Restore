@interface WKTargetedPreviewContainer
- (WKTargetedPreviewContainer)initWithContentView:(id)a3;
- (void)_didRemoveSubview:(id)a3;
@end

@implementation WKTargetedPreviewContainer

- (WKTargetedPreviewContainer)initWithContentView:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v11.receiver = self;
  v11.super_class = (Class)WKTargetedPreviewContainer;
  v8 = -[WKTargetedPreviewContainer initWithFrame:](&v11, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8) {
    objc_storeWeak((id *)&v8->_contentView, a3);
  }
  return v9;
}

- (void)_didRemoveSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKTargetedPreviewContainer;
  [(WKTargetedPreviewContainer *)&v4 _didRemoveSubview:a3];
  if (!objc_msgSend((id)-[WKTargetedPreviewContainer subviews](self, "subviews"), "count")) {
    [objc_loadWeak((id *)&self->_contentView) _targetedPreviewContainerDidRemoveLastSubview:self];
  }
}

- (void).cxx_destruct
{
}

@end