@interface OrgApacheLuceneUtilFstUtil_FSTPath
- (OrgApacheLuceneUtilFstUtil_FSTPath)initWithId:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilIntsRefBuilder:(id)a5;
- (OrgApacheLuceneUtilFstUtil_FSTPath)initWithId:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilIntsRefBuilder:(id)a5 withFloat:(float)a6 withJavaLangCharSequence:(id)a7;
- (id)description;
- (id)newPathWithId:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFstUtil_FSTPath

- (OrgApacheLuceneUtilFstUtil_FSTPath)initWithId:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilIntsRefBuilder:(id)a5
{
  return self;
}

- (OrgApacheLuceneUtilFstUtil_FSTPath)initWithId:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withOrgApacheLuceneUtilIntsRefBuilder:(id)a5 withFloat:(float)a6 withJavaLangCharSequence:(id)a7
{
  return self;
}

- (id)newPathWithId:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4
{
  arc = self->arc_;
  float boost = self->boost_;
  context = self->context_;
  v9 = [OrgApacheLuceneUtilFstUtil_FSTPath alloc];
  OrgApacheLuceneUtilFstUtil_FSTPath_initWithId_withOrgApacheLuceneUtilFstFST_Arc_withOrgApacheLuceneUtilIntsRefBuilder_withFloat_withJavaLangCharSequence_((uint64_t)v9, a3, (uint64_t)arc, a4, context, boost);
  return v9;
}

- (id)description
{
  input = self->input_;
  if (!input) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilIntsRefBuilder *)input get];
  return (id)JreStrcat("$@$@$@$F", v3, v4, v5, v6, v7, v8, v9, @"input=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstUtil_FSTPath;
  [(OrgApacheLuceneUtilFstUtil_FSTPath *)&v3 dealloc];
}

@end