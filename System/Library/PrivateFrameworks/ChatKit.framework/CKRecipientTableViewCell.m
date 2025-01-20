@interface CKRecipientTableViewCell
+ (id)cellForRecipient:(id)a3;
- (CKRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setServiceColor:(char)a3 animated:(BOOL)a4;
@end

@implementation CKRecipientTableViewCell

+ (id)cellForRecipient:(id)a3
{
  id v4 = a3;
  v5 = [CKRecipientTableViewCell alloc];
  v6 = +[MFRecipientTableViewCell identifier];
  v7 = [(CKRecipientTableViewCell *)v5 initWithStyle:0 reuseIdentifier:v6];

  if (v7) {
    objc_storeStrong((id *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F35130]), a3);
  }

  return v7;
}

- (CKRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKRecipientTableViewCell;
  id v4 = [(MFRecipientTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MFRecipientTableViewCell *)v4 setOpaque:0];
  }
  return v5;
}

- (void)setServiceColor:(char)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  objc_super v7 = +[CKUIBehavior sharedBehaviors];
  uint64_t v8 = [v7 theme];
  id v10 = [(id)v8 recipientTextColorForColorType:v5];

  v9 = [(MFRecipientTableViewCell *)self tintColor];
  LOBYTE(v8) = [v9 isEqual:v10];

  if ((v8 & 1) == 0)
  {
    [(MFRecipientTableViewCell *)self setShouldDimIrrelevantInformation:v5 == -1];
    [(MFRecipientTableViewCell *)self setTintColor:v10 animated:v4];
  }
}

@end