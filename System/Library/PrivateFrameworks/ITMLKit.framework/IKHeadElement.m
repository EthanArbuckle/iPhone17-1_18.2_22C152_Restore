@interface IKHeadElement
+ (BOOL)shouldParseChildDOMElement:(id)a3;
@end

@implementation IKHeadElement

+ (BOOL)shouldParseChildDOMElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 tagName];
  if ([v5 isEqualToString:@"style"])
  {
  }
  else
  {
    v6 = [v4 tagName];
    char v7 = [v6 isEqualToString:@"script"];

    if ((v7 & 1) == 0)
    {
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___IKHeadElement;
      unsigned __int8 v8 = objc_msgSendSuper2(&v10, sel_shouldParseChildDOMElement_, v4);
      goto LABEL_6;
    }
  }
  unsigned __int8 v8 = 0;
LABEL_6:

  return v8;
}

@end