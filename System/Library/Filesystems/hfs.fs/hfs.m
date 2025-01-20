unint64_t sub_100003904(const char *a1)
{
  unint64_t v1;
  char v2;
  unint64_t result;
  char *__endptr;

  __endptr = 0;
  v1 = strtoull(a1, &__endptr, 0);
  if (!*__endptr) {
    return v1;
  }
  v2 = __tolower(*__endptr);
  result = 0;
  switch(v2)
  {
    case 'k':
      goto LABEL_11;
    case 'l':
    case 'n':
    case 'o':
    case 'q':
    case 'r':
    case 's':
      return result;
    case 'm':
      goto LABEL_10;
    case 'p':
      v1 <<= 10;
      goto LABEL_4;
    case 't':
LABEL_4:
      v1 <<= 10;
      goto LABEL_9;
    default:
      if (v2 == 103)
      {
LABEL_9:
        v1 <<= 10;
LABEL_10:
        v1 <<= 10;
LABEL_11:
        result = v1 << 10;
      }
      else if (v2 == 98)
      {
        result = v1 << 9;
      }
      break;
  }
  return result;
}

void sub_100004F98(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (fcntl(2, 3) < 0)
  {
    openlog((const char *)qword_10000C5B0, 2, 24);
    vsyslog(3, a1, &a9);
    closelog();
  }
  else
  {
    vwarnx(a1, &a9);
  }
  exit(1);
}

