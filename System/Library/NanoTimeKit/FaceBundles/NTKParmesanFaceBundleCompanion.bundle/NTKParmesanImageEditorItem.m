@interface NTKParmesanImageEditorItem
+ (id)_newLocalIdentifier;
- (BOOL)canRevert;
- (NSString)identifier;
- (NTKParmesanImageEditorItem)initWithImage:(id)a3 layout:(id)a4;
- (NTKParmesanLayoutUserOverride)layout;
- (UIImage)image;
- (id)description;
- (void)setCanRevert:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation NTKParmesanImageEditorItem

+ (id)_newLocalIdentifier
{
  v4 = NSString;
  v5 = objc_msgSend_UUID(MEMORY[0x263F08C38], a2, v2, v3);
  v9 = objc_msgSend_UUIDString(v5, v6, v7, v8);
  v12 = objc_msgSend_stringWithFormat_(v4, v10, @"TransientImage-%@", v11, v9);

  return v12;
}

- (NTKParmesanImageEditorItem)initWithImage:(id)a3 layout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKParmesanImageEditorItem;
  v9 = [(NTKParmesanImageEditorItem *)&v17 init];
  if (v9)
  {
    v10 = objc_opt_class();
    uint64_t v14 = objc_msgSend__newLocalIdentifier(v10, v11, v12, v13);
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong((id *)&v9->_layout, a4);
    v9->_canRevert = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@:%p> image = %@, layout = %@, canRevert = %d", v7, v5, self, self->_image, self->_layout, self->_canRevert);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NTKParmesanLayoutUserOverride)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)canRevert
{
  return self->_canRevert;
}

- (void)setCanRevert:(BOOL)a3
{
  self->_canRevert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end