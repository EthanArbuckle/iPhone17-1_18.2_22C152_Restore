@interface OrgApacheLuceneIndexCompositeReaderContext
+ (id)createWithOrgApacheLuceneIndexCompositeReader:(id)a3;
- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReader:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5;
- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexCompositeReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilList:(id)a7;
- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexCompositeReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilList:(id)a7 withJavaUtilList:(id)a8;
- (id)children;
- (id)leaves;
- (id)reader;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexCompositeReaderContext

+ (id)createWithOrgApacheLuceneIndexCompositeReader:(id)a3
{
  return OrgApacheLuceneIndexCompositeReaderContext_createWithOrgApacheLuceneIndexCompositeReader_(a3);
}

- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexCompositeReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilList:(id)a7
{
  return self;
}

- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReader:(id)a3 withJavaUtilList:(id)a4 withJavaUtilList:(id)a5
{
  return self;
}

- (OrgApacheLuceneIndexCompositeReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexCompositeReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilList:(id)a7 withJavaUtilList:(id)a8
{
  return self;
}

- (id)leaves
{
  if (!self->super.isTopLevel_)
  {
    v3 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"This is not a top-level context.");
    objc_exception_throw(v3);
  }
  return self->leaves_;
}

- (id)children
{
  return self->children_;
}

- (id)reader
{
  return self->reader_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexCompositeReaderContext;
  [(OrgApacheLuceneIndexIndexReaderContext *)&v3 dealloc];
}

@end