void sub_100005008()
{
  fwrite("\t\ta=blocks (attributes file)\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t\tb=blocks (bitmap file)\n", 0x19uLL, 1uLL, __stderrp);
  fwrite("\t\tc=blocks (catalog file)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t\td=blocks (user data fork)\n", 0x1CuLL, 1uLL, __stderrp);
  fwrite("\t\te=blocks (extents file)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t\tr=blocks (user resource fork)\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("\t-i starting catalog node id\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t-I initial size list (comma separated)\n", 0x28uLL, 1uLL, __stderrp);
  fwrite("\t\ta=size (attributes b-tree)\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t\tc=size (catalog b-tree)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t\te=size (extents b-tree)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t-n b-tree node size list (comma separated)\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t\ta=size (attributes b-tree)\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t\tc=size (catalog b-tree)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t\te=size (extents b-tree)\n", 0x1AuLL, 1uLL, __stderrp);
  fwrite("\t-v volume name (in ascii or UTF-8)\n", 0x24uLL, 1uLL, __stderrp);
  fwrite("  examples:\n", 0xCuLL, 1uLL, __stderrp);
  fprintf(__stderrp, "\t%s -v Untitled /dev/rdisk0s7 \n", (const char *)qword_10000C5B0);
  fprintf(__stderrp, "\t%s -v Untitled -n c=4096,e=1024 /dev/rdisk0s7 \n", (const char *)qword_10000C5B0);
  fprintf(__stderrp, "\t%s -v Untitled -c b=64,c=1024 /dev/rdisk0s7 \n\n", (const char *)qword_10000C5B0);
  exit(1);
}

uint64_t sub_100005338(unsigned int a1, unsigned int a2, unint64_t a3, int a4)
{
  if (a4 == 4) {
    int v4 = 1;
  }
  else {
    int v4 = 2;
  }
  if (a4 == 8) {
    int v4 = 0;
  }
  if (a3 >> 21)
  {
    if (a3 >= 0x400000)
    {
      int v6 = 0;
      unsigned int v7 = 0;
      unint64_t v8 = a3 >> 22;
      do
      {
        v6 += 3;
        if (v8 < 2) {
          break;
        }
        v8 >>= 1;
      }
      while (v7++ < 0xD);
    }
    else
    {
      int v6 = 0;
    }
    unsigned int v5 = word_10000C0D0[v6 + v4] << 20;
  }
  else
  {
    unsigned int v5 = 4 * a3;
    if (4 * (int)a3 <= 8 * a2) {
      unsigned int v5 = 8 * a2;
    }
  }
  if (a2 <= a1) {
    unsigned int v10 = a1;
  }
  else {
    unsigned int v10 = a2;
  }
  if (v5 == v5 % v10) {
    return v10;
  }
  else {
    return v5 / v10 * v10;
  }
}

uint64_t sub_1000053D8(uint64_t a1, int8x8_t *a2)
{
  v149.tv_sec = 0;
  if (!wipefs_alloc()) {
    wipefs_wipe();
  }
  wipefs_free();
  int v4 = (int8x8_t *)malloc_type_malloc(0x200uLL, 0x87714732uLL);
  if (!v4) {
    sub_100006A24();
  }
  unsigned int v5 = v4;
  unint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)v4[60].i8 = 0u;
  *(_OWORD *)v4[62].i8 = 0u;
  *(_OWORD *)v4[56].i8 = 0u;
  *(_OWORD *)v4[58].i8 = 0u;
  *(_OWORD *)v4[52].i8 = 0u;
  *(_OWORD *)v4[54].i8 = 0u;
  *(_OWORD *)v4[48].i8 = 0u;
  *(_OWORD *)v4[50].i8 = 0u;
  *(_OWORD *)v4[44].i8 = 0u;
  *(_OWORD *)v4[46].i8 = 0u;
  *(_OWORD *)v4[40].i8 = 0u;
  *(_OWORD *)v4[42].i8 = 0u;
  *(_OWORD *)v4[36].i8 = 0u;
  *(_OWORD *)v4[38].i8 = 0u;
  *(_OWORD *)v4[32].i8 = 0u;
  *(_OWORD *)v4[34].i8 = 0u;
  *(_OWORD *)v4[28].i8 = 0u;
  *(_OWORD *)v4[30].i8 = 0u;
  *(_OWORD *)v4[24].i8 = 0u;
  *(_OWORD *)v4[26].i8 = 0u;
  *(_OWORD *)v4[20].i8 = 0u;
  *(_OWORD *)v4[22].i8 = 0u;
  *(_OWORD *)v4[16].i8 = 0u;
  *(_OWORD *)v4[18].i8 = 0u;
  *(_OWORD *)v4[12].i8 = 0u;
  *(_OWORD *)v4[14].i8 = 0u;
  *(_OWORD *)v4[8].i8 = 0u;
  *(_OWORD *)v4[10].i8 = 0u;
  *(_OWORD *)v4[4].i8 = 0u;
  *(_OWORD *)v4[6].i8 = 0u;
  *(_OWORD *)v4->i8 = 0u;
  *(_OWORD *)v4[2].i8 = 0u;
  unint64_t v7 = a2->u32[1];
  if (v7 == 512)
  {
    int v8 = 1;
    int v9 = 2;
  }
  else if (v7 == 1024)
  {
    int v8 = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    int v8 = 0;
  }
  int v10 = v9 + a2[18].i32[1] + 1;
  int v11 = v9 + v8;
  __int32 v12 = a2->i32[0];
  if ((a2->i32[0] & 8) != 0) {
    __int16 v13 = 18520;
  }
  else {
    __int16 v13 = 18475;
  }
  unsigned int v14 = a2[10].i32[0] / v7;
  v4->i16[0] = v13;
  if ((v12 & 8) != 0) {
    __int16 v15 = 5;
  }
  else {
    __int16 v15 = 4;
  }
  v4->i16[1] = v15;
  if ((v12 & 0x20) != 0) {
    int v16 = -1073741568;
  }
  else {
    int v16 = -2147483392;
  }
  v4->i32[1] = v16;
  unint64_t v17 = v6 / (v7 >> 9);
  if ((a2->i8[0] & 0x40) != 0) {
    v4->i32[1] = v16 | 0x20000000;
  }
  unsigned int v18 = v11 + v14;
  int8x8_t __buf = 0;
  v4[1].i32[0] = 825241136;
  __int32 v19 = a2[11].i32[1];
  if (v19)
  {
    uint64_t v148 = 0;
    v149.tv_sec = 0;
    *(void *)&v149.tv_usec = 0;
    gettimeofday(&v149, &v148);
    if (HIDWORD(v148)) {
      __int32 v20 = v19 - 60 * v148 + 3600;
    }
    else {
      __int32 v20 = v19 - 60 * v148;
    }
    __int32 v21 = a2[11].i32[1];
  }
  else
  {
    __int32 v21 = 0;
    __int32 v20 = 0;
  }
  unsigned int v22 = v18 + 2;
  v5[5].i32[1] = v17;
  v5[2].i32[0] = v20;
  v5[2].i32[1] = v21;
  v5[3].i32[0] = 0;
  v5[3].i32[1] = v21;
  v5[5].i32[0] = v7;
  v5[6].i32[0] = v17;
  v5[7] = a2[1];
  __int32 v23 = a2[2].i32[0];
  v5[8].i32[0] = v23;
  v5[9] = (int8x8_t)1;
  int8x8_t v24 = (int8x8_t)a2[10].u32[0];
  v5[14] = v24;
  v5[15].i32[0] = v24.i32[0];
  v5[15].i32[1] = v14;
  unsigned int v25 = v14 + v10;
  v5[16].i32[0] = v10;
  v5[16].i32[1] = v14;
  if (a2[14].i32[0])
  {
    v5[4].i32[0] = 2;
    v5->i32[1] |= 0x2000u;
    v5[8].i32[0] = v23 + 2;
    unsigned int v26 = ((int)v7 + a2[14].i32[1] - 1) / v7;
    unsigned int v27 = v14 + v10;
    v25 += v26 + 1;
    v22 += v26 + 1;
  }
  else
  {
    unsigned int v27 = 0;
  }
  unint64_t v28 = v17 * (unint64_t)v7;
  v5[1].i32[1] = v27;
  v5[25].i32[0] = a2[5].i32[0];
  int8x8_t v29 = (int8x8_t)a2[5].u32[1];
  v5[24] = v29;
  unsigned int v30 = v29.i32[0] / v7;
  __int32 v31 = v29.i32[0] / v7 + v25;
  v5[25].i32[1] = v30;
  v5[26].i32[0] = v25;
  v5[26].i32[1] = v30;
  unsigned int v32 = v30 + v22;
  int8x8_t v33 = (int8x8_t)a2[8].u32[0];
  if (v33.i32[0])
  {
    unsigned __int32 v34 = a2[7].u32[1];
    v5[45].i32[0] = v34;
    v5[44] = v33;
    unsigned int v35 = v33.i32[0] / v7;
    v5[45].i32[1] = v33.i32[0] / v7;
    __int32 v36 = v33.i32[0] / v7 + v31;
    v5[46].i32[0] = v31;
    v5[46].i32[1] = v35;
    v32 += v35;
    if (v28 < 0x200000 || a2[9].i32[1]) {
      __int32 v31 = v36;
    }
    else {
      __int32 v31 = v36 + 10 * (v34 / v7);
    }
  }
  unsigned __int32 v37 = a2[2].u32[1];
  v5[35].i32[0] = v37;
  int8x8_t v38 = (int8x8_t)a2[3].u32[0];
  v5[34] = v38;
  unsigned int v39 = v38.i32[0] / v7;
  v5[35].i32[1] = v39;
  v5[36].i32[0] = v31;
  v5[36].i32[1] = v39;
  unsigned int v40 = v39 + v31 + 10 * (v37 / v7);
  if (v28 >> 31 >= 5)
  {
    uint64_t v41 = 5 * (v28 >> 10);
    BOOL v42 = v28 > 0x1999999BFFLL;
    unint64_t v43 = 0x20000000;
    if (!v42) {
      unint64_t v43 = v41;
    }
    v40 += v43 / v7;
  }
  v5[6].i32[0] = v17 - (v32 + v39);
  v5[6].i32[1] = v40;
  arc4random_buf(&__buf, 8uLL);
  v5[13] = vrev32_s8(__buf);
  unsigned __int32 v44 = (unsigned __int32)v5[5].i32[0] >> 9;
  sub_100006358(a1, 0, 0x100000uLL, 0);
  unsigned int v45 = v5[16].u32[0];
  unsigned int v46 = v5[46].i32[0] - v45 + v5[45].i32[1];
  sub_100006358(a1, v45 * v44, v5[5].u32[0] * (unint64_t)(v46 + 1), 0);
  unsigned __int32 v145 = v44;
  sub_100006358(a1, v5[36].i32[0] * v44, v5[5].u32[0] * (unint64_t)v5[35].u32[1], 0);
  unsigned int v47 = 2 * a2[3].i32[1];
  unsigned int v48 = v5[36].i32[0] + v5[35].i32[1] + 7;
  if (v47 <= 2 * a2[8].i32[1]) {
    unsigned int v47 = 2 * a2[8].i32[1];
  }
  if (v5[5].i32[0] <= v48 >> 3) {
    unsigned __int32 v49 = v48 >> 3;
  }
  else {
    unsigned __int32 v49 = v5[5].u32[0];
  }
  if (v47 <= v49) {
    unsigned int v47 = v49;
  }
  size_t v50 = (v47 + 511) & 0xFFFFFE00;
  v51 = (unsigned int *)malloc_type_valloc(v50, 0x2269D093uLL);
  if (!v51) {
    sub_100006A24();
  }
  v52 = v51;
  bzero(v51, v50);
  __int32 v53 = v5[5].i32[0];
  if (v53 == 1024)
  {
    if (sub_100006568((int *)a1, (uint64_t)v5, 0, 2u) == -1) {
      sub_100006B38();
    }
  }
  else if (v53 == 512)
  {
    if (sub_100006568((int *)a1, (uint64_t)v5, 0, 4u) == -1) {
      sub_100006B10();
    }
  }
  else if (sub_100006568((int *)a1, (uint64_t)v5, 0, 1u) == -1)
  {
    sub_100006A34();
  }
  if (sub_100006568((int *)a1, (uint64_t)v5, v45, v46) == -1) {
    errx(1, "Overlapped extent at <%u, %u> (%d)\n");
  }
  if (sub_100006568((int *)a1, (uint64_t)v5, v5[36].u32[0], v5[35].u32[1]) == -1) {
    errx(1, "Overlapped catalog extent at <%u, %u>\n");
  }
  if (sub_100006568((int *)a1, (uint64_t)v5, v5[5].i32[1] - 1, 1u) == -1) {
    sub_100006A5C((_DWORD *)&v5[5] + 1);
  }
  if (v5[5].i32[0] == 512 && sub_100006568((int *)a1, (uint64_t)v5, v5[5].i32[1] - 2, 1u) == -1) {
    sub_100006A8C((_DWORD *)&v5[5] + 1);
  }
  uint64_t v140 = v5[26].i32[0] * v44;
  unsigned __int32 v54 = a2[5].u32[1];
  size_t v55 = a2[6].u32[0];
  bzero(v52, v55);
  *((_WORD *)v52 + 5) = 768;
  v56 = (char *)v52 + v55;
  *((_WORD *)v56 - 1) = 3584;
  *(void *)((char *)v52 + 14) = 0;
  *((unsigned char *)v52 + 8) = 1;
  *(void *)((char *)v52 + 22) = 0;
  *((_WORD *)v52 + 15) = 0;
  *((_WORD *)v52 + 16) = bswap32(v55) >> 16;
  unsigned int v57 = v54 / v55;
  v52[9] = bswap32(v57);
  unsigned int v58 = bswap32(v57 - 1);
  v52[10] = v58;
  *(unsigned int *)((char *)v52 + 46) = bswap32(a2[5].u32[0]);
  v52[13] |= 0x2000000u;
  *((_WORD *)v52 + 17) = 2560;
  *(_DWORD *)(v56 - 6) = 2013329408;
  unsigned int v59 = 8 * v55 - 2048;
  uint64_t v144 = a1;
  if (v57 <= v59)
  {
    unsigned int v60 = 0;
  }
  else
  {
    unsigned int *v52 = 0x1000000;
    unsigned int v60 = (v57 + 1887) / (8 * (int)v55 - 160);
    unsigned int v58 = bswap32(v57 - 1 - v60);
    v52[10] = v58;
  }
  v146 = a2;
  v61 = v52 + 62;
  unsigned int v62 = bswap32(v58);
  char v63 = v57 - v62;
  __b = v52 + 62;
  unsigned int v64 = v57 - v62 - 8;
  if (v57 - v62 >= 8)
  {
    uint64_t v65 = v64 >> 3;
    memset(__b, 255, v65 + 1);
    v56 = (char *)v52 + v55;
    char v63 = v64 & 7;
    v61 = (char *)v52 + v65 + 249;
  }
  unsigned char *v61 = -256 >> v63;
  *((_WORD *)v56 - 4) = bswap32((v59 >> 3) + 248) >> 16;
  unint64_t v66 = (v57 - v60 - v62) * v55;
  sub_100006358(v144, v140, v66, (char *)v52);
  if (v60) {
    sub_100006750(v144, (v66 >> 9) + v140, v66 / (unsigned __int16)v55, v60, (unsigned __int16)v55, (char *)v52);
  }
  unsigned __int32 v67 = v146[8].u32[0];
  if (v67)
  {
    size_t v68 = v146[8].u32[1];
    uint64_t v69 = v5[46].i32[0] * v145;
    bzero(v52, v68);
    *((unsigned char *)v52 + 8) = 1;
    *((_WORD *)v52 + 5) = 768;
    v70 = (char *)v52 + v68;
    *((_WORD *)v70 - 1) = 3584;
    *(void *)((char *)v52 + 14) = 0;
    *(void *)((char *)v52 + 22) = 0;
    *((_WORD *)v52 + 15) = 0;
    *((_WORD *)v52 + 16) = bswap32(v68) >> 16;
    unsigned int v71 = v67 / v68;
    unsigned int v72 = bswap32(v71 - 1);
    v52[9] = bswap32(v71);
    v52[10] = v72;
    *(unsigned int *)((char *)v52 + 46) = bswap32(v146[7].u32[1]);
    v52[13] |= 0x6000000u;
    *((_WORD *)v52 + 17) = 2561;
    *(_DWORD *)(v70 - 6) = 2013329408;
    unsigned int v73 = 8 * v68 - 2048;
    if (v71 <= v73)
    {
      unsigned int v74 = 0;
    }
    else
    {
      unsigned int *v52 = 0x1000000;
      unsigned int v74 = (v71 + 1887) / (8 * (int)v68 - 160);
      unsigned int v72 = bswap32(v71 - 1 - v74);
      v52[10] = v72;
    }
    v75 = v52 + 62;
    unsigned int v76 = bswap32(v72);
    char v77 = v71 - v76;
    unsigned int v78 = v71 - v76 - 8;
    if (v71 - v76 >= 8)
    {
      uint64_t v141 = v69;
      uint64_t v79 = v78 >> 3;
      memset(__b, 255, v79 + 1);
      v80 = (char *)v52 + v79;
      uint64_t v69 = v141;
      char v77 = v78 & 7;
      v75 = v80 + 249;
    }
    unsigned char *v75 = -256 >> v77;
    *((_WORD *)v70 - 4) = bswap32((v73 >> 3) + 248) >> 16;
    unint64_t v81 = (v71 - v74 - v76) * v68;
    sub_100006358(v144, v69, v81, (char *)v52);
    if (v74) {
      sub_100006750(v144, (v81 >> 9) + v69, v81 / (unsigned __int16)v68, v74, (unsigned __int16)v68, (char *)v52);
    }
  }
  __int32 v82 = v5[36].i32[0];
  unsigned __int32 v83 = v146[3].u32[0];
  size_t v84 = v146[3].u32[1];
  bzero(v52, v84);
  *((unsigned char *)v52 + 8) = 1;
  *((_WORD *)v52 + 5) = 768;
  v85 = (char *)v52 + v84;
  *(_WORD *)((char *)v52 + v84 - 2) = 3584;
  *((_WORD *)v52 + 7) = 256;
  v52[4] = 0x1000000;
  *((void *)v52 + 3) = 0x100000001000000;
  if (v146[14].i32[0]) {
    int v86 = 100663296;
  }
  else {
    int v86 = 0x2000000;
  }
  v52[5] = v86;
  *((_WORD *)v52 + 16) = bswap32(v84) >> 16;
  unsigned int v87 = v83 / v84;
  unsigned int v88 = v83 / v84 - 2;
  unsigned int v89 = bswap32(v88);
  v52[9] = bswap32(v83 / v84);
  v52[10] = v89;
  *(unsigned int *)((char *)v52 + 46) = bswap32(v146[2].u32[1]);
  v52[13] |= 0x6000000u;
  *((_WORD *)v52 + 17) = 1026;
  if ((v146->i32[0] & 8) != 0) {
    char v90 = -68;
  }
  else {
    char v90 = -49;
  }
  *((unsigned char *)v52 + 51) = v90;
  *(_DWORD *)(v85 - 6) = 2013329408;
  unsigned int v91 = 8 * v84 - 2048;
  if (v87 <= v91)
  {
    unsigned int v142 = 0;
  }
  else
  {
    unsigned int *v52 = 0x2000000;
    unsigned int v142 = (v87 + 1887) / (8 * (int)v84 - 160);
    unsigned int v89 = bswap32(v88 - v142);
    v52[10] = v89;
  }
  v92 = v52 + 62;
  unsigned int v93 = v87 - bswap32(v89);
  unsigned int v94 = v93 - 8;
  if (v93 >= 8)
  {
    uint64_t v95 = v94 >> 3;
    memset(__b, 255, v95 + 1);
    LOBYTE(v93) = v94 & 7;
    v92 = (char *)v52 + v95 + 249;
  }
  unsigned char *v92 = -256 >> v93;
  *((_WORD *)v85 - 4) = bswap32((v91 >> 3) + 248) >> 16;
  size_t v96 = v146[3].u16[2];
  bzero((char *)v52 + v84, v96);
  *((_WORD *)v85 + 4) = 511;
  v97 = (const char *)v146[13];
  if (v146[14].i32[0]) {
    __int16 v98 = 1536;
  }
  else {
    __int16 v98 = 512;
  }
  *((_WORD *)v85 + 5) = v98;
  v99 = &v85[v96];
  *(_WORD *)&v85[v96 - 2] = 3584;
  CFStringRef v100 = CFStringCreateWithCString(kCFAllocatorDefault, v97, 0x8000100u);
  if (!_CFStringGetFileSystemRepresentation(v100, (char *)&v149, 766)
    || sub_10000682C((unsigned __int8 *)&v149, (_WORD *)v85 + 11, (_WORD *)v85 + 10))
  {
    sub_100006ABC((uint64_t)v52 + v84, (const char **)&v146[13]);
  }
  uint64_t v101 = v82 * v145;
  CFRelease(v100);
  uint64_t v102 = *((unsigned __int16 *)v85 + 10);
  *((_WORD *)v85 + 10) = __rev16(v102);
  uint64_t v103 = 2 * v102;
  *((_WORD *)v85 + 7) = bswap32(2 * v102 + 6) >> 16;
  *((_DWORD *)v85 + 4) = 0x1000000;
  v104 = (int8x8_t *)&v85[((v102 << 49) + 0x16000000000000) >> 48];
  v104->i16[0] = 256;
  v105 = v146;
  __int32 v106 = v146->i32[0];
  if ((v146->i32[0] & 8) != 0) {
    v104->i16[1] = 4096;
  }
  v104->i32[1] = (v146[14].i32[0] != 0) << 25;
  v104[1].i32[0] = 0x2000000;
  unsigned int v107 = bswap32(v146[11].u32[1]);
  v104[1].i32[1] = v107;
  v104[2].i32[0] = v107;
  v104[10].i32[0] = 2113929216;
  if ((v106 & 0x10) != 0)
  {
    v104[4] = vrev32_s8(v146[17]);
    v104[5].i16[1] = bswap32(v146[18].u16[0] | 0x4000) >> 16;
  }
  *((_WORD *)v99 - 2) = bswap32(v103 + 110) >> 16;
  v108 = &v85[(__int16)(v103 + 110)];
  *(_WORD *)v108 = 1536;
  *(_DWORD *)(v108 + 2) = 0x2000000;
  v109 = &v85[(__int16)(v103 + 118)];
  *(_WORD *)v109 = 768;
  *((_DWORD *)v109 + 1) = 0x1000000;
  memmove(v109 + 8, v85 + 20, v103 + 2);
  unsigned int v110 = v103 + v103 + 118 + 10;
  *((_WORD *)v99 - 3) = bswap32(v110) >> 16;
  if (v146[14].i32[0])
  {
    v111 = &v85[(__int16)v110];
    __src = v111 + 6;
    sub_10000682C(".journal", (_WORD *)v111 + 4, (_WORD *)v111 + 3);
    uint64_t v112 = *((unsigned __int16 *)v111 + 3);
    *((_WORD *)v111 + 3) = __rev16(v112);
    uint64_t v113 = 2 * v112;
    LODWORD(v112) = 2 * v112 + 6;
    *(_WORD *)v111 = bswap32(v112) >> 16;
    *(_DWORD *)(v111 + 2) = 0x2000000;
    LODWORD(v112) = v110 + v112;
    int v114 = v112 + 2;
    v115 = &v85[(__int16)(v112 + 2)];
    *(_DWORD *)v115 = 33554944;
    *((_DWORD *)v115 + 2) = bswap32(v146[2].u32[0]);
    unsigned int v116 = bswap32(v146[11].i32[1] + 1);
    *((_DWORD *)v115 + 3) = v116;
    *((_DWORD *)v115 + 4) = v116;
    *((_DWORD *)v115 + 20) = 0;
    *((_WORD *)v115 + 21) = 128;
    v115[41] = 0;
    *(void *)(v115 + 44) = 0x6C6E726A01000000;
    strcpy(v115 + 52, "hfs+P");
    unint64_t v117 = v146[14].u32[1];
    *((void *)v115 + 11) = bswap64(v117);
    LODWORD(v117) = bswap32((v117 + v146->i32[1] - 1) / v146->i32[1]);
    *((_DWORD *)v115 + 25) = v117;
    *((_DWORD *)v115 + 26) = bswap32(v5[1].i32[1] + 1);
    *((_DWORD *)v115 + 27) = v117;
    LODWORD(v112) = v112 + 250;
    *((_WORD *)v99 - 4) = bswap32(v112) >> 16;
    v118 = &v85[(__int16)v112];
    sub_10000682C(".journal_info_block", (_WORD *)v118 + 4, (_WORD *)v118 + 3);
    uint64_t v119 = *((unsigned __int16 *)v118 + 3);
    *((_WORD *)v118 + 3) = __rev16(v119);
    uint64_t v120 = 2 * v119;
    LODWORD(v119) = 2 * v119 + 6;
    *(_WORD *)v118 = bswap32(v119) >> 16;
    *(_DWORD *)(v118 + 2) = 0x2000000;
    LODWORD(v119) = v114 + v119;
    v121 = &v85[(__int16)(v119 + 250)];
    *(_DWORD *)v121 = 33554944;
    *((_DWORD *)v121 + 2) = bswap32(v146[2].i32[0] + 1);
    unsigned int v122 = bswap32(v146[11].u32[1]);
    *((_DWORD *)v121 + 3) = v122;
    *((_DWORD *)v121 + 4) = v122;
    *((_DWORD *)v121 + 20) = 0;
    *((_WORD *)v121 + 21) = 128;
    v121[41] = 0;
    *(void *)(v121 + 44) = 0x6C6E726A01000000;
    strcpy(v121 + 52, "hfs+P");
    *((void *)v121 + 11) = bswap64(v146->u32[1]);
    *((_DWORD *)v121 + 25) = 0x1000000;
    *((_DWORD *)v121 + 26) = bswap32(v5[1].u32[1]);
    *((_DWORD *)v121 + 27) = 0x1000000;
    *((_WORD *)v99 - 5) = bswap32(v119 + 498) >> 16;
    v123 = &v85[(__int16)(v119 + 498)];
    *(_WORD *)v123 = 1536;
    *(_DWORD *)(v123 + 2) = bswap32(v146[2].u32[0]);
    *(_DWORD *)(v123 + 6) = 0x4000000;
    int v124 = v119 + 506;
    v125 = &v85[(__int16)(v119 + 506)];
    *((_DWORD *)v125 + 1) = 0x2000000;
    memmove(v125 + 8, __src, v113 + 2);
    int v126 = v113 + v124;
    uint64_t v101 = v82 * v145;
    *((_WORD *)v99 - 6) = bswap32(v126 + 10) >> 16;
    v127 = &v85[(__int16)(v126 + 10)];
    *(_WORD *)v127 = 1536;
    *(_DWORD *)(v127 + 2) = bswap32(v146[2].i32[0] + 1);
    *((_WORD *)v127 + 3) = 0;
    int v128 = v126 + 18;
    v129 = &v85[(__int16)(v126 + 18)];
    *(_WORD *)v129 = 1024;
    *((_DWORD *)v129 + 1) = 0x2000000;
    memmove(v129 + 8, v118 + 6, v120 + 2);
    int v130 = v120 + v128;
    v105 = v146;
    *((_WORD *)v99 - 7) = bswap32(v130 + 10) >> 16;
  }
  unint64_t v131 = (bswap32(v52[9]) - (v142 + bswap32(v52[10]))) * v84;
  sub_100006358(v144, v101, v131, (char *)v52);
  if (v142) {
    sub_100006750(v144, (v131 >> 9) + v101, v131 / (unsigned __int16)v84, v142, (unsigned __int16)v84, (char *)v52);
  }
  if (v105[14].i32[0])
  {
    uint64_t v132 = v5[1].i32[1] * v145;
    memset(v52, 219, *(unsigned int *)(v144 + 24));
    *((_OWORD *)v52 + 2) = 0u;
    *((_OWORD *)v52 + 3) = 0u;
    *((_OWORD *)v52 + 4) = 0u;
    *((_OWORD *)v52 + 5) = 0u;
    *((_OWORD *)v52 + 6) = 0u;
    *((_OWORD *)v52 + 7) = 0u;
    *((_OWORD *)v52 + 8) = 0u;
    *((_OWORD *)v52 + 9) = 0u;
    *((_OWORD *)v52 + 10) = 0u;
    v52[44] = 0;
    *(_OWORD *)v52 = 0u;
    *((_OWORD *)v52 + 1) = 0u;
    unint64_t v133 = v5[5].u32[0] * (unint64_t)(v5[1].i32[1] + 1);
    unint64_t v134 = v105[14].u32[1];
    unsigned int *v52 = 83886080;
    *(void *)(v52 + 9) = bswap64(v133);
    *(void *)(v52 + 11) = bswap64(v134);
    sub_100006358(v144, v132, *(unsigned int *)(v144 + 24), (char *)v52);
    unsigned int v135 = bswap32(*v52);
    unsigned int *v52 = v135;
    unint64_t v136 = bswap64(*(void *)(v52 + 9));
    *(void *)(v52 + 9) = v136;
    unint64_t v137 = bswap64(*(void *)(v52 + 11));
    *(void *)(v52 + 11) = v137;
    if (v135) {
      sub_100006358(v144, v136 >> 9, v137, 0);
    }
  }
  sub_100006924((unsigned __int16 *)v5);
  sub_100006358(v144, 2, 0x200uLL, (char *)v5);
  sub_100006358(v144, *(void *)(v144 + 16) - 2, 0x200uLL, (char *)v5);
  free(v52);
  free(v5);
  return 0;
}

