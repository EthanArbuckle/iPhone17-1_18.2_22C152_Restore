@interface SRModeDialogTransformer
+ (BOOL)_alwaysPrintSiriResponse;
+ (BOOL)_shouldTransformLegacyAddViews;
+ (BOOL)supportsTransformationForAceCommand:(id)a3;
+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4;
+ (id)_analytics;
+ (id)_configurationDictionary;
+ (id)_firstSnippetInViews:(id)a3;
+ (id)_instrumentation;
+ (id)_redundantDUCIds;
+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_sayItForDialog:(id)a3;
+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4;
+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4;
+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5;
+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4;
+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4;
+ (unint64_t)_typeOfAddViews:(id)a3;
+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4;
@end

@implementation SRModeDialogTransformer

+ (id)transformAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v7 = a3;
  [a1 _logModeComputationForAceCommand:v7 mode:a4];
  id v8 = [a1 _typeOfAddViews:v7];
  if (v8 == (id)2)
  {
    v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000BA94C(v13, v7);
    }
    id v4 = [v7 copy];
    [v4 setViews:&__NSArray0__struct];
  }
  else
  {
    if (v8 == (id)1)
    {
      v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = [v7 aceId];
        int v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #modes Found dialog AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v12 = [a1 _transformDialogAddViews:v7 forMode:a4];
    }
    else
    {
      if (v8) {
        goto LABEL_14;
      }
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = [v7 aceId];
        int v18 = 136315394;
        v19 = "+[SRModeDialogTransformer transformAddViews:forMode:]";
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Found legacy AddViews (aceId = %@)", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v12 = [a1 _transformLegacyAddViews:v7 forMode:a4];
    }
    id v4 = (id)v12;
  }
LABEL_14:

  return v4;
}

+ (id)transformAddDialogs:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  [a1 _logModeComputationForAceCommand:v6 mode:a4];
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    v9 = [v6 aceId];
    v10 = [v6 dialogs];
    *(_DWORD *)buf = 136315650;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    __int16 v40 = 2112;
    v41 = v9;
    __int16 v42 = 2048;
    id v43 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) contains %lu dialogs", buf, 0x20u);
  }
  id v33 = objc_alloc_init((Class)NSMutableArray);
  id v11 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v12 = [a1 _alwaysPrintSiriResponse];
  if (v12)
  {
    v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v14 = [v6 dialogs:v6];
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ((v12 | [v19 spokenOnly] ^ 1) == 1)
        {
          [a1 _utteranceViewForDialog:v19 mode:a4 printedOnly:1];
          v21 = id v20 = v11;
          [v33 addObject:v21];

          id v11 = v20;
        }
        unsigned __int8 v22 = [v19 printedOnly];
        if (a4 <= 1 && (v22 & 1) == 0)
        {
          v23 = [a1 _sayItForDialog:v19];
          [v11 addObject:v23];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v16);
  }

  v24 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = [v32 aceId];
    id v27 = [v33 count];
    id v28 = [v11 count];
    *(_DWORD *)buf = 136315906;
    v39 = "+[SRModeDialogTransformer transformAddDialogs:forMode:]";
    __int16 v40 = 2112;
    v41 = v26;
    __int16 v42 = 2048;
    id v43 = v27;
    __int16 v44 = 2048;
    id v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #modes AddDialogs (aceId = %@) transformed into %lu utterance views and %lu sayIts.", buf, 0x2Au);
  }
  id v29 = objc_alloc_init((Class)NSMutableArray);
  if ([v33 count])
  {
    v30 = [a1 _addViewsForAddDialogs:v32 views:v33];
    [v29 addObject:v30];
  }
  if ([v11 count]) {
    [v29 addObjectsFromArray:v11];
  }

  return v29;
}

+ (BOOL)supportsTransformationForAceCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (unint64_t)_typeOfAddViews:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 views];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        v7 |= objc_opt_isKindOfClass();
        unsigned int v12 = [v11 dialog];
        LODWORD(v11) = v12 != 0;

        v8 |= v11;
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);

    if (v7 & v8) {
      unint64_t v13 = 2;
    }
    else {
      unint64_t v13 = v8 & 1;
    }
  }
  else
  {

    unint64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)_shouldTransformLegacyAddViews
{
  return 1;
}

