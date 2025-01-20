@interface OrgApacheLuceneUtilPackedBulkOperationPacked11
- (OrgApacheLuceneUtilPackedBulkOperationPacked11)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked11

- (OrgApacheLuceneUtilPackedBulkOperationPacked11)init
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
      int v9 = 0;
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
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v7);
        }
        int v14 = v7 + 1;
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 53;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 42) & 0x7FF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 31) & 0x7FF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 20) & 0x7FF;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        uint64_t v22 = (a4 + 1);
        *((_DWORD *)a5 + v20 + 3) = (v12 >> 9) & 0x7FF;
        uint64_t v23 = *((unsigned int *)a3 + 2);
        if ((v22 & 0x80000000) != 0 || (int)v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, v22);
        }
        int v24 = v7 + 5;
        unint64_t v25 = *((void *)a3 + (int)v22 + 2);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((_DWORD *)a5 + v24 + 3) = (v25 >> 62) & 3 | (4 * (v12 & 0x1FF));
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((_DWORD *)a5 + v27 + 3) = (v25 >> 51) & 0x7FF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((_DWORD *)a5 + v29 + 3) = (v25 >> 40) & 0x7FF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v7 + 9;
        *((_DWORD *)a5 + v31 + 3) = (v25 >> 29) & 0x7FF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((_DWORD *)a5 + v33 + 3) = (v25 >> 18) & 0x7FF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v10 + 2;
        *((_DWORD *)a5 + v35 + 3) = (v25 >> 7) & 0x7FF;
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v10 + 2));
        }
        int v39 = v7 + 11;
        unint64_t v40 = *((void *)a3 + v37 + 2);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v7 + 12;
        *((_DWORD *)a5 + v39 + 3) = (v40 >> 60) & 0xF | (16 * (v25 & 0x7F));
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 12));
        }
        int v44 = v7 + 13;
        *((_DWORD *)a5 + v42 + 3) = (v40 >> 49) & 0x7FF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 13));
        }
        int v46 = v7 + 14;
        *((_DWORD *)a5 + v44 + 3) = (v40 >> 38) & 0x7FF;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 14));
        }
        int v48 = v7 + 15;
        *((_DWORD *)a5 + v46 + 3) = (v40 >> 27) & 0x7FF;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 15));
        }
        int v50 = v7 + 16;
        *((_DWORD *)a5 + v48 + 3) = WORD1(v40) & 0x7FF;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 16));
        }
        int v52 = v10 + 3;
        *((_DWORD *)a5 + v50 + 3) = (unsigned __int16)v40 >> 5;
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v10 + 3));
        }
        int v54 = v7 + 17;
        unint64_t v55 = *((void *)a3 + v52 + 2);
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v54 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 17));
        }
        int v57 = v7 + 18;
        *((_DWORD *)a5 + v54 + 3) = (v55 >> 58) & 0x3F | ((v40 & 0x1F) << 6);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 18));
        }
        int v59 = v7 + 19;
        *((_DWORD *)a5 + v57 + 3) = (v55 >> 47) & 0x7FF;
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 19));
        }
        int v61 = v7 + 20;
        *((_DWORD *)a5 + v59 + 3) = (v55 >> 36) & 0x7FF;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 20));
        }
        int v63 = v7 + 21;
        *((_DWORD *)a5 + v61 + 3) = (v55 >> 25) & 0x7FF;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 21));
        }
        int v65 = v7 + 22;
        *((_DWORD *)a5 + v63 + 3) = (v55 >> 14) & 0x7FF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 22));
        }
        int v67 = v10 + 4;
        *((_DWORD *)a5 + v65 + 3) = (v55 >> 3) & 0x7FF;
        uint64_t v68 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v10 + 4));
        }
        int v69 = v7 + 23;
        unint64_t v70 = *((void *)a3 + v67 + 2);
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v69 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 23));
        }
        int v72 = v7 + 24;
        *((_DWORD *)a5 + v69 + 3) = HIBYTE(v70) | ((v55 & 7) << 8);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 24));
        }
        int v74 = v7 + 25;
        *((_DWORD *)a5 + v72 + 3) = (v70 >> 45) & 0x7FF;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 25));
        }
        int v76 = v7 + 26;
        *((_DWORD *)a5 + v74 + 3) = (v70 >> 34) & 0x7FF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 26));
        }
        int v78 = v7 + 27;
        *((_DWORD *)a5 + v76 + 3) = (v70 >> 23) & 0x7FF;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 27));
        }
        int v80 = v7 + 28;
        *((_DWORD *)a5 + v78 + 3) = (v70 >> 12) & 0x7FF;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 28));
        }
        int v82 = v10 + 5;
        *((_DWORD *)a5 + v80 + 3) = (v70 >> 1) & 0x7FF;
        uint64_t v83 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v10 + 5));
        }
        int v84 = v7 + 29;
        unint64_t v85 = *((void *)a3 + v82 + 2);
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v84 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 29));
        }
        int v87 = v7 + 30;
        *((_DWORD *)a5 + v84 + 3) = (v85 >> 54) & 0xFBFF | ((v70 & 1) << 10);
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 30));
        }
        int v89 = v7 + 31;
        *((_DWORD *)a5 + v87 + 3) = (v85 >> 43) & 0x7FF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 31));
        }
        int v91 = v7 + 32;
        *((_DWORD *)a5 + v89 + 3) = WORD2(v85) & 0x7FF;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 32));
        }
        int v93 = v7 + 33;
        *((_DWORD *)a5 + v91 + 3) = v85 >> 21;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 33));
        }
        int v95 = v10 + 6;
        *((_DWORD *)a5 + v93 + 3) = (v85 >> 10) & 0x7FF;
        uint64_t v96 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v10 + 6));
        }
        int v97 = v7 + 34;
        unint64_t v98 = *((void *)a3 + v95 + 2);
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v97 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 34));
        }
        int v100 = v7 + 35;
        *((_DWORD *)a5 + v97 + 3) = (v98 >> 63) | (2 * (v85 & 0x3FF));
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 35));
        }
        int v102 = v7 + 36;
        *((_DWORD *)a5 + v100 + 3) = (v98 >> 52) & 0x7FF;
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 36));
        }
        int v104 = v7 + 37;
        *((_DWORD *)a5 + v102 + 3) = (v98 >> 41) & 0x7FF;
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 37));
        }
        int v106 = v7 + 38;
        *((_DWORD *)a5 + v104 + 3) = (v98 >> 30) & 0x7FF;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 38));
        }
        int v108 = v7 + 39;
        *((_DWORD *)a5 + v106 + 3) = (v98 >> 19) & 0x7FF;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 39));
        }
        int v110 = v10 + 7;
        *((_DWORD *)a5 + v108 + 3) = (v98 >> 8) & 0x7FF;
        uint64_t v111 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v10 + 7));
        }
        int v112 = v7 + 40;
        unint64_t v113 = *((void *)a3 + v110 + 2);
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v112 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 40));
        }
        int v115 = v7 + 41;
        *((_DWORD *)a5 + v112 + 3) = (v113 >> 61) & 7 | (8 * v98);
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 41));
        }
        int v117 = v7 + 42;
        *((_DWORD *)a5 + v115 + 3) = (v113 >> 50) & 0x7FF;
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 42));
        }
        int v119 = v7 + 43;
        *((_DWORD *)a5 + v117 + 3) = (v113 >> 39) & 0x7FF;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 43));
        }
        int v121 = v7 + 44;
        *((_DWORD *)a5 + v119 + 3) = (v113 >> 28) & 0x7FF;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 44));
        }
        int v123 = v7 + 45;
        *((_DWORD *)a5 + v121 + 3) = (v113 >> 17) & 0x7FF;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 45));
        }
        int v125 = v10 + 8;
        *((_DWORD *)a5 + v123 + 3) = (v113 >> 6) & 0x7FF;
        uint64_t v126 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v10 + 8));
        }
        int v127 = v7 + 46;
        unint64_t v128 = *((void *)a3 + v125 + 2);
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v127 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 46));
        }
        int v130 = v7 + 47;
        *((_DWORD *)a5 + v127 + 3) = (v128 >> 59) & 0x1F | (32 * (v113 & 0x3F));
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 47));
        }
        int v132 = v7 + 48;
        *((_DWORD *)a5 + v130 + 3) = HIWORD(v128) & 0x7FF;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 48));
        }
        int v134 = v7 + 49;
        *((_DWORD *)a5 + v132 + 3) = (v128 >> 37) & 0x7FF;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 49));
        }
        int v136 = v7 + 50;
        *((_DWORD *)a5 + v134 + 3) = (v128 >> 26) & 0x7FF;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 50));
        }
        int v138 = v7 + 51;
        *((_DWORD *)a5 + v136 + 3) = (v128 >> 15) & 0x7FF;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 51));
        }
        int v140 = v10 + 9;
        *((_DWORD *)a5 + v138 + 3) = (v128 >> 4) & 0x7FF;
        uint64_t v141 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v10 + 9));
        }
        int v142 = v7 + 52;
        unint64_t v143 = *((void *)a3 + v140 + 2);
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v142 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 52));
        }
        int v145 = v7 + 53;
        *((_DWORD *)a5 + v142 + 3) = (v143 >> 57) & 0x7F | ((v128 & 0xF) << 7);
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 53));
        }
        int v147 = v7 + 54;
        *((_DWORD *)a5 + v145 + 3) = (v143 >> 46) & 0x7FF;
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 54));
        }
        int v149 = v7 + 55;
        *((_DWORD *)a5 + v147 + 3) = (v143 >> 35) & 0x7FF;
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 55));
        }
        int v151 = v7 + 56;
        *((_DWORD *)a5 + v149 + 3) = (v143 >> 24) & 0x7FF;
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v151 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 56));
        }
        int v153 = v7 + 57;
        *((_DWORD *)a5 + v151 + 3) = (v143 >> 13) & 0x7FF;
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 57));
        }
        int v155 = v10 + 10;
        *((_DWORD *)a5 + v153 + 3) = (v143 >> 2) & 0x7FF;
        uint64_t v156 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v10 + 10));
        }
        int v157 = v7 + 58;
        unint64_t v158 = *((void *)a3 + v155 + 2);
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v157 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 58));
        }
        int v160 = v7 + 59;
        *((_DWORD *)a5 + v157 + 3) = (v158 >> 55) & 0xF9FF | ((v143 & 3) << 9);
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 59));
        }
        int v162 = v7 + 60;
        *((_DWORD *)a5 + v160 + 3) = (v158 >> 44) & 0x7FF;
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 60));
        }
        int v164 = v7 + 61;
        *((_DWORD *)a5 + v162 + 3) = (v158 >> 33) & 0x7FF;
        uint64_t v165 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v164 >= (int)v165) {
          IOSArray_throwOutOfBoundsWithMsg(v165, (v7 + 61));
        }
        int v166 = v7 + 62;
        *((_DWORD *)a5 + v164 + 3) = (v158 >> 22) & 0x7FF;
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v166 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 62));
        }
        int v168 = v7 + 63;
        *((_DWORD *)a5 + v166 + 3) = (v158 >> 11) & 0x7FF;
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 63));
        }
        a4 = v10 + 11;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v168 + 3) = v158 & 0x7FF;
        if (++v9 == a7) {
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
        *((_DWORD *)a5 + (int)v7 + 3) = (v12 >> 5) | (8 * *((unsigned __int8 *)a3 + v9 + 12));
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 2));
        }
        int v16 = v7 + 1;
        unsigned int v17 = *((unsigned __int8 *)a3 + v14 + 12);
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 1));
        }
        int v19 = v9 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v17 >> 2) & 0xFFFFF83F | ((v12 & 0x1F) << 6);
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v9 + 3));
        }
        int v21 = v9 + 4;
        int v22 = *((unsigned __int8 *)a3 + v19 + 12);
        if (v9 + 4 < 0 || v21 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v9 + 4));
        }
        int v23 = v7 + 2;
        unsigned int v24 = *((unsigned __int8 *)a3 + v21 + 12);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 2));
        }
        int v26 = v9 + 5;
        *((_DWORD *)a5 + v23 + 3) = ((v17 & 3) << 9) | (2 * v22) | (v24 >> 7);
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 5));
        }
        int v28 = v7 + 3;
        unsigned int v29 = *((unsigned __int8 *)a3 + v26 + 12);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 3));
        }
        int v31 = v9 + 6;
        *((_DWORD *)a5 + v28 + 3) = (v29 >> 4) & 0xFFFFF80F | (16 * (v24 & 0x7F));
        uint64_t v32 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v9 + 6));
        }
        int v33 = v7 + 4;
        unsigned int v34 = *((unsigned __int8 *)a3 + v31 + 12);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v33 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 4));
        }
        int v36 = v9 + 7;
        *((_DWORD *)a5 + v33 + 3) = (v34 >> 1) & 0xFFFFF87F | ((v29 & 0xF) << 7);
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v9 + 7));
        }
        int v38 = v9 + 8;
        int v39 = *((unsigned __int8 *)a3 + v36 + 12);
        if (v9 + 8 < 0 || v38 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v9 + 8));
        }
        int v40 = v7 + 5;
        unsigned int v41 = *((unsigned __int8 *)a3 + v38 + 12);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 5));
        }
        int v43 = v9 + 9;
        *((_DWORD *)a5 + v40 + 3) = ((v34 & 1) << 10) | (4 * v39) | (v41 >> 6);
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 9));
        }
        int v45 = v7 + 6;
        unsigned int v46 = *((unsigned __int8 *)a3 + v43 + 12);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 6));
        }
        int v48 = v9 + 10;
        *((_DWORD *)a5 + v45 + 3) = (v46 >> 3) & 0xFFFFF81F | (32 * (v41 & 0x3F));
        uint64_t v49 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v9 + 10));
        }
        int v50 = v7 + 7;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 7));
        }
        *((_DWORD *)a5 + v50 + 3) = *((unsigned __int8 *)a3 + v48 + 12) | ((v46 & 7) << 8);
        a4 = v9 + 11;
        uint64_t v7 = (v7 + 8);
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
      int v9 = 0;
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
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v7);
        }
        int v14 = v7 + 1;
        *((void *)a5 + (int)v7 + 2) = v12 >> 53;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 42) & 0x7FF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 31) & 0x7FF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 20) & 0x7FF;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = a4 + 1;
        *((void *)a5 + v20 + 2) = (v12 >> 9) & 0x7FF;
        uint64_t v23 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (a4 + 1));
        }
        int v24 = v7 + 5;
        unint64_t v25 = *((void *)a3 + v22 + 2);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((void *)a5 + v24 + 2) = (v25 >> 62) & 0xFFFFFFFFFFFFF803 | (4 * (v12 & 0x1FF));
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((void *)a5 + v27 + 2) = (v25 >> 51) & 0x7FF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((void *)a5 + v29 + 2) = (v25 >> 40) & 0x7FF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v7 + 9;
        *((void *)a5 + v31 + 2) = (v25 >> 29) & 0x7FF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((void *)a5 + v33 + 2) = (v25 >> 18) & 0x7FF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v10 + 2;
        *((void *)a5 + v35 + 2) = (v25 >> 7) & 0x7FF;
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v10 + 2));
        }
        int v39 = v7 + 11;
        unint64_t v40 = *((void *)a3 + v37 + 2);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v7 + 12;
        *((void *)a5 + v39 + 2) = (v40 >> 60) & 0xFFFFFFFFFFFFF80FLL | (16 * (v25 & 0x7F));
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 12));
        }
        int v44 = v7 + 13;
        *((void *)a5 + v42 + 2) = (v40 >> 49) & 0x7FF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 13));
        }
        int v46 = v7 + 14;
        *((void *)a5 + v44 + 2) = (v40 >> 38) & 0x7FF;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 14));
        }
        int v48 = v7 + 15;
        *((void *)a5 + v46 + 2) = (v40 >> 27) & 0x7FF;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 15));
        }
        int v50 = v7 + 16;
        *((void *)a5 + v48 + 2) = (v40 >> 16) & 0x7FF;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 16));
        }
        int v52 = v10 + 3;
        *((void *)a5 + v50 + 2) = (unsigned __int16)v40 >> 5;
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v10 + 3));
        }
        int v54 = v7 + 17;
        unint64_t v55 = *((void *)a3 + v52 + 2);
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v54 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 17));
        }
        int v57 = v7 + 18;
        *((void *)a5 + v54 + 2) = (v55 >> 58) & 0xFFFFFFFFFFFFF83FLL | ((v40 & 0x1F) << 6);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 18));
        }
        int v59 = v7 + 19;
        *((void *)a5 + v57 + 2) = (v55 >> 47) & 0x7FF;
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 19));
        }
        int v61 = v7 + 20;
        *((void *)a5 + v59 + 2) = (v55 >> 36) & 0x7FF;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 20));
        }
        int v63 = v7 + 21;
        *((void *)a5 + v61 + 2) = (v55 >> 25) & 0x7FF;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 21));
        }
        int v65 = v7 + 22;
        *((void *)a5 + v63 + 2) = (v55 >> 14) & 0x7FF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 22));
        }
        int v67 = v10 + 4;
        *((void *)a5 + v65 + 2) = (v55 >> 3) & 0x7FF;
        uint64_t v68 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v10 + 4));
        }
        int v69 = v7 + 23;
        unint64_t v70 = *((void *)a3 + v67 + 2);
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v69 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 23));
        }
        int v72 = v7 + 24;
        *((void *)a5 + v69 + 2) = HIBYTE(v70) & 0xFFFFFFFFFFFFF8FFLL | ((v55 & 7) << 8);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 24));
        }
        int v74 = v7 + 25;
        *((void *)a5 + v72 + 2) = (v70 >> 45) & 0x7FF;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 25));
        }
        int v76 = v7 + 26;
        *((void *)a5 + v74 + 2) = (v70 >> 34) & 0x7FF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 26));
        }
        int v78 = v7 + 27;
        *((void *)a5 + v76 + 2) = (v70 >> 23) & 0x7FF;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 27));
        }
        int v80 = v7 + 28;
        *((void *)a5 + v78 + 2) = (v70 >> 12) & 0x7FF;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 28));
        }
        int v82 = v10 + 5;
        *((void *)a5 + v80 + 2) = (v70 >> 1) & 0x7FF;
        uint64_t v83 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v10 + 5));
        }
        int v84 = v7 + 29;
        unint64_t v85 = *((void *)a3 + v82 + 2);
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v84 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 29));
        }
        int v87 = v7 + 30;
        *((void *)a5 + v84 + 2) = (v85 >> 54) & 0xFFFFFFFFFFFFFBFFLL | ((v70 & 1) << 10);
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 30));
        }
        int v89 = v7 + 31;
        *((void *)a5 + v87 + 2) = (v85 >> 43) & 0x7FF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 31));
        }
        int v91 = v7 + 32;
        *((void *)a5 + v89 + 2) = HIDWORD(v85) & 0x7FF;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 32));
        }
        int v93 = v7 + 33;
        *((void *)a5 + v91 + 2) = v85 >> 21;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 33));
        }
        int v95 = v10 + 6;
        *((void *)a5 + v93 + 2) = (v85 >> 10) & 0x7FF;
        uint64_t v96 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v10 + 6));
        }
        int v97 = v7 + 34;
        unint64_t v98 = *((void *)a3 + v95 + 2);
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v97 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 34));
        }
        int v100 = v7 + 35;
        *((void *)a5 + v97 + 2) = (v98 >> 63) | (2 * (v85 & 0x3FF));
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 35));
        }
        int v102 = v7 + 36;
        *((void *)a5 + v100 + 2) = (v98 >> 52) & 0x7FF;
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 36));
        }
        int v104 = v7 + 37;
        *((void *)a5 + v102 + 2) = (v98 >> 41) & 0x7FF;
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 37));
        }
        int v106 = v7 + 38;
        *((void *)a5 + v104 + 2) = (v98 >> 30) & 0x7FF;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 38));
        }
        int v108 = v7 + 39;
        *((void *)a5 + v106 + 2) = (v98 >> 19) & 0x7FF;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 39));
        }
        int v110 = v10 + 7;
        *((void *)a5 + v108 + 2) = (v98 >> 8) & 0x7FF;
        uint64_t v111 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v10 + 7));
        }
        int v112 = v7 + 40;
        unint64_t v113 = *((void *)a3 + v110 + 2);
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v112 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 40));
        }
        int v115 = v7 + 41;
        *((void *)a5 + v112 + 2) = (v113 >> 61) & 0xFFFFFFFFFFFFF807 | (8 * v98);
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 41));
        }
        int v117 = v7 + 42;
        *((void *)a5 + v115 + 2) = (v113 >> 50) & 0x7FF;
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 42));
        }
        int v119 = v7 + 43;
        *((void *)a5 + v117 + 2) = (v113 >> 39) & 0x7FF;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 43));
        }
        int v121 = v7 + 44;
        *((void *)a5 + v119 + 2) = (v113 >> 28) & 0x7FF;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 44));
        }
        int v123 = v7 + 45;
        *((void *)a5 + v121 + 2) = (v113 >> 17) & 0x7FF;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 45));
        }
        int v125 = v10 + 8;
        *((void *)a5 + v123 + 2) = (v113 >> 6) & 0x7FF;
        uint64_t v126 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v10 + 8));
        }
        int v127 = v7 + 46;
        unint64_t v128 = *((void *)a3 + v125 + 2);
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v127 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 46));
        }
        int v130 = v7 + 47;
        *((void *)a5 + v127 + 2) = (v128 >> 59) & 0xFFFFFFFFFFFFF81FLL | (32 * (v113 & 0x3F));
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 47));
        }
        int v132 = v7 + 48;
        *((void *)a5 + v130 + 2) = HIWORD(v128) & 0x7FF;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 48));
        }
        int v134 = v7 + 49;
        *((void *)a5 + v132 + 2) = (v128 >> 37) & 0x7FF;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 49));
        }
        int v136 = v7 + 50;
        *((void *)a5 + v134 + 2) = (v128 >> 26) & 0x7FF;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 50));
        }
        int v138 = v7 + 51;
        *((void *)a5 + v136 + 2) = (v128 >> 15) & 0x7FF;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 51));
        }
        int v140 = v10 + 9;
        *((void *)a5 + v138 + 2) = (v128 >> 4) & 0x7FF;
        uint64_t v141 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v10 + 9));
        }
        int v142 = v7 + 52;
        unint64_t v143 = *((void *)a3 + v140 + 2);
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v142 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 52));
        }
        int v145 = v7 + 53;
        *((void *)a5 + v142 + 2) = (v143 >> 57) & 0xFFFFFFFFFFFFF87FLL | ((v128 & 0xF) << 7);
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 53));
        }
        int v147 = v7 + 54;
        *((void *)a5 + v145 + 2) = (v143 >> 46) & 0x7FF;
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 54));
        }
        int v149 = v7 + 55;
        *((void *)a5 + v147 + 2) = (v143 >> 35) & 0x7FF;
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 55));
        }
        int v151 = v7 + 56;
        *((void *)a5 + v149 + 2) = (v143 >> 24) & 0x7FF;
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v151 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 56));
        }
        int v153 = v7 + 57;
        *((void *)a5 + v151 + 2) = (v143 >> 13) & 0x7FF;
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 57));
        }
        int v155 = v10 + 10;
        *((void *)a5 + v153 + 2) = (v143 >> 2) & 0x7FF;
        uint64_t v156 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v10 + 10));
        }
        int v157 = v7 + 58;
        unint64_t v158 = *((void *)a3 + v155 + 2);
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v157 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 58));
        }
        int v160 = v7 + 59;
        *((void *)a5 + v157 + 2) = (v158 >> 55) & 0xFFFFFFFFFFFFF9FFLL | ((v143 & 3) << 9);
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 59));
        }
        int v162 = v7 + 60;
        *((void *)a5 + v160 + 2) = (v158 >> 44) & 0x7FF;
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 60));
        }
        int v164 = v7 + 61;
        *((void *)a5 + v162 + 2) = (v158 >> 33) & 0x7FF;
        uint64_t v165 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v164 >= (int)v165) {
          IOSArray_throwOutOfBoundsWithMsg(v165, (v7 + 61));
        }
        int v166 = v7 + 62;
        *((void *)a5 + v164 + 2) = (v158 >> 22) & 0x7FF;
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v166 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 62));
        }
        int v168 = v7 + 63;
        *((void *)a5 + v166 + 2) = (v158 >> 11) & 0x7FF;
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 63));
        }
        a4 = v10 + 11;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v168 + 2) = v158 & 0x7FF;
        if (++v9 == a7) {
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
        *((void *)a5 + (int)v7 + 2) = (v12 >> 5) | (8 * *((unsigned __int8 *)a3 + v9 + 12));
        uint64_t v15 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v9 + 2));
        }
        int v16 = v7 + 1;
        unint64_t v17 = *((unsigned __int8 *)a3 + v14 + 12);
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v16 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 1));
        }
        int v19 = v9 + 3;
        *((void *)a5 + v16 + 2) = (v17 >> 2) & 0xFFFFFFFFFFFFF83FLL | ((v12 & 0x1F) << 6);
        uint64_t v20 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v9 + 3));
        }
        int v21 = v9 + 4;
        uint64_t v22 = *((unsigned __int8 *)a3 + v19 + 12);
        if (v9 + 4 < 0 || v21 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v9 + 4));
        }
        int v23 = v7 + 2;
        unint64_t v24 = *((unsigned __int8 *)a3 + v21 + 12);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 2));
        }
        int v26 = v9 + 5;
        *((void *)a5 + v23 + 2) = ((v17 & 3) << 9) | (2 * v22) | (v24 >> 7);
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 5));
        }
        int v28 = v7 + 3;
        unint64_t v29 = *((unsigned __int8 *)a3 + v26 + 12);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 3));
        }
        int v31 = v9 + 6;
        *((void *)a5 + v28 + 2) = (v29 >> 4) & 0xFFFFFFFFFFFFF80FLL | (16 * (v24 & 0x7F));
        uint64_t v32 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v9 + 6));
        }
        int v33 = v7 + 4;
        unint64_t v34 = *((unsigned __int8 *)a3 + v31 + 12);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v33 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 4));
        }
        int v36 = v9 + 7;
        *((void *)a5 + v33 + 2) = (v34 >> 1) & 0xFFFFFFFFFFFFF87FLL | ((v29 & 0xF) << 7);
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v9 + 7));
        }
        int v38 = v9 + 8;
        uint64_t v39 = *((unsigned __int8 *)a3 + v36 + 12);
        if (v9 + 8 < 0 || v38 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v9 + 8));
        }
        int v40 = v7 + 5;
        unint64_t v41 = *((unsigned __int8 *)a3 + v38 + 12);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 5));
        }
        int v43 = v9 + 9;
        *((void *)a5 + v40 + 2) = ((v34 & 1) << 10) | (4 * v39) | (v41 >> 6);
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 9));
        }
        int v45 = v7 + 6;
        unint64_t v46 = *((unsigned __int8 *)a3 + v43 + 12);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 6));
        }
        int v48 = v9 + 10;
        *((void *)a5 + v45 + 2) = (v46 >> 3) & 0xFFFFFFFFFFFFF81FLL | (32 * (v41 & 0x3F));
        uint64_t v49 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v9 + 10));
        }
        int v50 = v7 + 7;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 7));
        }
        *((void *)a5 + v50 + 2) = *((unsigned __int8 *)a3 + v48 + 12) | ((v46 & 7) << 8);
        a4 = v9 + 11;
        uint64_t v7 = (v7 + 8);
        if (!--a7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end