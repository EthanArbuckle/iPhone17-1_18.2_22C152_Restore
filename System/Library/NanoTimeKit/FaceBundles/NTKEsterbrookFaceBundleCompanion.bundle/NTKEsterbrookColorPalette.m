@interface NTKEsterbrookColorPalette
- (BOOL)isMulticolor;
- (BOOL)isSundayOption;
- (NTKEsterbrookColorPalette)init;
- (id)swatch;
@end

@implementation NTKEsterbrookColorPalette

- (NTKEsterbrookColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKEsterbrookColorPalette;
  return [(NTKFaceColorPalette *)&v5 initWithFaceClass:v3];
}

- (BOOL)isMulticolor
{
  v4 = objc_msgSend_configuration(self, a2, v2, v3);
  v8 = objc_msgSend_colorOption(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"sunday", v10);

  return isEqualToString;
}

- (BOOL)isSundayOption
{
  v4 = objc_msgSend_configuration(self, a2, v2, v3);
  v8 = objc_msgSend_colorOption(v4, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, @"sunday", v10);

  return isEqualToString;
}

- (id)swatch
{
  return (id)((uint64_t (*)(NTKEsterbrookColorPalette *, char *))MEMORY[0x270F9A6D0])(self, sel_background);
}

@end