@interface OrgApacheLuceneUtilPackedBulkOperationPacked18
- (OrgApacheLuceneUtilPackedBulkOperationPacked18)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked18

- (OrgApacheLuceneUtilPackedBulkOperationPacked18)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 46;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 28) & 0x3FFFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        uint64_t v17 = (a4 + 1);
        *((_DWORD *)a5 + v15 + 3) = (v11 >> 10) & 0x3FFFF;
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v17);
        }
        int v19 = v7 + 3;
        unint64_t v20 = *((void *)a3 + (int)v17 + 2);
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v19 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((_DWORD *)a5 + v19 + 3) = HIBYTE(v20) | ((v11 & 0x3FF) << 8);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((_DWORD *)a5 + v22 + 3) = (v20 >> 38) & 0x3FFFF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v7 + 6;
        *((_DWORD *)a5 + v24 + 3) = (v20 >> 20) & 0x3FFFF;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v9 + 2;
        *((_DWORD *)a5 + v26 + 3) = (v20 >> 2) & 0x3FFFF;
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 2));
        }
        int v30 = v7 + 7;
        unint64_t v31 = *((void *)a3 + v28 + 2);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v30 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v7 + 8;
        *((_DWORD *)a5 + v30 + 3) = HIWORD(v31) | ((v20 & 3) << 16);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 8));
        }
        int v35 = v7 + 9;
        *((_DWORD *)a5 + v33 + 3) = (v31 >> 30) & 0x3FFFF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 9));
        }
        int v37 = v9 + 3;
        *((_DWORD *)a5 + v35 + 3) = (v31 >> 12) & 0x3FFFF;
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 3));
        }
        int v39 = v7 + 10;
        unint64_t v40 = *((void *)a3 + v37 + 2);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        int v42 = v7 + 11;
        *((_DWORD *)a5 + v39 + 3) = (v40 >> 58) & 0x3F | ((v31 & 0xFFF) << 6);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 11));
        }
        int v44 = v7 + 12;
        *((_DWORD *)a5 + v42 + 3) = (v40 >> 40) & 0x3FFFF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 12));
        }
        int v46 = v7 + 13;
        *((_DWORD *)a5 + v44 + 3) = (v40 >> 22) & 0x3FFFF;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 13));
        }
        int v48 = v9 + 4;
        *((_DWORD *)a5 + v46 + 3) = (v40 >> 4) & 0x3FFFF;
        uint64_t v49 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v9 + 4));
        }
        int v50 = v7 + 14;
        unint64_t v51 = *((void *)a3 + v48 + 2);
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v50 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 14));
        }
        int v53 = v7 + 15;
        *((_DWORD *)a5 + v50 + 3) = (v51 >> 50) & 0x3FFF | ((v40 & 0xF) << 14);
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 15));
        }
        int v55 = v7 + 16;
        *((_DWORD *)a5 + v53 + 3) = HIDWORD(v51) & 0x3FFFF;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 16));
        }
        int v57 = v9 + 5;
        *((_DWORD *)a5 + v55 + 3) = v51 >> 14;
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 5));
        }
        int v59 = v7 + 17;
        unint64_t v60 = *((void *)a3 + v57 + 2);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 17));
        }
        int v62 = v7 + 18;
        *((_DWORD *)a5 + v59 + 3) = (v60 >> 60) & 0xF | (16 * (v51 & 0x3FFF));
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 18));
        }
        int v64 = v7 + 19;
        *((_DWORD *)a5 + v62 + 3) = (v60 >> 42) & 0x3FFFF;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 19));
        }
        int v66 = v7 + 20;
        *((_DWORD *)a5 + v64 + 3) = (v60 >> 24) & 0x3FFFF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 20));
        }
        int v68 = v9 + 6;
        *((_DWORD *)a5 + v66 + 3) = (v60 >> 6) & 0x3FFFF;
        uint64_t v69 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v9 + 6));
        }
        int v70 = v7 + 21;
        unint64_t v71 = *((void *)a3 + v68 + 2);
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v70 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 21));
        }
        int v73 = v7 + 22;
        *((_DWORD *)a5 + v70 + 3) = (v71 >> 52) & 0xFFF | ((v60 & 0x3F) << 12);
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 22));
        }
        int v75 = v7 + 23;
        *((_DWORD *)a5 + v73 + 3) = (v71 >> 34) & 0x3FFFF;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 23));
        }
        int v77 = v9 + 7;
        *((_DWORD *)a5 + v75 + 3) = (v71 >> 16) & 0x3FFFF;
        uint64_t v78 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v9 + 7));
        }
        int v79 = v7 + 24;
        unint64_t v80 = *((void *)a3 + v77 + 2);
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v79 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 24));
        }
        int v82 = v7 + 25;
        *((_DWORD *)a5 + v79 + 3) = (v80 >> 62) & 3 | (4 * (unsigned __int16)v71);
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 25));
        }
        int v84 = v7 + 26;
        *((_DWORD *)a5 + v82 + 3) = (v80 >> 44) & 0x3FFFF;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 26));
        }
        int v86 = v7 + 27;
        *((_DWORD *)a5 + v84 + 3) = (v80 >> 26) & 0x3FFFF;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 27));
        }
        int v88 = v9 + 8;
        *((_DWORD *)a5 + v86 + 3) = (v80 >> 8) & 0x3FFFF;
        uint64_t v89 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v9 + 8));
        }
        int v90 = v7 + 28;
        unint64_t v91 = *((void *)a3 + v88 + 2);
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v90 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 28));
        }
        int v93 = v7 + 29;
        *((_DWORD *)a5 + v90 + 3) = (v91 >> 54) & 0x3FF | (v80 << 10);
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 29));
        }
        int v95 = v7 + 30;
        *((_DWORD *)a5 + v93 + 3) = (v91 >> 36) & 0x3FFFF;
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 30));
        }
        int v97 = v7 + 31;
        *((_DWORD *)a5 + v95 + 3) = (v91 >> 18) & 0x3FFFF;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 31));
        }
        *((_DWORD *)a5 + v97 + 3) = v91 & 0x3FFFF;
        a4 = v9 + 9;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 10) | (4 * v13) | (v14 >> 6);
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 3));
        }
        int v18 = v9 + 4;
        int v19 = *((unsigned __int8 *)a3 + v16 + 12);
        if (v9 + 4 < 0 || v18 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 4));
        }
        int v20 = v7 + 1;
        unsigned int v21 = *((unsigned __int8 *)a3 + v18 + 12);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v20 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 1));
        }
        int v23 = v9 + 5;
        *((_DWORD *)a5 + v20 + 3) = ((v14 & 0x3F) << 12) | (16 * v19) | (v21 >> 4);
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 5));
        }
        int v25 = v9 + 6;
        int v26 = *((unsigned __int8 *)a3 + v23 + 12);
        if (v9 + 6 < 0 || v25 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 6));
        }
        int v27 = v7 + 2;
        unsigned int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 2));
        }
        int v30 = v9 + 7;
        *((_DWORD *)a5 + v27 + 3) = ((v21 & 0xF) << 14) | (v26 << 6) | (v28 >> 2);
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v9 + 7));
        }
        int v32 = v9 + 8;
        int v33 = *((unsigned __int8 *)a3 + v30 + 12);
        if (v9 + 8 < 0 || v32 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v9 + 8));
        }
        int v34 = v7 + 3;
        int v35 = *((unsigned __int8 *)a3 + v32 + 12);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 3));
        }
        *((_DWORD *)a5 + v34 + 3) = ((v28 & 3) << 16) | (v33 << 8) | v35;
        a4 = v9 + 9;
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
        *((void *)a5 + (int)v7 + 2) = v11 >> 46;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((void *)a5 + v13 + 2) = (v11 >> 28) & 0x3FFFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = a4 + 1;
        *((void *)a5 + v15 + 2) = (v11 >> 10) & 0x3FFFF;
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (a4 + 1));
        }
        int v19 = v7 + 3;
        unint64_t v20 = *((void *)a3 + v17 + 2);
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v19 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((void *)a5 + v19 + 2) = HIBYTE(v20) & 0xFFFFFFFFFFFC00FFLL | ((v11 & 0x3FF) << 8);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((void *)a5 + v22 + 2) = (v20 >> 38) & 0x3FFFF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v7 + 6;
        *((void *)a5 + v24 + 2) = (v20 >> 20) & 0x3FFFF;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v9 + 2;
        *((void *)a5 + v26 + 2) = (v20 >> 2) & 0x3FFFF;
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 2));
        }
        int v30 = v7 + 7;
        unint64_t v31 = *((void *)a3 + v28 + 2);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v30 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v7 + 8;
        *((void *)a5 + v30 + 2) = HIWORD(v31) & 0xFFFFFFFFFFFCFFFFLL | ((v20 & 3) << 16);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 8));
        }
        int v35 = v7 + 9;
        *((void *)a5 + v33 + 2) = (v31 >> 30) & 0x3FFFF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 9));
        }
        int v37 = v9 + 3;
        *((void *)a5 + v35 + 2) = (v31 >> 12) & 0x3FFFF;
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 3));
        }
        int v39 = v7 + 10;
        unint64_t v40 = *((void *)a3 + v37 + 2);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        unint64_t v42 = (v40 >> 58) & 0xFFFFFFFFFFFC003FLL | ((v31 & 0xFFF) << 6);
        int v43 = v7 + 11;
        *((void *)a5 + v39 + 2) = v42;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v7 + 12;
        *((void *)a5 + v43 + 2) = (v40 >> 40) & 0x3FFFF;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v7 + 13;
        *((void *)a5 + v45 + 2) = (v40 >> 22) & 0x3FFFF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v9 + 4;
        *((void *)a5 + v47 + 2) = (v40 >> 4) & 0x3FFFF;
        uint64_t v50 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v9 + 4));
        }
        int v51 = v7 + 14;
        unint64_t v52 = *((void *)a3 + v49 + 2);
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v51 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 14));
        }
        int v54 = v7 + 15;
        *((void *)a5 + v51 + 2) = (v52 >> 50) & 0xFFFFFFFFFFFC3FFFLL | ((v40 & 0xF) << 14);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 15));
        }
        int v56 = v7 + 16;
        *((void *)a5 + v54 + 2) = HIDWORD(v52) & 0x3FFFF;
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 16));
        }
        int v58 = v9 + 5;
        *((void *)a5 + v56 + 2) = v52 >> 14;
        uint64_t v59 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v9 + 5));
        }
        int v60 = v7 + 17;
        unint64_t v61 = *((void *)a3 + v58 + 2);
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v60 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 17));
        }
        unint64_t v63 = (v61 >> 60) & 0xFFFFFFFFFFFC000FLL | (16 * (v52 & 0x3FFF));
        int v64 = v7 + 18;
        *((void *)a5 + v60 + 2) = v63;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 18));
        }
        int v66 = v7 + 19;
        *((void *)a5 + v64 + 2) = (v61 >> 42) & 0x3FFFF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 19));
        }
        int v68 = v7 + 20;
        *((void *)a5 + v66 + 2) = (v61 >> 24) & 0x3FFFF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 20));
        }
        int v70 = v9 + 6;
        *((void *)a5 + v68 + 2) = (v61 >> 6) & 0x3FFFF;
        uint64_t v71 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 6));
        }
        int v72 = v7 + 21;
        unint64_t v73 = *((void *)a3 + v70 + 2);
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v72 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 21));
        }
        int v75 = v7 + 22;
        *((void *)a5 + v72 + 2) = (v73 >> 52) & 0xFFFFFFFFFFFC0FFFLL | ((v61 & 0x3F) << 12);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 22));
        }
        int v77 = v7 + 23;
        *((void *)a5 + v75 + 2) = (v73 >> 34) & 0x3FFFF;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 23));
        }
        int v79 = v9 + 7;
        *((void *)a5 + v77 + 2) = (v73 >> 16) & 0x3FFFF;
        uint64_t v80 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v9 + 7));
        }
        int v81 = v7 + 24;
        unint64_t v82 = *((void *)a3 + v79 + 2);
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v81 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 24));
        }
        unint64_t v84 = (v82 >> 62) & 0xFFFFFFFFFFFC0003 | (4 * (unsigned __int16)v73);
        int v85 = v7 + 25;
        *((void *)a5 + v81 + 2) = v84;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 25));
        }
        int v87 = v7 + 26;
        *((void *)a5 + v85 + 2) = (v82 >> 44) & 0x3FFFF;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 26));
        }
        int v89 = v7 + 27;
        *((void *)a5 + v87 + 2) = (v82 >> 26) & 0x3FFFF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 27));
        }
        int v91 = v9 + 8;
        *((void *)a5 + v89 + 2) = (v82 >> 8) & 0x3FFFF;
        uint64_t v92 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v9 + 8));
        }
        int v93 = v7 + 28;
        unint64_t v94 = *((void *)a3 + v91 + 2);
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v93 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 28));
        }
        int v96 = v7 + 29;
        *((void *)a5 + v93 + 2) = (v94 >> 54) & 0xFFFFFFFFFFFC03FFLL | ((unint64_t)v82 << 10);
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 29));
        }
        int v98 = v7 + 30;
        *((void *)a5 + v96 + 2) = (v94 >> 36) & 0x3FFFF;
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 30));
        }
        int v100 = v7 + 31;
        *((void *)a5 + v98 + 2) = (v94 >> 18) & 0x3FFFF;
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 31));
        }
        *((void *)a5 + v100 + 2) = v94 & 0x3FFFF;
        a4 = v9 + 9;
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
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 10) | (4 * v13) | (v14 >> 6);
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 3));
        }
        int v18 = v9 + 4;
        uint64_t v19 = *((unsigned __int8 *)a3 + v16 + 12);
        if (v9 + 4 < 0 || v18 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v9 + 4));
        }
        int v20 = v7 + 1;
        unint64_t v21 = *((unsigned __int8 *)a3 + v18 + 12);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v20 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 1));
        }
        int v23 = v9 + 5;
        *((void *)a5 + v20 + 2) = ((v14 & 0x3F) << 12) | (16 * v19) | (v21 >> 4);
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 5));
        }
        int v25 = v9 + 6;
        uint64_t v26 = *((unsigned __int8 *)a3 + v23 + 12);
        if (v9 + 6 < 0 || v25 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 6));
        }
        int v27 = v7 + 2;
        unint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 2));
        }
        int v30 = v9 + 7;
        *((void *)a5 + v27 + 2) = ((v21 & 0xF) << 14) | (v26 << 6) | (v28 >> 2);
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v9 + 7));
        }
        int v32 = v9 + 8;
        uint64_t v33 = *((unsigned __int8 *)a3 + v30 + 12);
        if (v9 + 8 < 0 || v32 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v9 + 8));
        }
        int v34 = v7 + 3;
        uint64_t v35 = *((unsigned __int8 *)a3 + v32 + 12);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 3));
        }
        *((void *)a5 + v34 + 2) = ((v28 & 3) << 16) | (v33 << 8) | v35;
        a4 = v9 + 9;
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