@interface OrgApacheLuceneUtilPackedBulkOperationPacked15
- (OrgApacheLuceneUtilPackedBulkOperationPacked15)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked15

- (OrgApacheLuceneUtilPackedBulkOperationPacked15)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 49;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 34) & 0x7FFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 19) & 0x7FFF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        uint64_t v20 = (a4 + 1);
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 4) & 0x7FFF;
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if ((v20 & 0x80000000) != 0 || (int)v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, v20);
        }
        int v22 = v7 + 4;
        unint64_t v23 = *((void *)a3 + (int)v20 + 2);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((_DWORD *)a5 + v22 + 3) = (v23 >> 53) & 0x87FF | ((v12 & 0xF) << 11);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((_DWORD *)a5 + v25 + 3) = (v23 >> 38) & 0x7FFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((_DWORD *)a5 + v27 + 3) = (v23 >> 23) & 0x7FFF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v10 + 2;
        *((_DWORD *)a5 + v29 + 3) = (v23 >> 8) & 0x7FFF;
        uint64_t v32 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v10 + 2));
        }
        int v33 = v7 + 8;
        unint64_t v34 = *((void *)a3 + v31 + 2);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v7 + 9;
        *((_DWORD *)a5 + v33 + 3) = (v34 >> 57) & 0x7F | (v23 << 7);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((_DWORD *)a5 + v36 + 3) = (v34 >> 42) & 0x7FFF;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v7 + 11;
        *((_DWORD *)a5 + v38 + 3) = (v34 >> 27) & 0x7FFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v10 + 3;
        *((_DWORD *)a5 + v40 + 3) = (v34 >> 12) & 0x7FFF;
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v10 + 3));
        }
        int v44 = v7 + 12;
        unint64_t v45 = *((void *)a3 + v42 + 2);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v44 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v7 + 13;
        *((_DWORD *)a5 + v44 + 3) = (v45 >> 61) & 7 | (8 * (v34 & 0xFFF));
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v7 + 14;
        *((_DWORD *)a5 + v47 + 3) = (v45 >> 46) & 0x7FFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v7 + 15;
        *((_DWORD *)a5 + v49 + 3) = (v45 >> 31) & 0x7FFF;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 15));
        }
        int v53 = v7 + 16;
        *((_DWORD *)a5 + v51 + 3) = WORD1(v45) & 0x7FFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 16));
        }
        int v55 = v10 + 4;
        *((_DWORD *)a5 + v53 + 3) = (unsigned __int16)v45 >> 1;
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v10 + 4));
        }
        int v57 = v7 + 17;
        unint64_t v58 = *((void *)a3 + v55 + 2);
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v57 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 17));
        }
        int v60 = v7 + 18;
        *((_DWORD *)a5 + v57 + 3) = (v58 >> 50) & 0xBFFF | ((v45 & 1) << 14);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 18));
        }
        int v62 = v7 + 19;
        *((_DWORD *)a5 + v60 + 3) = (v58 >> 35) & 0x7FFF;
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 19));
        }
        int v64 = v7 + 20;
        *((_DWORD *)a5 + v62 + 3) = (v58 >> 20) & 0x7FFF;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 20));
        }
        int v66 = v10 + 5;
        *((_DWORD *)a5 + v64 + 3) = (v58 >> 5) & 0x7FFF;
        uint64_t v67 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v10 + 5));
        }
        int v68 = v7 + 21;
        unint64_t v69 = *((void *)a3 + v66 + 2);
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v68 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 21));
        }
        int v71 = v7 + 22;
        *((_DWORD *)a5 + v68 + 3) = (v69 >> 54) & 0x83FF | ((v58 & 0x1F) << 10);
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 22));
        }
        int v73 = v7 + 23;
        *((_DWORD *)a5 + v71 + 3) = (v69 >> 39) & 0x7FFF;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 23));
        }
        int v75 = v7 + 24;
        *((_DWORD *)a5 + v73 + 3) = (v69 >> 24) & 0x7FFF;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 24));
        }
        int v77 = v10 + 6;
        *((_DWORD *)a5 + v75 + 3) = (v69 >> 9) & 0x7FFF;
        uint64_t v78 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v10 + 6));
        }
        int v79 = v7 + 25;
        unint64_t v80 = *((void *)a3 + v77 + 2);
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v79 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 25));
        }
        int v82 = v7 + 26;
        *((_DWORD *)a5 + v79 + 3) = (v80 >> 58) & 0x3F | ((v69 & 0x1FF) << 6);
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 26));
        }
        int v84 = v7 + 27;
        *((_DWORD *)a5 + v82 + 3) = (v80 >> 43) & 0x7FFF;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 27));
        }
        int v86 = v7 + 28;
        *((_DWORD *)a5 + v84 + 3) = (v80 >> 28) & 0x7FFF;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 28));
        }
        int v88 = v10 + 7;
        *((_DWORD *)a5 + v86 + 3) = (v80 >> 13) & 0x7FFF;
        uint64_t v89 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v10 + 7));
        }
        int v90 = v7 + 29;
        unint64_t v91 = *((void *)a3 + v88 + 2);
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v90 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 29));
        }
        int v93 = v7 + 30;
        *((_DWORD *)a5 + v90 + 3) = (v91 >> 62) & 3 | (4 * (v80 & 0x1FFF));
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 30));
        }
        int v95 = v7 + 31;
        *((_DWORD *)a5 + v93 + 3) = (v91 >> 47) & 0x7FFF;
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 31));
        }
        int v97 = v7 + 32;
        *((_DWORD *)a5 + v95 + 3) = WORD2(v91) & 0x7FFF;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 32));
        }
        int v99 = v7 + 33;
        *((_DWORD *)a5 + v97 + 3) = v91 >> 17;
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 33));
        }
        int v101 = v10 + 8;
        *((_DWORD *)a5 + v99 + 3) = (v91 >> 2) & 0x7FFF;
        uint64_t v102 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v10 + 8));
        }
        int v103 = v7 + 34;
        unint64_t v104 = *((void *)a3 + v101 + 2);
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v103 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 34));
        }
        int v106 = v7 + 35;
        *((_DWORD *)a5 + v103 + 3) = (v104 >> 51) & 0x9FFF | ((v91 & 3) << 13);
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 35));
        }
        int v108 = v7 + 36;
        *((_DWORD *)a5 + v106 + 3) = (v104 >> 36) & 0x7FFF;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 36));
        }
        int v110 = v7 + 37;
        *((_DWORD *)a5 + v108 + 3) = (v104 >> 21) & 0x7FFF;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 37));
        }
        int v112 = v10 + 9;
        *((_DWORD *)a5 + v110 + 3) = (v104 >> 6) & 0x7FFF;
        uint64_t v113 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v10 + 9));
        }
        int v114 = v7 + 38;
        unint64_t v115 = *((void *)a3 + v112 + 2);
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v114 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 38));
        }
        int v117 = v7 + 39;
        *((_DWORD *)a5 + v114 + 3) = (v115 >> 55) & 0x81FF | ((v104 & 0x3F) << 9);
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 39));
        }
        int v119 = v7 + 40;
        *((_DWORD *)a5 + v117 + 3) = (v115 >> 40) & 0x7FFF;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 40));
        }
        int v121 = v7 + 41;
        *((_DWORD *)a5 + v119 + 3) = (v115 >> 25) & 0x7FFF;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 41));
        }
        int v123 = v10 + 10;
        *((_DWORD *)a5 + v121 + 3) = (v115 >> 10) & 0x7FFF;
        uint64_t v124 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v10 + 10));
        }
        int v125 = v7 + 42;
        unint64_t v126 = *((void *)a3 + v123 + 2);
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v125 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 42));
        }
        int v128 = v7 + 43;
        *((_DWORD *)a5 + v125 + 3) = (v126 >> 59) & 0x1F | (32 * (v115 & 0x3FF));
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 43));
        }
        int v130 = v7 + 44;
        *((_DWORD *)a5 + v128 + 3) = (v126 >> 44) & 0x7FFF;
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 44));
        }
        int v132 = v7 + 45;
        *((_DWORD *)a5 + v130 + 3) = (v126 >> 29) & 0x7FFF;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 45));
        }
        int v134 = v10 + 11;
        *((_DWORD *)a5 + v132 + 3) = (v126 >> 14) & 0x7FFF;
        uint64_t v135 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v10 + 11));
        }
        int v136 = v7 + 46;
        unint64_t v137 = *((void *)a3 + v134 + 2);
        uint64_t v138 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v136 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v7 + 46));
        }
        int v139 = v7 + 47;
        *((_DWORD *)a5 + v136 + 3) = (v137 >> 63) | (2 * (v126 & 0x3FFF));
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v139 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 47));
        }
        int v141 = v7 + 48;
        *((_DWORD *)a5 + v139 + 3) = HIWORD(v137) & 0x7FFF;
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v141 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 48));
        }
        int v143 = v7 + 49;
        *((_DWORD *)a5 + v141 + 3) = (v137 >> 33) & 0x7FFF;
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 49));
        }
        int v145 = v7 + 50;
        *((_DWORD *)a5 + v143 + 3) = (v137 >> 18) & 0x7FFF;
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 50));
        }
        int v147 = v10 + 12;
        *((_DWORD *)a5 + v145 + 3) = (v137 >> 3) & 0x7FFF;
        uint64_t v148 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v10 + 12));
        }
        int v149 = v7 + 51;
        unint64_t v150 = *((void *)a3 + v147 + 2);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v149 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 51));
        }
        int v152 = v7 + 52;
        *((_DWORD *)a5 + v149 + 3) = (v150 >> 52) & 0x8FFF | ((v137 & 7) << 12);
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 52));
        }
        int v154 = v7 + 53;
        *((_DWORD *)a5 + v152 + 3) = (v150 >> 37) & 0x7FFF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 53));
        }
        int v156 = v7 + 54;
        *((_DWORD *)a5 + v154 + 3) = (v150 >> 22) & 0x7FFF;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 54));
        }
        int v158 = v10 + 13;
        *((_DWORD *)a5 + v156 + 3) = (v150 >> 7) & 0x7FFF;
        uint64_t v159 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v10 + 13));
        }
        int v160 = v7 + 55;
        unint64_t v161 = *((void *)a3 + v158 + 2);
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v160 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 55));
        }
        int v163 = v7 + 56;
        *((_DWORD *)a5 + v160 + 3) = HIBYTE(v161) | ((v150 & 0x7F) << 8);
        uint64_t v164 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v7 + 56));
        }
        int v165 = v7 + 57;
        *((_DWORD *)a5 + v163 + 3) = (v161 >> 41) & 0x7FFF;
        uint64_t v166 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v165 >= (int)v166) {
          IOSArray_throwOutOfBoundsWithMsg(v166, (v7 + 57));
        }
        int v167 = v7 + 58;
        *((_DWORD *)a5 + v165 + 3) = (v161 >> 26) & 0x7FFF;
        uint64_t v168 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v167 >= (int)v168) {
          IOSArray_throwOutOfBoundsWithMsg(v168, (v7 + 58));
        }
        int v169 = v10 + 14;
        *((_DWORD *)a5 + v167 + 3) = (v161 >> 11) & 0x7FFF;
        uint64_t v170 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v169 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v10 + 14));
        }
        int v171 = v7 + 59;
        unint64_t v172 = *((void *)a3 + v169 + 2);
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v171 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 59));
        }
        int v174 = v7 + 60;
        *((_DWORD *)a5 + v171 + 3) = (v172 >> 60) & 0xF | (16 * (v161 & 0x7FF));
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 60));
        }
        int v176 = v7 + 61;
        *((_DWORD *)a5 + v174 + 3) = (v172 >> 45) & 0x7FFF;
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v176 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 61));
        }
        int v178 = v7 + 62;
        *((_DWORD *)a5 + v176 + 3) = (v172 >> 30) & 0x7FFF;
        uint64_t v179 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v7 + 62));
        }
        int v180 = v7 + 63;
        *((_DWORD *)a5 + v178 + 3) = (v172 >> 15) & 0x7FFF;
        uint64_t v181 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v180 >= (int)v181) {
          IOSArray_throwOutOfBoundsWithMsg(v181, (v7 + 63));
        }
        a4 = v10 + 15;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v180 + 3) = v172 & 0x7FFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (v12 >> 1) | (*((unsigned __int8 *)a3 + v9 + 12) << 7);
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
        *((_DWORD *)a5 + v18 + 3) = ((v12 & 1) << 14) | (v17 << 6) | (v19 >> 2);
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
        *((_DWORD *)a5 + v25 + 3) = ((v19 & 3) << 13) | (32 * v24) | (v26 >> 3);
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 6));
        }
        int v30 = v9 + 7;
        int v31 = *((unsigned __int8 *)a3 + v28 + 12);
        if (v9 + 7 < 0 || v30 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 7));
        }
        int v32 = v7 + 3;
        unsigned int v33 = *((unsigned __int8 *)a3 + v30 + 12);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 3));
        }
        int v35 = v9 + 8;
        *((_DWORD *)a5 + v32 + 3) = ((v26 & 7) << 12) | (16 * v31) | (v33 >> 4);
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 8));
        }
        int v37 = v9 + 9;
        int v38 = *((unsigned __int8 *)a3 + v35 + 12);
        if (v9 + 9 < 0 || v37 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 9));
        }
        int v39 = v7 + 4;
        unsigned int v40 = *((unsigned __int8 *)a3 + v37 + 12);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 4));
        }
        int v42 = v9 + 10;
        *((_DWORD *)a5 + v39 + 3) = ((v33 & 0xF) << 11) | (8 * v38) | (v40 >> 5);
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 10));
        }
        int v44 = v9 + 11;
        int v45 = *((unsigned __int8 *)a3 + v42 + 12);
        if (v9 + 11 < 0 || v44 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 11));
        }
        int v46 = v7 + 5;
        unsigned int v47 = *((unsigned __int8 *)a3 + v44 + 12);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v46 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 5));
        }
        int v49 = v9 + 12;
        *((_DWORD *)a5 + v46 + 3) = ((v40 & 0x1F) << 10) | (4 * v45) | (v47 >> 6);
        uint64_t v50 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v9 + 12));
        }
        int v51 = v9 + 13;
        int v52 = *((unsigned __int8 *)a3 + v49 + 12);
        if (v9 + 13 < 0 || v51 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v9 + 13));
        }
        int v53 = v7 + 6;
        unsigned int v54 = *((unsigned __int8 *)a3 + v51 + 12);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 6));
        }
        int v56 = v9 + 14;
        *((_DWORD *)a5 + v53 + 3) = ((v47 & 0x3F) << 9) | (2 * v52) | (v54 >> 7);
        uint64_t v57 = *((unsigned int *)a3 + 2);
        if (v9 + 14 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v9 + 14));
        }
        int v58 = v7 + 7;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 7));
        }
        *((_DWORD *)a5 + v58 + 3) = *((unsigned __int8 *)a3 + v56 + 12) | ((v54 & 0x7F) << 8);
        a4 = v9 + 15;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 49;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 34) & 0x7FFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 19) & 0x7FFF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = a4 + 1;
        *((void *)a5 + v18 + 2) = (v12 >> 4) & 0x7FFF;
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (a4 + 1));
        }
        int v22 = v7 + 4;
        unint64_t v23 = *((void *)a3 + v20 + 2);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((void *)a5 + v22 + 2) = (v23 >> 53) & 0xFFFFFFFFFFFF87FFLL | ((v12 & 0xF) << 11);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((void *)a5 + v25 + 2) = (v23 >> 38) & 0x7FFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((void *)a5 + v27 + 2) = (v23 >> 23) & 0x7FFF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v10 + 2;
        *((void *)a5 + v29 + 2) = (v23 >> 8) & 0x7FFF;
        uint64_t v32 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v10 + 2));
        }
        int v33 = v7 + 8;
        unint64_t v34 = *((void *)a3 + v31 + 2);
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v7 + 9;
        *((void *)a5 + v33 + 2) = (v34 >> 57) & 0xFFFFFFFFFFFF807FLL | ((unint64_t)v23 << 7);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((void *)a5 + v36 + 2) = (v34 >> 42) & 0x7FFF;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v7 + 11;
        *((void *)a5 + v38 + 2) = (v34 >> 27) & 0x7FFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v10 + 3;
        *((void *)a5 + v40 + 2) = (v34 >> 12) & 0x7FFF;
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v10 + 3));
        }
        int v44 = v7 + 12;
        unint64_t v45 = *((void *)a3 + v42 + 2);
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v44 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v7 + 13;
        *((void *)a5 + v44 + 2) = (v45 >> 61) & 0xFFFFFFFFFFFF8007 | (8 * (v34 & 0xFFF));
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 13));
        }
        int v49 = v7 + 14;
        *((void *)a5 + v47 + 2) = (v45 >> 46) & 0x7FFF;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v7 + 15;
        *((void *)a5 + v49 + 2) = (v45 >> 31) & 0x7FFF;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 15));
        }
        int v53 = v7 + 16;
        *((void *)a5 + v51 + 2) = (v45 >> 16) & 0x7FFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 16));
        }
        int v55 = v10 + 4;
        *((void *)a5 + v53 + 2) = (unsigned __int16)v45 >> 1;
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v10 + 4));
        }
        int v57 = v7 + 17;
        unint64_t v58 = *((void *)a3 + v55 + 2);
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v57 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 17));
        }
        unint64_t v60 = (v58 >> 50) & 0xFFFFFFFFFFFFBFFFLL | ((v45 & 1) << 14);
        int v61 = v7 + 18;
        *((void *)a5 + v57 + 2) = v60;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 18));
        }
        int v63 = v7 + 19;
        *((void *)a5 + v61 + 2) = (v58 >> 35) & 0x7FFF;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 19));
        }
        int v65 = v7 + 20;
        *((void *)a5 + v63 + 2) = (v58 >> 20) & 0x7FFF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 20));
        }
        int v67 = v10 + 5;
        *((void *)a5 + v65 + 2) = (v58 >> 5) & 0x7FFF;
        uint64_t v68 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v10 + 5));
        }
        int v69 = v7 + 21;
        unint64_t v70 = *((void *)a3 + v67 + 2);
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v69 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 21));
        }
        int v72 = v7 + 22;
        *((void *)a5 + v69 + 2) = (v70 >> 54) & 0xFFFFFFFFFFFF83FFLL | ((v58 & 0x1F) << 10);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 22));
        }
        int v74 = v7 + 23;
        *((void *)a5 + v72 + 2) = (v70 >> 39) & 0x7FFF;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 23));
        }
        int v76 = v7 + 24;
        *((void *)a5 + v74 + 2) = (v70 >> 24) & 0x7FFF;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 24));
        }
        int v78 = v10 + 6;
        *((void *)a5 + v76 + 2) = (v70 >> 9) & 0x7FFF;
        uint64_t v79 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v10 + 6));
        }
        int v80 = v7 + 25;
        unint64_t v81 = *((void *)a3 + v78 + 2);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v80 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 25));
        }
        int v83 = v7 + 26;
        *((void *)a5 + v80 + 2) = (v81 >> 58) & 0xFFFFFFFFFFFF803FLL | ((v70 & 0x1FF) << 6);
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 26));
        }
        int v85 = v7 + 27;
        *((void *)a5 + v83 + 2) = (v81 >> 43) & 0x7FFF;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 27));
        }
        int v87 = v7 + 28;
        *((void *)a5 + v85 + 2) = (v81 >> 28) & 0x7FFF;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 28));
        }
        int v89 = v10 + 7;
        *((void *)a5 + v87 + 2) = (v81 >> 13) & 0x7FFF;
        uint64_t v90 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v10 + 7));
        }
        int v91 = v7 + 29;
        unint64_t v92 = *((void *)a3 + v89 + 2);
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v91 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 29));
        }
        int v94 = v7 + 30;
        *((void *)a5 + v91 + 2) = (v92 >> 62) & 0xFFFFFFFFFFFF8003 | (4 * (v81 & 0x1FFF));
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 30));
        }
        int v96 = v7 + 31;
        *((void *)a5 + v94 + 2) = (v92 >> 47) & 0x7FFF;
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 31));
        }
        int v98 = v7 + 32;
        *((void *)a5 + v96 + 2) = HIDWORD(v92) & 0x7FFF;
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 32));
        }
        int v100 = v7 + 33;
        *((void *)a5 + v98 + 2) = v92 >> 17;
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 33));
        }
        int v102 = v10 + 8;
        *((void *)a5 + v100 + 2) = (v92 >> 2) & 0x7FFF;
        uint64_t v103 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v10 + 8));
        }
        int v104 = v7 + 34;
        unint64_t v105 = *((void *)a3 + v102 + 2);
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v104 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 34));
        }
        unint64_t v107 = (v105 >> 51) & 0xFFFFFFFFFFFF9FFFLL | ((v92 & 3) << 13);
        int v108 = v7 + 35;
        *((void *)a5 + v104 + 2) = v107;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 35));
        }
        int v110 = v7 + 36;
        *((void *)a5 + v108 + 2) = (v105 >> 36) & 0x7FFF;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 36));
        }
        int v112 = v7 + 37;
        *((void *)a5 + v110 + 2) = (v105 >> 21) & 0x7FFF;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 37));
        }
        int v114 = v10 + 9;
        *((void *)a5 + v112 + 2) = (v105 >> 6) & 0x7FFF;
        uint64_t v115 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v10 + 9));
        }
        int v116 = v7 + 38;
        unint64_t v117 = *((void *)a3 + v114 + 2);
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v116 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 38));
        }
        int v119 = v7 + 39;
        *((void *)a5 + v116 + 2) = (v117 >> 55) & 0xFFFFFFFFFFFF81FFLL | ((v105 & 0x3F) << 9);
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 39));
        }
        int v121 = v7 + 40;
        *((void *)a5 + v119 + 2) = (v117 >> 40) & 0x7FFF;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 40));
        }
        int v123 = v7 + 41;
        *((void *)a5 + v121 + 2) = (v117 >> 25) & 0x7FFF;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 41));
        }
        int v125 = v10 + 10;
        *((void *)a5 + v123 + 2) = (v117 >> 10) & 0x7FFF;
        uint64_t v126 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v10 + 10));
        }
        int v127 = v7 + 42;
        unint64_t v128 = *((void *)a3 + v125 + 2);
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v127 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 42));
        }
        int v130 = v7 + 43;
        *((void *)a5 + v127 + 2) = (v128 >> 59) & 0xFFFFFFFFFFFF801FLL | (32 * (v117 & 0x3FF));
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 43));
        }
        int v132 = v7 + 44;
        *((void *)a5 + v130 + 2) = (v128 >> 44) & 0x7FFF;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 44));
        }
        int v134 = v7 + 45;
        *((void *)a5 + v132 + 2) = (v128 >> 29) & 0x7FFF;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 45));
        }
        int v136 = v10 + 11;
        *((void *)a5 + v134 + 2) = (v128 >> 14) & 0x7FFF;
        uint64_t v137 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v10 + 11));
        }
        int v138 = v7 + 46;
        unint64_t v139 = *((void *)a3 + v136 + 2);
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v138 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 46));
        }
        int v141 = v7 + 47;
        *((void *)a5 + v138 + 2) = (v139 >> 63) | (2 * (v128 & 0x3FFF));
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v141 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 47));
        }
        int v143 = v7 + 48;
        *((void *)a5 + v141 + 2) = HIWORD(v139) & 0x7FFF;
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 48));
        }
        int v145 = v7 + 49;
        *((void *)a5 + v143 + 2) = (v139 >> 33) & 0x7FFF;
        uint64_t v146 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v7 + 49));
        }
        int v147 = v7 + 50;
        *((void *)a5 + v145 + 2) = (v139 >> 18) & 0x7FFF;
        uint64_t v148 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v147 >= (int)v148) {
          IOSArray_throwOutOfBoundsWithMsg(v148, (v7 + 50));
        }
        int v149 = v10 + 12;
        *((void *)a5 + v147 + 2) = (v139 >> 3) & 0x7FFF;
        uint64_t v150 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v149 >= (int)v150) {
          IOSArray_throwOutOfBoundsWithMsg(v150, (v10 + 12));
        }
        int v151 = v7 + 51;
        unint64_t v152 = *((void *)a3 + v149 + 2);
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v151 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 51));
        }
        unint64_t v154 = (v152 >> 52) & 0xFFFFFFFFFFFF8FFFLL | ((v139 & 7) << 12);
        int v155 = v7 + 52;
        *((void *)a5 + v151 + 2) = v154;
        uint64_t v156 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v7 + 52));
        }
        int v157 = v7 + 53;
        *((void *)a5 + v155 + 2) = (v152 >> 37) & 0x7FFF;
        uint64_t v158 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v157 >= (int)v158) {
          IOSArray_throwOutOfBoundsWithMsg(v158, (v7 + 53));
        }
        int v159 = v7 + 54;
        *((void *)a5 + v157 + 2) = (v152 >> 22) & 0x7FFF;
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v159 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 54));
        }
        int v161 = v10 + 13;
        *((void *)a5 + v159 + 2) = (v152 >> 7) & 0x7FFF;
        uint64_t v162 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v10 + 13));
        }
        int v163 = v7 + 55;
        unint64_t v164 = *((void *)a3 + v161 + 2);
        uint64_t v165 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v163 >= (int)v165) {
          IOSArray_throwOutOfBoundsWithMsg(v165, (v7 + 55));
        }
        int v166 = v7 + 56;
        *((void *)a5 + v163 + 2) = HIBYTE(v164) & 0xFFFFFFFFFFFF80FFLL | ((v152 & 0x7F) << 8);
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v166 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 56));
        }
        int v168 = v7 + 57;
        *((void *)a5 + v166 + 2) = (v164 >> 41) & 0x7FFF;
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 57));
        }
        int v170 = v7 + 58;
        *((void *)a5 + v168 + 2) = (v164 >> 26) & 0x7FFF;
        uint64_t v171 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v170 >= (int)v171) {
          IOSArray_throwOutOfBoundsWithMsg(v171, (v7 + 58));
        }
        int v172 = v10 + 14;
        *((void *)a5 + v170 + 2) = (v164 >> 11) & 0x7FFF;
        uint64_t v173 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v10 + 14));
        }
        int v174 = v7 + 59;
        unint64_t v175 = *((void *)a3 + v172 + 2);
        uint64_t v176 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v174 >= (int)v176) {
          IOSArray_throwOutOfBoundsWithMsg(v176, (v7 + 59));
        }
        int v177 = v7 + 60;
        *((void *)a5 + v174 + 2) = (v175 >> 60) & 0xFFFFFFFFFFFF800FLL | (16 * (v164 & 0x7FF));
        uint64_t v178 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v177 >= (int)v178) {
          IOSArray_throwOutOfBoundsWithMsg(v178, (v7 + 60));
        }
        int v179 = v7 + 61;
        *((void *)a5 + v177 + 2) = (v175 >> 45) & 0x7FFF;
        uint64_t v180 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v179 >= (int)v180) {
          IOSArray_throwOutOfBoundsWithMsg(v180, (v7 + 61));
        }
        int v181 = v7 + 62;
        *((void *)a5 + v179 + 2) = (v175 >> 30) & 0x7FFF;
        uint64_t v182 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v181 >= (int)v182) {
          IOSArray_throwOutOfBoundsWithMsg(v182, (v7 + 62));
        }
        int v183 = v7 + 63;
        *((void *)a5 + v181 + 2) = (v175 >> 15) & 0x7FFF;
        uint64_t v184 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v183 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v7 + 63));
        }
        a4 = v10 + 15;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v183 + 2) = v175 & 0x7FFF;
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
        *((void *)a5 + (int)v7 + 2) = (v12 >> 1) | ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 7);
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
        *((void *)a5 + v18 + 2) = ((v12 & 1) << 14) | (v17 << 6) | (v19 >> 2);
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
        *((void *)a5 + v25 + 2) = ((v19 & 3) << 13) | (32 * v24) | (v26 >> 3);
        uint64_t v29 = *((unsigned int *)a3 + 2);
        if (v9 + 6 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 6));
        }
        int v30 = v9 + 7;
        uint64_t v31 = *((unsigned __int8 *)a3 + v28 + 12);
        if (v9 + 7 < 0 || v30 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v9 + 7));
        }
        int v32 = v7 + 3;
        unint64_t v33 = *((unsigned __int8 *)a3 + v30 + 12);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 3));
        }
        int v35 = v9 + 8;
        *((void *)a5 + v32 + 2) = ((v26 & 7) << 12) | (16 * v31) | (v33 >> 4);
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 8));
        }
        int v37 = v9 + 9;
        uint64_t v38 = *((unsigned __int8 *)a3 + v35 + 12);
        if (v9 + 9 < 0 || v37 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 9));
        }
        int v39 = v7 + 4;
        unint64_t v40 = *((unsigned __int8 *)a3 + v37 + 12);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v39 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 4));
        }
        int v42 = v9 + 10;
        *((void *)a5 + v39 + 2) = ((v33 & 0xF) << 11) | (8 * v38) | (v40 >> 5);
        uint64_t v43 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 10));
        }
        int v44 = v9 + 11;
        uint64_t v45 = *((unsigned __int8 *)a3 + v42 + 12);
        if (v9 + 11 < 0 || v44 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v9 + 11));
        }
        int v46 = v7 + 5;
        unint64_t v47 = *((unsigned __int8 *)a3 + v44 + 12);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v46 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 5));
        }
        int v49 = v9 + 12;
        *((void *)a5 + v46 + 2) = ((v40 & 0x1F) << 10) | (4 * v45) | (v47 >> 6);
        uint64_t v50 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v9 + 12));
        }
        int v51 = v9 + 13;
        uint64_t v52 = *((unsigned __int8 *)a3 + v49 + 12);
        if (v9 + 13 < 0 || v51 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v9 + 13));
        }
        int v53 = v7 + 6;
        unint64_t v54 = *((unsigned __int8 *)a3 + v51 + 12);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 6));
        }
        int v56 = v9 + 14;
        *((void *)a5 + v53 + 2) = ((v47 & 0x3F) << 9) | (2 * v52) | (v54 >> 7);
        uint64_t v57 = *((unsigned int *)a3 + 2);
        if (v9 + 14 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v9 + 14));
        }
        int v58 = v7 + 7;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 7));
        }
        *((void *)a5 + v58 + 2) = *((unsigned __int8 *)a3 + v56 + 12) | ((v54 & 0x7F) << 8);
        a4 = v9 + 15;
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