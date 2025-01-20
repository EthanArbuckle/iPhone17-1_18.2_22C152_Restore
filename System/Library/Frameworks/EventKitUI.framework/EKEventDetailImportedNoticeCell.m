@interface EKEventDetailImportedNoticeCell
- (BOOL)update;
- (EKEventDetailImportedNoticeCell)initWithEvent:(id)a3 editable:(BOOL)a4;
@end

@implementation EKEventDetailImportedNoticeCell

- (EKEventDetailImportedNoticeCell)initWithEvent:(id)a3 editable:(BOOL)a4
{
  v15.receiver = self;
  v15.super_class = (Class)EKEventDetailImportedNoticeCell;
  v4 = [(EKEventDetailCell *)&v15 initWithEvent:a3 editable:a4 style:0];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v6 = [(EKEventDetailImportedNoticeCell *)v4 textLabel];
    [v6 setFont:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F28E48]);
    v8 = EventKitUIBundle();
    v9 = [v8 localizedStringForKey:@"This event was imported (read-only)" value:&stru_1F0CC2140 table:0];
    v10 = (void *)[v7 initWithString:v9];

    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v5, 0, objc_msgSend(v10, "length"));
    uint64_t v11 = *MEMORY[0x1E4FB0700];
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));

    v13 = [(EKEventDetailImportedNoticeCell *)v4 textLabel];
    [v13 setAttributedText:v10];
  }
  return v4;
}

- (BOOL)update
{
  v2 = [(EKEventDetailCell *)self event];
  char v3 = [v2 isEditable] ^ 1;

  return v3;
}

@end