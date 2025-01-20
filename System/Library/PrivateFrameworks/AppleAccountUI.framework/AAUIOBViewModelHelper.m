@interface AAUIOBViewModelHelper
+ (id)labelWithAttributedString:(id)a3;
@end

@implementation AAUIOBViewModelHelper

+ (id)labelWithAttributedString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setNumberOfLines:0];
  [v6 setTextAlignment:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAttributedText:v4];

  return v6;
}

@end