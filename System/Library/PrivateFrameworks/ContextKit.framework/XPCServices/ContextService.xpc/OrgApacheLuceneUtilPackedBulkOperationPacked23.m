@interface OrgApacheLuceneUtilPackedBulkOperationPacked23
- (OrgApacheLuceneUtilPackedBulkOperationPacked23)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked23

- (OrgApacheLuceneUtilPackedBulkOperationPacked23)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 41;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        uint64_t v16 = (a4 + 1);
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 18) & 0x7FFFFF;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v16);
        }
        int v18 = v7 + 2;
        unint64_t v19 = *((void *)a3 + (int)v16 + 2);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 2));
        }
        int v21 = v7 + 3;
        *((_DWORD *)a5 + v18 + 3) = (v19 >> 59) & 0x1F | (32 * (v12 & 0x3FFFF));
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 3));
        }
        int v23 = v7 + 4;
        *((_DWORD *)a5 + v21 + 3) = (v19 >> 36) & 0x7FFFFF;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v10 + 2;
        *((_DWORD *)a5 + v23 + 3) = (v19 >> 13) & 0x7FFFFF;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v7 + 5;
        unint64_t v28 = *((void *)a3 + v25 + 2);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 5));
        }
        int v30 = v7 + 6;
        *((_DWORD *)a5 + v27 + 3) = (v28 >> 54) & 0x3FF | ((v19 & 0x1FFF) << 10);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 6));
        }
        int v32 = v7 + 7;
        *((_DWORD *)a5 + v30 + 3) = (v28 >> 31) & 0x7FFFFF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v10 + 3;
        *((_DWORD *)a5 + v32 + 3) = (v28 >> 8) & 0x7FFFFF;
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v10 + 3));
        }
        int v36 = v7 + 8;
        unint64_t v37 = *((void *)a3 + v34 + 2);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 8));
        }
        int v39 = v7 + 9;
        *((_DWORD *)a5 + v36 + 3) = (v37 >> 49) & 0x7FFF | (v28 << 15);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 9));
        }
        int v41 = v7 + 10;
        *((_DWORD *)a5 + v39 + 3) = (v37 >> 26) & 0x7FFFFF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 10));
        }
        int v43 = v10 + 4;
        *((_DWORD *)a5 + v41 + 3) = (v37 >> 3) & 0x7FFFFF;
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v10 + 4));
        }
        int v45 = v7 + 11;
        unint64_t v46 = *((void *)a3 + v43 + 2);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 11));
        }
        int v48 = (v46 >> 44) & 0xFF8FFFFF | ((v37 & 7) << 20);
        int v49 = v7 + 12;
        *((_DWORD *)a5 + v45 + 3) = v48;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 12));
        }
        int v51 = v10 + 5;
        *((_DWORD *)a5 + v49 + 3) = (v46 >> 21) & 0x7FFFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 5));
        }
        int v53 = v7 + 13;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 13));
        }
        int v56 = v7 + 14;
        *((_DWORD *)a5 + v53 + 3) = (v54 >> 62) & 3 | (4 * (v46 & 0x1FFFFF));
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 14));
        }
        int v58 = v7 + 15;
        *((_DWORD *)a5 + v56 + 3) = (v54 >> 39) & 0x7FFFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 15));
        }
        int v60 = v10 + 6;
        *((_DWORD *)a5 + v58 + 3) = (v54 >> 16) & 0x7FFFFF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 6));
        }
        int v62 = v7 + 16;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 16));
        }
        int v65 = v7 + 17;
        *((_DWORD *)a5 + v62 + 3) = (v63 >> 57) & 0x7F | ((unsigned __int16)v54 << 7);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 17));
        }
        int v67 = v7 + 18;
        *((_DWORD *)a5 + v65 + 3) = (v63 >> 34) & 0x7FFFFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 18));
        }
        int v69 = v10 + 7;
        *((_DWORD *)a5 + v67 + 3) = (v63 >> 11) & 0x7FFFFF;
        uint64_t v70 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v10 + 7));
        }
        int v71 = v7 + 19;
        unint64_t v72 = *((void *)a3 + v69 + 2);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v71 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 19));
        }
        int v74 = v7 + 20;
        *((_DWORD *)a5 + v71 + 3) = (v72 >> 52) & 0xFFF | ((v63 & 0x7FF) << 12);
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 20));
        }
        int v76 = v7 + 21;
        *((_DWORD *)a5 + v74 + 3) = (v72 >> 29) & 0x7FFFFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 21));
        }
        int v78 = v10 + 8;
        *((_DWORD *)a5 + v76 + 3) = (v72 >> 6) & 0x7FFFFF;
        uint64_t v79 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v10 + 8));
        }
        int v80 = v7 + 22;
        unint64_t v81 = *((void *)a3 + v78 + 2);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v80 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 22));
        }
        int v83 = v7 + 23;
        *((_DWORD *)a5 + v80 + 3) = (v81 >> 47) & 0xFF81FFFF | ((v72 & 0x3F) << 17);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 23));
        }
        int v85 = v7 + 24;
        *((_DWORD *)a5 + v83 + 3) = (v81 >> 24) & 0x7FFFFF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 24));
        }
        int v87 = v10 + 9;
        *((_DWORD *)a5 + v85 + 3) = (v81 >> 1) & 0x7FFFFF;
        uint64_t v88 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v10 + 9));
        }
        int v89 = v7 + 25;
        unint64_t v90 = *((void *)a3 + v87 + 2);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v89 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 25));
        }
        int v92 = (v90 >> 42) & 0xFFBFFFFF | ((v81 & 1) << 22);
        int v93 = v7 + 26;
        *((_DWORD *)a5 + v89 + 3) = v92;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 26));
        }
        int v95 = v10 + 10;
        *((_DWORD *)a5 + v93 + 3) = (v90 >> 19) & 0x7FFFFF;
        uint64_t v96 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v10 + 10));
        }
        int v97 = v7 + 27;
        unint64_t v98 = *((void *)a3 + v95 + 2);
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v97 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 27));
        }
        int v100 = v7 + 28;
        *((_DWORD *)a5 + v97 + 3) = (v98 >> 60) & 0xF | (16 * (v90 & 0x7FFFF));
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 28));
        }
        int v102 = v7 + 29;
        *((_DWORD *)a5 + v100 + 3) = (v98 >> 37) & 0x7FFFFF;
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 29));
        }
        int v104 = v10 + 11;
        *((_DWORD *)a5 + v102 + 3) = (v98 >> 14) & 0x7FFFFF;
        uint64_t v105 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v10 + 11));
        }
        int v106 = v7 + 30;
        unint64_t v107 = *((void *)a3 + v104 + 2);
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v106 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 30));
        }
        int v109 = v7 + 31;
        *((_DWORD *)a5 + v106 + 3) = (v107 >> 55) & 0x1FF | ((v98 & 0x3FFF) << 9);
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 31));
        }
        int v111 = v7 + 32;
        *((_DWORD *)a5 + v109 + 3) = HIDWORD(v107) & 0x7FFFFF;
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 32));
        }
        int v113 = v10 + 12;
        *((_DWORD *)a5 + v111 + 3) = v107 >> 9;
        uint64_t v114 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v10 + 12));
        }
        int v115 = v7 + 33;
        unint64_t v116 = *((void *)a3 + v113 + 2);
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v115 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 33));
        }
        int v118 = v7 + 34;
        *((_DWORD *)a5 + v115 + 3) = (v116 >> 50) & 0x3FFF | ((v107 & 0x1FF) << 14);
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 34));
        }
        int v120 = v7 + 35;
        *((_DWORD *)a5 + v118 + 3) = (v116 >> 27) & 0x7FFFFF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 35));
        }
        int v122 = v10 + 13;
        *((_DWORD *)a5 + v120 + 3) = (v116 >> 4) & 0x7FFFFF;
        uint64_t v123 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v10 + 13));
        }
        int v124 = v7 + 36;
        unint64_t v125 = *((void *)a3 + v122 + 2);
        uint64_t v126 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v124 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v7 + 36));
        }
        int v127 = v7 + 37;
        *((_DWORD *)a5 + v124 + 3) = (v125 >> 45) & 0xFF87FFFF | ((v116 & 0xF) << 19);
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v127 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 37));
        }
        int v129 = v10 + 14;
        *((_DWORD *)a5 + v127 + 3) = (v125 >> 22) & 0x7FFFFF;
        uint64_t v130 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v10 + 14));
        }
        int v131 = v7 + 38;
        unint64_t v132 = *((void *)a3 + v129 + 2);
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v131 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 38));
        }
        int v134 = v7 + 39;
        *((_DWORD *)a5 + v131 + 3) = (v132 >> 63) | (2 * (v125 & 0x3FFFFF));
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 39));
        }
        int v136 = v7 + 40;
        *((_DWORD *)a5 + v134 + 3) = (v132 >> 40) & 0x7FFFFF;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 40));
        }
        int v138 = v10 + 15;
        *((_DWORD *)a5 + v136 + 3) = (v132 >> 17) & 0x7FFFFF;
        uint64_t v139 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v10 + 15));
        }
        int v140 = v7 + 41;
        unint64_t v141 = *((void *)a3 + v138 + 2);
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v140 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 41));
        }
        int v143 = v7 + 42;
        *((_DWORD *)a5 + v140 + 3) = (v141 >> 58) & 0x3F | ((v132 & 0x1FFFF) << 6);
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 42));
        }
        int v145 = v7 + 43;
        *((_DWORD *)a5 + v143 + 3) = (v141 >> 35) & 0x7FFFFF;
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 43));
        }
        int v147 = v10 + 16;
        *((_DWORD *)a5 + v145 + 3) = (v141 >> 12) & 0x7FFFFF;
        uint64_t v148 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v10 + 16));
        }
        int v149 = v7 + 44;
        unint64_t v150 = *((void *)a3 + v147 + 2);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v149 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 44));
        }
        int v152 = v7 + 45;
        *((_DWORD *)a5 + v149 + 3) = (v150 >> 53) & 0x7FF | ((v141 & 0xFFF) << 11);
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 45));
        }
        int v154 = v7 + 46;
        *((_DWORD *)a5 + v152 + 3) = (v150 >> 30) & 0x7FFFFF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 46));
        }
        int v156 = v10 + 17;
        *((_DWORD *)a5 + v154 + 3) = (v150 >> 7) & 0x7FFFFF;
        uint64_t v157 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v10 + 17));
        }
        int v158 = v7 + 47;
        unint64_t v159 = *((void *)a3 + v156 + 2);
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v158 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 47));
        }
        int v161 = v7 + 48;
        *((_DWORD *)a5 + v158 + 3) = HIWORD(v159) | ((v150 & 0x7F) << 16);
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 48));
        }
        int v163 = v7 + 49;
        *((_DWORD *)a5 + v161 + 3) = (v159 >> 25) & 0x7FFFFF;
        uint64_t v164 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v7 + 49));
        }
        int v165 = v10 + 18;
        *((_DWORD *)a5 + v163 + 3) = (v159 >> 2) & 0x7FFFFF;
        uint64_t v166 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v165 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v10 + 18));
        }
        int v167 = v7 + 50;
        unint64_t v168 = *((void *)a3 + v165 + 2);
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v167 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 50));
        }
        int v170 = (v168 >> 43) & 0xFF9FFFFF | ((v159 & 3) << 21);
        int v171 = v7 + 51;
        *((_DWORD *)a5 + v167 + 3) = v170;
        uint64_t v172 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v171 >= (int)v172) {
          IOSArray_throwOutOfBoundsWithMsg(v172, (v7 + 51));
        }
        int v173 = v10 + 19;
        *((_DWORD *)a5 + v171 + 3) = (v168 >> 20) & 0x7FFFFF;
        uint64_t v174 = *((unsigned int *)a3 + 2);
        if (v10 + 19 < 0 || v173 >= (int)v174) {
          IOSArray_throwOutOfBoundsWithMsg(v174, (v10 + 19));
        }
        int v175 = v7 + 52;
        unint64_t v176 = *((void *)a3 + v173 + 2);
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v175 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 52));
        }
        int v178 = v7 + 53;
        *((_DWORD *)a5 + v175 + 3) = (v176 >> 61) & 7 | (8 * (v168 & 0xFFFFF));
        uint64_t v179 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v7 + 53));
        }
        int v180 = v7 + 54;
        *((_DWORD *)a5 + v178 + 3) = (v176 >> 38) & 0x7FFFFF;
        uint64_t v181 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v180 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v7 + 54));
        }
        int v182 = v10 + 20;
        *((_DWORD *)a5 + v180 + 3) = (v176 >> 15) & 0x7FFFFF;
        uint64_t v183 = *((unsigned int *)a3 + 2);
        if (v10 + 20 < 0 || v182 >= (int)v183) {
          IOSArray_throwOutOfBoundsWithMsg(v183, (v10 + 20));
        }
        int v184 = v7 + 55;
        unint64_t v185 = *((void *)a3 + v182 + 2);
        uint64_t v186 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v184 >= (int)v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, (v7 + 55));
        }
        int v187 = v7 + 56;
        *((_DWORD *)a5 + v184 + 3) = HIBYTE(v185) | ((v176 & 0x7FFF) << 8);
        uint64_t v188 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v187 >= (int)v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, (v7 + 56));
        }
        int v189 = v7 + 57;
        *((_DWORD *)a5 + v187 + 3) = (v185 >> 33) & 0x7FFFFF;
        uint64_t v190 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v189 >= (int)v190) {
          IOSArray_throwOutOfBoundsWithMsg(v190, (v7 + 57));
        }
        int v191 = v10 + 21;
        *((_DWORD *)a5 + v189 + 3) = (v185 >> 10) & 0x7FFFFF;
        uint64_t v192 = *((unsigned int *)a3 + 2);
        if (v10 + 21 < 0 || v191 >= (int)v192) {
          IOSArray_throwOutOfBoundsWithMsg(v192, (v10 + 21));
        }
        int v193 = v7 + 58;
        unint64_t v194 = *((void *)a3 + v191 + 2);
        uint64_t v195 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v193 >= (int)v195) {
          IOSArray_throwOutOfBoundsWithMsg(v195, (v7 + 58));
        }
        int v196 = v7 + 59;
        *((_DWORD *)a5 + v193 + 3) = (v194 >> 51) & 0x1FFF | ((v185 & 0x3FF) << 13);
        uint64_t v197 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v196 >= (int)v197) {
          IOSArray_throwOutOfBoundsWithMsg(v197, (v7 + 59));
        }
        int v198 = v7 + 60;
        *((_DWORD *)a5 + v196 + 3) = (v194 >> 28) & 0x7FFFFF;
        uint64_t v199 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v198 >= (int)v199) {
          IOSArray_throwOutOfBoundsWithMsg(v199, (v7 + 60));
        }
        int v200 = v10 + 22;
        *((_DWORD *)a5 + v198 + 3) = (v194 >> 5) & 0x7FFFFF;
        uint64_t v201 = *((unsigned int *)a3 + 2);
        if (v10 + 22 < 0 || v200 >= (int)v201) {
          IOSArray_throwOutOfBoundsWithMsg(v201, (v10 + 22));
        }
        int v202 = v7 + 61;
        unint64_t v203 = *((void *)a3 + v200 + 2);
        uint64_t v204 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v202 >= (int)v204) {
          IOSArray_throwOutOfBoundsWithMsg(v204, (v7 + 61));
        }
        int v205 = v7 + 62;
        *((_DWORD *)a5 + v202 + 3) = (v203 >> 46) & 0xFF83FFFF | ((v194 & 0x1F) << 18);
        uint64_t v206 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v205 >= (int)v206) {
          IOSArray_throwOutOfBoundsWithMsg(v206, (v7 + 62));
        }
        int v207 = v7 + 63;
        *((_DWORD *)a5 + v205 + 3) = (v203 >> 23) & 0x7FFFFF;
        uint64_t v208 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v207 >= (int)v208) {
          IOSArray_throwOutOfBoundsWithMsg(v208, (v7 + 63));
        }
        a4 = v10 + 23;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v207 + 3) = v203 & 0x7FFFFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 15) | (v13 << 7) | (v14 >> 1);
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
        *((_DWORD *)a5 + v22 + 3) = ((v14 & 1) << 22) | (v19 << 14) | (v21 << 6) | (v23 >> 2);
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
        *((_DWORD *)a5 + v31 + 3) = ((v23 & 3) << 21) | (v28 << 13) | (32 * v30) | (v32 >> 3);
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 9));
        }
        int v36 = v9 + 10;
        int v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 10));
        }
        int v38 = v9 + 11;
        int v39 = *((unsigned __int8 *)a3 + v36 + 12);
        if (v9 + 11 < 0 || v38 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 11));
        }
        int v40 = v7 + 3;
        unsigned int v41 = *((unsigned __int8 *)a3 + v38 + 12);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 3));
        }
        int v43 = v9 + 12;
        *((_DWORD *)a5 + v40 + 3) = ((v32 & 7) << 20) | (v37 << 12) | (16 * v39) | (v41 >> 4);
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 12));
        }
        int v45 = v9 + 13;
        int v46 = *((unsigned __int8 *)a3 + v43 + 12);
        if (v9 + 13 < 0 || v45 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 13));
        }
        int v47 = v9 + 14;
        int v48 = *((unsigned __int8 *)a3 + v45 + 12);
        if (v9 + 14 < 0 || v47 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 14));
        }
        int v49 = v7 + 4;
        unsigned int v50 = *((unsigned __int8 *)a3 + v47 + 12);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v49 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 4));
        }
        int v52 = v9 + 15;
        *((_DWORD *)a5 + v49 + 3) = ((v41 & 0xF) << 19) | (v46 << 11) | (8 * v48) | (v50 >> 5);
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 15));
        }
        int v54 = v9 + 16;
        int v55 = *((unsigned __int8 *)a3 + v52 + 12);
        if (v9 + 16 < 0 || v54 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 16));
        }
        int v56 = v9 + 17;
        int v57 = *((unsigned __int8 *)a3 + v54 + 12);
        if (v9 + 17 < 0 || v56 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 17));
        }
        int v58 = v7 + 5;
        unsigned int v59 = *((unsigned __int8 *)a3 + v56 + 12);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v58 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 5));
        }
        int v61 = v9 + 18;
        *((_DWORD *)a5 + v58 + 3) = ((v50 & 0x1F) << 18) | (v55 << 10) | (4 * v57) | (v59 >> 6);
        uint64_t v62 = *((unsigned int *)a3 + 2);
        if (v9 + 18 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 18));
        }
        int v63 = v9 + 19;
        int v64 = *((unsigned __int8 *)a3 + v61 + 12);
        if (v9 + 19 < 0 || v63 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 19));
        }
        int v65 = v9 + 20;
        int v66 = *((unsigned __int8 *)a3 + v63 + 12);
        if (v9 + 20 < 0 || v65 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 20));
        }
        int v67 = v7 + 6;
        unsigned int v68 = *((unsigned __int8 *)a3 + v65 + 12);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v67 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 6));
        }
        int v70 = v9 + 21;
        *((_DWORD *)a5 + v67 + 3) = ((v59 & 0x3F) << 17) | (v64 << 9) | (2 * v66) | (v68 >> 7);
        uint64_t v71 = *((unsigned int *)a3 + 2);
        if (v9 + 21 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 21));
        }
        int v72 = v9 + 22;
        int v73 = *((unsigned __int8 *)a3 + v70 + 12);
        if (v9 + 22 < 0 || v72 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 22));
        }
        int v74 = v7 + 7;
        int v75 = *((unsigned __int8 *)a3 + v72 + 12);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 7));
        }
        *((_DWORD *)a5 + v74 + 3) = ((v68 & 0x7F) << 16) | (v73 << 8) | v75;
        a4 = v9 + 23;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 41;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = a4 + 1;
        *((void *)a5 + v14 + 2) = (v12 >> 18) & 0x7FFFFF;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (a4 + 1));
        }
        int v18 = v7 + 2;
        unint64_t v19 = *((void *)a3 + v16 + 2);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 2));
        }
        int v21 = v7 + 3;
        *((void *)a5 + v18 + 2) = (v19 >> 59) & 0xFFFFFFFFFF80001FLL | (32 * (v12 & 0x3FFFF));
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 3));
        }
        int v23 = v7 + 4;
        *((void *)a5 + v21 + 2) = (v19 >> 36) & 0x7FFFFF;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v10 + 2;
        *((void *)a5 + v23 + 2) = (v19 >> 13) & 0x7FFFFF;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v7 + 5;
        unint64_t v28 = *((void *)a3 + v25 + 2);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 5));
        }
        int v30 = v7 + 6;
        *((void *)a5 + v27 + 2) = (v28 >> 54) & 0xFFFFFFFFFF8003FFLL | ((v19 & 0x1FFF) << 10);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 6));
        }
        int v32 = v7 + 7;
        *((void *)a5 + v30 + 2) = (v28 >> 31) & 0x7FFFFF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v10 + 3;
        *((void *)a5 + v32 + 2) = (v28 >> 8) & 0x7FFFFF;
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v10 + 3));
        }
        int v36 = v7 + 8;
        unint64_t v37 = *((void *)a3 + v34 + 2);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 8));
        }
        int v39 = v7 + 9;
        *((void *)a5 + v36 + 2) = (v37 >> 49) & 0xFFFFFFFFFF807FFFLL | ((unint64_t)v28 << 15);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 9));
        }
        int v41 = v7 + 10;
        *((void *)a5 + v39 + 2) = (v37 >> 26) & 0x7FFFFF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 10));
        }
        int v43 = v10 + 4;
        *((void *)a5 + v41 + 2) = (v37 >> 3) & 0x7FFFFF;
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v10 + 4));
        }
        int v45 = v7 + 11;
        unint64_t v46 = *((void *)a3 + v43 + 2);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 11));
        }
        unint64_t v48 = (v46 >> 44) & 0xFFFFFFFFFF8FFFFFLL | ((v37 & 7) << 20);
        int v49 = v7 + 12;
        *((void *)a5 + v45 + 2) = v48;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 12));
        }
        int v51 = v10 + 5;
        *((void *)a5 + v49 + 2) = (v46 >> 21) & 0x7FFFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 5));
        }
        int v53 = v7 + 13;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 13));
        }
        int v56 = v7 + 14;
        *((void *)a5 + v53 + 2) = (v54 >> 62) & 0xFFFFFFFFFF800003 | (4 * (v46 & 0x1FFFFF));
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 14));
        }
        int v58 = v7 + 15;
        *((void *)a5 + v56 + 2) = (v54 >> 39) & 0x7FFFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 15));
        }
        int v60 = v10 + 6;
        *((void *)a5 + v58 + 2) = (v54 >> 16) & 0x7FFFFF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 6));
        }
        int v62 = v7 + 16;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 16));
        }
        int v65 = v7 + 17;
        *((void *)a5 + v62 + 2) = (v63 >> 57) & 0xFFFFFFFFFF80007FLL | ((unint64_t)(unsigned __int16)v54 << 7);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 17));
        }
        int v67 = v7 + 18;
        *((void *)a5 + v65 + 2) = (v63 >> 34) & 0x7FFFFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 18));
        }
        int v69 = v10 + 7;
        *((void *)a5 + v67 + 2) = (v63 >> 11) & 0x7FFFFF;
        uint64_t v70 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v10 + 7));
        }
        int v71 = v7 + 19;
        unint64_t v72 = *((void *)a3 + v69 + 2);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v71 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 19));
        }
        int v74 = v7 + 20;
        *((void *)a5 + v71 + 2) = (v72 >> 52) & 0xFFFFFFFFFF800FFFLL | ((v63 & 0x7FF) << 12);
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 20));
        }
        int v76 = v7 + 21;
        *((void *)a5 + v74 + 2) = (v72 >> 29) & 0x7FFFFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 21));
        }
        int v78 = v10 + 8;
        *((void *)a5 + v76 + 2) = (v72 >> 6) & 0x7FFFFF;
        uint64_t v79 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v10 + 8));
        }
        int v80 = v7 + 22;
        unint64_t v81 = *((void *)a3 + v78 + 2);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v80 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 22));
        }
        int v83 = v7 + 23;
        *((void *)a5 + v80 + 2) = (v81 >> 47) & 0xFFFFFFFFFF81FFFFLL | ((v72 & 0x3F) << 17);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 23));
        }
        int v85 = v7 + 24;
        *((void *)a5 + v83 + 2) = (v81 >> 24) & 0x7FFFFF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 24));
        }
        int v87 = v10 + 9;
        *((void *)a5 + v85 + 2) = (v81 >> 1) & 0x7FFFFF;
        uint64_t v88 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v10 + 9));
        }
        int v89 = v7 + 25;
        unint64_t v90 = *((void *)a3 + v87 + 2);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v89 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 25));
        }
        int v92 = v7 + 26;
        *((void *)a5 + v89 + 2) = (v90 >> 42) & 0xFFFFFFFFFFBFFFFFLL | ((v81 & 1) << 22);
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 26));
        }
        int v94 = v10 + 10;
        *((void *)a5 + v92 + 2) = (v90 >> 19) & 0x7FFFFF;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 10));
        }
        int v96 = v7 + 27;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 27));
        }
        int v99 = v7 + 28;
        *((void *)a5 + v96 + 2) = (v97 >> 60) & 0xFFFFFFFFFF80000FLL | (16 * (v90 & 0x7FFFF));
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 28));
        }
        int v101 = v7 + 29;
        *((void *)a5 + v99 + 2) = (v97 >> 37) & 0x7FFFFF;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 29));
        }
        int v103 = v10 + 11;
        *((void *)a5 + v101 + 2) = (v97 >> 14) & 0x7FFFFF;
        uint64_t v104 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v10 + 11));
        }
        int v105 = v7 + 30;
        unint64_t v106 = *((void *)a3 + v103 + 2);
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v105 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 30));
        }
        int v108 = v7 + 31;
        *((void *)a5 + v105 + 2) = (v106 >> 55) & 0xFFFFFFFFFF8001FFLL | ((v97 & 0x3FFF) << 9);
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 31));
        }
        int v110 = v7 + 32;
        *((void *)a5 + v108 + 2) = HIDWORD(v106) & 0x7FFFFF;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 32));
        }
        int v112 = v10 + 12;
        *((void *)a5 + v110 + 2) = v106 >> 9;
        uint64_t v113 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v10 + 12));
        }
        int v114 = v7 + 33;
        unint64_t v115 = *((void *)a3 + v112 + 2);
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v114 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 33));
        }
        int v117 = v7 + 34;
        *((void *)a5 + v114 + 2) = (v115 >> 50) & 0xFFFFFFFFFF803FFFLL | ((v106 & 0x1FF) << 14);
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 34));
        }
        int v119 = v7 + 35;
        *((void *)a5 + v117 + 2) = (v115 >> 27) & 0x7FFFFF;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 35));
        }
        int v121 = v10 + 13;
        *((void *)a5 + v119 + 2) = (v115 >> 4) & 0x7FFFFF;
        uint64_t v122 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v10 + 13));
        }
        int v123 = v7 + 36;
        unint64_t v124 = *((void *)a3 + v121 + 2);
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v123 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 36));
        }
        unint64_t v126 = (v124 >> 45) & 0xFFFFFFFFFF87FFFFLL | ((v115 & 0xF) << 19);
        int v127 = v7 + 37;
        *((void *)a5 + v123 + 2) = v126;
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v127 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 37));
        }
        int v129 = v10 + 14;
        *((void *)a5 + v127 + 2) = (v124 >> 22) & 0x7FFFFF;
        uint64_t v130 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v10 + 14));
        }
        int v131 = v7 + 38;
        unint64_t v132 = *((void *)a3 + v129 + 2);
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v131 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 38));
        }
        int v134 = v7 + 39;
        *((void *)a5 + v131 + 2) = (v132 >> 63) | (2 * (v124 & 0x3FFFFF));
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 39));
        }
        int v136 = v7 + 40;
        *((void *)a5 + v134 + 2) = (v132 >> 40) & 0x7FFFFF;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 40));
        }
        int v138 = v10 + 15;
        *((void *)a5 + v136 + 2) = (v132 >> 17) & 0x7FFFFF;
        uint64_t v139 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v10 + 15));
        }
        int v140 = v7 + 41;
        unint64_t v141 = *((void *)a3 + v138 + 2);
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v140 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 41));
        }
        int v143 = v7 + 42;
        *((void *)a5 + v140 + 2) = (v141 >> 58) & 0xFFFFFFFFFF80003FLL | ((v132 & 0x1FFFF) << 6);
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 42));
        }
        int v145 = v7 + 43;
        *((void *)a5 + v143 + 2) = (v141 >> 35) & 0x7FFFFF;
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 43));
        }
        int v147 = v10 + 16;
        *((void *)a5 + v145 + 2) = (v141 >> 12) & 0x7FFFFF;
        uint64_t v148 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v10 + 16));
        }
        int v149 = v7 + 44;
        unint64_t v150 = *((void *)a3 + v147 + 2);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v149 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 44));
        }
        int v152 = v7 + 45;
        *((void *)a5 + v149 + 2) = (v150 >> 53) & 0xFFFFFFFFFF8007FFLL | ((v141 & 0xFFF) << 11);
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 45));
        }
        int v154 = v7 + 46;
        *((void *)a5 + v152 + 2) = (v150 >> 30) & 0x7FFFFF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 46));
        }
        int v156 = v10 + 17;
        *((void *)a5 + v154 + 2) = (v150 >> 7) & 0x7FFFFF;
        uint64_t v157 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v10 + 17));
        }
        int v158 = v7 + 47;
        unint64_t v159 = *((void *)a3 + v156 + 2);
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v158 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 47));
        }
        int v161 = v7 + 48;
        *((void *)a5 + v158 + 2) = HIWORD(v159) & 0xFFFFFFFFFF80FFFFLL | ((v150 & 0x7F) << 16);
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 48));
        }
        int v163 = v7 + 49;
        *((void *)a5 + v161 + 2) = (v159 >> 25) & 0x7FFFFF;
        uint64_t v164 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v7 + 49));
        }
        int v165 = v10 + 18;
        *((void *)a5 + v163 + 2) = (v159 >> 2) & 0x7FFFFF;
        uint64_t v166 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v165 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v10 + 18));
        }
        int v167 = v7 + 50;
        unint64_t v168 = *((void *)a3 + v165 + 2);
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v167 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 50));
        }
        int v170 = v7 + 51;
        *((void *)a5 + v167 + 2) = (v168 >> 43) & 0xFFFFFFFFFF9FFFFFLL | ((v159 & 3) << 21);
        uint64_t v171 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v170 >= (int)v171) {
          IOSArray_throwOutOfBoundsWithMsg(v171, (v7 + 51));
        }
        int v172 = v10 + 19;
        *((void *)a5 + v170 + 2) = (v168 >> 20) & 0x7FFFFF;
        uint64_t v173 = *((unsigned int *)a3 + 2);
        if (v10 + 19 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v10 + 19));
        }
        int v174 = v7 + 52;
        unint64_t v175 = *((void *)a3 + v172 + 2);
        uint64_t v176 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v174 >= (int)v176) {
          IOSArray_throwOutOfBoundsWithMsg(v176, (v7 + 52));
        }
        int v177 = v7 + 53;
        *((void *)a5 + v174 + 2) = (v175 >> 61) & 0xFFFFFFFFFF800007 | (8 * (v168 & 0xFFFFF));
        uint64_t v178 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v177 >= (int)v178) {
          IOSArray_throwOutOfBoundsWithMsg(v178, (v7 + 53));
        }
        int v179 = v7 + 54;
        *((void *)a5 + v177 + 2) = (v175 >> 38) & 0x7FFFFF;
        uint64_t v180 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v179 >= (int)v180) {
          IOSArray_throwOutOfBoundsWithMsg(v180, (v7 + 54));
        }
        int v181 = v10 + 20;
        *((void *)a5 + v179 + 2) = (v175 >> 15) & 0x7FFFFF;
        uint64_t v182 = *((unsigned int *)a3 + 2);
        if (v10 + 20 < 0 || v181 >= (int)v182) {
          IOSArray_throwOutOfBoundsWithMsg(v182, (v10 + 20));
        }
        int v183 = v7 + 55;
        unint64_t v184 = *((void *)a3 + v181 + 2);
        uint64_t v185 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v183 >= (int)v185) {
          IOSArray_throwOutOfBoundsWithMsg(v185, (v7 + 55));
        }
        int v186 = v7 + 56;
        *((void *)a5 + v183 + 2) = HIBYTE(v184) & 0xFFFFFFFFFF8000FFLL | ((v175 & 0x7FFF) << 8);
        uint64_t v187 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v186 >= (int)v187) {
          IOSArray_throwOutOfBoundsWithMsg(v187, (v7 + 56));
        }
        int v188 = v7 + 57;
        *((void *)a5 + v186 + 2) = (v184 >> 33) & 0x7FFFFF;
        uint64_t v189 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v188 >= (int)v189) {
          IOSArray_throwOutOfBoundsWithMsg(v189, (v7 + 57));
        }
        int v190 = v10 + 21;
        *((void *)a5 + v188 + 2) = (v184 >> 10) & 0x7FFFFF;
        uint64_t v191 = *((unsigned int *)a3 + 2);
        if (v10 + 21 < 0 || v190 >= (int)v191) {
          IOSArray_throwOutOfBoundsWithMsg(v191, (v10 + 21));
        }
        int v192 = v7 + 58;
        unint64_t v193 = *((void *)a3 + v190 + 2);
        uint64_t v194 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v192 >= (int)v194) {
          IOSArray_throwOutOfBoundsWithMsg(v194, (v7 + 58));
        }
        int v195 = v7 + 59;
        *((void *)a5 + v192 + 2) = (v193 >> 51) & 0xFFFFFFFFFF801FFFLL | ((v184 & 0x3FF) << 13);
        uint64_t v196 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v195 >= (int)v196) {
          IOSArray_throwOutOfBoundsWithMsg(v196, (v7 + 59));
        }
        int v197 = v7 + 60;
        *((void *)a5 + v195 + 2) = (v193 >> 28) & 0x7FFFFF;
        uint64_t v198 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v197 >= (int)v198) {
          IOSArray_throwOutOfBoundsWithMsg(v198, (v7 + 60));
        }
        int v199 = v10 + 22;
        *((void *)a5 + v197 + 2) = (v193 >> 5) & 0x7FFFFF;
        uint64_t v200 = *((unsigned int *)a3 + 2);
        if (v10 + 22 < 0 || v199 >= (int)v200) {
          IOSArray_throwOutOfBoundsWithMsg(v200, (v10 + 22));
        }
        int v201 = v7 + 61;
        unint64_t v202 = *((void *)a3 + v199 + 2);
        uint64_t v203 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v201 >= (int)v203) {
          IOSArray_throwOutOfBoundsWithMsg(v203, (v7 + 61));
        }
        unint64_t v204 = (v202 >> 46) & 0xFFFFFFFFFF83FFFFLL | ((v193 & 0x1F) << 18);
        int v205 = v7 + 62;
        *((void *)a5 + v201 + 2) = v204;
        uint64_t v206 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v205 >= (int)v206) {
          IOSArray_throwOutOfBoundsWithMsg(v206, (v7 + 62));
        }
        int v207 = v7 + 63;
        *((void *)a5 + v205 + 2) = (v202 >> 23) & 0x7FFFFF;
        uint64_t v208 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v207 >= (int)v208) {
          IOSArray_throwOutOfBoundsWithMsg(v208, (v7 + 63));
        }
        a4 = v10 + 23;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v207 + 2) = v202 & 0x7FFFFF;
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
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 15) | (v13 << 7) | (v14 >> 1);
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
        *((void *)a5 + v22 + 2) = ((v14 & 1) << 22) | (v19 << 14) | (v21 << 6) | (v23 >> 2);
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
        *((void *)a5 + v31 + 2) = ((v23 & 3) << 21) | (v28 << 13) | (32 * v30) | (v32 >> 3);
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 9));
        }
        int v36 = v9 + 10;
        uint64_t v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 10));
        }
        int v38 = v9 + 11;
        uint64_t v39 = *((unsigned __int8 *)a3 + v36 + 12);
        if (v9 + 11 < 0 || v38 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 11));
        }
        int v40 = v7 + 3;
        unint64_t v41 = *((unsigned __int8 *)a3 + v38 + 12);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 3));
        }
        int v43 = v9 + 12;
        *((void *)a5 + v40 + 2) = ((v32 & 7) << 20) | (v37 << 12) | (16 * v39) | (v41 >> 4);
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 12));
        }
        int v45 = v9 + 13;
        uint64_t v46 = *((unsigned __int8 *)a3 + v43 + 12);
        if (v9 + 13 < 0 || v45 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 13));
        }
        int v47 = v9 + 14;
        uint64_t v48 = *((unsigned __int8 *)a3 + v45 + 12);
        if (v9 + 14 < 0 || v47 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v9 + 14));
        }
        int v49 = v7 + 4;
        unint64_t v50 = *((unsigned __int8 *)a3 + v47 + 12);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v49 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 4));
        }
        int v52 = v9 + 15;
        *((void *)a5 + v49 + 2) = ((v41 & 0xF) << 19) | (v46 << 11) | (8 * v48) | (v50 >> 5);
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 15));
        }
        int v54 = v9 + 16;
        uint64_t v55 = *((unsigned __int8 *)a3 + v52 + 12);
        if (v9 + 16 < 0 || v54 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 16));
        }
        int v56 = v9 + 17;
        uint64_t v57 = *((unsigned __int8 *)a3 + v54 + 12);
        if (v9 + 17 < 0 || v56 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 17));
        }
        int v58 = v7 + 5;
        unint64_t v59 = *((unsigned __int8 *)a3 + v56 + 12);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v58 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 5));
        }
        int v61 = v9 + 18;
        *((void *)a5 + v58 + 2) = ((v50 & 0x1F) << 18) | (v55 << 10) | (4 * v57) | (v59 >> 6);
        uint64_t v62 = *((unsigned int *)a3 + 2);
        if (v9 + 18 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 18));
        }
        int v63 = v9 + 19;
        uint64_t v64 = *((unsigned __int8 *)a3 + v61 + 12);
        if (v9 + 19 < 0 || v63 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 19));
        }
        int v65 = v9 + 20;
        uint64_t v66 = *((unsigned __int8 *)a3 + v63 + 12);
        if (v9 + 20 < 0 || v65 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v9 + 20));
        }
        int v67 = v7 + 6;
        unint64_t v68 = *((unsigned __int8 *)a3 + v65 + 12);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v67 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 6));
        }
        int v70 = v9 + 21;
        *((void *)a5 + v67 + 2) = ((v59 & 0x3F) << 17) | (v64 << 9) | (2 * v66) | (v68 >> 7);
        uint64_t v71 = *((unsigned int *)a3 + 2);
        if (v9 + 21 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 21));
        }
        int v72 = v9 + 22;
        uint64_t v73 = *((unsigned __int8 *)a3 + v70 + 12);
        if (v9 + 22 < 0 || v72 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v9 + 22));
        }
        int v74 = v7 + 7;
        uint64_t v75 = *((unsigned __int8 *)a3 + v72 + 12);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 7));
        }
        *((void *)a5 + v74 + 2) = ((v68 & 0x7F) << 16) | (v73 << 8) | v75;
        a4 = v9 + 23;
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