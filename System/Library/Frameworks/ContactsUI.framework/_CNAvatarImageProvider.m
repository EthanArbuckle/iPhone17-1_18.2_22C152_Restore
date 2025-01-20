@interface _CNAvatarImageProvider
+ (id)roundImage:(id)a3;
- (CNUIPRLikenessProvider)likenessProvider;
- (_CNAvatarImageProvider)initWithLikenessProvider:(id)a3;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (id)imageForSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5;
@end

@implementation _CNAvatarImageProvider

- (void).cxx_destruct
{
}

- (CNUIPRLikenessProvider)likenessProvider
{
  return self->_likenessProvider;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  if (a5 == 1)
  {
    v13 = [(_CNAvatarImageProvider *)self likenessProvider];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v11 = [(_CNAvatarImageProvider *)self likenessProvider];
      uint64_t v12 = objc_msgSend(v11, "_cnui_roundedRectImageForSize:scale:", width, height, a4);
      goto LABEL_7;
    }
LABEL_8:
    v17 = [(_CNAvatarImageProvider *)self likenessProvider];
    char v18 = objc_opt_respondsToSelector();

    v19 = [(_CNAvatarImageProvider *)self likenessProvider];
    v20 = v19;
    if (v18) {
      objc_msgSend(v19, "_cnui_likenessForSize:scale:", width, height, a4);
    }
    else {
    v21 = objc_msgSend(v19, "_cnui_likeness");
    }

    v22 = objc_msgSend(v21, "snapshotWithSize:scale:options:", 0, width, height, a4);
    v16 = [(id)objc_opt_class() roundImage:v22];

    goto LABEL_12;
  }
  if (a5) {
    goto LABEL_8;
  }
  v9 = [(_CNAvatarImageProvider *)self likenessProvider];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
  v11 = [(_CNAvatarImageProvider *)self likenessProvider];
  uint64_t v12 = objc_msgSend(v11, "_cnui_circularImageForSize:scale:", width, height, a4);
LABEL_7:
  uint64_t v15 = v12;

  v16 = [MEMORY[0x1E4FB1818] imageWithCGImage:v15 scale:0 orientation:a4];
LABEL_12:

  return v16;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  return -[_CNAvatarImageProvider imageForSize:scale:style:](self, "imageForSize:scale:style:", 0, a3.width, a3.height, a4);
}

- (_CNAvatarImageProvider)initWithLikenessProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CNAvatarImageProvider;
  v6 = [(_CNAvatarImageProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_likenessProvider, a3);
  }

  return v7;
}

+ (id)roundImage:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v5 = a3;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  [v5 scale];
  CGFloat v11 = v10;
  v16.double width = v7;
  v16.double height = v9;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v11);
  v17.origin.x = v3;
  v17.origin.y = v4;
  v17.size.double width = v7;
  v17.size.double height = v9;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v3, v4, v7, v9, CGRectGetWidth(v17) * 0.5);
  [v12 addClip];

  objc_msgSend(v5, "drawInRect:", v3, v4, v7, v9);
  v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v13;
}

@end