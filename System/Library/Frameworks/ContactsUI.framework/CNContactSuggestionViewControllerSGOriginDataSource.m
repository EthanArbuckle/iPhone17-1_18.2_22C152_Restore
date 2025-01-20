@interface CNContactSuggestionViewControllerSGOriginDataSource
+ (id)contactSuggestionTypeBySuggestionType;
+ (id)dateFormatter;
- (CNContactSuggestionViewControllerSGOriginDataSource)initWithSGOrigin:(id)a3;
- (NSAttributedString)formattedSnippet;
- (NSString)appName;
- (NSString)date;
- (NSString)title;
- (NSString)with;
- (NSURL)url;
- (SGOrigin)origin;
- (id)contactNameFromPerson:(id)a3;
- (unint64_t)type;
- (void)setOrigin:(id)a3;
@end

@implementation CNContactSuggestionViewControllerSGOriginDataSource

- (void).cxx_destruct
{
}

- (void)setOrigin:(id)a3
{
}

- (SGOrigin)origin
{
  return self->_origin;
}

- (NSURL)url
{
  v2 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  v3 = [v2 url];

  return (NSURL *)v3;
}

- (id)contactNameFromPerson:(id)a3
{
  id v3 = a3;
  id v4 = [v3 displayName];
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v4))
  {

    v6 = [v3 handles];
    v7 = [v6 firstObject];

    if ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7)) {
      id v4 = 0;
    }
    else {
      id v4 = v7;
    }
  }

  return v4;
}

- (NSString)with
{
  if ([(CNContactSuggestionViewControllerSGOriginDataSource *)self type] == 1
    || [(CNContactSuggestionViewControllerSGOriginDataSource *)self type] == 4)
  {
    id v3 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    if ([v3 isSent])
    {
      id v4 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
      uint64_t v5 = [v4 toPeople];

      if (v5)
      {
        v6 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
        v7 = [v6 toPeople];
        v8 = [v7 firstObject];
        v9 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self contactNameFromPerson:v8];

LABEL_8:
        goto LABEL_10;
      }
    }
    else
    {
    }
    v6 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    v7 = [v6 fromPerson];
    v9 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self contactNameFromPerson:v7];
    goto LABEL_8;
  }
  v9 = 0;
LABEL_10:
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v10 = NSString;
    v11 = CNContactsUIBundle();
    v12 = [v11 localizedStringForKey:@"SUGGESTION_FROM_APP_WITH_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    v13 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self appName];
    v14 = objc_msgSend(v10, "stringWithFormat:", v12, v13, v9);
  }
  else
  {
    v14 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self appName];
  }

  return (NSString *)v14;
}

- (NSString)date
{
  id v3 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  id v4 = [v3 date];

  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() dateFormatter];
    [v5 setDoesRelativeDateFormatting:1];
    v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v7 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    v8 = [v7 date];
    unsigned int v9 = [v6 isDateInToday:v8];

    [v5 setDateStyle:v9 ^ 1];
    [v5 setTimeStyle:v9];
    v10 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    v11 = [v10 date];
    v12 = [v5 stringFromDate:v11];
  }
  else
  {
    v12 = 0;
  }

  return (NSString *)v12;
}

- (unint64_t)type
{
  id v3 = [(id)objc_opt_class() contactSuggestionTypeBySuggestionType];
  id v4 = NSNumber;
  uint64_t v5 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v7 = [v3 objectForKey:v6];

  if (v7) {
    unint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    unint64_t v8 = 0;
  }

  return v8;
}

