@interface CNCardSharedProfileCellMenuButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CNCardSharedProfileCellMenuButton)init;
@end

@implementation CNCardSharedProfileCellMenuButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNCardSharedProfileCellMenuButton;
  [(CNCardSharedProfileCellMenuButton *)&v9 menuAttachmentPointForConfiguration:a3];
  double v5 = v4;
  [(CNCardSharedProfileCellMenuButton *)self frame];
  double v7 = v6;
  double v8 = v5;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CNCardSharedProfileCellMenuButton)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNCardSharedProfileCellMenuButton;
  v2 = [(CNCardSharedProfileCellMenuButton *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(CNCardSharedProfileCellMenuButton *)v2 setBackgroundColor:v3];

    double v4 = v2;
  }

  return v2;
}

@end