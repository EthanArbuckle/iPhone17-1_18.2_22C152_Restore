@interface OrgApacheLuceneUtilCharsRef_UTF16SortedAsUTF8Comparator
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation OrgApacheLuceneUtilCharsRef_UTF16SortedAsUTF8Comparator

- (int)compareWithId:(id)a3 withId:(id)a4
{
  if (a3 == a4) {
    return 0;
  }
  if (!a3 || !a4) {
LABEL_35:
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
  do
  {
    if (v12 == v8) {
      return *((_DWORD *)a3 + 5) - *((_DWORD *)a4 + 5);
    }
    if (!v6) {
      goto LABEL_35;
    }
    uint64_t v13 = *(unsigned int *)(v6 + 8);
    if (v8 < 0 || v8 >= (int)v13) {
      IOSArray_throwOutOfBoundsWithMsg(v13, v8);
    }
    if (!v7) {
      goto LABEL_35;
    }
    unsigned int v14 = *(unsigned __int16 *)(v6 + 12 + 2 * v8);
    uint64_t v15 = *(unsigned int *)(v7 + 8);
    if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, v9);
    }
    unsigned int v16 = *(unsigned __int16 *)(v7 + 12 + 2 * (int)v9);
    ++v8;
    uint64_t v9 = (v9 + 1);
  }
  while (v14 == v16);
  if (v14 >> 13 <= 6) {
    __int16 v18 = 0x2000;
  }
  else {
    __int16 v18 = -2048;
  }
  unsigned __int16 v19 = v18 + v14;
  __int16 v20 = v16 + 0x2000;
  if (v16 >= 0xE000) {
    __int16 v20 = v16 - 2048;
  }
  BOOL v21 = v14 >> 11 >= 0x1B && v16 >> 11 >= 0x1B;
  if (v21) {
    unsigned __int16 v22 = v19;
  }
  else {
    unsigned __int16 v22 = v14;
  }
  if (v21) {
    LOWORD(v16) = v20;
  }
  return v22 - (unsigned __int16)v16;
}

@end