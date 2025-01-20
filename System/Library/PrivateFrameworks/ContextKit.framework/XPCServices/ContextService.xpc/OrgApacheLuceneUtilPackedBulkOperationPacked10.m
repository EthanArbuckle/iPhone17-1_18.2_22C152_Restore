@interface OrgApacheLuceneUtilPackedBulkOperationPacked10
- (OrgApacheLuceneUtilPackedBulkOperationPacked10)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked10

- (OrgApacheLuceneUtilPackedBulkOperationPacked10)init
{
  return self;
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      uint64_t v7 = *(void *)&a6;
      while (1)
      {
        int v9 = a4;
        uint64_t v10 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v11 = *((void *)a3 + a4 + 2);
        uint64_t v12 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v7);
        }
        int v13 = v7 + 1;
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 54;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 44) & 0x3FF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((_DWORD *)a5 + v15 + 3) = (v11 >> 34) & 0x3FF;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        int v19 = v7 + 4;
        *((_DWORD *)a5 + v17 + 3) = (v11 >> 24) & 0x3FF;
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 4));
        }
        int v21 = v7 + 5;
        *((_DWORD *)a5 + v19 + 3) = (v11 >> 14) & 0x3FF;
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 5));
        }
        uint64_t v23 = (a4 + 1);
        *((_DWORD *)a5 + v21 + 3) = (v11 >> 4) & 0x3FF;
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, v23);
        }
        int v25 = v7 + 6;
        unint64_t v26 = *((void *)a3 + (int)v23 + 2);
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v25 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v7 + 7;
        *((_DWORD *)a5 + v25 + 3) = (v26 >> 58) & 0x3F | ((v11 & 0xF) << 6);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 7));
        }
        int v30 = v7 + 8;
        *((_DWORD *)a5 + v28 + 3) = HIWORD(v26) & 0x3FF;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 8));
        }
        int v32 = v7 + 9;
        *((_DWORD *)a5 + v30 + 3) = (v26 >> 38) & 0x3FF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 9));
        }
        int v34 = v7 + 10;
        *((_DWORD *)a5 + v32 + 3) = (v26 >> 28) & 0x3FF;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 10));
        }
        int v36 = v7 + 11;
        *((_DWORD *)a5 + v34 + 3) = (v26 >> 18) & 0x3FF;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 11));
        }
        int v38 = v9 + 2;
        *((_DWORD *)a5 + v36 + 3) = (v26 >> 8) & 0x3FF;
        uint64_t v39 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v9 + 2));
        }
        int v40 = v7 + 12;
        unint64_t v41 = *((void *)a3 + v38 + 2);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 12));
        }
        int v43 = v7 + 13;
        *((_DWORD *)a5 + v40 + 3) = (v41 >> 62) & 3 | (4 * v26);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 13));
        }
        int v45 = v7 + 14;
        *((_DWORD *)a5 + v43 + 3) = (v41 >> 52) & 0x3FF;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 14));
        }
        int v47 = v7 + 15;
        *((_DWORD *)a5 + v45 + 3) = (v41 >> 42) & 0x3FF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 15));
        }
        int v49 = v7 + 16;
        *((_DWORD *)a5 + v47 + 3) = WORD2(v41) & 0x3FF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 16));
        }
        int v51 = v7 + 17;
        *((_DWORD *)a5 + v49 + 3) = v41 >> 22;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 17));
        }
        int v53 = v7 + 18;
        *((_DWORD *)a5 + v51 + 3) = (v41 >> 12) & 0x3FF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 18));
        }
        int v55 = v9 + 3;
        *((_DWORD *)a5 + v53 + 3) = (v41 >> 2) & 0x3FF;
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 3));
        }
        int v57 = v7 + 19;
        unint64_t v58 = *((void *)a3 + v55 + 2);
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v57 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 19));
        }
        int v60 = v7 + 20;
        *((_DWORD *)a5 + v57 + 3) = HIBYTE(v58) | ((v41 & 3) << 8);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 20));
        }
        int v62 = v7 + 21;
        *((_DWORD *)a5 + v60 + 3) = (v58 >> 46) & 0x3FF;
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 21));
        }
        int v64 = v7 + 22;
        *((_DWORD *)a5 + v62 + 3) = (v58 >> 36) & 0x3FF;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 22));
        }
        int v66 = v7 + 23;
        *((_DWORD *)a5 + v64 + 3) = (v58 >> 26) & 0x3FF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 23));
        }
        int v68 = v7 + 24;
        *((_DWORD *)a5 + v66 + 3) = WORD1(v58) & 0x3FF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 24));
        }
        int v70 = v9 + 4;
        *((_DWORD *)a5 + v68 + 3) = (unsigned __int16)v58 >> 6;
        uint64_t v71 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 4));
        }
        int v72 = v7 + 25;
        unint64_t v73 = *((void *)a3 + v70 + 2);
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v72 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 25));
        }
        int v75 = v7 + 26;
        *((_DWORD *)a5 + v72 + 3) = (v73 >> 60) & 0xF | (16 * (v58 & 0x3F));
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 26));
        }
        int v77 = v7 + 27;
        *((_DWORD *)a5 + v75 + 3) = (v73 >> 50) & 0x3FF;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 27));
        }
        int v79 = v7 + 28;
        *((_DWORD *)a5 + v77 + 3) = (v73 >> 40) & 0x3FF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 28));
        }
        int v81 = v7 + 29;
        *((_DWORD *)a5 + v79 + 3) = (v73 >> 30) & 0x3FF;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 29));
        }
        int v83 = v7 + 30;
        *((_DWORD *)a5 + v81 + 3) = (v73 >> 20) & 0x3FF;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 30));
        }
        int v85 = v7 + 31;
        *((_DWORD *)a5 + v83 + 3) = (v73 >> 10) & 0x3FF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 31));
        }
        *((_DWORD *)a5 + v85 + 3) = v73 & 0x3FF;
        a4 = v9 + 5;
        uint64_t v7 = (v7 + 32);
        if (!--a7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unsigned int v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((_DWORD *)a5 + (int)v8 + 3) = (v13 >> 6) | (4 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        unsigned int v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        int v20 = v10 + 3;
        *((_DWORD *)a5 + v17 + 3) = (v18 >> 4) & 0xFFFFFC0F | (16 * (v13 & 0x3F));
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v10 + 3));
        }
        int v22 = v8 + 2;
        unsigned int v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 2));
        }
        int v25 = v10 + 4;
        *((_DWORD *)a5 + v22 + 3) = (v23 >> 2) & 0xFFFFFC3F | ((v18 & 0xF) << 6);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 4));
        }
        int v27 = v8 + 3;
        int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 3));
        }
        *((_DWORD *)a5 + v27 + 3) = v28 & 0xFFFFFCFF | ((v23 & 3) << 8);
        a4 = v10 + 5;
        uint64_t v8 = (v8 + 4);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      uint64_t v7 = *(void *)&a6;
      while (1)
      {
        int v9 = a4;
        uint64_t v10 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v11 = *((void *)a3 + a4 + 2);
        uint64_t v12 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v7);
        }
        int v13 = v7 + 1;
        *((void *)a5 + (int)v7 + 2) = v11 >> 54;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((void *)a5 + v13 + 2) = (v11 >> 44) & 0x3FF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((void *)a5 + v15 + 2) = (v11 >> 34) & 0x3FF;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        int v19 = v7 + 4;
        *((void *)a5 + v17 + 2) = (v11 >> 24) & 0x3FF;
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 4));
        }
        int v21 = v7 + 5;
        *((void *)a5 + v19 + 2) = (v11 >> 14) & 0x3FF;
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 5));
        }
        int v23 = a4 + 1;
        *((void *)a5 + v21 + 2) = (v11 >> 4) & 0x3FF;
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (a4 + 1));
        }
        int v25 = v7 + 6;
        unint64_t v26 = *((void *)a3 + v23 + 2);
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v25 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v7 + 7;
        *((void *)a5 + v25 + 2) = (v26 >> 58) & 0xFFFFFFFFFFFFFC3FLL | ((v11 & 0xF) << 6);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 7));
        }
        int v30 = v7 + 8;
        *((void *)a5 + v28 + 2) = HIWORD(v26) & 0x3FF;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 8));
        }
        int v32 = v7 + 9;
        *((void *)a5 + v30 + 2) = (v26 >> 38) & 0x3FF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 9));
        }
        int v34 = v7 + 10;
        *((void *)a5 + v32 + 2) = (v26 >> 28) & 0x3FF;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 10));
        }
        int v36 = v7 + 11;
        *((void *)a5 + v34 + 2) = (v26 >> 18) & 0x3FF;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 11));
        }
        int v38 = v9 + 2;
        *((void *)a5 + v36 + 2) = (v26 >> 8) & 0x3FF;
        uint64_t v39 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v9 + 2));
        }
        int v40 = v7 + 12;
        unint64_t v41 = *((void *)a3 + v38 + 2);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 12));
        }
        int v43 = v7 + 13;
        *((void *)a5 + v40 + 2) = (v41 >> 62) & 0xFFFFFFFFFFFFFC03 | (4 * v26);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 13));
        }
        int v45 = v7 + 14;
        *((void *)a5 + v43 + 2) = (v41 >> 52) & 0x3FF;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 14));
        }
        int v47 = v7 + 15;
        *((void *)a5 + v45 + 2) = (v41 >> 42) & 0x3FF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 15));
        }
        int v49 = v7 + 16;
        *((void *)a5 + v47 + 2) = HIDWORD(v41) & 0x3FF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 16));
        }
        int v51 = v7 + 17;
        *((void *)a5 + v49 + 2) = v41 >> 22;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 17));
        }
        int v53 = v7 + 18;
        *((void *)a5 + v51 + 2) = (v41 >> 12) & 0x3FF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 18));
        }
        int v55 = v9 + 3;
        *((void *)a5 + v53 + 2) = (v41 >> 2) & 0x3FF;
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 3));
        }
        int v57 = v7 + 19;
        unint64_t v58 = *((void *)a3 + v55 + 2);
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v57 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 19));
        }
        int v60 = v7 + 20;
        *((void *)a5 + v57 + 2) = HIBYTE(v58) & 0xFFFFFFFFFFFFFCFFLL | ((v41 & 3) << 8);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 20));
        }
        int v62 = v7 + 21;
        *((void *)a5 + v60 + 2) = (v58 >> 46) & 0x3FF;
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 21));
        }
        int v64 = v7 + 22;
        *((void *)a5 + v62 + 2) = (v58 >> 36) & 0x3FF;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 22));
        }
        int v66 = v7 + 23;
        *((void *)a5 + v64 + 2) = (v58 >> 26) & 0x3FF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 23));
        }
        int v68 = v7 + 24;
        *((void *)a5 + v66 + 2) = (v58 >> 16) & 0x3FF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 24));
        }
        int v70 = v9 + 4;
        *((void *)a5 + v68 + 2) = (unsigned __int16)v58 >> 6;
        uint64_t v71 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 4));
        }
        int v72 = v7 + 25;
        unint64_t v73 = *((void *)a3 + v70 + 2);
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v72 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 25));
        }
        int v75 = v7 + 26;
        *((void *)a5 + v72 + 2) = (v73 >> 60) & 0xFFFFFFFFFFFFFC0FLL | (16 * (v58 & 0x3F));
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 26));
        }
        int v77 = v7 + 27;
        *((void *)a5 + v75 + 2) = (v73 >> 50) & 0x3FF;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 27));
        }
        int v79 = v7 + 28;
        *((void *)a5 + v77 + 2) = (v73 >> 40) & 0x3FF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 28));
        }
        int v81 = v7 + 29;
        *((void *)a5 + v79 + 2) = (v73 >> 30) & 0x3FF;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 29));
        }
        int v83 = v7 + 30;
        *((void *)a5 + v81 + 2) = (v73 >> 20) & 0x3FF;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 30));
        }
        int v85 = v7 + 31;
        *((void *)a5 + v83 + 2) = (v73 >> 10) & 0x3FF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 31));
        }
        *((void *)a5 + v85 + 2) = v73 & 0x3FF;
        a4 = v9 + 5;
        uint64_t v7 = (v7 + 32);
        if (!--a7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unint64_t v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((void *)a5 + (int)v8 + 2) = (v13 >> 6) | (4 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        unint64_t v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        int v20 = v10 + 3;
        *((void *)a5 + v17 + 2) = (v18 >> 4) & 0xFFFFFFFFFFFFFC0FLL | (16 * (v13 & 0x3F));
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v10 + 3));
        }
        int v22 = v8 + 2;
        unint64_t v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 2));
        }
        int v25 = v10 + 4;
        *((void *)a5 + v22 + 2) = (v23 >> 2) & 0xFFFFFFFFFFFFFC3FLL | ((v18 & 0xF) << 6);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 4));
        }
        int v27 = v8 + 3;
        uint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 3));
        }
        *((void *)a5 + v27 + 2) = v28 & 0xFFFFFFFFFFFFFCFFLL | ((v23 & 3) << 8);
        a4 = v10 + 5;
        uint64_t v8 = (v8 + 4);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end