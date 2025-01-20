@interface CKTokenizationSearchResultCell
+ (id)reuseIdentifier;
- (BOOL)_ck_isEditing;
- (CKTokenizationSearchResultCell)initWithFrame:(CGRect)a3;
- (NSString)resultIdentifier;
- (UIEdgeInsets)marginInsets;
- (id)_displayStringForTokenResult:(id)a3 searchText:(id)a4;
- (void)_ck_setEditing:(BOOL)a3;
- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5;
- (void)setMarginInsets:(UIEdgeInsets)a3;
@end

@implementation CKTokenizationSearchResultCell

+ (id)reuseIdentifier
{
  return @"TokenizationSearchCell";
}

- (CKTokenizationSearchResultCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTokenizationSearchResultCell;
  v3 = -[CKTokenizationSearchResultCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [MEMORY[0x1E4F428B8] labelColor];
  [(CKTokenizationSearchResultCell *)v3 setTintColor:v4];

  return v3;
}

- (void)configureWithQueryResult:(id)a3 searchText:(id)a4 mode:(unint64_t)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4FB08E0];
  double v9 = *MEMORY[0x1E4FB09D8];
  id v10 = a4;
  v11 = [v8 systemFontOfSize:14.0 weight:v9];
  v12 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43878]];
  v13 = [v12 scaledFontForFont:v11];

  v14 = [MEMORY[0x1E4F42A98] configurationWithFont:v13];
  v15 = [(CKTokenizationSearchResultCell *)self defaultContentConfiguration];
  v16 = +[CKUIBehavior sharedBehaviors];
  [v16 searchSuggestionsImageToTextPadding];
  objc_msgSend(v15, "setImageToTextPadding:");

  id v20 = v7;
  v17 = [(CKTokenizationSearchResultCell *)self _displayStringForTokenResult:v20 searchText:v10];

  [v15 setAttributedText:v17];
  v18 = [v20 image];

  v19 = [v18 imageByApplyingSymbolConfiguration:v14];
  [v15 setImage:v19];

  [(CKTokenizationSearchResultCell *)self setContentConfiguration:v15];
}

- (id)_displayStringForTokenResult:(id)a3 searchText:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB08E0];
  double v6 = *MEMORY[0x1E4FB09D8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v5 systemFontOfSize:16.0 weight:v6];
  id v10 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43870]];
  v11 = [v10 scaledFontForFont:v9];

  v12 = [v8 attributedSuggestionTextForSearchText:v7 font:v11];

  return v12;
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->_ck_editing;
}

- (void)_ck_setEditing:(BOOL)a3
{
  self->_ck_editing = a3;
}

- (NSString)resultIdentifier
{
  return self->resultIdentifier;
}

- (void).cxx_destruct
{
}

@end