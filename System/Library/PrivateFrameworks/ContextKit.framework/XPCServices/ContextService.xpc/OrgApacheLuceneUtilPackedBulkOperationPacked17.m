@interface OrgApacheLuceneUtilPackedBulkOperationPacked17
- (OrgApacheLuceneUtilPackedBulkOperationPacked17)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked17

- (OrgApacheLuceneUtilPackedBulkOperationPacked17)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 47;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 30) & 0x1FFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        uint64_t v18 = (a4 + 1);
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 13) & 0x1FFFF;
        uint64_t v19 = *((unsigned int *)a3 + 2);
        if ((v18 & 0x80000000) != 0 || (int)v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, v18);
        }
        int v20 = v7 + 3;
        unint64_t v21 = *((void *)a3 + (int)v18 + 2);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v20 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 3));
        }
        int v23 = v7 + 4;
        *((_DWORD *)a5 + v20 + 3) = (v21 >> 60) & 0xF | (16 * (v12 & 0x1FFF));
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((_DWORD *)a5 + v23 + 3) = (v21 >> 43) & 0x1FFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((_DWORD *)a5 + v25 + 3) = (v21 >> 26) & 0x1FFFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v10 + 2;
        *((_DWORD *)a5 + v27 + 3) = (v21 >> 9) & 0x1FFFF;
        uint64_t v30 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v10 + 2));
        }
        int v31 = v7 + 7;
        unint64_t v32 = *((void *)a3 + v29 + 2);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v7 + 8;
        *((_DWORD *)a5 + v31 + 3) = HIBYTE(v32) | ((v21 & 0x1FF) << 8);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v7 + 9;
        *((_DWORD *)a5 + v34 + 3) = (v32 >> 39) & 0x1FFFF;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((_DWORD *)a5 + v36 + 3) = (v32 >> 22) & 0x1FFFF;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v10 + 3;
        *((_DWORD *)a5 + v38 + 3) = (v32 >> 5) & 0x1FFFF;
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v10 + 3));
        }
        int v42 = v7 + 11;
        unint64_t v43 = *((void *)a3 + v40 + 2);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v7 + 12;
        *((_DWORD *)a5 + v42 + 3) = (v43 >> 52) & 0xFFF | ((v32 & 0x1F) << 12);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v7 + 13;
        *((_DWORD *)a5 + v45 + 3) = (v43 >> 35) & 0x1FFFF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v7 + 14;
        *((_DWORD *)a5 + v47 + 3) = (v43 >> 18) & 0x1FFFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v10 + 4;
        *((_DWORD *)a5 + v49 + 3) = (v43 >> 1) & 0x1FFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 4));
        }
        int v53 = v7 + 15;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 15));
        }
        int v56 = v7 + 16;
        *((_DWORD *)a5 + v53 + 3) = HIWORD(v54) | ((v43 & 1) << 16);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 16));
        }
        int v58 = v7 + 17;
        *((_DWORD *)a5 + v56 + 3) = (v54 >> 31) & 0x1FFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 17));
        }
        int v60 = v10 + 5;
        *((_DWORD *)a5 + v58 + 3) = (v54 >> 14) & 0x1FFFF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 5));
        }
        int v62 = v7 + 18;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 18));
        }
        int v65 = v7 + 19;
        *((_DWORD *)a5 + v62 + 3) = (v63 >> 61) & 7 | (8 * (v54 & 0x3FFF));
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 19));
        }
        int v67 = v7 + 20;
        *((_DWORD *)a5 + v65 + 3) = (v63 >> 44) & 0x1FFFF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 20));
        }
        int v69 = v7 + 21;
        *((_DWORD *)a5 + v67 + 3) = (v63 >> 27) & 0x1FFFF;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 21));
        }
        int v71 = v10 + 6;
        *((_DWORD *)a5 + v69 + 3) = (v63 >> 10) & 0x1FFFF;
        uint64_t v72 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v10 + 6));
        }
        int v73 = v7 + 22;
        unint64_t v74 = *((void *)a3 + v71 + 2);
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v73 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 22));
        }
        int v76 = v7 + 23;
        *((_DWORD *)a5 + v73 + 3) = (v74 >> 57) & 0x7F | ((v63 & 0x3FF) << 7);
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 23));
        }
        int v78 = v7 + 24;
        *((_DWORD *)a5 + v76 + 3) = (v74 >> 40) & 0x1FFFF;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 24));
        }
        int v80 = v7 + 25;
        *((_DWORD *)a5 + v78 + 3) = (v74 >> 23) & 0x1FFFF;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 25));
        }
        int v82 = v10 + 7;
        *((_DWORD *)a5 + v80 + 3) = (v74 >> 6) & 0x1FFFF;
        uint64_t v83 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v10 + 7));
        }
        int v84 = v7 + 26;
        unint64_t v85 = *((void *)a3 + v82 + 2);
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v84 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 26));
        }
        int v87 = v7 + 27;
        *((_DWORD *)a5 + v84 + 3) = (v85 >> 53) & 0x7FF | ((v74 & 0x3F) << 11);
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 27));
        }
        int v89 = v7 + 28;
        *((_DWORD *)a5 + v87 + 3) = (v85 >> 36) & 0x1FFFF;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 28));
        }
        int v91 = v7 + 29;
        *((_DWORD *)a5 + v89 + 3) = (v85 >> 19) & 0x1FFFF;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 29));
        }
        int v93 = v10 + 8;
        *((_DWORD *)a5 + v91 + 3) = (v85 >> 2) & 0x1FFFF;
        uint64_t v94 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v10 + 8));
        }
        int v95 = v7 + 30;
        unint64_t v96 = *((void *)a3 + v93 + 2);
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v95 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 30));
        }
        int v98 = v7 + 31;
        *((_DWORD *)a5 + v95 + 3) = (v96 >> 49) & 0x7FFF | ((v85 & 3) << 15);
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 31));
        }
        int v100 = v7 + 32;
        *((_DWORD *)a5 + v98 + 3) = HIDWORD(v96) & 0x1FFFF;
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 32));
        }
        int v102 = v10 + 9;
        *((_DWORD *)a5 + v100 + 3) = v96 >> 15;
        uint64_t v103 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v10 + 9));
        }
        int v104 = v7 + 33;
        unint64_t v105 = *((void *)a3 + v102 + 2);
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v104 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 33));
        }
        int v107 = v7 + 34;
        *((_DWORD *)a5 + v104 + 3) = (v105 >> 62) & 3 | (4 * (v96 & 0x7FFF));
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 34));
        }
        int v109 = v7 + 35;
        *((_DWORD *)a5 + v107 + 3) = (v105 >> 45) & 0x1FFFF;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 35));
        }
        int v111 = v7 + 36;
        *((_DWORD *)a5 + v109 + 3) = (v105 >> 28) & 0x1FFFF;
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 36));
        }
        int v113 = v10 + 10;
        *((_DWORD *)a5 + v111 + 3) = (v105 >> 11) & 0x1FFFF;
        uint64_t v114 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v10 + 10));
        }
        int v115 = v7 + 37;
        unint64_t v116 = *((void *)a3 + v113 + 2);
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v115 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 37));
        }
        int v118 = v7 + 38;
        *((_DWORD *)a5 + v115 + 3) = (v116 >> 58) & 0x3F | ((v105 & 0x7FF) << 6);
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 38));
        }
        int v120 = v7 + 39;
        *((_DWORD *)a5 + v118 + 3) = (v116 >> 41) & 0x1FFFF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 39));
        }
        int v122 = v7 + 40;
        *((_DWORD *)a5 + v120 + 3) = (v116 >> 24) & 0x1FFFF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 40));
        }
        int v124 = v10 + 11;
        *((_DWORD *)a5 + v122 + 3) = (v116 >> 7) & 0x1FFFF;
        uint64_t v125 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v10 + 11));
        }
        int v126 = v7 + 41;
        unint64_t v127 = *((void *)a3 + v124 + 2);
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v126 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 41));
        }
        int v129 = v7 + 42;
        *((_DWORD *)a5 + v126 + 3) = (v127 >> 54) & 0x3FF | ((v116 & 0x7F) << 10);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 42));
        }
        int v131 = v7 + 43;
        *((_DWORD *)a5 + v129 + 3) = (v127 >> 37) & 0x1FFFF;
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 43));
        }
        int v133 = v7 + 44;
        *((_DWORD *)a5 + v131 + 3) = (v127 >> 20) & 0x1FFFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 44));
        }
        int v135 = v10 + 12;
        *((_DWORD *)a5 + v133 + 3) = (v127 >> 3) & 0x1FFFF;
        uint64_t v136 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v10 + 12));
        }
        int v137 = v7 + 45;
        unint64_t v138 = *((void *)a3 + v135 + 2);
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v137 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 45));
        }
        int v140 = v7 + 46;
        *((_DWORD *)a5 + v137 + 3) = (v138 >> 50) & 0x3FFF | ((v127 & 7) << 14);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 46));
        }
        int v142 = v7 + 47;
        *((_DWORD *)a5 + v140 + 3) = (v138 >> 33) & 0x1FFFF;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 47));
        }
        int v144 = v10 + 13;
        *((_DWORD *)a5 + v142 + 3) = (v138 >> 16) & 0x1FFFF;
        uint64_t v145 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v10 + 13));
        }
        int v146 = v7 + 48;
        unint64_t v147 = *((void *)a3 + v144 + 2);
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v146 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 48));
        }
        int v149 = v7 + 49;
        *((_DWORD *)a5 + v146 + 3) = (v147 >> 63) | (2 * (unsigned __int16)v138);
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 49));
        }
        int v151 = v7 + 50;
        *((_DWORD *)a5 + v149 + 3) = (v147 >> 46) & 0x1FFFF;
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v151 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 50));
        }
        int v153 = v7 + 51;
        *((_DWORD *)a5 + v151 + 3) = (v147 >> 29) & 0x1FFFF;
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 51));
        }
        int v155 = v10 + 14;
        *((_DWORD *)a5 + v153 + 3) = (v147 >> 12) & 0x1FFFF;
        uint64_t v156 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v10 + 14));
        }
        int v157 = v7 + 52;
        unint64_t v158 = *((void *)a3 + v155 + 2);
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v157 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 52));
        }
        int v160 = v7 + 53;
        *((_DWORD *)a5 + v157 + 3) = (v158 >> 59) & 0x1F | (32 * (v147 & 0xFFF));
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 53));
        }
        int v162 = v7 + 54;
        *((_DWORD *)a5 + v160 + 3) = (v158 >> 42) & 0x1FFFF;
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 54));
        }
        int v164 = v7 + 55;
        *((_DWORD *)a5 + v162 + 3) = (v158 >> 25) & 0x1FFFF;
        uint64_t v165 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v164 >= (int)v165) {
          IOSArray_throwOutOfBoundsWithMsg(v165, (v7 + 55));
        }
        int v166 = v10 + 15;
        *((_DWORD *)a5 + v164 + 3) = (v158 >> 8) & 0x1FFFF;
        uint64_t v167 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v166 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v10 + 15));
        }
        int v168 = v7 + 56;
        unint64_t v169 = *((void *)a3 + v166 + 2);
        uint64_t v170 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v168 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v7 + 56));
        }
        int v171 = v7 + 57;
        *((_DWORD *)a5 + v168 + 3) = (v169 >> 55) & 0x1FF | (v158 << 9);
        uint64_t v172 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v171 >= (int)v172) {
          IOSArray_throwOutOfBoundsWithMsg(v172, (v7 + 57));
        }
        int v173 = v7 + 58;
        *((_DWORD *)a5 + v171 + 3) = (v169 >> 38) & 0x1FFFF;
        uint64_t v174 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v173 >= (int)v174) {
          IOSArray_throwOutOfBoundsWithMsg(v174, (v7 + 58));
        }
        int v175 = v7 + 59;
        *((_DWORD *)a5 + v173 + 3) = (v169 >> 21) & 0x1FFFF;
        uint64_t v176 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v175 >= (int)v176) {
          IOSArray_throwOutOfBoundsWithMsg(v176, (v7 + 59));
        }
        int v177 = v10 + 16;
        *((_DWORD *)a5 + v175 + 3) = (v169 >> 4) & 0x1FFFF;
        uint64_t v178 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v177 >= (int)v178) {
          IOSArray_throwOutOfBoundsWithMsg(v178, (v10 + 16));
        }
        int v179 = v7 + 60;
        unint64_t v180 = *((void *)a3 + v177 + 2);
        uint64_t v181 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v179 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v7 + 60));
        }
        int v182 = v7 + 61;
        *((_DWORD *)a5 + v179 + 3) = (v180 >> 51) & 0x1FFF | ((v169 & 0xF) << 13);
        uint64_t v183 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v182 >= (int)v183) {
          IOSArray_throwOutOfBoundsWithMsg(v183, (v7 + 61));
        }
        int v184 = v7 + 62;
        *((_DWORD *)a5 + v182 + 3) = (v180 >> 34) & 0x1FFFF;
        uint64_t v185 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v184 >= (int)v185) {
          IOSArray_throwOutOfBoundsWithMsg(v185, (v7 + 62));
        }
        int v186 = v7 + 63;
        *((_DWORD *)a5 + v184 + 3) = (v180 >> 17) & 0x1FFFF;
        uint64_t v187 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v186 >= (int)v187) {
          IOSArray_throwOutOfBoundsWithMsg(v187, (v7 + 63));
        }
        a4 = v10 + 17;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v186 + 3) = v180 & 0x1FFFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 9) | (2 * v13) | (v14 >> 7);
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
        *((_DWORD *)a5 + v20 + 3) = ((v14 & 0x7F) << 10) | (4 * v19) | (v21 >> 6);
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
        *((_DWORD *)a5 + v27 + 3) = ((v21 & 0x3F) << 11) | (8 * v26) | (v28 >> 5);
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
        unsigned int v35 = *((unsigned __int8 *)a3 + v32 + 12);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 3));
        }
        int v37 = v9 + 9;
        *((_DWORD *)a5 + v34 + 3) = ((v28 & 0x1F) << 12) | (16 * v33) | (v35 >> 4);
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 9));
        }
        int v39 = v9 + 10;
        int v40 = *((unsigned __int8 *)a3 + v37 + 12);
        if (v9 + 10 < 0 || v39 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 10));
        }
        int v41 = v7 + 4;
        unsigned int v42 = *((unsigned __int8 *)a3 + v39 + 12);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 4));
        }
        int v44 = v9 + 11;
        *((_DWORD *)a5 + v41 + 3) = ((v35 & 0xF) << 13) | (32 * v40) | (v42 >> 3);
        uint64_t v45 = *((unsigned int *)a3 + 2);
        if (v9 + 11 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 11));
        }
        int v46 = v9 + 12;
        int v47 = *((unsigned __int8 *)a3 + v44 + 12);
        if (v9 + 12 < 0 || v46 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 12));
        }
        int v48 = v7 + 5;
        unsigned int v49 = *((unsigned __int8 *)a3 + v46 + 12);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v48 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 5));
        }
        int v51 = v9 + 13;
        *((_DWORD *)a5 + v48 + 3) = ((v42 & 7) << 14) | (v47 << 6) | (v49 >> 2);
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v9 + 13 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 13));
        }
        int v53 = v9 + 14;
        int v54 = *((unsigned __int8 *)a3 + v51 + 12);
        if (v9 + 14 < 0 || v53 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 14));
        }
        int v55 = v7 + 6;
        unsigned int v56 = *((unsigned __int8 *)a3 + v53 + 12);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v55 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 6));
        }
        int v58 = v9 + 15;
        *((_DWORD *)a5 + v55 + 3) = ((v49 & 3) << 15) | (v54 << 7) | (v56 >> 1);
        uint64_t v59 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v9 + 15));
        }
        int v60 = v9 + 16;
        int v61 = *((unsigned __int8 *)a3 + v58 + 12);
        if (v9 + 16 < 0 || v60 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v9 + 16));
        }
        int v62 = v7 + 7;
        int v63 = *((unsigned __int8 *)a3 + v60 + 12);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 7));
        }
        *((_DWORD *)a5 + v62 + 3) = ((v56 & 1) << 16) | (v61 << 8) | v63;
        a4 = v9 + 17;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 47;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 30) & 0x1FFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = a4 + 1;
        *((void *)a5 + v16 + 2) = (v12 >> 13) & 0x1FFFF;
        uint64_t v19 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (a4 + 1));
        }
        int v20 = v7 + 3;
        unint64_t v21 = *((void *)a3 + v18 + 2);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v20 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v7 + 3));
        }
        int v23 = v7 + 4;
        *((void *)a5 + v20 + 2) = (v21 >> 60) & 0xFFFFFFFFFFFE000FLL | (16 * (v12 & 0x1FFF));
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((void *)a5 + v23 + 2) = (v21 >> 43) & 0x1FFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((void *)a5 + v25 + 2) = (v21 >> 26) & 0x1FFFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v10 + 2;
        *((void *)a5 + v27 + 2) = (v21 >> 9) & 0x1FFFF;
        uint64_t v30 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v10 + 2));
        }
        int v31 = v7 + 7;
        unint64_t v32 = *((void *)a3 + v29 + 2);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v7 + 8;
        *((void *)a5 + v31 + 2) = HIBYTE(v32) & 0xFFFFFFFFFFFE00FFLL | ((v21 & 0x1FF) << 8);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v7 + 9;
        *((void *)a5 + v34 + 2) = (v32 >> 39) & 0x1FFFF;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((void *)a5 + v36 + 2) = (v32 >> 22) & 0x1FFFF;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v10 + 3;
        *((void *)a5 + v38 + 2) = (v32 >> 5) & 0x1FFFF;
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v10 + 3));
        }
        int v42 = v7 + 11;
        unint64_t v43 = *((void *)a3 + v40 + 2);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v7 + 12;
        *((void *)a5 + v42 + 2) = (v43 >> 52) & 0xFFFFFFFFFFFE0FFFLL | ((v32 & 0x1F) << 12);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v7 + 13;
        *((void *)a5 + v45 + 2) = (v43 >> 35) & 0x1FFFF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v7 + 14;
        *((void *)a5 + v47 + 2) = (v43 >> 18) & 0x1FFFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v10 + 4;
        *((void *)a5 + v49 + 2) = (v43 >> 1) & 0x1FFFF;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 4));
        }
        int v53 = v7 + 15;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 15));
        }
        int v56 = v7 + 16;
        *((void *)a5 + v53 + 2) = HIWORD(v54) & 0xFFFFFFFFFFFEFFFFLL | ((v43 & 1) << 16);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 16));
        }
        int v58 = v7 + 17;
        *((void *)a5 + v56 + 2) = (v54 >> 31) & 0x1FFFF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 17));
        }
        int v60 = v10 + 5;
        *((void *)a5 + v58 + 2) = (v54 >> 14) & 0x1FFFF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 5));
        }
        int v62 = v7 + 18;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 18));
        }
        unint64_t v65 = (v63 >> 61) & 0xFFFFFFFFFFFE0007 | (8 * (v54 & 0x3FFF));
        int v66 = v7 + 19;
        *((void *)a5 + v62 + 2) = v65;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 19));
        }
        int v68 = v7 + 20;
        *((void *)a5 + v66 + 2) = (v63 >> 44) & 0x1FFFF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 20));
        }
        int v70 = v7 + 21;
        *((void *)a5 + v68 + 2) = (v63 >> 27) & 0x1FFFF;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 21));
        }
        int v72 = v10 + 6;
        *((void *)a5 + v70 + 2) = (v63 >> 10) & 0x1FFFF;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 6));
        }
        int v74 = v7 + 22;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 22));
        }
        int v77 = v7 + 23;
        *((void *)a5 + v74 + 2) = (v75 >> 57) & 0xFFFFFFFFFFFE007FLL | ((v63 & 0x3FF) << 7);
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 23));
        }
        int v79 = v7 + 24;
        *((void *)a5 + v77 + 2) = (v75 >> 40) & 0x1FFFF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 24));
        }
        int v81 = v7 + 25;
        *((void *)a5 + v79 + 2) = (v75 >> 23) & 0x1FFFF;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 25));
        }
        int v83 = v10 + 7;
        *((void *)a5 + v81 + 2) = (v75 >> 6) & 0x1FFFF;
        uint64_t v84 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v10 + 7));
        }
        int v85 = v7 + 26;
        unint64_t v86 = *((void *)a3 + v83 + 2);
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v85 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 26));
        }
        int v88 = v7 + 27;
        *((void *)a5 + v85 + 2) = (v86 >> 53) & 0xFFFFFFFFFFFE07FFLL | ((v75 & 0x3F) << 11);
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 27));
        }
        int v90 = v7 + 28;
        *((void *)a5 + v88 + 2) = (v86 >> 36) & 0x1FFFF;
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 28));
        }
        int v92 = v7 + 29;
        *((void *)a5 + v90 + 2) = (v86 >> 19) & 0x1FFFF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 29));
        }
        int v94 = v10 + 8;
        *((void *)a5 + v92 + 2) = (v86 >> 2) & 0x1FFFF;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 8));
        }
        int v96 = v7 + 30;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 30));
        }
        int v99 = v7 + 31;
        *((void *)a5 + v96 + 2) = (v97 >> 49) & 0xFFFFFFFFFFFE7FFFLL | ((v86 & 3) << 15);
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 31));
        }
        int v101 = v7 + 32;
        *((void *)a5 + v99 + 2) = HIDWORD(v97) & 0x1FFFF;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 32));
        }
        int v103 = v10 + 9;
        *((void *)a5 + v101 + 2) = v97 >> 15;
        uint64_t v104 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v10 + 9));
        }
        int v105 = v7 + 33;
        unint64_t v106 = *((void *)a3 + v103 + 2);
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v105 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 33));
        }
        unint64_t v108 = (v106 >> 62) & 0xFFFFFFFFFFFE0003 | (4 * (v97 & 0x7FFF));
        int v109 = v7 + 34;
        *((void *)a5 + v105 + 2) = v108;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 34));
        }
        int v111 = v7 + 35;
        *((void *)a5 + v109 + 2) = (v106 >> 45) & 0x1FFFF;
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 35));
        }
        int v113 = v7 + 36;
        *((void *)a5 + v111 + 2) = (v106 >> 28) & 0x1FFFF;
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 36));
        }
        int v115 = v10 + 10;
        *((void *)a5 + v113 + 2) = (v106 >> 11) & 0x1FFFF;
        uint64_t v116 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v10 + 10));
        }
        int v117 = v7 + 37;
        unint64_t v118 = *((void *)a3 + v115 + 2);
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v117 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 37));
        }
        int v120 = v7 + 38;
        *((void *)a5 + v117 + 2) = (v118 >> 58) & 0xFFFFFFFFFFFE003FLL | ((v106 & 0x7FF) << 6);
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 38));
        }
        int v122 = v7 + 39;
        *((void *)a5 + v120 + 2) = (v118 >> 41) & 0x1FFFF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 39));
        }
        int v124 = v7 + 40;
        *((void *)a5 + v122 + 2) = (v118 >> 24) & 0x1FFFF;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 40));
        }
        int v126 = v10 + 11;
        *((void *)a5 + v124 + 2) = (v118 >> 7) & 0x1FFFF;
        uint64_t v127 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v10 + 11));
        }
        int v128 = v7 + 41;
        unint64_t v129 = *((void *)a3 + v126 + 2);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v128 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 41));
        }
        int v131 = v7 + 42;
        *((void *)a5 + v128 + 2) = (v129 >> 54) & 0xFFFFFFFFFFFE03FFLL | ((v118 & 0x7F) << 10);
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 42));
        }
        int v133 = v7 + 43;
        *((void *)a5 + v131 + 2) = (v129 >> 37) & 0x1FFFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 43));
        }
        int v135 = v7 + 44;
        *((void *)a5 + v133 + 2) = (v129 >> 20) & 0x1FFFF;
        uint64_t v136 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v7 + 44));
        }
        int v137 = v10 + 12;
        *((void *)a5 + v135 + 2) = (v129 >> 3) & 0x1FFFF;
        uint64_t v138 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v137 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v10 + 12));
        }
        int v139 = v7 + 45;
        unint64_t v140 = *((void *)a3 + v137 + 2);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v139 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 45));
        }
        int v142 = v7 + 46;
        *((void *)a5 + v139 + 2) = (v140 >> 50) & 0xFFFFFFFFFFFE3FFFLL | ((v129 & 7) << 14);
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 46));
        }
        int v144 = v7 + 47;
        *((void *)a5 + v142 + 2) = (v140 >> 33) & 0x1FFFF;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 47));
        }
        int v146 = v10 + 13;
        *((void *)a5 + v144 + 2) = (v140 >> 16) & 0x1FFFF;
        uint64_t v147 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v10 + 13));
        }
        int v148 = v7 + 48;
        unint64_t v149 = *((void *)a3 + v146 + 2);
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v148 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 48));
        }
        uint64_t v151 = (v149 >> 63) | (2 * (unsigned __int16)v140);
        int v152 = v7 + 49;
        *((void *)a5 + v148 + 2) = v151;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 49));
        }
        int v154 = v7 + 50;
        *((void *)a5 + v152 + 2) = (v149 >> 46) & 0x1FFFF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 50));
        }
        int v156 = v7 + 51;
        *((void *)a5 + v154 + 2) = (v149 >> 29) & 0x1FFFF;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 51));
        }
        int v158 = v10 + 14;
        *((void *)a5 + v156 + 2) = (v149 >> 12) & 0x1FFFF;
        uint64_t v159 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v10 + 14));
        }
        int v160 = v7 + 52;
        unint64_t v161 = *((void *)a3 + v158 + 2);
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v160 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 52));
        }
        int v163 = v7 + 53;
        *((void *)a5 + v160 + 2) = (v161 >> 59) & 0xFFFFFFFFFFFE001FLL | (32 * (v149 & 0xFFF));
        uint64_t v164 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v7 + 53));
        }
        int v165 = v7 + 54;
        *((void *)a5 + v163 + 2) = (v161 >> 42) & 0x1FFFF;
        uint64_t v166 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v165 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v7 + 54));
        }
        int v167 = v7 + 55;
        *((void *)a5 + v165 + 2) = (v161 >> 25) & 0x1FFFF;
        uint64_t v168 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v167 >= (int)v168) {
          IOSArray_throwOutOfBoundsWithMsg(v168, (v7 + 55));
        }
        int v169 = v10 + 15;
        *((void *)a5 + v167 + 2) = (v161 >> 8) & 0x1FFFF;
        uint64_t v170 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v169 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v10 + 15));
        }
        int v171 = v7 + 56;
        unint64_t v172 = *((void *)a3 + v169 + 2);
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v171 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 56));
        }
        int v174 = v7 + 57;
        *((void *)a5 + v171 + 2) = (v172 >> 55) & 0xFFFFFFFFFFFE01FFLL | ((unint64_t)v161 << 9);
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 57));
        }
        int v176 = v7 + 58;
        *((void *)a5 + v174 + 2) = (v172 >> 38) & 0x1FFFF;
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v176 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 58));
        }
        int v178 = v7 + 59;
        *((void *)a5 + v176 + 2) = (v172 >> 21) & 0x1FFFF;
        uint64_t v179 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v7 + 59));
        }
        int v180 = v10 + 16;
        *((void *)a5 + v178 + 2) = (v172 >> 4) & 0x1FFFF;
        uint64_t v181 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v180 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v10 + 16));
        }
        int v182 = v7 + 60;
        unint64_t v183 = *((void *)a3 + v180 + 2);
        uint64_t v184 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v182 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v7 + 60));
        }
        int v185 = v7 + 61;
        *((void *)a5 + v182 + 2) = (v183 >> 51) & 0xFFFFFFFFFFFE1FFFLL | ((v172 & 0xF) << 13);
        uint64_t v186 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v185 >= (int)v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, (v7 + 61));
        }
        int v187 = v7 + 62;
        *((void *)a5 + v185 + 2) = (v183 >> 34) & 0x1FFFF;
        uint64_t v188 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v187 >= (int)v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, (v7 + 62));
        }
        int v189 = v7 + 63;
        *((void *)a5 + v187 + 2) = (v183 >> 17) & 0x1FFFF;
        uint64_t v190 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v189 >= (int)v190) {
          IOSArray_throwOutOfBoundsWithMsg(v190, (v7 + 63));
        }
        a4 = v10 + 17;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v189 + 2) = v183 & 0x1FFFF;
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
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 9) | (2 * v13) | (v14 >> 7);
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
        *((void *)a5 + v20 + 2) = ((v14 & 0x7F) << 10) | (4 * v19) | (v21 >> 6);
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
        *((void *)a5 + v27 + 2) = ((v21 & 0x3F) << 11) | (8 * v26) | (v28 >> 5);
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
        unint64_t v35 = *((unsigned __int8 *)a3 + v32 + 12);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v34 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 3));
        }
        int v37 = v9 + 9;
        *((void *)a5 + v34 + 2) = ((v28 & 0x1F) << 12) | (16 * v33) | (v35 >> 4);
        uint64_t v38 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 9));
        }
        int v39 = v9 + 10;
        uint64_t v40 = *((unsigned __int8 *)a3 + v37 + 12);
        if (v9 + 10 < 0 || v39 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v9 + 10));
        }
        int v41 = v7 + 4;
        unint64_t v42 = *((unsigned __int8 *)a3 + v39 + 12);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 4));
        }
        int v44 = v9 + 11;
        *((void *)a5 + v41 + 2) = ((v35 & 0xF) << 13) | (32 * v40) | (v42 >> 3);
        uint64_t v45 = *((unsigned int *)a3 + 2);
        if (v9 + 11 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 11));
        }
        int v46 = v9 + 12;
        uint64_t v47 = *((unsigned __int8 *)a3 + v44 + 12);
        if (v9 + 12 < 0 || v46 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 12));
        }
        int v48 = v7 + 5;
        unint64_t v49 = *((unsigned __int8 *)a3 + v46 + 12);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v48 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 5));
        }
        int v51 = v9 + 13;
        *((void *)a5 + v48 + 2) = ((v42 & 7) << 14) | (v47 << 6) | (v49 >> 2);
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v9 + 13 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 13));
        }
        int v53 = v9 + 14;
        uint64_t v54 = *((unsigned __int8 *)a3 + v51 + 12);
        if (v9 + 14 < 0 || v53 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v9 + 14));
        }
        int v55 = v7 + 6;
        unint64_t v56 = *((unsigned __int8 *)a3 + v53 + 12);
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v55 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 6));
        }
        int v58 = v9 + 15;
        *((void *)a5 + v55 + 2) = ((v49 & 3) << 15) | (v54 << 7) | (v56 >> 1);
        uint64_t v59 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v9 + 15));
        }
        int v60 = v9 + 16;
        uint64_t v61 = *((unsigned __int8 *)a3 + v58 + 12);
        if (v9 + 16 < 0 || v60 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v9 + 16));
        }
        int v62 = v7 + 7;
        uint64_t v63 = *((unsigned __int8 *)a3 + v60 + 12);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 7));
        }
        *((void *)a5 + v62 + 2) = ((v56 & 1) << 16) | (v61 << 8) | v63;
        a4 = v9 + 17;
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