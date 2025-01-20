@interface OrgApacheLuceneUtilPackedBulkOperationPacked22
- (OrgApacheLuceneUtilPackedBulkOperationPacked22)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked22

- (OrgApacheLuceneUtilPackedBulkOperationPacked22)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 42;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        uint64_t v15 = (a4 + 1);
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 20) & 0x3FFFFF;
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v15);
        }
        int v17 = v7 + 2;
        unint64_t v18 = *((void *)a3 + (int)v15 + 2);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 2));
        }
        int v20 = v7 + 3;
        *((_DWORD *)a5 + v17 + 3) = (v18 >> 62) & 3 | (4 * (v11 & 0xFFFFF));
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((_DWORD *)a5 + v20 + 3) = (v18 >> 40) & 0x3FFFFF;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v9 + 2;
        *((_DWORD *)a5 + v22 + 3) = (v18 >> 18) & 0x3FFFFF;
        uint64_t v25 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v9 + 2));
        }
        int v26 = v7 + 5;
        unint64_t v27 = *((void *)a3 + v24 + 2);
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v26 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 5));
        }
        int v29 = v7 + 6;
        *((_DWORD *)a5 + v26 + 3) = (v27 >> 60) & 0xF | (16 * (v18 & 0x3FFFF));
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 6));
        }
        int v31 = v7 + 7;
        *((_DWORD *)a5 + v29 + 3) = (v27 >> 38) & 0x3FFFFF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v9 + 3;
        *((_DWORD *)a5 + v31 + 3) = (v27 >> 16) & 0x3FFFFF;
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 3));
        }
        int v35 = v7 + 8;
        unint64_t v36 = *((void *)a3 + v33 + 2);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v35 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 8));
        }
        int v38 = v7 + 9;
        *((_DWORD *)a5 + v35 + 3) = (v36 >> 58) & 0x3F | ((unsigned __int16)v27 << 6);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 9));
        }
        int v40 = v7 + 10;
        *((_DWORD *)a5 + v38 + 3) = (v36 >> 36) & 0x3FFFFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        int v42 = v9 + 4;
        *((_DWORD *)a5 + v40 + 3) = (v36 >> 14) & 0x3FFFFF;
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 4));
        }
        int v44 = v7 + 11;
        unint64_t v45 = *((void *)a3 + v42 + 2);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v44 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 11));
        }
        int v47 = v7 + 12;
        *((_DWORD *)a5 + v44 + 3) = HIBYTE(v45) | ((v36 & 0x3FFF) << 8);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 12));
        }
        int v49 = v7 + 13;
        *((_DWORD *)a5 + v47 + 3) = (v45 >> 34) & 0x3FFFFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 13));
        }
        int v51 = v9 + 5;
        *((_DWORD *)a5 + v49 + 3) = (v45 >> 12) & 0x3FFFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 5));
        }
        int v53 = v7 + 14;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 14));
        }
        int v56 = v7 + 15;
        *((_DWORD *)a5 + v53 + 3) = (v54 >> 54) & 0x3FF | ((v45 & 0xFFF) << 10);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 15));
        }
        int v58 = v7 + 16;
        *((_DWORD *)a5 + v56 + 3) = HIDWORD(v54) & 0x3FFFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 16));
        }
        int v60 = v9 + 6;
        *((_DWORD *)a5 + v58 + 3) = v54 >> 10;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v9 + 6));
        }
        int v62 = v7 + 17;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 17));
        }
        int v65 = v7 + 18;
        *((_DWORD *)a5 + v62 + 3) = (v63 >> 52) & 0xFFF | ((v54 & 0x3FF) << 12);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 18));
        }
        int v67 = v7 + 19;
        *((_DWORD *)a5 + v65 + 3) = (v63 >> 30) & 0x3FFFFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 19));
        }
        int v69 = v9 + 7;
        *((_DWORD *)a5 + v67 + 3) = (v63 >> 8) & 0x3FFFFF;
        uint64_t v70 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v9 + 7));
        }
        int v71 = v7 + 20;
        unint64_t v72 = *((void *)a3 + v69 + 2);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v71 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 20));
        }
        int v74 = v7 + 21;
        *((_DWORD *)a5 + v71 + 3) = (v72 >> 50) & 0x3FFF | (v63 << 14);
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 21));
        }
        int v76 = v7 + 22;
        *((_DWORD *)a5 + v74 + 3) = (v72 >> 28) & 0x3FFFFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 22));
        }
        int v78 = v9 + 8;
        *((_DWORD *)a5 + v76 + 3) = (v72 >> 6) & 0x3FFFFF;
        uint64_t v79 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v9 + 8));
        }
        int v80 = v7 + 23;
        unint64_t v81 = *((void *)a3 + v78 + 2);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v80 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 23));
        }
        int v83 = v7 + 24;
        *((_DWORD *)a5 + v80 + 3) = HIWORD(v81) | ((v72 & 0x3F) << 16);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 24));
        }
        int v85 = v7 + 25;
        *((_DWORD *)a5 + v83 + 3) = (v81 >> 26) & 0x3FFFFF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 25));
        }
        int v87 = v9 + 9;
        *((_DWORD *)a5 + v85 + 3) = (v81 >> 4) & 0x3FFFFF;
        uint64_t v88 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v9 + 9));
        }
        int v89 = v7 + 26;
        unint64_t v90 = *((void *)a3 + v87 + 2);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v89 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 26));
        }
        int v92 = v7 + 27;
        *((_DWORD *)a5 + v89 + 3) = (v90 >> 46) & 0xFFC3FFFF | ((v81 & 0xF) << 18);
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 27));
        }
        int v94 = v7 + 28;
        *((_DWORD *)a5 + v92 + 3) = (v90 >> 24) & 0x3FFFFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 28));
        }
        int v96 = v9 + 10;
        *((_DWORD *)a5 + v94 + 3) = (v90 >> 2) & 0x3FFFFF;
        uint64_t v97 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v9 + 10));
        }
        int v98 = v7 + 29;
        unint64_t v99 = *((void *)a3 + v96 + 2);
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v98 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 29));
        }
        int v101 = v7 + 30;
        *((_DWORD *)a5 + v98 + 3) = (v99 >> 44) & 0xFFCFFFFF | ((v90 & 3) << 20);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 30));
        }
        int v103 = v7 + 31;
        *((_DWORD *)a5 + v101 + 3) = (v99 >> 22) & 0x3FFFFF;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 31));
        }
        *((_DWORD *)a5 + v103 + 3) = v99 & 0x3FFFFF;
        a4 = v9 + 11;
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
        int v12 = v9 + 2;
        int v13 = *((unsigned __int8 *)a3 + (int)v11 + 12);
        if (v9 + 2 < 0 || v12 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, (v9 + 2));
        }
        if (!a5) {
          break;
        }
        unsigned int v14 = *((unsigned __int8 *)a3 + v12 + 12);
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v7);
        }
        int v16 = v9 + 3;
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 14) | (v13 << 6) | (v14 >> 2);
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 3));
        }
        int v18 = v9 + 4;
        int v19 = *((unsigned __int8 *)a3 + v16 + 12);
        if (v9 + 4 < 0 || v18 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 4));
        }
        int v20 = v9 + 5;
        int v21 = *((unsigned __int8 *)a3 + v18 + 12);
        if (v9 + 5 < 0 || v20 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 5));
        }
        int v22 = v7 + 1;
        unsigned int v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 1));
        }
        int v25 = v9 + 6;
        *((_DWORD *)a5 + v22 + 3) = ((v14 & 3) << 20) | (v19 << 12) | (16 * v21) | (v23 >> 4);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 6));
        }
        int v27 = v9 + 7;
        int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 7));
        }
        int v29 = v9 + 8;
        int v30 = *((unsigned __int8 *)a3 + v27 + 12);
        if (v9 + 8 < 0 || v29 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 8));
        }
        int v31 = v7 + 2;
        unsigned int v32 = *((unsigned __int8 *)a3 + v29 + 12);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 2));
        }
        int v34 = v9 + 9;
        *((_DWORD *)a5 + v31 + 3) = ((v23 & 0xF) << 18) | (v28 << 10) | (4 * v30) | (v32 >> 6);
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 9));
        }
        int v36 = v9 + 10;
        int v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 10));
        }
        int v38 = v7 + 3;
        int v39 = *((unsigned __int8 *)a3 + v36 + 12);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 3));
        }
        *((_DWORD *)a5 + v38 + 3) = ((v32 & 0x3F) << 16) | (v37 << 8) | v39;
        a4 = v9 + 11;
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
        *((void *)a5 + (int)v7 + 2) = v11 >> 42;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = a4 + 1;
        *((void *)a5 + v13 + 2) = (v11 >> 20) & 0x3FFFFF;
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + 1));
        }
        int v17 = v7 + 2;
        unint64_t v18 = *((void *)a3 + v15 + 2);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 2));
        }
        int v20 = v7 + 3;
        *((void *)a5 + v17 + 2) = (v18 >> 62) & 0xFFFFFFFFFFC00003 | (4 * (v11 & 0xFFFFF));
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((void *)a5 + v20 + 2) = (v18 >> 40) & 0x3FFFFF;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v9 + 2;
        *((void *)a5 + v22 + 2) = (v18 >> 18) & 0x3FFFFF;
        uint64_t v25 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v9 + 2));
        }
        int v26 = v7 + 5;
        unint64_t v27 = *((void *)a3 + v24 + 2);
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v26 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 5));
        }
        int v29 = v7 + 6;
        *((void *)a5 + v26 + 2) = (v27 >> 60) & 0xFFFFFFFFFFC0000FLL | (16 * (v18 & 0x3FFFF));
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 6));
        }
        int v31 = v7 + 7;
        *((void *)a5 + v29 + 2) = (v27 >> 38) & 0x3FFFFF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v9 + 3;
        *((void *)a5 + v31 + 2) = (v27 >> 16) & 0x3FFFFF;
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 3));
        }
        int v35 = v7 + 8;
        unint64_t v36 = *((void *)a3 + v33 + 2);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v35 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 8));
        }
        int v38 = v7 + 9;
        *((void *)a5 + v35 + 2) = (v36 >> 58) & 0xFFFFFFFFFFC0003FLL | ((unint64_t)(unsigned __int16)v27 << 6);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 9));
        }
        int v40 = v7 + 10;
        *((void *)a5 + v38 + 2) = (v36 >> 36) & 0x3FFFFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        int v42 = v9 + 4;
        *((void *)a5 + v40 + 2) = (v36 >> 14) & 0x3FFFFF;
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 4));
        }
        int v44 = v7 + 11;
        unint64_t v45 = *((void *)a3 + v42 + 2);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v44 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 11));
        }
        int v47 = v7 + 12;
        *((void *)a5 + v44 + 2) = HIBYTE(v45) & 0xFFFFFFFFFFC000FFLL | ((v36 & 0x3FFF) << 8);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 12));
        }
        int v49 = v7 + 13;
        *((void *)a5 + v47 + 2) = (v45 >> 34) & 0x3FFFFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 13));
        }
        int v51 = v9 + 5;
        *((void *)a5 + v49 + 2) = (v45 >> 12) & 0x3FFFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 5));
        }
        int v53 = v7 + 14;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 14));
        }
        int v56 = v7 + 15;
        *((void *)a5 + v53 + 2) = (v54 >> 54) & 0xFFFFFFFFFFC003FFLL | ((v45 & 0xFFF) << 10);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 15));
        }
        int v58 = v7 + 16;
        *((void *)a5 + v56 + 2) = HIDWORD(v54) & 0x3FFFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 16));
        }
        int v60 = v9 + 6;
        *((void *)a5 + v58 + 2) = v54 >> 10;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v9 + 6));
        }
        int v62 = v7 + 17;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 17));
        }
        int v65 = v7 + 18;
        *((void *)a5 + v62 + 2) = (v63 >> 52) & 0xFFFFFFFFFFC00FFFLL | ((v54 & 0x3FF) << 12);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 18));
        }
        int v67 = v7 + 19;
        *((void *)a5 + v65 + 2) = (v63 >> 30) & 0x3FFFFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 19));
        }
        int v69 = v9 + 7;
        *((void *)a5 + v67 + 2) = (v63 >> 8) & 0x3FFFFF;
        uint64_t v70 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v9 + 7));
        }
        int v71 = v7 + 20;
        unint64_t v72 = *((void *)a3 + v69 + 2);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v71 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 20));
        }
        int v74 = v7 + 21;
        *((void *)a5 + v71 + 2) = (v72 >> 50) & 0xFFFFFFFFFFC03FFFLL | ((unint64_t)v63 << 14);
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 21));
        }
        int v76 = v7 + 22;
        *((void *)a5 + v74 + 2) = (v72 >> 28) & 0x3FFFFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 22));
        }
        int v78 = v9 + 8;
        *((void *)a5 + v76 + 2) = (v72 >> 6) & 0x3FFFFF;
        uint64_t v79 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v9 + 8));
        }
        int v80 = v7 + 23;
        unint64_t v81 = *((void *)a3 + v78 + 2);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v80 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 23));
        }
        int v83 = v7 + 24;
        *((void *)a5 + v80 + 2) = HIWORD(v81) & 0xFFFFFFFFFFC0FFFFLL | ((v72 & 0x3F) << 16);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 24));
        }
        int v85 = v7 + 25;
        *((void *)a5 + v83 + 2) = (v81 >> 26) & 0x3FFFFF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 25));
        }
        int v87 = v9 + 9;
        *((void *)a5 + v85 + 2) = (v81 >> 4) & 0x3FFFFF;
        uint64_t v88 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v9 + 9));
        }
        int v89 = v7 + 26;
        unint64_t v90 = *((void *)a3 + v87 + 2);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v89 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 26));
        }
        int v92 = v7 + 27;
        *((void *)a5 + v89 + 2) = (v90 >> 46) & 0xFFFFFFFFFFC3FFFFLL | ((v81 & 0xF) << 18);
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 27));
        }
        int v94 = v7 + 28;
        *((void *)a5 + v92 + 2) = (v90 >> 24) & 0x3FFFFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 28));
        }
        int v96 = v9 + 10;
        *((void *)a5 + v94 + 2) = (v90 >> 2) & 0x3FFFFF;
        uint64_t v97 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v9 + 10));
        }
        int v98 = v7 + 29;
        unint64_t v99 = *((void *)a3 + v96 + 2);
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v98 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 29));
        }
        int v101 = v7 + 30;
        *((void *)a5 + v98 + 2) = (v99 >> 44) & 0xFFFFFFFFFFCFFFFFLL | ((v90 & 3) << 20);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 30));
        }
        int v103 = v7 + 31;
        *((void *)a5 + v101 + 2) = (v99 >> 22) & 0x3FFFFF;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 31));
        }
        *((void *)a5 + v103 + 2) = v99 & 0x3FFFFF;
        a4 = v9 + 11;
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
        int v12 = v9 + 2;
        uint64_t v13 = *((unsigned __int8 *)a3 + (int)v11 + 12);
        if (v9 + 2 < 0 || v12 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, (v9 + 2));
        }
        if (!a5) {
          break;
        }
        unint64_t v14 = *((unsigned __int8 *)a3 + v12 + 12);
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v7);
        }
        int v16 = v9 + 3;
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 14) | (v13 << 6) | (v14 >> 2);
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 3));
        }
        int v18 = v9 + 4;
        uint64_t v19 = *((unsigned __int8 *)a3 + v16 + 12);
        if (v9 + 4 < 0 || v18 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 4));
        }
        int v20 = v9 + 5;
        uint64_t v21 = *((unsigned __int8 *)a3 + v18 + 12);
        if (v9 + 5 < 0 || v20 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 5));
        }
        int v22 = v7 + 1;
        unint64_t v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 1));
        }
        int v25 = v9 + 6;
        *((void *)a5 + v22 + 2) = ((v14 & 3) << 20) | (v19 << 12) | (16 * v21) | (v23 >> 4);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 6));
        }
        int v27 = v9 + 7;
        uint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 7));
        }
        int v29 = v9 + 8;
        uint64_t v30 = *((unsigned __int8 *)a3 + v27 + 12);
        if (v9 + 8 < 0 || v29 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 8));
        }
        int v31 = v7 + 2;
        unint64_t v32 = *((unsigned __int8 *)a3 + v29 + 12);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 2));
        }
        int v34 = v9 + 9;
        *((void *)a5 + v31 + 2) = ((v23 & 0xF) << 18) | (v28 << 10) | (4 * v30) | (v32 >> 6);
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 9));
        }
        int v36 = v9 + 10;
        uint64_t v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 10));
        }
        int v38 = v7 + 3;
        uint64_t v39 = *((unsigned __int8 *)a3 + v36 + 12);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 3));
        }
        *((void *)a5 + v38 + 2) = ((v32 & 0x3F) << 16) | (v37 << 8) | v39;
        a4 = v9 + 11;
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