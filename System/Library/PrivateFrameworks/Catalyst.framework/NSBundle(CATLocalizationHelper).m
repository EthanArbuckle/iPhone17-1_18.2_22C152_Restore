@interface NSBundle(CATLocalizationHelper)
- (id)cat_localizedStringsForKey:()CATLocalizationHelper value:table:;
@end

@implementation NSBundle(CATLocalizationHelper)

- (id)cat_localizedStringsForKey:()CATLocalizationHelper value:table:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[CATLocalizationHelper helperForBundle:a1];
  v12 = [v11 stringsForKey:v10 value:v9 table:v8];

  return v12;
}

@end