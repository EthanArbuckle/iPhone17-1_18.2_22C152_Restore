@interface OrgApacheLuceneCodecsCodec
+ (id)availableCodecs;
+ (id)forNameWithNSString:(id)a3;
+ (void)reloadCodecsWithJavaLangClassLoader:(id)a3;
+ (void)setDefaultWithOrgApacheLuceneCodecsCodec:(id)a3;
- (NSString)description;
- (OrgApacheLuceneCodecsCodec)initWithNSString:(id)a3;
- (id)getName;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCodec

- (OrgApacheLuceneCodecsCodec)initWithNSString:(id)a3
{
  return self;
}

- (id)getName
{
  return self->name_;
}

+ (id)forNameWithNSString:(id)a3
{
  v4 = (void *)sub_10009F1A0();
  return [v4 lookupWithNSString:a3];
}

+ (id)availableCodecs
{
  v2 = (void *)sub_10009F1A0();
  return [v2 availableServices];
}

+ (void)reloadCodecsWithJavaLangClassLoader:(id)a3
{
  v4 = (void *)sub_10009F1A0();
  [v4 reloadWithJavaLangClassLoader:a3];
}

+ (void)setDefaultWithOrgApacheLuceneCodecsCodec:(id)a3
{
}

- (NSString)description
{
  return self->name_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCodec;
  [(OrgApacheLuceneCodecsCodec *)&v3 dealloc];
}

@end