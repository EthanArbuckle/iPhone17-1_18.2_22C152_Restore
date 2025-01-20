@interface CNContactActionDropdownMenuButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CNContactActionDropdownMenuButton)init;
@end

@implementation CNContactActionDropdownMenuButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactActionDropdownMenuButton *)self traitCollection];
  uint64_t v6 = [v5 horizontalSizeClass];

  if (v6 == 2)
  {
    [(CNContactActionDropdownMenuButton *)self frame];
    CGFloat MidX = CGRectGetMidX(v15);
    double v8 = 0.0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CNContactActionDropdownMenuButton;
    [(CNContactActionDropdownMenuButton *)&v13 menuAttachmentPointForConfiguration:v4];
    CGFloat MidX = v9;
    double v8 = v10;
  }

  double v11 = MidX;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CNContactActionDropdownMenuButton)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactActionDropdownMenuButton;
  v2 = [(CNContactActionDropdownMenuButton *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(CNContactActionDropdownMenuButton *)v2 setBackgroundColor:v3];

    id v4 = v2;
  }

  return v2;
}

@end