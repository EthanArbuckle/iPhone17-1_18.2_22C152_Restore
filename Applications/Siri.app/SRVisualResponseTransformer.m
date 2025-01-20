@interface SRVisualResponseTransformer
+ (id)_splitVisualResponse:(id)a3 forVisualResponseSnippet:(id)a4;
+ (id)transformVisualResponse:(id)a3 forMode:(unint64_t)a4 idiom:(int64_t)a5 shouldHideSnippet:(BOOL)a6;
+ (int64_t)_dialogModeToVisualModeConverter:(unint64_t)a3;
+ (int64_t)currentIdiom;
+ (int64_t)visualMode;
+ (void)setVisualMode:(int64_t)a3;
@end

@implementation SRVisualResponseTransformer

+ (int64_t)visualMode
{
  return qword_10016EE48;
}

+ (void)setVisualMode:(int64_t)a3
{
  qword_10016EE48 = a3;
}

+ (id)transformVisualResponse:(id)a3 forMode:(unint64_t)a4 idiom:(int64_t)a5 shouldHideSnippet:(BOOL)a6
{
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = v9;
  v11 = [v9 views];
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    v28 = v11;
    unint64_t v29 = a4;
    BOOL v27 = a6;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (a6) {
            continue;
          }
          [a1 setVisualMode:[a1 _dialogModeToVisualModeConverter:a4]];
LABEL_12:
          [v10 addObject:v16];
          continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        if (!a6)
        {
          id v17 = v16;
          id v18 = v10;
          id v19 = [a1 _dialogModeToVisualModeConverter:a4];
          [a1 setVisualMode:v19];
          v20 = [v17 modelData];
          id v21 = v19;
          id v10 = v18;
          a6 = v27;
          v22 = +[VRXVisualResponseProvider transformModel:v20 mode:v21 currentIdiom:a5];

          v23 = [a1 _splitVisualResponse:v22 forVisualResponseSnippet:v17];

          [v10 addObjectsFromArray:v23];
          a4 = v29;

          v11 = v28;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v13);
  }

  id v24 = [v26 copy];
  [v24 setViews:v10];

  return v24;
}

+ (int64_t)currentIdiom
{
  if (SiriUIDeviceIsPad()) {
    return 2;
  }
  if (SiriUIDeviceIsPod()) {
    return 3;
  }
  return 1;
}

+ (id)_splitVisualResponse:(id)a3 forVisualResponseSnippet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v27;
    uint64_t v24 = SAAceViewUIItemTypeItemTypeConversationValue;
    uint64_t v12 = SAAceViewUIItemTypeItemTypeResultValue;
    do
    {
      id v13 = 0;
      int v14 = v10;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v13);
        id v16 = [v6 copy:v24];
        id v17 = [v15 model];
        [v16 setModelData:v17];

        id v18 = [v15 responseType];
        uint64_t v19 = v12;
        if (v18 == (id)1 || (v20 = objc_msgSend(v15, "responseType", v12), uint64_t v19 = v24, v20 == (id)2)) {
          [v16 setItemType:v19];
        }
        if (v14 + (int)v13 >= 1)
        {
          id v21 = +[NSUUID UUID];
          v22 = [v21 UUIDString];
          [v16 setAceId:v22];
        }
        [v7 addObject:v16];

        id v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      int v10 = v14 + v9;
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (int64_t)_dialogModeToVisualModeConverter:(unint64_t)a3
{
  return a3 - 1 < 2;
}

@end