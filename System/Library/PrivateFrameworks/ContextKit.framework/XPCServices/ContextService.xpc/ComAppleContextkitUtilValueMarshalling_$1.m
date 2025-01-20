@interface ComAppleContextkitUtilValueMarshalling_$1
- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (int)getCode;
- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4;
@end

@implementation ComAppleContextkitUtilValueMarshalling_$1

- (void)writeValueWithId:(id)a3 withOrgApacheLuceneStoreIndexOutput:(id)a4
{
  if (!a4 || !a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 description];
  [a4 writeStringWithNSString:v5];
}

- (id)readValueWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 readString];
}

- (int)getCode
{
  return 1;
}

@end