@interface GEORPFeedbackResponse
- (void)enumerateFeedbackInfosUsingBlock:(id)a3;
@end

@implementation GEORPFeedbackResponse

- (void)enumerateFeedbackInfosUsingBlock:(id)a3
{
  v4 = (void (**)(id, void, char *))a3;
  char v17 = 0;
  v5 = [(GEORPFeedbackResponse *)self feedbackResult];
  v6 = [v5 queryResult];
  v7 = [v6 feedbackInfos];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12), &v17);
      if (v17) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end