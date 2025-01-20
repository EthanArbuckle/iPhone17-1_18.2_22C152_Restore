@interface CKImageBalloonPluginDatasource
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKBalloonView)balloonView;
- (CKImageBalloonPluginDatasource)initWithPluginPayload:(id)a3;
- (CKMediaObject)mediaObject;
- (id)imageBalloon;
- (void)previewDidChange:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setMediaObject:(id)a3;
@end

@implementation CKImageBalloonPluginDatasource

- (CKImageBalloonPluginDatasource)initWithPluginPayload:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CKImageBalloonPluginDatasource;
  v3 = [(CKImageBalloonPluginDatasource *)&v9 initWithPluginPayload:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CKImageBalloonPluginDatasource *)v3 pluginPayload];
    uint64_t v6 = [v5 mediaObjectFromPayload];
    mediaObject = v4->_mediaObject;
    v4->_mediaObject = (CKMediaObject *)v6;
  }
  return v4;
}

- (id)imageBalloon
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_previewDidChange_ name:@"CKPreviewDidChangeNotification" object:0];

  mediaObject = self->_mediaObject;
  v5 = +[CKUIBehavior sharedBehaviors];
  [v5 previewMaxWidth];
  uint64_t v6 = CKBalloonViewForClass(-[CKMediaObject balloonViewClassForWidth:orientation:](mediaObject, "balloonViewClassForWidth:orientation:", 1));

  v7 = self->_mediaObject;
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 previewMaxWidth];
  objc_msgSend(v6, "configureForMediaObject:previewWidth:orientation:", v7, 1);

  [v6 setOrientation:1];
  [v6 setCanUseOpaqueMask:0];
  [v6 setHasTail:0];
  [v6 setBalloonShape:0];
  [v6 prepareForDisplay];
  objc_super v9 = objc_opt_class();
  if (objc_msgSend(v9, "__ck_isKindOfClass:", objc_opt_class()))
  {
    v10 = [(CKImageBalloonPluginDatasource *)self mediaObject];
    v11 = [v10 transfer];
    v12 = [v11 attributionInfo];
    v13 = [v12 objectForKey:*MEMORY[0x1E4F6D3C0]];

    if ([v13 length]) {
      [v6 setStickerAccessibilityDescription:v13];
    }
  }
  [(CKImageBalloonPluginDatasource *)self setBalloonView:v6];

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(CKImageBalloonPluginDatasource *)self mediaObject];
  v7 = [v6 transfer];
  int v8 = [v7 isSticker];

  if (v8)
  {
    objc_super v9 = [(CKImageBalloonPluginDatasource *)self mediaObject];
    uint64_t v10 = +[CKUIBehavior sharedBehaviors];
    [(id)v10 previewMaxWidth];
    v11 = objc_msgSend(v9, "previewForWidth:orientation:", 0);

    objc_opt_class();
    LOBYTE(v10) = objc_opt_isKindOfClass();
    id v12 = v11;
    v13 = v12;
    if (v10)
    {
      v14 = [v12 image];
      [v14 size];
      double v16 = v15;
      double v18 = v17;

      v19 = [v13 image];
    }
    else
    {
      [v12 size];
      double v16 = v23;
      double v18 = v24;
      v19 = v13;
    }
    [v19 scale];
    double v26 = v25;

    v27 = +[CKUIBehavior sharedBehaviors];
    [v27 stickerScreenScale];
    objc_msgSend(v27, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v16, v18, v26, 1.0, v28, width);
    double v30 = v29;
    double v32 = v31;

    double v21 = v30;
    double v22 = v32;
  }
  else
  {
    balloonView = self->_balloonView;
    -[CKBalloonView sizeThatFits:](balloonView, "sizeThatFits:", width, height);
  }
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)previewDidChange:(id)a3
{
  id v14 = a3;
  v4 = [v14 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = v14;
  if (isKindOfClass)
  {
    v7 = [v14 object];
    int v8 = [(CKMediaObject *)self->_mediaObject transferGUID];
    objc_super v9 = [v7 transferGUID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      balloonView = self->_balloonView;
      mediaObject = self->_mediaObject;
      v13 = +[CKUIBehavior sharedBehaviors];
      [v13 previewMaxWidth];
      -[CKBalloonView configureForMediaObject:previewWidth:orientation:](balloonView, "configureForMediaObject:previewWidth:orientation:", mediaObject, 1);
    }
    uint64_t v6 = v14;
  }
}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonView, 0);

  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end