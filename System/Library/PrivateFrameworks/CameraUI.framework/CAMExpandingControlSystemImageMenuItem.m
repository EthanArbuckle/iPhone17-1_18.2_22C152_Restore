@interface CAMExpandingControlSystemImageMenuItem
+ (id)menuItemWithState:(id)a3 systemImageName:(id)a4 symbolConfiguration:(id)a5 subtitle:(id)a6 selectedSubtitle:(id)a7 configuration:(id)a8;
- (BOOL)isEqualToItem:(id)a3;
- (NSString)_systemImageName;
- (UIImage)_titleImage;
- (UIImage)titleImage;
- (UIImageSymbolConfiguration)_symbolConfiguration;
- (id)_imageWithConfiguration:(id)a3;
@end

@implementation CAMExpandingControlSystemImageMenuItem

+ (id)menuItemWithState:(id)a3 systemImageName:(id)a4 symbolConfiguration:(id)a5 subtitle:(id)a6 selectedSubtitle:(id)a7 configuration:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___CAMExpandingControlSystemImageMenuItem;
  v16 = objc_msgSendSuper2(&v21, sel__menuItemWithState_subtitle_selectedSubtitle_configuration_, a3, a6, a7, a8);
  v17 = (void *)v16[5];
  v16[5] = v14;
  id v18 = v14;

  v19 = (void *)v16[6];
  v16[6] = v15;

  return v16;
}

- (UIImage)titleImage
{
  v3 = [(CAMExpandingControlSystemImageMenuItem *)self _titleImage];

  if (!v3)
  {
    v4 = [MEMORY[0x263F82818] configurationWithPointSize:14.0];
    v5 = [(CAMExpandingControlSystemImageMenuItem *)self _imageWithConfiguration:v4];
    titleImage = self->__titleImage;
    self->__titleImage = v5;
  }
  return [(CAMExpandingControlSystemImageMenuItem *)self _titleImage];
}

- (id)_imageWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(CAMExpandingControlSystemImageMenuItem *)self _symbolConfiguration];

  if (v5)
  {
    v6 = [(CAMExpandingControlSystemImageMenuItem *)self _symbolConfiguration];
    id v7 = [v6 configurationByApplyingConfiguration:v4];
  }
  else
  {
    id v7 = v4;
  }
  v8 = (void *)MEMORY[0x263F827E8];
  v9 = [(CAMExpandingControlSystemImageMenuItem *)self _systemImageName];
  v10 = [v8 systemImageNamed:v9 withConfiguration:v7];

  return v10;
}

- (BOOL)isEqualToItem:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMExpandingControlSystemImageMenuItem;
  if ([(CAMExpandingControlMenuItem *)&v16 isEqualToItem:v6])
  {
    id v7 = [(CAMExpandingControlSystemImageMenuItem *)self _systemImageName];
    v8 = [v6 _systemImageName];
    if (v7 == v8
      || ([(CAMExpandingControlSystemImageMenuItem *)self _systemImageName],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 _systemImageName],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      v10 = [(CAMExpandingControlSystemImageMenuItem *)self _symbolConfiguration];
      uint64_t v11 = [v6 _symbolConfiguration];
      if (v10 == (void *)v11)
      {

        char v9 = 1;
      }
      else
      {
        v12 = (void *)v11;
        v13 = [(CAMExpandingControlSystemImageMenuItem *)self _symbolConfiguration];
        id v14 = [v6 _symbolConfiguration];
        char v9 = [v13 isEqualToConfiguration:v14];
      }
      if (v7 == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      char v9 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (NSString)_systemImageName
{
  return self->__systemImageName;
}

- (UIImageSymbolConfiguration)_symbolConfiguration
{
  return self->__symbolConfiguration;
}

- (UIImage)_titleImage
{
  return self->__titleImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleImage, 0);
  objc_storeStrong((id *)&self->__symbolConfiguration, 0);
  objc_storeStrong((id *)&self->__systemImageName, 0);
}

@end