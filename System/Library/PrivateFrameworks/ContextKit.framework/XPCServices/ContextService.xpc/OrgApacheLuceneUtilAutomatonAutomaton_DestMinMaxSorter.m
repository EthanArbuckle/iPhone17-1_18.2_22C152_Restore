@interface OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter
- (OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)__javaClone;
- (void)swapOneWithInt:(int)a3 withInt:(int)a4;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter

- (void)swapOneWithInt:(int)a3 withInt:(int)a4
{
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  int v5 = 3 * a3;
  int v6 = 3 * a4;
  sub_100081D58((uint64_t)self, (3 * a3), (3 * a4));
  sub_100081D58((uint64_t)self, (v5 + 1), (v6 + 1));
  sub_100081D58((uint64_t)self, (v5 + 2), (v6 + 2));
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
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v8);
  }
  int v11 = *(_DWORD *)(v7 + 12 + 4 * (int)v8);
  uint64_t v12 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v13 = *(unsigned int *)(v12 + 8);
  if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v9);
  }
  int v14 = *(_DWORD *)(v12 + 12 + 4 * (int)v9);
  if (v11 < v14) {
    return -1;
  }
  if (v11 > v14) {
    return 1;
  }
  uint64_t v15 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v16 = *(unsigned int *)(v15 + 8);
  int v17 = v8 + 1;
  if ((int)v8 + 1 < 0 || v17 >= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v17);
  }
  int v18 = *(_DWORD *)(v15 + 12 + 4 * ((int)v8 + 1));
  uint64_t v19 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v20 = *(unsigned int *)(v19 + 8);
  int v21 = v9 + 1;
  if ((int)v9 + 1 < 0 || v21 >= (int)v20) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v21);
  }
  int v22 = *(_DWORD *)(v19 + 12 + 4 * v21);
  if (v18 < v22) {
    return -1;
  }
  if (v18 > v22) {
    return 1;
  }
  uint64_t v24 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v25 = *(unsigned int *)(v24 + 8);
  int v26 = v8 + 2;
  uint64_t v27 = (int)v8 + 2;
  if ((int)v27 < 0 || v26 >= (int)v25) {
    IOSArray_throwOutOfBoundsWithMsg(v25, v26);
  }
  int v28 = *(_DWORD *)(v24 + 12 + 4 * v27);
  uint64_t v29 = *(objc_loadWeak((id *)v6) + 5);
  uint64_t v30 = *(unsigned int *)(v29 + 8);
  int v31 = v9 + 2;
  if ((int)v9 + 2 < 0 || v31 >= (int)v30) {
    IOSArray_throwOutOfBoundsWithMsg(v30, v31);
  }
  int v32 = *(_DWORD *)(v29 + 12 + 4 * v31);
  BOOL v33 = v28 < v32;
  BOOL v34 = v28 > v32;
  if (v33) {
    return -1;
  }
  else {
    return v34;
  }
}

- (OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter;
  [(OrgApacheLuceneUtilAutomatonAutomaton_DestMinMaxSorter *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end