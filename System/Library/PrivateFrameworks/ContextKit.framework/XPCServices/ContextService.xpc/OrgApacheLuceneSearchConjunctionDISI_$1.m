@interface OrgApacheLuceneSearchConjunctionDISI_$1
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneSearchConjunctionDISI_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (id v5 = [a3 cost], !a4)) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (uint64_t)v5;
  id v7 = [a4 cost];
  return JavaLangLong_compareWithLong_withLong_(v6, (uint64_t)v7);
}

@end