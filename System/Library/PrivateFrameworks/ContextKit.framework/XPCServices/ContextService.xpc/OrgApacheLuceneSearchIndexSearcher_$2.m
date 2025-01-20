@interface OrgApacheLuceneSearchIndexSearcher_$2
- (id)newCollector;
- (id)reduceWithJavaUtilCollection:(id)a3;
@end

@implementation OrgApacheLuceneSearchIndexSearcher_$2

- (id)newCollector
{
  v2 = new_OrgApacheLuceneSearchTotalHitCountCollector_init();
  return v2;
}

- (id)reduceWithJavaUtilCollection:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (!a3) {
LABEL_13:
  }
    JreThrowNullPointerException();
  id v4 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_13;
        }
        v6 += objc_msgSend(v9, "getTotalHits", (void)v11);
      }
      id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  return JavaLangInteger_valueOfWithInt_(v6);
}

@end