@interface AXSiriShortcut
- (UIImage)glyphImage;
@end

@implementation AXSiriShortcut

- (UIImage)glyphImage
{
  v9.width = 50.0;
  v9.height = 50.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  v3 = objc_opt_new();
  [v3 setDrawBackground:0];
  [v3 setDark:1];
  [v3 setHighContrast:1];
  id v4 = [objc_alloc((Class)WFColor) initWithSystemColor:21];
  [v3 setGlyphColor:v4];

  objc_msgSend(v3, "setGlyphCharacter:", -[AXSiriShortcut glyphCharacter](self, "glyphCharacter"));
  v5 = +[WFBitmapContext currentContextWithScale:0.0];
  objc_msgSend(v3, "drawInContext:inRect:", v5, 10.0, 10.0, 30.0, 30.0);

  v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return (UIImage *)v6;
}

@end