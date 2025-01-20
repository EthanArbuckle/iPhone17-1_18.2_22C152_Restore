@interface AAUIInheritanceAccessKeyPDFGenerator
- (AAUIInheritanceAccessKeyPDFGenerator)initWithAppleAccount:(id)a3 localContactInfo:(id)a4;
- (double)_renderAccountDetailsWithPageRect:(CGRect)a3 yPosition:(double)a4;
- (double)_renderMessageWithPageRect:(CGRect)a3 yPosition:(double)a4;
- (double)_renderQRCodeImageWithPageRect:(CGRect)a3 yPosition:(double)a4;
- (double)_renderRectBoxWithPageRect:(CGRect)a3 yPosition:(double)a4 drawContext:(CGContext *)a5;
- (double)_renderTitleWithPageRect:(CGRect)a3;
- (id)_attributedStringWithField:(id)a3 value:(id)a4;
- (id)_pdfMetaData;
- (id)createPDFDocumentData;
- (void)_renderAccessKeyWithPageRect:(CGRect)a3 yPosition:(double)a4;
- (void)_renderFooterWithPageRect:(CGRect)a3 yPosition:(double)a4;
- (void)_renderLogoImageWithPageRect:(CGRect)a3;
@end

@implementation AAUIInheritanceAccessKeyPDFGenerator

- (AAUIInheritanceAccessKeyPDFGenerator)initWithAppleAccount:(id)a3 localContactInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AAUIInheritanceAccessKeyPDFGenerator;
  v8 = [(AAUIInheritanceAccessKeyPDFGenerator *)&v28 init];
  if (v8)
  {
    if (([v7 contactType] & 4) != 0)
    {
      uint64_t v16 = objc_msgSend(v6, "aa_fullName");
      ownerDisplayName = v8->_ownerDisplayName;
      v8->_ownerDisplayName = (NSString *)v16;

      uint64_t v18 = objc_msgSend(v6, "aa_firstName");
      ownerFirstName = v8->_ownerFirstName;
      v8->_ownerFirstName = (NSString *)v18;

      uint64_t v20 = objc_msgSend(v6, "aa_primaryEmail");
      ownerEmailAddress = v8->_ownerEmailAddress;
      v8->_ownerEmailAddress = (NSString *)v20;

      uint64_t v15 = [v7 displayName];
    }
    else
    {
      if (([v7 contactType] & 8) == 0)
      {
LABEL_7:
        id v23 = objc_alloc(MEMORY[0x263F25880]);
        v24 = [v7 inheritanceContactInfo];
        uint64_t v25 = objc_msgSend(v23, "initWithContactInfo:contactType:", v24, objc_msgSend(v7, "contactType"));
        contactController = v8->_contactController;
        v8->_contactController = (AAInheritanceContactController *)v25;

        goto LABEL_8;
      }
      uint64_t v9 = [v7 displayName];
      v10 = v8->_ownerDisplayName;
      v8->_ownerDisplayName = (NSString *)v9;

      uint64_t v11 = [v7 firstName];
      v12 = v8->_ownerFirstName;
      v8->_ownerFirstName = (NSString *)v11;

      uint64_t v13 = [v7 handle];
      v14 = v8->_ownerEmailAddress;
      v8->_ownerEmailAddress = (NSString *)v13;

      uint64_t v15 = objc_msgSend(v6, "aa_fullName");
    }
    contactDisplayName = v8->_contactDisplayName;
    v8->_contactDisplayName = (NSString *)v15;

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (id)createPDFDocumentData
{
  id v3 = objc_alloc_init(MEMORY[0x263F827C0]);
  v4 = [(AAUIInheritanceAccessKeyPDFGenerator *)self _pdfMetaData];
  [v3 setDocumentInfo:v4];

  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F827B8]), "initWithBounds:format:", v3, 0.0, 0.0, 612.0, 792.0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__AAUIInheritanceAccessKeyPDFGenerator_createPDFDocumentData__block_invoke;
  v8[3] = &unk_263F943C0;
  v8[5] = 0;
  v8[6] = 0;
  v8[4] = self;
  long long v9 = xmmword_2098C9130;
  id v6 = [v5 PDFDataWithActions:v8];

  return v6;
}

