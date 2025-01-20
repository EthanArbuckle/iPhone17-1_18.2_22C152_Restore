@interface MUPunchoutViewModel
+ (id)viewModelForAddPhotos;
+ (id)viewModelForFullScreenGallery;
+ (id)viewModelForVendorName:(id)a3;
- (NSString)punchoutText;
- (NSString)symbolName;
- (UIMenu)menu;
- (void)setMenu:(id)a3;
- (void)setPunchoutText:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation MUPunchoutViewModel

+ (id)viewModelForVendorName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MUPunchoutViewModel);
  [(MUPunchoutViewModel *)v4 setSymbolName:@"arrow.up.forward.app.fill"];
  v5 = NSString;
  v6 = _MULocalizedStringFromThisBundle(@"Open %@ [Place Card]");
  v7 = objc_msgSend(v5, "stringWithFormat:", v6, v3);

  [(MUPunchoutViewModel *)v4 setPunchoutText:v7];
  return v4;
}

+ (id)viewModelForAddPhotos
{
  v2 = objc_alloc_init(MUPunchoutViewModel);
  [(MUPunchoutViewModel *)v2 setSymbolName:@"camera.fill"];
  id v3 = _MULocalizedStringFromThisBundle(@"Add Photo [Place Card]");
  [(MUPunchoutViewModel *)v2 setPunchoutText:v3];

  return v2;
}

+ (id)viewModelForFullScreenGallery
{
  v2 = objc_alloc_init(MUPunchoutViewModel);
  [(MUPunchoutViewModel *)v2 setSymbolName:@"photo.on.rectangle"];
  id v3 = _MULocalizedStringFromThisBundle(@"More Photos [Place Card]");
  [(MUPunchoutViewModel *)v2 setPunchoutText:v3];

  return v2;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)punchoutText
{
  return self->_punchoutText;
}

- (void)setPunchoutText:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_punchoutText, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end