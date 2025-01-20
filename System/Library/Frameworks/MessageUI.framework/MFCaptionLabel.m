@interface MFCaptionLabel
+ (EFLazyCache)attributedStringsCache;
- (BOOL)hasDifferentReplyToAddress;
- (BOOL)preventAutoUpdatingLabel;
- (MFCaptionLabel)initWithFrame:(CGRect)a3;
- (MFCaptionLabelDataSource)dataSource;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)fromSenders;
- (NSArray)otherSigners;
- (NSArray)replyToSenders;
- (NSArray)toRecipients;
- (double)_maxWidthForRecipientList;
- (id)_attributedStringForImage:(id)a3;
- (id)_chevronAttributedString;
- (id)_chevronImage;
- (id)_concatenateStringForRecipientList:(id)a3 recipientCount:(unint64_t)a4 prefixGenerationBlock:(id)a5 listSuffix:(id)a6;
- (id)_formattedAttributedString;
- (id)_formattedReplyToString;
- (id)_questionMarkAttributedString;
- (id)_questionMarkImage;
- (id)_stringAtIndexForCombinedRecipientLists:(unint64_t)a3;
- (id)_whitespaceStringWithWidth:(double)a3;
- (id)_whitespaceTextAttachment;
- (id)lengthValidationBlock;
- (void)_setNeedsLabelUpdate;
- (void)layoutSubviews;
- (void)setBccRecipients:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCcRecipients:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFromSenders:(id)a3;
- (void)setHasDifferentReplyToAddress:(BOOL)a3;
- (void)setOtherSigners:(id)a3;
- (void)setPreventAutoUpdatingLabel:(BOOL)a3;
- (void)setReplyToSenders:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)updateLabelNow;
@end

@implementation MFCaptionLabel

- (MFCaptionLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFCaptionLabel;
  v3 = -[MFCaptionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFCaptionLabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFCaptionLabel *)v4 setNumberOfLines:0];
  }
  return v4;
}

+ (EFLazyCache)attributedStringsCache
{
  if (attributedStringsCache_onceToken != -1) {
    dispatch_once(&attributedStringsCache_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)attributedStringsCache_sAttributedStringsCache;

  return (EFLazyCache *)v2;
}

void __40__MFCaptionLabel_attributedStringsCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:10];
  v1 = (void *)attributedStringsCache_sAttributedStringsCache;
  attributedStringsCache_sAttributedStringsCache = v0;
}

