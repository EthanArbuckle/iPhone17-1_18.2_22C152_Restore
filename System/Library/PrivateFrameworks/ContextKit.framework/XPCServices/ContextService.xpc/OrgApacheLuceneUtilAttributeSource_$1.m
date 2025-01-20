@interface OrgApacheLuceneUtilAttributeSource_$1
- (OrgApacheLuceneUtilAttributeSource_$1)init;
- (id)computeValueWithIOSClass:(id)a3;
@end

@implementation OrgApacheLuceneUtilAttributeSource_$1

- (id)computeValueWithIOSClass:(id)a3
{
  v4 = new_JavaUtilLinkedHashSet_init();
  do
  {
    if (!a3 || (v5 = (char *)[a3 getInterfaces]) == 0) {
LABEL_14:
    }
      JreThrowNullPointerException();
    v6 = (void **)(v5 + 24);
    unint64_t v7 = (unint64_t)&v5[8 * *((int *)v5 + 2) + 24];
    while ((unint64_t)v6 < v7)
    {
      v9 = *v6++;
      v8 = v9;
      if (v9 != (void *)OrgApacheLuceneUtilAttribute_class_()
        && [(id)OrgApacheLuceneUtilAttribute_class_() isAssignableFrom:v8])
      {
        if (!v8) {
          goto LABEL_14;
        }
        -[JavaUtilHashSet addWithId:](v4, "addWithId:", [v8 asSubclass:OrgApacheLuceneUtilAttribute_class_()]);
      }
    }
    a3 = [a3 getSuperclass];
  }
  while (a3);
  v10 = +[IOSObjectArray arrayWithLength:[(JavaUtilHashSet *)v4 size] type:IOSClass_class_()];
  return [(JavaUtilAbstractCollection *)v4 toArrayWithNSObjectArray:v10];
}

- (OrgApacheLuceneUtilAttributeSource_$1)init
{
  return self;
}

@end