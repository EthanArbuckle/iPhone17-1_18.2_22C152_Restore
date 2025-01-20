@interface MKAppleLogoLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4;
- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4 alternativeStringDrawing:(BOOL)a5;
- (void)drawRect:(CGRect)a3;
- (void)updateForMapType:(unint64_t)a3 darkMode:(BOOL)a4;
@end

@implementation MKAppleLogoLabel

- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4
{
  return [(MKAppleLogoLabel *)self initForMapType:a3 forDarkMode:a4 alternativeStringDrawing:0];
}

- (id)initForMapType:(unint64_t)a3 forDarkMode:(BOOL)a4 alternativeStringDrawing:(BOOL)a5
{
  BOOL v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKAppleLogoLabel;
  v8 = [(MKAppleLogoLabel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_useAlternativeStringDrawing = a5;
    [(MKAppleLogoLabel *)v8 setOpaque:0];
    v10 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKAppleLogoLabel *)v9 setBackgroundColor:v10];

    [(MKAppleLogoLabel *)v9 updateForMapType:a3 darkMode:v6];
    v11 = v9;
  }

  return v9;
}

- (void)updateForMapType:(unint64_t)a3 darkMode:(BOOL)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  v7 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0 weight:*MEMORY[0x1E4F43920]];
  if (a3 - 1 < 4 || a3 == 107 || a4)
  {
    v8 = [MEMORY[0x1E4F428B8] whiteColor];
    int v33 = 1;
  }
  else
  {
    v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.600000024];
    int v33 = 0;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F42698]);
  v10 = objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_systemImageNamed:", @"applelogo");
  v11 = (void *)MEMORY[0x1E4F42A98];
  [v7 pointSize];
  v36 = objc_msgSend(v11, "_mapkit_configurationWithPointSize:weight:scale:", 1);
  v12 = objc_msgSend(v10, "_mapkit_imageWithSymbolConfiguration:");

  v35 = v12;
  objc_super v13 = [v12 imageWithTintColor:v8];
  [v9 setImage:v13];

  v14 = objc_opt_new();
  v34 = v9;
  v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
  [v14 appendAttributedString:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  v17 = _MKLocalizedStringFromThisBundle(@"[MapKit] Apple Maps Brand Mark");
  v18 = (void *)[v16 initWithString:v17];
  [v14 appendAttributedString:v18];

  v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  v20 = [v19 languageCode];
  int v21 = [v20 isEqualToString:@"en"];

  if (v21)
  {
    uint64_t v41 = *MEMORY[0x1E4F42520];
    v42[0] = &unk_1ED97DFE0;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    objc_msgSend(v14, "addAttributes:range:", v22, 1, objc_msgSend(v14, "length") - 1);
  }
  v23 = (void *)[v14 mutableCopy];
  uint64_t v24 = *MEMORY[0x1E4F42508];
  v40[0] = v7;
  uint64_t v25 = *MEMORY[0x1E4F42510];
  v39[0] = v24;
  v39[1] = v25;
  v26 = [MEMORY[0x1E4F428B8] clearColor];
  v40[1] = v26;
  v39[2] = *MEMORY[0x1E4F42570];
  v27 = [MEMORY[0x1E4F428B8] blackColor];
  v39[3] = *MEMORY[0x1E4F42578];
  v40[2] = v27;
  v40[3] = &unk_1ED97E808;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
  objc_msgSend(v23, "addAttributes:range:", v28, 0, objc_msgSend(v23, "length"));

  if (v33) {
    v29 = (void *)[v23 copy];
  }
  else {
    v29 = 0;
  }
  objc_storeStrong((id *)&self->_strokeText, v29);
  if (v33) {

  }
  v37[0] = v24;
  v37[1] = v25;
  v38[0] = v7;
  v38[1] = v8;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  objc_msgSend(v14, "addAttributes:range:", v30, 0, objc_msgSend(v14, "length"));

  v31 = (NSAttributedString *)[v14 copy];
  innerText = self->_innerText;
  self->_innerText = v31;

  [(UIView *)self _mapKit_setNeedsDisplay];
  [(MKAppleLogoLabel *)self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_strokeText, "boundingRectWithSize:options:context:", 0, 0);
  double v7 = v6;
  double v9 = v8;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_innerText, "boundingRectWithSize:options:context:", 0, 0, width, height);
  if (v7 <= v10) {
    double v12 = v10;
  }
  else {
    double v12 = v7;
  }
  if (v9 <= v11) {
    double v13 = v11;
  }
  else {
    double v13 = v9;
  }
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[MKAppleLogoLabel sizeThatFits:](self, "sizeThatFits:", 1000.0, 1000.0);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MKAppleLogoLabel;
  -[MKAppleLogoLabel drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL useAlternativeStringDrawing = self->_useAlternativeStringDrawing;
  strokeText = self->_strokeText;
  [(MKAppleLogoLabel *)self bounds];
  if (useAlternativeStringDrawing)
  {
    -[NSAttributedString drawAtPoint:](strokeText, "drawAtPoint:");
    innerText = self->_innerText;
    [(MKAppleLogoLabel *)self bounds];
    -[NSAttributedString drawAtPoint:](innerText, "drawAtPoint:");
  }
  else
  {
    -[NSAttributedString drawInRect:](strokeText, "drawInRect:");
    double v7 = self->_innerText;
    [(MKAppleLogoLabel *)self bounds];
    -[NSAttributedString drawInRect:](v7, "drawInRect:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerText, 0);

  objc_storeStrong((id *)&self->_strokeText, 0);
}

@end