+ (id)_transformLegacyAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  if (([a1 _shouldTransformLegacyAddViews] & 1) == 0) {
    goto LABEL_6;
  }
  if (a4 < 2)
  {
    if (![a1 _alwaysPrintSiriResponse])
    {
      id v8 = [a1 _removeUtteranceViewsFromAddViews:v6 forMode:a4];
      goto LABEL_7;
    }
    int v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v13, 0xCu);
    }
LABEL_6:
    id v8 = v6;
LABEL_7:
    a4 = (unint64_t)v8;
    goto LABEL_8;
  }
  if (a4 == 2)
  {
    if ([a1 _alwaysPrintSiriResponse])
    {
      v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", (uint8_t *)&v13, 0xCu);
      }
      id v11 = v6;
    }
    else
    {
      id v11 = [a1 _removeRedundantUtteranceViewsFromAddViews:v6 forMode:2];
    }
    unsigned int v12 = v11;
    a4 = [a1 _removeSpeakableTextFromAddViews:v11 forMode:2];
  }
LABEL_8:

  return (id)a4;
}

+ (id)_configurationDictionary
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079140;
  block[3] = &unk_100144420;
  block[4] = a1;
  if (qword_100171E98 != -1) {
    dispatch_once(&qword_100171E98, block);
  }
  v2 = (void *)qword_100171EA0;

  return v2;
}

+ (id)_redundantDUCIds
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000792B8;
  block[3] = &unk_100144420;
  block[4] = a1;
  if (qword_100171EA8 != -1) {
    dispatch_once(&qword_100171EA8, block);
  }
  v2 = (void *)qword_100171EB0;

  return v2;
}

+ (BOOL)_alwaysPrintSiriResponse
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrint];

  return v3;
}

+ (id)_firstSnippetInViews:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_removeRedundantUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 views];
  int v7 = [a1 _firstSnippetInViews:v6];

  if (v7)
  {
    id v27 = v7;
    id v29 = [a1 _redundantDUCIds];
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v9 = [v5 views];
    id v10 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            uint64_t v16 = [v15 dialogIdentifier];
            long long v17 = (void *)v16;
            long long v18 = &stru_1001463E0;
            if (v16) {
              long long v18 = (__CFString *)v16;
            }
            v19 = v18;

            id v20 = [(__CFString *)v19 lowercaseString];
            unsigned int v21 = [v29 containsObject:v20];

            if (v21)
            {
              unsigned __int8 v22 = (void *)AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                v23 = v22;
                v24 = sub_10003AA6C(a4);
                *(_DWORD *)buf = 136315650;
                long long v35 = "+[SRModeDialogTransformer _removeRedundantUtteranceViewsFromAddViews:forMode:]";
                __int16 v36 = 2112;
                long long v37 = v19;
                __int16 v38 = 2112;
                v39 = v24;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing redundant AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);
              }
            }
            else
            {
              [v8 addObject:v15];
            }
          }
          else
          {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v11);
    }

    id v25 = [v5 copy];
    [v25 setViews:v8];

    int v7 = v27;
  }
  else
  {
    id v25 = v5;
  }

  return v25;
}

