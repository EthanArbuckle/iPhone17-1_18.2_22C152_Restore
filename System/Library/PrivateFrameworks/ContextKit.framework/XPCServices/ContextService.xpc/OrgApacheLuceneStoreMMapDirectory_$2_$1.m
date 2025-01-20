@interface OrgApacheLuceneStoreMMapDirectory_$2_$1
- (OrgApacheLuceneStoreMMapDirectory_$2_$1)initWithJavaNioByteBuffer:(id)a3;
- (id)run;
- (void)dealloc;
@end

@implementation OrgApacheLuceneStoreMMapDirectory_$2_$1

- (id)run
{
  v3 = self->val$buffer_;
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = objc_msgSend(-[JavaNioByteBuffer getClass](v3, "getClass"), "getMethod:parameterTypes:", @"cleaner", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()));
  if (!v4) {
    goto LABEL_7;
  }
  v5 = v4;
  [v4 setAccessibleWithBoolean:1];
  id v6 = objc_msgSend(v5, "invokeWithId:withNSObjectArray:", self->val$buffer_, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()));
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_msgSend(objc_msgSend(v6, "getClass"), "getMethod:parameterTypes:", @"clean", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, IOSClass_class_()));
    if (v8)
    {
      objc_msgSend(v8, "invokeWithId:withNSObjectArray:", v7, +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0, NSObject_class_()));
      return 0;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 0;
}

- (OrgApacheLuceneStoreMMapDirectory_$2_$1)initWithJavaNioByteBuffer:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreMMapDirectory__2__1;
  [(OrgApacheLuceneStoreMMapDirectory_$2_$1 *)&v3 dealloc];
}

@end