@interface OrgApacheLuceneUtilPackedBulkOperationPacked14
- (OrgApacheLuceneUtilPackedBulkOperationPacked14)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked14

- (OrgApacheLuceneUtilPackedBulkOperationPacked14)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 50;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 36) & 0x3FFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((_DWORD *)a5 + v15 + 3) = (v11 >> 22) & 0x3FFF;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        uint64_t v19 = (a4 + 1);
        *((_DWORD *)a5 + v17 + 3) = (v11 >> 8) & 0x3FFF;
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v19);
        }
        int v21 = v7 + 4;
        unint64_t v22 = *((void *)a3 + (int)v19 + 2);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((_DWORD *)a5 + v21 + 3) = (v22 >> 58) & 0x3F | (v11 << 6);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v7 + 6;
        *((_DWORD *)a5 + v24 + 3) = (v22 >> 44) & 0x3FFF;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v7 + 7;
        *((_DWORD *)a5 + v26 + 3) = (v22 >> 30) & 0x3FFF;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 7));
        }
        int v30 = v7 + 8;
        *((_DWORD *)a5 + v28 + 3) = WORD1(v22) & 0x3FFF;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 8));
        }
        int v32 = v9 + 2;
        *((_DWORD *)a5 + v30 + 3) = (unsigned __int16)v22 >> 2;
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 2));
        }
        int v34 = v7 + 9;
        unint64_t v35 = *((void *)a3 + v32 + 2);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 9));
        }
        int v37 = v7 + 10;
        *((_DWORD *)a5 + v34 + 3) = (v35 >> 52) & 0xCFFF | ((v22 & 3) << 12);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 10));
        }
        int v39 = v7 + 11;
        *((_DWORD *)a5 + v37 + 3) = (v35 >> 38) & 0x3FFF;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 11));
        }
        int v41 = v7 + 12;
        *((_DWORD *)a5 + v39 + 3) = (v35 >> 24) & 0x3FFF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 12));
        }
        int v43 = v9 + 3;
        *((_DWORD *)a5 + v41 + 3) = (v35 >> 10) & 0x3FFF;
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 3));
        }
        int v45 = v7 + 13;
        unint64_t v46 = *((void *)a3 + v43 + 2);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 13));
        }
        int v48 = v7 + 14;
        *((_DWORD *)a5 + v45 + 3) = (v46 >> 60) & 0xF | (16 * (v35 & 0x3FF));
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 14));
        }
        int v50 = v7 + 15;
        *((_DWORD *)a5 + v48 + 3) = (v46 >> 46) & 0x3FFF;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 15));
        }
        int v52 = v7 + 16;
        *((_DWORD *)a5 + v50 + 3) = WORD2(v46) & 0x3FFF;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 16));
        }
        int v54 = v7 + 17;
        *((_DWORD *)a5 + v52 + 3) = v46 >> 18;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 17));
        }
        int v56 = v9 + 4;
        *((_DWORD *)a5 + v54 + 3) = (v46 >> 4) & 0x3FFF;
        uint64_t v57 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v9 + 4));
        }
        int v58 = v7 + 18;
        unint64_t v59 = *((void *)a3 + v56 + 2);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v58 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 18));
        }
        int v61 = v7 + 19;
        *((_DWORD *)a5 + v58 + 3) = (v59 >> 54) & 0xC3FF | ((v46 & 0xF) << 10);
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 19));
        }
        int v63 = v7 + 20;
        *((_DWORD *)a5 + v61 + 3) = (v59 >> 40) & 0x3FFF;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 20));
        }
        int v65 = v7 + 21;
        *((_DWORD *)a5 + v63 + 3) = (v59 >> 26) & 0x3FFF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 21));
        }
        int v67 = v9 + 5;
        *((_DWORD *)a5 + v65 + 3) = (v59 >> 12) & 0x3FFF;
        uint64_t v68 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v9 + 5));
        }
        int v69 = v7 + 22;
        unint64_t v70 = *((void *)a3 + v67 + 2);
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v69 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 22));
        }
        int v72 = v7 + 23;
        *((_DWORD *)a5 + v69 + 3) = (v70 >> 62) & 3 | (4 * (v59 & 0xFFF));
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 23));
        }
        int v74 = v7 + 24;
        *((_DWORD *)a5 + v72 + 3) = HIWORD(v70) & 0x3FFF;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 24));
        }
        int v76 = v7 + 25;
        *((_DWORD *)a5 + v74 + 3) = (v70 >> 34) & 0x3FFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 25));
        }
        int v78 = v7 + 26;
        *((_DWORD *)a5 + v76 + 3) = (v70 >> 20) & 0x3FFF;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 26));
        }
        int v80 = v9 + 6;
        *((_DWORD *)a5 + v78 + 3) = (v70 >> 6) & 0x3FFF;
        uint64_t v81 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v9 + 6));
        }
        int v82 = v7 + 27;
        unint64_t v83 = *((void *)a3 + v80 + 2);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v82 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 27));
        }
        int v85 = v7 + 28;
        *((_DWORD *)a5 + v82 + 3) = HIBYTE(v83) | ((v70 & 0x3F) << 8);
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 28));
        }
        int v87 = v7 + 29;
        *((_DWORD *)a5 + v85 + 3) = (v83 >> 42) & 0x3FFF;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 29));
        }
        int v89 = v7 + 30;
        *((_DWORD *)a5 + v87 + 3) = (v83 >> 28) & 0x3FFF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 30));
        }
        int v91 = v7 + 31;
        *((_DWORD *)a5 + v89 + 3) = (v83 >> 14) & 0x3FFF;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 31));
        }
        *((_DWORD *)a5 + v91 + 3) = v83 & 0x3FFF;
        a4 = v9 + 7;
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
      uint64_t v7 = *(void *)&a6;
      while (1)
      {
        uint64_t v9 = a4;
        uint64_t v10 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, a4);
        }
        uint64_t v11 = (a4 + 1);
        if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v11);
        }
        if (!a5) {
          break;
        }
        unsigned int v12 = *((unsigned __int8 *)a3 + (int)v11 + 12);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v7);
        }
        int v14 = v9 + 2;
        *((_DWORD *)a5 + (int)v7 + 3) = (v12 >> 2) | (*((unsigned __int8 *)a3 + v9 + 12) << 6);
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 2));
        }
        int v16 = v9 + 3;
        int v17 = *((unsigned __int8 *)a3 + v14 + 12);
        if (v9 + 3 < 0 || v16 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 3));
        }
        int v18 = v7 + 1;
        unsigned int v19 = *((unsigned __int8 *)a3 + v16 + 12);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 1));
        }
        int v21 = v9 + 4;
        *((_DWORD *)a5 + v18 + 3) = ((v12 & 3) << 12) | (16 * v17) | (v19 >> 4);
        uint64_t v22 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 4));
        }
        int v23 = v9 + 5;
        int v24 = *((unsigned __int8 *)a3 + v21 + 12);
        if (v9 + 5 < 0 || v23 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 5));
        }
        int v25 = v7 + 2;
        unsigned int v26 = *((unsigned __int8 *)a3 + v23 + 12);
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v25 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 2));
        }
        int v28 = v9 + 6;
        *((_DWORD *)a5 + v25 + 3) = ((v19 & 0xF) << 10) | (4 * v24) | (v26 >> 6);
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 6));
        }
        int v30 = v7 + 3;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 3));
        }
        *((_DWORD *)a5 + v30 + 3) = *((unsigned __int8 *)a3 + v28 + 12) | ((v26 & 0x3F) << 8);
        a4 = v9 + 7;
        uint64_t v7 = (v7 + 4);
        if (!--a7) {
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
        *((void *)a5 + (int)v7 + 2) = v11 >> 50;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((void *)a5 + v13 + 2) = (v11 >> 36) & 0x3FFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((void *)a5 + v15 + 2) = (v11 >> 22) & 0x3FFF;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        int v19 = a4 + 1;
        *((void *)a5 + v17 + 2) = (v11 >> 8) & 0x3FFF;
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (a4 + 1));
        }
        int v21 = v7 + 4;
        unint64_t v22 = *((void *)a3 + v19 + 2);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((void *)a5 + v21 + 2) = (v22 >> 58) & 0xFFFFFFFFFFFFC03FLL | ((unint64_t)v11 << 6);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v7 + 6;
        *((void *)a5 + v24 + 2) = (v22 >> 44) & 0x3FFF;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v7 + 7;
        *((void *)a5 + v26 + 2) = (v22 >> 30) & 0x3FFF;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 7));
        }
        int v30 = v7 + 8;
        *((void *)a5 + v28 + 2) = (v22 >> 16) & 0x3FFF;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 8));
        }
        int v32 = v9 + 2;
        *((void *)a5 + v30 + 2) = (unsigned __int16)v22 >> 2;
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 2));
        }
        int v34 = v7 + 9;
        unint64_t v35 = *((void *)a3 + v32 + 2);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 9));
        }
        unint64_t v37 = (v35 >> 52) & 0xFFFFFFFFFFFFCFFFLL | ((v22 & 3) << 12);
        int v38 = v7 + 10;
        *((void *)a5 + v34 + 2) = v37;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v7 + 11;
        *((void *)a5 + v38 + 2) = (v35 >> 38) & 0x3FFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v7 + 12;
        *((void *)a5 + v40 + 2) = (v35 >> 24) & 0x3FFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 12));
        }
        int v44 = v9 + 3;
        *((void *)a5 + v42 + 2) = (v35 >> 10) & 0x3FFF;
        uint64_t v45 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 3));
        }
        int v46 = v7 + 13;
        unint64_t v47 = *((void *)a3 + v44 + 2);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v46 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v7 + 14;
        *((void *)a5 + v46 + 2) = (v47 >> 60) & 0xFFFFFFFFFFFFC00FLL | (16 * (v35 & 0x3FF));
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v7 + 15;
        *((void *)a5 + v49 + 2) = (v47 >> 46) & 0x3FFF;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 15));
        }
        int v53 = v7 + 16;
        *((void *)a5 + v51 + 2) = HIDWORD(v47) & 0x3FFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 16));
        }
        int v55 = v7 + 17;
        *((void *)a5 + v53 + 2) = v47 >> 18;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 17));
        }
        int v57 = v9 + 4;
        *((void *)a5 + v55 + 2) = (v47 >> 4) & 0x3FFF;
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 4));
        }
        int v59 = v7 + 18;
        unint64_t v60 = *((void *)a3 + v57 + 2);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 18));
        }
        unint64_t v62 = (v60 >> 54) & 0xFFFFFFFFFFFFC3FFLL | ((v47 & 0xF) << 10);
        int v63 = v7 + 19;
        *((void *)a5 + v59 + 2) = v62;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 19));
        }
        int v65 = v7 + 20;
        *((void *)a5 + v63 + 2) = (v60 >> 40) & 0x3FFF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 20));
        }
        int v67 = v7 + 21;
        *((void *)a5 + v65 + 2) = (v60 >> 26) & 0x3FFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 21));
        }
        int v69 = v9 + 5;
        *((void *)a5 + v67 + 2) = (v60 >> 12) & 0x3FFF;
        uint64_t v70 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v9 + 5));
        }
        int v71 = v7 + 22;
        unint64_t v72 = *((void *)a3 + v69 + 2);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v71 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 22));
        }
        int v74 = v7 + 23;
        *((void *)a5 + v71 + 2) = (v72 >> 62) & 0xFFFFFFFFFFFFC003 | (4 * (v60 & 0xFFF));
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 23));
        }
        int v76 = v7 + 24;
        *((void *)a5 + v74 + 2) = HIWORD(v72) & 0x3FFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 24));
        }
        int v78 = v7 + 25;
        *((void *)a5 + v76 + 2) = (v72 >> 34) & 0x3FFF;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 25));
        }
        int v80 = v7 + 26;
        *((void *)a5 + v78 + 2) = (v72 >> 20) & 0x3FFF;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 26));
        }
        int v82 = v9 + 6;
        *((void *)a5 + v80 + 2) = (v72 >> 6) & 0x3FFF;
        uint64_t v83 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v9 + 6));
        }
        int v84 = v7 + 27;
        unint64_t v85 = *((void *)a3 + v82 + 2);
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v84 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 27));
        }
        int v87 = v7 + 28;
        *((void *)a5 + v84 + 2) = HIBYTE(v85) & 0xFFFFFFFFFFFFC0FFLL | ((v72 & 0x3F) << 8);
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 28));
        }
        int v89 = v7 + 29;
        *((void *)a5 + v87 + 2) = (v85 >> 42) & 0x3FFF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 29));
        }
        int v91 = v7 + 30;
        *((void *)a5 + v89 + 2) = (v85 >> 28) & 0x3FFF;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 30));
        }
        int v93 = v7 + 31;
        *((void *)a5 + v91 + 2) = (v85 >> 14) & 0x3FFF;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 31));
        }
        *((void *)a5 + v93 + 2) = v85 & 0x3FFF;
        a4 = v9 + 7;
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
      uint64_t v7 = *(void *)&a6;
      while (1)
      {
        uint64_t v9 = a4;
        uint64_t v10 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, a4);
        }
        uint64_t v11 = (a4 + 1);
        if ((v11 & 0x80000000) != 0 || (int)v11 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v11);
        }
        if (!a5) {
          break;
        }
        unint64_t v12 = *((unsigned __int8 *)a3 + (int)v11 + 12);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v7);
        }
        int v14 = v9 + 2;
        *((void *)a5 + (int)v7 + 2) = (v12 >> 2) | ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 6);
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 2));
        }
        int v16 = v9 + 3;
        uint64_t v17 = *((unsigned __int8 *)a3 + v14 + 12);
        if (v9 + 3 < 0 || v16 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 3));
        }
        int v18 = v7 + 1;
        unint64_t v19 = *((unsigned __int8 *)a3 + v16 + 12);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 1));
        }
        int v21 = v9 + 4;
        *((void *)a5 + v18 + 2) = ((v12 & 3) << 12) | (16 * v17) | (v19 >> 4);
        uint64_t v22 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 4));
        }
        int v23 = v9 + 5;
        uint64_t v24 = *((unsigned __int8 *)a3 + v21 + 12);
        if (v9 + 5 < 0 || v23 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 5));
        }
        int v25 = v7 + 2;
        unint64_t v26 = *((unsigned __int8 *)a3 + v23 + 12);
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v25 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 2));
        }
        int v28 = v9 + 6;
        *((void *)a5 + v25 + 2) = ((v19 & 0xF) << 10) | (4 * v24) | (v26 >> 6);
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 6));
        }
        int v30 = v7 + 3;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 3));
        }
        *((void *)a5 + v30 + 2) = *((unsigned __int8 *)a3 + v28 + 12) | ((v26 & 0x3F) << 8);
        a4 = v9 + 7;
        uint64_t v7 = (v7 + 4);
        if (!--a7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end