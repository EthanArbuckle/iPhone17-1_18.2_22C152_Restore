@interface PKPeerPaymentSiriSnippetContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKTextBalloonView)memoBalloonView;
- (CNAvatarView)recipientAvatarView;
- (NSString)memoText;
- (NSString)toFieldText;
- (PKPeerPaymentMessageBalloonView)peerPaymentBalloonView;
- (PKPeerPaymentSiriSnippetContentView)initWithBalloonView:(id)a3;
- (UIImageView)recipientImageView;
- (UILabel)toLabel;
- (UIStackView)toFieldStackView;
- (UIView)recipientBadgedAvatarView;
- (double)_balloonMaxWidthForBoundsWidth:(double)a3;
- (id)_memoBalloonViewWithText:(id)a3;
- (void)layoutSubviews;
- (void)setMemoBalloonView:(id)a3;
- (void)setMemoText:(id)a3;
- (void)setPeerPaymentBalloonView:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setRecipientAvatarView:(id)a3;
- (void)setRecipientBadgedAvatarView:(id)a3;
- (void)setRecipientImageView:(id)a3;
- (void)setToFieldStackView:(id)a3;
- (void)setToFieldText:(id)a3;
- (void)setToLabel:(id)a3;
@end

@implementation PKPeerPaymentSiriSnippetContentView

- (PKPeerPaymentSiriSnippetContentView)initWithBalloonView:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentSiriSnippetContentView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[PKPeerPaymentSiriSnippetContentView initWithFrame:](&v26, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v9)
  {
    v10 = +[UIColor systemBackgroundColor];
    [(PKPeerPaymentSiriSnippetContentView *)v9 setBackgroundColor:v10];

    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    toLabel = v9->_toLabel;
    v9->_toLabel = v11;

    v13 = v9->_toLabel;
    v14 = +[UIColor labelColor];
    [(UILabel *)v13 setTextColor:v14];

    v15 = v9->_toLabel;
    v16 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:2 options:0];
    v17 = +[UIFont fontWithDescriptor:v16 size:0.0];
    [(UILabel *)v15 setFont:v17];

    [(UILabel *)v9->_toLabel setNumberOfLines:1];
    v18 = v9->_toLabel;
    v19 = +[UIColor clearColor];
    [(UILabel *)v18 setBackgroundColor:v19];

    [(PKPeerPaymentSiriSnippetContentView *)v9 addSubview:v9->_toLabel];
    objc_storeStrong((id *)&v9->_peerPaymentBalloonView, a3);
    [(PKPeerPaymentSiriSnippetContentView *)v9 addSubview:v5];
    v20 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    toFieldStackView = v9->_toFieldStackView;
    v9->_toFieldStackView = v20;

    [(UIStackView *)v9->_toFieldStackView setAxis:0];
    [(UIStackView *)v9->_toFieldStackView setSpacing:16.0];
    LODWORD(v22) = 1148846080;
    [(UILabel *)v9->_toLabel setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UILabel *)v9->_toLabel setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1132068864;
    [(UILabel *)v9->_toLabel setContentHuggingPriority:0 forAxis:v24];
    [(UIStackView *)v9->_toFieldStackView addArrangedSubview:v9->_toLabel];
    [(PKPeerPaymentSiriSnippetContentView *)v9 addSubview:v9->_toFieldStackView];
  }

  return v9;
}

