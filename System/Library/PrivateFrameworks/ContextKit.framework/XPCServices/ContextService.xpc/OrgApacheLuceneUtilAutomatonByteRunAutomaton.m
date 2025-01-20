@interface OrgApacheLuceneUtilAutomatonByteRunAutomaton
- (BOOL)runWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (OrgApacheLuceneUtilAutomatonByteRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (OrgApacheLuceneUtilAutomatonByteRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilAutomatonByteRunAutomaton

- (OrgApacheLuceneUtilAutomatonByteRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return self;
}

- (OrgApacheLuceneUtilAutomatonByteRunAutomaton)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5
{
  return self;
}

- (BOOL)runWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t initial = self->super.initial_;
  if (a5 + a4 <= a4)
  {
LABEL_10:
    accept = self->super.accept_;
    if (accept)
    {
      uint64_t size = accept->super.size_;
      if ((initial & 0x80000000) != 0 || (int)initial >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, initial);
      }
      return *((unsigned char *)&accept->super.size_ + (int)initial + 4) != 0;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_15;
  }
  uint64_t v8 = a4;
  uint64_t v9 = a5 + a4;
  while (1)
  {
    uint64_t v10 = *((unsigned int *)a3 + 2);
    if (v8 < 0 || v8 >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, v8);
    }
    uint64_t v11 = [(OrgApacheLuceneUtilAutomatonRunAutomaton *)self stepWithInt:initial withInt:*((unsigned __int8 *)a3 + v8 + 12)];
    if (v11 == -1) {
      return 0;
    }
    uint64_t initial = v11;
    if (v9 == ++v8) {
      goto LABEL_10;
    }
  }
}

@end