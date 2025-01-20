@interface OrgApacheLuceneCodecsDocValuesFormat
+ (id)availableDocValuesFormats;
+ (id)forNameWithNSString:(id)a3;
+ (void)reloadDocValuesFormatsWithJavaLangClassLoader:(id)a3;
- (NSString)description;
- (OrgApacheLuceneCodecsDocValuesFormat)initWithNSString:(id)a3;
- (id)getName;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesFormat

- (OrgApacheLuceneCodecsDocValuesFormat)initWithNSString:(id)a3
{
  return self;
}

- (id)getName
{
  return self->name_;
}

- (NSString)description
{
  return (NSString *)JreStrcat("$$C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"DocValuesFormat(name=");
}

+ (id)forNameWithNSString:(id)a3
{
  uint64_t v4 = (void *)sub_10010E928();
  return [v4 lookupWithNSString:a3];
}

+ (id)availableDocValuesFormats
{
  uint64_t v2 = (void *)sub_10010E928();
  return [v2 availableServices];
}

+ (void)reloadDocValuesFormatsWithJavaLangClassLoader:(id)a3
{
  uint64_t v4 = (void *)sub_10010E928();
  [v4 reloadWithJavaLangClassLoader:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesFormat;
  [(OrgApacheLuceneCodecsDocValuesFormat *)&v3 dealloc];
}

@end