- (void)setRecipient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CNContactStore);
  v6 = [v4 contactIdentifier];

  v38 = v6;
  v7 = +[NSArray arrayWithObjects:&v38 count:1];
  v8 = +[CNContact predicateForContactsWithIdentifiers:v7];

  v37 = CNContactThumbnailImageDataKey;
  v9 = +[NSArray arrayWithObjects:&v37 count:1];
  id v32 = 0;
  v10 = [v5 unifiedContactsMatchingPredicate:v8 keysToFetch:v9 error:&v32];
  id v11 = v32;
  if (v11)
  {
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSiriSnippetContentView Error fetching contacts: %@", buf, 0xCu);
    }
  }
  else
  {
    v12 = [v10 firstObject];
    if (v12)
    {
      uint64_t v31 = +[UIImage _applicationIconImageForBundleIdentifier:@"com.apple.MobileSMS" format:2];
      id v13 = objc_alloc_init(off_10000CDA0());
      [v13 setCropStyle:1];
      v27 = v13;
      [v13 setPosition:2];
      id v26 = objc_alloc_init(off_10000CDA8());
      [v26 setBadgeStyleSettings:v13];
      v34 = v12;
      +[NSArray arrayWithObjects:&v34 count:1];
      v14 = v29 = v8;
      [v26 setContacts:v14];

      [v26 setBadgeImage:v31];
      v15 = [v26 view];
      recipientBadgedAvatarView = self->_recipientBadgedAvatarView;
      self->_recipientBadgedAvatarView = v15;

      LODWORD(v17) = 1148846080;
      [(UIView *)self->_recipientBadgedAvatarView setContentCompressionResistancePriority:0 forAxis:v17];
      LODWORD(v18) = 1148846080;
      [(UIView *)self->_recipientBadgedAvatarView setContentCompressionResistancePriority:1 forAxis:v18];
      LODWORD(v19) = 1148846080;
      [(UIView *)self->_recipientBadgedAvatarView setContentHuggingPriority:0 forAxis:v19];
      [(UIView *)self->_recipientBadgedAvatarView setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = [(UIView *)self->_recipientBadgedAvatarView widthAnchor];
      [v20 constraintEqualToConstant:64.0];
      v21 = v28 = v10;
      v33[0] = v21;
      [(UIView *)self->_recipientBadgedAvatarView heightAnchor];
      double v22 = v30 = v5;
      double v23 = [v22 constraintEqualToConstant:64.0];
      v33[1] = v23;
      double v24 = +[NSArray arrayWithObjects:v33 count:2];
      +[NSLayoutConstraint activateConstraints:v24];

      v25 = v31;
      id v5 = v30;

      v10 = v28;
      v8 = v29;
      [(UIStackView *)self->_toFieldStackView insertArrangedSubview:self->_recipientBadgedAvatarView atIndex:0];
      [(PKPeerPaymentSiriSnippetContentView *)self setNeedsLayout];
    }
    else
    {
      v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentSiriSnippetContentView Error no results from contacts query for image data", buf, 2u);
      }
    }
  }
}

- (void)setToFieldText:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_toFieldText] & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    toFieldText = self->_toFieldText;
    self->_toFieldText = v4;

    [(UILabel *)self->_toLabel setText:v6];
    [(PKPeerPaymentSiriSnippetContentView *)self setNeedsLayout];
  }
}

