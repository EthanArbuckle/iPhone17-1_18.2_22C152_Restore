@interface OrgApacheLuceneIndexLeafReaderContext
- (OrgApacheLuceneIndexLeafReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexLeafReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (OrgApacheLuceneIndexLeafReaderContext)initWithOrgApacheLuceneIndexLeafReader:(id)a3;
- (id)children;
- (id)description;
- (id)leaves;
- (id)reader;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexLeafReaderContext

- (OrgApacheLuceneIndexLeafReaderContext)initWithOrgApacheLuceneIndexCompositeReaderContext:(id)a3 withOrgApacheLuceneIndexLeafReader:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return self;
}

- (OrgApacheLuceneIndexLeafReaderContext)initWithOrgApacheLuceneIndexLeafReader:(id)a3
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
  return 0;
}

- (id)reader
{
  return objc_loadWeak((id *)&self->reader_);
}

- (id)description
{
  objc_loadWeak((id *)&self->reader_);
  return (id)JreStrcat("$@$I$IC", v2, v3, v4, v5, v6, v7, v8, @"LeafReaderContext(");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReaderContext;
  [(OrgApacheLuceneIndexIndexReaderContext *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexLeafReaderContext;
  [(OrgApacheLuceneIndexLeafReaderContext *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end