void sub_100006358(uint64_t a1, uint64_t a2, unint64_t a3, char *a4)
{
  if (a3)
  {
    unint64_t v5 = a3;
    int __fd = *(_DWORD *)a1;
    size_t v8 = *(unsigned int *)(a1 + 24);
    unint64_t v9 = (a3 + v8 - 1) / v8;
    if (v9 >= *(void *)(a1 + 32)) {
      unint64_t v9 = *(void *)(a1 + 32);
    }
    if (0x400000 / v8 >= v9) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = 0x400000 / v8;
    }
    int v11 = (char *)malloc_type_valloc(v10 * v8, 0xB78CC2BEuLL);
    if (v11)
    {
      __int32 v12 = v11;
    }
    else
    {
      __int16 v13 = (char *)malloc_type_valloc(v8, 0xA2B03051uLL);
      if (!v13) {
        sub_100006A24();
      }
      __int32 v12 = v13;
      unsigned int v10 = 1;
    }
    uint64_t v14 = *(unsigned int *)(a1 + 8) + a2;
    uint64_t v15 = v14 / (uint64_t)(v8 >> 9);
    uint64_t v16 = (v14 % (uint64_t)(v8 >> 9)) << 9;
    size_t v22 = v8 - 1;
    unint64_t v17 = v10;
    while (1)
    {
      if ((v22 + v5) / v8 >= v17) {
        unint64_t v18 = v17;
      }
      else {
        unint64_t v18 = (v22 + v5) / v8;
      }
      if (v5 >= (v8 * v18 - v16)) {
        size_t v19 = (v8 * v18 - v16);
      }
      else {
        size_t v19 = v5;
      }
      if ((v16 || v19 % v8) && pread(__fd, v12, (v8 * v18), v15 * v8) < 0)
      {
        int v21 = 0;
        LODWORD(v5) = 1;
        goto LABEL_30;
      }
      __int32 v20 = &v12[v16];
      if (a4) {
        memcpy(v20, a4, v19);
      }
      else {
        bzero(v20, v19);
      }
      if (pwrite(__fd, v12, (v8 * v18), v15 * v8) < 0) {
        break;
      }
      uint64_t v16 = 0;
      v15 += v18;
      if (a4) {
        a4 += v19;
      }
      else {
        a4 = 0;
      }
      v5 -= v19;
      if (!v5)
      {
        int v21 = 0;
        goto LABEL_30;
      }
    }
    warn("%s:  pwrite(%d, %p, %zu, %lld)", "WriteBuffer", __fd, v12, (v8 * v18), v15 * v8);
    LODWORD(v5) = 0;
    int v21 = 1;
LABEL_30:
    free(v12);
    if (v5) {
      err(1, "read (sector %llu)");
    }
    if (v21) {
      err(1, "write (sector %llu)");
    }
  }
}