- (void)setToRecipients:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_toRecipients != v5)
  {
    objc_storeStrong((id *)&self->_toRecipients, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setCcRecipients:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_ccRecipients != v5)
  {
    objc_storeStrong((id *)&self->_ccRecipients, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setBccRecipients:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_bccRecipients != v5)
  {
    objc_storeStrong((id *)&self->_bccRecipients, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setFromSenders:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_fromSenders != v5)
  {
    objc_storeStrong((id *)&self->_fromSenders, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setOtherSigners:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_otherSigners != v5)
  {
    objc_storeStrong((id *)&self->_otherSigners, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setReplyToSenders:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_replyToSenders != v5)
  {
    objc_storeStrong((id *)&self->_replyToSenders, a3);
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setHasDifferentReplyToAddress:(BOOL)a3
{
  if (self->_hasDifferentReplyToAddress != a3)
  {
    self->_hasDifferentReplyToAddress = a3;
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
}

- (void)setPreventAutoUpdatingLabel:(BOOL)a3
{
  if (self->_preventAutoUpdatingLabel != a3)
  {
    self->_preventAutoUpdatingLabel = a3;
    if (!a3) {
      [(MFCaptionLabel *)self _setNeedsLabelUpdate];
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(MFCaptionLabel *)self bounds];
  double v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 > 0.00000011920929) {
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
  v10.receiver = self;
  v10.super_class = (Class)MFCaptionLabel;
  -[MFCaptionLabel setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  [(MFCaptionLabel *)self frame];
  double v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 > 0.00000011920929) {
    [(MFCaptionLabel *)self _setNeedsLabelUpdate];
  }
  v10.receiver = self;
  v10.super_class = (Class)MFCaptionLabel;
  -[MFCaptionLabel setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFCaptionLabel;
  [(MFCaptionLabel *)&v3 layoutSubviews];
  if (self->_needsLabelUpdate) {
    [(MFCaptionLabel *)self updateLabelNow];
  }
}

- (void)_setNeedsLabelUpdate
{
  if (![(MFCaptionLabel *)self preventAutoUpdatingLabel])
  {
    self->_needsLabelUpdate = 1;
    [(MFCaptionLabel *)self setNeedsLayout];
  }
}

- (id)_stringAtIndexForCombinedRecipientLists:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CGRect v11 = self->_toRecipients;
  v12 = self->_ccRecipients;
  v13 = self->_bccRecipients;
  v14 = self->_fromSenders;
  v15 = self->_otherSigners;
  v5 = v11;
  uint64_t v6 = 0;
  while (a3 >= [(NSArray *)v5 count])
  {
    a3 -= [(NSArray *)v5 count];
    if ((unint64_t)++v6 <= 4)
    {
      v7 = (&v11)[v6];

      v5 = v7;
    }
  }
  if (a3 >= [(NSArray *)v5 count])
  {
    double v8 = 0;
  }
  else
  {
    double v8 = [(NSArray *)v5 objectAtIndexedSubscript:a3];
  }

  for (uint64_t i = 4; i != -1; --i)

  return v8;
}

- (id)_whitespaceTextAttachment
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  +[MFModernLabelledAtomList spaceBetweenColonAndFirstAtomNaturalEdge];
  double v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  objc_msgSend(v7, "setBounds:", v2, v3, v6, v4);

  return v7;
}

- (void)updateLabelNow
{
  if (pthread_main_np() != 1)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MFCaptionLabel.m" lineNumber:188 description:@"Current thread must be main"];
  }
  double v4 = NSString;
  [(MFCaptionLabel *)self bounds];
  CGFloat Width = CGRectGetWidth(v27);
  double v6 = [(NSArray *)self->_toRecipients componentsJoinedByString:@","];
  id v7 = [(NSArray *)self->_ccRecipients componentsJoinedByString:@","];
  double v8 = [(NSArray *)self->_bccRecipients componentsJoinedByString:@","];
  double v9 = [(NSArray *)self->_fromSenders componentsJoinedByString:@","];
  objc_super v10 = [(NSArray *)self->_otherSigners componentsJoinedByString:@","];
  CGRect v11 = [v4 stringWithFormat:@"%fTo:%@Cc:%@Bcc:%@From:%@Other:%@", *(void *)&Width, v6, v7, v8, v9, v10];

  v12 = [(id)objc_opt_class() attributedStringsCache];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __32__MFCaptionLabel_updateLabelNow__block_invoke;
  v26[3] = &unk_1E5F79668;
  v26[4] = self;
  v13 = [v12 objectForKey:v11 generator:v26];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    [v14 appendAttributedString:v13];
    v15 = [(MFCaptionLabel *)self _whitespaceStringWithWidth:4.0];
    [v14 appendAttributedString:v15];

    uint64_t v16 = [(MFCaptionLabel *)self _chevronAttributedString];
    [v14 appendAttributedString:v16];

    if ([(NSArray *)self->_replyToSenders count])
    {
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@"\n"];
      [v14 appendAttributedString:v17];

      v18 = [(MFCaptionLabel *)self _formattedReplyToString];
      [v14 appendAttributedString:v18];

      if ([(MFCaptionLabel *)self hasDifferentReplyToAddress])
      {
        v19 = (void *)MEMORY[0x1E4F28B18];
        v20 = [(MFCaptionLabel *)self _whitespaceTextAttachment];
        v21 = [v19 attributedStringWithAttachment:v20];
        [v14 appendAttributedString:v21];

        v22 = [(MFCaptionLabel *)self _questionMarkAttributedString];
        [v14 appendAttributedString:v22];
      }
      v23 = [(MFCaptionLabel *)self _whitespaceStringWithWidth:4.0];
      [v14 appendAttributedString:v23];

      v24 = [(MFCaptionLabel *)self _chevronAttributedString];
      [v14 appendAttributedString:v24];
    }
    [(MFCaptionLabel *)self setAttributedText:v14];
  }
  else
  {
    [(MFCaptionLabel *)self setAttributedText:0];
  }
  self->_needsLabelUpdate = 0;
}

uint64_t __32__MFCaptionLabel_updateLabelNow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _formattedAttributedString];
}

- (id)_attributedStringForImage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v5 setImage:v4];
  [v4 size];
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = [(MFCaptionLabel *)self font];
  [v10 capHeight];

  UIRoundToViewScale();
  objc_msgSend(v5, "setBounds:", 0.0, v11, v7, v9);
  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v5];

  return v12;
}

