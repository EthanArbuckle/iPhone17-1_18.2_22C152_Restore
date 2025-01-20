@interface UIImage(ChatKit)
+ (id)ck_imageWithEmoji:()ChatKit;
@end

@implementation UIImage(ChatKit)

+ (id)ck_imageWithEmoji:()ChatKit
{
  v3 = (objc_class *)MEMORY[0x1E4F42B38];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setText:v4];

  [v5 setTextAlignment:1];
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:75.0];
  [v5 setFont:v6];

  [v5 sizeToFit];
  id v7 = objc_alloc(MEMORY[0x1E4F42A58]);
  [v5 bounds];
  v10 = objc_msgSend(v7, "initWithSize:", v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__UIImage_ChatKit__ck_imageWithEmoji___block_invoke;
  v14[3] = &unk_1E5620DE8;
  id v15 = v5;
  id v11 = v5;
  v12 = [v10 imageWithActions:v14];

  return v12;
}

@end