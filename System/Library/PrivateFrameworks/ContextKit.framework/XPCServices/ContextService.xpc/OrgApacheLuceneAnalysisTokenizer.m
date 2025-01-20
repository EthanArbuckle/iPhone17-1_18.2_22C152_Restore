@interface OrgApacheLuceneAnalysisTokenizer
+ (void)initialize;
- (OrgApacheLuceneAnalysisTokenizer)init;
- (OrgApacheLuceneAnalysisTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3;
- (int)correctOffsetWithInt:(int)a3;
- (void)close;
- (void)dealloc;
- (void)reset;
- (void)setReaderWithJavaIoReader:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisTokenizer

- (OrgApacheLuceneAnalysisTokenizer)init
{
  return self;
}

- (OrgApacheLuceneAnalysisTokenizer)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3
{
  return self;
}

- (void)close
{
  p_input = &self->input_;
  input = self->input_;
  if (!input) {
    JreThrowNullPointerException();
  }
  [(JavaIoReader *)input close];
  id v5 = JreStrongAssign((id *)p_input, (void *)qword_10055FD78);
  JreStrongAssign((id *)&self->inputPending_, v5);
}

- (int)correctOffsetWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v3;
  }
  input = self->input_;
  objc_opt_class();
  if (!input) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(JavaIoReader *)input correctOffsetWithInt:v3];
}

- (void)setReaderWithJavaIoReader:(id)a3
{
  if (!a3)
  {
    v4 = new_JavaLangNullPointerException_initWithNSString_(@"input must not be null");
    goto LABEL_8;
  }
  if (self->input_ != (JavaIoReader *)qword_10055FD78)
  {
    v4 = new_JavaLangIllegalStateException_initWithNSString_(@"TokenStream contract violation: close() call missing");
LABEL_8:
    objc_exception_throw(v4);
  }
  JreStrongAssign((id *)&self->inputPending_, a3);
  [(OrgApacheLuceneAnalysisTokenizer *)self setReaderTestPoint];
}

- (void)reset
{
  v2 = self;
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneAnalysisTokenizer;
  [(OrgApacheLuceneAnalysisTokenStream *)&v4 reset];
  p_input = (id *)&v2->input_;
  v2 = (OrgApacheLuceneAnalysisTokenizer *)((char *)v2 + 48);
  JreStrongAssign(p_input, v2->super.super.super.isa);
  JreStrongAssign((id *)&v2->super.super.super.isa, (void *)qword_10055FD78);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisTokenizer;
  [(OrgApacheLuceneUtilAttributeSource *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneAnalysisTokenizer__1 alloc];
    JavaIoReader_init((uint64_t)v2);
    JreStrongAssignAndConsume((id *)&qword_10055FD78, v2);
    atomic_store(1u, OrgApacheLuceneAnalysisTokenizer__initialized);
  }
}

@end