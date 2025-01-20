@interface LanguageUtilities
+ (BOOL)isChineseJapaneseToken:(id)a3;
+ (BOOL)isChineseLanguageTag:(id)a3;
+ (BOOL)isJapaneseLanguageTag:(id)a3;
+ (id)partsOfSpeechInText:(id)a3;
+ (id)simplifyLanguageTag:(id)a3;
+ (id)simplifyTextForSearch:(id)a3 withLanguage:(id)a4;
+ (id)transliterateTextToLanguageScript:(id)a3 withSimplifiedLanguage:(id)a4;
+ (void)initialize;
@end

@implementation LanguageUtilities

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)qword_100562FD0;
    qword_100562FD0 = (uint64_t)&off_1004B1D50;

    uint64_t v3 = +[NSSet setWithArray:&off_1004B1CD8];
    v4 = (void *)qword_100562FD8;
    qword_100562FD8 = v3;

    qword_100562FE0 = +[NSRegularExpression regularExpressionWithPattern:@"[\\p{Han}\\p{Hiragana}\\p{Katakana}]" options:0 error:0];
    _objc_release_x1();
  }
}

+ (id)partsOfSpeechInText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = objc_alloc((Class)NLTagger);
    NLTagScheme v29 = NLTagSchemeNameTypeOrLexicalClass;
    v6 = +[NSArray arrayWithObjects:&v29 count:1];
    id v7 = [v5 initWithTagSchemes:v6];

    [v7 setString:v3];
    v28[0] = NLTagNoun;
    v28[1] = NLTagAdverb;
    v28[2] = NLTagVerb;
    v28[3] = NLTagPronoun;
    v28[4] = NLTagPersonalName;
    v28[5] = NLTagAdjective;
    v28[6] = NLTagPlaceName;
    v8 = +[NSArray arrayWithObjects:v28 count:7];
    id v9 = [v3 length];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_1002A6E5C;
    v24 = &unk_10048B918;
    id v10 = v8;
    id v25 = v10;
    id v11 = v3;
    id v26 = v11;
    id v12 = v4;
    id v27 = v12;
    objc_msgSend(v7, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v9, 0, NLTagSchemeNameTypeOrLexicalClass, 22, &v21);
    v13 = objc_msgSend(v12, "allKeys", v21, v22, v23, v24);
    id v14 = [v13 count];

    if (!v14)
    {
      v15 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      v16 = [v11 componentsSeparatedByCharactersInSet:v15];
      v17 = +[NSSet setWithArray:v16];
      [v12 setObject:v17 forKeyedSubscript:@"other"];
    }
    v18 = v27;
    id v19 = v12;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)simplifyLanguageTag:(id)a3
{
  id v3 = a3;
  id v4 = [(id)qword_100562FD0 objectForKeyedSubscript:v3];
  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [v3 rangeOfString:@"-"];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringWithRange:", 0, v6);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v7 = v5;

  return v7;
}

+ (id)simplifyTextForSearch:(id)a3 withLanguage:(id)a4
{
  id v5 = a3;
  id v6 = +[LanguageUtilities simplifyLanguageTag:a4];
  if ([@"zht" isEqualToString:v6])
  {
    id v7 = +[NSMutableString stringWithString:v5];
    CFStringTransform(v7, 0, @"Traditional-Simplified", 0);
  }
  else
  {
    id v7 = (__CFString *)v5;
  }

  return v7;
}

+ (id)transliterateTextToLanguageScript:(id)a3 withSimplifiedLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([@"zhs" isEqualToString:v6])
  {
    id v7 = +[NSMutableString stringWithString:v5];
    v8 = v7;
    CFStringRef v9 = @"Traditional-Simplified";
LABEL_5:
    CFStringTransform(v7, 0, v9, 0);
    goto LABEL_7;
  }
  if ([@"zht" isEqualToString:v6])
  {
    id v7 = +[NSMutableString stringWithString:v5];
    v8 = v7;
    CFStringRef v9 = @"Simplified-Traditional";
    goto LABEL_5;
  }
  v8 = (__CFString *)v5;
LABEL_7:

  return v8;
}

+ (BOOL)isChineseLanguageTag:(id)a3
{
  id v3 = +[LanguageUtilities simplifyLanguageTag:a3];
  unsigned __int8 v4 = [(id)qword_100562FD8 containsObject:v3];

  return v4;
}

+ (BOOL)isJapaneseLanguageTag:(id)a3
{
  id v3 = +[LanguageUtilities simplifyLanguageTag:a3];
  unsigned __int8 v4 = [@"ja" isEqualToString:v3];

  return v4;
}

+ (BOOL)isChineseJapaneseToken:(id)a3
{
  id v3 = (void *)qword_100562FE0;
  id v4 = a3;
  id v5 = objc_msgSend(v3, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  return v5 != 0;
}

@end