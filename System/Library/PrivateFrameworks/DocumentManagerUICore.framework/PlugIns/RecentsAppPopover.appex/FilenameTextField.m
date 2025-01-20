@interface FilenameTextField
- (BOOL)becomeFirstResponder;
- (BOOL)isEnabled;
- (BOOL)supportsImagePaste;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation FilenameTextField

- (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField)initWithFrame:(CGRect)a3
{
  return (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField *)sub_100276F98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField_prefersInitallySelectedText) = 1;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField_hasEverBeenFirstResponder) = 0;
  id v4 = a3;

  result = (_TtC17RecentsAppPopoverP33_3EADBF6410DB599A54F451AD56E4691517FilenameTextField *)sub_1004C0670();
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FilenameTextField();
  return [(FilenameTextField *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FilenameTextField();
  id v4 = v5.receiver;
  [(FilenameTextField *)&v5 setEnabled:v3];
  sub_100277210();
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_100277428();

  return v3 & 1;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  sub_100277790(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  sub_100277790(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  if ([(FilenameTextField *)v8 isEnabled]
    || (id v9 = [(FilenameTextField *)v8 rightView]) == 0)
  {
    v13.receiver = v8;
    v13.super_class = (Class)type metadata accessor for FilenameTextField();
    id v11 = -[FilenameTextField hitTest:withEvent:](&v13, "hitTest:withEvent:", v7, x, y);
  }
  else
  {
    v10 = v9;
    -[FilenameTextField convertPoint:toCoordinateSpace:](v8, "convertPoint:toCoordinateSpace:", v9, x, y);
    id v11 = objc_msgSend(v10, "hitTest:withEvent:", v7);
  }
  return v11;
}

@end