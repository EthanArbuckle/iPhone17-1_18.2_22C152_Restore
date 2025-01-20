@interface OrgApacheLuceneCodecsPostingsFormat
+ (id)forNameWithNSString:(id)a3;
+ (void)initialize;
+ (void)reloadPostingsFormatsWithJavaLangClassLoader:(id)a3;
- (NSString)description;
- (OrgApacheLuceneCodecsPostingsFormat)initWithNSString:(id)a3;
- (id)getName;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPostingsFormat

- (OrgApacheLuceneCodecsPostingsFormat)initWithNSString:(id)a3
{
  return self;
}

- (id)getName
{
  return self->name_;
}

- (NSString)description
{
  return (NSString *)JreStrcat("$$C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"PostingsFormat(name=");
}

+ (id)forNameWithNSString:(id)a3
{
  return OrgApacheLuceneCodecsPostingsFormat_forNameWithNSString_((uint64_t)a3);
}

+ (void)reloadPostingsFormatsWithJavaLangClassLoader:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPostingsFormat;
  [(OrgApacheLuceneCodecsPostingsFormat *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = +[IOSObjectArray newArrayWithLength:0 type:OrgApacheLuceneCodecsPostingsFormat_class_()];
    JreStrongAssignAndConsume(&OrgApacheLuceneCodecsPostingsFormat_EMPTY_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsPostingsFormat__initialized);
  }
}

@end