+ (id)_removeSpeakableTextFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v54 = a3;
  [v54 views];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v66;
    uint64_t v55 = *(void *)v66;
    do
    {
      int v7 = 0;
      id v56 = v5;
      do
      {
        if (*(void *)v66 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v65 + 1) + 8 * (void)v7);
        long long v9 = [v8 speakableText];

        if (v9)
        {
          id v10 = [v8 speakableText];
          id v11 = [v10 length];

          if (v11)
          {
            uint64_t v12 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              int v13 = v12;
              v14 = [v8 speakableText];
              id v15 = [v8 aceId];
              uint64_t v16 = sub_10003AA6C(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v14;
              __int16 v74 = 2112;
              v75 = v15;
              __int16 v76 = 2112;
              v77 = v16;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from view %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v8 setSpeakableText:0];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v8;
          long long v18 = [v17 speakableSuffix];
          id v19 = [v18 length];

          if (v19)
          {
            id v20 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v21 = v20;
              unsigned __int8 v22 = [v17 speakableSuffix];
              v23 = [v17 aceId];
              v24 = sub_10003AA6C(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v22;
              __int16 v74 = 2112;
              v75 = v23;
              __int16 v76 = 2112;
              v77 = v24;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableSuffix '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v17 setSpeakableSuffix:0];
          id v25 = [v17 speakableDelimiter];
          id v26 = [v25 length];

          if (v26)
          {
            id v27 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = v27;
              id v29 = [v17 speakableDelimiter];
              long long v30 = [v17 aceId];
              long long v31 = sub_10003AA6C(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v29;
              __int16 v74 = 2112;
              v75 = v30;
              __int16 v76 = 2112;
              v77 = v31;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          v59 = v7;
          [v17 setSpeakableDelimiter:0];
          long long v32 = [v17 speakableFinalDelimiter];
          id v33 = [v32 length];

          if (v33)
          {
            long long v34 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              long long v35 = v34;
              __int16 v36 = [v17 speakableFinalDelimiter];
              long long v37 = [v17 aceId];
              __int16 v38 = sub_10003AA6C(a4);
              *(_DWORD *)buf = 136315906;
              v71 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
              __int16 v72 = 2112;
              v73 = v36;
              __int16 v74 = 2112;
              v75 = v37;
              __int16 v76 = 2112;
              v77 = v38;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableFinalDelimiter '%@' from SAUIDisambiguationList %@ for current mode: %@", buf, 0x2Au);
            }
          }
          [v17 setSpeakableFinalDelimiter:0];
          v58 = v17;
          v39 = [v17 items];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v40 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v62;
            do
            {
              for (i = 0; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v62 != v42) {
                  objc_enumerationMutation(v39);
                }
                __int16 v44 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                id v45 = [v44 speakableText];
                id v46 = [v45 length];

                if (v46)
                {
                  v47 = (void *)AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    v48 = v47;
                    v49 = [v44 speakableText];
                    v50 = [v44 aceId];
                    v51 = sub_10003AA6C(a4);
                    *(_DWORD *)buf = 136315906;
                    v71 = "+[SRModeDialogTransformer _removeSpeakableTextFromAddViews:forMode:]";
                    __int16 v72 = 2112;
                    v73 = v49;
                    __int16 v74 = 2112;
                    v75 = v50;
                    __int16 v76 = 2112;
                    v77 = v51;
                    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing speakableText '%@' from SAUIListItem %@ for current mode: %@", buf, 0x2Au);
                  }
                }
                [v44 setSpeakableText:0];
              }
              id v41 = [v39 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }
            while (v41);
          }
          [v58 setItems:v39];

          uint64_t v6 = v55;
          id v5 = v56;
          int v7 = v59;
        }
        int v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
    }
    while (v5);
  }
  id v52 = [v54 copy];
  [v52 setViews:obj];

  return v52;
}

+ (id)_removeUtteranceViewsFromAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 views];
  uint64_t v7 = [a1 _firstSnippetInViews:v6];
  id v8 = (void *)v7;
  if (v7)
  {
    id v39 = a1;
    id v41 = (void *)v7;
    id v43 = v5;
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v46 = objc_alloc_init((Class)NSMutableArray);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v42 = v6;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v48;
      uint64_t v15 = 1;
      id v44 = v10;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            id v19 = [v18 speakableText];

            if (v19)
            {
              id v20 = [v18 speakableText];
              [v9 addObject:v20];

              uint64_t v15 = v15 & [v18 canUseServerTTS];
            }
            unsigned int v21 = [v18 dialogIdentifier];

            if (v21)
            {
              unsigned __int8 v22 = [v18 dialogIdentifier];
              [v46 addObject:v22];
            }
            v23 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              [v18 dialogIdentifier];
              v26 = id v25 = v9;
              sub_10003AA6C(a4);
              id v27 = v13;
              uint64_t v28 = v14;
              uint64_t v29 = v15;
              v31 = id v30 = v11;
              *(_DWORD *)buf = 136315650;
              id v52 = "+[SRModeDialogTransformer _removeUtteranceViewsFromAddViews:forMode:]";
              __int16 v53 = 2112;
              id v54 = v26;
              __int16 v55 = 2112;
              id v56 = v31;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing AssistantUtteranceView (%@) for current mode: %@", buf, 0x20u);

              id v11 = v30;
              uint64_t v15 = v29;
              uint64_t v14 = v28;
              id v13 = v27;

              id v9 = v25;
              id v10 = v44;
            }
          }
          else
          {
            [v10 addObject:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v13);
    }
    else
    {
      LOBYTE(v15) = 1;
    }

    id v8 = v41;
    id v33 = [v41 speakableText];

    id v5 = v43;
    if (v33)
    {
      long long v34 = [v41 speakableText];
      [v9 addObject:v34];
    }
    uint64_t v6 = v42;
    if (objc_msgSend(v9, "count", v39))
    {
      long long v35 = [v9 componentsJoinedByString:@"\n"];
      [v41 setSpeakableText:v35];
      [v41 setCanUseServerTTS:v15 & 1];
    }
    __int16 v36 = [v40 _instrumentation];
    long long v37 = [v41 aceId];
    [v36 setDialogIdentifiers:v46 forAceViewSpeakableTextWithIdentifier:v37];

    id v32 = [v43 copy];
    [v32 setViews:v10];
  }
  else
  {
    id v32 = v5;
  }

  return v32;
}

