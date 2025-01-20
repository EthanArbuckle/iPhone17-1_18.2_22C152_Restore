@interface OrgApacheLuceneUtilPackedBulkOperationPacked21
- (OrgApacheLuceneUtilPackedBulkOperationPacked21)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked21

- (OrgApacheLuceneUtilPackedBulkOperationPacked21)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 43;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 22) & 0x1FFFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        uint64_t v18 = (a4 + 1);
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 1) & 0x1FFFFF;
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
        *((_DWORD *)a5 + v20 + 3) = (v21 >> 44) & 0xFFEFFFFF | ((v12 & 1) << 20);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((_DWORD *)a5 + v23 + 3) = (v21 >> 23) & 0x1FFFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v10 + 2;
        *((_DWORD *)a5 + v25 + 3) = (v21 >> 2) & 0x1FFFFF;
        uint64_t v28 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v10 + 2));
        }
        int v29 = v7 + 6;
        unint64_t v30 = *((void *)a3 + v27 + 2);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 6));
        }
        int v32 = v7 + 7;
        *((_DWORD *)a5 + v29 + 3) = (v30 >> 45) & 0xFFE7FFFF | ((v21 & 3) << 19);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v7 + 8;
        *((_DWORD *)a5 + v32 + 3) = (v30 >> 24) & 0x1FFFFF;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v10 + 3;
        *((_DWORD *)a5 + v34 + 3) = (v30 >> 3) & 0x1FFFFF;
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v10 + 3));
        }
        int v38 = v7 + 9;
        unint64_t v39 = *((void *)a3 + v36 + 2);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 9));
        }
        int v41 = v7 + 10;
        *((_DWORD *)a5 + v38 + 3) = (v39 >> 46) & 0xFFE3FFFF | ((v30 & 7) << 18);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 10));
        }
        int v43 = v7 + 11;
        *((_DWORD *)a5 + v41 + 3) = (v39 >> 25) & 0x1FFFFF;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v10 + 4;
        *((_DWORD *)a5 + v43 + 3) = (v39 >> 4) & 0x1FFFFF;
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v10 + 4));
        }
        int v47 = v7 + 12;
        unint64_t v48 = *((void *)a3 + v45 + 2);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 12));
        }
        int v50 = v7 + 13;
        *((_DWORD *)a5 + v47 + 3) = (v48 >> 47) & 0xFFE1FFFF | ((v39 & 0xF) << 17);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 13));
        }
        int v52 = v7 + 14;
        *((_DWORD *)a5 + v50 + 3) = (v48 >> 26) & 0x1FFFFF;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 14));
        }
        int v54 = v10 + 5;
        *((_DWORD *)a5 + v52 + 3) = (v48 >> 5) & 0x1FFFFF;
        uint64_t v55 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v10 + 5));
        }
        int v56 = v7 + 15;
        unint64_t v57 = *((void *)a3 + v54 + 2);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v56 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 15));
        }
        int v59 = v7 + 16;
        *((_DWORD *)a5 + v56 + 3) = HIWORD(v57) | ((v48 & 0x1F) << 16);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 16));
        }
        int v61 = v7 + 17;
        *((_DWORD *)a5 + v59 + 3) = (v57 >> 27) & 0x1FFFFF;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 17));
        }
        int v63 = v10 + 6;
        *((_DWORD *)a5 + v61 + 3) = (v57 >> 6) & 0x1FFFFF;
        uint64_t v64 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v10 + 6));
        }
        int v65 = v7 + 18;
        unint64_t v66 = *((void *)a3 + v63 + 2);
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v65 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 18));
        }
        int v68 = v7 + 19;
        *((_DWORD *)a5 + v65 + 3) = (v66 >> 49) & 0x7FFF | ((v57 & 0x3F) << 15);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 19));
        }
        int v70 = v7 + 20;
        *((_DWORD *)a5 + v68 + 3) = (v66 >> 28) & 0x1FFFFF;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 20));
        }
        int v72 = v10 + 7;
        *((_DWORD *)a5 + v70 + 3) = (v66 >> 7) & 0x1FFFFF;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 7));
        }
        int v74 = v7 + 21;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 21));
        }
        int v77 = v7 + 22;
        *((_DWORD *)a5 + v74 + 3) = (v75 >> 50) & 0x3FFF | ((v66 & 0x7F) << 14);
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 22));
        }
        int v79 = v7 + 23;
        *((_DWORD *)a5 + v77 + 3) = (v75 >> 29) & 0x1FFFFF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 23));
        }
        int v81 = v10 + 8;
        *((_DWORD *)a5 + v79 + 3) = (v75 >> 8) & 0x1FFFFF;
        uint64_t v82 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v10 + 8));
        }
        int v83 = v7 + 24;
        unint64_t v84 = *((void *)a3 + v81 + 2);
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v83 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 24));
        }
        int v86 = v7 + 25;
        *((_DWORD *)a5 + v83 + 3) = (v84 >> 51) & 0x1FFF | (v75 << 13);
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 25));
        }
        int v88 = v7 + 26;
        *((_DWORD *)a5 + v86 + 3) = (v84 >> 30) & 0x1FFFFF;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 26));
        }
        int v90 = v10 + 9;
        *((_DWORD *)a5 + v88 + 3) = (v84 >> 9) & 0x1FFFFF;
        uint64_t v91 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v10 + 9));
        }
        int v92 = v7 + 27;
        unint64_t v93 = *((void *)a3 + v90 + 2);
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v92 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 27));
        }
        int v95 = v7 + 28;
        *((_DWORD *)a5 + v92 + 3) = (v93 >> 52) & 0xFFF | ((v84 & 0x1FF) << 12);
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 28));
        }
        int v97 = v7 + 29;
        *((_DWORD *)a5 + v95 + 3) = (v93 >> 31) & 0x1FFFFF;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 29));
        }
        int v99 = v10 + 10;
        *((_DWORD *)a5 + v97 + 3) = (v93 >> 10) & 0x1FFFFF;
        uint64_t v100 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v10 + 10));
        }
        int v101 = v7 + 30;
        unint64_t v102 = *((void *)a3 + v99 + 2);
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v101 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 30));
        }
        int v104 = v7 + 31;
        *((_DWORD *)a5 + v101 + 3) = (v102 >> 53) & 0x7FF | ((v93 & 0x3FF) << 11);
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 31));
        }
        int v106 = v7 + 32;
        *((_DWORD *)a5 + v104 + 3) = HIDWORD(v102) & 0x1FFFFF;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 32));
        }
        int v108 = v10 + 11;
        *((_DWORD *)a5 + v106 + 3) = v102 >> 11;
        uint64_t v109 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v10 + 11));
        }
        int v110 = v7 + 33;
        unint64_t v111 = *((void *)a3 + v108 + 2);
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v110 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 33));
        }
        int v113 = v7 + 34;
        *((_DWORD *)a5 + v110 + 3) = (v111 >> 54) & 0x3FF | ((v102 & 0x7FF) << 10);
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 34));
        }
        int v115 = v7 + 35;
        *((_DWORD *)a5 + v113 + 3) = (v111 >> 33) & 0x1FFFFF;
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 35));
        }
        int v117 = v10 + 12;
        *((_DWORD *)a5 + v115 + 3) = (v111 >> 12) & 0x1FFFFF;
        uint64_t v118 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v10 + 12));
        }
        int v119 = v7 + 36;
        unint64_t v120 = *((void *)a3 + v117 + 2);
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v119 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 36));
        }
        int v122 = v7 + 37;
        *((_DWORD *)a5 + v119 + 3) = (v120 >> 55) & 0x1FF | ((v111 & 0xFFF) << 9);
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 37));
        }
        int v124 = v7 + 38;
        *((_DWORD *)a5 + v122 + 3) = (v120 >> 34) & 0x1FFFFF;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 38));
        }
        int v126 = v10 + 13;
        *((_DWORD *)a5 + v124 + 3) = (v120 >> 13) & 0x1FFFFF;
        uint64_t v127 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v10 + 13));
        }
        int v128 = v7 + 39;
        unint64_t v129 = *((void *)a3 + v126 + 2);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v128 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 39));
        }
        int v131 = v7 + 40;
        *((_DWORD *)a5 + v128 + 3) = HIBYTE(v129) | ((v120 & 0x1FFF) << 8);
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 40));
        }
        int v133 = v7 + 41;
        *((_DWORD *)a5 + v131 + 3) = (v129 >> 35) & 0x1FFFFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 41));
        }
        int v135 = v10 + 14;
        *((_DWORD *)a5 + v133 + 3) = (v129 >> 14) & 0x1FFFFF;
        uint64_t v136 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v10 + 14));
        }
        int v137 = v7 + 42;
        unint64_t v138 = *((void *)a3 + v135 + 2);
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v137 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 42));
        }
        int v140 = v7 + 43;
        *((_DWORD *)a5 + v137 + 3) = (v138 >> 57) & 0x7F | ((v129 & 0x3FFF) << 7);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 43));
        }
        int v142 = v7 + 44;
        *((_DWORD *)a5 + v140 + 3) = (v138 >> 36) & 0x1FFFFF;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 44));
        }
        int v144 = v10 + 15;
        *((_DWORD *)a5 + v142 + 3) = (v138 >> 15) & 0x1FFFFF;
        uint64_t v145 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v10 + 15));
        }
        int v146 = v7 + 45;
        unint64_t v147 = *((void *)a3 + v144 + 2);
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v146 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 45));
        }
        int v149 = v7 + 46;
        *((_DWORD *)a5 + v146 + 3) = (v147 >> 58) & 0x3F | ((v138 & 0x7FFF) << 6);
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 46));
        }
        int v151 = v7 + 47;
        *((_DWORD *)a5 + v149 + 3) = (v147 >> 37) & 0x1FFFFF;
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v151 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 47));
        }
        int v153 = v10 + 16;
        *((_DWORD *)a5 + v151 + 3) = (v147 >> 16) & 0x1FFFFF;
        uint64_t v154 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v10 + 16));
        }
        int v155 = v7 + 48;
        unint64_t v156 = *((void *)a3 + v153 + 2);
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v155 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 48));
        }
        int v158 = v7 + 49;
        *((_DWORD *)a5 + v155 + 3) = (v156 >> 59) & 0x1F | (32 * (unsigned __int16)v147);
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 49));
        }
        int v160 = v7 + 50;
        *((_DWORD *)a5 + v158 + 3) = (v156 >> 38) & 0x1FFFFF;
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 50));
        }
        int v162 = v10 + 17;
        *((_DWORD *)a5 + v160 + 3) = (v156 >> 17) & 0x1FFFFF;
        uint64_t v163 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v10 + 17));
        }
        int v164 = v7 + 51;
        unint64_t v165 = *((void *)a3 + v162 + 2);
        uint64_t v166 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v164 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v7 + 51));
        }
        int v167 = v7 + 52;
        *((_DWORD *)a5 + v164 + 3) = (v165 >> 60) & 0xF | (16 * (v156 & 0x1FFFF));
        uint64_t v168 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v167 >= (int)v168) {
          IOSArray_throwOutOfBoundsWithMsg(v168, (v7 + 52));
        }
        int v169 = v7 + 53;
        *((_DWORD *)a5 + v167 + 3) = (v165 >> 39) & 0x1FFFFF;
        uint64_t v170 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v169 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v7 + 53));
        }
        int v171 = v10 + 18;
        *((_DWORD *)a5 + v169 + 3) = (v165 >> 18) & 0x1FFFFF;
        uint64_t v172 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v171 >= (int)v172) {
          IOSArray_throwOutOfBoundsWithMsg(v172, (v10 + 18));
        }
        int v173 = v7 + 54;
        unint64_t v174 = *((void *)a3 + v171 + 2);
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v173 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 54));
        }
        int v176 = v7 + 55;
        *((_DWORD *)a5 + v173 + 3) = (v174 >> 61) & 7 | (8 * (v165 & 0x3FFFF));
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v176 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 55));
        }
        int v178 = v7 + 56;
        *((_DWORD *)a5 + v176 + 3) = (v174 >> 40) & 0x1FFFFF;
        uint64_t v179 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v7 + 56));
        }
        int v180 = v10 + 19;
        *((_DWORD *)a5 + v178 + 3) = (v174 >> 19) & 0x1FFFFF;
        uint64_t v181 = *((unsigned int *)a3 + 2);
        if (v10 + 19 < 0 || v180 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v10 + 19));
        }
        int v182 = v7 + 57;
        unint64_t v183 = *((void *)a3 + v180 + 2);
        uint64_t v184 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v182 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v7 + 57));
        }
        int v185 = v7 + 58;
        *((_DWORD *)a5 + v182 + 3) = (v183 >> 62) & 3 | (4 * (v174 & 0x7FFFF));
        uint64_t v186 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v185 >= (int)v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, (v7 + 58));
        }
        int v187 = v7 + 59;
        *((_DWORD *)a5 + v185 + 3) = (v183 >> 41) & 0x1FFFFF;
        uint64_t v188 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v187 >= (int)v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, (v7 + 59));
        }
        int v189 = v10 + 20;
        *((_DWORD *)a5 + v187 + 3) = (v183 >> 20) & 0x1FFFFF;
        uint64_t v190 = *((unsigned int *)a3 + 2);
        if (v10 + 20 < 0 || v189 >= (int)v190) {
          IOSArray_throwOutOfBoundsWithMsg(v190, (v10 + 20));
        }
        int v191 = v7 + 60;
        unint64_t v192 = *((void *)a3 + v189 + 2);
        uint64_t v193 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v191 >= (int)v193) {
          IOSArray_throwOutOfBoundsWithMsg(v193, (v7 + 60));
        }
        int v194 = v7 + 61;
        *((_DWORD *)a5 + v191 + 3) = (v192 >> 63) | (2 * (v183 & 0xFFFFF));
        uint64_t v195 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v194 >= (int)v195) {
          IOSArray_throwOutOfBoundsWithMsg(v195, (v7 + 61));
        }
        int v196 = v7 + 62;
        *((_DWORD *)a5 + v194 + 3) = (v192 >> 42) & 0x1FFFFF;
        uint64_t v197 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v196 >= (int)v197) {
          IOSArray_throwOutOfBoundsWithMsg(v197, (v7 + 62));
        }
        int v198 = v7 + 63;
        *((_DWORD *)a5 + v196 + 3) = (v192 >> 21) & 0x1FFFFF;
        uint64_t v199 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v198 >= (int)v199) {
          IOSArray_throwOutOfBoundsWithMsg(v199, (v7 + 63));
        }
        a4 = v10 + 21;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v198 + 3) = v192 & 0x1FFFFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 13) | (32 * v13) | (v14 >> 3);
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
        *((_DWORD *)a5 + v22 + 3) = ((v14 & 7) << 18) | (v19 << 10) | (4 * v21) | (v23 >> 6);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 6));
        }
        int v27 = v9 + 7;
        int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 7));
        }
        int v29 = v7 + 2;
        unsigned int v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 2));
        }
        int v32 = v9 + 8;
        *((_DWORD *)a5 + v29 + 3) = ((v23 & 0x3F) << 15) | (v28 << 7) | (v30 >> 1);
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 8));
        }
        int v34 = v9 + 9;
        int v35 = *((unsigned __int8 *)a3 + v32 + 12);
        if (v9 + 9 < 0 || v34 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 9));
        }
        int v36 = v9 + 10;
        int v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 10));
        }
        int v38 = v7 + 3;
        unsigned int v39 = *((unsigned __int8 *)a3 + v36 + 12);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 3));
        }
        int v41 = v9 + 11;
        *((_DWORD *)a5 + v38 + 3) = ((v30 & 1) << 20) | (v35 << 12) | (16 * v37) | (v39 >> 4);
        uint64_t v42 = *((unsigned int *)a3 + 2);
        if (v9 + 11 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 11));
        }
        int v43 = v9 + 12;
        int v44 = *((unsigned __int8 *)a3 + v41 + 12);
        if (v9 + 12 < 0 || v43 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 12));
        }
        int v45 = v9 + 13;
        int v46 = *((unsigned __int8 *)a3 + v43 + 12);
        if (v9 + 13 < 0 || v45 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 13));
        }
        int v47 = v7 + 4;
        unsigned int v48 = *((unsigned __int8 *)a3 + v45 + 12);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 4));
        }
        int v50 = v9 + 14;
        *((_DWORD *)a5 + v47 + 3) = ((v39 & 0xF) << 17) | (v44 << 9) | (2 * v46) | (v48 >> 7);
        uint64_t v51 = *((unsigned int *)a3 + 2);
        if (v9 + 14 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v9 + 14));
        }
        int v52 = v9 + 15;
        int v53 = *((unsigned __int8 *)a3 + v50 + 12);
        if (v9 + 15 < 0 || v52 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v9 + 15));
        }
        int v54 = v7 + 5;
        unsigned int v55 = *((unsigned __int8 *)a3 + v52 + 12);
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v54 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 5));
        }
        int v57 = v9 + 16;
        *((_DWORD *)a5 + v54 + 3) = ((v48 & 0x7F) << 14) | (v53 << 6) | (v55 >> 2);
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v9 + 16 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 16));
        }
        int v59 = v9 + 17;
        int v60 = *((unsigned __int8 *)a3 + v57 + 12);
        if (v9 + 17 < 0 || v59 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 17));
        }
        int v61 = v9 + 18;
        int v62 = *((unsigned __int8 *)a3 + v59 + 12);
        if (v9 + 18 < 0 || v61 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 18));
        }
        int v63 = v7 + 6;
        unsigned int v64 = *((unsigned __int8 *)a3 + v61 + 12);
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v63 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 6));
        }
        int v66 = v9 + 19;
        *((_DWORD *)a5 + v63 + 3) = ((v55 & 3) << 19) | (v60 << 11) | (8 * v62) | (v64 >> 5);
        uint64_t v67 = *((unsigned int *)a3 + 2);
        if (v9 + 19 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v9 + 19));
        }
        int v68 = v9 + 20;
        int v69 = *((unsigned __int8 *)a3 + v66 + 12);
        if (v9 + 20 < 0 || v68 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v9 + 20));
        }
        int v70 = v7 + 7;
        int v71 = *((unsigned __int8 *)a3 + v68 + 12);
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v70 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 7));
        }
        *((_DWORD *)a5 + v70 + 3) = ((v64 & 0x1F) << 16) | (v69 << 8) | v71;
        a4 = v9 + 21;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 43;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 22) & 0x1FFFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = a4 + 1;
        *((void *)a5 + v16 + 2) = (v12 >> 1) & 0x1FFFFF;
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
        *((void *)a5 + v20 + 2) = (v21 >> 44) & 0xFFFFFFFFFFEFFFFFLL | ((v12 & 1) << 20);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((void *)a5 + v23 + 2) = (v21 >> 23) & 0x1FFFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v10 + 2;
        *((void *)a5 + v25 + 2) = (v21 >> 2) & 0x1FFFFF;
        uint64_t v28 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v10 + 2));
        }
        int v29 = v7 + 6;
        unint64_t v30 = *((void *)a3 + v27 + 2);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 6));
        }
        int v32 = v7 + 7;
        *((void *)a5 + v29 + 2) = (v30 >> 45) & 0xFFFFFFFFFFE7FFFFLL | ((v21 & 3) << 19);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v7 + 8;
        *((void *)a5 + v32 + 2) = (v30 >> 24) & 0x1FFFFF;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v10 + 3;
        *((void *)a5 + v34 + 2) = (v30 >> 3) & 0x1FFFFF;
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v10 + 3));
        }
        int v38 = v7 + 9;
        unint64_t v39 = *((void *)a3 + v36 + 2);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 9));
        }
        int v41 = v7 + 10;
        *((void *)a5 + v38 + 2) = (v39 >> 46) & 0xFFFFFFFFFFE3FFFFLL | ((v30 & 7) << 18);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 10));
        }
        int v43 = v7 + 11;
        *((void *)a5 + v41 + 2) = (v39 >> 25) & 0x1FFFFF;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v10 + 4;
        *((void *)a5 + v43 + 2) = (v39 >> 4) & 0x1FFFFF;
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v10 + 4));
        }
        int v47 = v7 + 12;
        unint64_t v48 = *((void *)a3 + v45 + 2);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 12));
        }
        int v50 = v7 + 13;
        *((void *)a5 + v47 + 2) = (v48 >> 47) & 0xFFFFFFFFFFE1FFFFLL | ((v39 & 0xF) << 17);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 13));
        }
        int v52 = v7 + 14;
        *((void *)a5 + v50 + 2) = (v48 >> 26) & 0x1FFFFF;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 14));
        }
        int v54 = v10 + 5;
        *((void *)a5 + v52 + 2) = (v48 >> 5) & 0x1FFFFF;
        uint64_t v55 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v10 + 5));
        }
        int v56 = v7 + 15;
        unint64_t v57 = *((void *)a3 + v54 + 2);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v56 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 15));
        }
        int v59 = v7 + 16;
        *((void *)a5 + v56 + 2) = HIWORD(v57) & 0xFFFFFFFFFFE0FFFFLL | ((v48 & 0x1F) << 16);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 16));
        }
        int v61 = v7 + 17;
        *((void *)a5 + v59 + 2) = (v57 >> 27) & 0x1FFFFF;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 17));
        }
        int v63 = v10 + 6;
        *((void *)a5 + v61 + 2) = (v57 >> 6) & 0x1FFFFF;
        uint64_t v64 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v10 + 6));
        }
        int v65 = v7 + 18;
        unint64_t v66 = *((void *)a3 + v63 + 2);
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v65 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 18));
        }
        int v68 = v7 + 19;
        *((void *)a5 + v65 + 2) = (v66 >> 49) & 0xFFFFFFFFFFE07FFFLL | ((v57 & 0x3F) << 15);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 19));
        }
        int v70 = v7 + 20;
        *((void *)a5 + v68 + 2) = (v66 >> 28) & 0x1FFFFF;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 20));
        }
        int v72 = v10 + 7;
        *((void *)a5 + v70 + 2) = (v66 >> 7) & 0x1FFFFF;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 7));
        }
        int v74 = v7 + 21;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 21));
        }
        int v77 = v7 + 22;
        *((void *)a5 + v74 + 2) = (v75 >> 50) & 0xFFFFFFFFFFE03FFFLL | ((v66 & 0x7F) << 14);
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 22));
        }
        int v79 = v7 + 23;
        *((void *)a5 + v77 + 2) = (v75 >> 29) & 0x1FFFFF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 23));
        }
        int v81 = v10 + 8;
        *((void *)a5 + v79 + 2) = (v75 >> 8) & 0x1FFFFF;
        uint64_t v82 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v10 + 8));
        }
        int v83 = v7 + 24;
        unint64_t v84 = *((void *)a3 + v81 + 2);
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v83 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 24));
        }
        int v86 = v7 + 25;
        *((void *)a5 + v83 + 2) = (v84 >> 51) & 0xFFFFFFFFFFE01FFFLL | ((unint64_t)v75 << 13);
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 25));
        }
        int v88 = v7 + 26;
        *((void *)a5 + v86 + 2) = (v84 >> 30) & 0x1FFFFF;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 26));
        }
        int v90 = v10 + 9;
        *((void *)a5 + v88 + 2) = (v84 >> 9) & 0x1FFFFF;
        uint64_t v91 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v10 + 9));
        }
        int v92 = v7 + 27;
        unint64_t v93 = *((void *)a3 + v90 + 2);
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v92 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 27));
        }
        int v95 = v7 + 28;
        *((void *)a5 + v92 + 2) = (v93 >> 52) & 0xFFFFFFFFFFE00FFFLL | ((v84 & 0x1FF) << 12);
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 28));
        }
        int v97 = v7 + 29;
        *((void *)a5 + v95 + 2) = (v93 >> 31) & 0x1FFFFF;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 29));
        }
        int v99 = v10 + 10;
        *((void *)a5 + v97 + 2) = (v93 >> 10) & 0x1FFFFF;
        uint64_t v100 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v10 + 10));
        }
        int v101 = v7 + 30;
        unint64_t v102 = *((void *)a3 + v99 + 2);
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v101 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 30));
        }
        int v104 = v7 + 31;
        *((void *)a5 + v101 + 2) = (v102 >> 53) & 0xFFFFFFFFFFE007FFLL | ((v93 & 0x3FF) << 11);
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 31));
        }
        int v106 = v7 + 32;
        *((void *)a5 + v104 + 2) = HIDWORD(v102) & 0x1FFFFF;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 32));
        }
        int v108 = v10 + 11;
        *((void *)a5 + v106 + 2) = v102 >> 11;
        uint64_t v109 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v10 + 11));
        }
        int v110 = v7 + 33;
        unint64_t v111 = *((void *)a3 + v108 + 2);
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v110 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 33));
        }
        int v113 = v7 + 34;
        *((void *)a5 + v110 + 2) = (v111 >> 54) & 0xFFFFFFFFFFE003FFLL | ((v102 & 0x7FF) << 10);
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 34));
        }
        int v115 = v7 + 35;
        *((void *)a5 + v113 + 2) = (v111 >> 33) & 0x1FFFFF;
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 35));
        }
        int v117 = v10 + 12;
        *((void *)a5 + v115 + 2) = (v111 >> 12) & 0x1FFFFF;
        uint64_t v118 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v10 + 12));
        }
        int v119 = v7 + 36;
        unint64_t v120 = *((void *)a3 + v117 + 2);
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v119 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 36));
        }
        int v122 = v7 + 37;
        *((void *)a5 + v119 + 2) = (v120 >> 55) & 0xFFFFFFFFFFE001FFLL | ((v111 & 0xFFF) << 9);
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 37));
        }
        int v124 = v7 + 38;
        *((void *)a5 + v122 + 2) = (v120 >> 34) & 0x1FFFFF;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 38));
        }
        int v126 = v10 + 13;
        *((void *)a5 + v124 + 2) = (v120 >> 13) & 0x1FFFFF;
        uint64_t v127 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v10 + 13));
        }
        int v128 = v7 + 39;
        unint64_t v129 = *((void *)a3 + v126 + 2);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v128 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 39));
        }
        int v131 = v7 + 40;
        *((void *)a5 + v128 + 2) = HIBYTE(v129) & 0xFFFFFFFFFFE000FFLL | ((v120 & 0x1FFF) << 8);
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 40));
        }
        int v133 = v7 + 41;
        *((void *)a5 + v131 + 2) = (v129 >> 35) & 0x1FFFFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 41));
        }
        int v135 = v10 + 14;
        *((void *)a5 + v133 + 2) = (v129 >> 14) & 0x1FFFFF;
        uint64_t v136 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v10 + 14));
        }
        int v137 = v7 + 42;
        unint64_t v138 = *((void *)a3 + v135 + 2);
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v137 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 42));
        }
        int v140 = v7 + 43;
        *((void *)a5 + v137 + 2) = (v138 >> 57) & 0xFFFFFFFFFFE0007FLL | ((v129 & 0x3FFF) << 7);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 43));
        }
        int v142 = v7 + 44;
        *((void *)a5 + v140 + 2) = (v138 >> 36) & 0x1FFFFF;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 44));
        }
        int v144 = v10 + 15;
        *((void *)a5 + v142 + 2) = (v138 >> 15) & 0x1FFFFF;
        uint64_t v145 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v10 + 15));
        }
        int v146 = v7 + 45;
        unint64_t v147 = *((void *)a3 + v144 + 2);
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v146 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 45));
        }
        int v149 = v7 + 46;
        *((void *)a5 + v146 + 2) = (v147 >> 58) & 0xFFFFFFFFFFE0003FLL | ((v138 & 0x7FFF) << 6);
        uint64_t v150 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v7 + 46));
        }
        int v151 = v7 + 47;
        *((void *)a5 + v149 + 2) = (v147 >> 37) & 0x1FFFFF;
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v151 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 47));
        }
        int v153 = v10 + 16;
        *((void *)a5 + v151 + 2) = (v147 >> 16) & 0x1FFFFF;
        uint64_t v154 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v10 + 16));
        }
        int v155 = v7 + 48;
        unint64_t v156 = *((void *)a3 + v153 + 2);
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v155 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 48));
        }
        int v158 = v7 + 49;
        *((void *)a5 + v155 + 2) = (v156 >> 59) & 0xFFFFFFFFFFE0001FLL | (32 * (unsigned __int16)v147);
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 49));
        }
        int v160 = v7 + 50;
        *((void *)a5 + v158 + 2) = (v156 >> 38) & 0x1FFFFF;
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 50));
        }
        int v162 = v10 + 17;
        *((void *)a5 + v160 + 2) = (v156 >> 17) & 0x1FFFFF;
        uint64_t v163 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v10 + 17));
        }
        int v164 = v7 + 51;
        unint64_t v165 = *((void *)a3 + v162 + 2);
        uint64_t v166 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v164 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v7 + 51));
        }
        int v167 = v7 + 52;
        *((void *)a5 + v164 + 2) = (v165 >> 60) & 0xFFFFFFFFFFE0000FLL | (16 * (v156 & 0x1FFFF));
        uint64_t v168 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v167 >= (int)v168) {
          IOSArray_throwOutOfBoundsWithMsg(v168, (v7 + 52));
        }
        int v169 = v7 + 53;
        *((void *)a5 + v167 + 2) = (v165 >> 39) & 0x1FFFFF;
        uint64_t v170 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v169 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v7 + 53));
        }
        int v171 = v10 + 18;
        *((void *)a5 + v169 + 2) = (v165 >> 18) & 0x1FFFFF;
        uint64_t v172 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v171 >= (int)v172) {
          IOSArray_throwOutOfBoundsWithMsg(v172, (v10 + 18));
        }
        int v173 = v7 + 54;
        unint64_t v174 = *((void *)a3 + v171 + 2);
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v173 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 54));
        }
        int v176 = v7 + 55;
        *((void *)a5 + v173 + 2) = (v174 >> 61) & 0xFFFFFFFFFFE00007 | (8 * (v165 & 0x3FFFF));
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v176 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 55));
        }
        int v178 = v7 + 56;
        *((void *)a5 + v176 + 2) = (v174 >> 40) & 0x1FFFFF;
        uint64_t v179 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v7 + 56));
        }
        int v180 = v10 + 19;
        *((void *)a5 + v178 + 2) = (v174 >> 19) & 0x1FFFFF;
        uint64_t v181 = *((unsigned int *)a3 + 2);
        if (v10 + 19 < 0 || v180 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v10 + 19));
        }
        int v182 = v7 + 57;
        unint64_t v183 = *((void *)a3 + v180 + 2);
        uint64_t v184 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v182 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v7 + 57));
        }
        int v185 = v7 + 58;
        *((void *)a5 + v182 + 2) = (v183 >> 62) & 0xFFFFFFFFFFE00003 | (4 * (v174 & 0x7FFFF));
        uint64_t v186 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v185 >= (int)v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, (v7 + 58));
        }
        int v187 = v7 + 59;
        *((void *)a5 + v185 + 2) = (v183 >> 41) & 0x1FFFFF;
        uint64_t v188 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v187 >= (int)v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, (v7 + 59));
        }
        int v189 = v10 + 20;
        *((void *)a5 + v187 + 2) = (v183 >> 20) & 0x1FFFFF;
        uint64_t v190 = *((unsigned int *)a3 + 2);
        if (v10 + 20 < 0 || v189 >= (int)v190) {
          IOSArray_throwOutOfBoundsWithMsg(v190, (v10 + 20));
        }
        int v191 = v7 + 60;
        unint64_t v192 = *((void *)a3 + v189 + 2);
        uint64_t v193 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v191 >= (int)v193) {
          IOSArray_throwOutOfBoundsWithMsg(v193, (v7 + 60));
        }
        int v194 = v7 + 61;
        *((void *)a5 + v191 + 2) = (v192 >> 63) | (2 * (v183 & 0xFFFFF));
        uint64_t v195 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v194 >= (int)v195) {
          IOSArray_throwOutOfBoundsWithMsg(v195, (v7 + 61));
        }
        int v196 = v7 + 62;
        *((void *)a5 + v194 + 2) = (v192 >> 42) & 0x1FFFFF;
        uint64_t v197 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v196 >= (int)v197) {
          IOSArray_throwOutOfBoundsWithMsg(v197, (v7 + 62));
        }
        int v198 = v7 + 63;
        *((void *)a5 + v196 + 2) = (v192 >> 21) & 0x1FFFFF;
        uint64_t v199 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v198 >= (int)v199) {
          IOSArray_throwOutOfBoundsWithMsg(v199, (v7 + 63));
        }
        a4 = v10 + 21;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v198 + 2) = v192 & 0x1FFFFF;
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
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 13) | (32 * v13) | (v14 >> 3);
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
        *((void *)a5 + v22 + 2) = ((v14 & 7) << 18) | (v19 << 10) | (4 * v21) | (v23 >> 6);
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 6));
        }
        int v27 = v9 + 7;
        uint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v9 + 7));
        }
        int v29 = v7 + 2;
        unint64_t v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 2));
        }
        int v32 = v9 + 8;
        *((void *)a5 + v29 + 2) = ((v23 & 0x3F) << 15) | (v28 << 7) | (v30 >> 1);
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 8));
        }
        int v34 = v9 + 9;
        uint64_t v35 = *((unsigned __int8 *)a3 + v32 + 12);
        if (v9 + 9 < 0 || v34 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 9));
        }
        int v36 = v9 + 10;
        uint64_t v37 = *((unsigned __int8 *)a3 + v34 + 12);
        if (v9 + 10 < 0 || v36 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 10));
        }
        int v38 = v7 + 3;
        unint64_t v39 = *((unsigned __int8 *)a3 + v36 + 12);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 3));
        }
        int v41 = v9 + 11;
        *((void *)a5 + v38 + 2) = ((v30 & 1) << 20) | (v35 << 12) | (16 * v37) | (v39 >> 4);
        uint64_t v42 = *((unsigned int *)a3 + 2);
        if (v9 + 11 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 11));
        }
        int v43 = v9 + 12;
        uint64_t v44 = *((unsigned __int8 *)a3 + v41 + 12);
        if (v9 + 12 < 0 || v43 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 12));
        }
        int v45 = v9 + 13;
        uint64_t v46 = *((unsigned __int8 *)a3 + v43 + 12);
        if (v9 + 13 < 0 || v45 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v9 + 13));
        }
        int v47 = v7 + 4;
        unint64_t v48 = *((unsigned __int8 *)a3 + v45 + 12);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 4));
        }
        int v50 = v9 + 14;
        *((void *)a5 + v47 + 2) = ((v39 & 0xF) << 17) | (v44 << 9) | (2 * v46) | (v48 >> 7);
        uint64_t v51 = *((unsigned int *)a3 + 2);
        if (v9 + 14 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v9 + 14));
        }
        int v52 = v9 + 15;
        uint64_t v53 = *((unsigned __int8 *)a3 + v50 + 12);
        if (v9 + 15 < 0 || v52 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v9 + 15));
        }
        int v54 = v7 + 5;
        unint64_t v55 = *((unsigned __int8 *)a3 + v52 + 12);
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v54 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 5));
        }
        int v57 = v9 + 16;
        *((void *)a5 + v54 + 2) = ((v48 & 0x7F) << 14) | (v53 << 6) | (v55 >> 2);
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v9 + 16 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 16));
        }
        int v59 = v9 + 17;
        uint64_t v60 = *((unsigned __int8 *)a3 + v57 + 12);
        if (v9 + 17 < 0 || v59 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 17));
        }
        int v61 = v9 + 18;
        uint64_t v62 = *((unsigned __int8 *)a3 + v59 + 12);
        if (v9 + 18 < 0 || v61 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v9 + 18));
        }
        int v63 = v7 + 6;
        unint64_t v64 = *((unsigned __int8 *)a3 + v61 + 12);
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v63 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 6));
        }
        int v66 = v9 + 19;
        *((void *)a5 + v63 + 2) = ((v55 & 3) << 19) | (v60 << 11) | (8 * v62) | (v64 >> 5);
        uint64_t v67 = *((unsigned int *)a3 + 2);
        if (v9 + 19 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v9 + 19));
        }
        int v68 = v9 + 20;
        uint64_t v69 = *((unsigned __int8 *)a3 + v66 + 12);
        if (v9 + 20 < 0 || v68 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v9 + 20));
        }
        int v70 = v7 + 7;
        uint64_t v71 = *((unsigned __int8 *)a3 + v68 + 12);
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v70 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 7));
        }
        *((void *)a5 + v70 + 2) = ((v64 & 0x1F) << 16) | (v69 << 8) | v71;
        a4 = v9 + 21;
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