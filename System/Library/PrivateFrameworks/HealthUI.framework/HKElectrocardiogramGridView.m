@interface HKElectrocardiogramGridView
- (CAShapeLayer)controlSignalLayer;
- (CGSize)majorGridSize;
- (CGSize)unitSize;
- (HKElectrocardiogramGridView)initWithUnitSize:(CGSize)a3 grids:(id)a4;
- (NSArray)grids;
- (NSMutableArray)gridLayers;
- (UIBezierPath)controlSignalPath;
- (void)_createLayers;
- (void)layoutSubviews;
- (void)setControlSignalLayer:(id)a3;
- (void)setControlSignalPath:(id)a3;
- (void)setGridLayers:(id)a3;
- (void)setGrids:(id)a3;
- (void)setUnitSize:(CGSize)a3;
@end

@implementation HKElectrocardiogramGridView

- (HKElectrocardiogramGridView)initWithUnitSize:(CGSize)a3 grids:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogramGridView;
  v8 = -[HKElectrocardiogramGridView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_unitSize.CGFloat width = width;
    v8->_unitSize.CGFloat height = height;
    uint64_t v10 = [v7 copy];
    grids = v9->_grids;
    v9->_grids = (NSArray *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    gridLayers = v9->_gridLayers;
    v9->_gridLayers = v12;
  }
  return v9;
}

- (void)setUnitSize:(CGSize)a3
{
  self->_unitSize = a3;
  [(HKElectrocardiogramGridView *)self setNeedsLayout];
}

