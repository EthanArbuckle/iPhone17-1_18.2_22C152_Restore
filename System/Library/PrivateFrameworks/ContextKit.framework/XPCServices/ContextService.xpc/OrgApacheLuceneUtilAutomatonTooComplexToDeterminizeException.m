@interface OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException
- (OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
- (OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException)initWithOrgApacheLuceneUtilAutomatonRegExp:(id)a3 withOrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException:(id)a4;
- (id)getAutomaton;
- (id)getRegExp;
- (int)getMaxDeterminizedStates;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException

- (OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException)initWithOrgApacheLuceneUtilAutomatonRegExp:(id)a3 withOrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException:(id)a4
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  return self;
}

- (id)getAutomaton
{
  return self->automaton_;
}

- (id)getRegExp
{
  return self->regExp_;
}

- (int)getMaxDeterminizedStates
{
  return self->maxDeterminizedStates_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonTooComplexToDeterminizeException;
  [(JavaLangThrowable *)&v3 dealloc];
}

@end