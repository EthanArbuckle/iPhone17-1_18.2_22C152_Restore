@interface ComAppleContextkitUtilValueMarshalling_IntegerValueConverter
- (id)fromEmbeddedValueWithJavaLangInteger:(id)a3;
- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (id)toEmbeddedValueWithId:(id)a3;
- (int)getCode;
- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4;
@end

@implementation ComAppleContextkitUtilValueMarshalling_IntegerValueConverter

- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4
{
  if (!a4 || (objc_opt_class(), !a3)) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v6 = [a3 intValue];
  [a4 writeIntWithInt:v6];
}

- (id)toEmbeddedValueWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v4 = [a3 intValue];
  return JavaLangInteger_valueOfWithInt_(v4);
}

- (id)fromEmbeddedValueWithJavaLangInteger:(id)a3
{
  return a3;
}

- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v3 = [a3 readInt];
  return JavaLangInteger_valueOfWithInt_(v3);
}

- (int)getCode
{
  return 2;
}

@end