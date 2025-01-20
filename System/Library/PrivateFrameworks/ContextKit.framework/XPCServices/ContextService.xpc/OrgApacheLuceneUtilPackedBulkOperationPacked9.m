@interface OrgApacheLuceneUtilPackedBulkOperationPacked9
- (OrgApacheLuceneUtilPackedBulkOperationPacked9)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked9

- (OrgApacheLuceneUtilPackedBulkOperationPacked9)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 55;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 46) & 0x1FF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 37) & 0x1FF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 28) & 0x1FF;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((_DWORD *)a5 + v20 + 3) = (v12 >> 19) & 0x1FF;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((_DWORD *)a5 + v22 + 3) = (v12 >> 10) & 0x1FF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        uint64_t v26 = (a4 + 1);
        *((_DWORD *)a5 + v24 + 3) = (v12 >> 1) & 0x1FF;
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if ((v26 & 0x80000000) != 0 || (int)v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, v26);
        }
        int v28 = v7 + 7;
        unint64_t v29 = *((void *)a3 + (int)v26 + 2);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((_DWORD *)a5 + v28 + 3) = HIBYTE(v29) | ((v12 & 1) << 8);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v7 + 9;
        *((_DWORD *)a5 + v31 + 3) = (v29 >> 47) & 0x1FF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((_DWORD *)a5 + v33 + 3) = (v29 >> 38) & 0x1FF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v7 + 11;
        *((_DWORD *)a5 + v35 + 3) = (v29 >> 29) & 0x1FF;
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 11));
        }
        int v39 = v7 + 12;
        *((_DWORD *)a5 + v37 + 3) = (v29 >> 20) & 0x1FF;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((_DWORD *)a5 + v39 + 3) = (v29 >> 11) & 0x1FF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v10 + 2;
        *((_DWORD *)a5 + v41 + 3) = (v29 >> 2) & 0x1FF;
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v10 + 2));
        }
        int v45 = v7 + 14;
        unint64_t v46 = *((void *)a3 + v43 + 2);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 14));
        }
        int v48 = v7 + 15;
        *((_DWORD *)a5 + v45 + 3) = (v46 >> 57) & 0x7F | ((v29 & 3) << 7);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 15));
        }
        int v50 = v7 + 16;
        *((_DWORD *)a5 + v48 + 3) = HIWORD(v46) & 0x1FF;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 16));
        }
        int v52 = v7 + 17;
        *((_DWORD *)a5 + v50 + 3) = (v46 >> 39) & 0x1FF;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 17));
        }
        int v54 = v7 + 18;
        *((_DWORD *)a5 + v52 + 3) = (v46 >> 30) & 0x1FF;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 18));
        }
        int v56 = v7 + 19;
        *((_DWORD *)a5 + v54 + 3) = (v46 >> 21) & 0x1FF;
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 19));
        }
        int v58 = v7 + 20;
        *((_DWORD *)a5 + v56 + 3) = (v46 >> 12) & 0x1FF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 20));
        }
        int v60 = v10 + 3;
        *((_DWORD *)a5 + v58 + 3) = (v46 >> 3) & 0x1FF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 3));
        }
        int v62 = v7 + 21;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 21));
        }
        int v65 = v7 + 22;
        *((_DWORD *)a5 + v62 + 3) = (v63 >> 58) & 0x3F | ((v46 & 7) << 6);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 22));
        }
        int v67 = v7 + 23;
        *((_DWORD *)a5 + v65 + 3) = (v63 >> 49) & 0x1FF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 23));
        }
        int v69 = v7 + 24;
        *((_DWORD *)a5 + v67 + 3) = (v63 >> 40) & 0x1FF;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 24));
        }
        int v71 = v7 + 25;
        *((_DWORD *)a5 + v69 + 3) = (v63 >> 31) & 0x1FF;
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 25));
        }
        int v73 = v7 + 26;
        *((_DWORD *)a5 + v71 + 3) = (v63 >> 22) & 0x1FF;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 26));
        }
        int v75 = v7 + 27;
        *((_DWORD *)a5 + v73 + 3) = (v63 >> 13) & 0x1FF;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 27));
        }
        int v77 = v10 + 4;
        *((_DWORD *)a5 + v75 + 3) = (v63 >> 4) & 0x1FF;
        uint64_t v78 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v10 + 4));
        }
        int v79 = v7 + 28;
        unint64_t v80 = *((void *)a3 + v77 + 2);
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v79 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 28));
        }
        int v82 = v7 + 29;
        *((_DWORD *)a5 + v79 + 3) = (v80 >> 59) & 0x1F | (32 * (v63 & 0xF));
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 29));
        }
        int v84 = v7 + 30;
        *((_DWORD *)a5 + v82 + 3) = (v80 >> 50) & 0x1FF;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 30));
        }
        int v86 = v7 + 31;
        *((_DWORD *)a5 + v84 + 3) = (v80 >> 41) & 0x1FF;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 31));
        }
        int v88 = v7 + 32;
        *((_DWORD *)a5 + v86 + 3) = WORD2(v80) & 0x1FF;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 32));
        }
        int v90 = v7 + 33;
        *((_DWORD *)a5 + v88 + 3) = v80 >> 23;
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 33));
        }
        int v92 = v7 + 34;
        *((_DWORD *)a5 + v90 + 3) = (v80 >> 14) & 0x1FF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 34));
        }
        int v94 = v10 + 5;
        *((_DWORD *)a5 + v92 + 3) = (v80 >> 5) & 0x1FF;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 5));
        }
        int v96 = v7 + 35;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 35));
        }
        int v99 = v7 + 36;
        *((_DWORD *)a5 + v96 + 3) = (v97 >> 60) & 0xF | (16 * (v80 & 0x1F));
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 36));
        }
        int v101 = v7 + 37;
        *((_DWORD *)a5 + v99 + 3) = (v97 >> 51) & 0x1FF;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 37));
        }
        int v103 = v7 + 38;
        *((_DWORD *)a5 + v101 + 3) = (v97 >> 42) & 0x1FF;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 38));
        }
        int v105 = v7 + 39;
        *((_DWORD *)a5 + v103 + 3) = (v97 >> 33) & 0x1FF;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 39));
        }
        int v107 = v7 + 40;
        *((_DWORD *)a5 + v105 + 3) = (v97 >> 24) & 0x1FF;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 40));
        }
        int v109 = v7 + 41;
        *((_DWORD *)a5 + v107 + 3) = (v97 >> 15) & 0x1FF;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 41));
        }
        int v111 = v10 + 6;
        *((_DWORD *)a5 + v109 + 3) = (v97 >> 6) & 0x1FF;
        uint64_t v112 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v10 + 6));
        }
        int v113 = v7 + 42;
        unint64_t v114 = *((void *)a3 + v111 + 2);
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v113 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 42));
        }
        int v116 = v7 + 43;
        *((_DWORD *)a5 + v113 + 3) = (v114 >> 61) & 7 | (8 * (v97 & 0x3F));
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 43));
        }
        int v118 = v7 + 44;
        *((_DWORD *)a5 + v116 + 3) = (v114 >> 52) & 0x1FF;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 44));
        }
        int v120 = v7 + 45;
        *((_DWORD *)a5 + v118 + 3) = (v114 >> 43) & 0x1FF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 45));
        }
        int v122 = v7 + 46;
        *((_DWORD *)a5 + v120 + 3) = (v114 >> 34) & 0x1FF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 46));
        }
        int v124 = v7 + 47;
        *((_DWORD *)a5 + v122 + 3) = (v114 >> 25) & 0x1FF;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 47));
        }
        int v126 = v7 + 48;
        *((_DWORD *)a5 + v124 + 3) = WORD1(v114) & 0x1FF;
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 48));
        }
        int v128 = v10 + 7;
        *((_DWORD *)a5 + v126 + 3) = (unsigned __int16)v114 >> 7;
        uint64_t v129 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v10 + 7));
        }
        int v130 = v7 + 49;
        unint64_t v131 = *((void *)a3 + v128 + 2);
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v130 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 49));
        }
        int v133 = v7 + 50;
        *((_DWORD *)a5 + v130 + 3) = (v131 >> 62) & 3 | (4 * (v114 & 0x7F));
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 50));
        }
        int v135 = v7 + 51;
        *((_DWORD *)a5 + v133 + 3) = (v131 >> 53) & 0x1FF;
        uint64_t v136 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v7 + 51));
        }
        int v137 = v7 + 52;
        *((_DWORD *)a5 + v135 + 3) = (v131 >> 44) & 0x1FF;
        uint64_t v138 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v137 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v7 + 52));
        }
        int v139 = v7 + 53;
        *((_DWORD *)a5 + v137 + 3) = (v131 >> 35) & 0x1FF;
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v139 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 53));
        }
        int v141 = v7 + 54;
        *((_DWORD *)a5 + v139 + 3) = (v131 >> 26) & 0x1FF;
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v141 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 54));
        }
        int v143 = v7 + 55;
        *((_DWORD *)a5 + v141 + 3) = (v131 >> 17) & 0x1FF;
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 55));
        }
        int v145 = v10 + 8;
        *((_DWORD *)a5 + v143 + 3) = (v131 >> 8) & 0x1FF;
        uint64_t v146 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v10 + 8));
        }
        int v147 = v7 + 56;
        unint64_t v148 = *((void *)a3 + v145 + 2);
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v147 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 56));
        }
        int v150 = v7 + 57;
        *((_DWORD *)a5 + v147 + 3) = (v148 >> 63) | (2 * v131);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 57));
        }
        int v152 = v7 + 58;
        *((_DWORD *)a5 + v150 + 3) = (v148 >> 54) & 0x1FF;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 58));
        }
        int v154 = v7 + 59;
        *((_DWORD *)a5 + v152 + 3) = (v148 >> 45) & 0x1FF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 59));
        }
        int v156 = v7 + 60;
        *((_DWORD *)a5 + v154 + 3) = (v148 >> 36) & 0x1FF;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 60));
        }
        int v158 = v7 + 61;
        *((_DWORD *)a5 + v156 + 3) = (v148 >> 27) & 0x1FF;
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 61));
        }
        int v160 = v7 + 62;
        *((_DWORD *)a5 + v158 + 3) = (v148 >> 18) & 0x1FF;
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 62));
        }
        int v162 = v7 + 63;
        *((_DWORD *)a5 + v160 + 3) = (v148 >> 9) & 0x1FF;
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 63));
        }
        a4 = v10 + 9;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v162 + 3) = v148 & 0x1FF;
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
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unsigned int v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((_DWORD *)a5 + (int)v8 + 3) = (v13 >> 7) | (2 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        unsigned int v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        int v20 = v10 + 3;
        *((_DWORD *)a5 + v17 + 3) = (v18 >> 6) & 0xFFFFFE03 | (4 * (v13 & 0x7F));
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v10 + 3));
        }
        int v22 = v8 + 2;
        unsigned int v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 2));
        }
        int v25 = v10 + 4;
        *((_DWORD *)a5 + v22 + 3) = (v23 >> 5) & 0xFFFFFE07 | (8 * (v18 & 0x3F));
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 4));
        }
        int v27 = v8 + 3;
        unsigned int v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 3));
        }
        int v30 = v10 + 5;
        *((_DWORD *)a5 + v27 + 3) = (v28 >> 4) & 0xFFFFFE0F | (16 * (v23 & 0x1F));
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v10 + 5));
        }
        int v32 = v8 + 4;
        unsigned int v33 = *((unsigned __int8 *)a3 + v30 + 12);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v8 + 4));
        }
        int v35 = v10 + 6;
        *((_DWORD *)a5 + v32 + 3) = (v33 >> 3) & 0xFFFFFE1F | (32 * (v28 & 0xF));
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v10 + 6));
        }
        int v37 = v8 + 5;
        unsigned int v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v8 + 5));
        }
        int v40 = v10 + 7;
        *((_DWORD *)a5 + v37 + 3) = (v38 >> 2) & 0xFFFFFE3F | ((v33 & 7) << 6);
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v10 + 7));
        }
        int v42 = v8 + 6;
        unsigned int v43 = *((unsigned __int8 *)a3 + v40 + 12);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v8 + 6));
        }
        int v45 = v10 + 8;
        *((_DWORD *)a5 + v42 + 3) = (v43 >> 1) & 0xFFFFFE7F | ((v38 & 3) << 7);
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v10 + 8));
        }
        int v47 = v8 + 7;
        int v48 = *((unsigned __int8 *)a3 + v45 + 12);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v8 + 7));
        }
        *((_DWORD *)a5 + v47 + 3) = v48 & 0xFFFFFEFF | ((v43 & 1) << 8);
        a4 = v10 + 9;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 55;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 46) & 0x1FF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 37) & 0x1FF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 28) & 0x1FF;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((void *)a5 + v20 + 2) = (v12 >> 19) & 0x1FF;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((void *)a5 + v22 + 2) = (v12 >> 10) & 0x1FF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = a4 + 1;
        *((void *)a5 + v24 + 2) = (v12 >> 1) & 0x1FF;
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (a4 + 1));
        }
        int v28 = v7 + 7;
        unint64_t v29 = *((void *)a3 + v26 + 2);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 7));
        }
        int v31 = v7 + 8;
        *((void *)a5 + v28 + 2) = HIBYTE(v29) & 0xFFFFFFFFFFFFFEFFLL | ((v12 & 1) << 8);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 8));
        }
        int v33 = v7 + 9;
        *((void *)a5 + v31 + 2) = (v29 >> 47) & 0x1FF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 9));
        }
        int v35 = v7 + 10;
        *((void *)a5 + v33 + 2) = (v29 >> 38) & 0x1FF;
        uint64_t v36 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v7 + 10));
        }
        int v37 = v7 + 11;
        *((void *)a5 + v35 + 2) = (v29 >> 29) & 0x1FF;
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v37 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 11));
        }
        int v39 = v7 + 12;
        *((void *)a5 + v37 + 2) = (v29 >> 20) & 0x1FF;
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((void *)a5 + v39 + 2) = (v29 >> 11) & 0x1FF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v10 + 2;
        *((void *)a5 + v41 + 2) = (v29 >> 2) & 0x1FF;
        uint64_t v44 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v10 + 2));
        }
        int v45 = v7 + 14;
        unint64_t v46 = *((void *)a3 + v43 + 2);
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v45 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v7 + 14));
        }
        int v48 = v7 + 15;
        *((void *)a5 + v45 + 2) = (v46 >> 57) & 0xFFFFFFFFFFFFFE7FLL | ((v29 & 3) << 7);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v7 + 15));
        }
        int v50 = v7 + 16;
        *((void *)a5 + v48 + 2) = HIWORD(v46) & 0x1FF;
        uint64_t v51 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v50 >= (int)v51) {
          IOSArray_throwOutOfBoundsWithMsg(v51, (v7 + 16));
        }
        int v52 = v7 + 17;
        *((void *)a5 + v50 + 2) = (v46 >> 39) & 0x1FF;
        uint64_t v53 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v52 >= (int)v53) {
          IOSArray_throwOutOfBoundsWithMsg(v53, (v7 + 17));
        }
        int v54 = v7 + 18;
        *((void *)a5 + v52 + 2) = (v46 >> 30) & 0x1FF;
        uint64_t v55 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v54 >= (int)v55) {
          IOSArray_throwOutOfBoundsWithMsg(v55, (v7 + 18));
        }
        int v56 = v7 + 19;
        *((void *)a5 + v54 + 2) = (v46 >> 21) & 0x1FF;
        uint64_t v57 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v56 >= (int)v57) {
          IOSArray_throwOutOfBoundsWithMsg(v57, (v7 + 19));
        }
        int v58 = v7 + 20;
        *((void *)a5 + v56 + 2) = (v46 >> 12) & 0x1FF;
        uint64_t v59 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v58 >= (int)v59) {
          IOSArray_throwOutOfBoundsWithMsg(v59, (v7 + 20));
        }
        int v60 = v10 + 3;
        *((void *)a5 + v58 + 2) = (v46 >> 3) & 0x1FF;
        uint64_t v61 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v60 >= (int)v61) {
          IOSArray_throwOutOfBoundsWithMsg(v61, (v10 + 3));
        }
        int v62 = v7 + 21;
        unint64_t v63 = *((void *)a3 + v60 + 2);
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v62 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 21));
        }
        int v65 = v7 + 22;
        *((void *)a5 + v62 + 2) = (v63 >> 58) & 0xFFFFFFFFFFFFFE3FLL | ((v46 & 7) << 6);
        uint64_t v66 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v7 + 22));
        }
        int v67 = v7 + 23;
        *((void *)a5 + v65 + 2) = (v63 >> 49) & 0x1FF;
        uint64_t v68 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v67 >= (int)v68) {
          IOSArray_throwOutOfBoundsWithMsg(v68, (v7 + 23));
        }
        int v69 = v7 + 24;
        *((void *)a5 + v67 + 2) = (v63 >> 40) & 0x1FF;
        uint64_t v70 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v69 >= (int)v70) {
          IOSArray_throwOutOfBoundsWithMsg(v70, (v7 + 24));
        }
        int v71 = v7 + 25;
        *((void *)a5 + v69 + 2) = (v63 >> 31) & 0x1FF;
        uint64_t v72 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v71 >= (int)v72) {
          IOSArray_throwOutOfBoundsWithMsg(v72, (v7 + 25));
        }
        int v73 = v7 + 26;
        *((void *)a5 + v71 + 2) = (v63 >> 22) & 0x1FF;
        uint64_t v74 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v73 >= (int)v74) {
          IOSArray_throwOutOfBoundsWithMsg(v74, (v7 + 26));
        }
        int v75 = v7 + 27;
        *((void *)a5 + v73 + 2) = (v63 >> 13) & 0x1FF;
        uint64_t v76 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v75 >= (int)v76) {
          IOSArray_throwOutOfBoundsWithMsg(v76, (v7 + 27));
        }
        int v77 = v10 + 4;
        *((void *)a5 + v75 + 2) = (v63 >> 4) & 0x1FF;
        uint64_t v78 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v77 >= (int)v78) {
          IOSArray_throwOutOfBoundsWithMsg(v78, (v10 + 4));
        }
        int v79 = v7 + 28;
        unint64_t v80 = *((void *)a3 + v77 + 2);
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v79 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 28));
        }
        int v82 = v7 + 29;
        *((void *)a5 + v79 + 2) = (v80 >> 59) & 0xFFFFFFFFFFFFFE1FLL | (32 * (v63 & 0xF));
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 29));
        }
        int v84 = v7 + 30;
        *((void *)a5 + v82 + 2) = (v80 >> 50) & 0x1FF;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 30));
        }
        int v86 = v7 + 31;
        *((void *)a5 + v84 + 2) = (v80 >> 41) & 0x1FF;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 31));
        }
        int v88 = v7 + 32;
        *((void *)a5 + v86 + 2) = HIDWORD(v80) & 0x1FF;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 32));
        }
        int v90 = v7 + 33;
        *((void *)a5 + v88 + 2) = v80 >> 23;
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 33));
        }
        int v92 = v7 + 34;
        *((void *)a5 + v90 + 2) = (v80 >> 14) & 0x1FF;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 34));
        }
        int v94 = v10 + 5;
        *((void *)a5 + v92 + 2) = (v80 >> 5) & 0x1FF;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 5));
        }
        int v96 = v7 + 35;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 35));
        }
        int v99 = v7 + 36;
        *((void *)a5 + v96 + 2) = (v97 >> 60) & 0xFFFFFFFFFFFFFE0FLL | (16 * (v80 & 0x1F));
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 36));
        }
        int v101 = v7 + 37;
        *((void *)a5 + v99 + 2) = (v97 >> 51) & 0x1FF;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 37));
        }
        int v103 = v7 + 38;
        *((void *)a5 + v101 + 2) = (v97 >> 42) & 0x1FF;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 38));
        }
        int v105 = v7 + 39;
        *((void *)a5 + v103 + 2) = (v97 >> 33) & 0x1FF;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 39));
        }
        int v107 = v7 + 40;
        *((void *)a5 + v105 + 2) = (v97 >> 24) & 0x1FF;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 40));
        }
        int v109 = v7 + 41;
        *((void *)a5 + v107 + 2) = (v97 >> 15) & 0x1FF;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 41));
        }
        int v111 = v10 + 6;
        *((void *)a5 + v109 + 2) = (v97 >> 6) & 0x1FF;
        uint64_t v112 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v10 + 6));
        }
        int v113 = v7 + 42;
        unint64_t v114 = *((void *)a3 + v111 + 2);
        uint64_t v115 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v113 >= (int)v115) {
          IOSArray_throwOutOfBoundsWithMsg(v115, (v7 + 42));
        }
        int v116 = v7 + 43;
        *((void *)a5 + v113 + 2) = (v114 >> 61) & 0xFFFFFFFFFFFFFE07 | (8 * (v97 & 0x3F));
        uint64_t v117 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v116 >= (int)v117) {
          IOSArray_throwOutOfBoundsWithMsg(v117, (v7 + 43));
        }
        int v118 = v7 + 44;
        *((void *)a5 + v116 + 2) = (v114 >> 52) & 0x1FF;
        uint64_t v119 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v118 >= (int)v119) {
          IOSArray_throwOutOfBoundsWithMsg(v119, (v7 + 44));
        }
        int v120 = v7 + 45;
        *((void *)a5 + v118 + 2) = (v114 >> 43) & 0x1FF;
        uint64_t v121 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v120 >= (int)v121) {
          IOSArray_throwOutOfBoundsWithMsg(v121, (v7 + 45));
        }
        int v122 = v7 + 46;
        *((void *)a5 + v120 + 2) = (v114 >> 34) & 0x1FF;
        uint64_t v123 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v122 >= (int)v123) {
          IOSArray_throwOutOfBoundsWithMsg(v123, (v7 + 46));
        }
        int v124 = v7 + 47;
        *((void *)a5 + v122 + 2) = (v114 >> 25) & 0x1FF;
        uint64_t v125 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v124 >= (int)v125) {
          IOSArray_throwOutOfBoundsWithMsg(v125, (v7 + 47));
        }
        int v126 = v7 + 48;
        *((void *)a5 + v124 + 2) = (v114 >> 16) & 0x1FF;
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v126 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 48));
        }
        int v128 = v10 + 7;
        *((void *)a5 + v126 + 2) = (unsigned __int16)v114 >> 7;
        uint64_t v129 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v10 + 7));
        }
        int v130 = v7 + 49;
        unint64_t v131 = *((void *)a3 + v128 + 2);
        uint64_t v132 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v130 >= (int)v132) {
          IOSArray_throwOutOfBoundsWithMsg(v132, (v7 + 49));
        }
        int v133 = v7 + 50;
        *((void *)a5 + v130 + 2) = (v131 >> 62) & 0xFFFFFFFFFFFFFE03 | (4 * (v114 & 0x7F));
        uint64_t v134 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v133 >= (int)v134) {
          IOSArray_throwOutOfBoundsWithMsg(v134, (v7 + 50));
        }
        int v135 = v7 + 51;
        *((void *)a5 + v133 + 2) = (v131 >> 53) & 0x1FF;
        uint64_t v136 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v135 >= (int)v136) {
          IOSArray_throwOutOfBoundsWithMsg(v136, (v7 + 51));
        }
        int v137 = v7 + 52;
        *((void *)a5 + v135 + 2) = (v131 >> 44) & 0x1FF;
        uint64_t v138 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v137 >= (int)v138) {
          IOSArray_throwOutOfBoundsWithMsg(v138, (v7 + 52));
        }
        int v139 = v7 + 53;
        *((void *)a5 + v137 + 2) = (v131 >> 35) & 0x1FF;
        uint64_t v140 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v139 >= (int)v140) {
          IOSArray_throwOutOfBoundsWithMsg(v140, (v7 + 53));
        }
        int v141 = v7 + 54;
        *((void *)a5 + v139 + 2) = (v131 >> 26) & 0x1FF;
        uint64_t v142 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v141 >= (int)v142) {
          IOSArray_throwOutOfBoundsWithMsg(v142, (v7 + 54));
        }
        int v143 = v7 + 55;
        *((void *)a5 + v141 + 2) = (v131 >> 17) & 0x1FF;
        uint64_t v144 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v143 >= (int)v144) {
          IOSArray_throwOutOfBoundsWithMsg(v144, (v7 + 55));
        }
        int v145 = v10 + 8;
        *((void *)a5 + v143 + 2) = (v131 >> 8) & 0x1FF;
        uint64_t v146 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v145 >= (int)v146) {
          IOSArray_throwOutOfBoundsWithMsg(v146, (v10 + 8));
        }
        int v147 = v7 + 56;
        unint64_t v148 = *((void *)a3 + v145 + 2);
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v147 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 56));
        }
        int v150 = v7 + 57;
        *((void *)a5 + v147 + 2) = (v148 >> 63) | (2 * v131);
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 57));
        }
        int v152 = v7 + 58;
        *((void *)a5 + v150 + 2) = (v148 >> 54) & 0x1FF;
        uint64_t v153 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v152 >= (int)v153) {
          IOSArray_throwOutOfBoundsWithMsg(v153, (v7 + 58));
        }
        int v154 = v7 + 59;
        *((void *)a5 + v152 + 2) = (v148 >> 45) & 0x1FF;
        uint64_t v155 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v154 >= (int)v155) {
          IOSArray_throwOutOfBoundsWithMsg(v155, (v7 + 59));
        }
        int v156 = v7 + 60;
        *((void *)a5 + v154 + 2) = (v148 >> 36) & 0x1FF;
        uint64_t v157 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v156 >= (int)v157) {
          IOSArray_throwOutOfBoundsWithMsg(v157, (v7 + 60));
        }
        int v158 = v7 + 61;
        *((void *)a5 + v156 + 2) = (v148 >> 27) & 0x1FF;
        uint64_t v159 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v158 >= (int)v159) {
          IOSArray_throwOutOfBoundsWithMsg(v159, (v7 + 61));
        }
        int v160 = v7 + 62;
        *((void *)a5 + v158 + 2) = (v148 >> 18) & 0x1FF;
        uint64_t v161 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v160 >= (int)v161) {
          IOSArray_throwOutOfBoundsWithMsg(v161, (v7 + 62));
        }
        int v162 = v7 + 63;
        *((void *)a5 + v160 + 2) = (v148 >> 9) & 0x1FF;
        uint64_t v163 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v162 >= (int)v163) {
          IOSArray_throwOutOfBoundsWithMsg(v163, (v7 + 63));
        }
        a4 = v10 + 9;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v162 + 2) = v148 & 0x1FF;
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
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unint64_t v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((void *)a5 + (int)v8 + 2) = (v13 >> 7) | (2 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        unint64_t v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        int v20 = v10 + 3;
        *((void *)a5 + v17 + 2) = (v18 >> 6) & 0xFFFFFFFFFFFFFE03 | (4 * (v13 & 0x7F));
        uint64_t v21 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v10 + 3));
        }
        int v22 = v8 + 2;
        unint64_t v23 = *((unsigned __int8 *)a3 + v20 + 12);
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v22 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 2));
        }
        int v25 = v10 + 4;
        *((void *)a5 + v22 + 2) = (v23 >> 5) & 0xFFFFFFFFFFFFFE07 | (8 * (v18 & 0x3F));
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 4));
        }
        int v27 = v8 + 3;
        unint64_t v28 = *((unsigned __int8 *)a3 + v25 + 12);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 3));
        }
        int v30 = v10 + 5;
        *((void *)a5 + v27 + 2) = (v28 >> 4) & 0xFFFFFFFFFFFFFE0FLL | (16 * (v23 & 0x1F));
        uint64_t v31 = *((unsigned int *)a3 + 2);
        if (v10 + 5 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v10 + 5));
        }
        int v32 = v8 + 4;
        unint64_t v33 = *((unsigned __int8 *)a3 + v30 + 12);
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v32 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v8 + 4));
        }
        int v35 = v10 + 6;
        *((void *)a5 + v32 + 2) = (v33 >> 3) & 0xFFFFFFFFFFFFFE1FLL | (32 * (v28 & 0xF));
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v10 + 6 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v10 + 6));
        }
        int v37 = v8 + 5;
        unint64_t v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v8 + 5));
        }
        int v40 = v10 + 7;
        *((void *)a5 + v37 + 2) = (v38 >> 2) & 0xFFFFFFFFFFFFFE3FLL | ((v33 & 7) << 6);
        uint64_t v41 = *((unsigned int *)a3 + 2);
        if (v10 + 7 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v10 + 7));
        }
        int v42 = v8 + 6;
        unint64_t v43 = *((unsigned __int8 *)a3 + v40 + 12);
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v42 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v8 + 6));
        }
        int v45 = v10 + 8;
        *((void *)a5 + v42 + 2) = (v43 >> 1) & 0xFFFFFFFFFFFFFE7FLL | ((v38 & 3) << 7);
        uint64_t v46 = *((unsigned int *)a3 + 2);
        if (v10 + 8 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v10 + 8));
        }
        int v47 = v8 + 7;
        uint64_t v48 = *((unsigned __int8 *)a3 + v45 + 12);
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v47 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v8 + 7));
        }
        *((void *)a5 + v47 + 2) = v48 & 0xFFFFFFFFFFFFFEFFLL | ((v43 & 1) << 8);
        a4 = v10 + 9;
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