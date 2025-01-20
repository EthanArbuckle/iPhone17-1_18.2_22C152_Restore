@interface GKImageBrush
- (CGSize)sizeForInput:(id)a3;
- (double)scaleForInput:(id)a3;
- (id)inputTransform;
- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5;
- (void)setInputTransform:(id)a3;
@end

@implementation GKImageBrush

- (CGSize)sizeForInput:(id)a3
{
  id v4 = a3;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  if (inputTransform)
  {
    uint64_t v6 = inputTransform[2](inputTransform, v4);

    id v4 = (id)v6;
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 size];
LABEL_8:
    double v10 = v7;
    double v12 = v8;
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)GKImageBrush;
    [(GKBrush *)&v15 sizeForInput:v4];
    goto LABEL_8;
  }
  [v4 bounds];
  double v10 = v9;
  double v12 = v11;
LABEL_9:

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)scaleForInput:(id)a3
{
  id v4 = a3;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  if (inputTransform)
  {
    uint64_t v6 = inputTransform[2](inputTransform, v4);

    id v4 = (id)v6;
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 scale];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v4 contentScaleFactor];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKImageBrush;
    [(GKBrush *)&v10 scaleForInput:v4];
  }
  double v8 = v7;

  return v8;
}

- (void)drawInRect:(CGRect)a3 withContext:(CGContext *)a4 input:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  inputTransform = (void (**)(id, id))self->_inputTransform;
  double v13 = v11;
  id v16 = v11;
  if (inputTransform)
  {
    double v13 = inputTransform[2](inputTransform, v11);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    UIGraphicsPushContext(a4);
    objc_msgSend(v13, "drawInRect:", x, y, width, height);
    UIGraphicsPopContext();
    if (annotateOnceToken != -1) {
      dispatch_once(&annotateOnceToken, &__block_literal_global_83);
    }
    if (shouldAnnotateImageUsage)
    {
      double v14 = (objc_class *)objc_opt_class();
      Name = class_getName(v14);
      _annotateDrawInRectWithContextAndInput((uint64_t)Name, 0, v13, x, y, width, height);
    }
  }
}

void __45__GKImageBrush_drawInRect_withContext_input___block_invoke()
{
  id v0 = [MEMORY[0x263F40298] shared];
  shouldAnnotateImageUsage = [v0 shouldAnnotateImageUsage];
}

- (id)inputTransform
{
  return self->_inputTransform;
}

- (void)setInputTransform:(id)a3
{
}

- (void).cxx_destruct
{
}

@end