@interface CNAvatarImageRenderingScope
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6;
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7;
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7;
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8;
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11;
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9;
@end

@implementation CNAvatarImageRenderingScope

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 backgroundStyle:(unint64_t)a9 color:(id)a10 maskedAvatarIndices:(id)a11
{
  BOOL v15 = a7;
  double height = a3.height;
  double width = a3.width;
  v20 = (void *)MEMORY[0x1E4F5A6C8];
  id v21 = a6;
  id v22 = a11;
  id v23 = a10;
  uint64_t v24 = [v21 CGColor];
  if (a9 - 1 >= 4) {
    unint64_t v25 = 0;
  }
  else {
    unint64_t v25 = a9;
  }
  v26 = objc_msgSend(v20, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", v24, v15, a8 == 1, v25, v23, v22, width, height, a4, a5);

  return v26;
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6
{
  return (id)objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, a5, a6, a3.width, a3.height, a4, 0.0);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8
{
  BOOL v9 = a7;
  double height = a3.height;
  double width = a3.width;
  v14 = (void *)MEMORY[0x1E4F5A6C8];
  uint64_t v15 = [a6 CGColor];

  return (id)objc_msgSend(v14, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", v15, v9, a8 == 1, 0, width, height, a4, a5);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 strokeWidth:(double)a5 strokeColor:(id)a6 rightToLeft:(BOOL)a7 style:(unint64_t)a8 color:(id)a9
{
  BOOL v11 = a7;
  double height = a3.height;
  double width = a3.width;
  v16 = (void *)MEMORY[0x1E4F5A6C8];
  id v17 = a6;
  id v18 = a9;
  v19 = objc_msgSend(v16, "renderingScopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", objc_msgSend(v17, "CGColor"), v11, a8 == 1, v18, width, height, a4, a5);

  return v19;
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 color:(id)a7
{
  return (id)objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:color:", 0, a5, a6, a7, a3.width, a3.height, a4, 0.0);
}

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7
{
  BOOL v9 = a5;
  double height = a3.height;
  double width = a3.width;
  v14 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v15 = objc_msgSend(a1, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:backgroundStyle:color:maskedAvatarIndices:", 0, v9, a6, a7, 0, v14, width, height, a4, 0.0);

  return v15;
}

@end