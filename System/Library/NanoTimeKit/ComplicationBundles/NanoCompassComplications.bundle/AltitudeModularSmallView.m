@interface AltitudeModularSmallView
- (CLKDevice)device;
- (UIImageView)lowerImage;
- (UIImageView)upperImage;
- (UILabel)label;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (void)setDevice:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLowerImage:(id)a3;
- (void)setUpperImage:(id)a3;
@end

@implementation AltitudeModularSmallView

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AltitudeModularSmallView;
  v5 = [(AltitudeModularSmallView *)&v16 init];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setDevice_(v5, v6, (uint64_t)v4, v7);
    v12 = objc_msgSend_greenColor(MEMORY[0x263F1C550], v9, v10, v11);
    objc_msgSend_setBackgroundColor_(v8, v13, (uint64_t)v12, v14);
  }
  return v8;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (UIImageView)upperImage
{
  return self->_upperImage;
}

- (void)setUpperImage:(id)a3
{
}

- (UIImageView)lowerImage
{
  return self->_lowerImage;
}

- (void)setLowerImage:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lowerImage, 0);
  objc_storeStrong((id *)&self->_upperImage, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end