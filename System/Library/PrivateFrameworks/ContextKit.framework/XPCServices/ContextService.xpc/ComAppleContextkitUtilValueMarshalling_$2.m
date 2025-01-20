@interface ComAppleContextkitUtilValueMarshalling_$2
- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (int)getCode;
- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4;
@end

@implementation ComAppleContextkitUtilValueMarshalling_$2

- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4
{
  if (!a4 || (objc_opt_class(), !a3)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v6 = [a3 intValue];
  [a4 writeVIntWithInt:v6];
}

- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v3 = [a3 readVInt];
  return JavaLangInteger_valueOfWithInt_(v3);
}

- (int)getCode
{
  return 3;
}

@end