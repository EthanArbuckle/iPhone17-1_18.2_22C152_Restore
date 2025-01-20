@interface OrgApacheLuceneUtilPackedBulkOperationPacked13
- (OrgApacheLuceneUtilPackedBulkOperationPacked13)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked13

- (OrgApacheLuceneUtilPackedBulkOperationPacked13)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 51;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 38) & 0x1FFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 25) & 0x1FFF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        uint64_t v20 = (a4 + 1);
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 12) & 0x1FFF;
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
        *((_DWORD *)a5 + v22 + 3) = (v23 >> 63) | (2 * (v12 & 0xFFF));
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((_DWORD *)a5 + v25 + 3) = (v23 >> 50) & 0x1FFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((_DWORD *)a5 + v27 + 3) = (v23 >> 37) & 0x1FFF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((_DWORD *)a5 + v29 + 3) = (v23 >> 24) & 0x1FFF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v10 + 2;
        *((_DWORD *)a5 + v31 + 3) = (v23 >> 11) & 0x1FFF;
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v10 + 2));
        }
        int v35 = v7 + 9;
        unint64_t v36 = *((void *)a3 + v33 + 2);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v35 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((_DWORD *)a5 + v35 + 3) = (v36 >> 62) & 3 | (4 * (v23 & 0x7FF));
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v7 + 11;
        *((_DWORD *)a5 + v38 + 3) = (v36 >> 49) & 0x1FFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v7 + 12;
        *((_DWORD *)a5 + v40 + 3) = (v36 >> 36) & 0x1FFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 12));
        }
        int v44 = v7 + 13;
        *((_DWORD *)a5 + v42 + 3) = (v36 >> 23) & 0x1FFF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 13));
        }
        int v46 = v10 + 3;
        *((_DWORD *)a5 + v44 + 3) = (v36 >> 10) & 0x1FFF;
        uint64_t v47 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v10 + 3));
        }
        int v48 = v7 + 14;
        unint64_t v49 = *((void *)a3 + v46 + 2);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v48 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v7 + 15;
        *((_DWORD *)a5 + v48 + 3) = (v49 >> 61) & 7 | (8 * (v36 & 0x3FF));
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 15));
        }
        int v53 = v7 + 16;
        *((_DWORD *)a5 + v51 + 3) = HIWORD(v49) & 0x1FFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 16));
        }
        int v55 = v7 + 17;
        *((_DWORD *)a5 + v53 + 3) = (v49 >> 35) & 0x1FFF;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 17));
        }
        int v57 = v7 + 18;
        *((_DWORD *)a5 + v55 + 3) = (v49 >> 22) & 0x1FFF;
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 18));
        }
        int v59 = v10 + 4;
        *((_DWORD *)a5 + v57 + 3) = (v49 >> 9) & 0x1FFF;
        uint64_t v60 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v10 + 4));
        }
        int v61 = v7 + 19;
        unint64_t v62 = *((void *)a3 + v59 + 2);
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v61 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 19));
        }
        int v64 = v7 + 20;
        *((_DWORD *)a5 + v61 + 3) = (v62 >> 60) & 0xF | (16 * (v49 & 0x1FF));
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 20));
        }
        int v66 = v7 + 21;
        *((_DWORD *)a5 + v64 + 3) = (v62 >> 47) & 0x1FFF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 21));
        }
        int v68 = v7 + 22;
        *((_DWORD *)a5 + v66 + 3) = (v62 >> 34) & 0x1FFF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 22));
        }
        int v70 = v7 + 23;
        *((_DWORD *)a5 + v68 + 3) = (v62 >> 21) & 0x1FFF;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 23));
        }
        int v72 = v10 + 5;
        *((_DWORD *)a5 + v70 + 3) = (v62 >> 8) & 0x1FFF;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 5));
        }
        int v74 = v7 + 24;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 24));
        }
        int v77 = v7 + 25;
        *((_DWORD *)a5 + v74 + 3) = (v75 >> 59) & 0x1F | (32 * v62);
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 25));
        }
        int v79 = v7 + 26;
        *((_DWORD *)a5 + v77 + 3) = (v75 >> 46) & 0x1FFF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 26));
        }
        int v81 = v7 + 27;
        *((_DWORD *)a5 + v79 + 3) = (v75 >> 33) & 0x1FFF;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 27));
        }
        int v83 = v7 + 28;
        *((_DWORD *)a5 + v81 + 3) = (v75 >> 20) & 0x1FFF;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 28));
        }
        int v85 = v10 + 6;
        *((_DWORD *)a5 + v83 + 3) = (v75 >> 7) & 0x1FFF;
        uint64_t v86 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v10 + 6));
        }
        int v87 = v7 + 29;
        unint64_t v88 = *((void *)a3 + v85 + 2);
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v87 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 29));
        }
        int v90 = v7 + 30;
        *((_DWORD *)a5 + v87 + 3) = (v88 >> 58) & 0x3F | ((v75 & 0x7F) << 6);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 30));
        }
        int v92 = v7 + 31;
        *((_DWORD *)a5 + v90 + 3) = (v88 >> 45) & 0x1FFF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 31));
        }
        int v94 = v7 + 32;
        *((_DWORD *)a5 + v92 + 3) = WORD2(v88) & 0x1FFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 32));
        }
        int v96 = v7 + 33;
        *((_DWORD *)a5 + v94 + 3) = v88 >> 19;
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 33));
        }
        int v98 = v10 + 7;
        *((_DWORD *)a5 + v96 + 3) = (v88 >> 6) & 0x1FFF;
        uint64_t v99 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v10 + 7));
        }
        int v100 = v7 + 34;
        unint64_t v101 = *((void *)a3 + v98 + 2);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v100 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 34));
        }
        int v103 = v7 + 35;
        *((_DWORD *)a5 + v100 + 3) = (v101 >> 57) & 0x7F | ((v88 & 0x3F) << 7);
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 35));
        }
        int v105 = v7 + 36;
        *((_DWORD *)a5 + v103 + 3) = (v101 >> 44) & 0x1FFF;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 36));
        }
        int v107 = v7 + 37;
        *((_DWORD *)a5 + v105 + 3) = (v101 >> 31) & 0x1FFF;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 37));
        }
        int v109 = v7 + 38;
        *((_DWORD *)a5 + v107 + 3) = (v101 >> 18) & 0x1FFF;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 38));
        }
        int v111 = v10 + 8;
        *((_DWORD *)a5 + v109 + 3) = (v101 >> 5) & 0x1FFF;
        uint64_t v112 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v10 + 8));
        }
        int v113 = v7 + 39;
        unint64_t v114 = *((void *)a3 + v111 + 2);
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v113 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 39));
        }
        int v116 = v7 + 40;
        *((_DWORD *)a5 + v113 + 3) = HIBYTE(v114) | ((v101 & 0x1F) << 8);
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 40));
        }
        int v118 = v7 + 41;
        *((_DWORD *)a5 + v116 + 3) = (v114 >> 43) & 0x1FFF;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 41));
        }
        int v120 = v7 + 42;
        *((_DWORD *)a5 + v118 + 3) = (v114 >> 30) & 0x1FFF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 42));
        }
        int v122 = v7 + 43;
        *((_DWORD *)a5 + v120 + 3) = (v114 >> 17) & 0x1FFF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 43));
        }
        int v124 = v10 + 9;
        *((_DWORD *)a5 + v122 + 3) = (v114 >> 4) & 0x1FFF;
        uint64_t v125 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v10 + 9));
        }
        int v126 = v7 + 44;
        unint64_t v127 = *((void *)a3 + v124 + 2);
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v126 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 44));
        }
        int v129 = v7 + 45;
        *((_DWORD *)a5 + v126 + 3) = (v127 >> 55) & 0xE1FF | ((v114 & 0xF) << 9);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 45));
        }
        int v131 = v7 + 46;
        *((_DWORD *)a5 + v129 + 3) = (v127 >> 42) & 0x1FFF;
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 46));
        }
        int v133 = v7 + 47;
        *((_DWORD *)a5 + v131 + 3) = (v127 >> 29) & 0x1FFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 47));
        }
        int v135 = v7 + 48;
        *((_DWORD *)a5 + v133 + 3) = WORD1(v127) & 0x1FFF;
        uint64_t v136 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v7 + 48));
        }
        int v137 = v10 + 10;
        *((_DWORD *)a5 + v135 + 3) = (unsigned __int16)v127 >> 3;
        uint64_t v138 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v137 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v10 + 10));
        }
        int v139 = v7 + 49;
        unint64_t v140 = *((void *)a3 + v137 + 2);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v139 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 49));
        }
        int v142 = v7 + 50;
        *((_DWORD *)a5 + v139 + 3) = (v140 >> 54) & 0xE3FF | ((v127 & 7) << 10);
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 50));
        }
        int v144 = v7 + 51;
        *((_DWORD *)a5 + v142 + 3) = (v140 >> 41) & 0x1FFF;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 51));
        }
        int v146 = v7 + 52;
        *((_DWORD *)a5 + v144 + 3) = (v140 >> 28) & 0x1FFF;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 52));
        }
        int v148 = v7 + 53;
        *((_DWORD *)a5 + v146 + 3) = (v140 >> 15) & 0x1FFF;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 53));
        }
        int v150 = v10 + 11;
        *((_DWORD *)a5 + v148 + 3) = (v140 >> 2) & 0x1FFF;
        uint64_t v151 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v10 + 11));
        }
        int v152 = v7 + 54;
        unint64_t v153 = *((void *)a3 + v150 + 2);
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v152 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 54));
        }
        int v155 = v7 + 55;
        *((_DWORD *)a5 + v152 + 3) = (v153 >> 53) & 0xE7FF | ((v140 & 3) << 11);
        uint64_t v156 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v7 + 55));
        }
        int v157 = v7 + 56;
        *((_DWORD *)a5 + v155 + 3) = (v153 >> 40) & 0x1FFF;
        uint64_t v158 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v157 >= (int)v158) {
          IOSArray_throwOutOfBoundsWithMsg(v158, (v7 + 56));
        }
        int v159 = v7 + 57;
        *((_DWORD *)a5 + v157 + 3) = (v153 >> 27) & 0x1FFF;
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v159 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 57));
        }
        int v161 = v7 + 58;
        *((_DWORD *)a5 + v159 + 3) = (v153 >> 14) & 0x1FFF;
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 58));
        }
        int v163 = v10 + 12;
        *((_DWORD *)a5 + v161 + 3) = (v153 >> 1) & 0x1FFF;
        uint64_t v164 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v10 + 12));
        }
        int v165 = v7 + 59;
        unint64_t v166 = *((void *)a3 + v163 + 2);
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v165 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 59));
        }
        int v168 = v7 + 60;
        *((_DWORD *)a5 + v165 + 3) = (v166 >> 52) & 0xEFFF | ((v153 & 1) << 12);
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 60));
        }
        int v170 = v7 + 61;
        *((_DWORD *)a5 + v168 + 3) = (v166 >> 39) & 0x1FFF;
        uint64_t v171 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v170 >= (int)v171) {
          IOSArray_throwOutOfBoundsWithMsg(v171, (v7 + 61));
        }
        int v172 = v7 + 62;
        *((_DWORD *)a5 + v170 + 3) = (v166 >> 26) & 0x1FFF;
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 62));
        }
        int v174 = v7 + 63;
        *((_DWORD *)a5 + v172 + 3) = (v166 >> 13) & 0x1FFF;
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 63));
        }
        a4 = v10 + 13;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v174 + 3) = v166 & 0x1FFF;
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
        *((_DWORD *)a5 + (int)v7 + 3) = (v12 >> 3) | (32 * *((unsigned __int8 *)a3 + v9 + 12));
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
        *((_DWORD *)a5 + v18 + 3) = ((v12 & 7) << 10) | (4 * v17) | (v19 >> 6);
        uint64_t v22 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 4));
        }
        int v23 = v7 + 2;
        unsigned int v24 = *((unsigned __int8 *)a3 + v21 + 12);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 2));
        }
        int v26 = v9 + 5;
        *((_DWORD *)a5 + v23 + 3) = (v24 >> 1) & 0xFFFFE07F | ((v19 & 0x3F) << 7);
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 5));
        }
        int v28 = v9 + 6;
        int v29 = *((unsigned __int8 *)a3 + v26 + 12);
        if (v9 + 6 < 0 || v28 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 6));
        }
        int v30 = v7 + 3;
        unsigned int v31 = *((unsigned __int8 *)a3 + v28 + 12);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v30 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 3));
        }
        int v33 = v9 + 7;
        *((_DWORD *)a5 + v30 + 3) = ((v24 & 1) << 12) | (16 * v29) | (v31 >> 4);
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 7));
        }
        int v35 = v9 + 8;
        int v36 = *((unsigned __int8 *)a3 + v33 + 12);
        if (v9 + 8 < 0 || v35 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 8));
        }
        int v37 = v7 + 4;
        unsigned int v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 4));
        }
        int v40 = v9 + 9;
        *((_DWORD *)a5 + v37 + 3) = ((v31 & 0xF) << 9) | (2 * v36) | (v38 >> 7);
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v9 + 9));
        }
        int v42 = v7 + 5;
        unsigned int v43 = *((unsigned __int8 *)a3 + v40 + 12);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 5));
        }
        int v45 = v9 + 10;
        *((_DWORD *)a5 + v42 + 3) = (v43 >> 2) & 0xFFFFE03F | ((v38 & 0x7F) << 6);
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v9 + 10));
        }
        int v47 = v9 + 11;
        int v48 = *((unsigned __int8 *)a3 + v45 + 12);
        if (v9 + 11 < 0 || v47 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v9 + 11));
        }
        int v49 = v7 + 6;
        unsigned int v50 = *((unsigned __int8 *)a3 + v47 + 12);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v49 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 6));
        }
        int v52 = v9 + 12;
        *((_DWORD *)a5 + v49 + 3) = ((v43 & 3) << 11) | (8 * v48) | (v50 >> 5);
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 12));
        }
        int v54 = v7 + 7;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 7));
        }
        *((_DWORD *)a5 + v54 + 3) = *((unsigned __int8 *)a3 + v52 + 12) | ((v50 & 0x1F) << 8);
        a4 = v9 + 13;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 51;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 38) & 0x1FFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 25) & 0x1FFF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = a4 + 1;
        *((void *)a5 + v18 + 2) = (v12 >> 12) & 0x1FFF;
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
        *((void *)a5 + v22 + 2) = (v23 >> 63) | (2 * (v12 & 0xFFF));
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v7 + 5));
        }
        int v27 = v7 + 6;
        *((void *)a5 + v25 + 2) = (v23 >> 50) & 0x1FFF;
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v7 + 6));
        }
        int v29 = v7 + 7;
        *((void *)a5 + v27 + 2) = (v23 >> 37) & 0x1FFF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((void *)a5 + v29 + 2) = (v23 >> 24) & 0x1FFF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v10 + 2;
        *((void *)a5 + v31 + 2) = (v23 >> 11) & 0x1FFF;
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v10 + 2));
        }
        int v35 = v7 + 9;
        unint64_t v36 = *((void *)a3 + v33 + 2);
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v35 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 9));
        }
        int v38 = v7 + 10;
        *((void *)a5 + v35 + 2) = (v36 >> 62) & 0xFFFFFFFFFFFFE003 | (4 * (v23 & 0x7FF));
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 10));
        }
        int v40 = v7 + 11;
        *((void *)a5 + v38 + 2) = (v36 >> 49) & 0x1FFF;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 11));
        }
        int v42 = v7 + 12;
        *((void *)a5 + v40 + 2) = (v36 >> 36) & 0x1FFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 12));
        }
        int v44 = v7 + 13;
        *((void *)a5 + v42 + 2) = (v36 >> 23) & 0x1FFF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 13));
        }
        int v46 = v10 + 3;
        *((void *)a5 + v44 + 2) = (v36 >> 10) & 0x1FFF;
        uint64_t v47 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v10 + 3));
        }
        int v48 = v7 + 14;
        unint64_t v49 = *((void *)a3 + v46 + 2);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v48 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 14));
        }
        int v51 = v7 + 15;
        *((void *)a5 + v48 + 2) = (v49 >> 61) & 0xFFFFFFFFFFFFE007 | (8 * (v36 & 0x3FF));
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 15));
        }
        int v53 = v7 + 16;
        *((void *)a5 + v51 + 2) = HIWORD(v49) & 0x1FFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 16));
        }
        int v55 = v7 + 17;
        *((void *)a5 + v53 + 2) = (v49 >> 35) & 0x1FFF;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 17));
        }
        int v57 = v7 + 18;
        *((void *)a5 + v55 + 2) = (v49 >> 22) & 0x1FFF;
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 18));
        }
        int v59 = v10 + 4;
        *((void *)a5 + v57 + 2) = (v49 >> 9) & 0x1FFF;
        uint64_t v60 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v10 + 4));
        }
        int v61 = v7 + 19;
        unint64_t v62 = *((void *)a3 + v59 + 2);
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v61 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 19));
        }
        int v64 = v7 + 20;
        *((void *)a5 + v61 + 2) = (v62 >> 60) & 0xFFFFFFFFFFFFE00FLL | (16 * (v49 & 0x1FF));
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 20));
        }
        int v66 = v7 + 21;
        *((void *)a5 + v64 + 2) = (v62 >> 47) & 0x1FFF;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 21));
        }
        int v68 = v7 + 22;
        *((void *)a5 + v66 + 2) = (v62 >> 34) & 0x1FFF;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 22));
        }
        int v70 = v7 + 23;
        *((void *)a5 + v68 + 2) = (v62 >> 21) & 0x1FFF;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 23));
        }
        int v72 = v10 + 5;
        *((void *)a5 + v70 + 2) = (v62 >> 8) & 0x1FFF;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 5));
        }
        int v74 = v7 + 24;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 24));
        }
        int v77 = v7 + 25;
        *((void *)a5 + v74 + 2) = (v75 >> 59) & 0xFFFFFFFFFFFFE01FLL | (32 * v62);
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 25));
        }
        int v79 = v7 + 26;
        *((void *)a5 + v77 + 2) = (v75 >> 46) & 0x1FFF;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 26));
        }
        int v81 = v7 + 27;
        *((void *)a5 + v79 + 2) = (v75 >> 33) & 0x1FFF;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 27));
        }
        int v83 = v7 + 28;
        *((void *)a5 + v81 + 2) = (v75 >> 20) & 0x1FFF;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 28));
        }
        int v85 = v10 + 6;
        *((void *)a5 + v83 + 2) = (v75 >> 7) & 0x1FFF;
        uint64_t v86 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v10 + 6));
        }
        int v87 = v7 + 29;
        unint64_t v88 = *((void *)a3 + v85 + 2);
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v87 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 29));
        }
        int v90 = v7 + 30;
        *((void *)a5 + v87 + 2) = (v88 >> 58) & 0xFFFFFFFFFFFFE03FLL | ((v75 & 0x7F) << 6);
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 30));
        }
        int v92 = v7 + 31;
        *((void *)a5 + v90 + 2) = (v88 >> 45) & 0x1FFF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 31));
        }
        int v94 = v7 + 32;
        *((void *)a5 + v92 + 2) = HIDWORD(v88) & 0x1FFF;
        uint64_t v95 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v7 + 32));
        }
        int v96 = v7 + 33;
        *((void *)a5 + v94 + 2) = v88 >> 19;
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v96 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 33));
        }
        int v98 = v10 + 7;
        *((void *)a5 + v96 + 2) = (v88 >> 6) & 0x1FFF;
        uint64_t v99 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v10 + 7));
        }
        int v100 = v7 + 34;
        unint64_t v101 = *((void *)a3 + v98 + 2);
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v100 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 34));
        }
        int v103 = v7 + 35;
        *((void *)a5 + v100 + 2) = (v101 >> 57) & 0xFFFFFFFFFFFFE07FLL | ((v88 & 0x3F) << 7);
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 35));
        }
        int v105 = v7 + 36;
        *((void *)a5 + v103 + 2) = (v101 >> 44) & 0x1FFF;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 36));
        }
        int v107 = v7 + 37;
        *((void *)a5 + v105 + 2) = (v101 >> 31) & 0x1FFF;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 37));
        }
        int v109 = v7 + 38;
        *((void *)a5 + v107 + 2) = (v101 >> 18) & 0x1FFF;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 38));
        }
        int v111 = v10 + 8;
        *((void *)a5 + v109 + 2) = (v101 >> 5) & 0x1FFF;
        uint64_t v112 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v10 + 8));
        }
        int v113 = v7 + 39;
        unint64_t v114 = *((void *)a3 + v111 + 2);
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v113 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 39));
        }
        int v116 = v7 + 40;
        *((void *)a5 + v113 + 2) = HIBYTE(v114) & 0xFFFFFFFFFFFFE0FFLL | ((v101 & 0x1F) << 8);
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 40));
        }
        int v118 = v7 + 41;
        *((void *)a5 + v116 + 2) = (v114 >> 43) & 0x1FFF;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 41));
        }
        int v120 = v7 + 42;
        *((void *)a5 + v118 + 2) = (v114 >> 30) & 0x1FFF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 42));
        }
        int v122 = v7 + 43;
        *((void *)a5 + v120 + 2) = (v114 >> 17) & 0x1FFF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 43));
        }
        int v124 = v10 + 9;
        *((void *)a5 + v122 + 2) = (v114 >> 4) & 0x1FFF;
        uint64_t v125 = *((unsigned int *)a3 + 2);
        if (v10 + 9 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v10 + 9));
        }
        int v126 = v7 + 44;
        unint64_t v127 = *((void *)a3 + v124 + 2);
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v126 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 44));
        }
        int v129 = v7 + 45;
        *((void *)a5 + v126 + 2) = (v127 >> 55) & 0xFFFFFFFFFFFFE1FFLL | ((v114 & 0xF) << 9);
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 45));
        }
        int v131 = v7 + 46;
        *((void *)a5 + v129 + 2) = (v127 >> 42) & 0x1FFF;
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 46));
        }
        int v133 = v7 + 47;
        *((void *)a5 + v131 + 2) = (v127 >> 29) & 0x1FFF;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 47));
        }
        int v135 = v7 + 48;
        *((void *)a5 + v133 + 2) = (v127 >> 16) & 0x1FFF;
        uint64_t v136 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v7 + 48));
        }
        int v137 = v10 + 10;
        *((void *)a5 + v135 + 2) = (unsigned __int16)v127 >> 3;
        uint64_t v138 = *((unsigned int *)a3 + 2);
        if (v10 + 10 < 0 || v137 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v10 + 10));
        }
        int v139 = v7 + 49;
        unint64_t v140 = *((void *)a3 + v137 + 2);
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v139 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 49));
        }
        int v142 = v7 + 50;
        *((void *)a5 + v139 + 2) = (v140 >> 54) & 0xFFFFFFFFFFFFE3FFLL | ((v127 & 7) << 10);
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 50));
        }
        int v144 = v7 + 51;
        *((void *)a5 + v142 + 2) = (v140 >> 41) & 0x1FFF;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 51));
        }
        int v146 = v7 + 52;
        *((void *)a5 + v144 + 2) = (v140 >> 28) & 0x1FFF;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 52));
        }
        int v148 = v7 + 53;
        *((void *)a5 + v146 + 2) = (v140 >> 15) & 0x1FFF;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 53));
        }
        int v150 = v10 + 11;
        *((void *)a5 + v148 + 2) = (v140 >> 2) & 0x1FFF;
        uint64_t v151 = *((unsigned int *)a3 + 2);
        if (v10 + 11 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v10 + 11));
        }
        int v152 = v7 + 54;
        unint64_t v153 = *((void *)a3 + v150 + 2);
        uint64_t v154 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v152 >= (int)v154) {
          IOSArray_throwOutOfBoundsWithMsg(v154, (v7 + 54));
        }
        int v155 = v7 + 55;
        *((void *)a5 + v152 + 2) = (v153 >> 53) & 0xFFFFFFFFFFFFE7FFLL | ((v140 & 3) << 11);
        uint64_t v156 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v155 >= (int)v156) {
          IOSArray_throwOutOfBoundsWithMsg(v156, (v7 + 55));
        }
        int v157 = v7 + 56;
        *((void *)a5 + v155 + 2) = (v153 >> 40) & 0x1FFF;
        uint64_t v158 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v157 >= (int)v158) {
          IOSArray_throwOutOfBoundsWithMsg(v158, (v7 + 56));
        }
        int v159 = v7 + 57;
        *((void *)a5 + v157 + 2) = (v153 >> 27) & 0x1FFF;
        uint64_t v160 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v159 >= (int)v160) {
          IOSArray_throwOutOfBoundsWithMsg(v160, (v7 + 57));
        }
        int v161 = v7 + 58;
        *((void *)a5 + v159 + 2) = (v153 >> 14) & 0x1FFF;
        uint64_t v162 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v161 >= (int)v162) {
          IOSArray_throwOutOfBoundsWithMsg(v162, (v7 + 58));
        }
        int v163 = v10 + 12;
        *((void *)a5 + v161 + 2) = (v153 >> 1) & 0x1FFF;
        uint64_t v164 = *((unsigned int *)a3 + 2);
        if (v10 + 12 < 0 || v163 >= (int)v164) {
          IOSArray_throwOutOfBoundsWithMsg(v164, (v10 + 12));
        }
        int v165 = v7 + 59;
        unint64_t v166 = *((void *)a3 + v163 + 2);
        uint64_t v167 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v165 >= (int)v167) {
          IOSArray_throwOutOfBoundsWithMsg(v167, (v7 + 59));
        }
        int v168 = v7 + 60;
        *((void *)a5 + v165 + 2) = (v166 >> 52) & 0xFFFFFFFFFFFFEFFFLL | ((v153 & 1) << 12);
        uint64_t v169 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v168 >= (int)v169) {
          IOSArray_throwOutOfBoundsWithMsg(v169, (v7 + 60));
        }
        int v170 = v7 + 61;
        *((void *)a5 + v168 + 2) = (v166 >> 39) & 0x1FFF;
        uint64_t v171 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v170 >= (int)v171) {
          IOSArray_throwOutOfBoundsWithMsg(v171, (v7 + 61));
        }
        int v172 = v7 + 62;
        *((void *)a5 + v170 + 2) = (v166 >> 26) & 0x1FFF;
        uint64_t v173 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v172 >= (int)v173) {
          IOSArray_throwOutOfBoundsWithMsg(v173, (v7 + 62));
        }
        int v174 = v7 + 63;
        *((void *)a5 + v172 + 2) = (v166 >> 13) & 0x1FFF;
        uint64_t v175 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v174 >= (int)v175) {
          IOSArray_throwOutOfBoundsWithMsg(v175, (v7 + 63));
        }
        a4 = v10 + 13;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v174 + 2) = v166 & 0x1FFF;
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
        *((void *)a5 + (int)v7 + 2) = (v12 >> 3) | (32 * *((unsigned __int8 *)a3 + v9 + 12));
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
        *((void *)a5 + v18 + 2) = ((v12 & 7) << 10) | (4 * v17) | (v19 >> 6);
        uint64_t v22 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v9 + 4));
        }
        int v23 = v7 + 2;
        unint64_t v24 = *((unsigned __int8 *)a3 + v21 + 12);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 2));
        }
        int v26 = v9 + 5;
        *((void *)a5 + v23 + 2) = (v24 >> 1) & 0xFFFFFFFFFFFFE07FLL | ((v19 & 0x3F) << 7);
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 5 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 5));
        }
        int v28 = v9 + 6;
        uint64_t v29 = *((unsigned __int8 *)a3 + v26 + 12);
        if (v9 + 6 < 0 || v28 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 6));
        }
        int v30 = v7 + 3;
        unint64_t v31 = *((unsigned __int8 *)a3 + v28 + 12);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v30 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 3));
        }
        int v33 = v9 + 7;
        *((void *)a5 + v30 + 2) = ((v24 & 1) << 12) | (16 * v29) | (v31 >> 4);
        uint64_t v34 = *((unsigned int *)a3 + 2);
        if (v9 + 7 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 7));
        }
        int v35 = v9 + 8;
        uint64_t v36 = *((unsigned __int8 *)a3 + v33 + 12);
        if (v9 + 8 < 0 || v35 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v9 + 8));
        }
        int v37 = v7 + 4;
        unint64_t v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 4));
        }
        int v40 = v9 + 9;
        *((void *)a5 + v37 + 2) = ((v31 & 0xF) << 9) | (2 * v36) | (v38 >> 7);
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v9 + 9 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v9 + 9));
        }
        int v42 = v7 + 5;
        unint64_t v43 = *((unsigned __int8 *)a3 + v40 + 12);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 5));
        }
        int v45 = v9 + 10;
        *((void *)a5 + v42 + 2) = (v43 >> 2) & 0xFFFFFFFFFFFFE03FLL | ((v38 & 0x7F) << 6);
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v9 + 10 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v9 + 10));
        }
        int v47 = v9 + 11;
        uint64_t v48 = *((unsigned __int8 *)a3 + v45 + 12);
        if (v9 + 11 < 0 || v47 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v9 + 11));
        }
        int v49 = v7 + 6;
        unint64_t v50 = *((unsigned __int8 *)a3 + v47 + 12);
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v49 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 6));
        }
        int v52 = v9 + 12;
        *((void *)a5 + v49 + 2) = ((v43 & 3) << 11) | (8 * v48) | (v50 >> 5);
        uint64_t v53 = *((unsigned int *)a3 + 2);
        if (v9 + 12 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v9 + 12));
        }
        int v54 = v7 + 7;
        uint64_t v55 = *((unsigned __int8 *)a3 + v52 + 12);
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v54 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 7));
        }
        *((void *)a5 + v54 + 2) = v55 & 0xFFFFFFFFFFFFE0FFLL | ((v50 & 0x1F) << 8);
        a4 = v9 + 13;
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