@interface AAUIDataclassHelper
+ (id)attributedLinkForDataclass:(id)a3;
+ (id)dataclassAttributedLinkDictionary;
+ (id)dataclassSubTitleDictionary:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5;
+ (id)dataclassTitleDictionary;
+ (id)healthDataclassSubtitleForSecurityLevel:(unint64_t)a3;
+ (id)localizedSubTitleForDataclass:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5;
+ (id)localizedTitleForDataclass:(id)a3;
+ (unint64_t)currentSecurityLevel:(unint64_t)a3;
@end

@implementation AAUIDataclassHelper

+ (id)localizedTitleForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [a1 dataclassTitleDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)localizedSubTitleForDataclass:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "localizedSubTitleForDataclass idmsAccount: %@, securityLevel: %lu", (uint8_t *)&v14, 0x16u);
  }

  v11 = [a1 dataclassSubTitleDictionary:v9 idmsAccount:v8 securityLevel:a5];
  v12 = [v11 objectForKeyedSubscript:v9];

  return v12;
}

+ (id)attributedLinkForDataclass:(id)a3
{
  id v4 = a3;
  v5 = [a1 dataclassAttributedLinkDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)dataclassTitleDictionary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6D54;
  block[3] = &unk_752D0;
  block[4] = a1;
  if (qword_8FFA0 != -1) {
    dispatch_once(&qword_8FFA0, block);
  }
  v2 = (void *)qword_8FF98;

  return v2;
}

+ (id)dataclassSubTitleDictionary:(id)a3 idmsAccount:(id)a4 securityLevel:(unint64_t)a5
{
  unsigned int v8 = [a3 isEqualToString:ACAccountDataclassHealth];
  if (a4 && v8)
  {
    id v9 = [a1 healthDataclassSubtitleForSecurityLevel:a5];
  }
  else
  {
    v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "IdMS account is nil. Proceeding with default subtitles for Health dataclass.", buf, 2u);
    }

    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"HEALTH_DATACLASS_SUBTITLE_DEFAULT"];
    id v9 = [v11 localizedStringForKey:v12 value:&stru_76890 table:@"Localizable"];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_72DC;
  v17[3] = &unk_75398;
  id v18 = v9;
  id v19 = a1;
  uint64_t v13 = qword_8FFB0;
  id v14 = v9;
  if (v13 != -1) {
    dispatch_once(&qword_8FFB0, v17);
  }
  id v15 = (id)qword_8FFA8;

  return v15;
}

+ (id)healthDataclassSubtitleForSecurityLevel:(unint64_t)a3
{
  switch((unint64_t)[a1 currentSecurityLevel:a3])
  {
    case 0uLL:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v5 = @"HEALTH_DATACLASS_SUBTITLE_DEFAULT";
      goto LABEL_6;
    case 1uLL:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v5 = @"HEALTH_DATACLASS_SUBTITLE_PASSCODE_HSA2";
      goto LABEL_6;
    case 2uLL:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v5 = @"HEALTH_DATACLASS_SUBTITLE_PASSCODE";
      goto LABEL_6;
    case 3uLL:
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      CFStringRef v5 = @"HEALTH_DATACLASS_SUBTITLE_NO_PASSCODE_HSA2";
LABEL_6:
      v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v5];
      v3 = [v4 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

      break;
    default:
      break;
  }

  return v3;
}

+ (unint64_t)currentSecurityLevel:(unint64_t)a3
{
  id v4 = +[CDPLocalDevice sharedInstance];
  unsigned int v5 = [v4 hasLocalSecret];

  unint64_t v6 = 1;
  if (a3 != 4) {
    unint64_t v6 = 2;
  }
  unint64_t v7 = 3;
  if (a3 != 4) {
    unint64_t v7 = 0;
  }
  if (v5) {
    return v6;
  }
  else {
    return v7;
  }
}

+ (id)dataclassAttributedLinkDictionary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7784;
  block[3] = &unk_752D0;
  block[4] = a1;
  if (qword_8FFC0 != -1) {
    dispatch_once(&qword_8FFC0, block);
  }
  v2 = (void *)qword_8FFB8;

  return v2;
}

@end