uint64_t __61__AAUIInheritanceAccessKeyPDFGenerator_createPDFDocumentData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 beginPage];
  objc_msgSend(*(id *)(a1 + 32), "_renderLogoImageWithPageRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_renderTitleWithPageRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_renderAccountDetailsWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v4 + 15.0);
  objc_msgSend(*(id *)(a1 + 32), "_renderMessageWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v5 + 15.0);
  double v7 = v6;
  v8 = *(void **)(a1 + 32);
  double v9 = v6 + 15.0;
  uint64_t v10 = [v3 CGContext];

  objc_msgSend(v8, "_renderRectBoxWithPageRect:yPosition:drawContext:", v10, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v9);
  double v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_renderQRCodeImageWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v7 + 30.0);
  objc_msgSend(*(id *)(a1 + 32), "_renderAccessKeyWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v13 + 15.0);
  v14 = *(void **)(a1 + 32);
  double v15 = *(double *)(a1 + 40);
  double v16 = *(double *)(a1 + 48);
  double v17 = *(double *)(a1 + 56);
  double v18 = *(double *)(a1 + 64);
  return objc_msgSend(v14, "_renderFooterWithPageRect:yPosition:", v15, v16, v17, v18, v12 + 15.0);
}

- (id)_pdfMetaData
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F00470];
  v2 = [MEMORY[0x263F259B0] printAccessKeyDocumentMessage];
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)_renderLogoImageWithPageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = [MEMORY[0x263F827E8] systemImageNamed:@"applelogo"];
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v7 = CGRectGetWidth(v20) * 0.05;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v8 = CGRectGetHeight(v21) * 0.05;
  [v18 size];
  double v10 = v7 / v9;
  [v18 size];
  double v12 = fmin(v10, v8 / v11);
  [v18 size];
  double v14 = v13 * v12;
  [v18 size];
  double v16 = v15 * v12;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v17 = CGRectGetWidth(v22) * 0.08;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  objc_msgSend(v18, "drawInRect:", v17, CGRectGetHeight(v23) * 0.035, v14, v16);
}

- (double)_renderTitleWithPageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v21[2] = *MEMORY[0x263EF8340];
  CGFloat v7 = [MEMORY[0x263F81708] systemFontOfSize:26.0 weight:*MEMORY[0x263F81840]];
  id v8 = objc_alloc_init(MEMORY[0x263F81650]);
  [v8 setAlignment:1];
  [v8 setLineBreakMode:0];
  uint64_t v9 = *MEMORY[0x263F81540];
  v20[0] = *MEMORY[0x263F814F0];
  v20[1] = v9;
  v21[0] = v7;
  v21[1] = v8;
  double v10 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v11 = objc_alloc(MEMORY[0x263F086A0]);
  double v12 = [MEMORY[0x263F259B0] printAccessKeyDocumentTitle];
  double v13 = (void *)[v11 initWithString:v12 attributes:v10];

  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v14 = CGRectGetWidth(v22) * 0.08;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v15 = CGRectGetHeight(v23) * 0.12;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v17 = v16 + CGRectGetWidth(v25) * -0.16;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v18 = CGRectGetHeight(v26) * 0.08;
  objc_msgSend(v13, "drawInRect:", v14, v15, v17, v18);

  return v15 + v18;
}

- (double)_renderAccountDetailsWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x263F089B8]);
  id v11 = [MEMORY[0x263F259B0] printAccessKeyOwnerNameField];
  double v12 = [(AAUIInheritanceAccessKeyPDFGenerator *)self _attributedStringWithField:v11 value:self->_ownerDisplayName];
  [v10 appendAttributedString:v12];

  double v13 = [MEMORY[0x263F259B0] printAccessKeyOwnerAppleIDField];
  CGFloat v14 = [(AAUIInheritanceAccessKeyPDFGenerator *)self _attributedStringWithField:v13 value:self->_ownerEmailAddress];
  [v10 appendAttributedString:v14];

  CGFloat v15 = [MEMORY[0x263F259B0] printAccessKeyBeneficiaryNameField];
  double v16 = [(AAUIInheritanceAccessKeyPDFGenerator *)self _attributedStringWithField:v15 value:self->_contactDisplayName];
  [v10 appendAttributedString:v16];

  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v17 = CGRectGetWidth(v22) * 0.08;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v18 = CGRectGetWidth(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v19 = v18 + CGRectGetWidth(v24) * -0.16;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v20 = CGRectGetHeight(v25) * 0.07;
  objc_msgSend(v10, "drawInRect:", v17, a4, v19, v20);

  return v20 + a4;
}

- (id)_attributedStringWithField:(id)a3 value:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)MEMORY[0x263F089B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  uint64_t v9 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81840]];
  id v10 = [NSString stringWithFormat:@"%@: ", v7];

  id v11 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v23 = *MEMORY[0x263F814F0];
  uint64_t v12 = v23;
  v24[0] = v9;
  double v13 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  CGFloat v14 = (void *)[v11 initWithString:v10 attributes:v13];

  [v8 appendAttributedString:v14];
  CGFloat v15 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
  double v16 = [NSString stringWithFormat:@"%@\n", v6];

  id v17 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v21 = v12;
  CGRect v22 = v15;
  double v18 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  double v19 = (void *)[v17 initWithString:v16 attributes:v18];

  [v8 appendAttributedString:v19];
  return v8;
}

