@interface UITopoView
- (CGSize)intrinsicContentSize;
- (NetTopoMiniStaticLayout)netTopoMiniStaticLayout;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNetTopoMiniStaticLayout:(id)a3;
@end

@implementation UITopoView

- (void)dealloc
{
  objc_msgSend_setNetTopoMiniStaticLayout_(self, a2, 0);
  v3.receiver = self;
  v3.super_class = (Class)UITopoView;
  [(UITopoView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = objc_msgSend_layer(self, a2, v2);
  objc_msgSend_bounds(v3, v4, v5);
  double v7 = v6;
  double v8 = *MEMORY[0x263F1D7C8];
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend_frame(self, a2, v3);
  double v10 = v9;
  double v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)UITopoView;
  -[UITopoView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (width != v10 || height != v12)
  {
    if (objc_msgSend_netTopoMiniStaticLayout(self, v13, v14))
    {
      v18 = objc_msgSend_netTopoMiniStaticLayout(self, v16, v17);
      objc_msgSend_performLayout(v18, v19, v20);
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend_bounds(self, a2, v3);
  double v10 = v9;
  double v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)UITopoView;
  -[UITopoView setBounds:](&v21, sel_setBounds_, x, y, width, height);
  if (width != v10 || height != v12)
  {
    if (objc_msgSend_netTopoMiniStaticLayout(self, v13, v14))
    {
      v18 = objc_msgSend_netTopoMiniStaticLayout(self, v16, v17);
      objc_msgSend_performLayout(v18, v19, v20);
    }
  }
}

- (NetTopoMiniStaticLayout)netTopoMiniStaticLayout
{
  return self->netTopoMiniStaticLayout;
}

- (void)setNetTopoMiniStaticLayout:(id)a3
{
}

@end