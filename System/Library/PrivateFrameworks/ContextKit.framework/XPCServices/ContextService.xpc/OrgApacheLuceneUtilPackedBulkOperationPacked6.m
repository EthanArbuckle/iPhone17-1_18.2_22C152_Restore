@interface OrgApacheLuceneUtilPackedBulkOperationPacked6
- (OrgApacheLuceneUtilPackedBulkOperationPacked6)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked6

- (OrgApacheLuceneUtilPackedBulkOperationPacked6)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 58;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 52) & 0x3F;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((_DWORD *)a5 + v15 + 3) = (v11 >> 46) & 0x3F;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        int v19 = v7 + 4;
        *((_DWORD *)a5 + v17 + 3) = (v11 >> 40) & 0x3F;
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 4));
        }
        int v21 = v7 + 5;
        *((_DWORD *)a5 + v19 + 3) = (v11 >> 34) & 0x3F;
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 5));
        }
        int v23 = v7 + 6;
        *((_DWORD *)a5 + v21 + 3) = (v11 >> 28) & 0x3F;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 6));
        }
        int v25 = v7 + 7;
        *((_DWORD *)a5 + v23 + 3) = (v11 >> 22) & 0x3F;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 7));
        }
        int v27 = v7 + 8;
        *((_DWORD *)a5 + v25 + 3) = WORD1(v11) & 0x3F;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 8));
        }
        int v29 = v7 + 9;
        *((_DWORD *)a5 + v27 + 3) = (unsigned __int16)v11 >> 10;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 9));
        }
        uint64_t v31 = (a4 + 1);
        *((_DWORD *)a5 + v29 + 3) = (v11 >> 4) & 0x3F;
        uint64_t v32 = *((unsigned int *)a3 + 2);
        if ((v31 & 0x80000000) != 0 || (int)v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, v31);
        }
        int v33 = v7 + 10;
        unint64_t v34 = *((void *)a3 + (int)v31 + 2);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v33 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 10));
        }
        int v36 = v7 + 11;
        *((_DWORD *)a5 + v33 + 3) = (v34 >> 62) & 0xC3 | (4 * (v11 & 0xF));
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 11));
        }
        int v38 = v7 + 12;
        *((_DWORD *)a5 + v36 + 3) = HIBYTE(v34) & 0x3F;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 12));
        }
        int v40 = v7 + 13;
        *((_DWORD *)a5 + v38 + 3) = (v34 >> 50) & 0x3F;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 13));
        }
        int v42 = v7 + 14;
        *((_DWORD *)a5 + v40 + 3) = (v34 >> 44) & 0x3F;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 14));
        }
        int v44 = v7 + 15;
        *((_DWORD *)a5 + v42 + 3) = (v34 >> 38) & 0x3F;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 15));
        }
        int v46 = v7 + 16;
        *((_DWORD *)a5 + v44 + 3) = BYTE4(v34) & 0x3F;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 16));
        }
        int v48 = v7 + 17;
        *((_DWORD *)a5 + v46 + 3) = v34 >> 26;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 17));
        }
        int v50 = v7 + 18;
        *((_DWORD *)a5 + v48 + 3) = (v34 >> 20) & 0x3F;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 18));
        }
        int v52 = v7 + 19;
        *((_DWORD *)a5 + v50 + 3) = (v34 >> 14) & 0x3F;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 19));
        }
        int v54 = v7 + 20;
        *((_DWORD *)a5 + v52 + 3) = (v34 >> 8) & 0x3F;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 20));
        }
        int v56 = v9 + 2;
        *((_DWORD *)a5 + v54 + 3) = v34 >> 2;
        uint64_t v57 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v9 + 2));
        }
        int v58 = v7 + 21;
        unint64_t v59 = *((void *)a3 + v56 + 2);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v58 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 21));
        }
        int v61 = v7 + 22;
        *((_DWORD *)a5 + v58 + 3) = (v59 >> 60) & 0xCF | (16 * (v34 & 3));
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 22));
        }
        int v63 = v7 + 23;
        *((_DWORD *)a5 + v61 + 3) = (v59 >> 54) & 0x3F;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 23));
        }
        int v65 = v7 + 24;
        *((_DWORD *)a5 + v63 + 3) = HIWORD(v59) & 0x3F;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 24));
        }
        int v67 = v7 + 25;
        *((_DWORD *)a5 + v65 + 3) = (v59 >> 42) & 0x3F;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 25));
        }
        int v69 = v7 + 26;
        *((_DWORD *)a5 + v67 + 3) = (v59 >> 36) & 0x3F;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 26));
        }
        int v71 = v7 + 27;
        *((_DWORD *)a5 + v69 + 3) = (v59 >> 30) & 0x3F;
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 27));
        }
        int v73 = v7 + 28;
        *((_DWORD *)a5 + v71 + 3) = BYTE3(v59) & 0x3F;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 28));
        }
        int v75 = v7 + 29;
        *((_DWORD *)a5 + v73 + 3) = (v59 >> 18) & 0x3F;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 29));
        }
        int v77 = v7 + 30;
        *((_DWORD *)a5 + v75 + 3) = (v59 >> 12) & 0x3F;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 30));
        }
        int v79 = v7 + 31;
        *((_DWORD *)a5 + v77 + 3) = (v59 >> 6) & 0x3F;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 31));
        }
        *((_DWORD *)a5 + v79 + 3) = v59 & 0x3F;
        a4 = v9 + 3;
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
        int v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        unsigned int v12 = *((unsigned __int8 *)a3 + a4 + 12);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v8);
        }
        uint64_t v14 = (a4 + 1);
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 2;
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v14);
        }
        int v16 = v8 + 1;
        unsigned int v17 = *((unsigned __int8 *)a3 + (int)v14 + 12);
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v8 + 1));
        }
        int v19 = v10 + 2;
        *((_DWORD *)a5 + v16 + 3) = (v17 >> 4) & 0xFFFFFFCF | (16 * (v12 & 3));
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v10 + 2));
        }
        int v21 = v8 + 2;
        unsigned int v22 = *((unsigned __int8 *)a3 + v19 + 12);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v8 + 2));
        }
        int v24 = v8 + 3;
        *((_DWORD *)a5 + v21 + 3) = (v22 >> 6) & 0xFFFFFFC3 | (4 * (v17 & 0xF));
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v8 + 3));
        }
        *((_DWORD *)a5 + v24 + 3) = v22 & 0x3F;
        a4 = v10 + 3;
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
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        int v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v12 = *((void *)a3 + a4 + 2);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v8);
        }
        int v14 = v8 + 1;
        *((void *)a5 + (int)v8 + 2) = v12 >> 58;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        int v16 = v8 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 52) & 0x3F;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v8 + 2));
        }
        int v18 = v8 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 46) & 0x3F;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 3));
        }
        int v20 = v8 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 40) & 0x3F;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v8 + 4));
        }
        int v22 = v8 + 5;
        *((void *)a5 + v20 + 2) = (v12 >> 34) & 0x3F;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v8 + 5));
        }
        int v24 = v8 + 6;
        *((void *)a5 + v22 + 2) = (v12 >> 28) & 0x3F;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v8 + 6));
        }
        int v26 = v8 + 7;
        *((void *)a5 + v24 + 2) = (v12 >> 22) & 0x3F;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v8 + 7));
        }
        int v28 = v8 + 8;
        *((void *)a5 + v26 + 2) = (v12 >> 16) & 0x3F;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 8));
        }
        int v30 = v8 + 9;
        *((void *)a5 + v28 + 2) = (unsigned __int16)v12 >> 10;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 9 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 9));
        }
        int v32 = a4 + 1;
        *((void *)a5 + v30 + 2) = (v12 >> 4) & 0x3F;
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (a4 + 1));
        }
        int v34 = v8 + 10;
        unint64_t v35 = *((void *)a3 + v32 + 2);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v8 + 10 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v8 + 10));
        }
        int v37 = v8 + 11;
        *((void *)a5 + v34 + 2) = (v35 >> 62) & 0xFFFFFFFFFFFFFFC3 | (4 * (v12 & 0xF));
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v8 + 11 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v8 + 11));
        }
        int v39 = v8 + 12;
        *((void *)a5 + v37 + 2) = HIBYTE(v35) & 0x3F;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v8 + 12 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v8 + 12));
        }
        int v41 = v8 + 13;
        *((void *)a5 + v39 + 2) = (v35 >> 50) & 0x3F;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v8 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v8 + 13));
        }
        int v43 = v8 + 14;
        *((void *)a5 + v41 + 2) = (v35 >> 44) & 0x3F;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v8 + 14 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v8 + 14));
        }
        int v45 = v8 + 15;
        *((void *)a5 + v43 + 2) = (v35 >> 38) & 0x3F;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v8 + 15 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v8 + 15));
        }
        int v47 = v8 + 16;
        *((void *)a5 + v45 + 2) = HIDWORD(v35) & 0x3F;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v8 + 16 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v8 + 16));
        }
        int v49 = v8 + 17;
        *((void *)a5 + v47 + 2) = v35 >> 26;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v8 + 17 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v8 + 17));
        }
        int v51 = v8 + 18;
        *((void *)a5 + v49 + 2) = (v35 >> 20) & 0x3F;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v8 + 18 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v8 + 18));
        }
        int v53 = v8 + 19;
        *((void *)a5 + v51 + 2) = (v35 >> 14) & 0x3F;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v8 + 19 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v8 + 19));
        }
        int v55 = v8 + 20;
        *((void *)a5 + v53 + 2) = (v35 >> 8) & 0x3F;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v8 + 20 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v8 + 20));
        }
        int v57 = v10 + 2;
        *((void *)a5 + v55 + 2) = v35 >> 2;
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v10 + 2));
        }
        int v59 = v8 + 21;
        unint64_t v60 = *((void *)a3 + v57 + 2);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v8 + 21 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v8 + 21));
        }
        int v62 = v8 + 22;
        *((void *)a5 + v59 + 2) = (v60 >> 60) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v35 & 3));
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v8 + 22 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v8 + 22));
        }
        int v64 = v8 + 23;
        *((void *)a5 + v62 + 2) = (v60 >> 54) & 0x3F;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v8 + 23 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v8 + 23));
        }
        int v66 = v8 + 24;
        *((void *)a5 + v64 + 2) = HIWORD(v60) & 0x3F;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v8 + 24 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v8 + 24));
        }
        int v68 = v8 + 25;
        *((void *)a5 + v66 + 2) = (v60 >> 42) & 0x3F;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v8 + 25 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v8 + 25));
        }
        int v70 = v8 + 26;
        *((void *)a5 + v68 + 2) = (v60 >> 36) & 0x3F;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v8 + 26 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v8 + 26));
        }
        int v72 = v8 + 27;
        *((void *)a5 + v70 + 2) = (v60 >> 30) & 0x3F;
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v8 + 27 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v8 + 27));
        }
        int v74 = v8 + 28;
        *((void *)a5 + v72 + 2) = (v60 >> 24) & 0x3F;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v8 + 28 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v8 + 28));
        }
        int v76 = v8 + 29;
        *((void *)a5 + v74 + 2) = (v60 >> 18) & 0x3F;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v8 + 29 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v8 + 29));
        }
        int v78 = v8 + 30;
        *((void *)a5 + v76 + 2) = (v60 >> 12) & 0x3F;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v8 + 30 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v8 + 30));
        }
        int v80 = v8 + 31;
        *((void *)a5 + v78 + 2) = (v60 >> 6) & 0x3F;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v8 + 31 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v8 + 31));
        }
        *((void *)a5 + v80 + 2) = v60 & 0x3F;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 32);
        if (!--v7) {
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
        int v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v12 = *((unsigned __int8 *)a3 + a4 + 12);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v8);
        }
        uint64_t v14 = (a4 + 1);
        *((void *)a5 + (int)v8 + 2) = v12 >> 2;
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if ((v14 & 0x80000000) != 0 || (int)v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v14);
        }
        int v16 = v8 + 1;
        unint64_t v17 = *((unsigned __int8 *)a3 + (int)v14 + 12);
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v8 + 1));
        }
        int v19 = v10 + 2;
        *((void *)a5 + v16 + 2) = (v17 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v12 & 3));
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v10 + 2));
        }
        int v21 = v8 + 2;
        unint64_t v22 = *((unsigned __int8 *)a3 + v19 + 12);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v8 + 2));
        }
        int v24 = v8 + 3;
        *((void *)a5 + v21 + 2) = (v22 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v17 & 0xF));
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v8 + 3));
        }
        *((void *)a5 + v24 + 2) = v22 & 0x3F;
        a4 = v10 + 3;
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