@interface ComAppleContextkitCategoriesConstellation_$1
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation ComAppleContextkitCategoriesConstellation_$1

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (unsigned int v5 = [a3 intValue], !a4)) {
    JreThrowNullPointerException();
  }
  unsigned int v6 = v5 ^ 0x80000000;
  unsigned int v7 = [a4 intValue] ^ 0x80000000;
  return JavaLangInteger_compareWithInt_withInt_(v6, v7);
}

@end