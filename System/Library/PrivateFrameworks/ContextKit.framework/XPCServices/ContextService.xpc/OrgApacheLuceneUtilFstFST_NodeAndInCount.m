@interface OrgApacheLuceneUtilFstFST_NodeAndInCount
- (OrgApacheLuceneUtilFstFST_NodeAndInCount)initWithInt:(int)a3 withInt:(int)a4;
- (int)compareToWithId:(id)a3;
@end

@implementation OrgApacheLuceneUtilFstFST_NodeAndInCount

- (OrgApacheLuceneUtilFstFST_NodeAndInCount)initWithInt:(int)a3 withInt:(int)a4
{
  self->node_ = a3;
  self->count_ = a4;
  return self;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int count = self->count_;
  int v6 = *((_DWORD *)a3 + 3);
  if (count > v6) {
    return 1;
  }
  if (count < v6) {
    return -1;
  }
  return *((_DWORD *)a3 + 2) - self->node_;
}

@end