- (NSString)title
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  uint64_t v5 = [v4 title];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) == 0)
  {
    v6 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    uint64_t v7 = [v6 title];
    goto LABEL_5;
  }
  if ([(CNContactSuggestionViewControllerSGOriginDataSource *)self type] == 1)
  {
    v6 = CNContactsUIBundle();
    uint64_t v7 = [v6 localizedStringForKey:@"SUGGESTION_REVIEW_MAIL_DEFAULT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
LABEL_5:
    unint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  unint64_t v8 = 0;
LABEL_7:

  return (NSString *)v8;
}

- (NSAttributedString)formattedSnippet
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  id v4 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  uint64_t v5 = [v4 contextSnippet];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if (v3)
  {
    v6 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  if ([v7 contextSnippetRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
  }
  else
  {
    unint64_t v8 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    uint64_t v9 = [v8 contextSnippetRange];
    unint64_t v11 = v9 + v10;
    v12 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
    v13 = [v12 contextSnippet];
    unint64_t v14 = [v13 length];

    if (v11 <= v14)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
      v21 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
      v22 = [v21 contextSnippet];
      v6 = (void *)[v20 initWithString:v22];

      uint64_t v23 = *MEMORY[0x1E4FB0700];
      v24 = +[CNContactStyle currentStyle];
      v25 = [v24 textColor];
      v26 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
      uint64_t v27 = [v26 contextSnippetRange];
      objc_msgSend(v6, "addAttribute:value:range:", v23, v25, v27, v28);

      v19 = [v6 mutableString];
      objc_msgSend(v19, "replaceOccurrencesOfString:withString:options:range:", @"\n\n", @"\n", 0, 0, objc_msgSend(v6, "length"));
      goto LABEL_8;
    }
  }
  v15 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  v16 = [v15 contextSnippet];
  v17 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  v18 = [v17 contextSnippet];
  v19 = objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\n\n", @"\n", 0, 0, objc_msgSend(v18, "length"));

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19];
LABEL_8:

LABEL_9:

  return (NSAttributedString *)v6;
}

- (NSString)appName
{
  v2 = [(CNContactSuggestionViewControllerSGOriginDataSource *)self origin];
  uint64_t v3 = [v2 localizedApplicationName];

  return (NSString *)v3;
}

- (CNContactSuggestionViewControllerSGOriginDataSource)initWithSGOrigin:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewControllerSGOriginDataSource;
  v6 = [(CNContactSuggestionViewControllerSGOriginDataSource *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_origin, a3);
    unint64_t v8 = v7;
  }

  return v7;
}

+ (id)dateFormatter
{
  if (dateFormatter_cn_once_token_2 != -1) {
    dispatch_once(&dateFormatter_cn_once_token_2, &__block_literal_global_38_38378);
  }
  v2 = (void *)dateFormatter_cn_once_object_2;

  return v2;
}

void __68__CNContactSuggestionViewControllerSGOriginDataSource_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateFormatter_cn_once_object_2;
  dateFormatter_cn_once_object_2 = (uint64_t)v0;
}

+ (id)contactSuggestionTypeBySuggestionType
{
  if (contactSuggestionTypeBySuggestionType_cn_once_token_1 != -1) {
    dispatch_once(&contactSuggestionTypeBySuggestionType_cn_once_token_1, &__block_literal_global_38381);
  }
  v2 = (void *)contactSuggestionTypeBySuggestionType_cn_once_object_1;

  return v2;
}

void __92__CNContactSuggestionViewControllerSGOriginDataSource_contactSuggestionTypeBySuggestionType__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED9157E8;
  v2[1] = &unk_1ED915800;
  v3[0] = &unk_1ED9157E8;
  v3[1] = &unk_1ED915800;
  v2[2] = &unk_1ED915818;
  v2[3] = &unk_1ED915830;
  v3[2] = &unk_1ED915818;
  v3[3] = &unk_1ED915830;
  v2[4] = &unk_1ED915848;
  v2[5] = &unk_1ED915860;
  v3[4] = &unk_1ED915848;
  v3[5] = &unk_1ED915860;
  v2[6] = &unk_1ED915878;
  v2[7] = &unk_1ED915890;
  v3[6] = &unk_1ED915878;
  v3[7] = &unk_1ED915890;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)contactSuggestionTypeBySuggestionType_cn_once_object_1;
  contactSuggestionTypeBySuggestionType_cn_once_object_1 = v0;
}

@end