uint64_t sub_100006568(int *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  int64_t v8 = a1[6];
  unint64_t v9 = malloc_type_valloc(v8, 0xF1A6E423uLL);
  if (!v9) {
    sub_100006A24();
  }
  unsigned int v10 = v9;
  if (a4)
  {
    int v21 = v9;
    unint64_t v22 = 8 * v8;
    while (1)
    {
      *unsigned int v10 = 0;
      unint64_t v11 = a3 % v22;
      unsigned int v12 = v22 - v11 >= a4 ? a4 : v22 - v11;
      off_t v13 = (*(_DWORD *)(a2 + 40) * *(_DWORD *)(a2 + 128))
          + (a3 / v22) * (unint64_t)v8;
      ssize_t v14 = pread(*a1, v10, v8, v13);
      if (v14 < v8) {
        break;
      }
      uint64_t v15 = (char *)v10 + (v11 >> 3);
      int v16 = v11 & 7;
      if ((v11 & 7) != 0)
      {
        if (8 - v16 <= v12) {
          int v17 = 0;
        }
        else {
          int v17 = 8 - (v16 + v12);
        }
        *v15++ |= (255 << v17) & (0xFFu >> v16);
        unsigned int v18 = v16 + v12 + v17 - 8;
      }
      else
      {
        unsigned int v18 = v12;
      }
      if (v18 >= 8)
      {
        memset(v15, 255, v18 >> 3);
        v15 += v18 >> 3;
        unsigned int v10 = v21;
        v18 &= 7u;
      }
      if (v18) {
        *v15 |= -1 << (8 - v18);
      }
      if (pwrite(*a1, v10, v8, v13) != v8) {
        goto LABEL_22;
      }
      a3 += v12;
      a4 -= v12;
      if (!a4) {
        goto LABEL_20;
      }
    }
    if (v14 == -1) {
      err(1, "%s::pread(%d, %p, %zu, %lld)", "MarkExtentUsed", *a1, v10, v8, v13);
    }
LABEL_22:
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_20:
    uint64_t v19 = 0;
  }
  free(v10);
  return v19;
}