+ (id)_transformDialogAddViews:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = v6;
  id v8 = [v6 views];
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    long long v31 = v8;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v12);
        uint64_t v14 = [v13 dialog];
        if (!v14)
        {
          [v7 addObject:v13];
          goto LABEL_16;
        }
        if ([a1 _alwaysPrintSiriResponse])
        {
          uint64_t v15 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v40 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #modes alwaysPrintSiriResponse = YES", buf, 0xCu);
          }
          uint64_t v16 = [a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:[v14 printedOnly]];
          v44[0] = v16;
          v44[1] = v13;
          id v17 = v44;
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v16 = [a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:0];
          v43[0] = v16;
          v43[1] = v13;
          id v17 = v43;
LABEL_15:
          id v18 = +[NSArray arrayWithObjects:v17 count:2];
          [v7 addObjectsFromArray:v18];

          goto LABEL_16;
        }
        if (a4 < 2)
        {
          if ([v14 printedOnly])
          {
            id v19 = v13;
            id v20 = [a1 _utteranceViewForDialog:v14 mode:a4 printedOnly:1];
            [v7 addObject:v20];
          }
          else
          {
            id v19 = [v13 copy];
            v24 = [a1 _speakableTextForDialog:v14 mode:a4];
            [v19 setSpeakableText:v24];

            id v33 = [a1 _instrumentation];
            id v32 = [v14 dialogIdentifier];
            __int16 v38 = v32;
            id v25 = +[NSArray arrayWithObjects:&v38 count:1];
            id v26 = [v19 aceId];
            [v33 setDialogIdentifiers:v25 forAceViewSpeakableTextWithIdentifier:v26];

            id v8 = v31;
          }
          goto LABEL_30;
        }
        if (a4 == 2)
        {
          if ([v14 spokenOnly])
          {
            unsigned int v21 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v22 = v21;
              v23 = [v14 dialogIdentifier];
              *(_DWORD *)buf = 136315394;
              id v40 = "+[SRModeDialogTransformer _transformDialogAddViews:forMode:]";
              __int16 v41 = 2112;
              uint64_t v42 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) for Silent Mode since it is Spoken Only", buf, 0x16u);

              id v8 = v31;
              goto LABEL_28;
            }
          }
          else
          {
            unsigned __int8 v22 = [a1 _utteranceViewForDialog:v14 mode:2 printedOnly:0];
            [v7 addObject:v22];
LABEL_28:
          }
          id v19 = v13;
          goto LABEL_30;
        }
        id v19 = 0;
LABEL_30:
        [v7 addObject:v19];

LABEL_16:
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v27 = [v8 countByEnumeratingWithState:&v34 objects:v45 count:16];
      id v10 = v27;
    }
    while (v27);
  }

  id v28 = [v30 copy];
  [v28 setViews:v7];

  return v28;
}

+ (id)_utteranceViewForDialog:(id)a3 mode:(unint64_t)a4 printedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = [v8 dialogIdentifier];
    id v12 = sub_10003AA6C(a4);
    int v51 = 136315650;
    id v52 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    __int16 v53 = 2112;
    id v54 = v11;
    __int16 v55 = 2112;
    id v56 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into an Utterance View for current mode: %@", (uint8_t *)&v51, 0x20u);
  }
  id v13 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  uint64_t v14 = [v8 aceId];
  [v13 setAceId:v14];

  uint64_t v15 = [v8 refId];
  [v13 setRefId:v15];

  [v13 setCanUseServerTTS:[v8 canUseServerTTS]];
  uint64_t v16 = [v8 configuration];
  id v17 = [v16 context];
  [v13 setContext:v17];

  id v18 = [v8 dialogIdentifier];
  [v13 setDialogIdentifier:v18];

  id v19 = [v8 metricsContext];
  [v13 setMetricsContext:v19];

  id v20 = +[AFAccessibilityObserver sharedObserver];
  unsigned int v21 = [v20 state];
  id v22 = [v21 isVoiceOverTouchEnabled];

  if (a4 != 2 || v22 != (id)2)
  {
    if (v5)
    {
      id v27 = [v8 content];
      id v26 = [v27 text];

      id v28 = (void *)AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:
        id v36 = 0;
        goto LABEL_31;
      }
      uint64_t v29 = v28;
      id v30 = [v8 dialogIdentifier];
      int v51 = 136315394;
      id v52 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
      __int16 v53 = 2112;
      id v54 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) when printedOnly is true", (uint8_t *)&v51, 0x16u);
