@interface ComAppleContextkitCategoriesConstellation_GroupingRequest_$1
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation ComAppleContextkitCategoriesConstellation_GroupingRequest_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3
    || (id v5 = [a3 getValue]) == 0
    || (unsigned int v6 = [v5 size], !a4)
    || (unsigned int v7 = v6, (v8 = [a4 getValue]) == 0))
  {
    JreThrowNullPointerException();
  }
  int v9 = -(int)[v8 size];
  return JavaLangInteger_compareWithInt_withInt_(-v7, v9);
}

@end