void sub_100006750(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, char *a6)
{
  unint64_t v12 = a5;
  bzero(a6, a5);
  a6[8] = 2;
  *((_WORD *)a6 + 5) = 256;
  off_t v13 = &a6[a5];
  *((_WORD *)v13 - 1) = 3584;
  *((_WORD *)v13 - 2) = bswap32(a5 - 6) >> 16;
  if (a4)
  {
    int v14 = 0;
    int v15 = 0;
    uint64_t v16 = a5 >> 9;
    do
    {
      unsigned int v17 = v14 + 1;
      unsigned int v18 = bswap32(a3 + 1);
      BOOL v19 = v17 >= a4;
      if (v17 >= a4) {
        unsigned int v20 = 0;
      }
      else {
        unsigned int v20 = v18;
      }
      if (!v19) {
        ++a3;
      }
      *(_DWORD *)a6 = v20;
      sub_100006358(a1, a2, v12, a6);
      a2 += v16;
      int v14 = (unsigned __int16)++v15;
    }
    while ((unsigned __int16)v15 < a4);
  }
}

uint64_t sub_10000682C(unsigned __int8 *a1, _WORD *a2, _WORD *a3)
{
  *a3 = 0;
  unsigned int v3 = *a1;
  LODWORD(v4) = a2;
  if (!*a1)
  {
LABEL_17:
    uint64_t result = 0;
    *a3 = (v4 - a2) >> 1;
    return result;
  }
  int v4 = a2;
  while (1)
  {
    unint64_t v5 = a1 + 1;
    if ((v3 & 0x80) == 0)
    {
      if (v3 == 58) {
        LOWORD(v3) = 47;
      }
      LOWORD(v3) = (_WORD)v3 << 8;
      goto LABEL_16;
    }
    if ((v3 >> 4) - 12 >= 2)
    {
      if (v3 >> 4 != 14) {
        return 22;
      }
      unsigned __int8 v8 = *v5;
      if ((v8 & 0xC0) != 0x80) {
        return 22;
      }
      unsigned __int8 v6 = a1[2];
      if ((v6 & 0xC0) != 0x80) {
        return 22;
      }
      int v7 = (v3 << 12) | ((v8 & 0x3F) << 6);
      unint64_t v5 = a1 + 3;
    }
    else
    {
      unsigned __int8 v6 = a1[1];
      if ((v6 & 0xC0) != 0x80) {
        return 22;
      }
      int v7 = (v3 & 0x1F) << 6;
      unint64_t v5 = a1 + 2;
    }
    if (v4 >= a2 + 255) {
      return 55;
    }
    unsigned int v3 = bswap32(v7 + (v6 & 0x3F)) >> 16;
LABEL_16:
    *v4++ = v3;
    unsigned int v3 = *v5;
    a1 = v5;
    if (!*v5) {
      goto LABEL_17;
    }
  }
}

