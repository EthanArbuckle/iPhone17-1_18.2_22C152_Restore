@interface EKEventAttachmentCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKEventAttachmentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_iconForDocumentProxy:(id)a3;
- (void)layoutSubviews;
- (void)setAttachment:(id)a3;
- (void)showSpinner:(BOOL)a3;
@end

@implementation EKEventAttachmentCell

- (EKEventAttachmentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)EKEventAttachmentCell;
  v4 = [(EKEventAttachmentCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(EKEventAttachmentCell *)v4 traitCollection];
    if (EKUIUsesLargeTextLayout(v6)) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    v8 = [(EKEventAttachmentCell *)v5 textLabel];
    [v8 setNumberOfLines:v7];
  }
  return v5;
}

- (id)_iconForDocumentProxy:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_7;
  }
  v4 = [MEMORY[0x1E4FB1818] _iconForResourceProxy:v3 format:3];
  if (v4
    || ([MEMORY[0x1E4FB1818] _iconForResourceProxy:v3 format:6],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([MEMORY[0x1E4FB1818] _iconForResourceProxy:v3 format:4],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([MEMORY[0x1E4FB1818] _iconForResourceProxy:v3 format:7],
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = v4;
  }
  else
  {
LABEL_7:
    id v5 = 0;
  }

  return v5;
}

- (void)setAttachment:(id)a3
{
  id v28 = a3;
  id v5 = [(EKEventAttachmentCell *)self textLabel];
  [v5 setText:0];

  v6 = [(EKEventAttachmentCell *)self detailTextLabel];
  [v6 setText:0];

  uint64_t v7 = [(EKEventAttachmentCell *)self imageView];
  [v7 setImage:0];

  [(EKEventAttachmentCell *)self setAccessoryType:0];
  v8 = v28;
  if (v28)
  {
    v9 = [v28 fileName];
    objc_super v10 = v9;
    if (!v9)
    {
      id v3 = EventKitUIBundle();
      objc_super v10 = [v3 localizedStringForKey:@"Untitled Attachment" value:&stru_1F0CC2140 table:0];
    }
    v11 = [(EKEventAttachmentCell *)self textLabel];
    [v11 setText:v10];

    if (!v9)
    {
    }
    v12 = [v28 fileSize];
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v12, "longLongValue"), 0);
      v15 = [(EKEventAttachmentCell *)self detailTextLabel];
      [v15 setText:v14];
    }
    v16 = [v28 fileName];
    v17 = [v16 pathExtension];

    if (v17)
    {
      v18 = (void *)MEMORY[0x1E4F442D8];
      v19 = [v28 fileName];
      v20 = [v19 pathExtension];
      v21 = [v18 typeWithFilenameExtension:v20];

      v22 = [v21 identifier];
    }
    else
    {
      v22 = 0;
    }
    v23 = (void *)MEMORY[0x1E4F22430];
    v24 = [v28 fileName];
    v25 = [v23 documentProxyForName:v24 type:v22 MIMEType:0];

    v26 = [(EKEventAttachmentCell *)self _iconForDocumentProxy:v25];
    if (v26)
    {
      v27 = [(EKEventAttachmentCell *)self imageView];
      [v27 setImage:v26];
    }
    v8 = v28;
  }
}

- (void)showSpinner:(BOOL)a3
{
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    if (!activityIndicator)
    {
      id v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      v6 = self->_activityIndicator;
      self->_activityIndicator = v5;

      activityIndicator = self->_activityIndicator;
    }
    [(UIActivityIndicatorView *)activityIndicator startAnimating];
    uint64_t v7 = self->_activityIndicator;
    [(EKEventAttachmentCell *)self setAccessoryView:v7];
  }
  else if (activityIndicator)
  {
    [(EKEventAttachmentCell *)self setAccessoryView:0];
    [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
    v8 = self->_activityIndicator;
    self->_activityIndicator = 0;
  }
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)EKEventAttachmentCell;
  [(EKEventAttachmentCell *)&v30 layoutSubviews];
  id v3 = [(EKEventAttachmentCell *)self traitCollection];
  if (!EKUIUsesLargeTextLayout(v3))
  {
    v4 = [(EKEventAttachmentCell *)self imageView];
    uint64_t v5 = [v4 image];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(EKEventAttachmentCell *)self imageView];
      v8 = [v7 image];
      [v8 size];
      double v10 = v9;

      if (v10 <= 0.0) {
        return;
      }
      v11 = [(EKEventAttachmentCell *)self imageView];
      [v11 frame];
      double v13 = v12;

      v14 = [(EKEventAttachmentCell *)self imageView];
      v15 = [v14 image];
      [v15 size];
      double v17 = v16;
      double v19 = v18;

      if (v13 < v19) {
        double v13 = v19;
      }
      double v20 = v17 / v19 * v13;
      if (CalInterfaceIsLeftToRight())
      {
        v21 = [(EKEventAttachmentCell *)self textLabel];
        [v21 frame];
        double v23 = (v22 - v20) * 0.5;
      }
      else
      {
        [(EKEventAttachmentCell *)self bounds];
        double v25 = v24;
        v26 = [(EKEventAttachmentCell *)self textLabel];
        [v26 frame];
        double MaxX = CGRectGetMaxX(v31);

        double v23 = MaxX + (v25 - MaxX - v20) * 0.5;
      }
      [(EKEventAttachmentCell *)self frame];
      double v29 = (v28 - v13) * 0.5;
      id v3 = [(EKEventAttachmentCell *)self imageView];
      objc_msgSend(v3, "setFrame:", v23, v29, v20, v13);
    }
    else
    {
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventAttachmentCell;
  -[EKEventAttachmentCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 54.0) {
    double v4 = 54.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end