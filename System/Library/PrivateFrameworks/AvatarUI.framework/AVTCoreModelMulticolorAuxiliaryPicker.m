@interface AVTCoreModelMulticolorAuxiliaryPicker
- (AVTCoreModelMulticolorAuxiliaryPicker)initWithType:(id)a3 items:(id)a4;
- (NSArray)items;
- (NSString)type;
- (void)setType:(id)a3;
@end

@implementation AVTCoreModelMulticolorAuxiliaryPicker

- (AVTCoreModelMulticolorAuxiliaryPicker)initWithType:(id)a3 items:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTCoreModelMulticolorAuxiliaryPicker;
  v9 = [(AVTCoreModelMulticolorAuxiliaryPicker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_items, a4);
  }

  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end