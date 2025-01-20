@interface CertUIItemDetail
+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4;
+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5;
+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9;
- (BOOL)showCheckmark;
- (BOOL)showCheckmarkView;
- (CertUIItemDetail)initWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9;
- (NSString)checkmarkText;
- (NSString)detail;
- (NSString)detailTitle;
- (UIColor)checkmarkHighlightColor;
- (UIColor)detailHighlightColor;
- (void)setCheckmarkHighlightColor:(id)a3;
- (void)setCheckmarkText:(id)a3;
- (void)setDetail:(id)a3;
- (void)setDetailHighlightColor:(id)a3;
- (void)setDetailTitle:(id)a3;
- (void)setShowCheckmark:(BOOL)a3;
- (void)setShowCheckmarkView:(BOOL)a3;
@end

@implementation CertUIItemDetail

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  LOBYTE(v9) = 0;
  v7 = [[CertUIItemDetail alloc] initWithDetailTitle:v6 detail:v5 detailHighlightColor:0 showCheckmarkView:0 checkmarkText:0 checkmarkHighlightColor:0 showCheckmark:v9];

  return v7;
}

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  LOBYTE(v12) = 0;
  v10 = [[CertUIItemDetail alloc] initWithDetailTitle:v9 detail:v8 detailHighlightColor:v7 showCheckmarkView:0 checkmarkText:0 checkmarkHighlightColor:0 showCheckmark:v12];

  return v10;
}

+ (id)itemDetailWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9
{
  BOOL v10 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOBYTE(v21) = a9;
  v19 = [[CertUIItemDetail alloc] initWithDetailTitle:v18 detail:v17 detailHighlightColor:v16 showCheckmarkView:v10 checkmarkText:v15 checkmarkHighlightColor:v14 showCheckmark:v21];

  return v19;
}

- (CertUIItemDetail)initWithDetailTitle:(id)a3 detail:(id)a4 detailHighlightColor:(id)a5 showCheckmarkView:(BOOL)a6 checkmarkText:(id)a7 checkmarkHighlightColor:(id)a8 showCheckmark:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v23 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CertUIItemDetail;
  v19 = [(CertUIItemDetail *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_detailTitle, a3);
    objc_storeStrong((id *)&v20->_detail, a4);
    objc_storeStrong((id *)&v20->_detailHighlightColor, a5);
    v20->_showCheckmarkView = a6;
    objc_storeStrong((id *)&v20->_checkmarkText, a7);
    objc_storeStrong((id *)&v20->_checkmarkHighlightColor, a8);
    v20->_showCheckmark = a9;
  }

  return v20;
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
}

- (NSString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
}

- (UIColor)detailHighlightColor
{
  return self->_detailHighlightColor;
}

- (void)setDetailHighlightColor:(id)a3
{
}

- (BOOL)showCheckmarkView
{
  return self->_showCheckmarkView;
}

- (void)setShowCheckmarkView:(BOOL)a3
{
  self->_showCheckmarkView = a3;
}

- (NSString)checkmarkText
{
  return self->_checkmarkText;
}

- (void)setCheckmarkText:(id)a3
{
}

- (UIColor)checkmarkHighlightColor
{
  return self->_checkmarkHighlightColor;
}

- (void)setCheckmarkHighlightColor:(id)a3
{
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (void)setShowCheckmark:(BOOL)a3
{
  self->_showCheckmark = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkHighlightColor, 0);
  objc_storeStrong((id *)&self->_checkmarkText, 0);
  objc_storeStrong((id *)&self->_detailHighlightColor, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
}

@end