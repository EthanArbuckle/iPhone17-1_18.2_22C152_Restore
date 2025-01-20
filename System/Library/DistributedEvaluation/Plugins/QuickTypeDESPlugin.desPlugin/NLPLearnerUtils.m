@interface NLPLearnerUtils
+ (BOOL)checkVietnameseCharactersInText:(id)a3;
+ (BOOL)isInternalInstall;
+ (id)getAttachmentURLByName:(id)a3 attachments:(id)a4 error:(id *)a5;
+ (id)getAttachmentURLByName:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (id)languageForText:(id)a3;
+ (id)languageForText:(id)a3 checkVietnamese:(BOOL)a4;
+ (id)messageContentForEvent:(id)a3;
+ (id)messageContentForEvent:(id)a3 andLanguage:(id)a4;
+ (unint64_t)sourceForEvent:(id)a3;
+ (void)initialize;
+ (void)removeTemporaryFile:(id)a3;
@end

@implementation NLPLearnerUtils

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerUtils");
    v3 = (void *)qword_1F110;
    qword_1F110 = (uint64_t)v2;
  }
}

+ (BOOL)isInternalInstall
{
  if (qword_1F120 != -1) {
    dispatch_once(&qword_1F120, &stru_18800);
  }
  return byte_1F118;
}

+ (id)getAttachmentURLByName:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSFileManager defaultManager];
  v10 = [v9 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:a5];

  v11 = +[NLPLearnerUtils getAttachmentURLByName:v8 attachments:v10 error:a5];

  return v11;
}

+ (id)getAttachmentURLByName:(id)a3 attachments:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSFileManager defaultManager];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 lastPathComponent];
        unsigned int v17 = [v16 hasSuffix:v7];

        if (v17)
        {
          v20 = [v15 path];
          unsigned __int8 v21 = [v9 fileExistsAtPath:v20 isDirectory:0];

          if (v21)
          {
            a5 = v15;
          }
          else if (a5)
          {
            NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
            v22 = +[NSString stringWithFormat:@"%@ resource not downloaded", v7];
            v32 = v22;
            v23 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            *a5 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:v23];

            a5 = 0;
          }
          v18 = v10;
          goto LABEL_16;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithFormat:@"missing %@ resource for PFL", v7];
    v30 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    *a5 = +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:v19];

    a5 = 0;
LABEL_16:
  }

  return a5;
}

+ (void)removeTemporaryFile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSFileManager);
  id v7 = 0;
  unsigned int v5 = [v4 removeItemAtPath:v3 error:&v7];
  id v6 = v7;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_DEBUG)) {
      sub_102B8();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_ERROR))
  {
    sub_10320();
  }
}

+ (id)messageContentForEvent:(id)a3
{
  id v3 = [a3 interaction];
  id v4 = INTypedInteractionWithInteraction();

  unsigned int v5 = [v4 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 content];
    if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_DEBUG)) {
      sub_10398();
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 _nonNilParameters],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 containsObject:@"userTypedContent"],
          v7,
          v8))
    {
      id v6 = [v5 userTypedContent];
      if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_DEBUG)) {
        sub_10400();
      }
    }
    else
    {
      v9 = qword_1F110;
      if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_ERROR)) {
        sub_10468(v9);
      }
      id v6 = 0;
    }
  }

  return v6;
}

+ (id)messageContentForEvent:(id)a3 andLanguage:(id)a4
{
  id v5 = a4;
  id v6 = +[NLPLearnerUtils messageContentForEvent:a3];
  if (v6
    && (+[NLPLearnerUtils languageForText:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isEqualToString:v5],
        v7,
        (v8 & 1) != 0))
  {
    if ((unint64_t)[v6 length] > 0x1D
      || ([v5 isEqualToString:NLLanguageKorean] & 1) != 0)
    {
      id v9 = v6;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_DEBUG)) {
      sub_10524();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_DEBUG))
  {
    sub_104AC();
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

+ (unint64_t)sourceForEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 source];
  id v5 = [v4 bundleID];
  unsigned __int8 v6 = [v5 containsString:@"MobileSMS"];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    unsigned __int8 v8 = [v3 source];
    id v9 = [v8 bundleID];
    unsigned __int8 v10 = [v9 containsString:@"mobilemail"];

    if (v10)
    {
      unint64_t v7 = 2;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1F110, OS_LOG_TYPE_ERROR)) {
        sub_1058C();
      }
      unint64_t v7 = 0;
    }
  }

  return v7;
}

+ (id)languageForText:(id)a3
{
  return +[NLPLearnerUtils languageForText:a3 checkVietnamese:1];
}

+ (id)languageForText:(id)a3 checkVietnamese:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4 && ([(id)objc_opt_class() checkVietnameseCharactersInText:v5] & 1) != 0) {
    unsigned __int8 v6 = (Class *)NLCFROLanguageRecognizer_ptr;
  }
  else {
    unsigned __int8 v6 = (Class *)NLLanguageRecognizer_ptr;
  }
  id v7 = objc_alloc_init(*v6);
  [v7 processString:v5];
  unsigned __int8 v8 = [v7 dominantLanguage];

  return v8;
}

+ (BOOL)checkVietnameseCharactersInText:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSCharacterSet vietnameseCharacterSet];
  id v5 = [v3 rangeOfCharacterFromSet:v4];

  return v5 != (id)0x7FFFFFFFFFFFFFFFLL;
}

@end