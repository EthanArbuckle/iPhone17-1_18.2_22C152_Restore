@interface ExitReasonLayer
- (CATextLayer)exitReasonCodeTextLayer;
- (CATextLayer)exitReasonNamespaceTextLayer;
- (CGSize)preferredFrameSize;
- (ExitReasonLayer)initWithNamespaceLayer:(id)a3 codeLayer:(id)a4;
- (double)spaceBetweenTextLayers;
- (void)layoutSublayers;
- (void)nilifyCALayers;
@end

@implementation ExitReasonLayer

- (ExitReasonLayer)initWithNamespaceLayer:(id)a3 codeLayer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ExitReasonLayer;
  v9 = [(ExitReasonLayer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exitReasonNamespaceTextLayer, a3);
    objc_storeStrong((id *)&v10->_exitReasonCodeTextLayer, a4);
    [(ExitReasonLayer *)v10 addSublayer:v10->_exitReasonNamespaceTextLayer];
    [(ExitReasonLayer *)v10 addSublayer:v10->_exitReasonCodeTextLayer];
    v10->_spaceBetweenTextLayers = sub_10001AC3C();
  }

  return v10;
}

- (void)nilifyCALayers
{
  exitReasonNamespaceTextLayer = self->_exitReasonNamespaceTextLayer;
  self->_exitReasonNamespaceTextLayer = 0;

  exitReasonCodeTextLayer = self->_exitReasonCodeTextLayer;
  self->_exitReasonCodeTextLayer = 0;
}

- (CGSize)preferredFrameSize
{
  uint64_t v9 = 0;
  v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  objc_super v12 = &unk_1000279F5;
  v3 = [(ExitReasonLayer *)self sublayers];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FDC0;
  v8[3] = &unk_100030CF0;
  v8[4] = self;
  v8[5] = &v9;
  [v3 enumerateObjectsUsingBlock:v8];

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSublayers
{
  v17.receiver = self;
  v17.super_class = (Class)ExitReasonLayer;
  [(ExitReasonLayer *)&v17 layoutSublayers];
  [(CATextLayer *)self->_exitReasonNamespaceTextLayer preferredFrameSize];
  double v4 = v3 + self->_spaceBetweenTextLayers;
  [(CATextLayer *)self->_exitReasonCodeTextLayer preferredFrameSize];
  double v6 = v4 + v5;
  [(ExitReasonLayer *)self frame];
  double v8 = fmax(v7 - v6, 0.0);
  [(CATextLayer *)self->_exitReasonNamespaceTextLayer preferredFrameSize];
  double v10 = v9;
  [(ExitReasonLayer *)self frame];
  -[CATextLayer setFrame:](self->_exitReasonNamespaceTextLayer, "setFrame:", v8, 0.0, v10);
  [(CATextLayer *)self->_exitReasonNamespaceTextLayer frame];
  double v12 = v11;
  [(CATextLayer *)self->_exitReasonNamespaceTextLayer frame];
  double v14 = self->_spaceBetweenTextLayers + v12 + v13;
  [(CATextLayer *)self->_exitReasonCodeTextLayer preferredFrameSize];
  double v16 = v15;
  [(ExitReasonLayer *)self frame];
  -[CATextLayer setFrame:](self->_exitReasonCodeTextLayer, "setFrame:", v14, 0.0, v16);
}

- (double)spaceBetweenTextLayers
{
  return self->_spaceBetweenTextLayers;
}

- (CATextLayer)exitReasonNamespaceTextLayer
{
  return self->_exitReasonNamespaceTextLayer;
}

- (CATextLayer)exitReasonCodeTextLayer
{
  return self->_exitReasonCodeTextLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonCodeTextLayer, 0);

  objc_storeStrong((id *)&self->_exitReasonNamespaceTextLayer, 0);
}

@end