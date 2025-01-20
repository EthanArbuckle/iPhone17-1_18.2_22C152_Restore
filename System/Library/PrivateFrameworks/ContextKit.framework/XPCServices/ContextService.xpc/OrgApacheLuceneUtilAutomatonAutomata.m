@interface OrgApacheLuceneUtilAutomatonAutomata
+ (id)makeAnyChar;
+ (id)makeBinaryIntervalWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4 withOrgApacheLuceneUtilBytesRef:(id)a5 withBoolean:(BOOL)a6;
+ (id)makeBinaryWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (id)makeCharRangeWithInt:(int)a3 withInt:(int)a4;
+ (id)makeCharWithInt:(int)a3;
+ (id)makeDecimalIntervalWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)makeEmpty;
+ (id)makeEmptyString;
+ (id)makeStringUnionWithJavaUtilCollection:(id)a3;
+ (id)makeStringWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)makeStringWithNSString:(id)a3;
+ (int)appendAnyCharWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
+ (int)appendCharWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomata

+ (id)makeEmpty
{
  v2 = new_OrgApacheLuceneUtilAutomatonAutomaton_init();
  [(OrgApacheLuceneUtilAutomatonAutomaton *)v2 finishState];
  return v2;
}

+ (id)makeEmptyString
{
  v2 = new_OrgApacheLuceneUtilAutomatonAutomaton_init();
  [(OrgApacheLuceneUtilAutomatonAutomaton *)v2 createState];
  [(OrgApacheLuceneUtilAutomatonAutomaton *)v2 setAcceptWithInt:0 withBoolean:1];
  return v2;
}

+ (id)makeAnyChar
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeCharRangeWithInt_withInt_(0, 1114111);
}

+ (int)appendAnyCharWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = *(void *)&a4;
  id v6 = [a3 createState];
  int v7 = (int)v6;
  [a3 addTransitionWithInt:v4 withInt:v6 withInt:0 withInt:1114111];
  return v7;
}

+ (id)makeCharWithInt:(int)a3
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeCharRangeWithInt_withInt_(*(uint64_t *)&a3, *(uint64_t *)&a3);
}

+ (int)appendCharWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = [a3 createState];
  int v9 = (int)v8;
  [a3 addTransitionWithInt:v6 withInt:v8 withInt:v5 withInt:v5];
  return v9;
}

+ (id)makeCharRangeWithInt:(int)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeCharRangeWithInt_withInt_(*(uint64_t *)&a3, *(uint64_t *)&a4);
}

+ (id)makeBinaryIntervalWithOrgApacheLuceneUtilBytesRef:(id)a3 withBoolean:(BOOL)a4 withOrgApacheLuceneUtilBytesRef:(id)a5 withBoolean:(BOOL)a6
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeBinaryIntervalWithOrgApacheLuceneUtilBytesRef_withBoolean_withOrgApacheLuceneUtilBytesRef_withBoolean_((OrgApacheLuceneUtilBytesRef *)a3, a4, (uint64_t)a5, a6);
}

+ (id)makeDecimalIntervalWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeDecimalIntervalWithInt_withInt_withInt_(a3, a4, a5);
}

+ (id)makeStringWithNSString:(id)a3
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeStringWithNSString_(a3);
}

+ (id)makeBinaryWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeBinaryWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
}

+ (id)makeStringWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeStringWithIntArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (id)makeStringUnionWithJavaUtilCollection:(id)a3
{
  return OrgApacheLuceneUtilAutomatonAutomata_makeStringUnionWithJavaUtilCollection_(a3);
}

@end