LABEL_26:

      goto LABEL_27;
    }
    if (a4)
    {
      if (a4 != 1)
      {
        if (a4 != 2)
        {
          id v36 = 0;
          id v26 = 0;
          goto LABEL_31;
        }
        uint64_t v29 = [v8 caption];
        long long v31 = [v29 text];
        id v30 = v31;
        if (v31)
        {
          id v26 = v31;
        }
        else
        {
          long long v48 = [v8 content];
          id v26 = [v48 text];
        }
        goto LABEL_26;
      }
      id v45 = [v8 caption];
      id v46 = [v45 text];
      long long v47 = v46;
      if (v46)
      {
        id v26 = v46;
      }
      else
      {
        long long v49 = [v8 content];
        id v26 = [v49 text];
      }
      id v42 = a1;
      id v43 = v8;
      uint64_t v44 = 1;
    }
    else
    {
      __int16 v41 = [v8 content];
      id v26 = [v41 text];

      id v42 = a1;
      id v43 = v8;
      uint64_t v44 = 0;
    }
    id v36 = [v42 _speakableTextForDialog:v43 mode:v44];
    goto LABEL_31;
  }
  v23 = [v8 caption];
  v24 = [v23 text];
  id v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v32 = [v8 content];
    id v26 = [v32 text];
  }
  id v33 = [v8 content];
  long long v34 = [v33 speakableTextOverride];
  long long v35 = v34;
  if (v34)
  {
    id v36 = v34;
  }
  else
  {
    long long v37 = [v8 content];
    id v36 = [v37 text];
  }
  __int16 v38 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v38;
    id v40 = [v8 dialogIdentifier];
    int v51 = 136315394;
    id v52 = "+[SRModeDialogTransformer _utteranceViewForDialog:mode:printedOnly:]";
    __int16 v53 = 2112;
    id v54 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Over", (uint8_t *)&v51, 0x16u);
  }
LABEL_31:
  [v13 setText:v26];
  [v13 setSpeakableText:v36];

  return v13;
}

+ (id)_speakableTextForDialog:(id)a3 mode:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[AFAccessibilityObserver sharedObserver];
  id v7 = [v6 state];
  id v8 = [v7 isVoiceOverTouchEnabled];

  switch(a4)
  {
    case 0uLL:
      id v12 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        uint64_t v14 = [v5 dialogIdentifier];
        *(_DWORD *)id v27 = 136315394;
        *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v14;
        uint64_t v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Voice Mode";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, v27, 0x16u);
      }
LABEL_20:
      id v22 = [v5 content:*(_OWORD *)v27, *(void *)&v27[16]];
      v23 = [v22 speakableTextOverride];
      if (v23)
      {
LABEL_21:
        id v8 = v23;
LABEL_24:

        break;
      }
      v24 = [v5 content];
