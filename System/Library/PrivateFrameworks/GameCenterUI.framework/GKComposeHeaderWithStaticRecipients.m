@interface GKComposeHeaderWithStaticRecipients
- (NSArray)recipientNameStrings;
- (void)layoutSubviews;
- (void)setRecipientNameStrings:(id)a3;
@end

@implementation GKComposeHeaderWithStaticRecipients

- (void)setRecipientNameStrings:(id)a3
{
  v5 = (NSArray *)a3;
  p_recipientNameStrings = &self->_recipientNameStrings;
  if (self->_recipientNameStrings != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_recipientNameStrings, a3);
    p_recipientNameStrings = (NSArray **)[(GKComposeHeaderWithStaticRecipients *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_recipientNameStrings, v5);
}

- (void)layoutSubviews
{
  v3 = [(GKComposeHeaderWithStaticRecipients *)self recipientNameStrings];
  [(GKComposeHeaderField *)self valueFrame];
  float v5 = v4;
  v6 = [MEMORY[0x1E4F639F8] textStyle];
  v7 = [v6 composeFields];
  *(float *)&double v8 = v5;
  v9 = [v3 _gkCommaSeparatedRecipientListWithWidth:v7 forTextStyle:v8];
  [(GKComposeHeaderField *)self setValueText:v9];

  v10.receiver = self;
  v10.super_class = (Class)GKComposeHeaderWithStaticRecipients;
  [(GKComposeHeaderWithStaticRecipients *)&v10 layoutSubviews];
}

- (NSArray)recipientNameStrings
{
  return self->_recipientNameStrings;
}

- (void).cxx_destruct
{
}

@end