@interface CAMSemanticStylesPreviewStyleCommand
- (CAMSemanticStylesPreviewStyleCommand)initWithStyle:(id)a3;
- (CAMSemanticStylesPreviewStyleCommand)initWithSubcommands:(id)a3;
- (CEKCaptureStyle)_style;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSemanticStylesPreviewStyleCommand

- (CAMSemanticStylesPreviewStyleCommand)initWithStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSemanticStylesPreviewStyleCommand;
  v6 = [(CAMCaptureCommand *)&v10 initWithSubcommands:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__style, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMSemanticStylesPreviewStyleCommand)initWithSubcommands:(id)a3
{
  return [(CAMSemanticStylesPreviewStyleCommand *)self initWithStyle:0];
}

- (void)executeWithContext:(id)a3
{
  id v6 = [a3 currentVideoPreviewLayer];
  v4 = [(CAMSemanticStylesPreviewStyleCommand *)self _style];
  if ([v6 isSemanticStyleRenderingEnabled])
  {
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = [v4 avSemanticStyle];
      [v6 setSemanticStyle:v5 animated:0];
    }
  }
}

- (CEKCaptureStyle)_style
{
  return self->__style;
}

- (void).cxx_destruct
{
}

@end