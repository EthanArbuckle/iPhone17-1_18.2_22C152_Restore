@interface OrgApacheLuceneAnalysisCharFilter
- (OrgApacheLuceneAnalysisCharFilter)initWithJavaIoReader:(id)a3;
- (int)correctOffsetWithInt:(int)a3;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneAnalysisCharFilter

- (OrgApacheLuceneAnalysisCharFilter)initWithJavaIoReader:(id)a3
{
  return self;
}

- (void)close
{
  input = self->input_;
  if (!input) {
    JreThrowNullPointerException();
  }
  [(JavaIoReader *)input close];
}

- (int)correctOffsetWithInt:(int)a3
{
  id v3 = *(id *)&a3;
  while (1)
  {
    id v3 = [(OrgApacheLuceneAnalysisCharFilter *)self correctWithInt:v3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    self = (OrgApacheLuceneAnalysisCharFilter *)self->input_;
    objc_opt_class();
    if (!self) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  return (int)v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisCharFilter;
  [(JavaIoReader *)&v3 dealloc];
}

@end