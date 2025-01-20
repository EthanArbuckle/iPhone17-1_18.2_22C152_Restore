@interface NSPersonNameComponentsFormatter
+ (id)formatterWithCNContactStyle:(uint64_t)a1;
+ (uint64_t)contactsNameOrderFromFoundationNameOrder:(uint64_t)a1;
- (id)stringFromContact:(id)a1;
@end

@implementation NSPersonNameComponentsFormatter

+ (id)formatterWithCNContactStyle:(uint64_t)a1
{
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  v4 = v3;
  if (a2 > 999)
  {
    if (a2 == 1000)
    {
      uint64_t v5 = 1;
    }
    else
    {
      if (a2 != 1001)
      {
        if (a2 == 1002)
        {
          [v3 setStyle:4];
          objc_msgSend(v4, "set_ignoresFallbacks:", 1);
        }
        goto LABEL_13;
      }
      uint64_t v5 = 31;
    }
LABEL_12:
    [v3 setStyle:v5];
    goto LABEL_13;
  }
  if (!a2)
  {
    uint64_t v5 = 3;
    goto LABEL_12;
  }
  if (a2 == 1)
  {
    [v3 setStyle:3];
    [v4 setPhonetic:1];
  }
LABEL_13:

  return v4;
}

- (id)stringFromContact:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F28F30] componentsForContact:a2];
    id v2 = [v2 stringFromPersonNameComponents:v3];
  }

  return v2;
}

+ (uint64_t)contactsNameOrderFromFoundationNameOrder:(uint64_t)a1
{
  return a2;
}

@end