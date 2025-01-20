@interface OrgApacheLuceneUtilStrictStringTokenizer
- (BOOL)hasMoreTokens;
- (OrgApacheLuceneUtilStrictStringTokenizer)initWithNSString:(id)a3 withChar:(unsigned __int16)a4;
- (id)nextToken;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilStrictStringTokenizer

- (OrgApacheLuceneUtilStrictStringTokenizer)initWithNSString:(id)a3 withChar:(unsigned __int16)a4
{
  self->delimiter_ = a4;
  return self;
}

- (id)nextToken
{
  if (self->pos_ < 0)
  {
    v9 = new_JavaLangIllegalStateException_initWithNSString_(@"no more tokens");
    objc_exception_throw(v9);
  }
  s = self->s_;
  if (!s) {
    JreThrowNullPointerException();
  }
  id v4 = (id)-[NSString indexOf:fromIndex:](s, "indexOf:fromIndex:", self->delimiter_);
  v5 = self->s_;
  uint64_t pos = self->pos_;
  if ((v4 & 0x80000000) != 0)
  {
    id result = [(NSString *)v5 substring:pos];
    int v8 = -1;
  }
  else
  {
    id result = [(NSString *)v5 substring:pos endIndex:v4];
    int v8 = v4 + 1;
  }
  self->pos_ = v8;
  return result;
}

- (BOOL)hasMoreTokens
{
  return self->pos_ >= 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilStrictStringTokenizer;
  [(OrgApacheLuceneUtilStrictStringTokenizer *)&v3 dealloc];
}

@end