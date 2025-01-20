@interface OrgApacheLuceneUtilPackedBulkOperationPacked7
- (OrgApacheLuceneUtilPackedBulkOperationPacked7)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked7

- (OrgApacheLuceneUtilPackedBulkOperationPacked7)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 57;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 50) & 0x7F;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 43) & 0x7F;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 36) & 0x7F;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((_DWORD *)a5 + v20 + 3) = (v12 >> 29) & 0x7F;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((_DWORD *)a5 + v22 + 3) = (v12 >> 22) & 0x7F;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((_DWORD *)a5 + v24 + 3) = (v12 >> 15) & 0x7F;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((_DWORD *)a5 + v26 + 3) = (v12 >> 8) & 0x7F;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        uint64_t v30 = (a4 + 1);
        *((_DWORD *)a5 + v28 + 3) = v12 >> 1;
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if ((v30 & 0x80000000) != 0 || (int)v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, v30);
        }
        int v32 = v7 + 9;
        unint64_t v33 = *((void *)a3 + (int)v30 + 2);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((_DWORD *)a5 + v32 + 3) = (v33 >> 58) & 0xBF | ((v12 & 1) << 6);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v7 + 11;
        *((_DWORD *)a5 + v35 + 3) = (v33 >> 51) & 0x7F;
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 11));
        }
        int v39 = v7 + 12;
        *((_DWORD *)a5 + v37 + 3) = (v33 >> 44) & 0x7F;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((_DWORD *)a5 + v39 + 3) = (v33 >> 37) & 0x7F;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v7 + 14;
        *((_DWORD *)a5 + v41 + 3) = (v33 >> 30) & 0x7F;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 14));
        }
        int v45 = v7 + 15;
        *((_DWORD *)a5 + v43 + 3) = (v33 >> 23) & 0x7F;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 15));
        }
        int v47 = v7 + 16;
        *((_DWORD *)a5 + v45 + 3) = WORD1(v33) & 0x7F;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 16));
        }
        int v49 = v7 + 17;
        *((_DWORD *)a5 + v47 + 3) = (unsigned __int16)v33 >> 9;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 17));
        }
        int v51 = v10 + 2;
        *((_DWORD *)a5 + v49 + 3) = (v33 >> 2) & 0x7F;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 2));
        }
        int v53 = v7 + 18;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 18));
        }
        int v56 = v7 + 19;
        *((_DWORD *)a5 + v53 + 3) = (v54 >> 59) & 0x9F | (32 * (v33 & 3));
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 19));
        }
        int v58 = v7 + 20;
        *((_DWORD *)a5 + v56 + 3) = (v54 >> 52) & 0x7F;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 20));
        }
        int v60 = v7 + 21;
        *((_DWORD *)a5 + v58 + 3) = (v54 >> 45) & 0x7F;
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 21));
        }
        int v62 = v7 + 22;
        *((_DWORD *)a5 + v60 + 3) = (v54 >> 38) & 0x7F;
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 22));
        }
        int v64 = v7 + 23;
        *((_DWORD *)a5 + v62 + 3) = (v54 >> 31) & 0x7F;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 23));
        }
        int v66 = v7 + 24;
        *((_DWORD *)a5 + v64 + 3) = BYTE3(v54) & 0x7F;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 24));
        }
        int v68 = v7 + 25;
        *((_DWORD *)a5 + v66 + 3) = (v54 >> 17) & 0x7F;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 25));
        }
        int v70 = v7 + 26;
        *((_DWORD *)a5 + v68 + 3) = (v54 >> 10) & 0x7F;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 26));
        }
        int v72 = v10 + 3;
        *((_DWORD *)a5 + v70 + 3) = (v54 >> 3) & 0x7F;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 3));
        }
        int v74 = v7 + 27;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 27));
        }
        int v77 = v7 + 28;
        *((_DWORD *)a5 + v74 + 3) = (v75 >> 60) & 0x8F | (16 * (v54 & 7));
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 28));
        }
        int v79 = v7 + 29;
        *((_DWORD *)a5 + v77 + 3) = (v75 >> 53) & 0x7F;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 29));
        }
        int v81 = v7 + 30;
        *((_DWORD *)a5 + v79 + 3) = (v75 >> 46) & 0x7F;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 30));
        }
        int v83 = v7 + 31;
        *((_DWORD *)a5 + v81 + 3) = (v75 >> 39) & 0x7F;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 31));
        }
        int v85 = v7 + 32;
        *((_DWORD *)a5 + v83 + 3) = BYTE4(v75) & 0x7F;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 32));
        }
        int v87 = v7 + 33;
        *((_DWORD *)a5 + v85 + 3) = v75 >> 25;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 33));
        }
        int v89 = v7 + 34;
        *((_DWORD *)a5 + v87 + 3) = (v75 >> 18) & 0x7F;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 34));
        }
        int v91 = v7 + 35;
        *((_DWORD *)a5 + v89 + 3) = (v75 >> 11) & 0x7F;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 35));
        }
        int v93 = v10 + 4;
        *((_DWORD *)a5 + v91 + 3) = (v75 >> 4) & 0x7F;
        uint64_t v94 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v10 + 4));
        }
        int v95 = v7 + 36;
        unint64_t v96 = *((void *)a3 + v93 + 2);
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v95 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 36));
        }
        int v98 = v7 + 37;
        *((_DWORD *)a5 + v95 + 3) = (v96 >> 61) & 0x87 | (8 * (v75 & 0xF));
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 37));
        }
        int v100 = v7 + 38;
        *((_DWORD *)a5 + v98 + 3) = (v96 >> 54) & 0x7F;
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 38));
        }
        int v102 = v7 + 39;
        *((_DWORD *)a5 + v100 + 3) = (v96 >> 47) & 0x7F;
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 39));
        }
        int v104 = v7 + 40;
        *((_DWORD *)a5 + v102 + 3) = (v96 >> 40) & 0x7F;
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 40));
        }
        int v106 = v7 + 41;
        *((_DWORD *)a5 + v104 + 3) = (v96 >> 33) & 0x7F;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 41));
        }
        int v108 = v7 + 42;
        *((_DWORD *)a5 + v106 + 3) = (v96 >> 26) & 0x7F;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 42));
        }
        int v110 = v7 + 43;
        *((_DWORD *)a5 + v108 + 3) = (v96 >> 19) & 0x7F;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 43));
        }
        int v112 = v7 + 44;
        *((_DWORD *)a5 + v110 + 3) = (v96 >> 12) & 0x7F;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 44));
        }
        int v114 = v10 + 5;
        *((_DWORD *)a5 + v112 + 3) = (v96 >> 5) & 0x7F;
        uint64_t v115 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v10 + 5));
        }
        int v116 = v7 + 45;
        unint64_t v117 = *((void *)a3 + v114 + 2);
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v116 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 45));
        }
        int v119 = v7 + 46;
        *((_DWORD *)a5 + v116 + 3) = (v117 >> 62) & 0x83 | (4 * (v96 & 0x1F));
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 46));
        }
        int v121 = v7 + 47;
        *((_DWORD *)a5 + v119 + 3) = (v117 >> 55) & 0x7F;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 47));
        }
        int v123 = v7 + 48;
        *((_DWORD *)a5 + v121 + 3) = HIWORD(v117) & 0x7F;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 48));
        }
        int v125 = v7 + 49;
        *((_DWORD *)a5 + v123 + 3) = (v117 >> 41) & 0x7F;
        uint64_t v126 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v7 + 49));
        }
        int v127 = v7 + 50;
        *((_DWORD *)a5 + v125 + 3) = (v117 >> 34) & 0x7F;
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v127 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 50));
        }
        int v129 = v7 + 51;
        *((_DWORD *)a5 + v127 + 3) = (v117 >> 27) & 0x7F;
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 51));
        }
        int v131 = v7 + 52;
        *((_DWORD *)a5 + v129 + 3) = (v117 >> 20) & 0x7F;
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 52));
        }
        int v133 = v7 + 53;
        *((_DWORD *)a5 + v131 + 3) = (v117 >> 13) & 0x7F;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 53));
        }
        int v135 = v10 + 6;
        *((_DWORD *)a5 + v133 + 3) = (v117 >> 6) & 0x7F;
        uint64_t v136 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v10 + 6));
        }
        int v137 = v7 + 54;
        unint64_t v138 = *((void *)a3 + v135 + 2);
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v137 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 54));
        }
        int v140 = v7 + 55;
        *((_DWORD *)a5 + v137 + 3) = (v138 >> 63) | (2 * (v117 & 0x3F));
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 55));
        }
        int v142 = v7 + 56;
        *((_DWORD *)a5 + v140 + 3) = HIBYTE(v138) & 0x7F;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 56));
        }
        int v144 = v7 + 57;
        *((_DWORD *)a5 + v142 + 3) = (v138 >> 49) & 0x7F;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 57));
        }
        int v146 = v7 + 58;
        *((_DWORD *)a5 + v144 + 3) = (v138 >> 42) & 0x7F;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 58));
        }
        int v148 = v7 + 59;
        *((_DWORD *)a5 + v146 + 3) = (v138 >> 35) & 0x7F;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 59));
        }
        int v150 = v7 + 60;
        *((_DWORD *)a5 + v148 + 3) = (v138 >> 28) & 0x7F;
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 60));
        }
        int v152 = v7 + 61;
        *((_DWORD *)a5 + v150 + 3) = (v138 >> 21) & 0x7F;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 61));
        }
        int v154 = v7 + 62;
        *((_DWORD *)a5 + v152 + 3) = (v138 >> 14) & 0x7F;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 62));
        }
        int v156 = v7 + 63;
        *((_DWORD *)a5 + v154 + 3) = (v138 >> 7) & 0x7F;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 63));
        }
        a4 = v10 + 7;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v156 + 3) = v138 & 0x7F;
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
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 1;
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
        *((_DWORD *)a5 + v16 + 3) = (v17 >> 2) & 0xFFFFFFBF | ((v12 & 1) << 6);
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
        int v24 = v10 + 3;
        *((_DWORD *)a5 + v21 + 3) = (v22 >> 3) & 0xFFFFFF9F | (32 * (v17 & 3));
        uint64_t v25 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v10 + 3));
        }
        int v26 = v8 + 3;
        unsigned int v27 = *((unsigned __int8 *)a3 + v24 + 12);
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v26 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v8 + 3));
        }
        int v29 = v10 + 4;
        *((_DWORD *)a5 + v26 + 3) = (v27 >> 4) & 0xFFFFFF8F | (16 * (v22 & 7));
        uint64_t v30 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v10 + 4));
        }
        int v31 = v8 + 4;
        unsigned int v32 = *((unsigned __int8 *)a3 + v29 + 12);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 4));
        }
        int v34 = v10 + 5;
        *((_DWORD *)a5 + v31 + 3) = (v32 >> 5) & 0xFFFFFF87 | (8 * (v27 & 0xF));
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v10 + 5));
        }
        int v36 = v8 + 5;
        unsigned int v37 = *((unsigned __int8 *)a3 + v34 + 12);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v8 + 5));
        }
        int v39 = v10 + 6;
        *((_DWORD *)a5 + v36 + 3) = (v37 >> 6) & 0xFFFFFF83 | (4 * (v32 & 0x1F));
        uint64_t v40 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v10 + 6));
        }
        int v41 = v8 + 6;
        unsigned int v42 = *((unsigned __int8 *)a3 + v39 + 12);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v8 + 6));
        }
        int v44 = v8 + 7;
        *((_DWORD *)a5 + v41 + 3) = (v42 >> 7) & 0xFFFFFF81 | (2 * (v37 & 0x3F));
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v8 + 7));
        }
        *((_DWORD *)a5 + v44 + 3) = v42 & 0x7F;
        a4 = v10 + 7;
        uint64_t v8 = (v8 + 8);
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 57;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 50) & 0x7F;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 43) & 0x7F;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 36) & 0x7F;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((void *)a5 + v20 + 2) = (v12 >> 29) & 0x7F;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((void *)a5 + v22 + 2) = (v12 >> 22) & 0x7F;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((void *)a5 + v24 + 2) = (v12 >> 15) & 0x7F;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((void *)a5 + v26 + 2) = (v12 >> 8) & 0x7F;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        int v30 = a4 + 1;
        *((void *)a5 + v28 + 2) = v12 >> 1;
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (a4 + 1));
        }
        int v32 = v7 + 9;
        unint64_t v33 = *((void *)a3 + v30 + 2);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((void *)a5 + v32 + 2) = (v33 >> 58) & 0xFFFFFFFFFFFFFFBFLL | ((v12 & 1) << 6);
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v7 + 11;
        *((void *)a5 + v35 + 2) = (v33 >> 51) & 0x7F;
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 11));
        }
        int v39 = v7 + 12;
        *((void *)a5 + v37 + 2) = (v33 >> 44) & 0x7F;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((void *)a5 + v39 + 2) = (v33 >> 37) & 0x7F;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v7 + 14;
        *((void *)a5 + v41 + 2) = (v33 >> 30) & 0x7F;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 14));
        }
        int v45 = v7 + 15;
        *((void *)a5 + v43 + 2) = (v33 >> 23) & 0x7F;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 15));
        }
        int v47 = v7 + 16;
        *((void *)a5 + v45 + 2) = (v33 >> 16) & 0x7F;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 16));
        }
        int v49 = v7 + 17;
        *((void *)a5 + v47 + 2) = (unsigned __int16)v33 >> 9;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 17));
        }
        int v51 = v10 + 2;
        *((void *)a5 + v49 + 2) = (v33 >> 2) & 0x7F;
        uint64_t v52 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v10 + 2));
        }
        int v53 = v7 + 18;
        unint64_t v54 = *((void *)a3 + v51 + 2);
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v53 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 18));
        }
        int v56 = v7 + 19;
        *((void *)a5 + v53 + 2) = (v54 >> 59) & 0xFFFFFFFFFFFFFF9FLL | (32 * (v33 & 3));
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 19));
        }
        int v58 = v7 + 20;
        *((void *)a5 + v56 + 2) = (v54 >> 52) & 0x7F;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 20));
        }
        int v60 = v7 + 21;
        *((void *)a5 + v58 + 2) = (v54 >> 45) & 0x7F;
        uint64_t v61 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v7 + 21));
        }
        int v62 = v7 + 22;
        *((void *)a5 + v60 + 2) = (v54 >> 38) & 0x7F;
        uint64_t v63 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v62 >= (int)v63) {
          IOSArray_throwOutOfBoundsWithMsg(v63, (v7 + 22));
        }
        int v64 = v7 + 23;
        *((void *)a5 + v62 + 2) = (v54 >> 31) & 0x7F;
        uint64_t v65 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v64 >= (int)v65) {
          IOSArray_throwOutOfBoundsWithMsg(v65, (v7 + 23));
        }
        int v66 = v7 + 24;
        *((void *)a5 + v64 + 2) = (v54 >> 24) & 0x7F;
        uint64_t v67 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v66 >= (int)v67) {
          IOSArray_throwOutOfBoundsWithMsg(v67, (v7 + 24));
        }
        int v68 = v7 + 25;
        *((void *)a5 + v66 + 2) = (v54 >> 17) & 0x7F;
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v68 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 25));
        }
        int v70 = v7 + 26;
        *((void *)a5 + v68 + 2) = (v54 >> 10) & 0x7F;
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 26));
        }
        int v72 = v10 + 3;
        *((void *)a5 + v70 + 2) = (v54 >> 3) & 0x7F;
        uint64_t v73 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v10 + 3));
        }
        int v74 = v7 + 27;
        unint64_t v75 = *((void *)a3 + v72 + 2);
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v74 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 27));
        }
        int v77 = v7 + 28;
        *((void *)a5 + v74 + 2) = (v75 >> 60) & 0xFFFFFFFFFFFFFF8FLL | (16 * (v54 & 7));
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 28));
        }
        int v79 = v7 + 29;
        *((void *)a5 + v77 + 2) = (v75 >> 53) & 0x7F;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 29));
        }
        int v81 = v7 + 30;
        *((void *)a5 + v79 + 2) = (v75 >> 46) & 0x7F;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 30));
        }
        int v83 = v7 + 31;
        *((void *)a5 + v81 + 2) = (v75 >> 39) & 0x7F;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 31));
        }
        int v85 = v7 + 32;
        *((void *)a5 + v83 + 2) = HIDWORD(v75) & 0x7F;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 32));
        }
        int v87 = v7 + 33;
        *((void *)a5 + v85 + 2) = v75 >> 25;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 33));
        }
        int v89 = v7 + 34;
        *((void *)a5 + v87 + 2) = (v75 >> 18) & 0x7F;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 34));
        }
        int v91 = v7 + 35;
        *((void *)a5 + v89 + 2) = (v75 >> 11) & 0x7F;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 35));
        }
        int v93 = v10 + 4;
        *((void *)a5 + v91 + 2) = (v75 >> 4) & 0x7F;
        uint64_t v94 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v10 + 4));
        }
        int v95 = v7 + 36;
        unint64_t v96 = *((void *)a3 + v93 + 2);
        uint64_t v97 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v95 >= (int)v97) {
          IOSArray_throwOutOfBoundsWithMsg(v97, (v7 + 36));
        }
        int v98 = v7 + 37;
        *((void *)a5 + v95 + 2) = (v96 >> 61) & 0xFFFFFFFFFFFFFF87 | (8 * (v75 & 0xF));
        uint64_t v99 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v98 >= (int)v99) {
          IOSArray_throwOutOfBoundsWithMsg(v99, (v7 + 37));
        }
        int v100 = v7 + 38;
        *((void *)a5 + v98 + 2) = (v96 >> 54) & 0x7F;
        uint64_t v101 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v100 >= (int)v101) {
          IOSArray_throwOutOfBoundsWithMsg(v101, (v7 + 38));
        }
        int v102 = v7 + 39;
        *((void *)a5 + v100 + 2) = (v96 >> 47) & 0x7F;
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v102 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 39));
        }
        int v104 = v7 + 40;
        *((void *)a5 + v102 + 2) = (v96 >> 40) & 0x7F;
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 40));
        }
        int v106 = v7 + 41;
        *((void *)a5 + v104 + 2) = (v96 >> 33) & 0x7F;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 41));
        }
        int v108 = v7 + 42;
        *((void *)a5 + v106 + 2) = (v96 >> 26) & 0x7F;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 42));
        }
        int v110 = v7 + 43;
        *((void *)a5 + v108 + 2) = (v96 >> 19) & 0x7F;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 43));
        }
        int v112 = v7 + 44;
        *((void *)a5 + v110 + 2) = (v96 >> 12) & 0x7F;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 44));
        }
        int v114 = v10 + 5;
        *((void *)a5 + v112 + 2) = (v96 >> 5) & 0x7F;
        uint64_t v115 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v10 + 5));
        }
        int v116 = v7 + 45;
        unint64_t v117 = *((void *)a3 + v114 + 2);
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v116 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 45));
        }
        int v119 = v7 + 46;
        *((void *)a5 + v116 + 2) = (v117 >> 62) & 0xFFFFFFFFFFFFFF83 | (4 * (v96 & 0x1F));
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 46));
        }
        int v121 = v7 + 47;
        *((void *)a5 + v119 + 2) = (v117 >> 55) & 0x7F;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 47));
        }
        int v123 = v7 + 48;
        *((void *)a5 + v121 + 2) = HIWORD(v117) & 0x7F;
        uint64_t v124 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v7 + 48));
        }
        int v125 = v7 + 49;
        *((void *)a5 + v123 + 2) = (v117 >> 41) & 0x7F;
        uint64_t v126 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v125 >= (int)v126) {
          IOSArray_throwOutOfBoundsWithMsg(v126, (v7 + 49));
        }
        int v127 = v7 + 50;
        *((void *)a5 + v125 + 2) = (v117 >> 34) & 0x7F;
        uint64_t v128 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v127 >= (int)v128) {
          IOSArray_throwOutOfBoundsWithMsg(v128, (v7 + 50));
        }
        int v129 = v7 + 51;
        *((void *)a5 + v127 + 2) = (v117 >> 27) & 0x7F;
        uint64_t v130 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v129 >= (int)v130) {
          IOSArray_throwOutOfBoundsWithMsg(v130, (v7 + 51));
        }
        int v131 = v7 + 52;
        *((void *)a5 + v129 + 2) = (v117 >> 20) & 0x7F;
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v131 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 52));
        }
        int v133 = v7 + 53;
        *((void *)a5 + v131 + 2) = (v117 >> 13) & 0x7F;
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 53));
        }
        int v135 = v10 + 6;
        *((void *)a5 + v133 + 2) = (v117 >> 6) & 0x7F;
        uint64_t v136 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v10 + 6));
        }
        int v137 = v7 + 54;
        unint64_t v138 = *((void *)a3 + v135 + 2);
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v137 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 54));
        }
        int v140 = v7 + 55;
        *((void *)a5 + v137 + 2) = (v138 >> 63) | (2 * (v117 & 0x3F));
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 55));
        }
        int v142 = v7 + 56;
        *((void *)a5 + v140 + 2) = HIBYTE(v138) & 0x7F;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 56));
        }
        int v144 = v7 + 57;
        *((void *)a5 + v142 + 2) = (v138 >> 49) & 0x7F;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 57));
        }
        int v146 = v7 + 58;
        *((void *)a5 + v144 + 2) = (v138 >> 42) & 0x7F;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 58));
        }
        int v148 = v7 + 59;
        *((void *)a5 + v146 + 2) = (v138 >> 35) & 0x7F;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 59));
        }
        int v150 = v7 + 60;
        *((void *)a5 + v148 + 2) = (v138 >> 28) & 0x7F;
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 60));
        }
        int v152 = v7 + 61;
        *((void *)a5 + v150 + 2) = (v138 >> 21) & 0x7F;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 61));
        }
        int v154 = v7 + 62;
        *((void *)a5 + v152 + 2) = (v138 >> 14) & 0x7F;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 62));
        }
        int v156 = v7 + 63;
        *((void *)a5 + v154 + 2) = (v138 >> 7) & 0x7F;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 63));
        }
        a4 = v10 + 7;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v156 + 2) = v138 & 0x7F;
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
        *((void *)a5 + (int)v8 + 2) = v12 >> 1;
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
        *((void *)a5 + v16 + 2) = (v17 >> 2) & 0xFFFFFFFFFFFFFFBFLL | ((v12 & 1) << 6);
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
        int v24 = v10 + 3;
        *((void *)a5 + v21 + 2) = (v22 >> 3) & 0xFFFFFFFFFFFFFF9FLL | (32 * (v17 & 3));
        uint64_t v25 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v10 + 3));
        }
        int v26 = v8 + 3;
        unint64_t v27 = *((unsigned __int8 *)a3 + v24 + 12);
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v26 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v8 + 3));
        }
        int v29 = v10 + 4;
        *((void *)a5 + v26 + 2) = (v27 >> 4) & 0xFFFFFFFFFFFFFF8FLL | (16 * (v22 & 7));
        uint64_t v30 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v10 + 4));
        }
        int v31 = v8 + 4;
        unint64_t v32 = *((unsigned __int8 *)a3 + v29 + 12);
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v31 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 4));
        }
        int v34 = v10 + 5;
        *((void *)a5 + v31 + 2) = (v32 >> 5) & 0xFFFFFFFFFFFFFF87 | (8 * (v27 & 0xF));
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v10 + 5));
        }
        int v36 = v8 + 5;
        unint64_t v37 = *((unsigned __int8 *)a3 + v34 + 12);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v8 + 5));
        }
        int v39 = v10 + 6;
        *((void *)a5 + v36 + 2) = (v37 >> 6) & 0xFFFFFFFFFFFFFF83 | (4 * (v32 & 0x1F));
        uint64_t v40 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v10 + 6));
        }
        int v41 = v8 + 6;
        unint64_t v42 = *((unsigned __int8 *)a3 + v39 + 12);
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v41 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v8 + 6));
        }
        int v44 = v8 + 7;
        *((void *)a5 + v41 + 2) = (v42 >> 7) & 0xFFFFFFFFFFFFFF81 | (2 * (v37 & 0x3F));
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v8 + 7));
        }
        *((void *)a5 + v44 + 2) = v42 & 0x7F;
        a4 = v10 + 7;
        uint64_t v8 = (v8 + 8);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end