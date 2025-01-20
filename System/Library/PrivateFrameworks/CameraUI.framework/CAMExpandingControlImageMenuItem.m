@interface CAMExpandingControlImageMenuItem
+ (id)menuItemWithState:(id)a3 titleImage:(id)a4 subtitle:(id)a5 selectedSubtitle:(id)a6 configuration:(id)a7;
- (BOOL)isEqualToItem:(id)a3;
- (UIImage)titleImage;
@end

@implementation CAMExpandingControlImageMenuItem

+ (id)menuItemWithState:(id)a3 titleImage:(id)a4 subtitle:(id)a5 selectedSubtitle:(id)a6 configuration:(id)a7
{
  id v12 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CAMExpandingControlImageMenuItem;
  v13 = objc_msgSendSuper2(&v16, sel__menuItemWithState_subtitle_selectedSubtitle_configuration_, a3, a5, a6, a7);
  v14 = (void *)v13[5];
  v13[5] = v12;

  return v13;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMExpandingControlImageMenuItem;
  if ([(CAMExpandingControlMenuItem *)&v9 isEqualToItem:v4])
  {
    v5 = [(CAMExpandingControlImageMenuItem *)self titleImage];
    v6 = [v4 titleImage];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void).cxx_destruct
{
}

@end