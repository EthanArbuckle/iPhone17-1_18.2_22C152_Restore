@interface OrgApacheLuceneStoreFSDirectory_FSIndexOutput_$1
- (OrgApacheLuceneStoreFSDirectory_FSIndexOutput_$1)initWithJavaIoOutputStream:(id)a3;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreFSDirectory_FSIndexOutput_$1

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    do
    {
      uint64_t v9 = JavaLangMath_minWithInt_withInt_(v5, 0x2000);
      out = self->super.out_;
      if (!out) {
        JreThrowNullPointerException();
      }
      [(JavaIoOutputStream *)out writeWithByteArray:a3 withInt:v6 withInt:v9];
      uint64_t v5 = (v5 - v9);
      uint64_t v6 = (v9 + v6);
    }
    while ((int)v5 > 0);
  }
}

- (OrgApacheLuceneStoreFSDirectory_FSIndexOutput_$1)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

@end