- (void)setMemoText:(id)a3
{
  id v9 = a3;
  if (([v9 isEqualToString:self->_memoText] & 1) == 0)
  {
    id v4 = (NSString *)[v9 copy];
    memoText = self->_memoText;
    self->_memoText = v4;

    [(CKTextBalloonView *)self->_memoBalloonView removeFromSuperview];
    memoBalloonView = self->_memoBalloonView;
    self->_memoBalloonView = 0;

    if ([(NSString *)self->_memoText length])
    {
      v7 = [(PKPeerPaymentSiriSnippetContentView *)self _memoBalloonViewWithText:v9];
      v8 = self->_memoBalloonView;
      self->_memoBalloonView = v7;

      [(PKPeerPaymentSiriSnippetContentView *)self addSubview:self->_memoBalloonView];
    }
    [(PKPeerPaymentSiriSnippetContentView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(PKPeerPaymentSiriSnippetContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIStackView setFrame:](self->_toFieldStackView, "setFrame:", 15.0, 8.0, v3 + -30.0, 64.0);
  [(UILabel *)self->_toLabel sizeToFit];
  [(UIStackView *)self->_toFieldStackView frame];
  double v7 = CGRectGetMaxY(v26) + 8.0;
  [(PKPeerPaymentSiriSnippetContentView *)self _balloonMaxWidthForBoundsWidth:v4];
  double v9 = v8;
  v10 = [(PKPeerPaymentMessageBalloonView *)self->_peerPaymentBalloonView bubbleView];
  objc_msgSend(v10, "sizeThatFits:", v9, v6 - v7 + -12.0);
  double v12 = v11;
  double v14 = v13;

  double v15 = v4 - v12 + -10.0;
  if (v15 < 0.0) {
    double v15 = 0.0;
  }
  -[PKPeerPaymentMessageBalloonView setFrame:](self->_peerPaymentBalloonView, "setFrame:", v15, v7, v12, v14);
  memoBalloonView = self->_memoBalloonView;
  if (memoBalloonView)
  {
    [(CKTextBalloonView *)memoBalloonView setOrientation:1];
    [(CKTextBalloonView *)self->_memoBalloonView prepareForDisplayIfNeeded];
    -[CKTextBalloonView sizeThatFits:](self->_memoBalloonView, "sizeThatFits:", v9, 1.79769313e308);
    double v18 = v17;
    double v20 = v19;
    double v21 = v4 - v17 + -10.0;
    if (v21 >= 0.0) {
      double v22 = v21;
    }
    else {
      double v22 = 0.0;
    }
    [(PKPeerPaymentMessageBalloonView *)self->_peerPaymentBalloonView frame];
    double MaxY = CGRectGetMaxY(v27);
    double v24 = self->_memoBalloonView;
    -[CKTextBalloonView setFrame:](v24, "setFrame:", v22, MaxY + 8.0, v18, v20);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_toLabel, "sizeThatFits:", a3.width + -30.0 + -64.0, a3.height + -16.0);
  double v7 = v6;
  [(PKPeerPaymentSiriSnippetContentView *)self _balloonMaxWidthForBoundsWidth:width];
  double v9 = v8;
  v10 = [(PKPeerPaymentMessageBalloonView *)self->_peerPaymentBalloonView bubbleView];
  objc_msgSend(v10, "sizeThatFits:", v9, height + -80.0 + -12.0);
  double v12 = v11;
  double v14 = v13;

  double v15 = v14 + 80.0;
  memoBalloonView = self->_memoBalloonView;
  if (memoBalloonView)
  {
    double v17 = v15 + 8.0;
    -[CKTextBalloonView sizeThatFits:](memoBalloonView, "sizeThatFits:", v9, 1.79769313e308);
    double v15 = v17 + v19;
  }
  else
  {
    double v18 = CGSizeZero.width;
  }
  double v20 = v7 + 30.0;
  double v21 = v18 + 20.0;
  if (v7 + 30.0 <= v12 + 20.0) {
    double v20 = v12 + 20.0;
  }
  if (v20 > v21) {
    double v21 = v20;
  }
  double v22 = v15 + 12.0;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (id)_memoBalloonViewWithText:(id)a3
{
  id v3 = a3;
  double v4 = +[CKUIBehavior sharedBehaviors];
  objc_opt_class();
  double v5 = CKBalloonViewForClass();
  [v5 setHasTail:1];
  [v5 setBalloonCorners:-1];
  [v5 setColor:5];
  [v5 setCanUseOpaqueMask:0];
  id v6 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v3];
  if ([v4 hyphenatesTextContent])
  {
    double v7 = +[NSParagraphStyle defaultParagraphStyle];
    id v8 = [v7 mutableCopy];

    LODWORD(v9) = 1.0;
    [v8 setHyphenationFactor:v9];
    objc_msgSend(v6, "addAttribute:value:range:", NSParagraphStyleAttributeName, v8, 0, objc_msgSend(v6, "length"));
  }
  id v10 = [v6 length];
  if (objc_msgSend(v3, "__ck_shouldUseBigEmoji")) {
    [v4 bigEmojiFont];
  }
  else {
  double v11 = [v4 balloonTextFont];
  }
  objc_msgSend(v6, "addAttribute:value:range:", NSFontAttributeName, v11, 0, v10);
  double v12 = +[CKUIBehavior sharedBehaviors];
  double v13 = [v12 theme];
  double v14 = objc_msgSend(v13, "balloonTextColorForColorType:", objc_msgSend(v5, "color"));
  objc_msgSend(v6, "addAttribute:value:range:", NSForegroundColorAttributeName, v14, 0, v10);

  [v5 setAttributedText:v6];
  [v5 prepareForDisplay];

  return v5;
}

- (double)_balloonMaxWidthForBoundsWidth:(double)a3
{
  double v4 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v4, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", 0, 0, 0, 0, a3, 0.0, 10.0, 0.0, 10.0);
  double v6 = v5;

  double result = a3 + -20.0;
  if (v6 < a3 + -20.0) {
    return v6;
  }
  return result;
}

- (NSString)toFieldText
{
  return self->_toFieldText;
}

- (NSString)memoText
{
  return self->_memoText;
}

- (UILabel)toLabel
{
  return self->_toLabel;
}

- (void)setToLabel:(id)a3
{
}

- (PKPeerPaymentMessageBalloonView)peerPaymentBalloonView
{
  return self->_peerPaymentBalloonView;
}

- (void)setPeerPaymentBalloonView:(id)a3
{
}

- (CKTextBalloonView)memoBalloonView
{
  return self->_memoBalloonView;
}

- (void)setMemoBalloonView:(id)a3
{
}

- (UIStackView)toFieldStackView
{
  return self->_toFieldStackView;
}

- (void)setToFieldStackView:(id)a3
{
}

- (UIImageView)recipientImageView
{
  return self->_recipientImageView;
}

- (void)setRecipientImageView:(id)a3
{
}

- (CNAvatarView)recipientAvatarView
{
  return self->_recipientAvatarView;
}

- (void)setRecipientAvatarView:(id)a3
{
}

- (UIView)recipientBadgedAvatarView
{
  return self->_recipientBadgedAvatarView;
}

- (void)setRecipientBadgedAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientBadgedAvatarView, 0);
  objc_storeStrong((id *)&self->_recipientAvatarView, 0);
  objc_storeStrong((id *)&self->_recipientImageView, 0);
  objc_storeStrong((id *)&self->_toFieldStackView, 0);
  objc_storeStrong((id *)&self->_memoBalloonView, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalloonView, 0);
  objc_storeStrong((id *)&self->_toLabel, 0);
  objc_storeStrong((id *)&self->_memoText, 0);

  objc_storeStrong((id *)&self->_toFieldText, 0);
}

@end