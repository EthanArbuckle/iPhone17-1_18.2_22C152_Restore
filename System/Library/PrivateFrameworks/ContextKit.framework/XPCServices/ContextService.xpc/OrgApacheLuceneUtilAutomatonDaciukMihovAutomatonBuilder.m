@interface OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder
+ (id)buildWithJavaUtilCollection:(id)a3;
+ (void)initialize;
- (BOOL)setPreviousWithOrgApacheLuceneUtilCharsRef:(id)a3;
- (OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder)init;
- (id)complete;
- (void)addSuffixWithOrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State:(id)a3 withJavaLangCharSequence:(id)a4 withInt:(int)a5;
- (void)addWithOrgApacheLuceneUtilCharsRef:(id)a3;
- (void)dealloc;
- (void)replaceOrRegisterWithOrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State:(id)a3;
@end

@implementation OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder

- (void)addWithOrgApacheLuceneUtilCharsRef:(id)a3
{
  if (!a3) {
    goto LABEL_16;
  }
  int v5 = [a3 length];
  root = self->root_;
  if (v5 >= 1)
  {
    int v7 = v5;
    uint64_t v8 = 0;
    while (root)
    {
      v9 = [(OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State *)root lastChildWithInt:JavaLangCharacter_codePointAtWithJavaLangCharSequence_withInt_(a3, v8)];
      if (!v9) {
        goto LABEL_10;
      }
      v10 = v9;
      int v11 = JavaLangCharacter_codePointAtWithJavaLangCharSequence_withInt_(a3, v8);
      uint64_t v8 = JavaLangCharacter_charCountWithInt_(v11) + v8;
      root = v10;
      if ((int)v8 >= v7) {
        goto LABEL_11;
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!root) {
    goto LABEL_16;
  }
  uint64_t v8 = 0;
LABEL_10:
  v10 = root;
LABEL_11:
  if ([(OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State *)v10 hasChildren]) {
    sub_100116300((uint64_t)self, v10);
  }
  sub_1001163B0(v10, a3, v8);
}

- (id)complete
{
  p_stateRegistry = &self->stateRegistry_;
  if (!self->stateRegistry_)
  {
    v6 = new_JavaLangIllegalStateException_init();
    objc_exception_throw(v6);
  }
  root = self->root_;
  if (!root) {
    JreThrowNullPointerException();
  }
  if ([(OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State *)root hasChildren]) {
    sub_100116300((uint64_t)self, self->root_);
  }
  JreStrongAssign((id *)p_stateRegistry, 0);
  return self->root_;
}

+ (id)buildWithJavaUtilCollection:(id)a3
{
  return OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_buildWithJavaUtilCollection_(a3);
}

- (BOOL)setPreviousWithOrgApacheLuceneUtilCharsRef:(id)a3
{
  p_previous = &self->previous_;
  v4 = OrgApacheLuceneUtilCharsRef_deepCopyOfWithOrgApacheLuceneUtilCharsRef_((uint64_t)a3);
  JreStrongAssign((id *)p_previous, v4);
  return 1;
}

- (void)replaceOrRegisterWithOrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State:(id)a3
{
}

- (void)addSuffixWithOrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder_State:(id)a3 withJavaLangCharSequence:(id)a4 withInt:(int)a5
{
}

- (OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder)init
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder;
  [(OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    UTF16SortedAsUTF8Comparator = (void *)OrgApacheLuceneUtilCharsRef_getUTF16SortedAsUTF8Comparator();
    JreStrongAssign(&qword_100560580, UTF16SortedAsUTF8Comparator);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilAutomatonDaciukMihovAutomatonBuilder__initialized);
  }
}

@end