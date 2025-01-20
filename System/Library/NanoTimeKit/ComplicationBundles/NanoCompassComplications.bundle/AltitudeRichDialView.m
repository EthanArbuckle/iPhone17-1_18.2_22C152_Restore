@interface AltitudeRichDialView
- (UIView)bottomView;
- (UIView)topView;
- (id)_newBottomView;
- (id)_newTopView;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)monochromeAccentViews;
- (id)monochromeOtherViews;
- (void)layoutSubviews;
@end

@implementation AltitudeRichDialView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)AltitudeRichDialView;
  v3 = [(AltitudeRichDialView *)&v18 init];
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_topView(v3, v4, v5, v6);
    objc_msgSend_addSubview_(v7, v9, (uint64_t)v8, v10);

    v14 = objc_msgSend_bottomView(v7, v11, v12, v13);
    objc_msgSend_addSubview_(v7, v15, (uint64_t)v14, v16);
  }
  return v7;
}

- (UIView)topView
{
  topView = self->_topView;
  if (!topView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newTopView(self, a2, v2, v3);
    v7 = self->_topView;
    self->_topView = v6;

    topView = self->_topView;
  }

  return topView;
}

- (UIView)bottomView
{
  bottomView = self->_bottomView;
  if (!bottomView)
  {
    uint64_t v6 = (UIView *)objc_msgSend__newBottomView(self, a2, v2, v3);
    v7 = self->_bottomView;
    self->_bottomView = v6;

    bottomView = self->_bottomView;
  }

  return bottomView;
}

- (id)monochromeAccentViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_topView;
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (id)monochromeOtherViews
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_bottomView;
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 1);

  return v2;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)AltitudeRichDialView;
  [(AltitudeRichDialView *)&v16 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  objc_msgSend_setCenter_(self->_topView, v10, v11, v12);
  objc_msgSend_setCenter_(self->_bottomView, v13, v14, v15, v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);

  objc_storeStrong((id *)&self->_topView, 0);
}

- (id)_newTopView
{
  return 0;
}

- (id)_newBottomView
{
  return 0;
}

@end