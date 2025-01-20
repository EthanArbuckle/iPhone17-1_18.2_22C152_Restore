@interface UIColor
@end

@implementation UIColor

void __51__UIColor_DOCTag___doc_underlyingColorForTagColor___block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v0 = +[DOCTagAppearance renderingAppearance];
  v1 = [v0 underlyingColorForNoneTag];
  v11[0] = v1;
  v2 = [MEMORY[0x263F825C8] systemGrayColor];
  v11[1] = v2;
  v3 = [MEMORY[0x263F825C8] systemGreenColor];
  v11[2] = v3;
  v4 = [MEMORY[0x263F825C8] systemPurpleColor];
  v11[3] = v4;
  v5 = [MEMORY[0x263F825C8] systemBlueColor];
  v11[4] = v5;
  v6 = [MEMORY[0x263F825C8] systemYellowColor];
  v11[5] = v6;
  v7 = [MEMORY[0x263F825C8] systemRedColor];
  v11[6] = v7;
  v8 = [MEMORY[0x263F825C8] systemOrangeColor];
  v11[7] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:8];
  v10 = (void *)_doc_underlyingColorForTagColor__colors;
  _doc_underlyingColorForTagColor__colors = v9;
}

@end