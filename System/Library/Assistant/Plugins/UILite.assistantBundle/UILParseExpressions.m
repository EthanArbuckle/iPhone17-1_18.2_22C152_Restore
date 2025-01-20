@interface UILParseExpressions
- (void)performWithCompletion:(id)a3;
@end

@implementation UILParseExpressions

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (!v4) {
    goto LABEL_24;
  }
  v47 = (void (**)(void, void))v4;
  v6 = +[AFClientPluginManager clientPluginManagerWithFactoryInitializationBlock:0];
  id v7 = objc_alloc((Class)AFSpeakableUtteranceParser);
  id v8 = objc_alloc((Class)NSLocale);
  v9 = +[AFPreferences sharedPreferences];
  v10 = [v9 languageCode];
  id v11 = [v8 initWithLocaleIdentifier:v10];
  id v12 = [v7 initWithLocale:v11];

  v52 = v12;
  [v12 setHandleTTSCodes:1];
  id v54 = objc_alloc_init((Class)NSMutableArray);
  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v46 = self;
  id obj = [(UILParseExpressions *)self expressions];
  id v13 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (!v13) {
    goto LABEL_20;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v57;
  uint64_t v51 = _AFSpeakableUtteranceParserObjDomain;
  uint64_t v48 = SASmsSmsDeferredMessageKeyValue;
  v49 = v6;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v57 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      v18 = [v17 context];
      v19 = [v6 speakableNamespaceProviderForAceObject:v18];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [v52 registerProvider:v19 forNamespace:v51];
        v22 = [v17 expressionString];
        id v55 = 0;
        id v23 = [v52 parseStringWithFormat:v22 error:&v55];
        id v27 = v55;
        if (v27)
        {
          v28 = v27;
          id v29 = [v17 aceId];
          [v50 setObject:v28 forKey:v29];

LABEL_16:
          goto LABEL_17;
        }
        id v29 = objc_alloc_init((Class)SAUILParsedExpression);
        v35 = +[NSUUID UUID];
        v36 = [v35 UUIDString];
        [v29 setAceId:v36];

        v6 = v49;
        [v29 setParseableExpression:v17];
        [v29 setParsedOutput:v23];
LABEL_15:
        [v54 addObject:v29];
        goto LABEL_16;
      }
      v20 = [v17 context];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v30 = [v17 context];
        objc_opt_class();
        char v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) == 0) {
          goto LABEL_18;
        }
        v22 = [v17 context];
        id v23 = [v22 identifier];
        id v29 = objc_alloc_init((Class)SAUILParsedAttachmentExpression);
        v32 = +[NSUUID UUID];
        v33 = [v32 UUIDString];
        [v29 setAceId:v33];

        v6 = v49;
        [v29 setParseableExpression:v17];
        v34 = +[NSData dataWithContentsOfURL:v23];
        [v29 setAttachment:v34];

        goto LABEL_15;
      }
      v22 = [v19 attachmentURLForExpression:v48];
      id v23 = objc_alloc_init((Class)SAUILParsedAttachmentExpression);
      v24 = +[NSUUID UUID];
      v25 = [v24 UUIDString];
      [v23 setAceId:v25];

      [v23 setParseableExpression:v17];
      v26 = +[NSData dataWithContentsOfURL:v22];
      [v23 setAttachment:v26];

      [v54 addObject:v23];
LABEL_17:

LABEL_18:
    }
    id v14 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  }
  while (v14);
LABEL_20:

  if ([v54 count])
  {
    id v37 = objc_alloc_init((Class)SAUILParseExpressionsCompleted);
    id v38 = [v54 copy];
    [v37 setParsedExpressions:v38];
    v39 = v46;
    v5 = v47;
    v40 = v50;
  }
  else
  {
    id v41 = objc_alloc((Class)SACommandFailed);
    v40 = v50;
    id v38 = +[NSString stringWithFormat:@"No expressions were successfully parsed. Errors: %@", v50];
    id v37 = [v41 initWithReason:v38];
    v39 = v46;
    v5 = v47;
  }

  v42 = +[NSUUID UUID];
  v43 = [v42 UUIDString];
  [v37 setAceId:v43];

  v44 = [(UILParseExpressions *)v39 aceId];
  [v37 setRefId:v44];

  v45 = [v37 dictionary];
  ((void (**)(void, void *))v5)[2](v5, v45);

LABEL_24:
}

@end