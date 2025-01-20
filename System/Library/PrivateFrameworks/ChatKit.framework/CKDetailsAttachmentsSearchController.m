@interface CKDetailsAttachmentsSearchController
+ (id)sectionIdentifier;
- (CKAttachmentSearchResultCell)sizingCell;
- (id)layoutGroupWithEnvironment:(id)a3;
- (void)setSizingCell:(id)a3;
@end

@implementation CKDetailsAttachmentsSearchController

+ (id)sectionIdentifier
{
  return @"DetailsAttachmentsSearchSection";
}

- (id)layoutGroupWithEnvironment:(id)a3
{
  unint64_t v4 = [(CKSearchController *)self layoutWidth];
  v5 = [(CKSearchController *)self delegate];
  [v5 containerWidthForController:self];
  double v7 = v6;

  unint64_t v28 = 0;
  double v29 = 0.0;
  [(CKAttachmentsSearchController *)self fractionalWidth:&v29 count:&v28 forLayoutWidth:v4];
  v8 = [(CKSearchController *)self delegate];
  [v8 parentMarginInsetsForSearchController:self];
  double v10 = v9;
  double v12 = v11;

  double v13 = (v7 - (v10 + v12) + (float)((float)(v28 - 1) * -10.0)) / (double)v28;
  v14 = objc_opt_new();
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v13, 1.79769313e308);
  v15 = [(CKDetailsAttachmentsSearchController *)self sizingCell];
  v16 = [v15 preferredLayoutAttributesFittingAttributes:v14];

  [v16 frame];
  double Height = CGRectGetHeight(v31);
  v18 = [MEMORY[0x1E4F42608] fractionalWidthDimension:v29];
  v19 = [MEMORY[0x1E4F42608] absoluteDimension:Height];
  v20 = [MEMORY[0x1E4F42638] sizeWithWidthDimension:v18 heightDimension:v19];
  v21 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v20];
  v22 = (void *)MEMORY[0x1E4F42638];
  v23 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v24 = [v22 sizeWithWidthDimension:v23 heightDimension:v19];

  v25 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v24 subitem:v21 count:v28];
  v26 = [MEMORY[0x1E4F42640] fixedSpacing:10.0];
  [v25 setInterItemSpacing:v26];

  return v25;
}

- (CKAttachmentSearchResultCell)sizingCell
{
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    unint64_t v4 = [CKAttachmentSearchResultCell alloc];
    v5 = -[CKAttachmentSearchResultCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_sizingCell;
    self->_sizingCell = v5;

    double v7 = [(CKAttachmentSearchResultCell *)self->_sizingCell dateLabel];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    [v7 setDate:v8];

    v22 = +[CKUIBehavior sharedBehaviors];
    v21 = [v22 theme];
    uint64_t v9 = [v21 conversationListSummaryColor];
    v20 = +[CKUIBehavior sharedBehaviors];
    double v10 = [v20 searchResultLabelFont];
    double v11 = +[CKUIBehavior sharedBehaviors];
    double v12 = [v11 theme];
    double v13 = [v12 conversationListSenderColor];
    v14 = +[CKUIBehavior sharedBehaviors];
    v15 = [v14 searchResultLabelFont];
    v16 = (void *)v9;
    v17 = +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:&stru_1EDE4CA38 resultText:@"TEST\nTEST" primaryTextColor:v9 primaryFont:v10 annotatedTextColor:v13 annotatedFont:v15];

    v18 = [(CKAttachmentSearchResultCell *)self->_sizingCell titleLabel];
    [v18 setAttributedText:v17];

    sizingCell = self->_sizingCell;
  }

  return sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end