- (id)_chevronImage
{
  double v2 = +[MFFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedImage:&__block_literal_global_42 forKey:@"captionLabel.chevronImage"];

  return v3;
}

id __31__MFCaptionLabel__chevronImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"chevron.forward", 19);
  v1 = [MEMORY[0x1E4FB1618] mailSubtitleGrayColor];
  double v2 = [v0 imageWithTintColor:v1];

  return v2;
}

- (id)_chevronAttributedString
{
  double v3 = [(MFCaptionLabel *)self _chevronImage];
  id v4 = [(MFCaptionLabel *)self _attributedStringForImage:v3];

  return v4;
}

- (id)_questionMarkImage
{
  double v2 = +[MFFontMetricCache sharedFontMetricCache];
  double v3 = [v2 cachedImage:&__block_literal_global_49 forKey:@"captionLabel.questionMark"];

  return v3;
}

id __36__MFCaptionLabel__questionMarkImage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"questionmark.circle.fill", 19);
  v1 = [MEMORY[0x1E4FB1618] mailSubtitleGrayColor];
  double v2 = [v0 imageWithTintColor:v1];

  return v2;
}

- (id)_questionMarkAttributedString
{
  double v3 = [(MFCaptionLabel *)self _questionMarkImage];
  id v4 = [(MFCaptionLabel *)self _attributedStringForImage:v3];

  return v4;
}

- (id)_whitespaceStringWithWidth:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, a3, 0.0);
  id v5 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v4];

  return v5;
}

- (double)_maxWidthForRecipientList
{
  double v3 = [(MFCaptionLabel *)self _chevronImage];
  [(MFCaptionLabel *)self bounds];
  double Width = CGRectGetWidth(v13);
  [v3 size];
  double v6 = Width - v5 + -4.0;
  if ([(MFCaptionLabel *)self hasDifferentReplyToAddress])
  {
    double v7 = [(MFCaptionLabel *)self _questionMarkImage];
    [v7 size];
    double v9 = v8;
    objc_super v10 = [(MFCaptionLabel *)self _whitespaceTextAttachment];
    [v10 bounds];
    double v6 = v6 - v9 - v11;
  }
  return v6;
}

- (id)lengthValidationBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__MFCaptionLabel_lengthValidationBlock__block_invoke;
  aBlock[3] = &unk_1E5F796B0;
  aBlock[4] = self;
  double v2 = _Block_copy(aBlock);

  return v2;
}

BOOL __39__MFCaptionLabel_lengthValidationBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [v5 stringByAppendingString:v6];
  }
  else
  {
    id v7 = v5;
  }
  double v8 = v7;
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  double v9 = [*(id *)(a1 + 32) font];
  v17[0] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [v8 sizeWithAttributes:v10];
  double v12 = v11;

  [*(id *)(a1 + 32) _maxWidthForRecipientList];
  BOOL v14 = v12 <= v13;

  return v14;
}

