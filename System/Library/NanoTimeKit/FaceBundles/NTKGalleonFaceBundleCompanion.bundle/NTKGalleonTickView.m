@interface NTKGalleonTickView
+ (Class)layerClass;
+ (id)galleon_newTickViewWithNumberOfTicks:(unint64_t)a3 tickSizes:(id)a4;
- ($0B56E7081CBE040606E62B6BB81BA072)sizeRange;
- (NTKGalleonTickView)initWithDialDiameter:(double)a3 numberOfTicks:(unint64_t)a4 tickSizes:(id)a5;
- (double)diameter;
- (unint64_t)numberOfTicks;
- (void)_setTickColor:(id)a3;
- (void)galleon_setProgress:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation NTKGalleonTickView

- (NTKGalleonTickView)initWithDialDiameter:(double)a3 numberOfTicks:(unint64_t)a4 tickSizes:(id)a5
{
  double var1 = a5.var1.var1;
  double var0 = a5.var1.var0;
  double v7 = a5.var0.var1;
  double v8 = a5.var0.var0;
  v81[1] = *MEMORY[0x263EF8340];
  v77.receiver = self;
  v77.super_class = (Class)NTKGalleonTickView;
  v11 = -[NTKGalleonTickView initWithFrame:](&v77, sel_initWithFrame_, 0.0, 0.0, a3, a3);
  v15 = v11;
  if (v11)
  {
    v11->_diameter = a3;
    v11->_numberOfTicks = a4;
    v11->_sizeRange.widthRange.minimum = v8;
    v11->_sizeRange.widthRange.maximum = v7;
    v11->_sizeRange.heightRange.minimum = var0;
    v11->_sizeRange.heightRange.maximum = var1;
    v16 = objc_msgSend_layer(v11, v12, v13, v14);
    v80 = @"instanceColor";
    v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18, v19);
    v81[0] = v20;
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)v81, (uint64_t)&v80, 1);
    objc_msgSend_setActions_(v16, v23, (uint64_t)v22, v24);

    objc_msgSend_setFillMode_(v16, v25, *MEMORY[0x263F15AA8], v26);
    objc_msgSend_whiteColor(MEMORY[0x263F1C550], v27, v28, v29);
    id v30 = objc_claimAutoreleasedReturnValue();
    uint64_t v34 = objc_msgSend_CGColor(v30, v31, v32, v33);
    objc_msgSend_setInstanceColor_(v16, v35, v34, v36);

    objc_msgSend_setInstanceCount_(v16, v37, a4, v38);
    CATransform3DMakeRotation(&v76, 6.28318531 / (double)a4, 0.0, 0.0, 1.0);
    objc_msgSend_setInstanceTransform_(v16, v39, (uint64_t)&v76, v40);
    v44 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v41, v42, v43);
    objc_msgSend_screenScale(v44, v45, v46, v47);
    objc_msgSend_setRasterizationScale_(v16, v48, v49, v50);

    v54 = objc_msgSend_null(MEMORY[0x263EFF9D0], v51, v52, v53);
    v78[0] = @"affineTransform";
    v78[1] = @"backgroundColor";
    v79[0] = v54;
    v79[1] = v54;
    v78[2] = @"bounds";
    v78[3] = @"contentsMultiplyColor";
    v79[2] = v54;
    v79[3] = v54;
    v78[4] = @"hidden";
    v78[5] = @"instanceCount";
    v79[4] = v54;
    v79[5] = v54;
    v78[6] = @"instanceDelay";
    v78[7] = @"instanceTransform";
    v79[6] = v54;
    v79[7] = v54;
    v78[8] = @"opacity";
    v78[9] = @"position";
    v79[8] = v54;
    v79[9] = v54;
    v78[10] = @"transform";
    v79[10] = v54;
    v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v55, (uint64_t)v79, (uint64_t)v78, 11);
    uint64_t v60 = objc_msgSend_layer(MEMORY[0x263F157E8], v57, v58, v59);
    tickLayer = v15->_tickLayer;
    v15->_tickLayer = (CALayer *)v60;

    objc_msgSend_setActions_(v15->_tickLayer, v62, (uint64_t)v56, v63);
    objc_msgSend_addSublayer_(v16, v64, (uint64_t)v15->_tickLayer, v65);
    v69 = objc_msgSend_tintColor(v15, v66, v67, v68);
    objc_msgSend__setTickColor_(v15, v70, (uint64_t)v69, v71);

    objc_msgSend_galleon_setProgress_(v15, v72, v73, v74, 0.0);
  }
  return v15;
}

- (void)_setTickColor:(id)a3
{
  tickLayer = self->_tickLayer;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_CGColor(v4, v5, v6, v7);

  objc_msgSend_setBackgroundColor_(tickLayer, v8, v9, v10);
}

- (void)galleon_setProgress:(double)a3
{
  double v4 = NTKGalleonTickSizePercentageValue(self->_sizeRange.widthRange.minimum, self->_sizeRange.widthRange.maximum, self->_sizeRange.heightRange.minimum, self->_sizeRange.heightRange.maximum, a3);
  double v6 = v5;
  objc_msgSend_bounds(self->_tickLayer, v7, v8, v9);
  if (v4 != v14 || v6 != v13)
  {
    objc_msgSend_setBounds_(self->_tickLayer, v10, v11, v12, 0.0, 0.0, v4, v6);
    if (v4 >= v6) {
      double v19 = v6;
    }
    else {
      double v19 = v4;
    }
    objc_msgSend_setCornerRadius_(self->_tickLayer, v16, v17, v18, v19 * 0.5);
    tickLayer = self->_tickLayer;
    double v24 = self->_diameter * 0.5;
    objc_msgSend_setPosition_(tickLayer, v20, v21, v22, v24, v6 * 0.5);
  }
}

- (void)setTintColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKGalleonTickView;
  id v4 = a3;
  [(NTKGalleonTickView *)&v7 setTintColor:v4];
  objc_msgSend__setTickColor_(self, v5, (uint64_t)v4, v6, v7.receiver, v7.super_class);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- ($0B56E7081CBE040606E62B6BB81BA072)sizeRange
{
  double minimum = self->_sizeRange.widthRange.minimum;
  double maximum = self->_sizeRange.widthRange.maximum;
  double v4 = self->_sizeRange.heightRange.minimum;
  double v5 = self->_sizeRange.heightRange.maximum;
  result.var1.double var1 = v5;
  result.var1.double var0 = v4;
  result.var0.double var1 = maximum;
  result.var0.double var0 = minimum;
  return result;
}

- (double)diameter
{
  return self->_diameter;
}

- (unint64_t)numberOfTicks
{
  return self->_numberOfTicks;
}

- (void).cxx_destruct
{
}

+ (id)galleon_newTickViewWithNumberOfTicks:(unint64_t)a3 tickSizes:(id)a4
{
  double var1 = a4.var1.var1;
  double var0 = a4.var1.var0;
  double v6 = a4.var0.var1;
  double v7 = a4.var0.var0;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  _NTKGalleonLayoutConstants(&v19);
  double v9 = *(double *)&v19;
  double v10 = *(double *)&v19 + *(double *)&v20 * -2.0;
  uint64_t v11 = [NTKGalleonTickView alloc];
  double v14 = objc_msgSend_initWithDialDiameter_numberOfTicks_tickSizes_(v11, v12, a3, v13, v10, v7, v6, var0, var1);
  objc_msgSend_setCenter_(v14, v15, v16, v17, v9 * 0.5, v9 * 0.5);

  return v14;
}

@end