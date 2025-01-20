@interface OrgApacheLuceneUtilBytesRef_UTF8SortedAsUnicodeComparator
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneUtilBytesRef_UTF8SortedAsUnicodeComparator

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
LABEL_18:
  }
    JreThrowNullPointerException();
  uint64_t v6 = *((void *)a3 + 1);
  uint64_t v7 = *((void *)a4 + 1);
  uint64_t v8 = *((int *)a3 + 4);
  uint64_t v9 = *((unsigned int *)a4 + 4);
  int v10 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), *((_DWORD *)a4 + 5));
  int v11 = v10 + v8;
  if ((int)v8 > v10 + (int)v8) {
    int v11 = v8;
  }
  uint64_t v12 = v11;
  while (v12 != v8)
  {
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v13 = *(unsigned int *)(v6 + 8);
    if (v8 < 0 || v8 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v8);
    }
    if (!v7) {
      goto LABEL_18;
    }
    int v14 = *(unsigned __int8 *)(v6 + 12 + v8);
    uint64_t v15 = *(unsigned int *)(v7 + 8);
    if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v9);
    }
    int v16 = *(unsigned __int8 *)(v7 + 12 + (int)v9);
    ++v8;
    uint64_t v9 = (v9 + 1);
    int result = v14 - v16;
    if (v14 != v16) {
      return result;
    }
  }
  return *((_DWORD *)a3 + 5) - *((_DWORD *)a4 + 5);
}

@end