- (id)_concatenateStringForRecipientList:(id)a3 recipientCount:(unint64_t)a4 prefixGenerationBlock:(id)a5 listSuffix:(id)a6
{
  id v9 = a3;
  objc_super v10 = (void (**)(id, void))a5;
  id v11 = a6;
  if ([v9 length])
  {
    if (v11)
    {
      uint64_t v12 = [v9 stringByAppendingString:v11];

      id v9 = (id)v12;
    }
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
    if (a4)
    {
      id v30 = v11;
      uint64_t v14 = 0;
      uint64_t v15 = *MEMORY[0x1E4FB0700];
      do
      {
        uint64_t v16 = v10[2](v10, v14);
        if ([v16 length])
        {
          v17 = [v13 string];
          uint64_t v18 = [v17 rangeOfString:v16];
          uint64_t v20 = v19;

          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v14)
            {
              v21 = [MEMORY[0x1E4FB1618] mailModernLabelledAtomDefaultTextColor];
              objc_msgSend(v13, "addAttribute:value:range:", v15, v21, v18, v20);
            }
            else
            {
              objc_msgSend(v13, "deleteCharactersInRange:", v18, v20);
              v22 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v23 = [v16 stringByTrimmingCharactersInSet:v22];

              v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v23];
              v24 = (void *)MEMORY[0x1E4F28B18];
              v25 = [(MFCaptionLabel *)self _whitespaceTextAttachment];
              v26 = [v24 attributedStringWithAttachment:v25];
              objc_msgSend(v21, "insertAttributedString:atIndex:", v26, objc_msgSend(v21, "length"));

              uint64_t v27 = [v21 length];
              v28 = [MEMORY[0x1E4FB1618] mailModernLabelledAtomDefaultTextColor];
              objc_msgSend(v21, "addAttribute:value:range:", v15, v28, 0, v27);

              [v13 insertAttributedString:v21 atIndex:0];
              uint64_t v16 = (void *)v23;
            }
          }
        }

        ++v14;
      }
      while (a4 != v14);
      id v11 = v30;
    }
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)_formattedReplyToString
{
  NSUInteger v3 = [(NSArray *)self->_replyToSenders count];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MFCaptionLabel__formattedReplyToString__block_invoke_2;
  aBlock[3] = &unk_1E5F796F8;
  aBlock[4] = self;
  BOOL v14 = v3 > 1;
  id v4 = _Block_copy(aBlock);
  id v5 = +[MFAddressConcatenator defaultRecipientListConcatenator];
  id v11 = 0;
  id v12 = 0;
  id v6 = [(MFCaptionLabel *)self lengthValidationBlock];
  [v5 getCommaSeparatedAddressList:&v12 andListSuffix:&v11 withAddressCount:v3 prefixForAddressAtIndex:&__block_literal_global_58 stringForAddressAtIndex:v4 lengthValidationBlock:v6];
  id v7 = v12;
  id v8 = v11;

  id v9 = [(MFCaptionLabel *)self _concatenateStringForRecipientList:v7 recipientCount:v3 prefixGenerationBlock:&__block_literal_global_58 listSuffix:v8];

  return v9;
}

id __41__MFCaptionLabel__formattedReplyToString__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 || (_EFLocalizedString(), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v2 = 0;
  }
  else
  {
    id v4 = (void *)v3;
    double v2 = [NSString stringWithFormat:@"%@%@ ", &stru_1F0817A00, v3];
  }

  return v2;
}

id __41__MFCaptionLabel__formattedReplyToString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 808));
  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 replyToSenders];
  id v7 = [v6 objectAtIndexedSubscript:a2];
  id v8 = [v7 stringValue];
  id v9 = [WeakRetained captionLabel:v5 displayNameForEmailAddress:v8 abbreviated:*(unsigned __int8 *)(a1 + 40)];
  objc_super v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) replyToSenders];
    double v13 = [v12 objectAtIndexedSubscript:a2];
    id v11 = [v13 stringValue];
  }

  return v11;
}

