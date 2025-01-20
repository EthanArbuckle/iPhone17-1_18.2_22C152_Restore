@interface UIButton.TemporaryMenuButton
- (_TtCE7ChatKitCSo8UIButtonP33_D14EE3536975491F12EAC53EA3F1D9F419TemporaryMenuButton)initWithCoder:(id)a3;
- (_TtCE7ChatKitCSo8UIButtonP33_D14EE3536975491F12EAC53EA3F1D9F419TemporaryMenuButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation UIButton.TemporaryMenuButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_s19TemporaryMenuButtonCMa();
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = v11.receiver;
  [(UIButton.TemporaryMenuButton *)&v11 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:a5];
  objc_msgSend(v10, sel_removeFromSuperview, v11.receiver, v11.super_class);

  swift_unknownObjectRelease();
}

- (_TtCE7ChatKitCSo8UIButtonP33_D14EE3536975491F12EAC53EA3F1D9F419TemporaryMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s19TemporaryMenuButtonCMa();
  return -[UIButton.TemporaryMenuButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCE7ChatKitCSo8UIButtonP33_D14EE3536975491F12EAC53EA3F1D9F419TemporaryMenuButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s19TemporaryMenuButtonCMa();
  return [(UIButton.TemporaryMenuButton *)&v5 initWithCoder:a3];
}

@end