- (CGSize)majorGridSize
{
  [(HKElectrocardiogramGridView *)self unitSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(HKElectrocardiogramGridView *)self grids];
  v8 = [v7 firstObject];
  v9 = v8;
  if (v8)
  {
    [v8 scale];
    double v10 = v19;
    double v11 = v18;
    double v12 = v21;
    double v13 = v20;
  }
  else
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
  }
  double v14 = v6 * v13 + v11 * v4;
  double v15 = v6 * v12 + v10 * v4;

  double v16 = v14;
  double v17 = v15;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)setControlSignalPath:(id)a3
{
  objc_storeStrong((id *)&self->_controlSignalPath, a3);
  [(HKElectrocardiogramGridView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramGridView;
  [(HKElectrocardiogramGridView *)&v3 layoutSubviews];
  [(HKElectrocardiogramGridView *)self _createLayers];
}

- (void)_createLayers
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  objc_super v3 = [(HKElectrocardiogramGridView *)self gridLayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v89 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v88 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v88 objects:v93 count:16];
    }
    while (v5);
  }

  v8 = [(HKElectrocardiogramGridView *)self gridLayers];
  [v8 removeAllObjects];

  v9 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
  [v9 removeFromSuperlayer];

  [(HKElectrocardiogramGridView *)self setControlSignalLayer:0];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = [(HKElectrocardiogramGridView *)self grids];
  uint64_t v10 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  unint64_t v11 = 0x1E4F39000uLL;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v85 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v84 + 1) + 8 * j);
        [(HKElectrocardiogramGridView *)self unitSize];
        double v17 = v16;
        double v19 = v18;
        if (v15)
        {
          [v15 scale];
          double v20 = *((double *)&v81 + 1);
          double v21 = *(double *)&v81;
          double v22 = *((double *)&v82 + 1);
          double v23 = *(double *)&v82;
        }
        else
        {
          long long v82 = 0u;
          long long v83 = 0u;
          double v22 = 0.0;
          double v20 = 0.0;
          double v23 = 0.0;
          double v21 = 0.0;
          long long v81 = 0u;
        }
        double v24 = v19 * v23 + v21 * v17;
        double v25 = v19 * v22 + v20 * v17;
        v26 = *(void **)(v11 + 3208);
        [(HKElectrocardiogramGridView *)self bounds];
        double v28 = v27;
        [v15 lineWidth];
        v30 = [v26 horizontalLineLayerWithLength:v28 lineWidth:v29];
        [v30 setFillColor:0];
        id v31 = [v15 lineColor];
        objc_msgSend(v30, "setStrokeColor:", objc_msgSend(v31, "CGColor"));

        v32 = *(void **)(v11 + 3208);
        [(HKElectrocardiogramGridView *)self bounds];
        double v34 = v33;
        [v15 lineWidth];
        v36 = [v32 verticalLineLayerWithLength:v34 lineWidth:v35];
        [v36 setFillColor:0];
        id v37 = [v15 lineColor];
        objc_msgSend(v36, "setStrokeColor:", objc_msgSend(v37, "CGColor"));

        id v38 = objc_alloc_init(MEMORY[0x1E4F39C68]);
        v73 = v30;
        [v38 addSublayer:v30];
        [(HKElectrocardiogramGridView *)self bounds];
        objc_msgSend(v38, "setInstanceCount:", (uint64_t)HKUIRoundedDivide(v39, v25, 0.01) + 1);
        CATransform3DMakeTranslation(&v80, 0.0, v25, 0.0);
        CATransform3D v79 = v80;
        [v38 setInstanceTransform:&v79];
        id v40 = objc_alloc_init(MEMORY[0x1E4F39C68]);
        [v40 addSublayer:v36];
        [(HKElectrocardiogramGridView *)self bounds];
        objc_msgSend(v40, "setInstanceCount:", (uint64_t)HKUIRoundedDivide(v41, v24, 0.01) + 1);
        CATransform3DMakeTranslation(&v78, v24, 0.0, 0.0);
        CATransform3D v77 = v78;
        [v40 setInstanceTransform:&v77];
        if ([v15 axis])
        {
          [(HKElectrocardiogramGridView *)self layer];
          uint64_t v42 = v12;
          uint64_t v43 = v13;
          v45 = unint64_t v44 = v11;
          [v45 insertSublayer:v38 atIndex:0];

          v46 = [(HKElectrocardiogramGridView *)self gridLayers];
          [v46 addObject:v38];

          unint64_t v11 = v44;
          uint64_t v13 = v43;
          uint64_t v12 = v42;
        }
        if (([v15 axis] & 2) != 0)
        {
          v47 = [(HKElectrocardiogramGridView *)self layer];
          [v47 insertSublayer:v40 atIndex:0];

          v48 = [(HKElectrocardiogramGridView *)self gridLayers];
          [v48 addObject:v40];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v12);
  }

  v49 = [(HKElectrocardiogramGridView *)self controlSignalPath];

  if (v49)
  {
    id v50 = objc_alloc_init(*(Class *)(v11 + 3208));
    [(HKElectrocardiogramGridView *)self setControlSignalLayer:v50];

    v51 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v51 setFillColor:0];

    v52 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v52 setLineWidth:1.0];

    id v53 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
    uint64_t v54 = [v53 CGColor];
    v55 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v55 setStrokeColor:v54];

    uint64_t v56 = *MEMORY[0x1E4F3A478];
    v57 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v57 setLineJoin:v56];

    id v58 = [(HKElectrocardiogramGridView *)self controlSignalPath];
    uint64_t v59 = [v58 CGPath];
    v60 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v60 setPath:v59];

    [(HKElectrocardiogramGridView *)self bounds];
    CGFloat v61 = CGRectGetHeight(v95) * 0.5;
    [(HKElectrocardiogramGridView *)self unitSize];
    double v63 = round(v61 / v62);
    [(HKElectrocardiogramGridView *)self unitSize];
    long long v65 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&v75.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v75.m33 = v65;
    long long v66 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v75.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v75.m43 = v66;
    long long v67 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v75.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v75.m13 = v67;
    long long v68 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v75.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v75.m23 = v68;
    CATransform3DTranslate(&v76, &v75, 0.0, v64 * v63, 0.0);
    v69 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    CATransform3D v74 = v76;
    [v69 setTransform:&v74];

    v70 = [(HKElectrocardiogramGridView *)self layer];
    v71 = [(HKElectrocardiogramGridView *)self controlSignalLayer];
    [v70 addSublayer:v71];
  }
}

- (CGSize)unitSize
{
  double width = self->_unitSize.width;
  double height = self->_unitSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)grids
{
  return self->_grids;
}

- (void)setGrids:(id)a3
{
}

- (UIBezierPath)controlSignalPath
{
  return self->_controlSignalPath;
}

- (NSMutableArray)gridLayers
{
  return self->_gridLayers;
}

- (void)setGridLayers:(id)a3
{
}

- (CAShapeLayer)controlSignalLayer
{
  return self->_controlSignalLayer;
}

- (void)setControlSignalLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlSignalLayer, 0);
  objc_storeStrong((id *)&self->_gridLayers, 0);
  objc_storeStrong((id *)&self->_controlSignalPath, 0);
  objc_storeStrong((id *)&self->_grids, 0);
}

@end