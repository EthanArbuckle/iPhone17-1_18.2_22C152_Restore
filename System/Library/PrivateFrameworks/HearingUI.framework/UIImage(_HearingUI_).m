@interface UIImage(_HearingUI_)
- (id)resizeHearingImageToNewSize:()_HearingUI_;
@end

@implementation UIImage(_HearingUI_)

- (id)resizeHearingImageToNewSize:()_HearingUI_
{
  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__UIImage__HearingUI___resizeHearingImageToNewSize___block_invoke;
  v9[3] = &unk_2647CD898;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  v7 = [v6 imageWithActions:v9];

  return v7;
}

@end