LABEL_23:
      id v25 = v24;
      id v8 = [v24 text];

      goto LABEL_24;
    case 1uLL:
      if (v8 == (id)2)
      {
        uint64_t v16 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v16;
          uint64_t v14 = [v5 dialogIdentifier];
          *(_DWORD *)id v27 = 136315394;
          *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(void *)&v27[14] = v14;
          uint64_t v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode with Voice Over";
          goto LABEL_19;
        }
      }
      else
      {
        id v17 = [v5 caption];

        id v18 = (void *)AFSiriLogContextConnection;
        BOOL v19 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            id v20 = v18;
            unsigned int v21 = [v5 dialogIdentifier];
            *(_DWORD *)id v27 = 136315394;
            *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
            *(_WORD *)&v27[12] = 2112;
            *(void *)&v27[14] = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) CAPTION into speakable text for Mixed Mode", v27, 0x16u);
          }
          id v22 = [v5 caption];
          v23 = [v22 speakableTextOverride];
          if (v23) {
            goto LABEL_21;
          }
          v24 = [v5 caption];
          goto LABEL_23;
        }
        if (v19)
        {
          id v13 = v18;
          uint64_t v14 = [v5 dialogIdentifier];
          *(_DWORD *)id v27 = 136315394;
          *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(void *)&v27[14] = v14;
          uint64_t v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode (Caption is nil)";
          goto LABEL_19;
        }
      }
      goto LABEL_20;
    case 2uLL:
      id v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        uint64_t v11 = [v5 dialogIdentifier];
        *(_DWORD *)id v27 = 136315394;
        *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes IGNORING Dialog (%@) speakable text for Silent Mode", v27, 0x16u);
      }
      id v8 = 0;
      break;
  }

  return v8;
}

+ (id)_sayItForDialog:(id)a3
{
  id v3 = a3;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 dialogIdentifier];
    int v23 = 136315394;
    v24 = "+[SRModeDialogTransformer _sayItForDialog:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming Dialog (%@) into a SayIt", (uint8_t *)&v23, 0x16u);
  }
  id v7 = objc_alloc_init((Class)SAUISayIt);
  id v8 = [v3 aceId];
  [v7 setAceId:v8];

  id v9 = [v3 refId];
  [v7 setRefId:v9];

  [v7 setCanUseServerTTS:[v3 canUseServerTTS]];
  id v10 = [v3 configuration];
  uint64_t v11 = [v10 context];
  [v7 setContext:v11];

  id v12 = [v3 dialogIdentifier];
  [v7 setDialogIdentifier:v12];

  id v13 = [v3 configuration];
  uint64_t v14 = [v13 gender];
  [v7 setGender:v14];

  uint64_t v15 = [v3 configuration];
  uint64_t v16 = [v15 languageCode];
  [v7 setLanguageCode:v16];

  id v17 = [v3 content];
  id v18 = [v17 speakableTextOverride];
  if (v18)
  {
    [v7 setMessage:v18];
  }
  else
  {
    BOOL v19 = [v3 content];
    id v20 = [v19 text];
    [v7 setMessage:v20];
  }
  unsigned int v21 = [v3 metricsContext];
  [v7 setMetricsContext:v21];

  return v7;
}

+ (id)_addViewsForAddDialogs:(id)a3 views:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [v5 aceId];
    int v20 = 136315394;
    unsigned int v21 = "+[SRModeDialogTransformer _addViewsForAddDialogs:views:]";
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #modes Transforming AddDialog (aceId = %@) into an AddViews", (uint8_t *)&v20, 0x16u);
  }
  id v10 = objc_alloc_init((Class)SAUIAddViews);
  uint64_t v11 = [v5 aceId];
  [v10 setAceId:v11];

  id v12 = [v5 refId];
  [v10 setRefId:v12];

  id v13 = [v5 metricsContext];
  [v10 setMetricsContext:v13];

  uint64_t v14 = [v5 listenAfterSpeaking];

  if (v14)
  {
    uint64_t v15 = [v6 lastObject];
    uint64_t v16 = [v5 listenAfterSpeaking];
    [v15 setListenAfterSpeaking:v16];

    id v17 = [v6 lastObject];
    id v18 = [v5 listenAfterSpeakingBehavior];
    [v17 setListenAfterSpeakingBehavior:v18];
  }
  [v10 setViews:v6];

  return v10;
}

+ (void)_logModeComputationForAceCommand:(id)a3 mode:(unint64_t)a4
{
  id v12 = a3;
  id v6 = [v12 aceId];

  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionary];
    id v8 = [v12 aceId];
    [v7 setObject:v8 forKey:@"aceId"];

    id v9 = sub_10003AFDC(a4);
    [v7 setObject:v9 forKey:@"mode"];

    id v10 = [v12 encodedClassName];
    [v7 setObject:v10 forKey:@"aceClass"];

    uint64_t v11 = [a1 _analytics];
    [v11 logEventWithType:5602 context:v7];
  }
}

+ (id)_analytics
{
  return +[AFAnalytics sharedAnalytics];
}

+ (id)_instrumentation
{
  return +[SRUIFInstrumentationManager sharedManager];
}

@end