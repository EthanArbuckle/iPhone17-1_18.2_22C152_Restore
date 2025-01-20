@interface NSLocale
+ (id)_distinctiveLanguageIdentifierForLanguageIdentifier:(id)a3;
+ (id)string:(id)a3 withCapitalizedDisplayNamesForFirstLanguageIdentifier:(id)a4 secondLanguageIdentifier:(id)a5 thirdLanguageIdentifier:(id)a6;
@end

@implementation NSLocale

+ (id)string:(id)a3 withCapitalizedDisplayNamesForFirstLanguageIdentifier:(id)a4 secondLanguageIdentifier:(id)a5 thirdLanguageIdentifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[NSMutableArray array];
  v14 = v13;
  if (v10) {
    [v13 addObject:v10];
  }
  if (v11) {
    [v14 addObject:v11];
  }
  id v35 = v11;
  id v36 = v10;
  if (v12) {
    [v14 addObject:v12];
  }
  v34 = v12;
  v15 = +[NSMutableArray array];
  uint64_t v16 = (uint64_t)[v9 rangeOfString:@"%@"];
  if ([v14 count])
  {
    unint64_t v17 = 0;
    do
    {
      if (v16) {
        uint64_t v18 = 5;
      }
      else {
        uint64_t v18 = 4;
      }
      v19 = +[NSLocale _deviceLanguage];
      v20 = +[NSLocale localeWithLocaleIdentifier:v19];
      v21 = [v14 objectAtIndexedSubscript:v17];
      v22 = [v20 localizedStringForLanguage:v21 context:v18];

      [v15 addObject:v22];
      uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v23 = (uint64_t)[v9 rangeOfString:@"%@", 0, v16 + 1, (char *)objc_msgSend(v9, "length") + ~v16 options range];
      }

      ++v17;
      uint64_t v16 = v23;
    }
    while (v17 < (unint64_t)[v14 count]);
  }
  id v24 = v9;
  v25 = v15;
  if ([v15 count] == (char *)&dword_0 + 1)
  {
    v26 = [v15 objectAtIndexedSubscript:0];
    v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v26);
    v28 = v24;
    v30 = v35;
    v29 = v36;
  }
  else
  {
    v31 = (char *)[v15 count];
    v30 = v35;
    v29 = v36;
    if (v31 == (unsigned char *)&dword_0 + 2)
    {
      v26 = [v25 objectAtIndexedSubscript:0];
      v28 = [v25 objectAtIndexedSubscript:1];
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v26, v28);
    }
    else
    {
      v27 = v24;
      if ([v25 count] != (char *)&dword_0 + 3) {
        goto LABEL_22;
      }
      v26 = [v25 objectAtIndexedSubscript:0];
      v28 = [v25 objectAtIndexedSubscript:1];
      v32 = [v25 objectAtIndexedSubscript:2];
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v26, v28, v32);
    }
  }

LABEL_22:

  return v27;
}

+ (id)_distinctiveLanguageIdentifierForLanguageIdentifier:(id)a3
{
  uint64_t v3 = sub_1F4B0();
  sub_18E58(v3, v4);
  swift_bridgeObjectRelease();
  NSString v5 = sub_1F480();
  swift_bridgeObjectRelease();

  return v5;
}

@end