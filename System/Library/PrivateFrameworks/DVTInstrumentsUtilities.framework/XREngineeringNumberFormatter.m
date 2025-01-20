@interface XREngineeringNumberFormatter
+ (id)CLIPSLiteralFormatter;
+ (void)initialize;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
@end

@implementation XREngineeringNumberFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)qword_2687AA280;
    qword_2687AA280 = v2;

    v8 = [MEMORY[0x263EFF960] systemLocale:v4, v5, v6, v7];
    [qword_2687AA280 setLocale:v9 forLanguage:v8];

    v15 = (void *)qword_2687AA280;
    [v15 setUsesGroupingSeparator:v12];
  }
}

+ (id)CLIPSLiteralFormatter
{
  return (id)qword_2687AA280;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = a4;
  uint64_t v18 = 0;
  if ([v8 _getLongLong:v9 withTransitionContext:v10 completion:v11])
  {
    if (a3)
    {
      [NSNumber numberWithLongLong:v12];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)XREngineeringNumberFormatter;
    BOOL v15 = [(XREngineeringNumberFormatter *)&v17 getObjectValue:a3 forString:v8 errorDescription:a5];
  }

  return v15;
}

@end