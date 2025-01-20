@interface OrgApacheLuceneUtilPackedBulkOperationPacked19
- (OrgApacheLuceneUtilPackedBulkOperationPacked19)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked19

- (OrgApacheLuceneUtilPackedBulkOperationPacked19)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 45;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 26) & 0x7FFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        uint64_t v18 = (a4 + 1);
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 7) & 0x7FFFF;
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
        *((_DWORD *)a5 + v20 + 3) = (v21 >> 52) & 0xFFF | ((v12 & 0x7F) << 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((_DWORD *)a5 + v23 + 3) = (v21 >> 33) & 0x7FFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v10 + 2;
        *((_DWORD *)a5 + v25 + 3) = (v21 >> 14) & 0x7FFFF;
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
        *((_DWORD *)a5 + v29 + 3) = (v30 >> 59) & 0x1F | (32 * (v21 & 0x3FFF));
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 7));
        }
        int v34 = v7 + 8;
        *((_DWORD *)a5 + v32 + 3) = (v30 >> 40) & 0x7FFFF;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 8));
        }
        int v36 = v7 + 9;
        *((_DWORD *)a5 + v34 + 3) = (v30 >> 21) & 0x7FFFF;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v10 + 3;
        *((_DWORD *)a5 + v36 + 3) = (v30 >> 2) & 0x7FFFF;
        uint64_t v39 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v10 + 3));
        }
        int v40 = v7 + 10;
        unint64_t v41 = *((void *)a3 + v38 + 2);
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v40 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 10));
        }
        int v43 = v7 + 11;
        *((_DWORD *)a5 + v40 + 3) = (v41 >> 47) & 0xFFF9FFFF | ((v30 & 3) << 17);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 11));
        }
        int v45 = v7 + 12;
        *((_DWORD *)a5 + v43 + 3) = (v41 >> 28) & 0x7FFFF;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 12));
        }
        int v47 = v10 + 4;
        *((_DWORD *)a5 + v45 + 3) = (v41 >> 9) & 0x7FFFF;
        uint64_t v48 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v10 + 4));
        }
        int v49 = v7 + 13;
        unint64_t v50 = *((void *)a3 + v47 + 2);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v49 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 13));
        }
        int v52 = v7 + 14;
        *((_DWORD *)a5 + v49 + 3) = (v50 >> 54) & 0x3FF | ((v41 & 0x1FF) << 10);
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 14));
        }
        int v54 = v7 + 15;
        *((_DWORD *)a5 + v52 + 3) = (v50 >> 35) & 0x7FFFF;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 15));
        }
        int v56 = v10 + 5;
        *((_DWORD *)a5 + v54 + 3) = (v50 >> 16) & 0x7FFFF;
        uint64_t v57 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v10 + 5));
        }
        int v58 = v7 + 16;
        unint64_t v59 = *((void *)a3 + v56 + 2);
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v58 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 16));
        }
        int v61 = v7 + 17;
        *((_DWORD *)a5 + v58 + 3) = (v59 >> 61) & 7 | (8 * (unsigned __int16)v50);
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 17));
        }
        int v63 = v7 + 18;
        *((_DWORD *)a5 + v61 + 3) = (v59 >> 42) & 0x7FFFF;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 18));
        }
        int v65 = v7 + 19;
        *((_DWORD *)a5 + v63 + 3) = (v59 >> 23) & 0x7FFFF;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 19));
        }
        int v67 = v10 + 6;
        *((_DWORD *)a5 + v65 + 3) = (v59 >> 4) & 0x7FFFF;
        uint64_t v68 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v10 + 6));
        }
        int v69 = v7 + 20;
        unint64_t v70 = *((void *)a3 + v67 + 2);
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v69 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 20));
        }
        int v72 = v7 + 21;
        *((_DWORD *)a5 + v69 + 3) = (v70 >> 49) & 0x7FFF | ((v59 & 0xF) << 15);
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 21));
        }
        int v74 = v7 + 22;
        *((_DWORD *)a5 + v72 + 3) = (v70 >> 30) & 0x7FFFF;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 22));
        }
        int v76 = v10 + 7;
        *((_DWORD *)a5 + v74 + 3) = (v70 >> 11) & 0x7FFFF;
        uint64_t v77 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v10 + 7));
        }
        int v78 = v7 + 23;
        unint64_t v79 = *((void *)a3 + v76 + 2);
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v78 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 23));
        }
        int v81 = v7 + 24;
        *((_DWORD *)a5 + v78 + 3) = HIBYTE(v79) | ((v70 & 0x7FF) << 8);
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 24));
        }
        int v83 = v7 + 25;
        *((_DWORD *)a5 + v81 + 3) = (v79 >> 37) & 0x7FFFF;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 25));
        }
        int v85 = v10 + 8;
        *((_DWORD *)a5 + v83 + 3) = (v79 >> 18) & 0x7FFFF;
        uint64_t v86 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v10 + 8));
        }
        int v87 = v7 + 26;
        unint64_t v88 = *((void *)a3 + v85 + 2);
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v87 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 26));
        }
        int v90 = v7 + 27;
        *((_DWORD *)a5 + v87 + 3) = (v88 >> 63) | (2 * (v79 & 0x3FFFF));
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 27));
        }
        int v92 = v7 + 28;
        *((_DWORD *)a5 + v90 + 3) = (v88 >> 44) & 0x7FFFF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 28));
        }
        int v94 = v7 + 29;
        *((_DWORD *)a5 + v92 + 3) = (v88 >> 25) & 0x7FFFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 29));
        }
        int v96 = v10 + 9;
        *((_DWORD *)a5 + v94 + 3) = (v88 >> 6) & 0x7FFFF;
        uint64_t v97 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v10 + 9));
        }
        int v98 = v7 + 30;
        unint64_t v99 = *((void *)a3 + v96 + 2);
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v98 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 30));
        }
        int v101 = v7 + 31;
        *((_DWORD *)a5 + v98 + 3) = (v99 >> 51) & 0x1FFF | ((v88 & 0x3F) << 13);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 31));
        }
        int v103 = v7 + 32;
        *((_DWORD *)a5 + v101 + 3) = HIDWORD(v99) & 0x7FFFF;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 32));
        }
        int v105 = v10 + 10;
        *((_DWORD *)a5 + v103 + 3) = v99 >> 13;
        uint64_t v106 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v10 + 10));
        }
        int v107 = v7 + 33;
        unint64_t v108 = *((void *)a3 + v105 + 2);
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v107 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 33));
        }
        int v110 = v7 + 34;
        *((_DWORD *)a5 + v107 + 3) = (v108 >> 58) & 0x3F | ((v99 & 0x1FFF) << 6);
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 34));
        }
        int v112 = v7 + 35;
        *((_DWORD *)a5 + v110 + 3) = (v108 >> 39) & 0x7FFFF;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 35));
        }
        int v114 = v7 + 36;
        *((_DWORD *)a5 + v112 + 3) = (v108 >> 20) & 0x7FFFF;
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 36));
        }
        int v116 = v10 + 11;
        *((_DWORD *)a5 + v114 + 3) = (v108 >> 1) & 0x7FFFF;
        uint64_t v117 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v10 + 11));
        }
        int v118 = v7 + 37;
        unint64_t v119 = *((void *)a3 + v116 + 2);
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v118 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 37));
        }
        int v121 = v7 + 38;
        *((_DWORD *)a5 + v118 + 3) = (v119 >> 46) & 0xFFFBFFFF | ((v108 & 1) << 18);
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 38));
        }
        int v123 = v7 + 39;
        *((_DWORD *)a5 + v121 + 3) = (v119 >> 27) & 0x7FFFF;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 39));
        }
        int v125 = v10 + 12;
        *((_DWORD *)a5 + v123 + 3) = (v119 >> 8) & 0x7FFFF;
        uint64_t v126 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v10 + 12));
        }
        int v127 = v7 + 40;
        unint64_t v128 = *((void *)a3 + v125 + 2);
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v127 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 40));
        }
        int v130 = v7 + 41;
        *((_DWORD *)a5 + v127 + 3) = (v128 >> 53) & 0x7FF | (v119 << 11);
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 41));
        }
        int v132 = v7 + 42;
        *((_DWORD *)a5 + v130 + 3) = (v128 >> 34) & 0x7FFFF;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 42));
        }
        int v134 = v10 + 13;
        *((_DWORD *)a5 + v132 + 3) = (v128 >> 15) & 0x7FFFF;
        uint64_t v135 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v10 + 13));
        }
        int v136 = v7 + 43;
        unint64_t v137 = *((void *)a3 + v134 + 2);
        uint64_t v138 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v136 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v7 + 43));
        }
        int v139 = v7 + 44;
        *((_DWORD *)a5 + v136 + 3) = (v137 >> 60) & 0xF | (16 * (v128 & 0x7FFF));
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v139 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 44));
        }
        int v141 = v7 + 45;
        *((_DWORD *)a5 + v139 + 3) = (v137 >> 41) & 0x7FFFF;
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v141 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 45));
        }
        int v143 = v7 + 46;
        *((_DWORD *)a5 + v141 + 3) = (v137 >> 22) & 0x7FFFF;
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 46));
        }
        int v145 = v10 + 14;
        *((_DWORD *)a5 + v143 + 3) = (v137 >> 3) & 0x7FFFF;
        uint64_t v146 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v10 + 14));
        }
        int v147 = v7 + 47;
        unint64_t v148 = *((void *)a3 + v145 + 2);
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v147 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 47));
        }
        int v150 = v7 + 48;
        *((_DWORD *)a5 + v147 + 3) = HIWORD(v148) | ((v137 & 7) << 16);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 48));
        }
        int v152 = v7 + 49;
        *((_DWORD *)a5 + v150 + 3) = (v148 >> 29) & 0x7FFFF;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 49));
        }
        int v154 = v10 + 15;
        *((_DWORD *)a5 + v152 + 3) = (v148 >> 10) & 0x7FFFF;
        uint64_t v155 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v10 + 15));
        }
        int v156 = v7 + 50;
        unint64_t v157 = *((void *)a3 + v154 + 2);
        uint64_t v158 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v156 >= (int)v158) {
          IOSArray_throwOutOfBoundsWithMsg(v158, (v7 + 50));
        }
        int v159 = v7 + 51;
        *((_DWORD *)a5 + v156 + 3) = (v157 >> 55) & 0x1FF | ((v148 & 0x3FF) << 9);
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v159 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 51));
        }
        int v161 = v7 + 52;
        *((_DWORD *)a5 + v159 + 3) = (v157 >> 36) & 0x7FFFF;
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 52));
        }
        int v163 = v10 + 16;
        *((_DWORD *)a5 + v161 + 3) = (v157 >> 17) & 0x7FFFF;
        uint64_t v164 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v10 + 16));
        }
        int v165 = v7 + 53;
        unint64_t v166 = *((void *)a3 + v163 + 2);
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v165 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 53));
        }
        int v168 = v7 + 54;
        *((_DWORD *)a5 + v165 + 3) = (v166 >> 62) & 3 | (4 * (v157 & 0x1FFFF));
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 54));
        }
        int v170 = v7 + 55;
        *((_DWORD *)a5 + v168 + 3) = (v166 >> 43) & 0x7FFFF;
        uint64_t v171 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v170 >= (int)v171) {
          IOSArray_throwOutOfBoundsWithMsg(v171, (v7 + 55));
        }
        int v172 = v7 + 56;
        *((_DWORD *)a5 + v170 + 3) = (v166 >> 24) & 0x7FFFF;
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 56));
        }
        int v174 = v10 + 17;
        *((_DWORD *)a5 + v172 + 3) = (v166 >> 5) & 0x7FFFF;
        uint64_t v175 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v10 + 17));
        }
        int v176 = v7 + 57;
        unint64_t v177 = *((void *)a3 + v174 + 2);
        uint64_t v178 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v176 >= (int)v178) {
          IOSArray_throwOutOfBoundsWithMsg(v178, (v7 + 57));
        }
        int v179 = v7 + 58;
        *((_DWORD *)a5 + v176 + 3) = (v177 >> 50) & 0x3FFF | ((v166 & 0x1F) << 14);
        uint64_t v180 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v179 >= (int)v180) {
          IOSArray_throwOutOfBoundsWithMsg(v180, (v7 + 58));
        }
        int v181 = v7 + 59;
        *((_DWORD *)a5 + v179 + 3) = (v177 >> 31) & 0x7FFFF;
        uint64_t v182 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v181 >= (int)v182) {
          IOSArray_throwOutOfBoundsWithMsg(v182, (v7 + 59));
        }
        int v183 = v10 + 18;
        *((_DWORD *)a5 + v181 + 3) = (v177 >> 12) & 0x7FFFF;
        uint64_t v184 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v183 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v10 + 18));
        }
        int v185 = v7 + 60;
        unint64_t v186 = *((void *)a3 + v183 + 2);
        uint64_t v187 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v185 >= (int)v187) {
          IOSArray_throwOutOfBoundsWithMsg(v187, (v7 + 60));
        }
        int v188 = v7 + 61;
        *((_DWORD *)a5 + v185 + 3) = (v186 >> 57) & 0x7F | ((v177 & 0xFFF) << 7);
        uint64_t v189 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v188 >= (int)v189) {
          IOSArray_throwOutOfBoundsWithMsg(v189, (v7 + 61));
        }
        int v190 = v7 + 62;
        *((_DWORD *)a5 + v188 + 3) = (v186 >> 38) & 0x7FFFF;
        uint64_t v191 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v190 >= (int)v191) {
          IOSArray_throwOutOfBoundsWithMsg(v191, (v7 + 62));
        }
        int v192 = v7 + 63;
        *((_DWORD *)a5 + v190 + 3) = (v186 >> 19) & 0x7FFFF;
        uint64_t v193 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v192 >= (int)v193) {
          IOSArray_throwOutOfBoundsWithMsg(v193, (v7 + 63));
        }
        a4 = v10 + 19;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v192 + 3) = v186 & 0x7FFFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (*((unsigned __int8 *)a3 + v9 + 12) << 11) | (8 * v13) | (v14 >> 5);
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
        *((_DWORD *)a5 + v20 + 3) = ((v14 & 0x1F) << 14) | (v19 << 6) | (v21 >> 2);
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 5));
        }
        int v25 = v9 + 6;
        int v26 = *((unsigned __int8 *)a3 + v23 + 12);
        if (v9 + 6 < 0 || v25 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 6));
        }
        int v27 = v9 + 7;
        int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 7));
        }
        int v29 = v7 + 2;
        unsigned int v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 2));
        }
        int v32 = v9 + 8;
        *((_DWORD *)a5 + v29 + 3) = ((v21 & 3) << 17) | (v26 << 9) | (2 * v28) | (v30 >> 7);
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 8));
        }
        int v34 = v9 + 9;
        int v35 = *((unsigned __int8 *)a3 + v32 + 12);
        if (v9 + 9 < 0 || v34 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 9));
        }
        int v36 = v7 + 3;
        unsigned int v37 = *((unsigned __int8 *)a3 + v34 + 12);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 3));
        }
        int v39 = v9 + 10;
        *((_DWORD *)a5 + v36 + 3) = ((v30 & 0x7F) << 12) | (16 * v35) | (v37 >> 4);
        uint64_t v40 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v9 + 10));
        }
        int v41 = v9 + 11;
        int v42 = *((unsigned __int8 *)a3 + v39 + 12);
        if (v9 + 11 < 0 || v41 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v9 + 11));
        }
        int v43 = v7 + 4;
        unsigned int v44 = *((unsigned __int8 *)a3 + v41 + 12);
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v43 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 4));
        }
        int v46 = v9 + 12;
        *((_DWORD *)a5 + v43 + 3) = ((v37 & 0xF) << 15) | (v42 << 7) | (v44 >> 1);
        uint64_t v47 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 12));
        }
        int v48 = v9 + 13;
        int v49 = *((unsigned __int8 *)a3 + v46 + 12);
        if (v9 + 13 < 0 || v48 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 13));
        }
        int v50 = v9 + 14;
        int v51 = *((unsigned __int8 *)a3 + v48 + 12);
        if (v9 + 14 < 0 || v50 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 14));
        }
        int v52 = v7 + 5;
        unsigned int v53 = *((unsigned __int8 *)a3 + v50 + 12);
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v52 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 5));
        }
        int v55 = v9 + 15;
        *((_DWORD *)a5 + v52 + 3) = ((v44 & 1) << 18) | (v49 << 10) | (4 * v51) | (v53 >> 6);
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 15));
        }
        int v57 = v9 + 16;
        int v58 = *((unsigned __int8 *)a3 + v55 + 12);
        if (v9 + 16 < 0 || v57 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 16));
        }
        int v59 = v7 + 6;
        unsigned int v60 = *((unsigned __int8 *)a3 + v57 + 12);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 6));
        }
        int v62 = v9 + 17;
        *((_DWORD *)a5 + v59 + 3) = ((v53 & 0x3F) << 13) | (32 * v58) | (v60 >> 3);
        uint64_t v63 = *((unsigned int *)a3 + 2);
        if (v9 + 17 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v9 + 17));
        }
        int v64 = v9 + 18;
        int v65 = *((unsigned __int8 *)a3 + v62 + 12);
        if (v9 + 18 < 0 || v64 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v9 + 18));
        }
        int v66 = v7 + 7;
        int v67 = *((unsigned __int8 *)a3 + v64 + 12);
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v66 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 7));
        }
        *((_DWORD *)a5 + v66 + 3) = ((v60 & 7) << 16) | (v65 << 8) | v67;
        a4 = v9 + 19;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 45;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 26) & 0x7FFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = a4 + 1;
        *((void *)a5 + v16 + 2) = (v12 >> 7) & 0x7FFFF;
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
        *((void *)a5 + v20 + 2) = (v21 >> 52) & 0xFFFFFFFFFFF80FFFLL | ((v12 & 0x7F) << 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v7 + 4));
        }
        int v25 = v7 + 5;
        *((void *)a5 + v23 + 2) = (v21 >> 33) & 0x7FFFF;
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v10 + 2;
        *((void *)a5 + v25 + 2) = (v21 >> 14) & 0x7FFFF;
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
        unint64_t v32 = (v30 >> 59) & 0xFFFFFFFFFFF8001FLL | (32 * (v21 & 0x3FFF));
        int v33 = v7 + 7;
        *((void *)a5 + v29 + 2) = v32;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 7));
        }
        int v35 = v7 + 8;
        *((void *)a5 + v33 + 2) = (v30 >> 40) & 0x7FFFF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 8));
        }
        int v37 = v7 + 9;
        *((void *)a5 + v35 + 2) = (v30 >> 21) & 0x7FFFF;
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 9));
        }
        int v39 = v10 + 3;
        *((void *)a5 + v37 + 2) = (v30 >> 2) & 0x7FFFF;
        uint64_t v40 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v10 + 3));
        }
        int v41 = v7 + 10;
        unint64_t v42 = *((void *)a3 + v39 + 2);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 10));
        }
        int v44 = v7 + 11;
        *((void *)a5 + v41 + 2) = (v42 >> 47) & 0xFFFFFFFFFFF9FFFFLL | ((v30 & 3) << 17);
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 11));
        }
        int v46 = v7 + 12;
        *((void *)a5 + v44 + 2) = (v42 >> 28) & 0x7FFFF;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 12));
        }
        int v48 = v10 + 4;
        *((void *)a5 + v46 + 2) = (v42 >> 9) & 0x7FFFF;
        uint64_t v49 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v10 + 4));
        }
        int v50 = v7 + 13;
        unint64_t v51 = *((void *)a3 + v48 + 2);
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v50 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 13));
        }
        int v53 = v7 + 14;
        *((void *)a5 + v50 + 2) = (v51 >> 54) & 0xFFFFFFFFFFF803FFLL | ((v42 & 0x1FF) << 10);
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 14));
        }
        int v55 = v7 + 15;
        *((void *)a5 + v53 + 2) = (v51 >> 35) & 0x7FFFF;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 15));
        }
        int v57 = v10 + 5;
        *((void *)a5 + v55 + 2) = (v51 >> 16) & 0x7FFFF;
        uint64_t v58 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v10 + 5));
        }
        int v59 = v7 + 16;
        unint64_t v60 = *((void *)a3 + v57 + 2);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 16));
        }
        int v62 = v7 + 17;
        *((void *)a5 + v59 + 2) = (v60 >> 61) & 0xFFFFFFFFFFF80007 | (8 * (unsigned __int16)v51);
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 17));
        }
        int v64 = v7 + 18;
        *((void *)a5 + v62 + 2) = (v60 >> 42) & 0x7FFFF;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 18));
        }
        int v66 = v7 + 19;
        *((void *)a5 + v64 + 2) = (v60 >> 23) & 0x7FFFF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 19));
        }
        int v68 = v10 + 6;
        *((void *)a5 + v66 + 2) = (v60 >> 4) & 0x7FFFF;
        uint64_t v69 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v10 + 6));
        }
        int v70 = v7 + 20;
        unint64_t v71 = *((void *)a3 + v68 + 2);
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v70 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 20));
        }
        int v73 = v7 + 21;
        *((void *)a5 + v70 + 2) = (v71 >> 49) & 0xFFFFFFFFFFF87FFFLL | ((v60 & 0xF) << 15);
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 21));
        }
        int v75 = v7 + 22;
        *((void *)a5 + v73 + 2) = (v71 >> 30) & 0x7FFFF;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 22));
        }
        int v77 = v10 + 7;
        *((void *)a5 + v75 + 2) = (v71 >> 11) & 0x7FFFF;
        uint64_t v78 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v10 + 7));
        }
        int v79 = v7 + 23;
        unint64_t v80 = *((void *)a3 + v77 + 2);
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v79 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 23));
        }
        int v82 = v7 + 24;
        *((void *)a5 + v79 + 2) = HIBYTE(v80) & 0xFFFFFFFFFFF800FFLL | ((v71 & 0x7FF) << 8);
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 24));
        }
        int v84 = v7 + 25;
        *((void *)a5 + v82 + 2) = (v80 >> 37) & 0x7FFFF;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 25));
        }
        int v86 = v10 + 8;
        *((void *)a5 + v84 + 2) = (v80 >> 18) & 0x7FFFF;
        uint64_t v87 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v10 + 8));
        }
        int v88 = v7 + 26;
        unint64_t v89 = *((void *)a3 + v86 + 2);
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v88 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 26));
        }
        uint64_t v91 = (v89 >> 63) | (2 * (v80 & 0x3FFFF));
        int v92 = v7 + 27;
        *((void *)a5 + v88 + 2) = v91;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 27));
        }
        int v94 = v7 + 28;
        *((void *)a5 + v92 + 2) = (v89 >> 44) & 0x7FFFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 28));
        }
        int v96 = v7 + 29;
        *((void *)a5 + v94 + 2) = (v89 >> 25) & 0x7FFFF;
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 29));
        }
        int v98 = v10 + 9;
        *((void *)a5 + v96 + 2) = (v89 >> 6) & 0x7FFFF;
        uint64_t v99 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v10 + 9));
        }
        int v100 = v7 + 30;
        unint64_t v101 = *((void *)a3 + v98 + 2);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v100 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 30));
        }
        int v103 = v7 + 31;
        *((void *)a5 + v100 + 2) = (v101 >> 51) & 0xFFFFFFFFFFF81FFFLL | ((v89 & 0x3F) << 13);
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 31));
        }
        int v105 = v7 + 32;
        *((void *)a5 + v103 + 2) = HIDWORD(v101) & 0x7FFFF;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 32));
        }
        int v107 = v10 + 10;
        *((void *)a5 + v105 + 2) = v101 >> 13;
        uint64_t v108 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v10 + 10));
        }
        int v109 = v7 + 33;
        unint64_t v110 = *((void *)a3 + v107 + 2);
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v109 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 33));
        }
        int v112 = v7 + 34;
        *((void *)a5 + v109 + 2) = (v110 >> 58) & 0xFFFFFFFFFFF8003FLL | ((v101 & 0x1FFF) << 6);
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 34));
        }
        int v114 = v7 + 35;
        *((void *)a5 + v112 + 2) = (v110 >> 39) & 0x7FFFF;
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 35));
        }
        int v116 = v7 + 36;
        *((void *)a5 + v114 + 2) = (v110 >> 20) & 0x7FFFF;
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 36));
        }
        int v118 = v10 + 11;
        *((void *)a5 + v116 + 2) = (v110 >> 1) & 0x7FFFF;
        uint64_t v119 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v10 + 11));
        }
        int v120 = v7 + 37;
        unint64_t v121 = *((void *)a3 + v118 + 2);
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v120 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 37));
        }
        int v123 = v7 + 38;
        *((void *)a5 + v120 + 2) = (v121 >> 46) & 0xFFFFFFFFFFFBFFFFLL | ((v110 & 1) << 18);
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 38));
        }
        int v125 = v7 + 39;
        *((void *)a5 + v123 + 2) = (v121 >> 27) & 0x7FFFF;
        uint64_t v126 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v7 + 39));
        }
        int v127 = v10 + 12;
        *((void *)a5 + v125 + 2) = (v121 >> 8) & 0x7FFFF;
        uint64_t v128 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v127 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v10 + 12));
        }
        int v129 = v7 + 40;
        unint64_t v130 = *((void *)a3 + v127 + 2);
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v129 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 40));
        }
        int v132 = v7 + 41;
        *((void *)a5 + v129 + 2) = (v130 >> 53) & 0xFFFFFFFFFFF807FFLL | ((unint64_t)v121 << 11);
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 41));
        }
        int v134 = v7 + 42;
        *((void *)a5 + v132 + 2) = (v130 >> 34) & 0x7FFFF;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 42));
        }
        int v136 = v10 + 13;
        *((void *)a5 + v134 + 2) = (v130 >> 15) & 0x7FFFF;
        uint64_t v137 = *((unsigned int *)a3 + 2);
        if (v10 + 13 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v10 + 13));
        }
        int v138 = v7 + 43;
        unint64_t v139 = *((void *)a3 + v136 + 2);
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v138 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 43));
        }
        unint64_t v141 = (v139 >> 60) & 0xFFFFFFFFFFF8000FLL | (16 * (v130 & 0x7FFF));
        int v142 = v7 + 44;
        *((void *)a5 + v138 + 2) = v141;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 44));
        }
        int v144 = v7 + 45;
        *((void *)a5 + v142 + 2) = (v139 >> 41) & 0x7FFFF;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 45));
        }
        int v146 = v7 + 46;
        *((void *)a5 + v144 + 2) = (v139 >> 22) & 0x7FFFF;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 46));
        }
        int v148 = v10 + 14;
        *((void *)a5 + v146 + 2) = (v139 >> 3) & 0x7FFFF;
        uint64_t v149 = *((unsigned int *)a3 + 2);
        if (v10 + 14 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v10 + 14));
        }
        int v150 = v7 + 47;
        unint64_t v151 = *((void *)a3 + v148 + 2);
        uint64_t v152 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v150 >= (int)v152) {
          IOSArray_throwOutOfBoundsWithMsg(v152, (v7 + 47));
        }
        int v153 = v7 + 48;
        *((void *)a5 + v150 + 2) = HIWORD(v151) & 0xFFFFFFFFFFF8FFFFLL | ((v139 & 7) << 16);
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v153 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 48));
        }
        int v155 = v7 + 49;
        *((void *)a5 + v153 + 2) = (v151 >> 29) & 0x7FFFF;
        uint64_t v156 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v7 + 49));
        }
        int v157 = v10 + 15;
        *((void *)a5 + v155 + 2) = (v151 >> 10) & 0x7FFFF;
        uint64_t v158 = *((unsigned int *)a3 + 2);
        if (v10 + 15 < 0 || v157 >= (int)v158) {
          IOSArray_throwOutOfBoundsWithMsg(v158, (v10 + 15));
        }
        int v159 = v7 + 50;
        unint64_t v160 = *((void *)a3 + v157 + 2);
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v159 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 50));
        }
        int v162 = v7 + 51;
        *((void *)a5 + v159 + 2) = (v160 >> 55) & 0xFFFFFFFFFFF801FFLL | ((v151 & 0x3FF) << 9);
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 51));
        }
        int v164 = v7 + 52;
        *((void *)a5 + v162 + 2) = (v160 >> 36) & 0x7FFFF;
        uint64_t v165 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v164 >= (int)v165) {
          IOSArray_throwOutOfBoundsWithMsg(v165, (v7 + 52));
        }
        int v166 = v10 + 16;
        *((void *)a5 + v164 + 2) = (v160 >> 17) & 0x7FFFF;
        uint64_t v167 = *((unsigned int *)a3 + 2);
        if (v10 + 16 < 0 || v166 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v10 + 16));
        }
        int v168 = v7 + 53;
        unint64_t v169 = *((void *)a3 + v166 + 2);
        uint64_t v170 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v168 >= (int)v170) {
          IOSArray_throwOutOfBoundsWithMsg(v170, (v7 + 53));
        }
        unint64_t v171 = (v169 >> 62) & 0xFFFFFFFFFFF80003 | (4 * (v160 & 0x1FFFF));
        int v172 = v7 + 54;
        *((void *)a5 + v168 + 2) = v171;
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 54));
        }
        int v174 = v7 + 55;
        *((void *)a5 + v172 + 2) = (v169 >> 43) & 0x7FFFF;
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 55));
        }
        int v176 = v7 + 56;
        *((void *)a5 + v174 + 2) = (v169 >> 24) & 0x7FFFF;
        uint64_t v177 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v176 >= (int)v177) {
          IOSArray_throwOutOfBoundsWithMsg(v177, (v7 + 56));
        }
        int v178 = v10 + 17;
        *((void *)a5 + v176 + 2) = (v169 >> 5) & 0x7FFFF;
        uint64_t v179 = *((unsigned int *)a3 + 2);
        if (v10 + 17 < 0 || v178 >= (int)v179) {
          IOSArray_throwOutOfBoundsWithMsg(v179, (v10 + 17));
        }
        int v180 = v7 + 57;
        unint64_t v181 = *((void *)a3 + v178 + 2);
        uint64_t v182 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v180 >= (int)v182) {
          IOSArray_throwOutOfBoundsWithMsg(v182, (v7 + 57));
        }
        int v183 = v7 + 58;
        *((void *)a5 + v180 + 2) = (v181 >> 50) & 0xFFFFFFFFFFF83FFFLL | ((v169 & 0x1F) << 14);
        uint64_t v184 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v183 >= (int)v184) {
          IOSArray_throwOutOfBoundsWithMsg(v184, (v7 + 58));
        }
        int v185 = v7 + 59;
        *((void *)a5 + v183 + 2) = (v181 >> 31) & 0x7FFFF;
        uint64_t v186 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v185 >= (int)v186) {
          IOSArray_throwOutOfBoundsWithMsg(v186, (v7 + 59));
        }
        int v187 = v10 + 18;
        *((void *)a5 + v185 + 2) = (v181 >> 12) & 0x7FFFF;
        uint64_t v188 = *((unsigned int *)a3 + 2);
        if (v10 + 18 < 0 || v187 >= (int)v188) {
          IOSArray_throwOutOfBoundsWithMsg(v188, (v10 + 18));
        }
        int v189 = v7 + 60;
        unint64_t v190 = *((void *)a3 + v187 + 2);
        uint64_t v191 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v189 >= (int)v191) {
          IOSArray_throwOutOfBoundsWithMsg(v191, (v7 + 60));
        }
        int v192 = v7 + 61;
        *((void *)a5 + v189 + 2) = (v190 >> 57) & 0xFFFFFFFFFFF8007FLL | ((v181 & 0xFFF) << 7);
        uint64_t v193 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v192 >= (int)v193) {
          IOSArray_throwOutOfBoundsWithMsg(v193, (v7 + 61));
        }
        int v194 = v7 + 62;
        *((void *)a5 + v192 + 2) = (v190 >> 38) & 0x7FFFF;
        uint64_t v195 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v194 >= (int)v195) {
          IOSArray_throwOutOfBoundsWithMsg(v195, (v7 + 62));
        }
        int v196 = v7 + 63;
        *((void *)a5 + v194 + 2) = (v190 >> 19) & 0x7FFFF;
        uint64_t v197 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v196 >= (int)v197) {
          IOSArray_throwOutOfBoundsWithMsg(v197, (v7 + 63));
        }
        a4 = v10 + 19;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v196 + 2) = v190 & 0x7FFFF;
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
        *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v9 + 12) << 11) | (8 * v13) | (v14 >> 5);
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
        *((void *)a5 + v20 + 2) = ((v14 & 0x1F) << 14) | (v19 << 6) | (v21 >> 2);
        uint64_t v24 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 5));
        }
        int v25 = v9 + 6;
        uint64_t v26 = *((unsigned __int8 *)a3 + v23 + 12);
        if (v9 + 6 < 0 || v25 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 6));
        }
        int v27 = v9 + 7;
        uint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        if (v9 + 7 < 0 || v27 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v9 + 7));
        }
        int v29 = v7 + 2;
        unint64_t v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 2));
        }
        int v32 = v9 + 8;
        *((void *)a5 + v29 + 2) = ((v21 & 3) << 17) | (v26 << 9) | (2 * v28) | (v30 >> 7);
        uint64_t v33 = *((unsigned int *)a3 + 2);
        if (v9 + 8 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 8));
        }
        int v34 = v9 + 9;
        uint64_t v35 = *((unsigned __int8 *)a3 + v32 + 12);
        if (v9 + 9 < 0 || v34 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v9 + 9));
        }
        int v36 = v7 + 3;
        unint64_t v37 = *((unsigned __int8 *)a3 + v34 + 12);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 3));
        }
        int v39 = v9 + 10;
        *((void *)a5 + v36 + 2) = ((v30 & 0x7F) << 12) | (16 * v35) | (v37 >> 4);
        uint64_t v40 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v9 + 10));
        }
        int v41 = v9 + 11;
        uint64_t v42 = *((unsigned __int8 *)a3 + v39 + 12);
        if (v9 + 11 < 0 || v41 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v9 + 11));
        }
        int v43 = v7 + 4;
        unint64_t v44 = *((unsigned __int8 *)a3 + v41 + 12);
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v43 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 4));
        }
        int v46 = v9 + 12;
        *((void *)a5 + v43 + 2) = ((v37 & 0xF) << 15) | (v42 << 7) | (v44 >> 1);
        uint64_t v47 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 12));
        }
        int v48 = v9 + 13;
        uint64_t v49 = *((unsigned __int8 *)a3 + v46 + 12);
        if (v9 + 13 < 0 || v48 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 13));
        }
        int v50 = v9 + 14;
        uint64_t v51 = *((unsigned __int8 *)a3 + v48 + 12);
        if (v9 + 14 < 0 || v50 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v9 + 14));
        }
        int v52 = v7 + 5;
        unint64_t v53 = *((unsigned __int8 *)a3 + v50 + 12);
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v52 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 5));
        }
        int v55 = v9 + 15;
        *((void *)a5 + v52 + 2) = ((v44 & 1) << 18) | (v49 << 10) | (4 * v51) | (v53 >> 6);
        uint64_t v56 = *((unsigned int *)a3 + 2);
        if (v9 + 15 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 15));
        }
        int v57 = v9 + 16;
        uint64_t v58 = *((unsigned __int8 *)a3 + v55 + 12);
        if (v9 + 16 < 0 || v57 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v9 + 16));
        }
        int v59 = v7 + 6;
        unint64_t v60 = *((unsigned __int8 *)a3 + v57 + 12);
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v59 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 6));
        }
        int v62 = v9 + 17;
        *((void *)a5 + v59 + 2) = ((v53 & 0x3F) << 13) | (32 * v58) | (v60 >> 3);
        uint64_t v63 = *((unsigned int *)a3 + 2);
        if (v9 + 17 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v9 + 17));
        }
        int v64 = v9 + 18;
        uint64_t v65 = *((unsigned __int8 *)a3 + v62 + 12);
        if (v9 + 18 < 0 || v64 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v9 + 18));
        }
        int v66 = v7 + 7;
        uint64_t v67 = *((unsigned __int8 *)a3 + v64 + 12);
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v66 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 7));
        }
        *((void *)a5 + v66 + 2) = ((v60 & 7) << 16) | (v65 << 8) | v67;
        a4 = v9 + 19;
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