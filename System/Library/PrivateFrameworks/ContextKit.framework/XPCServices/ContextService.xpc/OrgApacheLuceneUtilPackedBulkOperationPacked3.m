@interface OrgApacheLuceneUtilPackedBulkOperationPacked3
- (OrgApacheLuceneUtilPackedBulkOperationPacked3)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked3

- (OrgApacheLuceneUtilPackedBulkOperationPacked3)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 61;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 58) & 7;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 55) & 7;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 52) & 7;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((_DWORD *)a5 + v20 + 3) = (v12 >> 49) & 7;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((_DWORD *)a5 + v22 + 3) = (v12 >> 46) & 7;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((_DWORD *)a5 + v24 + 3) = (v12 >> 43) & 7;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((_DWORD *)a5 + v26 + 3) = (v12 >> 40) & 7;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        int v30 = v7 + 9;
        *((_DWORD *)a5 + v28 + 3) = (v12 >> 37) & 7;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 9));
        }
        int v32 = v7 + 10;
        *((_DWORD *)a5 + v30 + 3) = (v12 >> 34) & 7;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 10));
        }
        int v34 = v7 + 11;
        *((_DWORD *)a5 + v32 + 3) = (v12 >> 31) & 7;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 11));
        }
        int v36 = v7 + 12;
        *((_DWORD *)a5 + v34 + 3) = (v12 >> 28) & 7;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 12));
        }
        int v38 = v7 + 13;
        *((_DWORD *)a5 + v36 + 3) = (v12 >> 25) & 7;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 13));
        }
        int v40 = v7 + 14;
        *((_DWORD *)a5 + v38 + 3) = (v12 >> 22) & 7;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 14));
        }
        int v42 = v7 + 15;
        *((_DWORD *)a5 + v40 + 3) = (v12 >> 19) & 7;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 15));
        }
        int v44 = v7 + 16;
        *((_DWORD *)a5 + v42 + 3) = WORD1(v12) & 7;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 16));
        }
        int v46 = v7 + 17;
        *((_DWORD *)a5 + v44 + 3) = (unsigned __int16)v12 >> 13;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 17));
        }
        int v48 = v7 + 18;
        *((_DWORD *)a5 + v46 + 3) = (v12 >> 10) & 7;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 18));
        }
        int v50 = v7 + 19;
        *((_DWORD *)a5 + v48 + 3) = (v12 >> 7) & 7;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 19));
        }
        int v52 = v7 + 20;
        *((_DWORD *)a5 + v50 + 3) = (v12 >> 4) & 7;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 20));
        }
        uint64_t v54 = (a4 + 1);
        *((_DWORD *)a5 + v52 + 3) = (v12 >> 1) & 7;
        uint64_t v55 = *((unsigned int *)a3 + 2);
        if ((v54 & 0x80000000) != 0 || (int)v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, v54);
        }
        int v56 = v7 + 21;
        unint64_t v57 = *((void *)a3 + (int)v54 + 2);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v56 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 21));
        }
        int v59 = v7 + 22;
        *((_DWORD *)a5 + v56 + 3) = (v57 >> 62) & 0xFB | (4 * (v12 & 1));
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 22));
        }
        int v61 = v7 + 23;
        *((_DWORD *)a5 + v59 + 3) = (v57 >> 59) & 7;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 23));
        }
        int v63 = v7 + 24;
        *((_DWORD *)a5 + v61 + 3) = HIBYTE(v57) & 7;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 24));
        }
        int v65 = v7 + 25;
        *((_DWORD *)a5 + v63 + 3) = (v57 >> 53) & 7;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 25));
        }
        int v67 = v7 + 26;
        *((_DWORD *)a5 + v65 + 3) = (v57 >> 50) & 7;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 26));
        }
        int v69 = v7 + 27;
        *((_DWORD *)a5 + v67 + 3) = (v57 >> 47) & 7;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 27));
        }
        int v71 = v7 + 28;
        *((_DWORD *)a5 + v69 + 3) = (v57 >> 44) & 7;
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 28));
        }
        int v73 = v7 + 29;
        *((_DWORD *)a5 + v71 + 3) = (v57 >> 41) & 7;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 29));
        }
        int v75 = v7 + 30;
        *((_DWORD *)a5 + v73 + 3) = (v57 >> 38) & 7;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 30));
        }
        int v77 = v7 + 31;
        *((_DWORD *)a5 + v75 + 3) = (v57 >> 35) & 7;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 31));
        }
        int v79 = v7 + 32;
        *((_DWORD *)a5 + v77 + 3) = BYTE4(v57) & 7;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 32));
        }
        int v81 = v7 + 33;
        *((_DWORD *)a5 + v79 + 3) = v57 >> 29;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 33));
        }
        int v83 = v7 + 34;
        *((_DWORD *)a5 + v81 + 3) = (v57 >> 26) & 7;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 34));
        }
        int v85 = v7 + 35;
        *((_DWORD *)a5 + v83 + 3) = (v57 >> 23) & 7;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 35));
        }
        int v87 = v7 + 36;
        *((_DWORD *)a5 + v85 + 3) = (v57 >> 20) & 7;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 36));
        }
        int v89 = v7 + 37;
        *((_DWORD *)a5 + v87 + 3) = (v57 >> 17) & 7;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 37));
        }
        int v91 = v7 + 38;
        *((_DWORD *)a5 + v89 + 3) = (v57 >> 14) & 7;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 38));
        }
        int v93 = v7 + 39;
        *((_DWORD *)a5 + v91 + 3) = (v57 >> 11) & 7;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 39));
        }
        int v95 = v7 + 40;
        *((_DWORD *)a5 + v93 + 3) = (v57 >> 8) & 7;
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 40));
        }
        int v97 = v7 + 41;
        *((_DWORD *)a5 + v95 + 3) = v57 >> 5;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 41));
        }
        int v99 = v10 + 2;
        *((_DWORD *)a5 + v97 + 3) = (v57 >> 2) & 7;
        uint64_t v100 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v10 + 2));
        }
        int v101 = v7 + 42;
        unint64_t v102 = *((void *)a3 + v99 + 2);
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v101 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 42));
        }
        int v104 = v7 + 43;
        *((_DWORD *)a5 + v101 + 3) = (v102 >> 63) | (2 * (v57 & 3));
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 43));
        }
        int v106 = v7 + 44;
        *((_DWORD *)a5 + v104 + 3) = (v102 >> 60) & 7;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 44));
        }
        int v108 = v7 + 45;
        *((_DWORD *)a5 + v106 + 3) = (v102 >> 57) & 7;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 45));
        }
        int v110 = v7 + 46;
        *((_DWORD *)a5 + v108 + 3) = (v102 >> 54) & 7;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 46));
        }
        int v112 = v7 + 47;
        *((_DWORD *)a5 + v110 + 3) = (v102 >> 51) & 7;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 47));
        }
        int v114 = v7 + 48;
        *((_DWORD *)a5 + v112 + 3) = HIWORD(v102) & 7;
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 48));
        }
        int v116 = v7 + 49;
        *((_DWORD *)a5 + v114 + 3) = (v102 >> 45) & 7;
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 49));
        }
        int v118 = v7 + 50;
        *((_DWORD *)a5 + v116 + 3) = (v102 >> 42) & 7;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 50));
        }
        int v120 = v7 + 51;
        *((_DWORD *)a5 + v118 + 3) = (v102 >> 39) & 7;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 51));
        }
        int v122 = v7 + 52;
        *((_DWORD *)a5 + v120 + 3) = (v102 >> 36) & 7;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 52));
        }
        int v124 = v7 + 53;
        *((_DWORD *)a5 + v122 + 3) = (v102 >> 33) & 7;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 53));
        }
        int v126 = v7 + 54;
        *((_DWORD *)a5 + v124 + 3) = (v102 >> 30) & 7;
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 54));
        }
        int v128 = v7 + 55;
        *((_DWORD *)a5 + v126 + 3) = (v102 >> 27) & 7;
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 55));
        }
        int v130 = v7 + 56;
        *((_DWORD *)a5 + v128 + 3) = BYTE3(v102) & 7;
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 56));
        }
        int v132 = v7 + 57;
        *((_DWORD *)a5 + v130 + 3) = (v102 >> 21) & 7;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 57));
        }
        int v134 = v7 + 58;
        *((_DWORD *)a5 + v132 + 3) = (v102 >> 18) & 7;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 58));
        }
        int v136 = v7 + 59;
        *((_DWORD *)a5 + v134 + 3) = (v102 >> 15) & 7;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 59));
        }
        int v138 = v7 + 60;
        *((_DWORD *)a5 + v136 + 3) = (v102 >> 12) & 7;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 60));
        }
        int v140 = v7 + 61;
        *((_DWORD *)a5 + v138 + 3) = (v102 >> 9) & 7;
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 61));
        }
        int v142 = v7 + 62;
        *((_DWORD *)a5 + v140 + 3) = (v102 >> 6) & 7;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 62));
        }
        int v144 = v7 + 63;
        *((_DWORD *)a5 + v142 + 3) = (v102 >> 3) & 7;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 63));
        }
        a4 = v10 + 3;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v144 + 3) = v102 & 7;
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
        int v14 = v8 + 1;
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 5;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        uint64_t v16 = (a4 + 1);
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 2) & 7;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v16);
        }
        int v18 = v8 + 2;
        unsigned int v19 = *((unsigned __int8 *)a3 + (int)v16 + 12);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v8 + 2));
        }
        int v21 = v8 + 3;
        *((_DWORD *)a5 + v18 + 3) = (v19 >> 7) & 0xFFFFFFF9 | (2 * (v12 & 3));
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v8 + 3));
        }
        int v23 = v8 + 4;
        *((_DWORD *)a5 + v21 + 3) = (v19 >> 4) & 7;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 4));
        }
        int v25 = v10 + 2;
        *((_DWORD *)a5 + v23 + 3) = (v19 >> 1) & 7;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v8 + 5;
        unsigned int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 5));
        }
        int v30 = v8 + 6;
        *((_DWORD *)a5 + v27 + 3) = (v28 >> 6) & 0xFFFFFFFB | (4 * (v19 & 1));
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 6));
        }
        int v32 = v8 + 7;
        *((_DWORD *)a5 + v30 + 3) = (v28 >> 3) & 7;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 7));
        }
        *((_DWORD *)a5 + v32 + 3) = v28 & 7;
        a4 = v10 + 3;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 61;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 58) & 7;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 55) & 7;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 52) & 7;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((void *)a5 + v20 + 2) = (v12 >> 49) & 7;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((void *)a5 + v22 + 2) = (v12 >> 46) & 7;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((void *)a5 + v24 + 2) = (v12 >> 43) & 7;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((void *)a5 + v26 + 2) = (v12 >> 40) & 7;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        int v30 = v7 + 9;
        *((void *)a5 + v28 + 2) = (v12 >> 37) & 7;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 9));
        }
        int v32 = v7 + 10;
        *((void *)a5 + v30 + 2) = (v12 >> 34) & 7;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 10));
        }
        int v34 = v7 + 11;
        *((void *)a5 + v32 + 2) = (v12 >> 31) & 7;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 11));
        }
        int v36 = v7 + 12;
        *((void *)a5 + v34 + 2) = (v12 >> 28) & 7;
        uint64_t v37 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (v7 + 12));
        }
        int v38 = v7 + 13;
        *((void *)a5 + v36 + 2) = (v12 >> 25) & 7;
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v38 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 13));
        }
        int v40 = v7 + 14;
        *((void *)a5 + v38 + 2) = (v12 >> 22) & 7;
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 14));
        }
        int v42 = v7 + 15;
        *((void *)a5 + v40 + 2) = (v12 >> 19) & 7;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 15));
        }
        int v44 = v7 + 16;
        *((void *)a5 + v42 + 2) = (v12 >> 16) & 7;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v7 + 16));
        }
        int v46 = v7 + 17;
        *((void *)a5 + v44 + 2) = (unsigned __int16)v12 >> 13;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 17));
        }
        int v48 = v7 + 18;
        *((void *)a5 + v46 + 2) = (v12 >> 10) & 7;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 18));
        }
        int v50 = v7 + 19;
        *((void *)a5 + v48 + 2) = (v12 >> 7) & 7;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 19));
        }
        int v52 = v7 + 20;
        *((void *)a5 + v50 + 2) = (v12 >> 4) & 7;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 20));
        }
        int v54 = a4 + 1;
        *((void *)a5 + v52 + 2) = (v12 >> 1) & 7;
        uint64_t v55 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (a4 + 1));
        }
        int v56 = v7 + 21;
        unint64_t v57 = *((void *)a3 + v54 + 2);
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v56 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 21));
        }
        int v59 = v7 + 22;
        *((void *)a5 + v56 + 2) = (v57 >> 62) & 0xFFFFFFFFFFFFFFFBLL | (4 * (v12 & 1));
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 22));
        }
        int v61 = v7 + 23;
        *((void *)a5 + v59 + 2) = (v57 >> 59) & 7;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 23));
        }
        int v63 = v7 + 24;
        *((void *)a5 + v61 + 2) = HIBYTE(v57) & 7;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 24));
        }
        int v65 = v7 + 25;
        *((void *)a5 + v63 + 2) = (v57 >> 53) & 7;
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 25));
        }
        int v67 = v7 + 26;
        *((void *)a5 + v65 + 2) = (v57 >> 50) & 7;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 26));
        }
        int v69 = v7 + 27;
        *((void *)a5 + v67 + 2) = (v57 >> 47) & 7;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 27));
        }
        int v71 = v7 + 28;
        *((void *)a5 + v69 + 2) = (v57 >> 44) & 7;
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 28));
        }
        int v73 = v7 + 29;
        *((void *)a5 + v71 + 2) = (v57 >> 41) & 7;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 29));
        }
        int v75 = v7 + 30;
        *((void *)a5 + v73 + 2) = (v57 >> 38) & 7;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 30));
        }
        int v77 = v7 + 31;
        *((void *)a5 + v75 + 2) = (v57 >> 35) & 7;
        uint64_t v78 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v7 + 31));
        }
        int v79 = v7 + 32;
        *((void *)a5 + v77 + 2) = HIDWORD(v57) & 7;
        uint64_t v80 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v79 >= (int)v80) {
          IOSArray_throwOutOfBoundsWithMsg(v80, (v7 + 32));
        }
        int v81 = v7 + 33;
        *((void *)a5 + v79 + 2) = v57 >> 29;
        uint64_t v82 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v81 >= (int)v82) {
          IOSArray_throwOutOfBoundsWithMsg(v82, (v7 + 33));
        }
        int v83 = v7 + 34;
        *((void *)a5 + v81 + 2) = (v57 >> 26) & 7;
        uint64_t v84 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v83 >= (int)v84) {
          IOSArray_throwOutOfBoundsWithMsg(v84, (v7 + 34));
        }
        int v85 = v7 + 35;
        *((void *)a5 + v83 + 2) = (v57 >> 23) & 7;
        uint64_t v86 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v85 >= (int)v86) {
          IOSArray_throwOutOfBoundsWithMsg(v86, (v7 + 35));
        }
        int v87 = v7 + 36;
        *((void *)a5 + v85 + 2) = (v57 >> 20) & 7;
        uint64_t v88 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v87 >= (int)v88) {
          IOSArray_throwOutOfBoundsWithMsg(v88, (v7 + 36));
        }
        int v89 = v7 + 37;
        *((void *)a5 + v87 + 2) = (v57 >> 17) & 7;
        uint64_t v90 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v89 >= (int)v90) {
          IOSArray_throwOutOfBoundsWithMsg(v90, (v7 + 37));
        }
        int v91 = v7 + 38;
        *((void *)a5 + v89 + 2) = (v57 >> 14) & 7;
        uint64_t v92 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v91 >= (int)v92) {
          IOSArray_throwOutOfBoundsWithMsg(v92, (v7 + 38));
        }
        int v93 = v7 + 39;
        *((void *)a5 + v91 + 2) = (v57 >> 11) & 7;
        uint64_t v94 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v93 >= (int)v94) {
          IOSArray_throwOutOfBoundsWithMsg(v94, (v7 + 39));
        }
        int v95 = v7 + 40;
        *((void *)a5 + v93 + 2) = (v57 >> 8) & 7;
        uint64_t v96 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v95 >= (int)v96) {
          IOSArray_throwOutOfBoundsWithMsg(v96, (v7 + 40));
        }
        int v97 = v7 + 41;
        *((void *)a5 + v95 + 2) = v57 >> 5;
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v97 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 41));
        }
        int v99 = v10 + 2;
        *((void *)a5 + v97 + 2) = (v57 >> 2) & 7;
        uint64_t v100 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v10 + 2));
        }
        int v101 = v7 + 42;
        unint64_t v102 = *((void *)a3 + v99 + 2);
        uint64_t v103 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v101 >= (int)v103) {
          IOSArray_throwOutOfBoundsWithMsg(v103, (v7 + 42));
        }
        int v104 = v7 + 43;
        *((void *)a5 + v101 + 2) = (v102 >> 63) | (2 * (v57 & 3));
        uint64_t v105 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v104 >= (int)v105) {
          IOSArray_throwOutOfBoundsWithMsg(v105, (v7 + 43));
        }
        int v106 = v7 + 44;
        *((void *)a5 + v104 + 2) = (v102 >> 60) & 7;
        uint64_t v107 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v106 >= (int)v107) {
          IOSArray_throwOutOfBoundsWithMsg(v107, (v7 + 44));
        }
        int v108 = v7 + 45;
        *((void *)a5 + v106 + 2) = (v102 >> 57) & 7;
        uint64_t v109 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v108 >= (int)v109) {
          IOSArray_throwOutOfBoundsWithMsg(v109, (v7 + 45));
        }
        int v110 = v7 + 46;
        *((void *)a5 + v108 + 2) = (v102 >> 54) & 7;
        uint64_t v111 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v110 >= (int)v111) {
          IOSArray_throwOutOfBoundsWithMsg(v111, (v7 + 46));
        }
        int v112 = v7 + 47;
        *((void *)a5 + v110 + 2) = (v102 >> 51) & 7;
        uint64_t v113 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v112 >= (int)v113) {
          IOSArray_throwOutOfBoundsWithMsg(v113, (v7 + 47));
        }
        int v114 = v7 + 48;
        *((void *)a5 + v112 + 2) = HIWORD(v102) & 7;
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v114 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 48));
        }
        int v116 = v7 + 49;
        *((void *)a5 + v114 + 2) = (v102 >> 45) & 7;
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 49));
        }
        int v118 = v7 + 50;
        *((void *)a5 + v116 + 2) = (v102 >> 42) & 7;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 50));
        }
        int v120 = v7 + 51;
        *((void *)a5 + v118 + 2) = (v102 >> 39) & 7;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 51));
        }
        int v122 = v7 + 52;
        *((void *)a5 + v120 + 2) = (v102 >> 36) & 7;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 52));
        }
        int v124 = v7 + 53;
        *((void *)a5 + v122 + 2) = (v102 >> 33) & 7;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 53));
        }
        int v126 = v7 + 54;
        *((void *)a5 + v124 + 2) = (v102 >> 30) & 7;
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 54));
        }
        int v128 = v7 + 55;
        *((void *)a5 + v126 + 2) = (v102 >> 27) & 7;
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 55));
        }
        int v130 = v7 + 56;
        *((void *)a5 + v128 + 2) = (v102 >> 24) & 7;
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 56));
        }
        int v132 = v7 + 57;
        *((void *)a5 + v130 + 2) = (v102 >> 21) & 7;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 57));
        }
        int v134 = v7 + 58;
        *((void *)a5 + v132 + 2) = (v102 >> 18) & 7;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 58));
        }
        int v136 = v7 + 59;
        *((void *)a5 + v134 + 2) = (v102 >> 15) & 7;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 59));
        }
        int v138 = v7 + 60;
        *((void *)a5 + v136 + 2) = (v102 >> 12) & 7;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 60));
        }
        int v140 = v7 + 61;
        *((void *)a5 + v138 + 2) = (v102 >> 9) & 7;
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 61));
        }
        int v142 = v7 + 62;
        *((void *)a5 + v140 + 2) = (v102 >> 6) & 7;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 62));
        }
        int v144 = v7 + 63;
        *((void *)a5 + v142 + 2) = (v102 >> 3) & 7;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 63));
        }
        a4 = v10 + 3;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v144 + 2) = v102 & 7;
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
        int v14 = v8 + 1;
        *((void *)a5 + (int)v8 + 2) = v12 >> 5;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        uint64_t v16 = (a4 + 1);
        *((void *)a5 + v14 + 2) = (v12 >> 2) & 7;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v16);
        }
        int v18 = v8 + 2;
        unint64_t v19 = *((unsigned __int8 *)a3 + (int)v16 + 12);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v8 + 2));
        }
        int v21 = v8 + 3;
        *((void *)a5 + v18 + 2) = (v19 >> 7) & 0xFFFFFFFFFFFFFFF9 | (2 * (v12 & 3));
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v8 + 3));
        }
        int v23 = v8 + 4;
        *((void *)a5 + v21 + 2) = (v19 >> 4) & 7;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 4));
        }
        int v25 = v10 + 2;
        *((void *)a5 + v23 + 2) = (v19 >> 1) & 7;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v8 + 5;
        unint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 5));
        }
        int v30 = v8 + 6;
        *((void *)a5 + v27 + 2) = (v28 >> 6) & 0xFFFFFFFFFFFFFFFBLL | (4 * (v19 & 1));
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 6));
        }
        int v32 = v8 + 7;
        *((void *)a5 + v30 + 2) = (v28 >> 3) & 7;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 7));
        }
        *((void *)a5 + v32 + 2) = v28 & 7;
        a4 = v10 + 3;
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