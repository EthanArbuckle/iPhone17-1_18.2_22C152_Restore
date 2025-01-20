@interface OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter
- (OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)__javaClone;
- (void)swapOneWithInt:(int)a3 withInt:(int)a4;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter

- (void)swapOneWithInt:(int)a3 withInt:(int)a4
{
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  int v5 = 3 * a3;
  int v6 = 3 * a4;
  sub_100082214((uint64_t)self, (3 * a3), (3 * a4));
  sub_100082214((uint64_t)self, (v5 + 1), (v6 + 1));
  sub_100082214((uint64_t)self, (v5 + 2), (v6 + 2));
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  int v6 = &self->this$0_;
  uint64_t v7 = *(objc_loadWeak((id *)&self->this$0_) + 5);
  if (!v7) {
    JreThrowNullPointerException();
  }
  uint64_t v8 = (3 * a3);
  uint64_t v9 = (3 * a4);
  uint64_t v10 = *(unsigned int *)(v7 + 8);
  int v11 = v8 + 1;
  if ((int)v8 + 1 < 0 || v11 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v11);
  }
  int v12 = *(_DWORD *)(v7 + 12 + 4 * ((int)v8 + 1));
  uint64_t v13 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v14 = *(unsigned int *)(v13 + 8);
  int v15 = v9 + 1;
  if ((int)v9 + 1 < 0 || v15 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v15);
  }
  int v16 = *(_DWORD *)(v13 + 12 + 4 * v15);
  if (v12 < v16) {
    return -1;
  }
  if (v12 > v16) {
    return 1;
  }
  uint64_t v17 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v18 = *(unsigned int *)(v17 + 8);
  int v19 = v8 + 2;
  if ((int)v8 + 2 < 0 || v19 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v19);
  }
  int v20 = *(_DWORD *)(v17 + 12 + 4 * ((int)v8 + 2));
  uint64_t v21 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v22 = *(unsigned int *)(v21 + 8);
  int v23 = v9 + 2;
  if ((int)v9 + 2 < 0 || v23 >= (int)v22) {
    IOSArray_throwOutOfBoundsWithMsg(v22, v23);
  }
  int v24 = *(_DWORD *)(v21 + 12 + 4 * v23);
  if (v20 < v24) {
    return -1;
  }
  if (v20 > v24) {
    return 1;
  }
  uint64_t v26 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v27 = *(unsigned int *)(v26 + 8);
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v27) {
    IOSArray_throwOutOfBoundsWithMsg(v27, v8);
  }
  int v28 = *(_DWORD *)(v26 + 12 + 4 * (int)v8);
  uint64_t v29 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v30 = *(unsigned int *)(v29 + 8);
  if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v30) {
    IOSArray_throwOutOfBoundsWithMsg(v30, v9);
  }
  int v31 = *(_DWORD *)(v29 + 12 + 4 * (int)v9);
  BOOL v32 = v28 < v31;
  BOOL v33 = v28 > v31;
  if (v32) {
    return -1;
  }
  else {
    return v33;
  }
}

- (OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter;
  [(OrgApacheLuceneUtilAutomatonAutomaton_MinMaxDestSorter *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end