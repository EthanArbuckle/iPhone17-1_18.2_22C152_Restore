@interface PKTextAttachmentDrawingViewProvider
+ (Class)drawingClassForFileType:(id)a3;
+ (Class)drawingViewClassForDrawingClass:(Class)a3;
+ (Class)tiledViewClassForDrawingClass:(Class)a3;
+ (void)registerViewProviderClassIfNecessary;
- (NSTextLocation)updatedLocationForRecycledViewProvider;
- (id)location;
- (void)loadView;
- (void)setUpdatedLocationForRecycledViewProvider:(id)a3;
@end

@implementation PKTextAttachmentDrawingViewProvider

+ (Class)tiledViewClassForDrawingClass:(Class)a3
{
  v5 = objc_opt_class();
  if (+[PKDrawing drawingClassForPaper] == a3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (void *)[a1 tiledViewClassForPaper];
  }
  if (Class)objc_opt_class() == a3 && (objc_opt_respondsToSelector()) {
    v5 = (void *)[a1 inlineDrawingTiledViewClassForPaper];
  }

  return (Class)v5;
}

+ (void)registerViewProviderClassIfNecessary
{
  if ((registerViewProviderClassIfNecessary_didRegister & 1) == 0
    && +[PKMetalUtility isMetalAvailable])
  {
    [MEMORY[0x1E4FB0870] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:@"com.apple.drawing"];
    if (objc_opt_respondsToSelector()) {
      [MEMORY[0x1E4FB0870] registerTextAttachmentViewProviderClass:objc_opt_class() forFileType:@"com.apple.paper"];
    }
    registerViewProviderClassIfNecessary_didRegister = 1;
  }
}

- (id)location
{
  v3 = [(PKTextAttachmentDrawingViewProvider *)self updatedLocationForRecycledViewProvider];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTextAttachmentDrawingViewProvider;
    id v5 = [(NSTextAttachmentViewProvider *)&v8 location];
  }
  v6 = v5;

  return v6;
}

- (void)loadView
{
  v3 = [(NSTextAttachmentViewProvider *)self textAttachment];
  uint64_t v4 = [v3 pkInserting];

  id v5 = [(NSTextAttachmentViewProvider *)self textAttachment];
  [v5 setPkInserting:0];

  v6 = [(NSTextAttachmentViewProvider *)self textAttachment];
  v7 = [v6 fileType];
  objc_super v8 = +[PKTextAttachmentDrawingViewProvider drawingClassForFileType:v7];

  id v9 = objc_alloc(+[PKTextAttachmentDrawingViewProvider drawingViewClassForDrawingClass:v8]);
  v10 = [(NSTextAttachmentViewProvider *)self textAttachment];
  v11 = (void *)[v9 initWithAttachment:v10 drawingClass:v8 inserted:v4];
  [(NSTextAttachmentViewProvider *)self setView:v11];

  v12 = [(NSTextAttachmentViewProvider *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(NSTextAttachmentViewProvider *)self textAttachment];
  objc_msgSend(v21, "setBounds:", v14, v16, v18, v20);

  v22 = [(NSTextAttachmentViewProvider *)self textAttachment];
  [v22 setEmbeddingType:1];

  v23 = [(NSTextAttachmentViewProvider *)self textAttachment];
  [v23 setStandaloneAlignment:1];

  id v24 = [(NSTextAttachmentViewProvider *)self textAttachment];
  [v24 setLineLayoutPadding:0.0];
}

+ (Class)drawingClassForFileType:(id)a3
{
  if ([a3 isEqualToString:@"com.apple.paper"]) {
    v3 = +[PKDrawing drawingClassForPaper];
  }
  else {
    v3 = (objc_class *)objc_opt_class();
  }

  return v3;
}

+ (Class)drawingViewClassForDrawingClass:(Class)a3
{
  id v5 = objc_opt_class();
  if (+[PKDrawing drawingClassForPaper] == a3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [a1 drawingViewClassForPaper];
LABEL_7:
    id v5 = (void *)v6;
    goto LABEL_8;
  }
  if (Class)objc_opt_class() == a3 && (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [a1 inlineDrawingViewClassForPaper];
    goto LABEL_7;
  }
LABEL_8:

  return (Class)v5;
}

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  return self->_updatedLocationForRecycledViewProvider;
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end