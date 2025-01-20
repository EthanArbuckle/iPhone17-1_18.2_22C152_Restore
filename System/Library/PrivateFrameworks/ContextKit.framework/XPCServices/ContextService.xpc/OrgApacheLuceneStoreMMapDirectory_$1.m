@interface OrgApacheLuceneStoreMMapDirectory_$1
- (id)run;
@end

@implementation OrgApacheLuceneStoreMMapDirectory_$1

- (id)run
{
  v2 = (void *)IOSClass_forName_(@"java.nio.DirectByteBuffer");
  if (!v2
    || (id v3 = objc_msgSend(v2, "getMethod:parameterTypes:", @"cleaner", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()))) == 0)
  {
    JreThrowNullPointerException();
  }
  [v3 setAccessibleWithBoolean:1];
  return (id)JavaLangBoolean_valueOfWithBoolean_(1);
}

@end