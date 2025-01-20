@interface GEORPFeedbackInfo
- (void)enumerateValidComponentOfType:(int)a3 usingBlock:(id)a4;
- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4;
@end

@implementation GEORPFeedbackInfo

- (void)enumerateValidComponentOfType:(int)a3 usingBlock:(id)a4
{
  v6 = (void (**)(id, void *, unsigned char *))a4;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = [(GEORPFeedbackInfo *)self feedbackComponents];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
      if ([v12 type] == a3 && !objc_msgSend(v12, "status"))
      {
        if ([v12 valuesCount])
        {
          v6[2](v6, v12, &v17);
          if (v17) {
            break;
          }
        }
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_210DC;
  v7[3] = &unk_728F8;
  id v8 = a4;
  id v6 = v8;
  [(GEORPFeedbackInfo *)self enumerateValidComponentOfType:v4 usingBlock:v7];
}

@end