- (id)_formattedAttributedString
{
  NSUInteger v3 = [(NSArray *)self->_toRecipients count];
  NSUInteger v4 = [(NSArray *)self->_ccRecipients count] + v3;
  NSUInteger v5 = [(NSArray *)self->_bccRecipients count];
  NSUInteger v6 = v4 + v5 + [(NSArray *)self->_fromSenders count];
  unint64_t v7 = v6 + [(NSArray *)self->_otherSigners count];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MFCaptionLabel__formattedAttributedString__block_invoke;
  aBlock[3] = &unk_1E5F79720;
  aBlock[4] = self;
  id v8 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__MFCaptionLabel__formattedAttributedString__block_invoke_2;
  v18[3] = &unk_1E5F796F8;
  v18[4] = self;
  BOOL v19 = v7 > 1;
  id v9 = _Block_copy(v18);
  objc_super v10 = +[MFAddressConcatenator defaultRecipientListConcatenator];
  id v16 = 0;
  id v17 = 0;
  id v11 = [(MFCaptionLabel *)self lengthValidationBlock];
  [v10 getCommaSeparatedAddressList:&v17 andListSuffix:&v16 withAddressCount:v7 prefixForAddressAtIndex:v8 stringForAddressAtIndex:v9 lengthValidationBlock:v11];
  id v12 = v17;
  id v13 = v16;

  BOOL v14 = [(MFCaptionLabel *)self _concatenateStringForRecipientList:v12 recipientCount:v7 prefixGenerationBlock:v8 listSuffix:v13];

  return v14;
}

id __44__MFCaptionLabel__formattedAttributedString__block_invoke(uint64_t a1, char *a2)
{
  if (a2)
  {
    NSUInteger v4 = 0;
  }
  else
  {
    NSUInteger v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    NSUInteger v4 = [v5 localizedStringForKey:@"TO" value:&stru_1F0817A00 table:@"Main"];
  }
  if ((char *)[*(id *)(*(void *)(a1 + 32) + 816) count] == a2)
  {
    NSUInteger v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"CC" value:&stru_1F0817A00 table:@"Main"];

    NSUInteger v4 = (void *)v7;
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 816) count];
  if ((char *)([*(id *)(*(void *)(a1 + 32) + 824) count] + v8) == a2)
  {
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"BCC" value:&stru_1F0817A00 table:@"Main"];

    NSUInteger v4 = (void *)v10;
  }
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 816) count];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 824) count];
  if ((char *)(v12 + v11 + [*(id *)(*(void *)(a1 + 32) + 832) count]) == a2)
  {
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"FROM" value:&stru_1F0817A00 table:@"Main"];

    NSUInteger v4 = (void *)v14;
  }
  uint64_t v15 = (char *)[*(id *)(*(void *)(a1 + 32) + 816) count];
  uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 824) count];
  uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 832) count];
  if (&v15[v16 + v17 + [*(id *)(*(void *)(a1 + 32) + 848) count]] == a2)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v15 localizedStringForKey:@"OTHER_SIGNERS" value:&stru_1F0817A00 table:@"Main"];

    NSUInteger v4 = (void *)v18;
  }
  if (v4)
  {
    BOOL v19 = NSString;
    if (a2)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v15 localizedStringForKey:@"RECIPIENT_TYPES_SEPARATOR" value:&stru_1F0817A00 table:@"Main"];
    }
    else
    {
      uint64_t v20 = &stru_1F0817A00;
    }
    v21 = [v19 stringWithFormat:@"%@%@ ", v20, v4];
    if (a2)
    {
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __44__MFCaptionLabel__formattedAttributedString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSUInteger v3 = [*(id *)(a1 + 32) _stringAtIndexForCombinedRecipientLists:a2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 808));
  NSUInteger v5 = [WeakRetained captionLabel:*(void *)(a1 + 32) displayNameForEmailAddress:v3 abbreviated:*(unsigned __int8 *)(a1 + 40)];
  NSUInteger v6 = v5;
  if (!v5) {
    NSUInteger v5 = v3;
  }
  id v7 = v5;

  return v7;
}

- (MFCaptionLabelDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (MFCaptionLabelDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (NSArray)fromSenders
{
  return self->_fromSenders;
}

- (NSArray)otherSigners
{
  return self->_otherSigners;
}

- (NSArray)replyToSenders
{
  return self->_replyToSenders;
}

- (BOOL)preventAutoUpdatingLabel
{
  return self->_preventAutoUpdatingLabel;
}

- (BOOL)hasDifferentReplyToAddress
{
  return self->_hasDifferentReplyToAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyToSenders, 0);
  objc_storeStrong((id *)&self->_otherSigners, 0);
  objc_storeStrong((id *)&self->_fromSenders, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end