void sub_10000690C()
{
  err(1, 0);
}

double sub_100006924(unsigned __int16 *a1)
{
  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *(int8x16_t *)(a1 + 18) = vrev32q_s8(*(int8x16_t *)(a1 + 18));
  *(int8x16_t *)(a1 + 26) = vrev32q_s8(*(int8x16_t *)(a1 + 26));
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  *((void *)a1 + 9) = bswap64(*((void *)a1 + 9));
  sub_1000069E0((uint64_t)(a1 + 56));
  sub_1000069E0((uint64_t)(a1 + 96));
  sub_1000069E0((uint64_t)(a1 + 136));
  sub_1000069E0((uint64_t)(a1 + 176));

  *(void *)&double result = sub_1000069E0((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 sub_1000069E0(uint64_t a1)
{
  uint64_t v1 = 0;
  *(void *)a1 = bswap64(*(void *)a1);
  *(int8x8_t *)(a1 + 8) = vrev32_s8(*(int8x8_t *)(a1 + 8));
  do
  {
    v2 = (float *)(a1 + 16 + v1);
    float32x4x2_t v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
    v1 += 32;
  }
  while (v1 != 64);
  return (__n128)v4.val[0];
}

void sub_100006A24()
{
}

void sub_100006A34()
{
}

void sub_100006A5C(_DWORD *a1)
{
}

void sub_100006A8C(_DWORD *a1)
{
}

void sub_100006ABC(uint64_t a1, const char **a2)
{
}

void sub_100006B10()
{
}

void sub_100006B38()
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t _CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return __CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

int *__error(void)
{
  return ___error();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void closelog(void)
{
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

gid_t getegid(void)
{
  return _getegid();
}

uid_t geteuid(void)
{
  return _geteuid();
}

group *__cdecl getgrnam(const char *a1)
{
  return _getgrnam(a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_valloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

void openlog(const char *a1, int a2, int a3)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void vwarnx(const char *a1, __darwin_va_list a2)
{
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

uint64_t wipefs_alloc()
{
  return _wipefs_alloc();
}

uint64_t wipefs_free()
{
  return _wipefs_free();
}

uint64_t wipefs_wipe()
{
  return _wipefs_wipe();
}