@interface OrgApacheLuceneUtilPackedBulkOperationPacked5
- (OrgApacheLuceneUtilPackedBulkOperationPacked5)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked5

- (OrgApacheLuceneUtilPackedBulkOperationPacked5)init
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
        *((_DWORD *)a5 + (int)v7 + 3) = v12 >> 59;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 54) & 0x1F;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 49) & 0x1F;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((_DWORD *)a5 + v18 + 3) = (v12 >> 44) & 0x1F;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((_DWORD *)a5 + v20 + 3) = (v12 >> 39) & 0x1F;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((_DWORD *)a5 + v22 + 3) = (v12 >> 34) & 0x1F;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((_DWORD *)a5 + v24 + 3) = (v12 >> 29) & 0x1F;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((_DWORD *)a5 + v26 + 3) = BYTE3(v12) & 0x1F;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        int v30 = v7 + 9;
        *((_DWORD *)a5 + v28 + 3) = (v12 >> 19) & 0x1F;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 9));
        }
        int v32 = v7 + 10;
        *((_DWORD *)a5 + v30 + 3) = (v12 >> 14) & 0x1F;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 10));
        }
        int v34 = v7 + 11;
        *((_DWORD *)a5 + v32 + 3) = (v12 >> 9) & 0x1F;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 11));
        }
        uint64_t v36 = (a4 + 1);
        *((_DWORD *)a5 + v34 + 3) = (v12 >> 4) & 0x1F;
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if ((v36 & 0x80000000) != 0 || (int)v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, v36);
        }
        int v38 = v7 + 12;
        unint64_t v39 = *((void *)a3 + (int)v36 + 2);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((_DWORD *)a5 + v38 + 3) = (v39 >> 63) | (2 * (v12 & 0xF));
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v7 + 14;
        *((_DWORD *)a5 + v41 + 3) = (v39 >> 58) & 0x1F;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 14));
        }
        int v45 = v7 + 15;
        *((_DWORD *)a5 + v43 + 3) = (v39 >> 53) & 0x1F;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 15));
        }
        int v47 = v7 + 16;
        *((_DWORD *)a5 + v45 + 3) = HIWORD(v39) & 0x1F;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 16));
        }
        int v49 = v7 + 17;
        *((_DWORD *)a5 + v47 + 3) = (v39 >> 43) & 0x1F;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 17));
        }
        int v51 = v7 + 18;
        *((_DWORD *)a5 + v49 + 3) = (v39 >> 38) & 0x1F;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 18));
        }
        int v53 = v7 + 19;
        *((_DWORD *)a5 + v51 + 3) = (v39 >> 33) & 0x1F;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 19));
        }
        int v55 = v7 + 20;
        *((_DWORD *)a5 + v53 + 3) = (v39 >> 28) & 0x1F;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 20));
        }
        int v57 = v7 + 21;
        *((_DWORD *)a5 + v55 + 3) = (v39 >> 23) & 0x1F;
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 21));
        }
        int v59 = v7 + 22;
        *((_DWORD *)a5 + v57 + 3) = (v39 >> 18) & 0x1F;
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 22));
        }
        int v61 = v7 + 23;
        *((_DWORD *)a5 + v59 + 3) = (v39 >> 13) & 0x1F;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 23));
        }
        int v63 = v7 + 24;
        *((_DWORD *)a5 + v61 + 3) = (v39 >> 8) & 0x1F;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 24));
        }
        int v65 = v10 + 2;
        *((_DWORD *)a5 + v63 + 3) = v39 >> 3;
        uint64_t v66 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v10 + 2));
        }
        int v67 = v7 + 25;
        unint64_t v68 = *((void *)a3 + v65 + 2);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v67 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 25));
        }
        int v70 = v7 + 26;
        *((_DWORD *)a5 + v67 + 3) = (v68 >> 62) & 0xE3 | (4 * (v39 & 7));
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 26));
        }
        int v72 = v7 + 27;
        *((_DWORD *)a5 + v70 + 3) = (v68 >> 57) & 0x1F;
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 27));
        }
        int v74 = v7 + 28;
        *((_DWORD *)a5 + v72 + 3) = (v68 >> 52) & 0x1F;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 28));
        }
        int v76 = v7 + 29;
        *((_DWORD *)a5 + v74 + 3) = (v68 >> 47) & 0x1F;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 29));
        }
        int v78 = v7 + 30;
        *((_DWORD *)a5 + v76 + 3) = (v68 >> 42) & 0x1F;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 30));
        }
        int v80 = v7 + 31;
        *((_DWORD *)a5 + v78 + 3) = (v68 >> 37) & 0x1F;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 31));
        }
        int v82 = v7 + 32;
        *((_DWORD *)a5 + v80 + 3) = BYTE4(v68) & 0x1F;
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 32));
        }
        int v84 = v7 + 33;
        *((_DWORD *)a5 + v82 + 3) = v68 >> 27;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 33));
        }
        int v86 = v7 + 34;
        *((_DWORD *)a5 + v84 + 3) = (v68 >> 22) & 0x1F;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 34));
        }
        int v88 = v7 + 35;
        *((_DWORD *)a5 + v86 + 3) = (v68 >> 17) & 0x1F;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 35));
        }
        int v90 = v7 + 36;
        *((_DWORD *)a5 + v88 + 3) = (v68 >> 12) & 0x1F;
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 36));
        }
        int v92 = v7 + 37;
        *((_DWORD *)a5 + v90 + 3) = (v68 >> 7) & 0x1F;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 37));
        }
        int v94 = v10 + 3;
        *((_DWORD *)a5 + v92 + 3) = (v68 >> 2) & 0x1F;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 3));
        }
        int v96 = v7 + 38;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 38));
        }
        int v99 = v7 + 39;
        *((_DWORD *)a5 + v96 + 3) = (v97 >> 61) & 0xE7 | (8 * (v68 & 3));
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 39));
        }
        int v101 = v7 + 40;
        *((_DWORD *)a5 + v99 + 3) = HIBYTE(v97) & 0x1F;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 40));
        }
        int v103 = v7 + 41;
        *((_DWORD *)a5 + v101 + 3) = (v97 >> 51) & 0x1F;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 41));
        }
        int v105 = v7 + 42;
        *((_DWORD *)a5 + v103 + 3) = (v97 >> 46) & 0x1F;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 42));
        }
        int v107 = v7 + 43;
        *((_DWORD *)a5 + v105 + 3) = (v97 >> 41) & 0x1F;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 43));
        }
        int v109 = v7 + 44;
        *((_DWORD *)a5 + v107 + 3) = (v97 >> 36) & 0x1F;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 44));
        }
        int v111 = v7 + 45;
        *((_DWORD *)a5 + v109 + 3) = (v97 >> 31) & 0x1F;
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 45));
        }
        int v113 = v7 + 46;
        *((_DWORD *)a5 + v111 + 3) = (v97 >> 26) & 0x1F;
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 46));
        }
        int v115 = v7 + 47;
        *((_DWORD *)a5 + v113 + 3) = (v97 >> 21) & 0x1F;
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 47));
        }
        int v117 = v7 + 48;
        *((_DWORD *)a5 + v115 + 3) = WORD1(v97) & 0x1F;
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 48));
        }
        int v119 = v7 + 49;
        *((_DWORD *)a5 + v117 + 3) = (unsigned __int16)v97 >> 11;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 49));
        }
        int v121 = v7 + 50;
        *((_DWORD *)a5 + v119 + 3) = (v97 >> 6) & 0x1F;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 50));
        }
        int v123 = v10 + 4;
        *((_DWORD *)a5 + v121 + 3) = (v97 >> 1) & 0x1F;
        uint64_t v124 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v10 + 4));
        }
        int v125 = v7 + 51;
        unint64_t v126 = *((void *)a3 + v123 + 2);
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v125 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 51));
        }
        int v128 = v7 + 52;
        *((_DWORD *)a5 + v125 + 3) = (v126 >> 60) & 0xEF | (16 * (v97 & 1));
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 52));
        }
        int v130 = v7 + 53;
        *((_DWORD *)a5 + v128 + 3) = (v126 >> 55) & 0x1F;
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 53));
        }
        int v132 = v7 + 54;
        *((_DWORD *)a5 + v130 + 3) = (v126 >> 50) & 0x1F;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 54));
        }
        int v134 = v7 + 55;
        *((_DWORD *)a5 + v132 + 3) = (v126 >> 45) & 0x1F;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 55));
        }
        int v136 = v7 + 56;
        *((_DWORD *)a5 + v134 + 3) = (v126 >> 40) & 0x1F;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 56));
        }
        int v138 = v7 + 57;
        *((_DWORD *)a5 + v136 + 3) = (v126 >> 35) & 0x1F;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 57));
        }
        int v140 = v7 + 58;
        *((_DWORD *)a5 + v138 + 3) = (v126 >> 30) & 0x1F;
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 58));
        }
        int v142 = v7 + 59;
        *((_DWORD *)a5 + v140 + 3) = (v126 >> 25) & 0x1F;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 59));
        }
        int v144 = v7 + 60;
        *((_DWORD *)a5 + v142 + 3) = (v126 >> 20) & 0x1F;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 60));
        }
        int v146 = v7 + 61;
        *((_DWORD *)a5 + v144 + 3) = (v126 >> 15) & 0x1F;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 61));
        }
        int v148 = v7 + 62;
        *((_DWORD *)a5 + v146 + 3) = (v126 >> 10) & 0x1F;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 62));
        }
        int v150 = v7 + 63;
        *((_DWORD *)a5 + v148 + 3) = (v126 >> 5) & 0x1F;
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 63));
        }
        a4 = v10 + 5;
        uint64_t v7 = (v7 + 64);
        *((_DWORD *)a5 + v150 + 3) = v126 & 0x1F;
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
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 3;
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
        unsigned int v19 = (v17 >> 6) & 0xFFFFFFE3 | (4 * (v12 & 7));
        int v20 = v8 + 2;
        *((_DWORD *)a5 + v16 + 3) = v19;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v8 + 2));
        }
        int v22 = v10 + 2;
        *((_DWORD *)a5 + v20 + 3) = (v17 >> 1) & 0x1F;
        uint64_t v23 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v10 + 2));
        }
        int v24 = v8 + 3;
        unsigned int v25 = *((unsigned __int8 *)a3 + v22 + 12);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v24 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v8 + 3));
        }
        int v27 = v10 + 3;
        *((_DWORD *)a5 + v24 + 3) = (v25 >> 4) & 0xFFFFFFEF | (16 * (v17 & 1));
        uint64_t v28 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v10 + 3));
        }
        int v29 = v8 + 4;
        unsigned int v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 4));
        }
        unsigned int v32 = (v30 >> 7) & 0xFFFFFFE1 | (2 * (v25 & 0xF));
        int v33 = v8 + 5;
        *((_DWORD *)a5 + v29 + 3) = v32;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v8 + 5));
        }
        int v35 = v10 + 4;
        *((_DWORD *)a5 + v33 + 3) = (v30 >> 2) & 0x1F;
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v10 + 4));
        }
        int v37 = v8 + 6;
        unsigned int v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v8 + 6));
        }
        int v40 = v8 + 7;
        *((_DWORD *)a5 + v37 + 3) = (v38 >> 5) & 0xFFFFFFE7 | (8 * (v30 & 3));
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v8 + 7));
        }
        *((_DWORD *)a5 + v40 + 3) = v38 & 0x1F;
        a4 = v10 + 5;
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
        *((void *)a5 + (int)v7 + 2) = v12 >> 59;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v7 + 1));
        }
        int v16 = v7 + 2;
        *((void *)a5 + v14 + 2) = (v12 >> 54) & 0x1F;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v7 + 2));
        }
        int v18 = v7 + 3;
        *((void *)a5 + v16 + 2) = (v12 >> 49) & 0x1F;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v7 + 3));
        }
        int v20 = v7 + 4;
        *((void *)a5 + v18 + 2) = (v12 >> 44) & 0x1F;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 4));
        }
        int v22 = v7 + 5;
        *((void *)a5 + v20 + 2) = (v12 >> 39) & 0x1F;
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 5));
        }
        int v24 = v7 + 6;
        *((void *)a5 + v22 + 2) = (v12 >> 34) & 0x1F;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 6));
        }
        int v26 = v7 + 7;
        *((void *)a5 + v24 + 2) = (v12 >> 29) & 0x1F;
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 7));
        }
        int v28 = v7 + 8;
        *((void *)a5 + v26 + 2) = (v12 >> 24) & 0x1F;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 8));
        }
        int v30 = v7 + 9;
        *((void *)a5 + v28 + 2) = (v12 >> 19) & 0x1F;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 9));
        }
        int v32 = v7 + 10;
        *((void *)a5 + v30 + 2) = (v12 >> 14) & 0x1F;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 10));
        }
        int v34 = v7 + 11;
        *((void *)a5 + v32 + 2) = (v12 >> 9) & 0x1F;
        uint64_t v35 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v7 + 11));
        }
        int v36 = a4 + 1;
        *((void *)a5 + v34 + 2) = (v12 >> 4) & 0x1F;
        uint64_t v37 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v36 >= (int)v37) {
          IOSArray_throwOutOfBoundsWithMsg(v37, (a4 + 1));
        }
        int v38 = v7 + 12;
        unint64_t v39 = *((void *)a3 + v36 + 2);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v38 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 12));
        }
        int v41 = v7 + 13;
        *((void *)a5 + v38 + 2) = (v39 >> 63) | (2 * (v12 & 0xF));
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 13));
        }
        int v43 = v7 + 14;
        *((void *)a5 + v41 + 2) = (v39 >> 58) & 0x1F;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 14));
        }
        int v45 = v7 + 15;
        *((void *)a5 + v43 + 2) = (v39 >> 53) & 0x1F;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 15));
        }
        int v47 = v7 + 16;
        *((void *)a5 + v45 + 2) = HIWORD(v39) & 0x1F;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 16 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 16));
        }
        int v49 = v7 + 17;
        *((void *)a5 + v47 + 2) = (v39 >> 43) & 0x1F;
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 17 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 17));
        }
        int v51 = v7 + 18;
        *((void *)a5 + v49 + 2) = (v39 >> 38) & 0x1F;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 18 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 18));
        }
        int v53 = v7 + 19;
        *((void *)a5 + v51 + 2) = (v39 >> 33) & 0x1F;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 19 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 19));
        }
        int v55 = v7 + 20;
        *((void *)a5 + v53 + 2) = (v39 >> 28) & 0x1F;
        uint64_t v56 = *((unsigned int *)a5 + 2);
        if (v7 + 20 < 0 || v55 >= (int)v56) {
          IOSArray_throwOutOfBoundsWithMsg(v56, (v7 + 20));
        }
        int v57 = v7 + 21;
        *((void *)a5 + v55 + 2) = (v39 >> 23) & 0x1F;
        uint64_t v58 = *((unsigned int *)a5 + 2);
        if (v7 + 21 < 0 || v57 >= (int)v58) {
          IOSArray_throwOutOfBoundsWithMsg(v58, (v7 + 21));
        }
        int v59 = v7 + 22;
        *((void *)a5 + v57 + 2) = (v39 >> 18) & 0x1F;
        uint64_t v60 = *((unsigned int *)a5 + 2);
        if (v7 + 22 < 0 || v59 >= (int)v60) {
          IOSArray_throwOutOfBoundsWithMsg(v60, (v7 + 22));
        }
        int v61 = v7 + 23;
        *((void *)a5 + v59 + 2) = (v39 >> 13) & 0x1F;
        uint64_t v62 = *((unsigned int *)a5 + 2);
        if (v7 + 23 < 0 || v61 >= (int)v62) {
          IOSArray_throwOutOfBoundsWithMsg(v62, (v7 + 23));
        }
        int v63 = v7 + 24;
        *((void *)a5 + v61 + 2) = (v39 >> 8) & 0x1F;
        uint64_t v64 = *((unsigned int *)a5 + 2);
        if (v7 + 24 < 0 || v63 >= (int)v64) {
          IOSArray_throwOutOfBoundsWithMsg(v64, (v7 + 24));
        }
        int v65 = v10 + 2;
        *((void *)a5 + v63 + 2) = v39 >> 3;
        uint64_t v66 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v65 >= (int)v66) {
          IOSArray_throwOutOfBoundsWithMsg(v66, (v10 + 2));
        }
        int v67 = v7 + 25;
        unint64_t v68 = *((void *)a3 + v65 + 2);
        uint64_t v69 = *((unsigned int *)a5 + 2);
        if (v7 + 25 < 0 || v67 >= (int)v69) {
          IOSArray_throwOutOfBoundsWithMsg(v69, (v7 + 25));
        }
        int v70 = v7 + 26;
        *((void *)a5 + v67 + 2) = (v68 >> 62) & 0xFFFFFFFFFFFFFFE3 | (4 * (v39 & 7));
        uint64_t v71 = *((unsigned int *)a5 + 2);
        if (v7 + 26 < 0 || v70 >= (int)v71) {
          IOSArray_throwOutOfBoundsWithMsg(v71, (v7 + 26));
        }
        int v72 = v7 + 27;
        *((void *)a5 + v70 + 2) = (v68 >> 57) & 0x1F;
        uint64_t v73 = *((unsigned int *)a5 + 2);
        if (v7 + 27 < 0 || v72 >= (int)v73) {
          IOSArray_throwOutOfBoundsWithMsg(v73, (v7 + 27));
        }
        int v74 = v7 + 28;
        *((void *)a5 + v72 + 2) = (v68 >> 52) & 0x1F;
        uint64_t v75 = *((unsigned int *)a5 + 2);
        if (v7 + 28 < 0 || v74 >= (int)v75) {
          IOSArray_throwOutOfBoundsWithMsg(v75, (v7 + 28));
        }
        int v76 = v7 + 29;
        *((void *)a5 + v74 + 2) = (v68 >> 47) & 0x1F;
        uint64_t v77 = *((unsigned int *)a5 + 2);
        if (v7 + 29 < 0 || v76 >= (int)v77) {
          IOSArray_throwOutOfBoundsWithMsg(v77, (v7 + 29));
        }
        int v78 = v7 + 30;
        *((void *)a5 + v76 + 2) = (v68 >> 42) & 0x1F;
        uint64_t v79 = *((unsigned int *)a5 + 2);
        if (v7 + 30 < 0 || v78 >= (int)v79) {
          IOSArray_throwOutOfBoundsWithMsg(v79, (v7 + 30));
        }
        int v80 = v7 + 31;
        *((void *)a5 + v78 + 2) = (v68 >> 37) & 0x1F;
        uint64_t v81 = *((unsigned int *)a5 + 2);
        if (v7 + 31 < 0 || v80 >= (int)v81) {
          IOSArray_throwOutOfBoundsWithMsg(v81, (v7 + 31));
        }
        int v82 = v7 + 32;
        *((void *)a5 + v80 + 2) = HIDWORD(v68) & 0x1F;
        uint64_t v83 = *((unsigned int *)a5 + 2);
        if (v7 + 32 < 0 || v82 >= (int)v83) {
          IOSArray_throwOutOfBoundsWithMsg(v83, (v7 + 32));
        }
        int v84 = v7 + 33;
        *((void *)a5 + v82 + 2) = v68 >> 27;
        uint64_t v85 = *((unsigned int *)a5 + 2);
        if (v7 + 33 < 0 || v84 >= (int)v85) {
          IOSArray_throwOutOfBoundsWithMsg(v85, (v7 + 33));
        }
        int v86 = v7 + 34;
        *((void *)a5 + v84 + 2) = (v68 >> 22) & 0x1F;
        uint64_t v87 = *((unsigned int *)a5 + 2);
        if (v7 + 34 < 0 || v86 >= (int)v87) {
          IOSArray_throwOutOfBoundsWithMsg(v87, (v7 + 34));
        }
        int v88 = v7 + 35;
        *((void *)a5 + v86 + 2) = (v68 >> 17) & 0x1F;
        uint64_t v89 = *((unsigned int *)a5 + 2);
        if (v7 + 35 < 0 || v88 >= (int)v89) {
          IOSArray_throwOutOfBoundsWithMsg(v89, (v7 + 35));
        }
        int v90 = v7 + 36;
        *((void *)a5 + v88 + 2) = (v68 >> 12) & 0x1F;
        uint64_t v91 = *((unsigned int *)a5 + 2);
        if (v7 + 36 < 0 || v90 >= (int)v91) {
          IOSArray_throwOutOfBoundsWithMsg(v91, (v7 + 36));
        }
        int v92 = v7 + 37;
        *((void *)a5 + v90 + 2) = (v68 >> 7) & 0x1F;
        uint64_t v93 = *((unsigned int *)a5 + 2);
        if (v7 + 37 < 0 || v92 >= (int)v93) {
          IOSArray_throwOutOfBoundsWithMsg(v93, (v7 + 37));
        }
        int v94 = v10 + 3;
        *((void *)a5 + v92 + 2) = (v68 >> 2) & 0x1F;
        uint64_t v95 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v94 >= (int)v95) {
          IOSArray_throwOutOfBoundsWithMsg(v95, (v10 + 3));
        }
        int v96 = v7 + 38;
        unint64_t v97 = *((void *)a3 + v94 + 2);
        uint64_t v98 = *((unsigned int *)a5 + 2);
        if (v7 + 38 < 0 || v96 >= (int)v98) {
          IOSArray_throwOutOfBoundsWithMsg(v98, (v7 + 38));
        }
        int v99 = v7 + 39;
        *((void *)a5 + v96 + 2) = (v97 >> 61) & 0xFFFFFFFFFFFFFFE7 | (8 * (v68 & 3));
        uint64_t v100 = *((unsigned int *)a5 + 2);
        if (v7 + 39 < 0 || v99 >= (int)v100) {
          IOSArray_throwOutOfBoundsWithMsg(v100, (v7 + 39));
        }
        int v101 = v7 + 40;
        *((void *)a5 + v99 + 2) = HIBYTE(v97) & 0x1F;
        uint64_t v102 = *((unsigned int *)a5 + 2);
        if (v7 + 40 < 0 || v101 >= (int)v102) {
          IOSArray_throwOutOfBoundsWithMsg(v102, (v7 + 40));
        }
        int v103 = v7 + 41;
        *((void *)a5 + v101 + 2) = (v97 >> 51) & 0x1F;
        uint64_t v104 = *((unsigned int *)a5 + 2);
        if (v7 + 41 < 0 || v103 >= (int)v104) {
          IOSArray_throwOutOfBoundsWithMsg(v104, (v7 + 41));
        }
        int v105 = v7 + 42;
        *((void *)a5 + v103 + 2) = (v97 >> 46) & 0x1F;
        uint64_t v106 = *((unsigned int *)a5 + 2);
        if (v7 + 42 < 0 || v105 >= (int)v106) {
          IOSArray_throwOutOfBoundsWithMsg(v106, (v7 + 42));
        }
        int v107 = v7 + 43;
        *((void *)a5 + v105 + 2) = (v97 >> 41) & 0x1F;
        uint64_t v108 = *((unsigned int *)a5 + 2);
        if (v7 + 43 < 0 || v107 >= (int)v108) {
          IOSArray_throwOutOfBoundsWithMsg(v108, (v7 + 43));
        }
        int v109 = v7 + 44;
        *((void *)a5 + v107 + 2) = (v97 >> 36) & 0x1F;
        uint64_t v110 = *((unsigned int *)a5 + 2);
        if (v7 + 44 < 0 || v109 >= (int)v110) {
          IOSArray_throwOutOfBoundsWithMsg(v110, (v7 + 44));
        }
        int v111 = v7 + 45;
        *((void *)a5 + v109 + 2) = (v97 >> 31) & 0x1F;
        uint64_t v112 = *((unsigned int *)a5 + 2);
        if (v7 + 45 < 0 || v111 >= (int)v112) {
          IOSArray_throwOutOfBoundsWithMsg(v112, (v7 + 45));
        }
        int v113 = v7 + 46;
        *((void *)a5 + v111 + 2) = (v97 >> 26) & 0x1F;
        uint64_t v114 = *((unsigned int *)a5 + 2);
        if (v7 + 46 < 0 || v113 >= (int)v114) {
          IOSArray_throwOutOfBoundsWithMsg(v114, (v7 + 46));
        }
        int v115 = v7 + 47;
        *((void *)a5 + v113 + 2) = (v97 >> 21) & 0x1F;
        uint64_t v116 = *((unsigned int *)a5 + 2);
        if (v7 + 47 < 0 || v115 >= (int)v116) {
          IOSArray_throwOutOfBoundsWithMsg(v116, (v7 + 47));
        }
        int v117 = v7 + 48;
        *((void *)a5 + v115 + 2) = (v97 >> 16) & 0x1F;
        uint64_t v118 = *((unsigned int *)a5 + 2);
        if (v7 + 48 < 0 || v117 >= (int)v118) {
          IOSArray_throwOutOfBoundsWithMsg(v118, (v7 + 48));
        }
        int v119 = v7 + 49;
        *((void *)a5 + v117 + 2) = (unsigned __int16)v97 >> 11;
        uint64_t v120 = *((unsigned int *)a5 + 2);
        if (v7 + 49 < 0 || v119 >= (int)v120) {
          IOSArray_throwOutOfBoundsWithMsg(v120, (v7 + 49));
        }
        int v121 = v7 + 50;
        *((void *)a5 + v119 + 2) = (v97 >> 6) & 0x1F;
        uint64_t v122 = *((unsigned int *)a5 + 2);
        if (v7 + 50 < 0 || v121 >= (int)v122) {
          IOSArray_throwOutOfBoundsWithMsg(v122, (v7 + 50));
        }
        int v123 = v10 + 4;
        *((void *)a5 + v121 + 2) = (v97 >> 1) & 0x1F;
        uint64_t v124 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v123 >= (int)v124) {
          IOSArray_throwOutOfBoundsWithMsg(v124, (v10 + 4));
        }
        int v125 = v7 + 51;
        unint64_t v126 = *((void *)a3 + v123 + 2);
        uint64_t v127 = *((unsigned int *)a5 + 2);
        if (v7 + 51 < 0 || v125 >= (int)v127) {
          IOSArray_throwOutOfBoundsWithMsg(v127, (v7 + 51));
        }
        int v128 = v7 + 52;
        *((void *)a5 + v125 + 2) = (v126 >> 60) & 0xFFFFFFFFFFFFFFEFLL | (16 * (v97 & 1));
        uint64_t v129 = *((unsigned int *)a5 + 2);
        if (v7 + 52 < 0 || v128 >= (int)v129) {
          IOSArray_throwOutOfBoundsWithMsg(v129, (v7 + 52));
        }
        int v130 = v7 + 53;
        *((void *)a5 + v128 + 2) = (v126 >> 55) & 0x1F;
        uint64_t v131 = *((unsigned int *)a5 + 2);
        if (v7 + 53 < 0 || v130 >= (int)v131) {
          IOSArray_throwOutOfBoundsWithMsg(v131, (v7 + 53));
        }
        int v132 = v7 + 54;
        *((void *)a5 + v130 + 2) = (v126 >> 50) & 0x1F;
        uint64_t v133 = *((unsigned int *)a5 + 2);
        if (v7 + 54 < 0 || v132 >= (int)v133) {
          IOSArray_throwOutOfBoundsWithMsg(v133, (v7 + 54));
        }
        int v134 = v7 + 55;
        *((void *)a5 + v132 + 2) = (v126 >> 45) & 0x1F;
        uint64_t v135 = *((unsigned int *)a5 + 2);
        if (v7 + 55 < 0 || v134 >= (int)v135) {
          IOSArray_throwOutOfBoundsWithMsg(v135, (v7 + 55));
        }
        int v136 = v7 + 56;
        *((void *)a5 + v134 + 2) = (v126 >> 40) & 0x1F;
        uint64_t v137 = *((unsigned int *)a5 + 2);
        if (v7 + 56 < 0 || v136 >= (int)v137) {
          IOSArray_throwOutOfBoundsWithMsg(v137, (v7 + 56));
        }
        int v138 = v7 + 57;
        *((void *)a5 + v136 + 2) = (v126 >> 35) & 0x1F;
        uint64_t v139 = *((unsigned int *)a5 + 2);
        if (v7 + 57 < 0 || v138 >= (int)v139) {
          IOSArray_throwOutOfBoundsWithMsg(v139, (v7 + 57));
        }
        int v140 = v7 + 58;
        *((void *)a5 + v138 + 2) = (v126 >> 30) & 0x1F;
        uint64_t v141 = *((unsigned int *)a5 + 2);
        if (v7 + 58 < 0 || v140 >= (int)v141) {
          IOSArray_throwOutOfBoundsWithMsg(v141, (v7 + 58));
        }
        int v142 = v7 + 59;
        *((void *)a5 + v140 + 2) = (v126 >> 25) & 0x1F;
        uint64_t v143 = *((unsigned int *)a5 + 2);
        if (v7 + 59 < 0 || v142 >= (int)v143) {
          IOSArray_throwOutOfBoundsWithMsg(v143, (v7 + 59));
        }
        int v144 = v7 + 60;
        *((void *)a5 + v142 + 2) = (v126 >> 20) & 0x1F;
        uint64_t v145 = *((unsigned int *)a5 + 2);
        if (v7 + 60 < 0 || v144 >= (int)v145) {
          IOSArray_throwOutOfBoundsWithMsg(v145, (v7 + 60));
        }
        int v146 = v7 + 61;
        *((void *)a5 + v144 + 2) = (v126 >> 15) & 0x1F;
        uint64_t v147 = *((unsigned int *)a5 + 2);
        if (v7 + 61 < 0 || v146 >= (int)v147) {
          IOSArray_throwOutOfBoundsWithMsg(v147, (v7 + 61));
        }
        int v148 = v7 + 62;
        *((void *)a5 + v146 + 2) = (v126 >> 10) & 0x1F;
        uint64_t v149 = *((unsigned int *)a5 + 2);
        if (v7 + 62 < 0 || v148 >= (int)v149) {
          IOSArray_throwOutOfBoundsWithMsg(v149, (v7 + 62));
        }
        int v150 = v7 + 63;
        *((void *)a5 + v148 + 2) = (v126 >> 5) & 0x1F;
        uint64_t v151 = *((unsigned int *)a5 + 2);
        if (v7 + 63 < 0 || v150 >= (int)v151) {
          IOSArray_throwOutOfBoundsWithMsg(v151, (v7 + 63));
        }
        a4 = v10 + 5;
        uint64_t v7 = (v7 + 64);
        *((void *)a5 + v150 + 2) = v126 & 0x1F;
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
        *((void *)a5 + (int)v8 + 2) = v12 >> 3;
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
        unint64_t v19 = (v17 >> 6) & 0xFFFFFFFFFFFFFFE3 | (4 * (v12 & 7));
        int v20 = v8 + 2;
        *((void *)a5 + v16 + 2) = v19;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v8 + 2));
        }
        int v22 = v10 + 2;
        *((void *)a5 + v20 + 2) = (v17 >> 1) & 0x1F;
        uint64_t v23 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v10 + 2));
        }
        int v24 = v8 + 3;
        unint64_t v25 = *((unsigned __int8 *)a3 + v22 + 12);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v24 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v8 + 3));
        }
        int v27 = v10 + 3;
        *((void *)a5 + v24 + 2) = (v25 >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16 * (v17 & 1));
        uint64_t v28 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v10 + 3));
        }
        int v29 = v8 + 4;
        unint64_t v30 = *((unsigned __int8 *)a3 + v27 + 12);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v29 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 4));
        }
        unint64_t v32 = (v30 >> 7) & 0xFFFFFFFFFFFFFFE1 | (2 * (v25 & 0xF));
        int v33 = v8 + 5;
        *((void *)a5 + v29 + 2) = v32;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v8 + 5));
        }
        int v35 = v10 + 4;
        *((void *)a5 + v33 + 2) = (v30 >> 2) & 0x1F;
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v10 + 4 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v10 + 4));
        }
        int v37 = v8 + 6;
        unint64_t v38 = *((unsigned __int8 *)a3 + v35 + 12);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v8 + 6));
        }
        int v40 = v8 + 7;
        *((void *)a5 + v37 + 2) = (v38 >> 5) & 0xFFFFFFFFFFFFFFE7 | (8 * (v30 & 3));
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v8 + 7));
        }
        *((void *)a5 + v40 + 2) = v38 & 0x1F;
        a4 = v10 + 5;
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