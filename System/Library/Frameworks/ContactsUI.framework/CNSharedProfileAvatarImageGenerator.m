@interface CNSharedProfileAvatarImageGenerator
+ (id)fallbackImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6;
+ (id)sharedAvatarImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6;
@end

@implementation CNSharedProfileAvatarImageGenerator

+ (id)fallbackImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  if ([v9 isUsingSharedPhoto])
  {
    v10 = [CNAvatarImageRenderer alloc];
    v11 = +[CNAvatarImageRendererSettings defaultSettings];
    v12 = [(CNAvatarImageRenderer *)v10 initWithSettings:v11];

    v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    v15 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v6, 0, width, height, v14);

    v16 = [(CNAvatarImageRenderer *)v12 renderMonogramForContact:v9 color:0 scope:v15 prohibitedSources:0];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)sharedAvatarImageForNickname:(id)a3 contact:(id)a4 size:(CGSize)a5 isRTL:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  v13 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  double v14 = [v13 nicknameProvider];
  v15 = [v14 avatarImageFileURLForNickname:v11];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v17 = [v16 fileManager];
    v18 = [v17 dataWithContentsOfURL:v15];
    v19 = [v18 value];

    v20 = [MEMORY[0x1E4FB1818] imageWithData:v19];
    v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      objc_msgSend(a1, "fallbackImageForNickname:contact:size:isRTL:", v11, v12, v6, width, height);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
  }
  else
  {
    v23 = objc_msgSend(a1, "fallbackImageForNickname:contact:size:isRTL:", v11, v12, v6, width, height);
  }

  return v23;
}

@end