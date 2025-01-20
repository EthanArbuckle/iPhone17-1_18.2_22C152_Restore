@interface QuickTypePFLEvaluator
+ (void)initialize;
- (DESRecipeEvaluationSession)evaluationSession;
- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 error:(id *)a5;
- (void)setEvaluationSession:(id)a3;
@end

@implementation QuickTypePFLEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.NLPLearner", "QuickTypePFLEvaluator");
    v3 = (void *)qword_1F138;
    qword_1F138 = (uint64_t)v2;
  }
}

- (id)evaluateRecipe:(id)a3 matchingRecordSet:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 recipeUserInfo];
  uint64_t v11 = [v10 objectForKey:@"model"];
  v12 = (void *)v11;
  v13 = @"nlmodel";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v14 = v13;

  v15 = [v8 attachments];
  v16 = +[NLPLearnerUtils getAttachmentURLByName:v14 attachments:v15 error:a5];

  if (!v16)
  {
    v31 = 0;
    goto LABEL_33;
  }
  v17 = [v8 recipeUserInfo];
  v18 = [v17 objectForKey:@"locales"];
  v19 = +[NSLocale localeWithLocaleIdentifier:v18];

  if (!v19)
  {
    if (a5)
    {
      +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:1 userInfo:&off_19B60];
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    goto LABEL_32;
  }
  v53 = v14;
  id v54 = v9;
  v20 = [v8 recipeUserInfo];
  v21 = [v20 objectForKey:@"task"];
  int64_t v22 = +[NLPLearnerTaskWrapper taskFromRecipe:v21];

  v23 = [v8 recipeUserInfo];
  v24 = [v23 objectForKey:@"evaluationInfo"];

  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a5)
    {
      v31 = 0;
      v14 = v53;
      goto LABEL_31;
    }
    NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
    CFStringRef v62 = @"'evaluationInfo' value must be a dictionary defining MRLNeuralNetworkTensorCreate input";
    v47 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    +[NSError errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:10 userInfo:v47];
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v53;
  }
  else
  {
    v52 = v19;
    +[NLPLearnerShadowEvaluator evaluatorWithLocale:v19 andTask:v22];
    v26 = v25 = self;
    v27 = [v16 absoluteString];
    v28 = +[NSURL URLWithString:v27];
    v29 = [v9 coreDuetEvents];
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_9C9C;
    v59[3] = &unk_18848;
    v59[4] = v25;
    v51 = v26;
    v30 = [v26 evaluateModel:v28 onRecords:v29 options:v24 completion:v59 error:a5];

    if (v30)
    {
      v31 = +[NSMutableDictionary dictionary];
      uint64_t v32 = [v30 objectForKeyedSubscript:@"Samples"];
      v14 = v53;
      if (v32)
      {
        v33 = (void *)v32;
        v34 = [v30 objectForKeyedSubscript:MLPModelTrainerOverallAccuracyKey];

        if (v34)
        {
          v35 = [v30 objectForKeyedSubscript:@"Samples"];
          [v31 setObject:v35 forKeyedSubscript:@"Number of evaluation records"];

          v36 = [v30 objectForKeyedSubscript:MLPModelTrainerOverallAccuracyKey];
          [v31 setObject:v36 forKeyedSubscript:@"Model accuracy"];
        }
      }
      v37 = [v8 recipeUserInfo];
      v38 = [v37 objectForKey:@"metrics"];

      objc_opt_class();
      v19 = v52;
      if (objc_opt_isKindOfClass())
      {
        v49 = v38;
        v50 = v24;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v39 = v38;
        id v40 = [v39 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (v40)
        {
          id v41 = v40;
          uint64_t v42 = *(void *)v56;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v56 != v42) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = *(void *)(*((void *)&v55 + 1) + 8 * i);
              v45 = objc_msgSend(v30, "objectForKeyedSubscript:", v44, v49, v50);

              if (v45)
              {
                v46 = [v30 objectForKeyedSubscript:v44];
                [v31 setObject:v46 forKeyedSubscript:v44];
              }
            }
            id v41 = [v39 countByEnumeratingWithState:&v55 objects:v60 count:16];
          }
          while (v41);
        }

        v19 = v52;
        v14 = v53;
        v38 = v49;
        v24 = v50;
      }

      id v9 = v54;
    }
    else
    {
      v31 = 0;
      v19 = v52;
      v14 = v53;
    }

    v47 = v51;
  }

LABEL_31:
LABEL_32:

LABEL_33:

  return v31;
}

- (DESRecipeEvaluationSession)evaluationSession
{
  return self->_evaluationSession;
}

- (void)setEvaluationSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end