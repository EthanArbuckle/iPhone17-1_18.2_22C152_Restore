@interface OrgApacheLuceneUtilBytesRef_UTF8SortedAsUTF16Comparator
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneUtilBytesRef_UTF8SortedAsUTF16Comparator

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
LABEL_32:
  }
    JreThrowNullPointerException();
  uint64_t v4 = *((void *)a3 + 1);
  uint64_t v5 = *((void *)a4 + 1);
  int v6 = *((_DWORD *)a3 + 5);
  uint64_t v7 = *((int *)a3 + 4);
  uint64_t v8 = *((unsigned int *)a4 + 4);
  if (v6 >= *((_DWORD *)a4 + 5)) {
    int v6 = *((_DWORD *)a4 + 5);
  }
  int v9 = v6 + v7;
  if ((int)v7 > v9) {
    int v9 = *((_DWORD *)a3 + 4);
  }
  uint64_t v10 = v9;
  do
  {
    if (v10 == v7) {
      return *((_DWORD *)a3 + 5) - *((_DWORD *)a4 + 5);
    }
    if (!v4) {
      goto LABEL_32;
    }
    uint64_t v11 = *(unsigned int *)(v4 + 8);
    if (v7 < 0 || v7 >= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v11, v7);
    }
    if (!v5) {
      goto LABEL_32;
    }
    unsigned int v12 = *(unsigned __int8 *)(v4 + 12 + v7);
    uint64_t v13 = *(unsigned int *)(v5 + 8);
    if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v8);
    }
    unsigned int v14 = *(unsigned __int8 *)(v5 + 12 + (int)v8);
    ++v7;
    uint64_t v8 = (v8 + 1);
  }
  while (v12 == v14);
  if ((v12 & 0xFE) == 0xEE) {
    unsigned int v16 = v12 + 14;
  }
  else {
    unsigned int v16 = v12;
  }
  if ((v14 & 0xFE) == 0xEE) {
    unsigned int v17 = v14 + 14;
  }
  else {
    unsigned int v17 = v14;
  }
  if (v14 < 0xEE)
  {
    unsigned int v16 = v12;
    unsigned int v17 = v14;
  }
  if (v12 >= 0xEE) {
    unsigned int v14 = v17;
  }
  else {
    unsigned int v16 = v12;
  }
  return v16 - v14;
}

@end