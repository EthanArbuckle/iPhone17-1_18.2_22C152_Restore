@interface OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter
- (OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton_Builder:(id)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)__javaClone;
- (void)swapOneWithInt:(int)a3 withInt:(int)a4;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter

- (void)swapOneWithInt:(int)a3 withInt:(int)a4
{
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
  sub_1000830A4((uint64_t)self, (4 * a3), (4 * a4));
  sub_1000830A4((uint64_t)self, (4 * a3) | 1u, (4 * a4) | 1u);
  sub_1000830A4((uint64_t)self, (4 * a3) | 2u, (4 * a4) | 2u);
  sub_1000830A4((uint64_t)self, (4 * a3) | 3u, (4 * a4) | 3u);
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  v6 = &self->this$0_;
  uint64_t v7 = *(objc_loadWeak((id *)&self->this$0_) + 3);
  if (!v7) {
    JreThrowNullPointerException();
  }
  uint64_t v8 = (4 * a3);
  uint64_t v9 = (4 * a4);
  uint64_t v10 = *(unsigned int *)(v7 + 8);
  if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v8);
  }
  int v11 = *(_DWORD *)(v7 + 12 + 4 * (int)v8);
  uint64_t v12 = *(objc_loadWeak((id *)v6) + 3);
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
  uint64_t v15 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v16 = (int)v8 | 2;
  uint64_t v17 = *(unsigned int *)(v15 + 8);
  if ((v8 & 0x80000000) != 0 || (int)v16 >= (int)v17) {
    IOSArray_throwOutOfBoundsWithMsg(v17, (int)v8 | 2);
  }
  int v18 = *(_DWORD *)(v15 + 12 + 4 * v16);
  uint64_t v19 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v20 = (int)v9 | 2;
  uint64_t v21 = *(unsigned int *)(v19 + 8);
  if ((v9 & 0x80000000) != 0 || (int)v20 >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, (int)v9 | 2);
  }
  int v22 = *(_DWORD *)(v19 + 12 + 4 * v20);
  if (v18 < v22) {
    return -1;
  }
  if (v18 > v22) {
    return 1;
  }
  uint64_t v23 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v24 = (int)v8 | 3;
  uint64_t v25 = *(unsigned int *)(v23 + 8);
  if ((v8 & 0x80000000) != 0 || (int)v24 >= (int)v25) {
    IOSArray_throwOutOfBoundsWithMsg(v25, (int)v8 | 3);
  }
  int v26 = *(_DWORD *)(v23 + 12 + 4 * v24);
  uint64_t v27 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v28 = (int)v9 | 3;
  uint64_t v29 = *(unsigned int *)(v27 + 8);
  if ((v9 & 0x80000000) != 0 || (int)v28 >= (int)v29) {
    IOSArray_throwOutOfBoundsWithMsg(v29, (int)v9 | 3);
  }
  int v30 = *(_DWORD *)(v27 + 12 + 4 * v28);
  if (v26 < v30) {
    return -1;
  }
  if (v26 > v30) {
    return 1;
  }
  uint64_t v32 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v33 = (int)v8 | 1;
  uint64_t v34 = *(unsigned int *)(v32 + 8);
  if ((v8 & 0x80000000) != 0 || (int)v33 >= (int)v34) {
    IOSArray_throwOutOfBoundsWithMsg(v34, (int)v8 | 1);
  }
  int v35 = *(_DWORD *)(v32 + 12 + 4 * v33);
  uint64_t v36 = *(objc_loadWeak((id *)v6) + 3);
  uint64_t v37 = (int)v9 | 1;
  uint64_t v38 = *(unsigned int *)(v36 + 8);
  if ((v9 & 0x80000000) != 0 || (int)v37 >= (int)v38) {
    IOSArray_throwOutOfBoundsWithMsg(v38, (int)v9 | 1);
  }
  int v39 = *(_DWORD *)(v36 + 12 + 4 * v37);
  BOOL v40 = v35 < v39;
  BOOL v41 = v35 > v39;
  if (v40) {
    return -1;
  }
  else {
    return v41;
  }
}

- (OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter)initWithOrgApacheLuceneUtilAutomatonAutomaton_Builder:(id)a3
{
  return self;
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter;
  [(OrgApacheLuceneUtilAutomatonAutomaton_Builder_OurSorter *)&v3 __javaClone];
}

- (void).cxx_destruct
{
}

@end