@interface CKAutoupdatingRelativeDateFormatter
+ (id)relativeDateFormatter;
+ (id)relativeStringFromDate:(id)a3;
+ (id)weekdayTemplateCharacters;
- (id)stringFromDate:(id)a3;
- (id)stringFromDate:(id)a3 isRelative:(BOOL *)a4;
@end

@implementation CKAutoupdatingRelativeDateFormatter

- (id)stringFromDate:(id)a3
{
  return [(CKAutoupdatingRelativeDateFormatter *)self stringFromDate:a3 isRelative:0];
}

- (id)stringFromDate:(id)a3 isRelative:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = +[CKAutoupdatingRelativeDateFormatter relativeStringFromDate:v6];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(CKAutoupdatingRelativeDateFormatter *)self dateFormat];
    uint64_t v10 = [v9 length];
    v11 = +[CKAutoupdatingRelativeDateFormatter weekdayTemplateCharacters];
    uint64_t v12 = objc_msgSend(v9, "__ck_rangeOfSequenceOfCharactersFromSet:options:range:", v11, 0, 0, v10);
    BOOL v14 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22.receiver = self;
      v22.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
      v19 = [(CKAutoupdatingRelativeDateFormatter *)&v22 stringFromDate:v6];
    }
    else
    {
      uint64_t v15 = v12;
      uint64_t v16 = v13;
      uint64_t v21 = [v8 stringByReplacingOccurrencesOfString:@"'" withString:@"''"];

      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v9];
      v18 = [NSString stringWithFormat:@"'%@'", v21];
      objc_msgSend(v17, "replaceCharactersInRange:withString:", v15, v16, v18);

      [(CKAutoupdatingRelativeDateFormatter *)self setDateFormat:v17];
      v23.receiver = self;
      v23.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
      v19 = [(CKAutoupdatingRelativeDateFormatter *)&v23 stringFromDate:v6];
      [(CKAutoupdatingRelativeDateFormatter *)self setDateFormat:v9];

      v8 = (void *)v21;
    }

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v24.receiver = self;
  v24.super_class = (Class)CKAutoupdatingRelativeDateFormatter;
  v19 = [(CKAutoupdatingRelativeDateFormatter *)&v24 stringFromDate:v6];
  BOOL v14 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v14;
LABEL_9:

  return v19;
}

+ (id)relativeDateFormatter
{
  return +[CKDateUtilities theRelativeStandaloneDateFormatter];
}

+ (id)relativeStringFromDate:(id)a3
{
  id v4 = a3;
  v5 = [a1 relativeDateFormatter];
  id v6 = [v5 stringFromDate:v4];

  uint64_t v7 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  uint64_t v8 = [v6 rangeOfCharacterFromSet:v7 options:0];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {

    id v6 = 0;
  }

  return v6;
}

+ (id)weekdayTemplateCharacters
{
  if (weekdayTemplateCharacters_once != -1) {
    dispatch_once(&weekdayTemplateCharacters_once, &__block_literal_global_173);
  }
  v2 = (void *)weekdayTemplateCharacters_sWeekdayTemplateCharacters;

  return v2;
}

void __64__CKAutoupdatingRelativeDateFormatter_weekdayTemplateCharacters__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"Eec"];
  v1 = (void *)weekdayTemplateCharacters_sWeekdayTemplateCharacters;
  weekdayTemplateCharacters_sWeekdayTemplateCharacters = v0;
}

@end