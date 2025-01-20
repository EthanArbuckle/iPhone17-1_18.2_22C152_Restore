@interface NSAttributedString(MailUI)
+ (id)mui_attributedStringWithAttributedString:()MailUI attributes:;
+ (id)mui_attributedStringWithImage:()MailUI string:keyword:;
+ (id)mui_attributedStringWithString:()MailUI attributes:;
- (double)mui_boundingHeightForWidth:()MailUI font:;
@end

@implementation NSAttributedString(MailUI)

+ (id)mui_attributedStringWithString:()MailUI attributes:
{
  id v4 = a3;
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E4F28B18];
    id v6 = a4;
    id v7 = v4;
    id v4 = (id)[[v5 alloc] initWithString:v7 attributes:v6];
  }
  return v4;
}

+ (id)mui_attributedStringWithAttributedString:()MailUI attributes:
{
  id v4 = a3;
  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E4F28E48];
    id v6 = a4;
    id v7 = v4;
    id v4 = (id)[[v5 alloc] initWithAttributedString:v7];
    uint64_t v8 = [v7 length];

    objc_msgSend(v4, "addAttributes:range:", v6, 0, v8);
  }
  return v4;
}

- (double)mui_boundingHeightForWidth:()MailUI font:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28B18];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v15[0] = a4;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  v9 = [v7 dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v10 = objc_msgSend(v6, "mui_attributedStringWithAttributedString:attributes:", a1, v9);

  objc_msgSend(v10, "boundingRectWithSize:options:context:", 3, 0, a2, 3.40282347e38);
  double v12 = v11;

  return ceil(v12);
}

+ (id)mui_attributedStringWithImage:()MailUI string:keyword:
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 componentsSeparatedByString:a5];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v11 = [v9 count];
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  v13 = v12;
  if (v11 == 2)
  {
    uint64_t v14 = [v9 firstObject];
    v15 = (void *)[v13 initWithString:v14];

    [v10 appendAttributedString:v15];
    id v16 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v16 setImage:v7];
    v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
    [v10 appendAttributedString:v17];
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = [v9 objectAtIndexedSubscript:1];
    v20 = (void *)[v18 initWithString:v19];

    [v10 appendAttributedString:v20];
  }
  else
  {
    v15 = (void *)[v12 initWithString:v8];
    [v10 appendAttributedString:v15];
  }

  return v10;
}

@end