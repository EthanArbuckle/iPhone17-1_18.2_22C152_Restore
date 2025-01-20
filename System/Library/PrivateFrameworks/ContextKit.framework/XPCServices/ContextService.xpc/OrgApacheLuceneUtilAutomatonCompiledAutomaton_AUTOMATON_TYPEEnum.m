@interface OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum

- (OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NONE", 0);
    OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"ALL", 1);
    qword_100563930 = (uint64_t)v3;
    v4 = [OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"SINGLE", 2);
    qword_100563938 = (uint64_t)v4;
    v5 = [OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"NORMAL", 3);
    qword_100563940 = (uint64_t)v5;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilAutomatonCompiledAutomaton_AUTOMATON_TYPEEnum__initialized);
  }
}

@end