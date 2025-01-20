@interface EKEventDetailCommentCell
- (BOOL)update;
- (EKEventDetailCommentCell)initWithEvent:(id)a3 editable:(BOOL)a4;
@end

@implementation EKEventDetailCommentCell

- (EKEventDetailCommentCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)EKEventDetailCommentCell;
  v4 = [(EKEventDetailCell *)&v11 initWithEvent:a3 editable:a4 style:1000];
  v5 = v4;
  if (v4)
  {
    v6 = [(EKEventDetailCommentCell *)v4 editableTextField];
    [v6 setReturnKeyType:9];

    v7 = [(EKEventDetailCommentCell *)v5 editableTextField];
    [v7 setClearButtonMode:1];

    v8 = [(EKEventDetailCommentCell *)v5 editableTextField];
    [v8 setAdjustsFontSizeToFitWidth:0];

    v9 = [(EKEventDetailCommentCell *)v5 editableTextField];
    CalDisableFocusRingForView();

    [(EKEventDetailCommentCell *)v5 setTextFieldOffset:0.0];
    [(EKEventDetailCommentCell *)v5 setSelectionStyle:0];
    [(EKEventDetailCommentCell *)v5 setNeedsLayout];
  }
  return v5;
}

- (BOOL)update
{
  int v3 = [(EKEventDetailCell *)self isEditable];
  if (v3)
  {
    int v3 = [(EKEvent *)self->super._event allowsResponseCommentModifications];
    if (v3)
    {
      uint64_t v4 = *MEMORY[0x1E4FB28C8];
      v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      v6 = [(EKEventDetailCommentCell *)self editableTextField];
      [v6 setFont:v5];

      v7 = (void *)MEMORY[0x1E4F57BA8];
      v8 = [(EKEvent *)self->super._event responseComment];
      v9 = [v7 stringWithAutoCommentRemoved:v8];
      v10 = [(EKEventDetailCommentCell *)self editableTextField];
      [v10 setText:v9];

      id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
      v12 = EventKitUIBundle();
      v13 = [v12 localizedStringForKey:@"Comment to Organizer" value:&stru_1F0CC2140 table:0];
      v14 = (void *)[v11 initWithString:v13];

      uint64_t v15 = *MEMORY[0x1E4FB06F8];
      v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v4];
      objc_msgSend(v14, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v14, "length"));

      uint64_t v17 = *MEMORY[0x1E4FB0700];
      v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      objc_msgSend(v14, "addAttribute:value:range:", v17, v18, 0, objc_msgSend(v14, "length"));

      v19 = [(EKEventDetailCommentCell *)self editableTextField];
      [v19 setAttributedPlaceholder:v14];

      [(EKEventDetailCommentCell *)self setNeedsLayout];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

@end