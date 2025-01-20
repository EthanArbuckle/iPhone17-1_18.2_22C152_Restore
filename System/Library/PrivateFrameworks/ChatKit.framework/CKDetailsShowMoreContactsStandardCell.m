@interface CKDetailsShowMoreContactsStandardCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation CKDetailsShowMoreContactsStandardCell

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)CKDetailsShowMoreContactsStandardCell;
  [(CKDetailsCell *)&v44 layoutSubviews];
  v3 = [(CKDetailsCell *)self bottomSeperator];
  [v3 setHidden:1];

  v4 = [(CKDetailsCell *)self topSeperator];
  [v4 frame];
  uint64_t v40 = v6;
  uint64_t v42 = v5;
  double v8 = v7;

  v9 = [(CKDetailsShowMoreContactsStandardCell *)self contentView];
  [v9 layoutMargins];
  double v11 = v10;
  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 detailsContactAvatarLabelSpacing];
  double v14 = v11 + v13;
  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 detailsViewContactImageDiameter];
  double v17 = v14 + v16;

  uint64_t v18 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  v19 = [(CKDetailsShowMoreContactsStandardCell *)self textLabel];
  [v19 frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = [(CKDetailsShowMoreContactsStandardCell *)self textLabel];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  double v29 = v17;
  double v30 = v17;
  if (v18)
  {
    v31 = [(CKDetailsShowMoreContactsStandardCell *)self contentView];
    [v31 layoutMargins];
    double v30 = v32;

    v33 = +[CKUIBehavior sharedBehaviors];
    [v33 detailsContactAvatarLabelSpacing];
    double v35 = v34;
    v36 = +[CKUIBehavior sharedBehaviors];
    [v36 detailsViewContactImageDiameter];
    double v29 = v21 - (v35 + v37);
  }
  v38 = [(CKDetailsShowMoreContactsStandardCell *)self textLabel];
  objc_msgSend(v38, "setFrame:", v29, v23, v25, v27);

  v39 = [(CKDetailsCell *)self topSeperator];
  objc_msgSend(v39, "setFrame:", v30, v43, v8 - v17, v41);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = objc_alloc(+[CKDetailsContactsTableViewCell cellClass]);
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v5, "sizeThatFits:", width, 3.40282347e38);
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

@end