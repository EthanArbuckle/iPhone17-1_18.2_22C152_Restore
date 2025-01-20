@interface OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator
- (OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator)initWithJavaUtilComparator:(id)a3;
- (int)compareWithId:(id)a3 withId:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator

- (OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator)initWithJavaUtilComparator:(id)a3
{
  return self;
}

- (int)compareWithId:(id)a3 withId:(id)a4
{
  comparator = self->comparator_;
  if (!comparator || !a3 || !a4) {
    goto LABEL_10;
  }
  int result = [(JavaUtilComparator *)comparator compareWithId:*((void *)a3 + 2) withId:*((void *)a4 + 2)];
  if (result) {
    return result;
  }
  v8 = (void *)*((void *)a3 + 3);
  if (!v8 || (id v9 = [v8 get]) == 0) {
LABEL_10:
  }
    JreThrowNullPointerException();
  v10 = v9;
  id v11 = [*((id *)a4 + 3) get];
  return [v10 compareToWithId:v11];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator;
  [(OrgApacheLuceneUtilFstUtil_TieBreakByInputComparator *)&v3 dealloc];
}

@end