- (double)_renderMessageWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v23[2] = *MEMORY[0x263EF8340];
  id v10 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
  id v11 = objc_alloc_init(MEMORY[0x263F81650]);
  [v11 setAlignment:4];
  [v11 setLineBreakMode:0];
  [v11 setParagraphSpacing:0.4];
  uint64_t v12 = *MEMORY[0x263F81540];
  v22[0] = *MEMORY[0x263F814F0];
  v22[1] = v12;
  v23[0] = v10;
  v23[1] = v11;
  double v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  CGFloat v14 = NSString;
  CGFloat v15 = [MEMORY[0x263F259B0] printAccessKeyDocumentMessage];
  double v16 = objc_msgSend(v14, "stringWithFormat:", v15, self->_ownerFirstName, self->_ownerFirstName);

  id v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v16 attributes:v13];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v18 = CGRectGetWidth(v24) * 0.08;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v19 = CGRectGetWidth(v25) + v18 * -2.0;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v20 = CGRectGetHeight(v26) * 0.26;
  objc_msgSend(v17, "drawInRect:", v18, a4, v19, v20);

  return v20 + a4;
}

- (double)_renderRectBoxWithPageRect:(CGRect)a3 yPosition:(double)a4 drawContext:(CGContext *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSaveGState(a5);
  CGContextSetLineWidth(a5, 1.0);
  id v11 = [MEMORY[0x263F825C8] lightGrayColor];
  Components = CGColorGetComponents((CGColorRef)[v11 cgColor]);
  CGContextSetStrokeColor(a5, Components);

  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v13 = CGRectGetWidth(v18) * 0.08;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v15 = v14 + CGRectGetWidth(v20) * -0.16;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v16 = CGRectGetHeight(v21) * 0.28;
  v22.origin.CGFloat x = v13;
  v22.origin.CGFloat y = a4;
  v22.size.CGFloat width = v15;
  v22.size.CGFloat height = v16;
  CGContextAddRect(a5, v22);
  CGContextStrokePath(a5);
  CGContextRestoreGState(a5);
  return v16 + a4;
}

- (double)_renderQRCodeImageWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v9 = (void *)MEMORY[0x263F827E8];
  id v10 = [(AAInheritanceContactController *)self->_contactController accessKeyQRCodeImageDataWithSize:CGRectGetWidth(a3) * 0.5];
  id v11 = [v9 imageWithData:v10];

  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v12 = CGRectGetWidth(v23) * 0.15;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v13 = CGRectGetHeight(v24) * 0.1;
  [v11 size];
  double v15 = v12 / v14;
  [v11 size];
  double v17 = fmin(v15, v13 / v16);
  [v11 size];
  double v19 = v18 * v17;
  [v11 size];
  double v21 = v20 * v17;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  objc_msgSend(v11, "drawInRect:", (CGRectGetWidth(v25) - v19) * 0.5, a4, v19, v21);

  return v21 + a4;
}

- (void)_renderAccessKeyWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  void v22[2] = *MEMORY[0x263EF8340];
  id v10 = [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:*MEMORY[0x263F81840]];
  id v11 = objc_alloc_init(MEMORY[0x263F81650]);
  [v11 setAlignment:1];
  [v11 setLineBreakMode:0];
  uint64_t v12 = *MEMORY[0x263F81540];
  v21[0] = *MEMORY[0x263F814F0];
  v21[1] = v12;
  v22[0] = v10;
  v22[1] = v11;
  CGFloat v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  double v14 = NSString;
  double v15 = [MEMORY[0x263F259B0] printAccessKeyPrefix];
  double v16 = [(AAInheritanceContactController *)self->_contactController accessKeyString];
  double v17 = [v14 stringWithFormat:@"%@: %@", v15, v16];

  double v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v17 attributes:v13];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v19 = CGRectGetWidth(v23) * 0.14;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v20 = CGRectGetWidth(v24) + v19 * -2.0;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  objc_msgSend(v18, "drawInRect:", v19, a4, v20, CGRectGetHeight(v25) * 0.12);
}

- (void)_renderFooterWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  void v20[2] = *MEMORY[0x263EF8340];
  uint64_t v9 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81840]];
  id v10 = objc_alloc_init(MEMORY[0x263F81650]);
  [v10 setAlignment:1];
  [v10 setLineBreakMode:0];
  uint64_t v11 = *MEMORY[0x263F81540];
  v19[0] = *MEMORY[0x263F814F0];
  v19[1] = v11;
  v20[0] = v9;
  v20[1] = v10;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v13 = objc_alloc(MEMORY[0x263F086A0]);
  double v14 = [MEMORY[0x263F259B0] printAccessKeyFooter];
  double v15 = (void *)[v13 initWithString:v14 attributes:v12];

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v16 = CGRectGetWidth(v21) * 0.08;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v17 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v18 = v17 + CGRectGetWidth(v23) * -0.16;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  objc_msgSend(v15, "drawInRect:", v16, a4, v18, CGRectGetHeight(v24) * 0.04);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_contactDisplayName, 0);
  objc_storeStrong((id *)&self->_ownerEmailAddress, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
}

@end