@interface OrgApacheLuceneAnalysisReusableStringReader
- (OrgApacheLuceneAnalysisReusableStringReader)init;
- (int)read;
- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
- (void)setValueWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisReusableStringReader

- (void)setValueWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->size_ = [a3 length];
  self->pos_ = 0;
}

- (int)read
{
  int pos = self->pos_;
  if (pos >= self->size_)
  {
    JreStrongAssign((id *)&self->s_, 0);
    return -1;
  }
  else
  {
    s = self->s_;
    if (!s) {
      JreThrowNullPointerException();
    }
    self->pos_ = pos + 1;
    return -[NSString charAtWithInt:](s, "charAtWithInt:");
  }
}

- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  int pos = self->pos_;
  int size = self->size_;
  if (size <= pos)
  {
    JreStrongAssign((id *)&self->s_, 0);
    return -1;
  }
  else
  {
    uint64_t v8 = *(void *)&a4;
    int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a5, size - pos);
    s = self->s_;
    if (!s) {
      JreThrowNullPointerException();
    }
    [(NSString *)s getChars:self->pos_ sourceEnd:(self->pos_ + v10) destination:a3 destinationBegin:v8];
    self->pos_ += v10;
  }
  return v10;
}

- (void)close
{
  self->pos_ = self->size_;
  JreStrongAssign((id *)&self->s_, 0);
}

- (OrgApacheLuceneAnalysisReusableStringReader)init
{
  self->pos_ = 0;
  self->size_ = 0;
  JreStrongAssign((id *)&self->s_, 0);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisReusableStringReader;
  [(JavaIoReader *)&v3 dealloc];
}

@end