@interface NTKGalleonSignalStrengthView
- (NTKGalleonColorPalette)palette;
- (NTKGalleonSignalStrengthView)initWithFrame:(CGRect)a3;
- (void)setPalette:(id)a3;
@end

@implementation NTKGalleonSignalStrengthView

- (NTKGalleonSignalStrengthView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x263F579D0]);
  objc_msgSend_setDotDiameter_(v8, v9, v10, v11, 7.5);
  v14.receiver = self;
  v14.super_class = (Class)NTKGalleonSignalStrengthView;
  v12 = -[NTKExplorerStatusView initWithFrame:dotLayoutConstraints:dotColorOptions:](&v14, sel_initWithFrame_dotLayoutConstraints_dotColorOptions_, v8, 0, x, y, width, height);

  return v12;
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  id v5 = a3;
  id v20 = objc_alloc_init(MEMORY[0x263F579C8]);
  v9 = objc_msgSend_signalStrengthColor(v5, v6, v7, v8);
  objc_msgSend_setConnectedDotColor_(v20, v10, (uint64_t)v9, v11);

  v15 = objc_msgSend_signalStrengthColor(v5, v12, v13, v14);

  objc_msgSend_setNoServiceDotColor_(v20, v16, (uint64_t)v15, v17);
  objc_msgSend_setDotColorOptions_(self, v18, (uint64_t)v20, v19);
}

- (NTKGalleonColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
}

@end