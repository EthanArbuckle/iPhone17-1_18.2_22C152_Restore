@interface NSMutableAttributedString
+ (NSMutableAttributedString)mutableAttributedStringWithString:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 foregroundColor:(id)a6 usingSmallFont:(BOOL)a7;
- (UIColor)foregroundColor;
- (void)setForegroundColor:(id)a3;
@end

@implementation NSMutableAttributedString

+ (NSMutableAttributedString)mutableAttributedStringWithString:(id)a3 alignment:(int64_t)a4 symbolType:(int64_t)a5 foregroundColor:(id)a6 usingSmallFont:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a6;
  id v13 = objc_alloc_init((Class)NSMutableAttributedString);
  v14 = +[NSMutableDictionary dictionary];
  v15 = (id *)&UIFontTextStyleFootnote;
  if (!v7) {
    v15 = (id *)&UIFontTextStyleCallout;
  }
  id v16 = *v15;
  v17 = +[UIFont preferredFontForTextStyle:v16];
  [v14 setObject:v17 forKeyedSubscript:NSFontAttributeName];

  id v18 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v18 setAlignment:a4];
  [v14 setObject:v18 forKeyedSubscript:NSParagraphStyleAttributeName];
  v19 = +[UIImage tpImageForSymbolType:a5 textStyle:v16 scale:3 isStaticSize:0];

  v20 = [v19 imageWithRenderingMode:2];
  v21 = +[NSTextAttachment textAttachmentWithImage:v20];

  id v22 = [UIApp userInterfaceLayoutDirection];
  if (!a4 && v22 != (id)1 || (BOOL v23 = v22 != (id)1, a4 == 2) && v22 == (id)1)
  {
    v24 = +[NSAttributedString attributedStringWithAttachment:v21];
    [v13 appendAttributedString:v24];

    id v25 = objc_alloc((Class)NSAttributedString);
    v26 = [@" " stringByAppendingString:v11];
    id v27 = [v25 initWithString:v26 attributes:v14];
    [v13 appendAttributedString:v27];

LABEL_8:
    goto LABEL_9;
  }
  if (a4) {
    BOOL v23 = 1;
  }
  BOOL v29 = v22 != (id)1 && a4 == 2;
  if (v29 || !v23)
  {
    id v30 = objc_alloc((Class)NSAttributedString);
    v31 = [v11 stringByAppendingString:@" "];
    id v32 = [v30 initWithString:v31 attributes:v14];
    [v13 appendAttributedString:v32];

    v26 = +[NSAttributedString attributedStringWithAttachment:v21];
    [v13 appendAttributedString:v26];
    goto LABEL_8;
  }
LABEL_9:
  [v13 setForegroundColor:v12];

  return (NSMutableAttributedString *)v13;
}

- (void)setForegroundColor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[NSMutableAttributedString addAttribute:value:range:](self, "addAttribute:value:range:", NSForegroundColorAttributeName, v4, 0, [(NSMutableAttributedString *)self length]);
  }
}

- (UIColor)foregroundColor
{
  return (UIColor *)[(NSMutableAttributedString *)self attribute:NSForegroundColorAttributeName atIndex:0 effectiveRange:0];
}

@end