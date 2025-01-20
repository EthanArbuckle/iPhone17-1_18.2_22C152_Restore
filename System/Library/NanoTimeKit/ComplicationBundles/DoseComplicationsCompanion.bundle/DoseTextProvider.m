@interface DoseTextProvider
- (id)attributedTextAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 now:(id)a6;
@end

@implementation DoseTextProvider

- (id)attributedTextAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 now:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)DoseTextProvider;
  v6 = [(DoseTextProvider *)&v10 attributedTextAndSize:a3 forMaxWidth:a5 withStyle:a6 now:a4];
  if (v6)
  {
    dword_10B18 = (dword_10B18 + 1) % 100;
    id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v6];
    v8 = +[NSNumber numberWithInt:dword_10B18];
    objc_msgSend(v7, "addAttribute:value:range:", @"_CLK_Workaround_Key", v8, 0, 1);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end