@interface NSMutableString
- (void)_speakThisAppendString:(id)a3 withPause:(BOOL)a4;
@end

@implementation NSMutableString

- (void)_speakThisAppendString:(id)a3 withPause:(BOOL)a4
{
  id v10 = a3;
  if (![v10 length]) {
    goto LABEL_12;
  }
  if (a4)
  {
    CFStringRef v6 = @",\n ";
LABEL_6:
    [(NSMutableString *)self appendString:v6];
    goto LABEL_7;
  }
  if ([(NSMutableString *)self length])
  {
    CFStringRef v6 = @" ";
    goto LABEL_6;
  }
LABEL_7:
  if ([v10 isAXAttributedString])
  {
    unsigned int v7 = [v10 hasAttribute:UIAccessibilityTokenConvertTextToLowercase];
    id v8 = v10;
    if (v7)
    {
      uint64_t v9 = [v10 lowercaseString];

      id v8 = (id)v9;
    }
  }
  else
  {
    id v8 = v10;
  }
  id v10 = v8;
  [(NSMutableString *)self appendString:v8];
LABEL_12:
}

@end