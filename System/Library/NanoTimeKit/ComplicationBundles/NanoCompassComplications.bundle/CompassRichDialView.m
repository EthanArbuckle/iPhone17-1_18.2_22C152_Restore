@interface CompassRichDialView
- (UIView)needleAODView;
- (UIView)needleView;
- (UIView)ticksView;
- (id)_newNeedleAODView;
- (id)_newNeedleView;
- (id)_newTicksView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation CompassRichDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CompassRichDialView;
  id v3 = [(NanoCompassBaseRichView *)&v24 initFullColorImageViewWithDevice:a3];
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_ticksView(v3, v4, v5, v6);
    objc_msgSend_addSubview_(v7, v9, (uint64_t)v8, v10);

    v14 = objc_msgSend_needleView(v7, v11, v12, v13);
    objc_msgSend_addSubview_(v7, v15, (uint64_t)v14, v16);

    v20 = objc_msgSend_needleAODView(v7, v17, v18, v19);
    objc_msgSend_addSubview_(v7, v21, (uint64_t)v20, v22);
  }
  return v7;
}

- (UIView)ticksView
{
  ticksView = self->_ticksView;
  if (!ticksView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newTicksView(self, a2, v2, v3);
    v7 = self->_ticksView;
    self->_ticksView = v6;

    ticksView = self->_ticksView;
  }

  return ticksView;
}

- (UIView)needleView
{
  needleView = self->_needleView;
  if (!needleView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newNeedleView(self, a2, v2, v3);
    v7 = self->_needleView;
    self->_needleView = v6;

    needleView = self->_needleView;
  }

  return needleView;
}

- (UIView)needleAODView
{
  needleAODView = self->_needleAODView;
  if (!needleAODView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newNeedleAODView(self, a2, v2, v3);
    v7 = self->_needleAODView;
    self->_needleAODView = v6;

    needleAODView = self->_needleAODView;
  }

  return needleAODView;
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  v9 = objc_msgSend_metadata(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"heading", v11);

  uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
  int isEqual = objc_msgSend_isEqual_(v12, v17, (uint64_t)v16, v18);

  if (isEqual)
  {

    uint64_t v12 = 0;
  }
  objc_msgSend_heading(v12, v20, v21, v22);
  CGAffineTransformMakeRotation(&v58, v23 * -3.14159265 / 180.0);
  needleView = self->_needleView;
  CGAffineTransform v57 = v58;
  objc_msgSend_setTransform_(needleView, v25, (uint64_t)&v57, v26);
  v30 = objc_msgSend_metadata(v5, v27, v28, v29);
  v33 = objc_msgSend_objectForKeyedSubscript_(v30, v31, @"alwayson", v32);
  int v37 = objc_msgSend_BOOLValue(v33, v34, v35, v36);

  objc_msgSend_setHidden_(self->_needleAODView, v38, v37 ^ 1u, v39);
  v43 = objc_msgSend_metadata(v5, v40, v41, v42);

  v46 = objc_msgSend_objectForKeyedSubscript_(v43, v44, @"nodata", v45);
  int v50 = objc_msgSend_BOOLValue(v46, v47, v48, v49);

  if (v12)
  {
    uint64_t v54 = objc_msgSend_isAccurate(v12, v51, v52, v53) ^ 1 | v50 | v37;
    objc_msgSend_setHidden_(self->_needleView, v55, v54, v56);
  }
  else
  {
    objc_msgSend_setHidden_(self->_needleView, v51, 1, v53);
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CompassRichDialView;
  [(CompassRichDialView *)&v19 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  objc_msgSend_setCenter_(self->_ticksView, v10, v11, v12);
  objc_msgSend_setCenter_(self->_needleView, v13, v14, v15, v7, v9);
  objc_msgSend_setCenter_(self->_needleAODView, v16, v17, v18, v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needleAODView, 0);
  objc_storeStrong((id *)&self->_needleView, 0);

  objc_storeStrong((id *)&self->_ticksView, 0);
}

- (id)_newTicksView
{
  return 0;
}

- (id)_newNeedleView
{
  return 0;
}

- (id)_newNeedleAODView
{
  return 0;
}

@end