uint64_t readboot()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int8x8_t v17;
  int8x8_t v18;
  uint8x8_t v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  const char *v23;
  int *v24;
  long long *v25;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  uint8x8_t v31;
  int *v32;
  const char *v33;
  uint64_t v34;
  unsigned int v35;
  BOOL v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  unint64_t v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  long long v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  unsigned __int8 v74;
  unsigned __int16 v75;
  unsigned __int8 v76;
  unsigned __int16 v77;
  unsigned __int8 v78;
  unsigned __int16 v79;
  unsigned __int16 v80;
  unsigned __int8 v81;
  unsigned __int16 v82;
  unsigned __int16 v83;
  unsigned __int16 v84;
  uint64_t v85;
  unsigned int v86;
  char v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned int v90;
  unsigned __int16 v91;
  unsigned __int16 v92;
  char v93;
  unsigned int v94;
  unsigned __int8 v95;
  unsigned __int8 v96;
  unsigned __int8 v97;
  unsigned __int8 v98;
  long long v99;
  uint64_t v100;
  int v101;
  uint64_t v102;
  int v103;
  int v104;

  v0 = __chkstk_darwin();
  v2 = v1;
  v3 = (unsigned int *)v0;
  if ((*(uint64_t (**)(void, unsigned __int8 *, uint64_t, void))(v1 + 32))(*(void *)(v1 + 24), &v74, 4096, 0) == 4096)
  {
    if ((v74 & 0xFD) == 0xE9)
    {
      *(_OWORD *)v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      v3[28] = 0;
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      v3[18] = -1;
      v9 = v75;
      v10 = v76;
      *v3 = v75;
      v3[1] = v10;
      v11 = v78;
      v3[2] = v77;
      v3[3] = v11;
      v12 = v79;
      v13 = v80;
      v14 = v81;
      v3[4] = v79;
      v3[5] = v14;
      v15 = v82;
      v16 = v83;
      v3[6] = v82;
      v3[7] = v16;
      v3[8] = v84;
      v3[9] = v13;
      v17.i32[1] = HIDWORD(v85);
      *((void *)v3 + 5) = v85;
      v3[22] = v15;
      v3[25] = v9 * v10;
      if ((v9 - 512) > 0xE00
        || (v17.i32[0] = v9, v18 = vcnt_s8(v17), v18.i16[0] = vaddlv_u8((uint8x8_t)v18), v18.i32[0] >= 2u))
      {
        v99 = fsck_ctx;
        v100 = qword_100056470;
        v67 = v9;
        v23 = "Invalid sector size: %u\n";
      }
      else
      {
        if (v10)
        {
          v18.i32[0] = v10;
          v19 = (uint8x8_t)vcnt_s8(v18);
          v19.i16[0] = vaddlv_u8(v19);
          if (v19.i32[0] < 2u)
          {
            v20 = v3[17];
            if (!v12)
            {
              v20 |= 1u;
              v3[17] = v20;
            }
            if ((v20 & 1) == 0)
            {
              v21 = 0;
              goto LABEL_11;
            }
            v3[22] = v86;
            if (v87 < 0) {
              v3[18] = v87 & 0xF;
            }
            if (v88 | v89)
            {
              v99 = fsck_ctx;
              v100 = qword_100056470;
              v67 = v89;
              v23 = "Unknown filesystem version: %x.%x\n";
              goto LABEL_17;
            }
            v28 = v90;
            v29 = v91;
            v30 = v92;
            v3[12] = v91;
            v3[13] = v30;
            v3[14] = v28;
            if ((*(uint64_t (**)(void, long long *, uint64_t, void))(v2 + 32))(*(void *)(v2 + 24), &v99, v9, (v29 * v9)) != *v3)
            {
              v32 = __error();
              strerror(*v32);
              v70 = fsck_ctx;
              v71 = qword_100056470;
              v33 = "could not read fsinfo block";
              goto LABEL_32;
            }
            if (v99 == 1096897106
              && (v31.i32[0] = v103, vmovn_s16((int16x8_t)vmovl_u8(v31)).u32[0] == -1437270016)
              && v101 == 1631679090)
            {
              v21 = 0;
            }
            else
            {
              v70 = fsck_ctx;
              v71 = qword_100056470;
              fsck_print((uint64_t)&v70, 6, (uint64_t)"Warning: Invalid signature in fsinfo block\n", v4, v5, v6, v7, v8, v67);
              v70 = fsck_ctx;
              v71 = qword_100056470;
              if (!fsck_ask((uint64_t)&v70, 0, (uint64_t)"fix", v38, v39, v40, v41, v42, v68))
              {
                v3[12] = 0;
                v21 = 8;
                goto LABEL_11;
              }
              LODWORD(v99) = 1096897106;
              v101 = 1631679090;
              v103 = -1437270016;
              v104 = -1437270016;
              if ((*(uint64_t (**)(void, long long *, void, void))(v2 + 40))(*(void *)(v2 + 24), &v99, *v3, v3[12] * *v3) != *v3)
              {
                v51 = __error();
                strerror(*v51);
                v70 = fsck_ctx;
                v71 = qword_100056470;
                v33 = "Unable to write FSInfo";
                goto LABEL_32;
              }
              v21 = 1;
            }
            if (v3[12]) {
              *(void *)(v3 + 15) = v102;
            }
LABEL_11:
            v22 = v3[3] * (unint64_t)v3[22];
            if ((v22 & 0xFFFFFFFF00000000) != 0)
            {
              v70 = fsck_ctx;
              v71 = qword_100056470;
              v23 = "Invalid boot->FATs or boot->FATsecs\n";
LABEL_38:
              v25 = &v70;
              goto LABEL_18;
            }
            v3[24] = (*v3 + 32 * v3[4] - 1) / *v3 + v22 + v3[2];
            v27 = v3[9];
            if (v27)
            {
              v3[11] = 0;
            }
            else
            {
              v27 = v3[11];
              if (!v27)
              {
                v3[21] = 0;
                if (v93 == 41
                  && (v94 | ((unint64_t)v95 << 32) | ((unint64_t)v96 << 40) | ((unint64_t)v97 << 48))
                   + ((unint64_t)v98 << 54))
                {
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  fsck_print((uint64_t)&v70, 6, (uint64_t)"Warning: Encountered special FAT where total sector location is 64bit. Not Supported \n", v4, v5, v6, v7, v8, v67);
                }
                else
                {
                  v73 = 0;
                  v72 = 0;
                  __strlcpy_chk();
                  v73 = 0;
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  fsck_print((uint64_t)&v70, 6, (uint64_t)"Warning: OEMName: %s\n", v46, v47, v48, v49, v50, (uint64_t)&v72);
                }
LABEL_35:
                v34 = v3[21];
                if (!v34 || (v35 = v3[24], v36 = v34 >= v35, v37 = v34 - v35, !v36))
                {
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  v67 = v34;
                  v23 = "Filesystem has invalid NumSectors %u\n";
                  goto LABEL_38;
                }
                v43 = v37 / v3[1];
                v44 = (v43 + 2);
                v3[20] = v44;
                if (v3[17])
                {
                  v45 = 0xFFFFFFF;
                }
                else if (v44 >= 0xFF7)
                {
                  if (v44 >= 0xFFF8)
                  {
                    v70 = fsck_ctx;
                    v71 = qword_100056470;
                    v67 = v43;
                    v23 = "Filesystem too big (%u clusters) for non-FAT32 partition\n";
                    goto LABEL_38;
                  }
                  v45 = 0xFFFF;
                }
                else
                {
                  v45 = 4095;
                }
                v3[19] = v45;
                v52 = v3[22] * (unint64_t)*v3;
                if ((v52 & 0xFFFFFFFF00000000) != 0)
                {
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  v23 = "Invalid boot->FATsecs or boot->BytesPerSec\n";
                  goto LABEL_38;
                }
                if (v45 == 0xFFFF)
                {
                  v53 = v52 >> 1;
                }
                else if (v45 == 0xFFFFFFF)
                {
                  v53 = v52 >> 2;
                }
                else
                {
                  if ((v52 & 0x80000000) != 0)
                  {
                    v70 = fsck_ctx;
                    v71 = qword_100056470;
                    v23 = "Invalid boot->FATsecs or boot->BytesPerSec for FAT12\n";
                    goto LABEL_38;
                  }
                  v53 = 2 * (int)v52 / 3u;
                }
                v3[23] = v53;
                if (v53 < v44)
                {
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  fsck_print((uint64_t)&v70, 6, (uint64_t)"Warning: FAT size too small, %u entries won't fit into %u sectors\n", v4, v5, v6, v7, v8, v44);
                  v3[20] = v3[23];
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  if (fsck_ask((uint64_t)&v70, 0, (uint64_t)"Fix total sectors", v54, v55, v56, v57, v58, v69))
                  {
                    v64 = v3[24] + (v3[20] - 2) * v3[1];
                    v3[21] = v64;
                    if (v3[9])
                    {
                      v3[9] = v64;
                      v80 = v64;
                    }
                    else
                    {
                      v3[11] = v64;
                      HIDWORD(v85) = v64;
                    }
                    if ((*(uint64_t (**)(void, unsigned __int8 *, void, void))(v2 + 40))(*(void *)(v2 + 24), &v74, *v3, 0) == *v3)
                    {
                      v21 = v21 | 1;
                      goto LABEL_75;
                    }
                    v66 = __error();
                    strerror(*v66);
                    v70 = fsck_ctx;
                    v71 = qword_100056470;
                    v33 = "could not write boot sector";
LABEL_32:
                    v67 = (uint64_t)v33;
                    v23 = "%s (%s)\n";
                    goto LABEL_38;
                  }
                  v65 = v3[23] - 2;
                  v70 = fsck_ctx;
                  v71 = qword_100056470;
                  fsck_print((uint64_t)&v70, 6, (uint64_t)"Warning: Continuing, assuming %u clusters\n", v59, v60, v61, v62, v63, v65);
                }
LABEL_75:
                v3[27] = 0;
                return v21;
              }
            }
            v3[21] = v27;
            goto LABEL_35;
          }
        }
        v99 = fsck_ctx;
        v100 = qword_100056470;
        v67 = v10;
        v23 = "Invalid sectors per cluster: %u\n";
      }
    }
    else
    {
      v99 = fsck_ctx;
      v100 = qword_100056470;
      v67 = v74;
      v23 = "Invalid BS_jmpBoot in boot block: %02x%02x%02x\n";
    }
  }
  else
  {
    v24 = __error();
    strerror(*v24);
    v99 = fsck_ctx;
    v100 = qword_100056470;
    v67 = (uint64_t)"could not read boot block";
    v23 = "%s (%s)\n";
  }
LABEL_17:
  v25 = &v99;
LABEL_18:
  fsck_print((uint64_t)v25, 2, (uint64_t)v23, v4, v5, v6, v7, v8, v67);
  return 16;
}

uint64_t writefsinfo()
{
  v0 = (_DWORD *)__chkstk_darwin();
  uint64_t v2 = v1;
  v3 = v0;
  uint64_t v4 = (*v0 * v0[12]);
  uint64_t v5 = (*(uint64_t (**)(void, unsigned char *))(v1 + 32))(*(void *)(v1 + 24), v18);
  if (v5 == *v3)
  {
    int v6 = v3[16];
    int v19 = v3[15];
    int v20 = v6;
    if ((*(uint64_t (**)(void, unsigned char *, uint64_t, uint64_t))(v2 + 40))(*(void *)(v2 + 24), v18, v5, v4) == *v3) {
      return 0;
    }
    v15 = __error();
    strerror(*v15);
    long long v16 = fsck_ctx;
    uint64_t v17 = qword_100056470;
    v14 = "Unable to write FSInfo";
  }
  else
  {
    v8 = __error();
    strerror(*v8);
    long long v16 = fsck_ctx;
    uint64_t v17 = qword_100056470;
    v14 = "could not read fsinfo block";
  }
  fsck_print((uint64_t)&v16, 2, (uint64_t)"%s (%s)\n", v9, v10, v11, v12, v13, (uint64_t)v14);
  return 16;
}

uint64_t checkfilesys(char *a1, void *a2)
{
  if (a2 && *a2 && (uint64_t v4 = (void (*)(const char *, uint64_t, uint64_t, int *))a2[1]) != 0)
  {
    uint64_t v5 = a2[2];
    int v135 = 0;
    int v134 = 0;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v127 = 0u;
    int v126 = -1;
    if (v5)
    {
      int v6 = 1;
      v4("Check device: Checking parameters", 1, 3, &v135);
    }
    else
    {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
    int v135 = 0;
    int v134 = 0;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v127 = 0u;
    int v126 = -1;
  }
  unsigned int v7 = fsck_fd();
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = fsck_fd();
    int v126 = v8;
    goto LABEL_20;
  }
  if (!strncmp(a1, "/dev/disk", 9uLL))
  {
    unsigned int v16 = snprintf(__str, 0x40uLL, "/dev/r%s", a1 + 5);
  }
  else
  {
    if (strncmp(a1, "disk", 4uLL))
    {
      if (!strncmp(a1, "/dev/fd/", 8uLL))
      {
        __endptr[0] = 0;
        int v126 = strtol(a1 + 8, __endptr, 10);
        if (*__endptr[0])
        {
          long long v117 = fsck_ctx;
          *(void *)&long long v118 = qword_100056470;
          fsck_print((uint64_t)&v117, 2, (uint64_t)"Invalid file descriptor path: %s", v9, v10, v11, v12, v13, (uint64_t)a1);
          LOBYTE(v14) = 0;
          unsigned int v15 = 0;
LABEL_77:
          int v51 = 0;
          int v52 = 0;
          int v17 = 1;
LABEL_52:
          uint64_t v53 = 8;
          if ((v6 & 1) == 0) {
            goto LABEL_60;
          }
LABEL_53:
          if (!fsck_quick() || HIDWORD(v131) == 4095)
          {
            v54 = off_10004C550;
            if (!v53) {
              v54 = off_10004C580;
            }
            ((void (*)(char *, void))a2[2])(v54[v15++], *a2);
          }
          int v135 = 0;
          int v52 = 1;
          ((void (*)(char *, uint64_t, uint64_t, int *, void))a2[1])(off_10004C580[v15], 19, 1, &v135, *a2);
          if (v51) {
            goto LABEL_59;
          }
          goto LABEL_60;
        }
      }
      goto LABEL_19;
    }
    unsigned int v16 = snprintf(__str, 0x40uLL, "/dev/r%s", a1);
  }
  if (v16 < 0x40) {
    a1 = __str;
  }
LABEL_19:
  int v8 = v126;
LABEL_20:
  int v17 = v7 >> 31;
  int v18 = ++v135;
  if ((v8 & 0x80000000) == 0)
  {
    if (!a2[3]) {
      a2[3] = &v126;
    }
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v117 = 0u;
    if (((unsigned int (*)(void))a2[6])())
    {
      int v19 = __error();
      strerror(*v19);
      *(_OWORD *)__endptr = fsck_ctx;
      uint64_t v116 = qword_100056470;
      fsck_print((uint64_t)__endptr, 2, (uint64_t)"%s (%s)\n", v20, v21, v22, v23, v24, (uint64_t)"Cannot stat");
      LOBYTE(v14) = 0;
      unsigned int v15 = 0;
LABEL_51:
      int v51 = 0;
      int v52 = 0;
      goto LABEL_52;
    }
    int v18 = v135;
  }
  int v135 = v18 + 1;
  uint64_t v25 = fsck_alwaysno() || fsck_quick();
  fsck_set_rdonly(v25);
  if (!fsck_preen())
  {
    long long v117 = fsck_ctx;
    *(void *)&long long v118 = qword_100056470;
    fsck_print((uint64_t)&v117, 6, (uint64_t)"** %s", v26, v27, v28, v29, v30, (uint64_t)a1);
  }
  ++v135;
  if (v6)
  {
    ((void (*)(const char *, void))a2[2])("Check device: Checking parameters", *a2);
    int v135 = 0;
    unsigned int v15 = 1;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Check device: open file", 1, 3, &v135, *a2);
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ((v126 & 0x80000000) == 0)
  {
    ++v135;
    goto LABEL_46;
  }
  if (a2[3])
  {
    ++v135;
  }
  else
  {
    if (fsck_rdonly()) {
      int v37 = open(a1, 0, 0);
    }
    else {
      int v37 = open(a1, 34, 0);
    }
    int v126 = v37;
    ++v135;
    int v17 = 1;
    if ((v37 & 0x80000000) == 0) {
      goto LABEL_46;
    }
  }
  if (!a2[3] && !fsck_rdonly())
  {
    uint64_t v110 = 0;
    int v126 = open(a1, 0);
    if (v126 < 0)
    {
      if (fsck_preen())
      {
LABEL_155:
        int v17 = 1;
        fsck_set_rdonly(1);
        goto LABEL_48;
      }
      long long v117 = fsck_ctx;
      *(void *)&long long v118 = qword_100056470;
      v36 = "\n";
    }
    else
    {
      long long v117 = fsck_ctx;
      *(void *)&long long v118 = qword_100056470;
      v36 = "Warning:  (NO WRITE)\n";
    }
    fsck_print((uint64_t)&v117, 6, (uint64_t)v36, v31, v32, v33, v34, v35, 0);
    goto LABEL_155;
  }
LABEL_46:
  if (!fsck_preen())
  {
    long long v117 = fsck_ctx;
    *(void *)&long long v118 = qword_100056470;
    fsck_print((uint64_t)&v117, 6, (uint64_t)"\n", v38, v39, v40, v41, v42, v110);
  }
LABEL_48:
  int v43 = v135++;
  uint64_t v44 = a2[3];
  if (!v44 && v126 < 0)
  {
    v45 = __error();
    strerror(*v45);
    long long v117 = fsck_ctx;
    *(void *)&long long v118 = qword_100056470;
    fsck_print((uint64_t)&v117, 2, (uint64_t)"%s (%s)\n", v46, v47, v48, v49, v50, (uint64_t)"Can't open");
    LOBYTE(v14) = 0;
    goto LABEL_51;
  }
  if (!v44) {
    a2[3] = &v126;
  }
  int v135 = v43 + 2;
  if (v6)
  {
    ((void (*)(char *, void))a2[2])(off_10004C580[v15], *a2);
    int v135 = 0;
    ((void (*)(char *, uint64_t, uint64_t, int *, void))a2[1])(off_10004C580[++v15], 2, 1, &v135, *a2);
  }
  int v14 = readboot();
  if ((v14 & 0x10) == 0)
  {
    ++v135;
    if (v6)
    {
      ((void (*)(char *, void))a2[2])(off_10004C580[v15], *a2);
      int v135 = 0;
      if (fsck_quick())
      {
        ((void (*)(char *, uint64_t, uint64_t, int *, void))a2[1])(off_10004C580[++v15], 19, 1, &v135, *a2);
LABEL_79:
        if (HIDWORD(v131) != 4095)
        {
          if (isdirty((unsigned int *)&v127, DWORD2(v131) & ~(SDWORD2(v131) >> 31), (uint64_t)a2))
          {
            long long v117 = fsck_ctx;
            *(void *)&long long v118 = qword_100056470;
            fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: FILESYSTEM DIRTY; SKIPPING CHECKS\n",
              v105,
              v106,
              v107,
              v108,
              v109,
              v110);
            uint64_t v53 = 32;
          }
          else
          {
            long long v117 = fsck_ctx;
            *(void *)&long long v118 = qword_100056470;
            fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: FILESYSTEM CLEAN; SKIPPING CHECKS\n",
              v105,
              v106,
              v107,
              v108,
              v109,
              v110);
            uint64_t v53 = 0;
          }
          if (v17) {
            close(v126);
          }
          if (!v6)
          {
            int v52 = 0;
            goto LABEL_60;
          }
          ((void (*)(char *, void))a2[2])(off_10004C580[v15], *a2);
          int v51 = 0;
          v15 += 2;
          int v135 = 0;
          goto LABEL_53;
        }
        fsck_set_rdonly(1);
        fsck_set_alwaysno(1);
        fsck_set_alwaysyes(0);
        fsck_set_quick(1);
        int v114 = v17;
        if (v6)
        {
          ((void (*)(char *, void))a2[2])(off_10004C580[v15], *a2);
          int v135 = 0;
          ++v15;
        }
        goto LABEL_87;
      }
      ++v15;
    }
    else if (fsck_quick())
    {
      goto LABEL_79;
    }
    int v114 = v17;
    ++v15;
LABEL_87:
    int v51 = 0;
    uint64_t v53 = 8;
    int v61 = 1;
    int v112 = 3;
    int v113 = 3;
    while (1)
    {
      if (v6)
      {
        if (fsck_quick()) {
          uint64_t v62 = 58;
        }
        else {
          uint64_t v62 = 77;
        }
        ((void (*)(char *, uint64_t, uint64_t, int *, void))a2[1])(off_10004C580[v15], v62, 6, &v135, *a2);
      }
      DWORD2(v133) = 0;
      int v134 = 0;
      if (!fsck_preen() && !fsck_quiet())
      {
        long long v117 = fsck_ctx;
        *(void *)&long long v118 = qword_100056470;
        fsck_print((uint64_t)&v117, 6, (uint64_t)"** Phase 1 - Preparing FAT\n", v63, v64, v65, v66, v67, v110);
      }
      ++v135;
      v14 |= fat_init(&v127, (uint64_t)a2);
      if ((v14 & 0x10) != 0) {
        break;
      }
      ++v135;
      if (!fsck_preen() && !fsck_quiet())
      {
        long long v117 = fsck_ctx;
        *(void *)&long long v118 = qword_100056470;
        fsck_print((uint64_t)&v117, 6, (uint64_t)"** Phase 2 - Checking Directories\n", v68, v69, v70, v71, v72, v110);
      }
      v14 |= resetDosDirSection((uint64_t)&v127, (uint64_t)a2);
      if ((v14 & 0x10) != 0) {
        goto LABEL_136;
      }
      ++v135;
      uint64_t v73 = v126;
      BOOL v74 = fsck_rdonly();
      v14 |= handleDirTree(v73, (unsigned int *)&v127, v74, (uint64_t)a2, v75, v76, v77, v78);
      if ((v14 & 0x10) != 0) {
        goto LABEL_136;
      }
      if (!fsck_preen() && !fsck_quiet())
      {
        long long v117 = fsck_ctx;
        *(void *)&long long v118 = qword_100056470;
        fsck_print((uint64_t)&v117, 6, (uint64_t)"** Phase 3 - Checking for Orphan Clusters\n", v81, v82, v83, v84, v85, v110);
      }
      ++v135;
      v14 |= fat_free_unused((uint64_t)a2, v79, v80, v81, v82, v83, v84, v85);
      if ((v14 & 0x10) != 0)
      {
LABEL_136:
        int v51 = 1;
        goto LABEL_143;
      }
      if (fsck_quick())
      {
        long long v117 = fsck_ctx;
        *(void *)&long long v118 = qword_100056470;
        if (v14)
        {
          fsck_print((uint64_t)&v117, 6, (uint64_t)"FILESYSTEM DIRTY\n", v86, v87, v88, v89, v90, v110);
          uint64_t v53 = 32;
        }
        else
        {
          fsck_print((uint64_t)&v117, 6, (uint64_t)"FILESYSTEM CLEAN\n", v86, v87, v88, v89, v90, v110);
          uint64_t v53 = 0;
        }
      }
      long long v117 = fsck_ctx;
      *(void *)&long long v118 = qword_100056470;
      if (v134) {
        fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: %d files, %lld KiB free (%d clusters), %lld KiB bad (%d clusters)\n", v86, v87, v88, v89, v90, DWORD2(v133));
      }
      else {
        fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: %d files, %lld KiB free (%d clusters)\n", v86, v87, v88, v89, v90, DWORD2(v133));
      }
      if (v14 && (v14 & 0x28) == 0x20)
      {
        long long v117 = fsck_ctx;
        *(void *)&long long v118 = qword_100056470;
        if (!fsck_ask((uint64_t)&v117, 1, (uint64_t)"MARK FILE SYSTEM CLEAN", v91, v92, v93, v94, v95, v110))v14 &= ~0x20u; {
        long long v117 = fsck_ctx;
        }
        *(void *)&long long v118 = qword_100056470;
        if ((v14 & 0x20) != 0)
        {
          fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: MARKING FILE SYSTEM CLEAN\n", v96, v97, v98, v99, v100, v111);
          v14 |= fat_mark_clean((uint64_t)a2);
        }
        else
        {
          fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: \n***** FILE SYSTEM IS LEFT MARKED AS DIRTY *****\n", v96, v97, v98, v99, v100, v111);
        }
      }
      ++v135;
      int v101 = fat_flush((uint64_t)a2);
      ++v135;
      char v102 = v101 | v14;
      if (!(v101 | v14))
      {
LABEL_131:
        if ((v102 & 0x18) != 0) {
          uint64_t v53 = v53;
        }
        else {
          uint64_t v53 = 0;
        }
        if (v6)
        {
          int v51 = 1;
          LOBYTE(v14) = v102;
          int v17 = v114;
          goto LABEL_53;
        }
        int v52 = 0;
        LOBYTE(v14) = v102;
        int v17 = v114;
        goto LABEL_59;
      }
      if (fsck_rdonly())
      {
        int v51 = 1;
        LOBYTE(v14) = v102;
LABEL_143:
        int v17 = v114;
        if (v6) {
          goto LABEL_53;
        }
        goto LABEL_144;
      }
      if ((v102 & 0x10) != 0)
      {
        int v14 = 0;
        int v51 = 1;
        BOOL v103 = __OFSUB__(v61--, 1);
        if (!((v61 < 0) ^ v103 | (v61 == 0))) {
          continue;
        }
      }
      if ((v102 & 8) != 0)
      {
        int v14 = 0;
        int v51 = 1;
        BOOL v104 = v113-- <= 1;
        if (!v104) {
          continue;
        }
      }
      if ((v102 & 0x40) == 0) {
        goto LABEL_131;
      }
      int v14 = 0;
      int v51 = 1;
      BOOL v104 = v112-- <= 1;
      if (v104) {
        goto LABEL_131;
      }
    }
    int v17 = v114;
    if (!v114) {
      goto LABEL_83;
    }
    close(v126);
    int v17 = 1;
    uint64_t v53 = 8;
    if (v6) {
      goto LABEL_53;
    }
    goto LABEL_144;
  }
  if (v17)
  {
    close(v126);
    goto LABEL_77;
  }
  int v51 = 0;
LABEL_83:
  uint64_t v53 = 8;
  if (v6) {
    goto LABEL_53;
  }
LABEL_144:
  int v52 = 0;
  if (v51) {
LABEL_59:
  }
    finishDosDirSection();
LABEL_60:
  ++v135;
  fat_uninit();
  freeUseMap();
  if (v17) {
    close(v126);
  }
  if ((v14 & 6) != 0)
  {
    long long v117 = fsck_ctx;
    *(void *)&long long v118 = qword_100056470;
    fsck_print((uint64_t)&v117, 6, (uint64_t)"Warning: \n***** FILE SYSTEM WAS MODIFIED *****\n", v55, v56, v57, v58, v59, v110);
  }
  if (v52) {
    ((void (*)(char *, void))a2[2])(off_10004C580[v15], *a2);
  }
  return v53;
}

uint64_t CONV_UTF8ToUnistr255(unsigned __int8 *a1, uint64_t a2, _WORD *a3, int a4)
{
  uint64_t v5 = a3 + 1;
  if (!a2)
  {
    uint64_t result = 0;
    LODWORD(v10) = a3 + 2;
    goto LABEL_91;
  }
  uint64_t v6 = a2;
  signed int v8 = 0;
  unint64_t v9 = (unint64_t)(a3 + 256);
  uint64_t v10 = a3 + 1;
LABEL_3:
  uint64_t v11 = a1;
  do
  {
    unsigned int v13 = *a1++;
    unint64_t v12 = v13;
    if (!v13) {
      break;
    }
    if ((unint64_t)v10 >= v9) {
      goto LABEL_90;
    }
    --v6;
    if ((v12 & 0x80) == 0)
    {
      signed int v43 = v8;
      int v44 = a4;
      if ((a4 & 0x20) != 0 || v12 == 47)
      {
        if (v6)
        {
LABEL_36:
          if (v12 > 0x1F) {
            __int16 v27 = word_100038EF6[v12];
          }
          else {
            __int16 v27 = v12 | 0xF000;
          }
        }
        else if (v12 == 32)
        {
          __int16 v27 = -4056;
        }
        else
        {
          if (v12 != 46) {
            goto LABEL_36;
          }
          __int16 v27 = -4055;
        }
        LOWORD(v12) = v27;
      }
LABEL_44:
      if (sub_100002BF8((unsigned __int16)v12))
      {
        signed int v8 = v43 + 1;
      }
      else
      {
        if (v43 >= 2) {
          sub_100002C58(&v10[-v43], v43);
        }
        signed int v8 = 0;
      }
      *v10++ = v12;
      a4 = v44;
      if (v6) {
        goto LABEL_3;
      }
      break;
    }
    uint64_t v14 = utf_extrabytes[v12 >> 3];
    if ((v14 & 0x80000000) == 0 && (int)v6 >= (int)v14)
    {
      v6 -= v14;
      switch(v14)
      {
        case 3:
          int v17 = *a1;
          if ((v17 & 0xC0) == 0x80)
          {
            int v18 = v11[2];
            if ((v18 & 0xC0) == 0x80)
            {
              int v19 = v11[3];
              if ((v19 & 0xC0) == 0x80)
              {
                unsigned int v20 = v19 + (((v17 << 6) + (v12 << 12) + v18) << 6) - 63512704;
                if (!(v20 >> 20))
                {
                  *uint64_t v10 = (v20 >> 10) - 10240;
                  if ((unint64_t)(v10 + 1) >= v9)
                  {
                    uint64_t result = 63;
                    LODWORD(v10) = v10 + 2;
                    goto LABEL_91;
                  }
                  a1 = v11 + 4;
                  v10[1] = v20 & 0x3FF | 0xDC00;
                  uint64_t v21 = 2;
                  goto LABEL_31;
                }
              }
            }
          }
          break;
        case 2:
          int v22 = *a1;
          if ((v22 & 0xC0) == 0x80)
          {
            int v23 = v11[2];
            if ((v23 & 0xC0) == 0x80)
            {
              int v24 = (v22 << 6) + (v12 << 12) + v23;
              unsigned int v16 = v24 - 925824;
              if ((v24 - 925824) >= 0x800
                && (v16 >> 11 < 0x1B || v16 >= 0xE000 && (v24 & 0x3FFFFE) != 0xF207E))
              {
                uint64_t v28 = 3;
LABEL_52:
                signed int v43 = v8;
                int v44 = a4;
                if (v10 == v5)
                {
                  uint64_t v10 = v5;
                  goto LABEL_60;
                }
                if (sub_100002BF8((unsigned __int16)v16))
                {
                  unsigned int v29 = (unsigned __int16)*(v10 - 1);
                  if ((unsigned __int16)(v16 - 4449) > 0x61u)
                  {
                    if ((unsigned __int16)(v16 - 12443) < 0xD265u) {
                      goto LABEL_60;
                    }
                  }
                  else
                  {
                    if ((unsigned __int16)((unsigned __int16)v16 >> 1) <= 0x8BAu
                      && (unsigned __int16)(v29 - 4352) <= 0x12u)
                    {
                      unsigned __int16 v30 = 588 * v29 + 28 * v16 - 18076;
                      goto LABEL_58;
                    }
                    if ((unsigned __int16)((unsigned __int16)v16 >> 3) >= 0x235u
                      && (unsigned __int16)((unsigned __int16)(v29 + 21504) >> 2) <= 0xAE8u)
                    {
                      HIDWORD(v35) = -1227133513 * v29 - 1840706560;
                      LODWORD(v35) = HIDWORD(v35);
                      if ((v35 >> 2) <= 0x9249249)
                      {
                        unsigned __int16 v30 = v16 + v29 - 4519;
                        goto LABEL_58;
                      }
                      goto LABEL_60;
                    }
                  }
                  uint64_t v31 = &unk_100039518;
                  uint64_t v32 = &unk_100039378;
                  do
                  {
                    uint64_t v33 = (v31 - v32) >> 4;
                    uint64_t v34 = &v32[8 * v33];
                    if (*v34 <= (unsigned __int16)v16)
                    {
                      if (*v34 >= (unsigned __int16)v16)
                      {
                        int v36 = *(_DWORD *)&v32[8 * v33 + 4];
                        if (!v36) {
                          break;
                        }
                        int v37 = (char *)&unk_100039520 + 4 * (unsigned __int16)v36;
                        if (*(unsigned __int16 *)v37 > v29) {
                          break;
                        }
                        uint64_t v38 = (unsigned __int16 *)&v37[4 * HIWORD(v36) - 4];
                        if (*v38 < v29) {
                          break;
                        }
                        while (1)
                        {
                          uint64_t v39 = ((char *)v38 - v37) >> 3;
                          uint64_t v40 = (unsigned __int16 *)&v37[4 * v39];
                          unsigned int v41 = *v40;
                          if (v41 <= v29)
                          {
                            if (v41 >= v29)
                            {
                              unsigned __int16 v30 = *(_WORD *)&v37[4 * v39 + 2];
                              if (!v30) {
                                goto LABEL_60;
                              }
LABEL_58:
                              unsigned int v16 = v30;
                              --v10;
                              goto LABEL_60;
                            }
                            int v37 = (char *)(v40 + 2);
                          }
                          else
                          {
                            uint64_t v38 = v40 - 2;
                          }
                          if (v37 > (char *)v38) {
                            goto LABEL_60;
                          }
                        }
                      }
                      uint64_t v32 = v34 + 2;
                    }
                    else
                    {
                      uint64_t v31 = v34 - 2;
                    }
                  }
                  while (v32 <= v31);
                }
LABEL_60:
                a1 = &v11[v28];
                if (v16 == 9216) {
                  LOWORD(v12) = 0;
                }
                else {
                  LOWORD(v12) = v16;
                }
                goto LABEL_44;
              }
            }
          }
          break;
        case 1:
          int v15 = *a1;
          if ((v15 & 0xC0) == 0x80)
          {
            unsigned int v16 = v15 + (v12 << 6) - 12416;
            if (v16 >= 0x80)
            {
              uint64_t v28 = 2;
              goto LABEL_52;
            }
          }
          break;
        default:
          uint64_t result = 22;
          goto LABEL_91;
      }
    }
    if ((unint64_t)(v10 + 2) >= v9)
    {
LABEL_90:
      uint64_t result = 63;
      goto LABEL_91;
    }
    __int16 v25 = hexdigits[v12 >> 4];
    __int16 v26 = hexdigits[v12 & 0xF];
    *uint64_t v10 = 37;
    if ((int)v14 <= 0) {
      uint64_t v14 = 0;
    }
    v6 += v14;
    v10[1] = v25;
    v10[2] = v26;
    uint64_t v21 = 3;
LABEL_31:
    v10 += v21;
    uint64_t v11 = a1;
  }
  while (v6);
  if (v8 >= 2) {
    sub_100002C58(&v10[-v8], v8);
  }
  uint64_t result = 0;
LABEL_91:
  *a3 = (v10 - v5) >> 1;
  return result;
}

uint64_t sub_100002BF8(unsigned int a1)
{
  if (a1 < 0x300) {
    return 0;
  }
  int v1 = byte_100038FF6[(unint64_t)a1 >> 8];
  if (!byte_100038FF6[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (byte_100038FF6[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

_WORD *sub_100002C58(_WORD *result, unsigned int a2)
{
  do
  {
    if (byte_10003A374[(unint64_t)(unsigned __int16)*result >> 8]) {
      unsigned int v2 = byte_10003A374[256 * (unint64_t)byte_10003A374[(unint64_t)(unsigned __int16)*result >> 8]
    }
                        + *result];
    else {
      unsigned int v2 = 0;
    }
    if (a2 < 2) {
      break;
    }
    int v3 = 0;
    uint64_t v4 = result + 1;
    do
    {
      unint64_t v5 = (unsigned __int16)*v4;
      uint64_t v6 = byte_10003A374[v5 >> 8];
      if (byte_10003A374[v5 >> 8]) {
        LODWORD(v6) = byte_10003A374[256 * v6 + *v4];
      }
      if (v2 > v6)
      {
        __int16 v7 = *(v4 - 1);
        *(v4 - 1) = v5;
        *uint64_t v4 = v7;
        int v3 = 1;
      }
      ++v4;
      unsigned int v2 = v6;
    }
    while (v4 < &result[a2]);
  }
  while (v3);
  return result;
}

unint64_t CONV_Unistr255ToUTF8(unint64_t result, unsigned char *a2)
{
  int v3 = *(unsigned __int16 *)result;
  if (*(_WORD *)result)
  {
    int v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    __int16 v7 = (unsigned __int16 *)(result + 2);
    signed int v8 = a2;
    while (1)
    {
      --v3;
      if (v4 < 1)
      {
        unsigned int v10 = *v7++;
        uint64_t result = v10;
        if (v10 >= 0xC0uLL)
        {
          int v11 = byte_10003B874[result >> 8];
          if (byte_10003B874[result >> 8])
          {
            if (v11 == 255
              || ((byte_10003B874[(result >> 3) + 256 + 32 * v11 - 32] >> (result & 7)) & 1) != 0)
            {
              unsigned __int16 v12 = result + 21504;
              if ((unsigned __int16)(result + 21504) > 0x2BA4u)
              {
                int v14 = sub_100003364(result, &v23);
                uint64_t result = v23;
              }
              else
              {
                __int16 v13 = (unsigned __int16)(result + 21504) % 0x1Cu;
                uint64_t result = ((28533 * (unsigned __int16)(result + 21504)) >> 24) | 0x1100;
                unsigned __int16 v23 = ((28533 * v12) >> 24) | 0x1100;
                v24[0] = v12 % 0x24Cu / 0x1C + 4449;
                if (v12 % 0x1Cu)
                {
                  v24[1] = v13 + 4519;
                  int v14 = 3;
                }
                else
                {
                  int v14 = 2;
                }
              }
              int v4 = v14 - 1;
              v3 += v14 - 1;
              unint64_t v5 = v24;
            }
          }
        }
      }
      else
      {
        unsigned int v9 = *v5++;
        uint64_t result = v9;
        --v4;
      }
      if (result) {
        unsigned int v15 = result;
      }
      else {
        unsigned int v15 = 9216;
      }
      if (result == 47) {
        unsigned int v15 = 95;
      }
      if (v15 > 0x7F)
      {
        if (v15 > 0x7FF)
        {
          if (v15 > 0xFFFD) {
            goto LABEL_46;
          }
          if (v15 >> 10 != 54 || v3 == 0)
          {
            if ((v15 & 0xFFC0) != 0xF000 || (v15 & 0x3F) >= 0x2B)
            {
              unsigned int v21 = v15 >> 6;
              unsigned int v22 = v15 >> 12;
LABEL_41:
              signed int v8 = &a2[v6];
              if (v6 > 762) {
                goto LABEL_46;
              }
              unsigned char *v8 = v22 | 0xE0;
              v8[1] = v21 & 0x3F | 0x80;
              v6 += 3;
              v8[2] = v15 & 0x3F | 0x80;
              goto LABEL_43;
            }
            if (v6 > 764) {
              goto LABEL_46;
            }
            ++v6;
            unsigned char *v8 = byte_10003D99C[v15 & 0x3F];
          }
          else
          {
            int v18 = *v7;
            if ((v18 & 0xFC00) != 0xDC00)
            {
              unsigned int v21 = v15 >> 6;
              LOBYTE(v22) = 13;
              goto LABEL_41;
            }
            if (v6 >= 762)
            {
              signed int v8 = &a2[v6];
              goto LABEL_46;
            }
            unsigned int v19 = v18 + (v15 << 10) - 56613888;
            --v3;
            ++v7;
            unsigned char *v8 = (v19 >> 18) | 0xF0;
            unsigned int v20 = &a2[v6];
            v20[1] = (v19 >> 12) & 0x3F | 0x80;
            v20[2] = (v19 >> 6) & 0x3F | 0x80;
            v6 += 4;
            v20[3] = v18 & 0x3F | 0x80;
          }
        }
        else
        {
          if (v6 > 763) {
            goto LABEL_46;
          }
          unsigned int v16 = &a2[v6];
          unsigned char *v8 = (v15 >> 6) | 0xC0;
          v6 += 2;
          v16[1] = v15 & 0x3F | 0x80;
        }
      }
      else
      {
        if (v6 > 764) {
          goto LABEL_46;
        }
        ++v6;
        unsigned char *v8 = v15;
      }
LABEL_43:
      signed int v8 = &a2[v6];
      if (!v3) {
        goto LABEL_46;
      }
    }
  }
  signed int v8 = a2;
LABEL_46:
  unsigned char *v8 = 0;
  return result;
}

_WORD *CONV_Unistr255ToLowerCase(_WORD *result)
{
  uint64_t v1 = (unsigned __int16)*result;
  if (*result)
  {
    unsigned int v2 = result + 1;
    do
    {
      unint64_t v3 = (unsigned __int16)*v2;
      if (v3 <= 0xFF) {
        *unsigned int v2 = byte_100056174[v3];
      }
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t CONV_GetCurrentTime(timespec *__tp)
{
  return clock_gettime(_CLOCK_REALTIME, __tp);
}

uint64_t CONV_UTF8ToLowerCase(char *a1, unsigned char *a2)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    unint64_t v5 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    if (v5)
    {
      uint64_t v6 = v5;
      size_t v7 = strlen(a1);
      CONV_UTF8ToUnistr255((unsigned __int8 *)a1, v7, v6, 32);
      uint64_t v8 = (unsigned __int16)*v6;
      if (*v6)
      {
        unsigned int v9 = v6 + 1;
        do
        {
          unint64_t v10 = (unsigned __int16)*v9;
          if (v10 <= 0xFF) {
            *unsigned int v9 = byte_100056174[v10];
          }
          ++v9;
          --v8;
        }
        while (v8);
      }
      CONV_Unistr255ToUTF8((unint64_t)v6, a2);
      free(v6);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

_WORD *CONV_ConvertToFSM(_WORD *result)
{
  uint64_t v1 = (unsigned __int16)*result;
  if (*result)
  {
    uint64_t v2 = (v1 - 1);
    unint64_t v3 = result + 1;
    int v4 = &result[v2 + 1];
    while (!v2)
    {
      int v6 = (unsigned __int16)*v4;
      if (v6 == 46)
      {
        *int v4 = -4055;
      }
      else
      {
        if (v6 != 32) {
          break;
        }
        *int v4 = -4056;
      }
LABEL_10:
      --v2;
      ++v3;
      if (!--v1) {
        return result;
      }
    }
    unint64_t v5 = (unsigned __int16)*v3;
    if (v5 <= 0x7F) {
      _WORD *v3 = word_100038EF6[v5];
    }
    goto LABEL_10;
  }
  return result;
}

char *CONV_DuplicateName(char *result, char *__s)
{
  *(void *)uint64_t result = 0;
  if (__s)
  {
    unint64_t v3 = result;
    int v4 = strlen(__s);
    uint64_t result = (char *)malloc_type_malloc((v4 + 1), 0xC0C614D9uLL);
    *(void *)unint64_t v3 = result;
    if (result)
    {
      return strcpy(result, __s);
    }
  }
  return result;
}

uint64_t CONV_LabelUTF8ToUTF16LocalEncoding(char *a1, void *a2)
{
  size_t v4 = strnlen(a1, 0x40uLL);
  if (v4 > 0x3F) {
    return 22;
  }
  memset(v11, 0, sizeof(v11));
  uint64_t result = CONV_UTF8ToUnistr255((unsigned __int8 *)a1, v4, v11, 32);
  if (!result)
  {
    uint64_t v6 = LOWORD(v11[0]);
    if (LOWORD(v11[0]) > 0xBu) {
      return 22;
    }
    memset(a2, 32, 11);
    if (v6)
    {
      uint64_t v7 = 0;
      do
      {
        unint64_t v8 = *(unsigned __int16 *)((char *)v11 + v7 + 2);
        if (v8 <= 0xFF) {
          *(_WORD *)((char *)v11 + v7 + 2) = byte_100056174[v8];
        }
        v7 += 2;
      }
      while (2 * v6 != v7);
      unint64_t v9 = 0;
      do
      {
        unsigned int v10 = *((unsigned __int16 *)v11 + v9 + 1);
        if (v10 != 32)
        {
          unsigned int v10 = msdosfs_unicode2dos(v10);
          if (v10 < 3) {
            return 22;
          }
          LODWORD(v6) = LOWORD(v11[0]);
        }
        *((unsigned char *)a2 + v9++) = v10;
      }
      while (v9 < v6);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100003364(unsigned int a1, _WORD *a2)
{
  uint64_t v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = (unsigned __int16 *)&unk_10003BBB4;
  size_t v4 = (unsigned __int16 *)&unk_10003CAD8;
  while (1)
  {
    uint64_t v5 = ((char *)v4 - (char *)v3) >> 3;
    uint64_t v6 = &v3[2 * v5];
    unsigned int v7 = *v6;
    if (v7 <= a1) {
      break;
    }
    size_t v4 = v6 - 2;
LABEL_7:
    if (v3 > v4) {
      goto LABEL_8;
    }
  }
  if (v7 < a1)
  {
    unint64_t v3 = v6 + 2;
    goto LABEL_7;
  }
  unsigned int v8 = v3[2 * v5 + 1];
LABEL_9:
  int v9 = (v8 >> 12) & 7;
  __int16 v15 = v8 & 0xFFF;
  unsigned int v10 = (char *)&unk_10003CADC + 2 * (v8 & 0xFFF);
  int v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    int v11 = (unsigned __int16 *)((char *)&unk_10003CADC + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = sub_100003364(*v11, a2);
  if (result)
  {
    --v9;
    __int16 v13 = &v15;
    if (v9) {
      __int16 v13 = (__int16 *)v10;
    }
    int v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (uint64_t result = (result + v9); v9; --v9)
    {
      __int16 v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

uint64_t resetDosDirSection(uint64_t a1, uint64_t a2)
{
  int v4 = 32 * *(_DWORD *)(a1 + 16);
  int v5 = *(_DWORD *)a1 * *(_DWORD *)(a1 + 4);
  if (v4 <= v5) {
    int v4 = *(_DWORD *)a1 * *(_DWORD *)(a1 + 4);
  }
  qword_1000564C8 = (uint64_t)malloc_type_malloc(v4, 0xEA9A0C45uLL);
  if (!qword_1000564C8) {
    goto LABEL_18;
  }
  qword_1000564D0 = (uint64_t)malloc_type_malloc(v5, 0x69CD2348uLL);
  if (!qword_1000564D0) {
    goto LABEL_18;
  }
  int v11 = (_OWORD *)qword_1000564D8;
  if (qword_1000564D8)
  {
    qword_1000564D8 = *(void *)(qword_1000564D8 + 8);
    goto LABEL_8;
  }
  int v11 = malloc_type_malloc(0x148uLL, 0x1020040DB0A7303uLL);
  if (!v11)
  {
    rootDir = 0;
LABEL_18:
    unsigned int v21 = __error();
    strerror(*v21);
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    fsck_print((uint64_t)&v32, 2, (uint64_t)"%s (%s)\n", v22, v23, v24, v25, v26, (uint64_t)"No space for directory");
    return 16;
  }
LABEL_8:
  rootDir = (uint64_t)v11;
  *int v11 = 0u;
  v11[1] = 0u;
  v11[2] = 0u;
  v11[3] = 0u;
  v11[4] = 0u;
  v11[5] = 0u;
  v11[6] = 0u;
  v11[7] = 0u;
  v11[8] = 0u;
  v11[9] = 0u;
  v11[10] = 0u;
  v11[11] = 0u;
  v11[12] = 0u;
  v11[13] = 0u;
  v11[14] = 0u;
  v11[15] = 0u;
  v11[16] = 0u;
  v11[17] = 0u;
  v11[18] = 0u;
  v11[19] = 0u;
  *((void *)v11 + 40) = 0;
  if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
    return 0;
  }
  uint64_t v13 = *(unsigned int *)(a1 + 56);
  if (v13 < 2 || v13 >= *(_DWORD *)(a1 + 80))
  {
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    fsck_print((uint64_t)&v32, 2, (uint64_t)"Root directory starts with cluster out of range(%u)\n", v6, v7, v8, v9, v10, v13);
    return 16;
  }
  unsigned int v14 = fat_get(v13, a2);
  int v20 = 0;
  if ((v14 & 0x80000000) != 0)
  {
    if (v14 + 10 >= 2)
    {
      if (v14 != -286331154) {
        goto LABEL_31;
      }
      return 16;
    }
    goto LABEL_23;
  }
  if (v14 == 1)
  {
LABEL_23:
    if (v14 < 0xFFFFFFF6) {
      goto LABEL_26;
    }
    uint64_t v28 = rsrvdcltype(v14);
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    uint64_t v31 = (uint64_t)v28;
    __int16 v27 = "Warning: Root directory starts with cluster marked %s\n";
LABEL_25:
    fsck_print((uint64_t)&v32, 6, (uint64_t)v27, v15, v16, v17, v18, v19, v31);
LABEL_26:
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    if (fsck_ask((uint64_t)&v32, 1, (uint64_t)"Fix", v15, v16, v17, v18, v19, v31))
    {
      int v29 = fat_set(*(unsigned int *)(a1 + 56), 0xFFFFFFFFLL, a2);
      if (v29) {
        int v20 = v29;
      }
      else {
        int v20 = 4;
      }
      markFree(*(_DWORD *)(a1 + 56));
      goto LABEL_31;
    }
    return 16;
  }
  if (!v14)
  {
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    __int16 v27 = "Warning: Root directory starts with free cluster\n";
    goto LABEL_25;
  }
LABEL_31:
  uint64_t v30 = rootDir;
  *(_DWORD *)(rootDir + 300) = *(_DWORD *)(a1 + 56);
  return sub_100003710(a1, v30, a2) | v20;
}

uint64_t sub_100003710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(unsigned int *)(a2 + 300);
  if (v6 < 2)
  {
    uint64_t v8 = 0;
    unsigned int v7 = 0;
LABEL_12:
    if (v6 != 0 && v6 < 0xFFFFFFF6)
    {
      if (v6 < 2 || v6 >= *(_DWORD *)(a1 + 80))
      {
        uint64_t v28 = sub_1000051C0((uint64_t *)a2);
        long long v36 = fsck_ctx;
        uint64_t v37 = qword_100056470;
        fsck_print((uint64_t)&v36, 6, (uint64_t)"Warning: %s: Cluster chain starting at %u continues with cluster out of range (%u)\n", v29, v30, v31, v32, v33, (uint64_t)v28);
      }
      else
      {
        uint64_t v22 = sub_1000051C0((uint64_t *)a2);
        long long v36 = fsck_ctx;
        uint64_t v37 = qword_100056470;
        fsck_print((uint64_t)&v36, 6, (uint64_t)"Warning: %s: Cluster chain starting at %u is cross-linked at cluster %u\n", v23, v24, v25, v26, v27, (uint64_t)v22);
      }
    }
    else
    {
      int v11 = sub_1000051C0((uint64_t *)a2);
      rsrvdcltype(v6);
      long long v36 = fsck_ctx;
      uint64_t v37 = qword_100056470;
      fsck_print((uint64_t)&v36, 6, (uint64_t)"Warning: %s: Cluster chain starting at %u ends with cluster marked %s\n", v12, v13, v14, v15, v16, (uint64_t)v11);
    }
    long long v36 = fsck_ctx;
    uint64_t v37 = qword_100056470;
    LODWORD(result) = fsck_ask((uint64_t)&v36, 1, (uint64_t)"Truncate", v17, v18, v19, v20, v21, v35);
    if (result)
    {
      LODWORD(result) = fat_set(v8, 0xFFFFFFFFLL, a3);
      if (result) {
        LODWORD(v9) = -286331154;
      }
      else {
        LODWORD(v9) = -1;
      }
    }
    else
    {
      LODWORD(v9) = v6;
    }
  }
  else
  {
    unsigned int v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = v6;
      if (v6 >= *(_DWORD *)(a1 + 80) || isUsed(v6)) {
        break;
      }
      int v10 = fat_get(v6, a3);
      if ((v10 & 0xFFFFFFFE) == 0xFFFFFFF6)
      {
        LODWORD(v6) = v10;
        goto LABEL_12;
      }
      markUsed(v6);
      ++v7;
      uint64_t v6 = fat_get(v6, a3);
      uint64_t v8 = v9;
      if (v6 <= 1) {
        goto LABEL_12;
      }
    }
    if (v6 <= 0xFFFFFFF7) {
      goto LABEL_12;
    }
    LODWORD(result) = 0;
  }
  *(_DWORD *)(a2 + 304) = v9;
  *(void *)(a2 + 312) = *(unsigned int *)(a1 + 100) * (unint64_t)v7;
  if (v9 == -286331154) {
    return 16;
  }
  else {
    return result;
  }
}

void finishDosDirSection()
{
  uint64_t v0 = pendingDirectories;
  if (pendingDirectories)
  {
    uint64_t v1 = qword_1000568E8;
    do
    {
      uint64_t v2 = v1;
      uint64_t v1 = v0;
      uint64_t v0 = *(void *)(v0 + 8);
      *(void *)(v1 + 8) = v2;
    }
    while (v0);
    qword_1000568E8 = v1;
  }
  pendingDirectories = 0;
  unint64_t v3 = (void *)rootDir;
  if (rootDir)
  {
    uint64_t v4 = qword_1000564D8;
    do
    {
      int v5 = (void *)v3[2];
      if (v5)
      {
        v3[2] = 0;
      }
      else
      {
        int v5 = (void *)v3[1];
        if (!v5) {
          int v5 = (void *)*v3;
        }
        v3[1] = v4;
        qword_1000564D8 = (uint64_t)v3;
        uint64_t v4 = (uint64_t)v3;
      }
      unint64_t v3 = v5;
    }
    while (v5);
  }
  rootDir = 0;
  free((void *)qword_1000564C8);
  free((void *)qword_1000564D0);
  qword_1000564C8 = 0;
  qword_1000564D0 = 0;
}

uint64_t handleDirTree(uint64_t a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = sub_100003A98(a2, rootDir, a3, a4, a5, a6, a7, a8);
  if ((v11 & 0x10) != 0) {
    return 16;
  }
  uint64_t v16 = v11;
  while (1)
  {
    uint64_t v17 = pendingDirectories;
    if (!pendingDirectories) {
      break;
    }
    uint64_t v18 = *(void *)pendingDirectories;
    uint64_t v19 = *(void *)(pendingDirectories + 8);
    *(void *)(pendingDirectories + 8) = qword_1000568E8;
    qword_1000568E8 = v17;
    pendingDirectories = v19;
    uint64_t v16 = sub_100003A98(a2, v18, a3, a4, v12, v13, v14, v15) | v16;
    if ((v16 & 0x10) != 0) {
      return 16;
    }
  }
  return v16;
}

uint64_t sub_100003A98(unsigned int *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(__src, 0, 328);
  unsigned int v10 = *(_DWORD *)(a2 + 300);
  if (*(void *)a2 && (v10 < 2 || v10 >= a1[20]))
  {
    long long v280 = fsck_ctx;
    uint64_t v281 = qword_100056470;
    fsck_print((uint64_t)&v280, 3, (uint64_t)"%s: Start cluster (%u) out of range; ignoring\n",
      a4,
      a5,
      a6,
      a7,
      a8,
      (uint64_t)"readDosDirSection");
    return 0;
  }
  unint64_t v278 = 0;
  unint64_t v275 = 0;
  uint64_t v11 = 0;
  int v267 = 0;
  int v12 = 0;
  unsigned int v271 = -1;
  uint64_t v13 = 0xFFFFFFFFLL;
  uint64_t v14 = 0xFFFFFFFFLL;
  int v269 = -1;
  v273 = a1;
  while (1)
  {
    uint64_t v15 = v14;
    v274 = v11;
    unsigned int v16 = v10;
    if ((a1[17] & 1) != 0 || *(void *)a2)
    {
      unsigned int v17 = *a1;
      unsigned int v18 = a1[1];
      int v19 = *a1 * v18;
      unsigned int v20 = a1[24] + v18 * (v10 - 2);
    }
    else
    {
      int v19 = 32 * a1[4];
      unsigned int v20 = a1[2] + a1[22] * a1[3];
      unsigned int v17 = *a1;
    }
    unint64_t v268 = v17 * (unint64_t)v20;
    if ((*(uint64_t (**)(void, uint64_t, void))(a4 + 32))(*(void *)(a4 + 24), qword_1000564C8, v19) != v19)
    {
      v240 = __error();
      strerror(*v240);
      long long v280 = fsck_ctx;
      uint64_t v281 = qword_100056470;
      v246 = "Unable to read directory";
      goto LABEL_304;
    }
    unsigned int v277 = v16;
    int v270 = v19 / 32;
    uint64_t v26 = (unsigned __int8 *)qword_1000564C8;
    if (v19 >= 32)
    {
      int v27 = 0;
      uint64_t v14 = v15;
      int v28 = v270;
      while (1)
      {
        int v29 = *(_DWORD *)(a2 + 320);
        if ((v29 & 2) != 0)
        {
LABEL_80:
          *uint64_t v26 = 0;
          v12 |= 0x8002u;
          goto LABEL_81;
        }
        if (*v26 != 229) {
          break;
        }
LABEL_81:
        ++v27;
        v26 += 32;
        if (v27 == v28) {
          goto LABEL_277;
        }
      }
      if (!*v26)
      {
        *(_DWORD *)(a2 + 320) = v29 | 1;
        v274 = v26;
        uint64_t v14 = v277;
        goto LABEL_81;
      }
      if ((v29 & 1) == 0)
      {
LABEL_20:
        if (v26[11] == 15)
        {
          unsigned __int8 v42 = *v26;
          if ((*v26 & 0x40) != 0)
          {
            unint64_t v72 = v275;
            BOOL v73 = v269 != -1 && v275 == 0;
            if (v73) {
              unint64_t v72 = v278;
            }
            unint64_t v275 = v72;
            xmmword_1000569D0 = 0u;
            unk_1000569E0 = 0u;
            if (v73) {
              uint64_t v13 = v271;
            }
            else {
              uint64_t v13 = v13;
            }
            xmmword_1000569B0 = 0uLL;
            unk_1000569C0 = 0uLL;
            xmmword_100056990 = 0uLL;
            unk_1000569A0 = 0uLL;
            xmmword_100056970 = 0uLL;
            unk_100056980 = 0uLL;
            xmmword_100056950 = 0uLL;
            unk_100056960 = 0uLL;
            xmmword_100056930 = 0uLL;
            unk_100056940 = 0uLL;
            xmmword_100056910 = 0uLL;
            unk_100056920 = 0uLL;
            xmmword_1000568F0 = 0uLL;
            unk_100056900 = 0uLL;
            int v269 = v26[13];
            unint64_t v278 = (unint64_t)v26;
            unsigned int v271 = v277;
            unsigned __int8 v42 = *v26;
          }
          else if (v269 != v26[13] || v267 != (v42 & 0x1F))
          {
            signed int v43 = (unsigned __int8 *)v275;
            if (!v275) {
              signed int v43 = (unsigned __int8 *)v278;
            }
            unsigned int v44 = v271;
            if (v275) {
              unsigned int v44 = v13;
            }
            BOOL v45 = v43 == 0;
            if (!v43) {
              signed int v43 = v26;
            }
            unint64_t v275 = (unint64_t)v43;
            if (v45) {
              uint64_t v13 = v277;
            }
            else {
              uint64_t v13 = v44;
            }
            unint64_t v278 = 0;
          }
          int v74 = v42 & 0x1F;
          if (v74)
          {
            int v267 = v74 - 1;
            uint64_t v75 = (char *)&xmmword_1000568F0 + (13 * (v74 - 1));
            if (v75 < (char *)&qword_1000569F0)
            {
              unint64_t v76 = 1;
              while (1)
              {
                char v77 = v26[v76];
                if (!v77 && !v26[v76 + 1]) {
                  break;
                }
                *uint64_t v75 = v77;
                if (v26[v76 + 1]) {
                  char v77 = 63;
                }
                *v75++ = v77;
                unsigned int v78 = v76 + 2;
                if (v76 <= 8)
                {
                  v76 += 2;
                  if (v75 < (char *)&qword_1000569F0) {
                    continue;
                  }
                }
                if (v78 >= 0xB && v75 < (char *)&qword_1000569F0)
                {
                  unint64_t v79 = 14;
                  while (1)
                  {
                    char v80 = v26[v79];
                    if (!v80 && !v26[v79 + 1]) {
                      break;
                    }
                    *uint64_t v75 = v80;
                    if (v26[v79 + 1]) {
                      char v80 = 63;
                    }
                    *v75++ = v80;
                    unsigned int v81 = v79 + 2;
                    if (v79 <= 0x17)
                    {
                      v79 += 2;
                      if (v75 < (char *)&qword_1000569F0) {
                        continue;
                      }
                    }
                    if (v81 >= 0x1A && v75 < (char *)&qword_1000569F0)
                    {
                      uint64_t v82 = 0;
                      do
                      {
                        uint64_t v83 = &v26[v82];
                        char v84 = v26[v82 + 28];
                        if (!v84 && !v83[29]) {
                          break;
                        }
                        *uint64_t v75 = v84;
                        if (v83[29]) {
                          char v84 = 63;
                        }
                        *v75++ = v84;
                        if ((unint64_t)(v82 + 28) > 0x1D) {
                          break;
                        }
                        v82 += 2;
                      }
                      while (v75 < (char *)&qword_1000569F0);
                    }
                    goto LABEL_120;
                  }
                }
                break;
              }
            }
LABEL_120:
            if (v75 >= (char *)&qword_1000569F0)
            {
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: long filename too long\n", v21, v22, v23, v24, v25, v256);
              unint64_t v85 = v275;
              BOOL v86 = v275 == 0;
              if (!v275) {
                unint64_t v85 = v278;
              }
              unint64_t v275 = v85;
              if (v86) {
                uint64_t v13 = v271;
              }
              else {
                uint64_t v13 = v13;
              }
              unint64_t v278 = 0;
            }
            if (*((_WORD *)v26 + 13))
            {
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: long filename record cluster start != 0\n", v21, v22, v23, v24, v25, v256);
              unint64_t v87 = v275;
              BOOL v88 = v275 == 0;
              if (!v275) {
                unint64_t v87 = v278;
              }
              unint64_t v275 = v87;
              if (v88) {
                uint64_t v13 = v277;
              }
              else {
                uint64_t v13 = v13;
              }
              unint64_t v278 = 0;
            }
          }
          else
          {
            long long v280 = fsck_ctx;
            uint64_t v281 = qword_100056470;
            fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: long file name is not available\n", v21, v22, v23, v24, v25, v256);
            int v267 = 0;
            unint64_t v92 = v275;
            BOOL v93 = v275 == 0;
            if (!v275) {
              unint64_t v92 = v278;
            }
            unint64_t v275 = v92;
            if (v93) {
              uint64_t v13 = v271;
            }
            else {
              uint64_t v13 = v13;
            }
            unint64_t v278 = 0;
          }
          goto LABEL_81;
        }
        uint64_t v46 = 0;
        memset(__src, 0, 328);
        DWORD2(__src[18]) = v26[11];
        do
        {
          *((unsigned char *)&__src[1] + v46 + 8) = v26[v46];
          ++v46;
        }
        while (v46 != 8);
        LOBYTE(__src[2]) = 0;
        uint64_t v47 = 31;
        while (*((unsigned char *)__src + v47) == 32)
        {
          *((unsigned char *)__src + v47) = 0;
          unint64_t v48 = v47 - 23;
          --v47;
          if (v48 <= 1)
          {
            unsigned int v49 = 0;
            goto LABEL_41;
          }
        }
        unsigned int v49 = v47 - 23;
LABEL_41:
        if (BYTE8(__src[1]) == 5) {
          BYTE8(__src[1]) = -27;
        }
        if ((BYTE8(__src[18]) & 8) != 0)
        {
          if (v278 | v275)
          {
            if (v275) {
              uint64_t v89 = (unsigned char *)v275;
            }
            else {
              uint64_t v89 = (unsigned char *)v278;
            }
            if (v275) {
              uint64_t v90 = v13;
            }
            else {
              uint64_t v90 = v271;
            }
            uint64_t v91 = sub_1000051C0((uint64_t *)a2);
            unint64_t v278 = 0;
            unint64_t v275 = 0;
            v12 |= sub_100005448(v273, v89, (unint64_t)v26, v90, v277, v277, (uint64_t)v91, 2, 0, a4);
            goto LABEL_81;
          }
LABEL_263:
          unint64_t v278 = 0;
          unint64_t v275 = 0;
          goto LABEL_81;
        }
        if (v26[8] != 32)
        {
          uint64_t v50 = (char *)__src + (int)v49++;
          v50[24] = 46;
        }
        uint64_t v51 = (uint64_t)v273;
        int v52 = (unsigned char *)v275;
        uint64_t v53 = v49;
        unsigned int v54 = v49 + 1;
        uint64_t v55 = 24;
        uint64_t v56 = (char *)__src + v49;
        do
        {
          LODWORD(v57) = v54;
          v56[v55] = v26[v55 - 16];
          ++v55;
          ++v54;
        }
        while (v55 != 27);
        *((unsigned char *)&__src[1] + v53 + 11) = 0;
        if ((int)v53 + 2 >= 0)
        {
          do
          {
            uint64_t v57 = (v57 - 1);
            if (*((unsigned char *)&__src[1] + v57 + 8) != 32) {
              break;
            }
            *((unsigned char *)&__src[1] + v57 + 8) = 0;
          }
          while ((int)v57 > 0);
        }
        if (v278)
        {
          uint64_t v58 = 0;
          unsigned __int8 v59 = 0;
          do
            unsigned __int8 v59 = v26[v58++] + ((v59 >> 1) | (v59 << 7));
          while (v58 != 11);
          if (v269 == v59) {
            goto LABEL_59;
          }
          if (v275)
          {
            uint64_t v13 = v13;
          }
          else
          {
            int v52 = (unsigned char *)v278;
            uint64_t v13 = v271;
          }
        }
        unint64_t v278 = 0;
LABEL_59:
        int v60 = *((unsigned __int16 *)v26 + 13);
        HIDWORD(__src[18]) = v60;
        if (v273[19] == 0xFFFFFFF) {
          HIDWORD(__src[18]) = (v26[21] << 24) | (v26[20] << 16) | v60;
        }
        DWORD1(__src[19]) = *((_DWORD *)v26 + 7);
        if (v278)
        {
          __strlcpy_chk();
          uint64_t v51 = (uint64_t)v273;
          LOBYTE(xmmword_1000568F0) = 0;
          int v269 = -1;
        }
        uint64_t v61 = *(void *)(a2 + 16);
        *(void *)&__src[0] = a2;
        *((void *)&__src[0] + 1) = v61;
        if (v52)
        {
          uint64_t v62 = v52;
          uint64_t v63 = (unsigned int *)v51;
          if (v278) {
            unint64_t v64 = v278;
          }
          else {
            unint64_t v64 = (unint64_t)v26;
          }
          unsigned int v65 = v271;
          if (!v278) {
            unsigned int v65 = v277;
          }
          unsigned int v276 = v65;
          uint64_t v66 = sub_1000051C0((uint64_t *)__src);
          int v67 = sub_100005448(v63, v62, v64, v13, v276, v277, (uint64_t)v66, 0, 0, a4);
          v12 |= v67;
          if ((v12 & 0x10) != 0) {
            return 16;
          }
          if (!v278)
          {
            BOOL v68 = v26 == (unsigned __int8 *)qword_1000564C8;
            uint64_t v51 = (uint64_t)v273;
            goto LABEL_168;
          }
          uint64_t v51 = (uint64_t)v273;
          if (v271 == v277)
          {
            BOOL v68 = v278 == qword_1000564C8;
LABEL_168:
            uint64_t v14 = v14;
            int v28 = v270;
            if (!v68) {
              v12 |= (v67 << 14) & 0x8000;
            }
          }
          else
          {
LABEL_170:
            uint64_t v14 = v14;
            int v28 = v270;
          }
LABEL_171:
          if (WORD4(__src[1]) == 46 || !(WORD4(__src[1]) ^ 0x2E2E | BYTE10(__src[1]))) {
            goto LABEL_193;
          }
          if (HIDWORD(__src[18]) == 1) {
            goto LABEL_180;
          }
          if (!HIDWORD(__src[18]))
          {
            if (BYTE8(__src[18]) & 0x10 | DWORD1(__src[19]))
            {
              uint64_t v100 = sub_1000051C0((uint64_t *)__src);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s has no clusters\n", v101, v102, v103, v104, v105, (uint64_t)v100);
              goto LABEL_181;
            }
LABEL_190:
            if (HIDWORD(__src[18]) >= 2 && HIDWORD(__src[18]) < *(_DWORD *)(v51 + 80))
            {
              v12 |= sub_100003710(v51, (uint64_t)__src, a4);
              if ((v12 & 0x10) != 0) {
                return 16;
              }
            }
LABEL_193:
            unint64_t v123 = DWORD1(__src[19]);
            if ((BYTE8(__src[18]) & 0x10) == 0) {
              goto LABEL_216;
            }
            if (DWORD1(__src[19]))
            {
              long long v124 = sub_1000051C0((uint64_t *)__src);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: Directory %s has size != 0\n", v125, v126, v127, v128, v129, (uint64_t)v124);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              if (fsck_ask((uint64_t)&v280, 1, (uint64_t)"Correct", v130, v131, v132, v133, v134, v259))
              {
                *((_DWORD *)v26 + 7) = 0;
                DWORD1(__src[19]) = 0;
                v12 |= 0x8002u;
              }
              else
              {
                v12 |= 8u;
              }
            }
LABEL_198:
            if (WORD4(__src[1]) == 46)
            {
              if (HIDWORD(__src[18]) == *(_DWORD *)(a2 + 300)) {
                goto LABEL_263;
              }
              v169 = sub_1000051C0((uint64_t *)a2);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              if (!fsck_ask((uint64_t)&v280, 1, (uint64_t)"Correct", v175, v176, v177, v178, v179, v262)) {
                goto LABEL_264;
              }
              int v180 = *(_DWORD *)(a2 + 300);
              goto LABEL_224;
            }
            if (WORD4(__src[1]) ^ 0x2E2E | BYTE10(__src[1]))
            {
              int v135 = malloc_type_malloc(*v273, 0x9E33BEEDuLL);
              if (!v135)
              {
                v253 = __error();
                strerror(*v253);
                long long v280 = fsck_ctx;
                uint64_t v281 = qword_100056470;
                v246 = "No memory for subdirectory buffer";
                goto LABEL_304;
              }
              v136 = v135;
              if ((*(uint64_t (**)(void, void *, void, uint64_t))(a4 + 32))(*(void *)(a4 + 24), v135, *v273, (v273[24] + (HIDWORD(__src[18]) - 2) * v273[1]) * *v273) != *v273)
              {
                long long v280 = fsck_ctx;
                uint64_t v281 = qword_100056470;
                fsck_print((uint64_t)&v280, 2, (uint64_t)"Unable to read cluster %u", v137, v138, v139, v140, v141, HIDWORD(__src[18]));
                free(v136);
                return 16;
              }
              BOOL v142 = *v136 == 0x202020202020202ELL && *(void *)((char *)v136 + 3) == 0x2020202020202020;
              if (v142
                && (v136[4] == 0x2020202020202E2ELL
                  ? (BOOL v143 = *(void *)((char *)v136 + 35) == 0x2020202020202020)
                  : (BOOL v143 = 0),
                    v143 && (*((unsigned char *)v136 + 11) & 0x10) != 0 && (*((unsigned char *)v136 + 43) & 0x10) != 0))
              {
                free(v136);
              }
              else
              {
                free(v136);
                v144 = sub_1000051C0((uint64_t *)__src);
                long long v280 = fsck_ctx;
                uint64_t v281 = qword_100056470;
                fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: Item %s does not appear to be a subdirectory\n", v145, v146, v147, v148, v149, (uint64_t)v144);
                long long v280 = fsck_ctx;
                uint64_t v281 = qword_100056470;
                if (fsck_ask((uint64_t)&v280, 0, (uint64_t)"Correct", v150, v151, v152, v153, v154, v260))
                {
                  v26[11] &= ~0x10u;
                  DWORD2(__src[18]) &= ~0x10u;
                  v12 |= 0x8002u;
                  unint64_t v123 = DWORD1(__src[19]);
LABEL_216:
                  BOOL v155 = *((void *)&__src[19] + 1) >= v123;
                  unint64_t v156 = *((void *)&__src[19] + 1) - v123;
                  if (!v155)
                  {
                    v157 = sub_1000051C0((uint64_t *)__src);
                    long long v280 = fsck_ctx;
                    uint64_t v281 = qword_100056470;
                    fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: size of %s is %u, should at most be %llu\n", v158, v159, v160, v161, v162, (uint64_t)v157);
                    long long v280 = fsck_ctx;
                    uint64_t v281 = qword_100056470;
                    if (fsck_ask((uint64_t)&v280, 1, (uint64_t)"Truncate", v163, v164, v165, v166, v167, v261))
                    {
                      DWORD1(__src[19]) = DWORD2(__src[19]);
                      *((_DWORD *)v26 + 7) = DWORD2(__src[19]);
                      int v168 = 2;
                      goto LABEL_235;
                    }
LABEL_234:
                    int v168 = 8;
LABEL_235:
                    v12 |= v168 | (v168 << 14) & 0x8000;
LABEL_236:
                    unint64_t v278 = 0;
                    unint64_t v275 = 0;
                    ++v273[26];
                    goto LABEL_81;
                  }
                  if (v156 < v273[25])
                  {
                    int v168 = 0;
                    goto LABEL_235;
                  }
                  v181 = sub_1000051C0((uint64_t *)__src);
                  long long v280 = fsck_ctx;
                  uint64_t v281 = qword_100056470;
                  fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s has too many clusters allocated (logical=%u, physical=%llu)\n", v182, v183, v184, v185, v186, (uint64_t)v181);
                  long long v280 = fsck_ctx;
                  uint64_t v281 = qword_100056470;
                  if (!fsck_ask((uint64_t)&v280, 1, (uint64_t)"Drop superfluous clusters", v187, v188, v189, v190, v191, v263))goto LABEL_234; {
                  if (DWORD1(__src[19]))
                  }
                  {
                    unint64_t v192 = 0;
                    uint64_t v193 = HIDWORD(__src[18]);
                    v194 = v273;
                    while (1)
                    {
                      v192 += v194[25];
                      unint64_t v195 = DWORD1(__src[19]);
                      uint64_t v196 = fat_get(v193, a4);
                      uint64_t v197 = v196;
                      if (v192 >= v195) {
                        break;
                      }
                      uint64_t v193 = v196;
                      v194 = v273;
                      if (v196 == -286331154) {
                        goto LABEL_254;
                      }
                    }
                    if (v196 == -286331154 || fat_set(v193, 0xFFFFFFFFLL, a4)) {
                      goto LABEL_254;
                    }
                    int v168 = 4;
                    int v28 = v270;
                  }
                  else
                  {
                    unint64_t v192 = 0;
                    *((_WORD *)v26 + 13) = 0;
                    *((_WORD *)v26 + 10) = 0;
                    int v168 = 6;
                    uint64_t v197 = HIDWORD(__src[18]);
                  }
                  if (v192 >= *((void *)&__src[19] + 1)) {
                    goto LABEL_235;
                  }
                  int v279 = v168;
                  while (1)
                  {
                    uint64_t v211 = fat_get(v197, a4);
                    if (v211 == -286331154) {
                      break;
                    }
                    uint64_t v212 = v211;
                    if (fat_set(v197, 0, a4)) {
                      break;
                    }
                    v192 += v273[25];
                    uint64_t v197 = v212;
                    if (v192 >= *((void *)&__src[19] + 1))
                    {
                      int v28 = v270;
                      int v168 = v279;
                      goto LABEL_235;
                    }
                  }
LABEL_254:
                  int v168 = 16;
                  int v28 = v270;
                  goto LABEL_235;
                }
                v12 |= 8u;
              }
              v210 = (void *)qword_1000564D8;
              if (qword_1000564D8)
              {
                qword_1000564D8 = *(void *)(qword_1000564D8 + 8);
              }
              else
              {
                v210 = malloc_type_malloc(0x148uLL, 0x1020040DB0A7303uLL);
                if (!v210)
                {
                  v254 = __error();
                  strerror(*v254);
                  long long v280 = fsck_ctx;
                  uint64_t v281 = qword_100056470;
                  v246 = "No space for directory";
                  goto LABEL_304;
                }
              }
              memcpy(v210, __src, 0x148uLL);
              *(void *)(a2 + 16) = v210;
              v232 = (void *)qword_1000568E8;
              if (qword_1000568E8)
              {
                qword_1000568E8 = *(void *)(qword_1000568E8 + 8);
              }
              else
              {
                v232 = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
                if (!v232)
                {
                  v255 = __error();
                  strerror(*v255);
                  long long v280 = fsck_ctx;
                  uint64_t v281 = qword_100056470;
                  v246 = "No space for todo list";
                  goto LABEL_304;
                }
              }
              uint64_t v233 = pendingDirectories;
              void *v232 = v210;
              v232[1] = v233;
              pendingDirectories = (uint64_t)v232;
              goto LABEL_236;
            }
            uint64_t v198 = *(void *)a2;
            if (!*(void *)a2) {
              goto LABEL_263;
            }
            if (*(void *)v198)
            {
              if (HIDWORD(__src[18]) == *(_DWORD *)(v198 + 300)) {
                goto LABEL_263;
              }
              v199 = sub_1000051C0((uint64_t *)a2);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              if (!fsck_ask((uint64_t)&v280, 1, (uint64_t)"Correct", v205, v206, v207, v208, v209, v264)) {
                goto LABEL_264;
              }
              int v180 = *(_DWORD *)(*(void *)a2 + 300);
LABEL_224:
              HIDWORD(__src[18]) = v180;
              v26[26] = v180;
              v26[27] = BYTE13(__src[18]);
              if (v273[19] == 0xFFFFFFF) {
                *((_WORD *)v26 + 10) = HIWORD(__src[18]);
              }
            }
            else
            {
              if (!HIDWORD(__src[18])) {
                goto LABEL_263;
              }
              v221 = sub_1000051C0((uint64_t *)a2);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              if (!fsck_ask((uint64_t)&v280, 1, (uint64_t)"Correct", v227, v228, v229, v230, v231, v265))
              {
LABEL_264:
                unint64_t v278 = 0;
                unint64_t v275 = 0;
                v12 |= 8u;
                goto LABEL_81;
              }
              HIDWORD(__src[18]) = 0;
              *((_WORD *)v26 + 13) = 0;
              if (v273[19] == 0xFFFFFFF) {
                *((_WORD *)v26 + 10) = 0;
              }
            }
            unint64_t v278 = 0;
            unint64_t v275 = 0;
LABEL_227:
            v12 |= 0x8002u;
            goto LABEL_81;
          }
          if (HIDWORD(__src[18]) >= *(_DWORD *)(v51 + 80))
          {
LABEL_180:
            long long v117 = sub_1000051C0((uint64_t *)__src);
            long long v280 = fsck_ctx;
            uint64_t v281 = qword_100056470;
            fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s starts with cluster out of range (%u)\n", v118, v119, v120, v121, v122, (uint64_t)v117);
          }
          else if (isUsed(HIDWORD(__src[18])))
          {
            uint64_t v111 = sub_1000051C0((uint64_t *)__src);
            long long v280 = fsck_ctx;
            uint64_t v281 = qword_100056470;
            fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s starts with cross-linked cluster (%u)\n", v112, v113, v114, v115, v116, (uint64_t)v111);
          }
          else
          {
            unsigned int v213 = fat_get(HIDWORD(__src[18]), a4);
            if (v213)
            {
              unsigned int v214 = v213;
              if (v213 == -286331154) {
                return 16;
              }
              if ((v213 & 0xFFFFFFFE) != 0xFFFFFFF6)
              {
                uint64_t v51 = (uint64_t)v273;
                goto LABEL_190;
              }
              v215 = sub_1000051C0((uint64_t *)__src);
              rsrvdcltype(v214);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s starts with cluster marked %s\n", v216, v217, v218, v219, v220, (uint64_t)v215);
            }
            else
            {
              v234 = sub_1000051C0((uint64_t *)__src);
              long long v280 = fsck_ctx;
              uint64_t v281 = qword_100056470;
              fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s starts with free cluster\n", v235, v236, v237, v238, v239, (uint64_t)v234);
            }
          }
LABEL_181:
          if ((BYTE8(__src[18]) & 0x10) == 0)
          {
            long long v280 = fsck_ctx;
            uint64_t v281 = qword_100056470;
            if (!fsck_ask((uint64_t)&v280, 1, (uint64_t)"Truncate", v106, v107, v108, v109, v110, v258))
            {
              v12 |= 8u;
              uint64_t v51 = (uint64_t)v273;
              goto LABEL_190;
            }
            *((_WORD *)v26 + 15) = 0;
            *(_DWORD *)(v26 + 26) = 0;
            if (v273[19] == 0xFFFFFFF) {
              *((_WORD *)v26 + 10) = 0;
            }
            HIDWORD(__src[18]) = 0;
            DWORD1(__src[19]) = 0;
            v12 |= 0x8002u;
            if ((BYTE8(__src[18]) & 0x10) == 0)
            {
              unint64_t v123 = 0;
              goto LABEL_216;
            }
            goto LABEL_198;
          }
          long long v280 = fsck_ctx;
          uint64_t v281 = qword_100056470;
          if (!fsck_ask((uint64_t)&v280, 0, (uint64_t)"Remove", v106, v107, v108, v109, v110, v258)) {
            goto LABEL_264;
          }
          unint64_t v278 = 0;
          unint64_t v275 = 0;
          *uint64_t v26 = -27;
          goto LABEL_227;
        }
        if (a3) {
          goto LABEL_170;
        }
        uint64_t v14 = v14;
        int v28 = v270;
        if (!v278) {
          goto LABEL_171;
        }
        BOOL v94 = *(void *)((char *)&__src[2] + 5) == 0x3030322E73666E2ELL
           && *(unsigned __int16 *)((char *)&__src[2] + 13) == 12597;
        if (!v94 || (BYTE8(__src[18]) & 0x10) != 0) {
          goto LABEL_171;
        }
        uint64_t v95 = (unsigned int *)v51;
        uint64_t v96 = sub_1000051C0((uint64_t *)__src);
        int v97 = sub_100005448(v95, (unsigned char *)v278, (unint64_t)(v26 + 32), v271, v277, v277, (uint64_t)v96, 3, 1, a4);
        if (((v97 | v12) & 0x10) != 0) {
          return 16;
        }
        unint64_t v275 = 0;
        if (v278 == qword_1000564C8 || v271 != v277 || (v97 & 2) == 0) {
          v12 |= v97;
        }
        else {
          v12 |= v97 | 0x8000;
        }
        unint64_t v278 = 0;
        goto LABEL_81;
      }
      uint64_t v30 = sub_1000051C0((uint64_t *)a2);
      long long v280 = fsck_ctx;
      uint64_t v281 = qword_100056470;
      fsck_print((uint64_t)&v280, 6, (uint64_t)"Warning: %s has entries after end of directory\n", v31, v32, v33, v34, v35, (uint64_t)v30);
      long long v280 = fsck_ctx;
      uint64_t v281 = qword_100056470;
      if (fsck_ask((uint64_t)&v280, 1, (uint64_t)"Truncate", v36, v37, v38, v39, v40, v257))
      {
        int v41 = *(_DWORD *)(a2 + 320) | 2;
        *(_DWORD *)(a2 + 320) = v41;
      }
      else
      {
        long long v280 = fsck_ctx;
        uint64_t v281 = qword_100056470;
        int v69 = fsck_ask((uint64_t)&v280, 0, (uint64_t)"Extend", v21, v22, v23, v24, v25, v256);
        int v41 = *(_DWORD *)(a2 + 320);
        if (v69)
        {
          *(_DWORD *)(a2 + 320) = v41 & 0xFFFFFFFE;
          uint64_t result = sub_100005284(v273, v14, (uint64_t)&v274[-qword_1000564C8], v277, (uint64_t)&v26[-qword_1000564C8], 1, a4);
          if (result == 16) {
            return result;
          }
          uint64_t v71 = (unsigned __int8 *)qword_1000564C8;
          if (v14 == v277) {
            uint64_t v71 = v274;
          }
          for (; v71 < v26; v71 += 32)
            *uint64_t v71 = -27;
          v12 |= 0x8002u;
          int v41 = *(_DWORD *)(a2 + 320);
          int v28 = v270;
          uint64_t v13 = v13;
          if ((v41 & 2) != 0) {
            goto LABEL_80;
          }
          goto LABEL_19;
        }
      }
      if ((v41 & 2) != 0) {
        goto LABEL_80;
      }
LABEL_19:
      v274 = 0;
      v12 |= 8 * (v41 & 1);
      goto LABEL_20;
    }
    uint64_t v14 = v15;
    int v28 = v19 / 32;
LABEL_277:
    if ((v12 & 0x8000) != 0)
    {
      if ((*(uint64_t (**)(void, uint64_t, void, unint64_t))(a4 + 40))(*(void *)(a4 + 24), qword_1000564C8, 32 * v28, v268) != 32 * v28)goto LABEL_303; {
      v12 &= ~0x8000u;
      }
    }
    a1 = v273;
    uint64_t v11 = v274;
    if ((v273[17] & 1) == 0 && !*(void *)a2) {
      break;
    }
    unsigned int v10 = fat_get(v277, a4);
    if (v10 < 2)
    {
      a1 = v273;
      goto LABEL_291;
    }
    a1 = v273;
    if (v10 >= v273[20] || v10 == *(_DWORD *)(a2 + 304)) {
      goto LABEL_291;
    }
  }
  unsigned int v10 = v277;
LABEL_291:
  if (v10 == -286331154) {
    v12 |= 0x10u;
  }
  if (!(v275 | v278)) {
    return v12 & 0xFFFF7FFF;
  }
  v247 = a1;
  if (v275) {
    v248 = (unsigned char *)v275;
  }
  else {
    v248 = (unsigned char *)v278;
  }
  if (v275) {
    uint64_t v249 = v13;
  }
  else {
    uint64_t v249 = v271;
  }
  v250 = sub_1000051C0((uint64_t *)a2);
  int v251 = sub_100005448(v247, v248, (unint64_t)v26, v249, v277, v277, (uint64_t)v250, 1, 0, a4);
  if ((*(uint64_t (**)(void, uint64_t, void, unint64_t))(a4 + 40))(*(void *)(a4 + 24), qword_1000564C8, 32 * v28, v268) == 32 * v28)
  {
    v12 |= v251;
    return v12 & 0xFFFF7FFF;
  }
LABEL_303:
  v252 = __error();
  strerror(*v252);
  long long v280 = fsck_ctx;
  uint64_t v281 = qword_100056470;
  v246 = "Unable to write directory";
LABEL_304:
  fsck_print((uint64_t)&v280, 2, (uint64_t)"%s (%s)\n", v241, v242, v243, v244, v245, (uint64_t)v246);
  return 16;
}

__int16 *sub_1000051C0(uint64_t *a1)
{
  if ((uint64_t *)rootDir == a1)
  {
    int v5 = &word_1000564E0;
    word_1000564E0 = 47;
  }
  else
  {
    uint64_t v1 = a1;
    uint64_t v2 = &byte_1000568E0;
    byte_1000568E0 = 0;
    while (1)
    {
      unint64_t v3 = *((unsigned char *)v1 + 37) ? (char *)v1 + 37 : (const char *)(v1 + 3);
      size_t v4 = strlen(v3);
      int v5 = (__int16 *)&v2[-v4];
      if (&v2[-v4] <= (char *)&word_1000564E0 + 1) {
        break;
      }
      memcpy(&v2[-v4], v3, v4);
      *((unsigned char *)v5 - 1) = 47;
      uint64_t v2 = (char *)v5 - 1;
      uint64_t v1 = (uint64_t *)*v1;
      if (!v1) {
        return v5;
      }
    }
    *((unsigned char *)v5 - 1) = 63;
    return (__int16 *)((char *)v5 - 1);
  }
  return v5;
}

uint64_t sub_100005284(unsigned int *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7)
{
  if (a2 >= 2)
  {
    uint64_t v9 = a2;
    uint64_t v11 = (int)(*a1 * a1[1]);
    uint64_t v12 = qword_1000564D0;
    unint64_t v13 = qword_1000564D0 + v11;
    uint64_t v14 = (unsigned char *)(qword_1000564D0 + a3);
    while (1)
    {
      if (v9 >= a1[20]) {
        return 0;
      }
      if (v9 == a4)
      {
        if (a6) {
          return 0;
        }
        unint64_t v13 = v12 + a5;
      }
      unint64_t v15 = *a1 * (unint64_t)(a1[24] + a1[1] * (v9 - 2));
      if ((*(uint64_t (**)(void))(a7 + 32))(*(void *)(a7 + 24)) != v11) {
        break;
      }
      while ((unint64_t)v14 < v13)
      {
        unsigned char *v14 = -27;
        v14 += 32;
      }
      if ((*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t))(a7 + 40))(*(void *)(a7 + 24), qword_1000564D0, v11, v15) != v11)
      {
        uint64_t v25 = __error();
        strerror(*v25);
        long long v28 = fsck_ctx;
        uint64_t v29 = qword_100056470;
        uint64_t v24 = "Unable to write directory";
        goto LABEL_17;
      }
      if (v9 == a4) {
        return 0;
      }
      uint64_t v16 = fat_get(v9, a7);
      if (v16 == -286331154) {
        return 16;
      }
      uint64_t v9 = v16;
      uint64_t v12 = qword_1000564D0;
      uint64_t v14 = (unsigned char *)qword_1000564D0;
      if (v16 <= 1) {
        return 0;
      }
    }
    unsigned int v18 = __error();
    strerror(*v18);
    long long v28 = fsck_ctx;
    uint64_t v29 = qword_100056470;
    uint64_t v24 = "Unable to read directory";
LABEL_17:
    fsck_print((uint64_t)&v28, 2, (uint64_t)"%s (%s)\n", v19, v20, v21, v22, v23, (uint64_t)v24);
    return 16;
  }
  return 0;
}

uint64_t sub_100005448(unsigned int *a1, unsigned char *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  int v10 = a6;
  int v11 = a5;
  switch((int)a8)
  {
    case 0:
      long long v19 = fsck_ctx;
      uint64_t v20 = qword_100056470;
      fsck_print((uint64_t)&v19, 6, (uint64_t)"Warning: Invalid long filename entry for %s\n", a4, a5, a6, a7, a8, a7);
      break;
    case 1:
      long long v19 = fsck_ctx;
      uint64_t v20 = qword_100056470;
      fsck_print((uint64_t)&v19, 6, (uint64_t)"Warning: Invalid long filename entry at end of directory %s\n", a4, a5, a6, a7, a8, a7);
      break;
    case 2:
      long long v19 = fsck_ctx;
      uint64_t v20 = qword_100056470;
      uint64_t v16 = "Warning: Invalid long filename entry for volume label\n";
      goto LABEL_6;
    case 3:
      long long v19 = fsck_ctx;
      uint64_t v20 = qword_100056470;
      uint64_t v16 = "Warning: Remove unlinked file entry\n";
LABEL_6:
      fsck_print((uint64_t)&v19, 6, (uint64_t)v16, a4, a5, a6, a7, a8, v18);
      break;
    default:
      break;
  }
  if (!a9)
  {
    long long v19 = fsck_ctx;
    uint64_t v20 = qword_100056470;
    if (!fsck_ask((uint64_t)&v19, 0, (uint64_t)"Remove", a4, a5, a6, a7, a8, v18)) {
      return 8;
    }
  }
  if (a4 != v10)
  {
    uint64_t result = sub_100005284(a1, a4, (uint64_t)&a2[-qword_1000564C8], v11, a3 - qword_1000564C8, v11 == v10, a10);
    if (result == 16) {
      return result;
    }
    a2 = (unsigned char *)qword_1000564C8;
  }
  uint64_t result = 2;
  if (v11 == v10 && (unint64_t)a2 < a3)
  {
    do
    {
      *a2 = -27;
      a2 += 32;
    }
    while ((unint64_t)a2 < a3);
    return 2;
  }
  return result;
}

void sub_100005D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100005D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005D68(uint64_t a1)
{
}

void sub_100005D70(void *a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v8 = v9;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

void sub_100006830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose((const void *)(v39 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006884(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006894(uint64_t a1)
{
}

void sub_10000689C(uint64_t a1, void *a2, const void *a3)
{
  id v6 = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else {
    memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), a3, 0x200uLL);
  }
}

uint64_t sub_100006924(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    if ([v6 code] != (id)2 || (objc_msgSend(*(id *)(a1 + 32), "isIncomplete") & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }

  return _objc_release_x1();
}

uint64_t sub_1000069D4(void *a1, void *a2, int a3, uint64_t a4, unsigned __int16 *a5, void *a6)
{
  id v10 = a2;
  id v11 = a6;
  if (v10)
  {
    uint64_t v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002BECC();
    }
  }
  else if (a3 == 2 && *(unsigned __int16 *)(*(void *)(a1[4] + 8) + 32) == *a5)
  {
    CONV_Unistr255ToLowerCase(a5);
    if (!memcmp(a5 + 1, (const void *)(*(void *)(a1[4] + 8) + 34), 2 * *(unsigned __int16 *)(*(void *)(a1[4] + 8) + 32)))
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a6);
    }
  }

  return 1;
}

BOOL sub_100006ACC(uint64_t a1, void *a2, int a3, uint64_t a4, unsigned __int16 *a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  if (v11)
  {
    unint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002BFD4();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    if (a3 == 2 && *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) == *a5)
    {
      CONV_Unistr255ToLowerCase(a5);
      if (!memcmp(a5 + 1, (const void *)(*(void *)(*(void *)(a1 + 40) + 8) + 34), 2 * *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)))
      {
        BOOL v18 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a6);
        goto LABEL_13;
      }
    }
    if (!*(void *)(a1 + 64))
    {
      BOOL v18 = a3 == 1;
      goto LABEL_13;
    }
    uint64_t v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10002BF40((uint64_t **)(a1 + 64), v14);
    }

    uint64_t v15 = fs_errorForPOSIXError();
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    unsigned int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

void sub_100006D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006D94(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = a2;
  id v13 = a6;
  if (v12)
  {
    uint64_t v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002C0CC();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    if (a3 == 1) {
      goto LABEL_6;
    }
    if (a3 != 2
      || ([*(id *)(a1 + 32) insertDirEntryNamedUtf16:a5 offsetInDir:a4],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8),
          BOOL v18 = *(void **)(v17 + 40),
          *(void *)(v17 + 40) = v16,
          v18,
          !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)))
    {
      a3 = 0;
      goto LABEL_6;
    }
    long long v19 = fskit_std_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002C048(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  a3 = 1;
LABEL_6:

  return a3;
}

void sub_1000073CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 216), 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100007444(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002C314();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
LABEL_5:
    BOOL v10 = 1;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    int v15 = *(_DWORD *)(v14 + 24);
    if (!v15)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      int v15 = *(_DWORD *)(v14 + 24);
    }
    *(_DWORD *)(v14 + 24) = v15 + 1;
    goto LABEL_5;
  }
  if (a3)
  {
    BOOL v10 = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    int v13 = *(_DWORD *)(v12 + 24);
    if (!v13)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      int v13 = *(_DWORD *)(v12 + 24);
    }
    *(_DWORD *)(v12 + 24) = v13 + 1;
    BOOL v10 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == *(_DWORD *)(a1 + 64);
  }
LABEL_6:

  return v10;
}

void sub_100007594(void *a1, void *a2, int a3, uint64_t a4, int a5)
{
  id v9 = a2;
  if (v9)
  {
    id v10 = v9;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v9 = v10;
  }
  else
  {
    if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
      *(void *)(*(void *)(a1[6] + 8) + 24) = a1[9];
    }
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = a5;
  }
}

void sub_100007D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&STACK[0x318], 8);
  _Block_object_dispose(&STACK[0x368], 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_100007DEC(uint64_t a1, void *a2, const void *a3)
{
  id v6 = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else {
    memcpy((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), a3, 0x200uLL);
  }
}

void sub_100007E74(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void sub_100007EF0(void *a1, void *a2, uint64_t a3, char a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v8 = v9;
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

void sub_100007F7C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  *id v6 = v8;
}

void sub_1000084B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000084D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned __int16 *a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  if (v11)
  {
    int v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002C950();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    goto LABEL_5;
  }
  if (a3 == 1) {
    goto LABEL_6;
  }
  if (a3 != 2) {
    goto LABEL_13;
  }
  if (*a5 < 3u)
  {
    bzero(v22, 0x2FEuLL);
    CONV_Unistr255ToUTF8((unint64_t)a5, v22);
    BOOL v18 = +[NSString stringWithUTF8String:v22];
    if (!+[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", v22, [v18 length]))
    {
      uint64_t v19 = fs_errorForPOSIXError();
      uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      goto LABEL_5;
    }

LABEL_13:
    a3 = 0;
    goto LABEL_6;
  }
  uint64_t v15 = fs_errorForPOSIXError();
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

LABEL_5:
  a3 = 1;
LABEL_6:

  return a3;
}

void sub_100008808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008844(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v8 = a2;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002C9C4(v8, v9);
    }
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v10 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_6;
    }
    if (a3 != 2)
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    int v13 = *(_DWORD *)(v12 + 24);
    if (v13 != *(_DWORD *)(a1 + 64))
    {
      uint64_t v10 = 0;
      *(_DWORD *)(v12 + 24) = v13 + 1;
      goto LABEL_6;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a4;
  }
  uint64_t v10 = 1;
LABEL_6:

  return v10;
}

void sub_100008CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100008D30(void *a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002CB50();
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

void sub_100008EFC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100008F40(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100008F50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008F8C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_10000A24C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A3E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A570(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A79C@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(result + 4) = a3;
  *(_WORD *)(result + 12) = 1024;
  *(_DWORD *)(result + 14) = a2;
  return result;
}

void sub_10000AB74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000AF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10000AFF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B008(uint64_t a1)
{
}

void sub_10000B010(uint64_t a1, void *a2, int a3, int a4)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v9 = a2;
  id v8 = [*(id *)(a1 + 32) systemInfo];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 bytesPerCluster] * a3;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
}

void sub_10000B6B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000B718(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  id v8 = [*(id *)(a1 + 32) systemInfo];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 bytesPerCluster] * a3;

  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
}

void sub_10000B7C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000BA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

size_t sub_10000BAA0(size_t result, char a2, id a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (a3)
  {
    size_t v3 = result;
    uint64_t result = strlen((const char *)[a3 UTF8String]);
    *(_WORD *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = result;
  }
  return result;
}

void sub_10000BE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000BEE8(void *a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v8 = v9;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

uint64_t sub_10000C120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000CE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 200), 8);
  _Block_object_dispose((const void *)(v70 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10000CF50(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    size_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002D970();
    }
  }
}

void sub_10000CFA8(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002D9E4();
    }
  }
  else if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  }
}

void sub_10000D050(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7)
  {
    if ([v7 code] != (id)2) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_10000D0EC(uint64_t a1, void *a2, int a3, uint64_t a4, int a5)
{
  id v9 = a2;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else if (*(_DWORD *)(a1 + 56) == a5)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
  }
  else
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10002DA58((int *)(a1 + 56), a5, v10);
    }

    uint64_t v11 = fs_errorForPOSIXError();
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_10000D1CC(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void sub_10000D248(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v14;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) string];
    uint64_t v11 = [v9 createFATItemWithParent:v10 name:v8 dirEntryData:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_10000D310(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    size_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002DAF4();
    }
  }
}

void sub_10000D368(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  *id v7 = v9;
}

uint64_t sub_10000D4B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000D6D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose((const void *)(v71 - 256), 8);
  _Block_object_dispose((const void *)(v71 - 208), 8);
  _Block_object_dispose((const void *)(v71 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000E110(uint64_t a1, void *a2, int a3, char a4)
{
  id v9 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  if ([*(id *)(a1 + 32) isRoot])
  {
    if (!*(unsigned char *)(a1 + 80))
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if ((v8 | 2) == 2)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8 == 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
    }
  }
}

uint64_t sub_10000E1E4(uint64_t a1, void *a2, uint64_t a3, int a4, unint64_t a5, void *a6)
{
  id v12 = a2;
  id v13 = a6;
  if (v12)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    id v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002DDB0(v12, v14);
    }

    goto LABEL_5;
  }
  if (a3 == 1) {
    goto LABEL_21;
  }
  if (a3 != 2)
  {
LABEL_20:
    a3 = 0;
    goto LABEL_21;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    goto LABEL_10;
  }
  int v15 = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  unint64_t v16 = (v15 + a4) | ((unint64_t)++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                + 24) << 32);
  uint64_t v17 = *(void *)(a1 + 56);
  BOOL v18 = +[FSFileName nameWithString:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, void, void, unint64_t, void, void))(v17 + 16))(v17, v18, *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), v16, *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), 0);

  uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = 0;

  if ((v16 & 1) == 0)
  {
LABEL_10:
    CONV_Unistr255ToUTF8(a5, [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) mutableBytes]);
    uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) mutableBytes]);
    id v22 = v21;
    if (!v21 || ![v21 length]) {
      goto LABEL_19;
    }
    if (*(unsigned char *)(a1 + 128))
    {
      id v23 = v22;
      if (+[Utilities isDotOrDotDot:length:](Utilities, "isDotOrDotDot:length:", [v23 UTF8String], objc_msgSend(v23, "length")))
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v24 = [*(id *)(a1 + 32) createFATItemWithParent:*(void *)(a1 + 40) name:v23 dirEntryData:v13];
      uint64_t v25 = [v24 getAttributes:*(void *)(a1 + 48)];
      uint64_t v26 = *(void *)(*(void *)(a1 + 112) + 8);
      int v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8)+ 40) type];
    }
    else if ([v13 type] == (id)2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 2;
    }
    else
    {
      long long v28 = *(void **)(a1 + 32);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10000E528;
      v32[3] = &unk_10004C9D8;
      v32[4] = *(void *)(a1 + 96);
      [v28 isSymLink:v13 replyHandler:v32];
    }
    uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v22;
    id v22 = v22;

    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [*(id *)(a1 + 32) getFileID:v13];
    goto LABEL_19;
  }
LABEL_5:
  a3 = 1;
LABEL_21:

  return a3;
}

uint64_t sub_10000E528(uint64_t result, int a2)
{
  uint64_t v2 = 3;
  if (!a2) {
    uint64_t v2 = 1;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

void sub_10000EC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 200), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10000EC74(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002E020();
    }
  }
  else if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
  }
}

void sub_10000ED1C(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v14;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) string];
    uint64_t v11 = [v9 createFATItemWithParent:v10 name:v8 dirEntryData:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_10000EDE4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v5;
  }
  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v8 = v11;
  }
  id v9 = v8;
  uint64_t v10 = *v7;
  *id v7 = v9;
}

void sub_10000EF64(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v10 = +[FATItem dynamicCast:v7];
    id v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 entryData];
      id v13 = [v12 getSize];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000F09C;
      v15[3] = &unk_10004CA28;
      uint64_t v14 = *(void *)(a1 + 40);
      id v16 = *(id *)(a1 + 32);
      [v11 fetchFileExtentsFrom:0 to:v13 usingBlocks:v14 replyHandler:v15];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000F09C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    size_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002E094();
    }
  }
}

void sub_10000F69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000F6EC(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) systemInfo];
    unint64_t v10 = [v9 bytesPerCluster] * a4;

    unint64_t v11 = *(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v10 < v11) {
      unint64_t v11 = v10;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
    uint64_t v12 = [*(id *)(a1 + 32) resource];
    id v13 = (char *)[*(id *)(a1 + 40) mutableBytes]
        + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v14 = [*(id *)(a1 + 32) systemInfo];
    uint64_t v15 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v12, v13, [v14 offsetForCluster:a3], *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) -= *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24);
      BOOL v18 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) < 1;
      goto LABEL_7;
    }
  }
  BOOL v18 = 1;
LABEL_7:

  return v18;
}

void sub_10000F888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10001002C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100010068(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_10002E37C();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000100E0(uint64_t a1, int a2, id obj)
{
}

void sub_1000100F4(uint64_t a1, void *a2)
{
}

void sub_1000113DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose((const void *)(v70 - 232), 8);
  _Block_object_dispose((const void *)(v70 - 184), 8);
  _Block_object_dispose((const void *)(v70 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100011498(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002EA6C();
    }
  }
}

void sub_1000114F0(uint64_t a1, int a2, id obj)
{
}

void sub_100011504(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v14;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) string];
    uint64_t v11 = [v9 createFATItemWithParent:v10 name:v8 dirEntryData:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

void sub_1000115CC(uint64_t a1, void *a2)
{
}

void sub_1000115DC(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void sub_100011658(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  *id v6 = v8;
}

void sub_1000116E8(uint64_t a1, int a2, id obj)
{
}

void sub_1000116FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v5 = v6;
  }
}

void sub_10001175C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  *id v6 = v8;
}

void sub_100011960(id a1, NSError *a2)
{
  if (a2)
  {
    id v2 = fskit_std_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10002EB58(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

uint64_t sub_100011BAC(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_100011CF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011E84(uint64_t a1, void *a2)
{
}

uint64_t sub_100011F64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011FE8(id a1, NSError *a2, unsigned __int8 a3)
{
  int v3 = a3;
  uint64_t v4 = a2;
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002EF68();
    }
LABEL_7:

    goto LABEL_8;
  }
  if ((v3 - 1) <= 1)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002EED0(v3 == 1, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_10001231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012334(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002F054();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void sub_1000128F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012918(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void sub_100012D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012D4C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002F2A4();
    }
  }
}

void sub_100012DA4(uint64_t a1, void *a2, uint64_t a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void sub_100012E04(uint64_t a1, void *a2)
{
}

void sub_1000132D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000132F0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100013688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000136AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000136BC(uint64_t a1)
{
}

void sub_1000136C4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002F318();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void sub_100013740(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002F38C();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void sub_100013E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013ED8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002F750();
    }
  }
}

void sub_100013F30(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002F7C4();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void sub_1000144B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000144E8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002FA18();
    }
  }
}

uint64_t sub_100014540(uint64_t result, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void sub_100014A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100014A74(void *a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v8 = v9;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

void sub_100014DE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100015068(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t fat_init(_DWORD *a1, uint64_t a2)
{
  fat_uninit();
  qword_1000569F0 = (uint64_t)a1;
  uint64_t v9 = a1[19];
  uint64_t v10 = sub_1000155D0;
  uint64_t v11 = sub_100015518;
  if (v9 != 4095)
  {
    if (v9 == 0xFFFFFFF)
    {
      uint64_t v10 = sub_10001593C;
      uint64_t v11 = sub_10001587C;
    }
    else
    {
      if (v9 != 0xFFFF)
      {
        long long v63 = fsck_ctx;
        uint64_t v64 = qword_100056470;
        fsck_print((uint64_t)&v63, 2, (uint64_t)"Unknown cluster mask (0x%08X)\n", v4, v5, v6, v7, v8, v9);
        return 16;
      }
      uint64_t v10 = sub_100015790;
      uint64_t v11 = sub_1000156E8;
    }
  }
  fat_get = (uint64_t (*)(void, void))v11;
  fat_set = (uint64_t (*)(void, void, void))v10;
  if (initUseMap((uint64_t)a1)) {
    return 16;
  }
  if (fsck_maxmem()) {
    size_t v12 = (unint64_t)(fsck_maxmem() - qword_1000569F8) >> 16;
  }
  else {
    size_t v12 = (*a1 * a1[22] + 0xFFFF) >> 16;
  }
  qword_100056A00 = v12;
  qword_100056A08 = (uint64_t)malloc_type_calloc(v12, 0x20uLL, 0x10300409F66AF54uLL);
  if (!qword_100056A08)
  {
    if (qword_100056A20) {
      free((void *)qword_100056A20);
    }
    qword_100056A20 = 0;
    uint64_t v28 = __error();
    strerror(*v28);
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    uint64_t v34 = "No memory for FAT cache headers\n";
    goto LABEL_27;
  }
  uint64_t v13 = (char *)malloc_type_calloc(qword_100056A00, 0x10000uLL, 0x5D7A3C4BuLL);
  qword_100056A10 = (uint64_t)v13;
  if (!v13)
  {
    free((void *)qword_100056A08);
    qword_100056A08 = 0;
    if (qword_100056A20) {
      free((void *)qword_100056A20);
    }
    qword_100056A20 = 0;
    uint64_t v35 = __error();
    strerror(*v35);
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    uint64_t v34 = "No memory for FAT cache buffers\n";
LABEL_27:
    fsck_print((uint64_t)&v63, 2, (uint64_t)"%s (%s)\n", v29, v30, v31, v32, v33, (uint64_t)v34);
    return 16;
  }
  uint64_t v14 = qword_100056A00;
  uint64_t v15 = qword_100056A08;
  if (qword_100056A00)
  {
    int v16 = 0;
    uint64_t v17 = qword_100056A08 + 32;
    do
    {
      *(_DWORD *)(v17 - 32) = -2;
      *(void *)(v17 - 16) = &v13[v16 & 0xFFFF0000];
      if (v14 != 1) {
        *(void *)(v17 - 24) = v17;
      }
      v16 += 0x10000;
      v17 += 32;
      --v14;
    }
    while (v14);
  }
  qword_100056A18 = v15;
  unsigned int v18 = fat_get(0, a2);
  if (v18 == -286331154) {
    return 16;
  }
  unsigned int v24 = a1[19];
  uint64_t v25 = v24 & v18;
  uint64_t v26 = (a1[5] - 256) & v24;
  if (v25 == v26)
  {
    int v27 = 0;
  }
  else
  {
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    fsck_print((uint64_t)&v63, 6, (uint64_t)"Warning: FAT[0] is incorrect (is 0x%X; should be 0x%X)\n",
      v19,
      v20,
      v21,
      v22,
      v23,
      v25);
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    if (fsck_ask((uint64_t)&v63, 1, (uint64_t)"Correct", v38, v39, v40, v41, v42, v61))
    {
      int v43 = fat_set(0, v26, a2);
      int v27 = v43 ? v43 : 4;
    }
    else
    {
      int v27 = 8;
    }
  }
  unsigned int v44 = fat_get(1, a2);
  if (v44 == -286331154) {
    return 16;
  }
  unsigned int v50 = v44;
  unsigned int v51 = a1[19];
  unsigned int v52 = ~(v44 >> 10) & 0x20 | v27;
  if (v51 != 0xFFFF) {
    unsigned int v52 = v27;
  }
  if (v51 == 0xFFFFFFF) {
    uint64_t v36 = ~(v44 >> 22) & 0x20 | v27;
  }
  else {
    uint64_t v36 = v52;
  }
  if (v51 == 4095) {
    int v53 = 4095;
  }
  else {
    int v53 = v51 >> 2;
  }
  if ((v53 & v44) < (v53 & 0x3FFFFFF8u))
  {
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    fsck_print((uint64_t)&v63, 6, (uint64_t)"Warning: FAT[1] is incorrect\n", v45, v46, v47, v48, v49, v60);
    long long v63 = fsck_ctx;
    uint64_t v64 = qword_100056470;
    if (fsck_ask((uint64_t)&v63, 1, (uint64_t)"Correct", v54, v55, v56, v57, v58, v62))
    {
      int v59 = fat_set(1, v53 | v50, a2);
      if (v59) {
        return v59 | v36;
      }
      else {
        return v36 | 4;
      }
    }
    else
    {
      return v36 | 8;
    }
  }
  return v36;
}

void fat_uninit()
{
  if (qword_100056A08)
  {
    free((void *)qword_100056A08);
    qword_100056A08 = 0;
  }
  if (qword_100056A10)
  {
    free((void *)qword_100056A10);
    qword_100056A10 = 0;
  }
  if (qword_100056A20) {
    free((void *)qword_100056A20);
  }
  qword_100056A20 = 0;
}

uint64_t sub_100015518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a1;
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    uint64_t v14 = 4008636142;
    long long v16 = fsck_ctx;
    uint64_t v17 = qword_100056470;
    fsck_print((uint64_t)&v16, 3, (uint64_t)"fat12_get: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned int v9 = a1 + (a1 >> 1);
    uint64_t v10 = sub_100016264(v9, a2);
    if (v10)
    {
      unsigned int v11 = *(unsigned __int16 *)(*(void *)(v10 + 16) + (unsigned __int16)v9);
      unsigned int v12 = v11 >> 4;
      unsigned int v13 = v11 & 0xFFF;
      if (v8) {
        unsigned int v13 = v12;
      }
      if (v13 <= 0xFF5) {
        return v13;
      }
      else {
        return v13 | 0xFFFFF000;
      }
    }
    else
    {
      return 4008636142;
    }
  }
  return v14;
}

uint64_t sub_1000155D0(uint64_t a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a1;
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    long long v21 = fsck_ctx;
    uint64_t v22 = qword_100056470;
    fsck_print((uint64_t)&v21, 3, (uint64_t)"fat16_set: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned int v10 = a1 + (a1 >> 1);
    uint64_t v11 = sub_100016264(v10, a3);
    if (v11)
    {
      unsigned int v12 = (unsigned char *)(*(void *)(v11 + 16) + (unsigned __int16)v10);
      if (v8) {
        int v13 = *v12 & 0xF | (16 * (a2 & 0xFFF));
      }
      else {
        int v13 = a2 & 0xFFF | ((((v12[1] & 0xF0) >> 4) & 0xF) << 12);
      }
      *(_WORD *)unsigned int v12 = v13;
      uint64_t v15 = v8 >> 5;
      int v16 = 1 << v8;
      int v17 = *(_DWORD *)(qword_100056A20 + 4 * v15);
      int v18 = v17 & (1 << v8);
      if (v13)
      {
        if (!v18)
        {
          int v19 = v17 | v16;
LABEL_13:
          *(_DWORD *)(qword_100056A20 + 4 * v15) = v19;
        }
      }
      else if (v18)
      {
        int v19 = v17 & ~v16;
        goto LABEL_13;
      }
      uint64_t v14 = 0;
      *(_DWORD *)v11 |= 1u;
      return v14;
    }
  }
  return 16;
}

uint64_t sub_1000156E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    uint64_t v11 = 4008636142;
    long long v13 = fsck_ctx;
    uint64_t v14 = qword_100056470;
    fsck_print((uint64_t)&v13, 3, (uint64_t)"fat16_get: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned __int16 v8 = 2 * a1;
    uint64_t v9 = sub_100016264(2 * (int)a1, a2);
    if (v9)
    {
      unsigned int v10 = *(unsigned __int16 *)(*(void *)(v9 + 16) + (v8 & 0xFFFE));
      if (v10 <= 0xFFF5) {
        return *(unsigned __int16 *)(*(void *)(v9 + 16) + (v8 & 0xFFFE));
      }
      else {
        return v10 | 0xFFFF0000;
      }
    }
    else
    {
      return 4008636142;
    }
  }
  return v11;
}

uint64_t sub_100015790(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a1;
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    long long v19 = fsck_ctx;
    uint64_t v20 = qword_100056470;
    fsck_print((uint64_t)&v19, 3, (uint64_t)"fat16_set: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned __int16 v10 = 2 * a1;
    uint64_t v11 = sub_100016264(2 * (int)a1, a3);
    if (v11)
    {
      *(_WORD *)(*(void *)(v11 + 16) + (v10 & 0xFFFE)) = a2;
      uint64_t v12 = v8 >> 5;
      int v13 = 1 << v8;
      int v14 = *(_DWORD *)(qword_100056A20 + 4 * v12);
      int v15 = v14 & (1 << v8);
      if (a2)
      {
        if (!v15)
        {
          int v16 = v14 | v13;
LABEL_10:
          *(_DWORD *)(qword_100056A20 + 4 * v12) = v16;
        }
      }
      else if (v15)
      {
        int v16 = v14 & ~v13;
        goto LABEL_10;
      }
      uint64_t v17 = 0;
      *(_DWORD *)v11 |= 1u;
      return v17;
    }
  }
  return 16;
}

uint64_t sub_10001587C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    uint64_t v11 = 4008636142;
    long long v13 = fsck_ctx;
    uint64_t v14 = qword_100056470;
    fsck_print((uint64_t)&v13, 3, (uint64_t)"fat32_get: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned __int16 v8 = 4 * a1;
    uint64_t v9 = sub_100016264(4 * (int)a1, a2);
    if (v9)
    {
      unsigned int v10 = (*(unsigned __int16 *)(*(void *)(v9 + 16) + (v8 & 0xFFFC)) | (*(unsigned __int8 *)(*(void *)(v9 + 16)
                                                                                               + (v8 & 0xFFFC)
                                                                                               + 2) << 16)) & 0xF0FFFFFF | ((*(unsigned char *)(*(void *)(v9 + 16) + (v8 & 0xFFFC) + 3) & 0xF) << 24);
      if (v10 <= 0xFFFFFF5) {
        return v10;
      }
      else {
        return v10 | 0xF0000000;
      }
    }
    else
    {
      return 4008636142;
    }
  }
  return v11;
}

uint64_t sub_10001593C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a1;
  if (*(_DWORD *)(qword_1000569F0 + 80) <= a1)
  {
    long long v20 = fsck_ctx;
    uint64_t v21 = qword_100056470;
    fsck_print((uint64_t)&v20, 3, (uint64_t)"fat32_set: invalid cluster (%u)\n", a4, a5, a6, a7, a8, a1);
  }
  else
  {
    unsigned __int16 v10 = 4 * a1;
    uint64_t v11 = sub_100016264(4 * (int)a1, a3);
    if (v11)
    {
      uint64_t v12 = *(void *)(v11 + 16) + (v10 & 0xFFFC);
      *(_WORD *)uint64_t v12 = a2;
      *(unsigned char *)(v12 + 2) = BYTE2(a2);
      *(unsigned char *)(v12 + 3) = *(unsigned char *)(v12 + 3) & 0xF0 | HIBYTE(a2) & 0xF;
      uint64_t v13 = v8 >> 5;
      int v14 = 1 << v8;
      int v15 = *(_DWORD *)(qword_100056A20 + 4 * v13);
      int v16 = v15 & (1 << v8);
      if (a2)
      {
        if (!v16)
        {
          int v17 = v15 | v14;
LABEL_10:
          *(_DWORD *)(qword_100056A20 + 4 * v13) = v17;
        }
      }
      else if (v16)
      {
        int v17 = v15 & ~v14;
        goto LABEL_10;
      }
      uint64_t v18 = 0;
      *(_DWORD *)v11 |= 1u;
      return v18;
    }
  }
  return 16;
}

BOOL initUseMap(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 80) + 31;
  if (qword_100056A20) {
    free((void *)qword_100056A20);
  }
  qword_1000569F8 = (v1 & 0xFFFFFFE0) >> 3;
  if (fsck_maxmem() && (unint64_t v2 = fsck_maxmem(), v3 = qword_1000569F8, v2 < qword_1000569F8 + 0x10000))
  {
    fsck_maxmem();
    long long v11 = fsck_ctx;
    uint64_t v12 = qword_100056470;
    fsck_print((uint64_t)&v11, 2, (uint64_t)"Cannot allocate %zd bytes for usemap (maxmem=%zd, clusters=%d)\nmaxmem must be at least %zd\n", v4, v5, v6, v7, v8, v3);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = malloc_type_calloc(v1 >> 5, 4uLL, 0x100004052888210uLL);
  }
  qword_100056A20 = (uint64_t)v9;
  return v9 == 0;
}

void freeUseMap()
{
  if (qword_100056A20) {
    free((void *)qword_100056A20);
  }
  qword_100056A20 = 0;
}

uint64_t fat_flush(uint64_t a1)
{
  unint64_t v1 = qword_100056A00;
  if (!qword_100056A00) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = &unk_100056000;
  uint64_t v5 = *(_DWORD *)(qword_1000569F0 + 72) & ~(*(int *)(qword_1000569F0 + 72) >> 31);
  uint64_t v6 = qword_100056A08;
  while (1)
  {
    unint64_t v7 = *(int *)(v6 + 32 * v3);
    if (v7) {
      break;
    }
LABEL_13:
    if (v1 <= ++v3) {
      return 0;
    }
  }
  unint64_t v8 = *(unsigned int *)(v6 + 32 * v3 + 24);
  if (!v8)
  {
LABEL_12:
    *(_DWORD *)(v6 + 32 * v3) &= ~1u;
    unint64_t v1 = qword_100056A00;
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  uint64_t v10 = v5;
  unint64_t v11 = ((*(_DWORD *)(v4[318] + 8) + *(_DWORD *)(v4[318] + 88) * v5) * *(_DWORD *)v4[318])
      + (v7 >> 1 << 16);
  while (1)
  {
    uint64_t v12 = v8 >= 0x4000 ? 0x4000 : v8;
    if ((*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t))(a1 + 40))(*(void *)(a1 + 24), *(void *)(qword_100056A08 + 32 * v3 + 16) + v9, v12, v11 + v9) != v12)break; {
    v9 += v12;
    }
    v8 -= v12;
    if (!v8)
    {
      uint64_t v6 = qword_100056A08;
      uint64_t v4 = (void *)&unk_100056000;
      uint64_t v5 = v10;
      goto LABEL_12;
    }
  }
  int v14 = __error();
  strerror(*v14);
  long long v20 = fsck_ctx;
  uint64_t v21 = qword_100056470;
  fsck_print((uint64_t)&v20, 2, (uint64_t)"%s (%s)\n", v15, v16, v17, v18, v19, (uint64_t)"Unable to write FAT");
  return 16;
}

uint64_t fat_free_unused(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(qword_1000569F0 + 80) < 3u)
  {
LABEL_19:
    uint64_t v20 = 0;
    goto LABEL_20;
  }
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 2;
  do
  {
    int v12 = fat_get(v11, a1);
    if (v12 == -286331154) {
      break;
    }
    if (((*(_DWORD *)(qword_100056A20 + 4 * (v11 >> 5)) >> v11) & 1) == 0)
    {
      if (v12)
      {
        if (v12 == -9)
        {
          uint64_t v13 = (_DWORD *)(qword_1000569F0 + 112);
LABEL_13:
          ++*v13;
          goto LABEL_14;
        }
        if (!v10)
        {
          long long v32 = fsck_ctx;
          uint64_t v33 = qword_100056470;
          fsck_print((uint64_t)&v32, 6, (uint64_t)"Warning: Found orphan cluster(s)\n", a4, a5, a6, a7, a8, v29);
          long long v32 = fsck_ctx;
          uint64_t v33 = qword_100056470;
          int v9 = fsck_ask((uint64_t)&v32, 1, (uint64_t)"Fix", v14, v15, v16, v17, v18, v30);
        }
        uint64_t v10 = (v10 + 1);
        if (!v9) {
          goto LABEL_14;
        }
        uint64_t v19 = fat_set(v11, 0, a1);
        if (v19)
        {
          uint64_t v20 = v19;
          if (!v10) {
            goto LABEL_20;
          }
LABEL_18:
          long long v32 = fsck_ctx;
          uint64_t v33 = qword_100056470;
          fsck_print((uint64_t)&v32, 6, (uint64_t)"Warning: Marked %u clusters as free\n", a4, a5, a6, a7, a8, v10);
          uint64_t v20 = v20 | 4;
          goto LABEL_20;
        }
      }
      uint64_t v13 = (_DWORD *)(qword_1000569F0 + 108);
      goto LABEL_13;
    }
LABEL_14:
    uint64_t v11 = (v11 + 1);
  }
  while (v11 < *(_DWORD *)(qword_1000569F0 + 80));
  if (!v10) {
    goto LABEL_19;
  }
  if (v9)
  {
    LODWORD(v20) = 0;
    goto LABEL_18;
  }
  long long v32 = fsck_ctx;
  uint64_t v33 = qword_100056470;
  fsck_print((uint64_t)&v32, 6, (uint64_t)"Warning: Found %u orphaned clusters\n", a4, a5, a6, a7, a8, v10);
  uint64_t v20 = 8;
LABEL_20:
  if (*(_DWORD *)(qword_1000569F0 + 48))
  {
    uint64_t v21 = *(unsigned int *)(qword_1000569F0 + 60);
    uint64_t v22 = *(unsigned int *)(qword_1000569F0 + 108);
    if (v21 != v22)
    {
      long long v32 = fsck_ctx;
      uint64_t v33 = qword_100056470;
      if (v21 == -1) {
        fsck_print((uint64_t)&v32, 6, (uint64_t)"Warning: Free space in FSInfo block is unset (should be %d)\n", a4, a5, a6, a7, a8, v22);
      }
      else {
        fsck_print((uint64_t)&v32, 6, (uint64_t)"Warning: Free space in FSInfo block (%d) not correct (%d)\n", a4, a5, a6, a7, a8, v21);
      }
      long long v32 = fsck_ctx;
      uint64_t v33 = qword_100056470;
      if (fsck_ask((uint64_t)&v32, 1, (uint64_t)"Fix", v23, v24, v25, v26, v27, v31))
      {
        *(_DWORD *)(qword_1000569F0 + 60) = *(_DWORD *)(qword_1000569F0 + 108);
        return writefsinfo() | v20;
      }
    }
  }
  return v20;
}

uint64_t isUsed(unsigned int a1)
{
  return (*(_DWORD *)(qword_100056A20 + 4 * (a1 >> 5)) >> a1) & 1;
}

uint64_t isdirty(unsigned int *a1, int a2, uint64_t a3)
{
  if (a1[19] != 4095)
  {
    uint64_t v6 = (char *)malloc_type_malloc(*a1, 0x457AF4BuLL);
    if (v6)
    {
      unint64_t v7 = v6;
      unint64_t v8 = *a1;
      if (v8)
      {
        uint64_t v9 = 0;
        unint64_t v10 = v8 * (unint64_t)(a1[2] + a1[22] * a2);
        while (1)
        {
          uint64_t v11 = v8 >= 0x4000 ? 0x4000 : v8;
          if ((*(uint64_t (**)(void, char *, uint64_t, unint64_t))(a3 + 32))(*(void *)(a3 + 24), &v7[v9], v11, v9 + v10) != v11)break; {
          v9 += v11;
          }
          v8 -= v11;
          if (!v8) {
            goto LABEL_10;
          }
        }
        uint64_t v20 = __error();
        strerror(*v20);
        long long v27 = fsck_ctx;
        uint64_t v28 = qword_100056470;
        fsck_print((uint64_t)&v27, 2, (uint64_t)"%s (%s)\n", v21, v22, v23, v24, v25, (uint64_t)"Unable to read FAT");
      }
      else
      {
LABEL_10:
        unsigned int v12 = a1[19];
        if (v12 == 0xFFFF)
        {
          BOOL v13 = v7[3] >= 0;
          goto LABEL_18;
        }
        if (v12 == 0xFFFFFFF)
        {
          BOOL v13 = (v7[7] & 8) == 0;
LABEL_18:
          free(v7);
          return v13;
        }
      }
      BOOL v13 = 1;
      goto LABEL_18;
    }
    uint64_t v14 = __error();
    strerror(*v14);
    long long v27 = fsck_ctx;
    uint64_t v28 = qword_100056470;
    fsck_print((uint64_t)&v27, 2, (uint64_t)"%s (%s)\n", v15, v16, v17, v18, v19, (uint64_t)"No space for FAT sector");
  }
  return 1;
}

uint64_t fat_mark_clean(uint64_t a1)
{
  if (*(_DWORD *)(qword_1000569F0 + 76) == 4095) {
    return 0;
  }
  unsigned int v3 = fat_get(1, a1);
  if (v3 == -286331154) {
    return 8;
  }
  if (*(_DWORD *)(qword_1000569F0 + 76) == 0xFFFF) {
    int v4 = 0x8000;
  }
  else {
    int v4 = 0x8000000;
  }
  uint64_t v5 = (uint64_t (*)(uint64_t, void, uint64_t))fat_set;

  return v5(1, v4 | v3, a1);
}

const char *rsrvdcltype(unsigned int a1)
{
  unint64_t v1 = "reserved";
  unint64_t v2 = "as EOF";
  if (a1 == -9) {
    unint64_t v2 = "bad";
  }
  if (a1 >= 0xFFFFFFF7) {
    unint64_t v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return "free";
  }
}

uint64_t markUsed(unsigned int a1)
{
  char v1 = a1;
  uint64_t v2 = a1 >> 5;
  uint64_t result = 1;
  int v4 = 1 << v1;
  int v5 = *(_DWORD *)(qword_100056A20 + 4 * v2);
  if ((v5 & v4) == 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(qword_100056A20 + 4 * v2) = v5 | v4;
  }
  return result;
}

uint64_t markFree(unsigned int a1)
{
  char v1 = a1;
  uint64_t v2 = a1 >> 5;
  uint64_t result = 1;
  int v4 = 1 << v1;
  int v5 = *(_DWORD *)(qword_100056A20 + 4 * v2);
  if ((v5 & v4) != 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(qword_100056A20 + 4 * v2) = v5 & ~v4;
  }
  return result;
}

uint64_t sub_100016264(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = 0;
  unsigned int v4 = HIWORD(a1);
  int v5 = *(_DWORD *)(qword_1000569F0 + 88);
  unsigned int v6 = a1 & 0xFFFF0000;
  unsigned int v7 = *(_DWORD *)qword_1000569F0 * v5 - (a1 & 0xFFFF0000);
  if (v7 >= 0x10000) {
    unint64_t v8 = 0x10000;
  }
  else {
    unint64_t v8 = v7;
  }
  uint64_t v9 = qword_100056A18;
  do
  {
    uint64_t v10 = v3;
    uint64_t v3 = v9;
    int v11 = *(_DWORD *)v9;
    if (v4 == *(_DWORD *)v9 >> 1) {
      goto LABEL_24;
    }
    uint64_t v9 = *(void *)(v9 + 8);
  }
  while (v9);
  int v12 = *(_DWORD *)(qword_1000569F0 + 72) & ~(*(int *)(qword_1000569F0 + 72) >> 31);
  if (v11)
  {
    unint64_t v13 = *(unsigned int *)(v3 + 24);
    if (v13)
    {
      int v30 = *(_DWORD *)(qword_1000569F0 + 72) & ~(*(int *)(qword_1000569F0 + 72) >> 31);
      unsigned int v31 = a1 & 0xFFFF0000;
      uint64_t v14 = 0;
      unint64_t v15 = ((*(_DWORD *)(qword_1000569F0 + 8) + v12 * v5) * *(_DWORD *)qword_1000569F0)
          + ((unint64_t)v11 >> 1 << 16);
      while (1)
      {
        uint64_t v16 = v13 >= 0x4000 ? 0x4000 : v13;
        if ((*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t))(a2 + 40))(*(void *)(a2 + 24), *(void *)(v3 + 16) + v14, v16, v15 + v14) != v16)break; {
        v14 += v16;
        }
        v13 -= v16;
        if (!v13)
        {
          int v11 = *(_DWORD *)v3;
          int v12 = v30;
          unsigned int v6 = v31;
          goto LABEL_16;
        }
      }
      uint64_t v28 = __error();
      strerror(*v28);
      long long v32 = fsck_ctx;
      uint64_t v33 = qword_100056470;
      long long v27 = "Unable to write FAT";
      goto LABEL_30;
    }
LABEL_16:
    *(_DWORD *)uint64_t v3 = v11 & 0xFFFFFFFE;
  }
  *(_DWORD *)uint64_t v3 = 2 * v4;
  *(_DWORD *)(v3 + 24) = v8;
  if (v8)
  {
    uint64_t v17 = 0;
    unint64_t v18 = ((*(_DWORD *)(qword_1000569F0 + 8) + *(_DWORD *)(qword_1000569F0 + 88) * v12)
                       * *(_DWORD *)qword_1000569F0)
        + (unint64_t)v6;
    while (1)
    {
      uint64_t v19 = v8 >= 0x4000 ? 0x4000 : v8;
      if ((*(uint64_t (**)(void, uint64_t, uint64_t, unint64_t))(a2 + 32))(*(void *)(a2 + 24), *(void *)(v3 + 16) + v17, v19, v18 + v17) != v19)break; {
      v17 += v19;
      }
      v8 -= v19;
      if (!v8) {
        goto LABEL_24;
      }
    }
    uint64_t v21 = __error();
    strerror(*v21);
    long long v32 = fsck_ctx;
    uint64_t v33 = qword_100056470;
    long long v27 = "Unable to read FAT";
LABEL_30:
    fsck_print((uint64_t)&v32, 2, (uint64_t)"%s (%s)\n", v22, v23, v24, v25, v26, (uint64_t)v27);
    return 0;
  }
LABEL_24:
  uint64_t v20 = qword_100056A18;
  if (v3 != qword_100056A18)
  {
    if (v10) {
      *(void *)(v10 + 8) = *(void *)(v3 + 8);
    }
    *(void *)(v3 + 8) = v20;
    qword_100056A18 = v3;
  }
  return v3;
}

void sub_10001689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v12 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000168D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000168E0(uint64_t a1)
{
}

void sub_1000168E8(void *a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    id v8 = v9;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a4;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a3;
  }
}

void sub_100016AFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017AB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017AD0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002FF14();
    }
  }
}

void sub_100017B28(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002FF88();
    }
  }
}

void sub_100017B80(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002FFFC();
    }
  }
}

void sub_100017BD8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10002FF88();
    }
  }
}

void sub_100017C30(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    uint64_t v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100030070(v2, v3);
    }
  }
}

void sub_1000186E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100018714(void *a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100030274();
    }

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
}

void sub_1000195C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019638(uint64_t a1)
{
}

void sub_100019640(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v9 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) fsInfo];
    [v8 setDirtyBitValue:a3];
  }
}

void *sub_1000196C0(void *result, int a2, int a3)
{
  *(_DWORD *)(*(void *)(result[4] + 8) + 24) += a2;
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    *(_DWORD *)(*(void *)(result[6] + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 0;
  }
  return result;
}

void sub_10001A008(uint64_t a1)
{
  char v80 = -[FATBlock initWithOffset:andLength:]([FATBlock alloc], "initWithOffset:andLength:", 0, [*(id *)(a1 + 32) rwSize]);
  uint64_t v2 = -[FATBlock initWithOffset:andLength:]([FATBlock alloc], "initWithOffset:andLength:", 0, [*(id *)(a1 + 32) rwSize]);
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x2020000000;
  int v109 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = &v104;
  uint64_t v106 = 0x2020000000;
  int v107 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = &v100;
  uint64_t v102 = 0x2020000000;
  int v103 = 0;
  uint64_t v97 = 0;
  v98[0] = &v97;
  v98[1] = 0x2020000000;
  int v99 = 0;
  uint64_t v91 = 0;
  unint64_t v92 = &v91;
  uint64_t v93 = 0x3032000000;
  BOOL v94 = sub_100019628;
  uint64_t v95 = sub_100019638;
  id v96 = 0;
  unint64_t v79 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) fsInfo];
  BOOL v4 = (unint64_t)[v3 freeClusters] < v79;

  if (v4)
  {
    if (!*(unsigned char *)(a1 + 56)
      || ([*(id *)(a1 + 32) fsInfo],
          id v5 = objc_claimAutoreleasedReturnValue(),
          BOOL v6 = [v5 freeClusters] == 0,
          v5,
          v6))
    {
      int v11 = fskit_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v72 = *(unsigned __int8 *)(a1 + 56);
        BOOL v73 = [*(id *)(a1 + 32) fsInfo];
        id v74 = [v73 freeClusters];
        *(_DWORD *)buf = 136315906;
        uint64_t v111 = "-[FATManager allocateClusters:searchFromCluster:allowPartial:zeroFill:mustBeContig:replyHandler:]_block_invoke";
        __int16 v112 = 1024;
        int v113 = v72;
        __int16 v114 = 1024;
        *(_DWORD *)uint64_t v115 = v79;
        *(_WORD *)&v115[4] = 2048;
        *(void *)&v115[6] = v74;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: (allowPartial = %d) %u clusters requested,but only %llu are available. Returning ENOSPC.", buf, 0x22u);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = fs_errorForPOSIXError();
      (*(void (**)(uint64_t, void *, void, void, void))(v12 + 16))(v12, v13, 0, 0, 0);

      goto LABEL_40;
    }
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v75 = [*(id *)(a1 + 32) fsInfo];
      id v76 = [v75 freeClusters];
      char v77 = [*(id *)(a1 + 32) fsInfo];
      id v78 = [v77 freeClusters];
      *(_DWORD *)buf = 136315906;
      uint64_t v111 = "-[FATManager allocateClusters:searchFromCluster:allowPartial:zeroFill:mustBeContig:replyHandler:]_block_invoke";
      __int16 v112 = 1024;
      int v113 = v79;
      __int16 v114 = 2048;
      *(void *)uint64_t v115 = v76;
      *(_WORD *)&v115[8] = 2048;
      *(void *)&v115[10] = v78;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s: (allowPartial = true) %u clusters requested,but only %llu are available. Will try to allocate %llu clusters.", buf, 0x26u);
    }
    id v8 = [*(id *)(a1 + 32) fsInfo];
    unsigned int v9 = [v8 freeClusters];

    LODWORD(v79) = v9;
  }
  if (v79)
  {
    int v10 = *(_DWORD *)(a1 + 52);
    if (v10)
    {
      *(_DWORD *)(v98[0] + 24) = v10;
    }
    else
    {
      uint64_t v14 = [*(id *)(a1 + 32) fsInfo];
      unsigned int v15 = [v14 firstFreeCluster];
      uint64_t v16 = [*(id *)(a1 + 32) fsInfo];
      BOOL v17 = (unint64_t)[v16 maxValidCluster] > v15;

      if (v17)
      {
        uint64_t v18 = [*(id *)(a1 + 32) fsInfo];
        unsigned int v19 = [v18 firstFreeCluster];
        *(_DWORD *)(v98[0] + 24) = v19;
      }
    }
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(unsigned int *)(v98[0] + 24);
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10001AA44;
      v90[3] = &unk_10004CDF0;
      v90[4] = &v91;
      v90[5] = &v97;
      [v21 findNextFreeCluster:v22 replyHandler:v90];
      if (v92[5]) {
        break;
      }
      uint64_t v23 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:*(unsigned int *)(v98[0] + 24)];
      [(FATBlock *)v2 setStartOffset:v23];
      uint64_t v24 = [(FATBlock *)v2 data];
      BOOL v25 = v24 == 0;

      if (!v25)
      {
        id v26 = [(FATBlock *)v2 data];
        [v26 mutableBytes];
      }
      long long v27 = *(void **)(a1 + 32);
      id v28 = [(FATBlock *)v2 data];
      uint64_t v29 = objc_msgSend(v27, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v28, "mutableBytes"), v23);
      int v30 = (void *)v92[5];
      v92[5] = v29;

      unsigned int v31 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v20];
      if (v20)
      {
        long long v32 = v31;
        if (v31 == v23)
        {
          uint64_t v33 = v2;

          char v80 = v33;
          [(FATBlock *)v33 data];
        }
        else
        {
          [(FATBlock *)v80 setStartOffset:v31];
          uint64_t v34 = *(void **)(a1 + 32);
          id v35 = [(FATBlock *)v80 data];
          uint64_t v36 = objc_msgSend(v34, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v35, "mutableBytes"), v32);
          uint64_t v37 = (void *)v92[5];
          v92[5] = v36;

          if (v92[5]) {
            break;
          }
          [(FATBlock *)v80 data];
        }
        id v38 = objc_claimAutoreleasedReturnValue();
        uint64_t v39 = (char *)[v38 mutableBytes];
        uint64_t v40 = (char *)[*(id *)(a1 + 32) getOffsetForClusterEntry:v20];

        id v41 = [(FATBlock *)v2 data];
        uint64_t v42 = (char *)[v41 mutableBytes];
        int v43 = [*(id *)(a1 + 32) getOffsetForClusterEntry:*(unsigned int *)(v98[0] + 24)];

        unsigned int v44 = [*(id *)(a1 + 32) fsOps];
        LODWORD(v43) = [v44 getNextClusterFromEntryForCluster:*(unsigned int *)(v98[0] + 24) entry:&v42[v43 - v23]];

        if (v43)
        {
          uint64_t v60 = fskit_std_log();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            sub_100030424((uint64_t)v98, v20, v60);
          }
          goto LABEL_36;
        }
        uint64_t v45 = [*(id *)(a1 + 32) fsOps];
        int v46 = *(_DWORD *)(v98[0] + 24);
        uint64_t v47 = [*(id *)(a1 + 32) fsInfo];
        objc_msgSend(v45, "setFatEntryForCluster:entry:withValue:", v20, &v39[v40 - v32], objc_msgSend(v47, "FATMask") & v46);

        uint64_t v48 = *(void **)(a1 + 32);
        id v49 = [(FATBlock *)v80 data];
        uint64_t v50 = objc_msgSend(v48, "syncMetaWriteToFATs:startingAt:", objc_msgSend(v49, "mutableBytes"), v32);
        unsigned int v51 = (void *)v92[5];
        v92[5] = v50;

        if (v92[5])
        {
          uint64_t v60 = fskit_std_log();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
            sub_1000303AC(v60, v61, v62, v63, v64, v65, v66, v67);
          }
LABEL_36:

          uint64_t v68 = fs_errorForPOSIXError();
          int v69 = (void *)v92[5];
          v92[5] = v68;

          break;
        }
      }
      unsigned int v52 = *(void **)(a1 + 32);
      id v53 = [(FATBlock *)v2 data];
      id v54 = [v53 mutableBytes];
      uint64_t v55 = (v79 - *((_DWORD *)v101 + 6));
      uint64_t v56 = *(unsigned int *)(v98[0] + 24);
      uint64_t v57 = *(unsigned __int8 *)(a1 + 57);
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_10001AAA4;
      v82[3] = &unk_10004CE18;
      id v84 = *(id *)(a1 + 40);
      unint64_t v85 = v108;
      BOOL v86 = &v97;
      unint64_t v87 = &v100;
      BOOL v88 = &v104;
      v82[4] = *(void *)(a1 + 32);
      uint64_t v83 = v2;
      uint64_t v89 = v23;
      [v52 allocateClustersInBlock:v54 numClusters:v55 startingAtCluster:v56 startOffset:v23 mustBeContig:v57 replyHandler:v82];

      uint64_t v20 = *((unsigned int *)v105 + 6);
      unint64_t v58 = (v20 + 1);
      *(_DWORD *)(v98[0] + 24) = v58;
      int v59 = [*(id *)(a1 + 32) fsInfo];
      LODWORD(v58) = (unint64_t)[v59 maxValidCluster] < v58;

      if (v58) {
        *(_DWORD *)(v98[0] + 24) = 2;
      }
    }
    while (*((_DWORD *)v101 + 6) < v79);
    if (!v92[5])
    {
      uint64_t v70 = *(void **)(a1 + 32);
      uint64_t v71 = *(unsigned int *)(v98[0] + 24);
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_10001AC08;
      v81[3] = &unk_10004CE40;
      v81[4] = v70;
      [v70 findNextFreeCluster:v71 replyHandler:v81];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_40:
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(v108, 8);
}

void sub_10001A9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Block_object_dispose((const void *)(v45 - 224), 8);
  _Block_object_dispose((const void *)(v45 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10001AA44(uint64_t a1, void *a2, int a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void sub_10001AAA4(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  id v7 = a2;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if (a3)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(_DWORD *)(v8 + 24)) {
      *(_DWORD *)(v8 + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += a3;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a4;
    unsigned int v9 = [*(id *)(a1 + 32) fsInfo];
    objc_msgSend(v9, "setFreeClusters:", (char *)objc_msgSend(v9, "freeClusters") - a3);

    int v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) data];
    id v12 = objc_msgSend(v10, "syncMetaWriteToFATs:startingAt:", objc_msgSend(v11, "mutableBytes"), *(void *)(a1 + 88));
  }
  else
  {
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_1000304C4(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *, void, void, void))(v21 + 16))(v21, v22, 0, 0, 0);
  }
}

void sub_10001AC08(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  id v6 = [*(id *)(a1 + 32) fsInfo];
  id v8 = v6;
  if (a4) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = 0;
  }
  [v6 setFirstFreeCluster:v7];
}

uint64_t sub_10001AD54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001AF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AF88(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  id v22 = a2;
  if (a5)
  {
    if ([*(id *)(a1 + 32) numberOfClusters])
    {
      unsigned int v9 = (char *)objc_msgSend(*(id *)(a1 + 40), "getRWOffsetForClusterEntry:", objc_msgSend(*(id *)(a1 + 32), "lastCluster"));
      uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "syncMetaReadFromFAT:startingAt:", objc_msgSend(*(id *)(a1 + 48), "mutableBytes"), v9);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        goto LABEL_5;
      }
      id v13 = [*(id *)(a1 + 48) mutableBytes];
      uint64_t v14 = (char *)((char *)objc_msgSend(*(id *)(a1 + 40), "getOffsetForClusterEntry:", objc_msgSend(*(id *)(a1 + 32), "lastCluster"))+ (void)v13- v9);
      uint64_t v15 = [*(id *)(a1 + 40) fsOps];
      id v16 = [*(id *)(a1 + 32) lastCluster];
      uint64_t v17 = [*(id *)(a1 + 40) fsInfo];
      objc_msgSend(v15, "setFatEntryForCluster:entry:withValue:", v16, v14, objc_msgSend(v17, "FATMask") & a3);

      uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "syncMetaWriteToFATs:startingAt:", objc_msgSend(*(id *)(a1 + 48), "mutableBytes"), v9);
      uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
LABEL_5:
        uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        goto LABEL_9;
      }
    }
    else
    {
      [*(id *)(a1 + 32) setFirstCluster:a3];
    }
    [*(id *)(a1 + 32) setLastCluster:a4];
    objc_msgSend(*(id *)(a1 + 32), "setFirstClusterIndexInLastAllocation:", objc_msgSend(*(id *)(a1 + 32), "numberOfClusters"));
    [*(id *)(a1 + 32) setFirstClusterInLastAllocation:a3];
    objc_msgSend(*(id *)(a1 + 32), "setNumberOfClusters:", objc_msgSend(*(id *)(a1 + 32), "numberOfClusters") + a5);
  }
  uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_9:
  v21();
}

void sub_10001B298(uint64_t a1)
{
  id v2 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", objc_msgSend(*(id *)(a1 + 32), "rwSize"));
  id v3 = [*(id *)(a1 + 40) firstCluster];
  unsigned int v4 = *(_DWORD *)(a1 + 56);
  if (!v4)
  {
    uint64_t v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10003053C(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_14;
  }
  id v5 = v3;
  BOOL v6 = v4 <= [*(id *)(a1 + 40) numberOfClusters] && v5 >= 2;
  if (!v6
    || ([*(id *)(a1 + 32) fsInfo],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 maxValidCluster],
        v7,
        (unint64_t)v8 < v5))
  {
LABEL_14:
    uint64_t v22 = *(void *)(a1 + 48);
LABEL_15:
    uint64_t v23 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

    goto LABEL_16;
  }
  if (!v2)
  {
    uint64_t v22 = *(void *)(a1 + 48);
    goto LABEL_15;
  }
  unsigned int v9 = [*(id *)(a1 + 40) numberOfClusters];
  if (v9 == *(_DWORD *)(a1 + 56))
  {
    unsigned int v10 = v9;
    uint64_t v11 = 0;
    id v12 = 0;
    int v75 = 0;
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = 0;
    int v75 = 0;
    do
    {
      id v12 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v5];
      uint64_t v24 = *(void **)(a1 + 32);
      id v25 = v2;
      uint64_t v26 = objc_msgSend(v24, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v25, "mutableBytes"), v12);
      if (v26)
      {
        uint64_t v71 = (void *)v26;
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_16;
      }
      uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v5];
      int64_t v27 = v11 - v12;
      if (v11 - v12 < (unint64_t)[*(id *)(a1 + 32) rwSize])
      {
        while (1)
        {
          id v28 = (char *)[v25 mutableBytes] + v27;
          uint64_t v29 = [*(id *)(a1 + 32) fsOps];
          id v30 = [v29 getNextClusterFromEntryForCluster:v5 entry:v28];

          if (v13 == [*(id *)(a1 + 40) numberOfClusters] + ~*(_DWORD *)(a1 + 56)) {
            break;
          }
          ++v13;
          uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v30];
          int64_t v27 = v11 - v12;
          id v5 = v30;
          if (v11 - v12 >= (unint64_t)[*(id *)(a1 + 32) rwSize]) {
            goto LABEL_25;
          }
        }
        unsigned int v31 = [*(id *)(a1 + 32) fsOps];
        long long v32 = [*(id *)(a1 + 32) fsInfo];
        objc_msgSend(v31, "setFatEntryForCluster:entry:withValue:", v5, v28, objc_msgSend(v32, "FATMask"));

        ++v13;
        uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v30];
        int v75 = (int)v5;
LABEL_25:
        id v5 = v30;
      }
      unsigned int v33 = [*(id *)(a1 + 40) numberOfClusters];
      unsigned int v10 = *(_DWORD *)(a1 + 56);
    }
    while (v13 < v33 - v10);
  }
  if (v10 == [*(id *)(a1 + 40) numberOfClusters])
  {
    id v5 = [*(id *)(a1 + 40) firstCluster];
    uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v5];
    id v12 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v5];
    uint64_t v34 = objc_msgSend(*(id *)(a1 + 32), "syncMetaReadFromFAT:startingAt:", objc_msgSend(v2, "mutableBytes"), v12);
    if (v34) {
      goto LABEL_33;
    }
  }
  if (v12 != [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v5])
  {
    unsigned int v37 = [*(id *)(a1 + 40) numberOfClusters];
    int v36 = *(_DWORD *)(a1 + 56);
    if (v13 != v37 + ~v36) {
      goto LABEL_34;
    }
    id v12 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v5];
    uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v5];
    uint64_t v34 = objc_msgSend(*(id *)(a1 + 32), "syncMetaReadFromFAT:startingAt:", objc_msgSend(v2, "mutableBytes"), v12);
    if (v34)
    {
LABEL_33:
      id v38 = (void *)v34;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_16;
    }
  }
  int v36 = *(_DWORD *)(a1 + 56);
LABEL_34:
  unsigned int v39 = 0;
  if (!v36) {
    goto LABEL_64;
  }
  *(void *)&long long v35 = 136315906;
  long long v74 = v35;
  id v76 = v2;
  do
  {
    uint64_t v40 = objc_msgSend(*(id *)(a1 + 32), "fsInfo", v74);
    id v41 = [v40 maxValidCluster];

    if ((unint64_t)v41 < v5) {
      break;
    }
    if ((uint64_t)v11 < (uint64_t)v12) {
      goto LABEL_56;
    }
    id v42 = v5;
    while (v11 - v12 < [*(id *)(a1 + 32) rwSize])
    {
      if (v39 >= *(_DWORD *)(a1 + 56)) {
        break;
      }
      int v43 = [*(id *)(a1 + 32) fsInfo];
      id v44 = [v43 maxValidCluster];

      if ((unint64_t)v44 < v42) {
        break;
      }
      uint64_t v45 = (char *)[v76 mutableBytes] + v11 - v12;
      int v46 = [*(id *)(a1 + 32) fsOps];
      id v5 = [v46 getNextClusterFromEntryForCluster:v42 entry:v45];

      if (!v5)
      {
        uint64_t v55 = fskit_std_log();
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
LABEL_54:

          fs_errorForPOSIXError();
          break;
        }
        unsigned int v56 = [*(id *)(a1 + 40) firstCluster];
        unsigned int v57 = [*(id *)(a1 + 40) lastCluster];
        unsigned int v58 = [*(id *)(a1 + 40) numberOfClusters];
        *(_DWORD *)buf = 136316162;
        id v78 = "-[FATManager freeClusters:ofItem:replyHandler:]_block_invoke";
        __int16 v79 = 1024;
        int v80 = (int)v42;
        __int16 v81 = 1024;
        unsigned int v82 = v56;
        __int16 v83 = 1024;
        unsigned int v84 = v57;
        __int16 v85 = 1024;
        unsigned int v86 = v58;
        int v59 = v55;
        uint64_t v60 = "%s: cluster %u is free where it should be in use. Item stats [%u, %u, %u]";
        uint32_t v61 = 36;
LABEL_63:
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, v60, buf, v61);
        goto LABEL_54;
      }
      unsigned int v47 = [*(id *)(a1 + 32) isEOFCluster:v5];
      uint64_t v48 = [*(id *)(a1 + 32) fsOps];
      id v49 = [*(id *)(a1 + 32) fsInfo];
      [v49 FATMask];
      [v48 setFatEntryForCluster:v42 entry:v45 withValue:0];

      uint64_t v50 = [*(id *)(a1 + 32) fsInfo];
      objc_msgSend(v50, "setFreeClusters:", (char *)objc_msgSend(v50, "freeClusters") + 1);

      unsigned int v51 = [*(id *)(a1 + 32) fsInfo];
      if ([v51 firstFreeCluster] > v42)
      {

LABEL_46:
        id v54 = [*(id *)(a1 + 32) fsInfo];
        [v54 setFirstFreeCluster:v42];

        goto LABEL_47;
      }
      unsigned int v52 = [*(id *)(a1 + 32) fsInfo];
      unsigned int v53 = [v52 firstFreeCluster];

      if (!v53) {
        goto LABEL_46;
      }
LABEL_47:
      ++v39;
      if (v47 && v39 != *(_DWORD *)(a1 + 56))
      {
        uint64_t v55 = fskit_std_log();
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
        unsigned int v67 = *(_DWORD *)(a1 + 56);
        *(_DWORD *)buf = v74;
        id v78 = "-[FATManager freeClusters:ofItem:replyHandler:]_block_invoke";
        __int16 v79 = 1024;
        int v80 = (int)v42;
        __int16 v81 = 1024;
        unsigned int v82 = v39;
        __int16 v83 = 1024;
        unsigned int v84 = v67;
        int v59 = v55;
        uint64_t v60 = "%s: %u freed clusters %u, should have freed %u, got EOF";
        uint32_t v61 = 30;
        goto LABEL_63;
      }
      uint64_t v11 = [*(id *)(a1 + 32) getOffsetForClusterEntry:v5];
      id v42 = v5;
      if ((uint64_t)v11 < (uint64_t)v12) {
        goto LABEL_56;
      }
    }
    id v5 = v42;
LABEL_56:
    uint64_t v62 = *(void **)(a1 + 32);
    id v2 = v76;
    id v63 = v76;
    uint64_t v64 = objc_msgSend(v62, "syncMetaWriteToFATs:startingAt:", objc_msgSend(v63, "mutableBytes"), v12);
    if (v64)
    {
      int v72 = (void *)v64;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_16;
    }
    unsigned int v65 = *(_DWORD *)(a1 + 56);
    if (v39 >= v65) {
      continue;
    }
    id v12 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v5];
    uint64_t v66 = objc_msgSend(*(id *)(a1 + 32), "syncMetaReadFromFAT:startingAt:", objc_msgSend(v63, "mutableBytes"), v12);
    if (v66)
    {
      BOOL v73 = (void *)v66;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_16;
    }
    unsigned int v65 = *(_DWORD *)(a1 + 56);
  }
  while (v39 < v65);
LABEL_64:
  uint64_t v68 = [*(id *)(a1 + 32) fsInfo];
  if ((unint64_t)[v68 maxValidCluster] >= v5) {
    goto LABEL_68;
  }
  unsigned __int8 v69 = [*(id *)(a1 + 32) isEOFCluster:v5];

  if ((v69 & 1) == 0)
  {
    uint64_t v68 = fskit_std_log();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
      sub_1000305B4();
    }
LABEL_68:
  }
  if (v75) {
    objc_msgSend(*(id *)(a1 + 40), "setLastCluster:");
  }
  int v70 = *(_DWORD *)(a1 + 56);
  if (v70 == [*(id *)(a1 + 40) numberOfClusters])
  {
    [*(id *)(a1 + 40) setLastCluster:0];
    [*(id *)(a1 + 40) setFirstCluster:0];
  }
  [*(id *)(a1 + 40) setFirstClusterInLastAllocation:0];
  [*(id *)(a1 + 40) setFirstClusterIndexInLastAllocation:0];
  objc_msgSend(*(id *)(a1 + 40), "setNumberOfClusters:", objc_msgSend(*(id *)(a1 + 40), "numberOfClusters") - v39);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

void sub_10001BC04(uint64_t a1)
{
  uint64_t v26 = -[FATBlock initWithOffset:andLength:]([FATBlock alloc], "initWithOffset:andLength:", 0, [*(id *)(a1 + 32) rwSize]);
  id v2 = (id)*(unsigned int *)(a1 + 48);
  if ([*(id *)(a1 + 32) isEOFCluster:0])
  {
    unsigned int v3 = 0;
    goto LABEL_15;
  }
  LODWORD(v4) = 0;
  unsigned int v3 = 0;
  while (v3 < *(_DWORD *)(a1 + 52))
  {
    id v5 = [*(id *)(a1 + 32) getRWOffsetForClusterEntry:v2];
    BOOL v6 = *(void **)(a1 + 32);
    id v7 = [(FATBlock *)v26 data];
    id v8 = objc_msgSend(v6, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v7, "mutableBytes"), v5);

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_19;
    }
    unsigned int v9 = (char *)((unsigned char *)[*(id *)(a1 + 32) getOffsetForClusterEntry:v2] - v5);
    if ((uint64_t)v9 < [*(id *)(a1 + 32) rwSize])
    {
      while (1)
      {
        if (([*(id *)(a1 + 32) isEOFCluster:v4] & 1) != 0
          || v3 >= *(_DWORD *)(a1 + 52))
        {
          goto LABEL_14;
        }
        id v10 = [(FATBlock *)v26 data];
        uint64_t v11 = &v9[(void)[v10 mutableBytes]];

        id v12 = [*(id *)(a1 + 32) fsOps];
        id v4 = [v12 getNextClusterFromEntryForCluster:v2 entry:v11];

        unsigned int v13 = [*(id *)(a1 + 32) fsOps];
        uint64_t v14 = [*(id *)(a1 + 32) fsInfo];
        [v14 FATMask];
        [v13 setFatEntryForCluster:v2 entry:v11 withValue:0];

        uint64_t v15 = [*(id *)(a1 + 32) fsInfo];
        objc_msgSend(v15, "setFreeClusters:", (char *)objc_msgSend(v15, "freeClusters") + 1);

        uint64_t v16 = [*(id *)(a1 + 32) fsInfo];
        if ([v16 firstFreeCluster] > v2) {
          break;
        }
        uint64_t v17 = [*(id *)(a1 + 32) fsInfo];
        unsigned int v18 = [v17 firstFreeCluster];

        if (!v18) {
          goto LABEL_12;
        }
LABEL_13:
        unsigned int v9 = (char *)((unsigned char *)[*(id *)(a1 + 32) getOffsetForClusterEntry:v4] - v5);
        ++v3;
        id v2 = v4;
        if ((uint64_t)v9 >= [*(id *)(a1 + 32) rwSize]) {
          goto LABEL_14;
        }
      }

LABEL_12:
      uint64_t v19 = [*(id *)(a1 + 32) fsInfo];
      [v19 setFirstFreeCluster:v2];

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v20 = *(void **)(a1 + 32);
    id v21 = [(FATBlock *)v26 data];
    id v22 = objc_msgSend(v20, "syncMetaWriteToFATs:startingAt:", objc_msgSend(v21, "mutableBytes"), v5);

    if ([*(id *)(a1 + 32) isEOFCluster:v4]) {
      break;
    }
  }
LABEL_15:
  int v23 = *(_DWORD *)(a1 + 52);
  uint64_t v24 = *(void *)(a1 + 40);
  if (v3 == v23)
  {
    (*(void (**)(uint64_t, void))(v24 + 16))(v24, 0);
  }
  else
  {
    id v25 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);
  }
LABEL_19:
}

void sub_10001C2AC(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C33C;
  v3[3] = &unk_10004CF30;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 fatIterator:v1 replyHandler:v3];
}

uint64_t sub_10001C33C(uint64_t a1)
{
  return 1;
}

void sub_10001C4B0(uint64_t a1)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  id v2 = +[FATItem dynamicCast:*(void *)(a1 + 32)];
  unsigned int v3 = v2;
  if (v2 && [v2 isFat1216RootDir])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if ([*(id *)(a1 + 32) firstCluster])
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) firstCluster];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10001C674;
      v8[3] = &unk_10004CF80;
      id v9 = *(id *)(a1 + 48);
      id v10 = v14;
      uint64_t v11 = v12;
      [v4 fatIterator:v5 replyHandler:v8];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      BOOL v6 = v9;
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 48);
      BOOL v6 = fs_errorForPOSIXError();
      (*(void (**)(uint64_t, void *, void, void))(v7 + 16))(v7, v6, 0, 0);
    }
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

void sub_10001C650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C674(void *a1, uint64_t a2, int a3, int a4)
{
  if (a2)
  {
    (*(void (**)(void))(a1[4] + 16))();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) += a4;
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a3 + a4 - 1;
  }
  return result;
}

void sub_10001C7B4(uint64_t a1)
{
  id v2 = +[FATItem dynamicCast:*(void *)(a1 + 32)];
  unsigned int v3 = v2;
  if (v2 && [v2 isFat1216RootDir])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([*(id *)(a1 + 32) firstCluster])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) firstCluster];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001C8E8;
    v8[3] = &unk_10004CF30;
    id v9 = *(id *)(a1 + 48);
    [v4 fatIterator:v5 replyHandler:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = fs_errorForPOSIXError();
    (*(void (**)(uint64_t, void *, void, void))(v6 + 16))(v6, v7, 0, 0);
  }
}

uint64_t sub_10001C8E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C9AC(uint64_t a1)
{
  id v2 = [FATBlock alloc];
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = [v3 fsOps];
  id v5 = -[FATBlock initWithOffset:andLength:](v2, "initWithOffset:andLength:", objc_msgSend(v3, "getRWOffsetForClusterEntry:", objc_msgSend(v4, "getDirtyBitCluster")), objc_msgSend(*(id *)(a1 + 32), "rwSize"));

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [(FATBlock *)v5 data];
  id v8 = objc_msgSend(v6, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v7, "mutableBytes"), -[FATBlock startOffset](v5, "startOffset"));

  if (v8)
  {
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000306B4();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = [(FATBlock *)v5 data];
    id v11 = [v10 mutableBytes];
    id v12 = *(void **)(a1 + 32);
    int v13 = [v12 fsOps];
    uint64_t v14 = (char *)objc_msgSend(v12, "getOffsetForCluster:inFatBlock:", objc_msgSend(v13, "getDirtyBitCluster"), v5)
        + (void)v11;

    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 32) fsOps];
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, [v16 getDirtyBitValueForEntry:v14]);
  }
}

void sub_10001CC14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fsInfo];
  unsigned int v3 = [v2 type];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) fsInfo];
    unsigned int v5 = [v4 dirtyBitValue];
    int v6 = *(unsigned __int8 *)(a1 + 48);

    if (v5 != v6)
    {
      id v8 = [FATBlock alloc];
      id v9 = *(void **)(a1 + 32);
      id v10 = [v9 fsOps];
      id v11 = -[FATBlock initWithOffset:andLength:](v8, "initWithOffset:andLength:", objc_msgSend(v9, "getRWOffsetForClusterEntry:", objc_msgSend(v10, "getDirtyBitCluster")), objc_msgSend(*(id *)(a1 + 32), "rwSize"));

      id v12 = *(void **)(a1 + 32);
      id v13 = [(FATBlock *)v11 data];
      uint64_t v14 = objc_msgSend(v12, "syncMetaReadFromFAT:startingAt:", objc_msgSend(v13, "mutableBytes"), -[FATBlock startOffset](v11, "startOffset"));

      if (v14)
      {
        uint64_t v15 = fskit_std_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10003079C();
        }
      }
      else
      {
        id v16 = [(FATBlock *)v11 data];
        id v17 = [v16 mutableBytes];
        unsigned int v18 = *(void **)(a1 + 32);
        uint64_t v19 = [v18 fsOps];
        uint64_t v20 = (char *)objc_msgSend(v18, "getOffsetForCluster:inFatBlock:", objc_msgSend(v19, "getDirtyBitCluster"), v11)
            + (void)v17;

        id v21 = [*(id *)(a1 + 32) fsOps];
        [v21 applyDirtyBitValueToEntry:v20 newValue:*(unsigned __int8 *)(a1 + 48)];

        id v22 = *(void **)(a1 + 32);
        id v23 = [(FATBlock *)v11 data];
        uint64_t v14 = objc_msgSend(v22, "syncMetaWriteToFATs:startingAt:", objc_msgSend(v23, "mutableBytes"), -[FATBlock startOffset](v11, "startOffset"));

        if (!v14)
        {
          uint64_t v24 = *(unsigned __int8 *)(a1 + 48);
          id v25 = [*(id *)(a1 + 32) fsInfo];
          [v25 setDirtyBitValue:v24];

          goto LABEL_3;
        }
        uint64_t v15 = fskit_std_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100030728();
        }
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      return;
    }
  }
LABEL_3:
  id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v7();
}

void sub_10001D20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001D240(uint64_t result, int a2, int a3)
{
  if (a3)
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
  }
  return result;
}

void sub_10001D340(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t format(uint64_t a1, int *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v11 = a3 && *a3 && a3[1] && a3[2] != 0;
  uint64_t v12 = *((void *)a2 + 1);
  uint64_t v13 = *((void *)a2 + 6);
  int v215 = 0;
  int v14 = *a2;
  __int16 v15 = *((_WORD *)a2 + 34);
  uint64_t v16 = *((void *)a2 + 20);
  v214.time_t tv_sec = 0;
  *(void *)&v214.tv_usec = 0;
  int v213 = 0;
  long long v211 = 0u;
  long long v212 = 0u;
  *(_OWORD *)size = 0u;
  long long v210 = 0u;
  unsigned int v208 = 0;
  time_t tv_sec = 0;
  if (v11) {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a3[1])("Format device: Checking parameters", 10, 10, &v215, *a3);
  }
  int v17 = v15 & 0xF000;
  if (v17 != 0x2000)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 6, (uint64_t)"warning: %s is not a character device\n", a4, a5, a6, a7, a8, v12);
  }
  int v213 = 0;
  long long v211 = 0u;
  long long v212 = 0u;
  *(_OWORD *)size = 0u;
  long long v210 = 0u;
  unsigned int v18 = *(char **)(a1 + 24);
  if (v18)
  {
    __n128 v19 = getstdfmt(v18, (uint64_t)size);
    if (v20)
    {
LABEL_39:
      unsigned int v33 = 0;
      goto LABEL_40;
    }
    HIDWORD(v211) = DWORD1(v210);
    LODWORD(v212) = HIDWORD(v210);
    DWORD1(v210) = 0;
    HIDWORD(v210) = 0;
  }
  int v21 = *(_DWORD *)(a1 + 60);
  if (v21) {
    DWORD1(v211) = *(_DWORD *)(a1 + 60);
  }
  int v22 = *(_DWORD *)(a1 + 92);
  if (v22) {
    LODWORD(v211) = *(_DWORD *)(a1 + 92);
  }
  if (v11) {
    ++v215;
  }
  int v23 = *(_DWORD *)(a1 + 40);
  if (v23) {
    LODWORD(size[0]) = *(_DWORD *)(a1 + 40);
  }
  int v24 = *(_DWORD *)(a1 + 88);
  if (v24) {
    HIDWORD(v211) = *(_DWORD *)(a1 + 88);
  }
  int v25 = *(_DWORD *)(a1 + 112);
  if (v25) {
    DWORD2(v211) = *(_DWORD *)(a1 + 80);
  }
  if (!*(void *)(a1 + 24) && (!v21 || !v22 || !v23 || !v24 || !v25))
  {
    long long v26 = *((_OWORD *)a2 + 11);
    long long v226 = *((_OWORD *)a2 + 10);
    long long v227 = v26;
    long long v228 = *((_OWORD *)a2 + 12);
    long long v27 = *((_OWORD *)a2 + 7);
    long long v222 = *((_OWORD *)a2 + 6);
    long long v223 = v27;
    long long v28 = *((_OWORD *)a2 + 9);
    long long v224 = *((_OWORD *)a2 + 8);
    long long v225 = v28;
    long long v29 = *((_OWORD *)a2 + 3);
    long long v218 = *((_OWORD *)a2 + 2);
    long long v219 = v29;
    long long v30 = *((_OWORD *)a2 + 5);
    long long v220 = *((_OWORD *)a2 + 4);
    long long v221 = v30;
    long long v31 = *((_OWORD *)a2 + 1);
    *(_OWORD *)__str = *(_OWORD *)a2;
    long long v217 = v31;
    if (getdiskinfo((uint64_t)__str, v25, (unsigned int *)size)) {
      goto LABEL_39;
    }
  }
  if (v11) {
    ++v215;
  }
  if ((size[0] & (LODWORD(size[0]) - 1)) != 0)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    uint64_t v187 = LODWORD(size[0]);
    long long v32 = "bytes/sector (%u) is not a power of 2";
LABEL_38:
    newfs_print((uint64_t)__str, 3, (uint64_t)v32, a4, a5, a6, a7, a8, v187);
    goto LABEL_39;
  }
  if (LODWORD(size[0]) <= 0x7F)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 3, (uint64_t)"bytes/sector (%u) is too small; minimum is %u",
      a4,
      a5,
      a6,
      a7,
      a8,
      LODWORD(size[0]));
    goto LABEL_39;
  }
  if (LODWORD(size[0]) > 0x1000)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 3, (uint64_t)"bytes/sector (%u) is too large; maximum is %u",
      a4,
      a5,
      a6,
      a7,
      a8,
      LODWORD(size[0]));
    goto LABEL_39;
  }
  uint64_t v37 = *(unsigned int *)(a1 + 96);
  if (v37)
  {
    uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v37);
    v38.i16[0] = vaddlv_u8(v38);
    if (v38.i32[0] >= 2u)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"physical bytes/sector (%u) is not a power of 2", a4, a5, a6, a7, a8, v37);
      goto LABEL_39;
    }
  }
  if (v11) {
    ++v215;
  }
  if (v37)
  {
    if (v37 < LODWORD(size[0]))
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"physical bytes/sector (%u) is less than logical bytes/sector (%u)", a4, a5, a6, a7, a8, v37);
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v39 = a2[4];
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    if (v39 == -1)
    {
      newfs_print((uint64_t)__str, 6, (uint64_t)"Physical block size wasn't initialized, because of ioctl(DKIOCGETPHYSICALBLOCKSIZE) not being supported\n", a4, a5, a6, a7, a8, v187);
      LODWORD(v39) = size[0];
    }
    else
    {
      newfs_print((uint64_t)__str, 6, (uint64_t)"%u bytes per physical sector\n", a4, a5, a6, a7, a8, v39);
    }
    *(_DWORD *)(a1 + 96) = v39;
  }
  if (v11) {
    ++v215;
  }
  unsigned int v40 = *(_DWORD *)(a1 + 32);
  unsigned int v208 = v40;
  if (v40 == 32)
  {
    if (*(_DWORD *)(a1 + 56))
    {
      uint64_t v41 = 101;
LABEL_71:
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"-%c is not a legal FAT%s option", a4, a5, a6, a7, a8, v41);
      goto LABEL_39;
    }
    goto LABEL_75;
  }
  if (!v40)
  {
    if (*(void *)(a1 + 24))
    {
      unsigned int v208 = 12;
      goto LABEL_67;
    }
    if (*(_DWORD *)(a1 + 56) || !*(_DWORD *)(a1 + 64) && !*(_DWORD *)(a1 + 68)) {
      goto LABEL_67;
    }
    unsigned int v208 = 32;
LABEL_75:
    if (*(void *)(a1 + 24)) {
      LODWORD(v210) = 0;
    }
    goto LABEL_77;
  }
LABEL_67:
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v41 = 105;
    goto LABEL_71;
  }
  if (*(_DWORD *)(a1 + 68))
  {
    uint64_t v41 = 107;
    goto LABEL_71;
  }
LABEL_77:
  uint64_t v42 = *(unsigned int *)(a1 + 48);
  if (v42)
  {
    if ((v42 & (v42 - 1)) != 0)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"block size (%u) is not a power of 2", a4, a5, a6, a7, a8, v42);
      goto LABEL_39;
    }
    if (v42 < LODWORD(size[0]))
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"block size (%u) is too small; minimum is %u", a4, a5, a6, a7, a8, v42);
      goto LABEL_39;
    }
    if (v42 > LODWORD(size[0]) << 7)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"block size (%u) is too large; maximum is %u", a4, a5, a6, a7, a8, v42);
      goto LABEL_39;
    }
    HIDWORD(size[0]) = v42 / LODWORD(size[0]);
  }
  uint64_t v43 = *(unsigned int *)(a1 + 52);
  if (v43)
  {
    if ((v43 & (v43 - 1)) != 0)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"sectors/cluster (%u) is not a power of 2", a4, a5, a6, a7, a8, v43);
      goto LABEL_39;
    }
    HIDWORD(size[0]) = *(_DWORD *)(a1 + 52);
  }
  if (*(_DWORD *)(a1 + 84)) {
    LODWORD(size[1]) = *(_DWORD *)(a1 + 84);
  }
  if (v11) {
    ++v215;
  }
  uint64_t v44 = *(unsigned int *)(a1 + 76);
  if (v44)
  {
    if (v44 >= 0x11)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"number of FATs (%u) is too large; maximum is %u",
        a4,
        a5,
        a6,
        a7,
        a8,
        v44);
      LODWORD(v44) = *(_DWORD *)(a1 + 76);
    }
    HIDWORD(size[1]) = v44;
  }
  if (*(_DWORD *)(a1 + 56)) {
    LODWORD(v210) = *(_DWORD *)(a1 + 56);
  }
  if (*(_DWORD *)(a1 + 108))
  {
    uint64_t v45 = *(unsigned int *)(a1 + 72);
    if (v45 <= 0xEF)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"illegal media descriptor (%#x)", a4, a5, a6, a7, a8, v45);
      goto LABEL_39;
    }
    DWORD2(v210) = *(_DWORD *)(a1 + 72);
  }
  if (*(_DWORD *)(a1 + 44)) {
    LODWORD(v212) = *(_DWORD *)(a1 + 44);
  }
  if (*(_DWORD *)(a1 + 64)) {
    DWORD2(v212) = *(_DWORD *)(a1 + 64);
  }
  if (*(_DWORD *)(a1 + 68)) {
    HIDWORD(v212) = *(_DWORD *)(a1 + 68);
  }
  uint64_t v46 = *(void *)a1;
  if (*(void *)a1)
  {
    if (v17 != 0x8000
      || v16 % LODWORD(size[0])
      || v16 < LODWORD(size[0])
      || v16 > (0xFFFF * LODWORD(size[0])))
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"%s: inappropriate file type or format", a4, a5, a6, a7, a8, v46);
      goto LABEL_39;
    }
    unint64_t v47 = v16 / (unint64_t)LODWORD(size[0]);
  }
  else
  {
    LODWORD(v47) = 1;
    uint64_t v46 = v13;
  }
  if (!HIDWORD(size[1])) {
    HIDWORD(size[1]) = 2;
  }
  if (v11)
  {
    ++v215;
    sd_card_set_defaults(v12, &v208, size);
    ++v215;
  }
  else
  {
    sd_card_set_defaults(v12, &v208, size);
  }
  unsigned int v48 = HIDWORD(size[0]);
  if (!HIDWORD(size[0]))
  {
    unint64_t v53 = HIDWORD(v211) * (unint64_t)LODWORD(size[0]);
    unint64_t v54 = v53 >> 10;
    switch((__PAIR64__(v208, v208) >> 2))
    {
      case 0u:
        if (LODWORD(size[0]) == 512 && HIDWORD(v211) <= 0x20D0)
        {
          unsigned int v208 = 12;
LABEL_150:
          if (LODWORD(size[1])) {
            int v56 = size[1];
          }
          else {
            int v56 = v47;
          }
          unsigned int v57 = v210;
          if (!v210) {
            unsigned int v57 = 512;
          }
          if (v57 % (LODWORD(size[0]) >> 5)) {
            int v58 = v57 / (LODWORD(size[0]) >> 5) + 1;
          }
          else {
            int v58 = v57 / (LODWORD(size[0]) >> 5);
          }
          unsigned int v59 = HIDWORD(size[1]) + HIDWORD(size[1]) * (0x2FE5u / (2 * LODWORD(size[0]))) + v58;
          unsigned int v60 = size[0];
          do
          {
            unsigned int v48 = v60 / LODWORD(size[0]);
            uint64_t v49 = 12;
            if (v56 + 4085 * (v60 / LODWORD(size[0])) + v59 >= HIDWORD(v211)) {
              break;
            }
            BOOL v134 = v60 > 0x4000;
            v60 *= 2;
          }
          while (!v134);
LABEL_180:
          HIDWORD(size[0]) = v48;
          if (v48) {
            goto LABEL_181;
          }
          goto LABEL_199;
        }
        if (LODWORD(size[0]) != 512 && HIDWORD(v211) <= 0x1068)
        {
          unsigned int v208 = 12;
LABEL_149:
          if (LODWORD(size[0]) > 0x8000)
          {
            uint64_t v49 = 12;
LABEL_199:
            *(_OWORD *)__str = newfs_ctx;
            *(void *)&long long v217 = qword_1000564B8;
            newfs_print((uint64_t)__str, 3, (uint64_t)"FAT%d is impossible with %u sectors", a4, a5, a6, a7, a8, v49);
            goto LABEL_39;
          }
          goto LABEL_150;
        }
        if (v53 > 0x200003FF)
        {
          unsigned int v208 = 32;
LABEL_172:
          unsigned int v66 = 0;
          do
          {
            unsigned int v67 = v66;
            unint64_t v68 = *((void *)&fat32Sizes + 2 * v66++);
          }
          while (v54 > v68);
          unsigned int v64 = *((_DWORD *)&fat32Sizes + 4 * v67 + 2);
          if (v64)
          {
            uint64_t v49 = 32;
            goto LABEL_176;
          }
          *(_OWORD *)__str = newfs_ctx;
          *(void *)&long long v217 = qword_1000564B8;
          uint64_t v65 = 32;
        }
        else
        {
          unsigned int v208 = 16;
LABEL_166:
          unsigned int v61 = 0;
          do
          {
            unsigned int v62 = v61;
            unint64_t v63 = *((void *)&fat16Sizes + 2 * v61++);
          }
          while (v54 > v63);
          unsigned int v64 = *((_DWORD *)&fat16Sizes + 4 * v62 + 2);
          if (v64)
          {
            uint64_t v49 = 16;
LABEL_176:
            if (v64 <= LODWORD(size[0])) {
              unsigned int v69 = size[0];
            }
            else {
              unsigned int v69 = v64;
            }
            unsigned int v48 = v69 / LODWORD(size[0]);
            goto LABEL_180;
          }
          *(_OWORD *)__str = newfs_ctx;
          *(void *)&long long v217 = qword_1000564B8;
          uint64_t v65 = 16;
        }
        newfs_print((uint64_t)__str, 3, (uint64_t)"FAT%d is impossible for disk size of %lluKiB", a4, a5, a6, a7, a8, v65);
        goto LABEL_39;
      case 3u:
        goto LABEL_149;
      case 4u:
        goto LABEL_166;
      case 8u:
        goto LABEL_172;
      default:
        *(_OWORD *)__str = newfs_ctx;
        *(void *)&long long v217 = qword_1000564B8;
        newfs_print((uint64_t)__str, 3, (uint64_t)"Invalid FAT type: %d", a4, a5, a6, a7, a8, v208);
        goto LABEL_39;
    }
  }
  LODWORD(v49) = v208;
  if (!v208)
  {
    int v50 = size[1];
    if (!LODWORD(size[1])) {
      int v50 = v47;
    }
    if (v210) {
      unsigned int v51 = v210;
    }
    else {
      unsigned int v51 = 512;
    }
    if (v51 % (LODWORD(size[0]) >> 5)) {
      uint64_t v52 = v51 / (LODWORD(size[0]) >> 5) + 1;
    }
    else {
      uint64_t v52 = v51 / (LODWORD(size[0]) >> 5);
    }
    if (HIDWORD(size[1])
       + HIDWORD(size[1]) * (0x2FE5u / (4 * LODWORD(size[0])))
       + v50
       + (unint64_t)(4085 * HIDWORD(size[0]))
       + v52 <= HIDWORD(v211))
    {
      if (0x1FFECu / LODWORD(size[0]) * LODWORD(size[0]) == 131052) {
        unsigned int v55 = 0x1FFECu / LODWORD(size[0]);
      }
      else {
        unsigned int v55 = 0x1FFECu / LODWORD(size[0]) + 1;
      }
      if (v50 + v55 * HIDWORD(size[1]) + (unint64_t)(65525 * HIDWORD(size[0])) + v52 <= HIDWORD(v211)) {
        LODWORD(v49) = 32;
      }
      else {
        LODWORD(v49) = 16;
      }
    }
    else
    {
      LODWORD(v49) = 12;
    }
    unsigned int v208 = v49;
  }
LABEL_181:
  if (v11) {
    v215 += 3;
  }
  unsigned int v70 = v47;
  if (v49 == 32)
  {
    unsigned int v71 = DWORD2(v212);
    if (DWORD2(v212))
    {
      unsigned int v72 = HIDWORD(v212);
    }
    else
    {
      if (v47 == 0xFFFF || (unsigned int v72 = HIDWORD(v212), v47 == HIDWORD(v212)))
      {
        *(_OWORD *)__str = newfs_ctx;
        *(void *)&long long v217 = qword_1000564B8;
        long long v32 = "no room for info sector";
        goto LABEL_38;
      }
      DWORD2(v212) = v47;
      unsigned int v71 = v47;
    }
    if (v47 > v71 || v71 == 0xFFFF) {
      unsigned int v74 = v47;
    }
    else {
      unsigned int v74 = v71 + 1;
    }
    if (v72 != 0xFFFF)
    {
      if (v72)
      {
        if (v72 == v71)
        {
          *(_OWORD *)__str = newfs_ctx;
          *(void *)&long long v217 = qword_1000564B8;
          long long v32 = "backup sector would overwrite info sector";
          goto LABEL_38;
        }
      }
      else
      {
        if (v74 == 0xFFFF)
        {
          *(_OWORD *)__str = newfs_ctx;
          *(void *)&long long v217 = qword_1000564B8;
          long long v32 = "no room for backup sector";
          goto LABEL_38;
        }
        if (v74 <= 6) {
          unsigned int v72 = 6;
        }
        else {
          unsigned int v72 = v74;
        }
        HIDWORD(v212) = v72;
      }
    }
    if (v74 > v72 || v72 == 0xFFFF) {
      unsigned int v70 = v74;
    }
    else {
      unsigned int v70 = v72 + 1;
    }
  }
  int v76 = size[1];
  if (LODWORD(size[1]))
  {
    if (LODWORD(size[1]) < v70)
    {
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      long long v32 = "too few reserved sectors";
      goto LABEL_38;
    }
  }
  else
  {
    if (v70 <= 0x20) {
      int v76 = 32;
    }
    else {
      int v76 = v70;
    }
    if (v49 != 32) {
      int v76 = v70;
    }
    LODWORD(size[1]) = v76;
  }
  unsigned int v77 = v210;
  if (v49 != 32 && !v210)
  {
    unsigned int v77 = 512;
    LODWORD(v210) = 512;
  }
  unsigned int v78 = v212;
  if (v77 % (LODWORD(size[0]) >> 5)) {
    int v79 = v77 / (LODWORD(size[0]) >> 5) + 1;
  }
  else {
    int v79 = v77 / (LODWORD(size[0]) >> 5);
  }
  if (v49 != 32 && v212 >= 0x10000)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    long long v32 = "too many sectors/FAT for FAT12/16";
    goto LABEL_38;
  }
  uint64_t v80 = (v76 + v79);
  if (v212 <= 1) {
    unsigned int v81 = 1;
  }
  else {
    unsigned int v81 = v212;
  }
  if (v80 + HIDWORD(size[1]) * (unint64_t)v81 > HIDWORD(v211))
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    long long v32 = "meta data exceeds file system size";
    goto LABEL_38;
  }
  int v198 = v79;
  unsigned int v200 = v47;
  int v201 = v80 + HIDWORD(size[1]) * v81;
  uint64_t v82 = (HIDWORD(v211) - v201);
  unsigned int v83 = 2 * LODWORD(size[0]);
  unint64_t v84 = v49 >> 2;
  unint64_t v85 = 2 * (unint64_t)LODWORD(size[0]) * v82 / (HIDWORD(size[1]) * v84 + 2 * LODWORD(size[0]) * v48);
  if (v49 == 16) {
    int v86 = 65524;
  }
  else {
    int v86 = 268435445;
  }
  if (v49 == 12) {
    unsigned int v87 = 4084;
  }
  else {
    unsigned int v87 = v86;
  }
  unsigned int v203 = v87;
  if (v87 <= v85)
  {
    int v90 = v86 | 2;
    if (v49 == 12) {
      int v90 = 4086;
    }
    unsigned int v91 = v90 * (int)v84 % v83;
    unsigned int v88 = (v87 | 2) * v84;
    if (v91) {
      goto LABEL_244;
    }
LABEL_248:
    unsigned int v89 = v88 / v83;
    goto LABEL_249;
  }
  unsigned int v88 = (v85 + 2) * v84;
  if (!(v88 % v83)) {
    goto LABEL_248;
  }
LABEL_244:
  unsigned int v89 = v88 / v83 + 1;
LABEL_249:
  if (!v212)
  {
    LODWORD(v212) = v89;
    unsigned int v92 = *(_DWORD *)(a1 + 96);
    unsigned int v78 = v89;
    if (v92 > LODWORD(size[0]))
    {
      unsigned int v78 = v89;
      if (v89 % (v92 / LODWORD(size[0])))
      {
        unsigned int v78 = v92 / LODWORD(size[0]) + v89 - v89 % (v92 / LODWORD(size[0]));
        LODWORD(v212) = v78;
      }
    }
    v201 += (v78 - 1) * HIDWORD(size[1]);
    LODWORD(v82) = HIDWORD(v211) - v201;
  }
  uint64_t v93 = (2 * LODWORD(size[0]) * (unint64_t)v78 / v84) - 2;
  uint64_t v94 = v82 / v48;
  if (v94 > v93)
  {
    uint64_t v95 = v80 + v78 * HIDWORD(size[1]) + v93 * v48;
    HIDWORD(v211) = v95;
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 6, (uint64_t)"warning: sectors/FAT limits sectors to %u, clusters to %u\n", a4, a5, a6, a7, a8, v95);
    unsigned int v78 = v212;
    uint64_t v94 = v93;
  }
  if (v78 < v89)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 6, (uint64_t)"warning: sectors/FAT limits file system to %u clusters\n", a4, a5, a6, a7, a8, v94);
  }
  if (v49 == 16) {
    unsigned int v96 = 4085;
  }
  else {
    unsigned int v96 = 65525;
  }
  if (v49 == 12) {
    unsigned int v96 = 1;
  }
  if (v94 < v96)
  {
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 3, (uint64_t)"%u clusters too few clusters for FAT%u, need %u", a4, a5, a6, a7, a8, v94);
    goto LABEL_39;
  }
  if (v94 > v203)
  {
    LODWORD(v94) = v203;
    HIDWORD(v211) = v201 + HIDWORD(size[0]) + HIDWORD(size[0]) * v203 - 1;
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 6, (uint64_t)"warning: FAT type limits file system to %u sectors\n", a4, a5, a6, a7, a8, HIDWORD(v211));
  }
  int v195 = v94 - 1;
  *(_OWORD *)__str = newfs_ctx;
  *(void *)&long long v217 = qword_1000564B8;
  newfs_print((uint64_t)__str, 6, (uint64_t)"%s: %u sector%s in %u FAT%u cluster%s (%u bytes/cluster)\n", a4, a5, a6, a7, a8, v12);
  if (!DWORD2(v210))
  {
    if (DWORD2(v211)) {
      int v104 = 248;
    }
    else {
      int v104 = 240;
    }
    DWORD2(v210) = v104;
  }
  if (v49 == 32)
  {
    DWORD1(v212) = 2;
    if (HIDWORD(v211) < 0x10000) {
      DWORD1(v210) = HIDWORD(v211);
    }
    HIDWORD(v210) = 0;
    uint64_t v105 = (long long *)((char *)&v210 + 4);
  }
  else
  {
    uint64_t v105 = &v212;
    if (!HIWORD(HIDWORD(v211)))
    {
      DWORD1(v210) = HIDWORD(v211);
      HIDWORD(v211) = 0;
    }
    HIDWORD(v210) = v212;
  }
  *(_DWORD *)uint64_t v105 = 0;
  if (v11)
  {
    int v215 = 10;
    ((void (*)(const char *, void))a3[2])("Format device: Checking parameters", *a3);
    print_bpb((unsigned int *)size, v106, v107, v108, v109, v110, v111, v112);
    if (*(_DWORD *)(a1 + 100))
    {
      uint64_t v34 = 0;
      long long v35 = off_10004D058;
      unsigned int v33 = 1;
      goto LABEL_42;
    }
    int v215 = 0;
    unsigned int v33 = 1;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a3[1])("Format device: Wiping file system", 10, 1, &v215, *a3);
  }
  else
  {
    print_bpb((unsigned int *)size, v97, v98, v99, v100, v101, v102, v103);
    unsigned int v33 = 0;
    uint64_t v34 = 0;
    if (*(_DWORD *)(a1 + 100)) {
      return v34;
    }
  }
  gettimeofday(&v214, 0);
  time_t tv_sec = v214.tv_sec;
  uint64_t v193 = localtime(&tv_sec);
  __src = malloc_type_malloc(0x20000uLL, 0xA21504EBuLL);
  if (!__src || (__dst = malloc_type_malloc(LODWORD(size[0]), 0xC3DF8074uLL)) == 0)
  {
    uint64_t v122 = __error();
    unint64_t v123 = strerror(*v122);
    *(_OWORD *)__str = newfs_ctx;
    *(void *)&long long v217 = qword_1000564B8;
    newfs_print((uint64_t)__str, 3, (uint64_t)v123, v124, v125, v126, v127, v128, 0);
    goto LABEL_40;
  }
  int v113 = v212;
  if (HIDWORD(v210)) {
    int v113 = HIDWORD(v210);
  }
  int v114 = LODWORD(size[1]) + v113 * HIDWORD(size[1]);
  int v115 = v198;
  if (v49 == 32) {
    int v115 = HIDWORD(size[0]);
  }
  unsigned int v191 = v114;
  int v194 = v114 + v115;
  if (*((void *)&newfs_ctx + 1))
  {
    *(_DWORD *)__str = v14;
    *(_DWORD *)&__str[4] = 0;
    *(void *)&__str[8] = LODWORD(size[0]);
    LODWORD(v217) = 0;
    DWORD1(v217) = v114 + v115;
    uint64_t v116 = (*((uint64_t (**)(uint64_t, char *))&newfs_ctx + 1))(qword_1000564B8, __str);
    if (v116)
    {
      uint64_t v34 = v116;
      *(_OWORD *)__str = newfs_ctx;
      *(void *)&long long v217 = qword_1000564B8;
      newfs_print((uint64_t)__str, 3, (uint64_t)"Encountered errors trying to wipe resource", v117, v118, v119, v120, v121, v188);
      if (v11) {
        goto LABEL_41;
      }
      return v34;
    }
  }
  if (v11)
  {
    int v215 = 1;
    ((void (*)(char *, void))a3[2])(off_10004D058[v33], *a3);
    int v215 = 0;
    ((void (*)(char *, uint64_t, void, int *, void))a3[1])(off_10004D058[++v33], 80, (v194 + 2), &v215, *a3);
  }
  if (!v194)
  {
LABEL_400:
    ++v215;
    uint64_t v181 = ((uint64_t (*)(void, void *, void, void))a3[5])(a3[3], __dst, LODWORD(size[0]), 0);
    if (v181 == -1)
    {
      uint64_t v182 = __error();
      uint64_t v183 = strerror(*v182);
      long long v205 = newfs_ctx;
      uint64_t v206 = qword_1000564B8;
      uint64_t v190 = (uint64_t)v183;
      uint64_t v186 = "%s: write: %s";
      goto LABEL_410;
    }
    if (v181 != LODWORD(size[0]))
    {
      long long v205 = newfs_ctx;
      uint64_t v206 = qword_1000564B8;
      uint64_t v190 = v12;
      uint64_t v186 = "%s: can't write boot sector";
      goto LABEL_410;
    }
    uint64_t v34 = 0;
    ++v215;
    if (!v11) {
      return v34;
    }
    long long v35 = off_10004D058;
LABEL_42:
    ((void (*)(char *, void, __n128))a3[2])(v35[v33], *a3, v19);
    return v34;
  }
  uint64_t v202 = 0;
  unsigned int v204 = 0;
  uint64_t v199 = 0;
  uint64_t v129 = (uint64_t)__src;
  while (1)
  {
    unsigned int v130 = v208;
    int v131 = HIDWORD(v212);
    if (*(void *)a1) {
      BOOL v132 = v208 == 32;
    }
    else {
      BOOL v132 = 0;
    }
    BOOL v134 = !v132 || HIDWORD(v212) == 0xFFFF || v200 > HIDWORD(v212);
    int v136 = v134 || v204 < HIDWORD(v212);
    BOOL v137 = v136 == 0;
    if (v136) {
      int v131 = 0;
    }
    uint64_t v138 = v202;
    if (v137) {
      uint64_t v138 = 0;
    }
    uint64_t v202 = v138;
    if (*(void *)a1 && v204 - v131 < v200)
    {
      uint64_t v139 = ((uint64_t (*)(void, uint64_t, void, uint64_t))a3[4])(a3[3], v129, LODWORD(size[0]), v138);
      if (v139 == -1) {
        goto LABEL_408;
      }
      __int16 v145 = size[0];
      if (v139 != LODWORD(size[0]))
      {
        long long v205 = newfs_ctx;
        uint64_t v206 = qword_1000564B8;
        uint64_t v190 = v46;
        uint64_t v186 = "%s: can't read sector %u";
        goto LABEL_410;
      }
    }
    else
    {
      __int16 v146 = size[0];
      bzero((void *)v129, LODWORD(size[0]));
      __int16 v145 = v146;
    }
    if (!v204 || v130 == 32 && HIDWORD(v212) != 0xFFFF && v204 == HIDWORD(v212))
    {
      *(_WORD *)(v129 + 11) = v145;
      __int16 v147 = size[1];
      *(unsigned char *)(v129 + 13) = BYTE4(size[0]);
      *(_WORD *)(v129 + 14) = v147;
      __int16 v148 = v210;
      *(unsigned char *)(v129 + 16) = BYTE4(size[1]);
      *(_WORD *)(v129 + 17) = v148;
      *(_WORD *)(v129 + 19) = WORD2(v210);
      *(unsigned char *)(v129 + 21) = BYTE8(v210);
      *(_WORD *)(v129 + 22) = WORD6(v210);
      *(_WORD *)(v129 + 24) = v211;
      *(_WORD *)(v129 + 26) = WORD2(v211);
      *(void *)(v129 + 28) = *((void *)&v211 + 1);
      if (v130 == 32)
      {
        __int16 v149 = WORD1(v212);
        *(_WORD *)(v129 + 36) = v212;
        *(_WORD *)(v129 + 38) = v149;
        *(_DWORD *)(v129 + 40) = 0;
        *(_DWORD *)(v129 + 44) = DWORD1(v212);
        *(_WORD *)(v129 + 48) = WORD4(v212);
        *(_WORD *)(v129 + 50) = WORD6(v212);
        uint64_t v150 = 64;
      }
      else
      {
        uint64_t v150 = 36;
      }
      uint64_t v196 = v150;
      uint64_t v151 = v129 + v150;
      *(unsigned char *)uint64_t v151 = v213;
      *(unsigned char *)(v151 + 2) = 41;
      if (*(_DWORD *)(a1 + 104)) {
        int v152 = *(_DWORD *)(a1 + 36);
      }
      else {
        int v152 = (v193->tm_year + (v193->tm_min | (v193->tm_hour << 8)) + 1900) | ((((v214.tv_usec / 10) | (v193->tm_sec << 8))
      }
                                                                                + (((v193->tm_mon << 8) + 256) | v193->tm_mday)) << 16);
      *(_DWORD *)(v151 + 3) = v152;
      if (*(void *)(a1 + 8)) {
        uint64_t v154 = *(char **)(a1 + 8);
      }
      else {
        uint64_t v154 = "NO NAME";
      }
      mklabel(v151 + 7, v154);
      unsigned int v189 = v130;
      BOOL v155 = __str;
      snprintf(__str, 0x400uLL, "FAT%u", v189);
      for (uint64_t i = 0; i != 8; ++i)
      {
        int v157 = *v155;
        if (*v155) {
          ++v155;
        }
        if (v157) {
          char v158 = v157;
        }
        else {
          char v158 = 32;
        }
        *(unsigned char *)(v151 + 18 + i) = v158;
      }
      uint64_t v159 = *(void *)a1;
      if (!*(void *)a1)
      {
        __src[v199] = -21;
        *(unsigned char *)(v129 + 1) = v196 | 0x18;
        *(unsigned char *)(v129 + 2) = -112;
        uint64_t v160 = *(const char **)(a1 + 16);
        if (!v160) {
          uint64_t v160 = "BSD  4.4";
        }
        do
        {
          int v161 = *(unsigned __int8 *)v160;
          if (*v160) {
            ++v160;
          }
          if (v161) {
            char v162 = v161;
          }
          else {
            char v162 = 32;
          }
          *(unsigned char *)(v129 + 3 + v159++) = v162;
        }
        while (v159 != 8);
        uint64_t v163 = v129 + (v196 | 0x1A);
        long long v164 = unk_1000560F0;
        *(_OWORD *)uint64_t v163 = xmmword_1000560E0;
        *(_OWORD *)(v163 + 16) = v164;
        long long v165 = xmmword_100056100;
        long long v166 = unk_100056110;
        long long v167 = xmmword_100056120;
        *(_DWORD *)(v163 + 80) = dword_100056130;
        *(_OWORD *)(v163 + 48) = v166;
        *(_OWORD *)(v163 + 64) = v167;
        *(_OWORD *)(v163 + 32) = v165;
        *(_WORD *)(v129 + 510) = -21931;
      }
      goto LABEL_364;
    }
    if (v130 == 32
      && DWORD2(v212) != 0xFFFF
      && (v204 == DWORD2(v212) || HIDWORD(v212) != 0xFFFF && v204 == DWORD2(v212) + HIDWORD(v212)))
    {
      *(_DWORD *)&__src[v199] = 1096897106;
      *(_DWORD *)(v129 + 484) = 1631679090;
      *(_DWORD *)(v129 + 488) = v195;
      int v153 = DWORD1(v212) + 1;
      *(_WORD *)(v129 + 492) = WORD2(v212) + 1;
      *(unsigned char *)(v129 + 494) = BYTE2(v153);
      *(unsigned char *)(v129 + 495) = HIBYTE(v153);
      *(_WORD *)(v129 + 510) = -21931;
LABEL_392:
      uint64_t v168 = LODWORD(size[0]);
      goto LABEL_393;
    }
    if (v204 < LODWORD(size[1]) || v204 >= v191) {
      goto LABEL_413;
    }
    unsigned int v169 = HIDWORD(v210);
    if (!HIDWORD(v210)) {
      unsigned int v169 = v212;
    }
    if ((v204 - LODWORD(size[1])) % v169)
    {
LABEL_413:
      if (v204 == v191)
      {
        uint64_t v170 = *(unsigned char **)(a1 + 8);
        if (v170)
        {
          if (*v170)
          {
            mklabel(v129, v170);
            *(unsigned char *)(v129 + 11) = 40;
            *(_WORD *)(v129 + 22) = (32 * LOWORD(v193->tm_min)) | (LOWORD(v193->tm_hour) << 11) | (v193->tm_sec >> 1);
            *(_WORD *)(v129 + 24) = v193->tm_mday | ((LOWORD(v193->tm_year) << 9) + 24576) | (32 * LOWORD(v193->tm_mon)
                                                                                            + 32);
          }
        }
      }
      goto LABEL_392;
    }
    __src[v199] = BYTE8(v210);
    if (v130 == 32) {
      int v171 = 3;
    }
    else {
      int v171 = 2;
    }
    unsigned int v172 = v171 * v130;
    if (v171 * v130 <= 0xF) {
      goto LABEL_392;
    }
    unint64_t v173 = 0;
    uint64_t v174 = v172 >> 3;
    uint64x2_t v175 = (uint64x2_t)vdupq_n_s64(v174 - 2);
    do
    {
      int32x2_t v176 = vmovn_s64((int64x2_t)vcgeq_u64(v175, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v173), (int8x16_t)xmmword_10003DA30)));
      if (v176.i8[0])
      {
        if ((~((_BYTE)v173 + 1) & 3) == 0 && v130 == 32) {
          char v178 = 15;
        }
        else {
          char v178 = -1;
        }
        *(unsigned char *)(v129 + v173 + 1) = v178;
      }
      if (v176.i8[4]) {
        *(unsigned char *)(v129 + v173 + 2) = -1;
      }
      v173 += 2;
    }
    while ((v174 & 0x1FFFFFFE) != v173);
LABEL_364:
    uint64_t v168 = LODWORD(size[0]);
    if (!v204)
    {
      memcpy(__dst, __src, LODWORD(size[0]));
      __memset_chk();
    }
LABEL_393:
    v199 += v168;
    if (v199 >= 0x20000) {
      break;
    }
LABEL_396:
    ++v215;
    uint64_t v129 = (uint64_t)&__src[v199];
    if (++v204 == v194)
    {
      if (!v199) {
        goto LABEL_400;
      }
      uint64_t v180 = ((uint64_t (*)(void, unsigned char *, uint64_t, uint64_t))a3[5])(a3[3], __src, v199, v202);
      if (v180 != -1 && v180 == v199) {
        goto LABEL_400;
      }
LABEL_408:
      uint64_t v184 = __error();
      uint64_t v185 = strerror(*v184);
      long long v205 = newfs_ctx;
      uint64_t v206 = qword_1000564B8;
      uint64_t v190 = (uint64_t)v185;
      uint64_t v186 = "%s: %s";
      goto LABEL_410;
    }
  }
  uint64_t v179 = ((uint64_t (*)(void, unsigned char *, uint64_t, uint64_t))a3[5])(a3[3], __src, 0x20000, v202);
  if (v179 == 0x20000)
  {
    uint64_t v199 = 0;
    v202 += 0x20000;
    goto LABEL_396;
  }
  if (v179 == -1) {
    goto LABEL_408;
  }
  long long v205 = newfs_ctx;
  uint64_t v206 = qword_1000564B8;
  uint64_t v190 = v12;
  uint64_t v186 = "%s: can't write sector %u";
LABEL_410:
  newfs_print((uint64_t)&v205, 3, (uint64_t)v186, v140, v141, v142, v143, v144, v190);
LABEL_40:
  uint64_t v34 = 1;
  if (v11)
  {
LABEL_41:
    long long v35 = off_10004D040;
    goto LABEL_42;
  }
  return v34;
}

__n128 getstdfmt(char *__s1, uint64_t a2)
{
  uint64_t v4 = 0;
  while (strcmp(__s1, (&stdfmt)[v4]))
  {
    v4 += 10;
    if (v4 == 100)
    {
      long long v13 = newfs_ctx;
      uint64_t v14 = qword_1000564B8;
      newfs_print((uint64_t)&v13, 3, (uint64_t)"%s: unknown standard format", v5, v6, v7, v8, v9, (uint64_t)__s1);
      return result;
    }
  }
  *(_OWORD *)a2 = *(_OWORD *)&(&stdfmt)[v4 + 1];
  __n128 result = *(__n128 *)&(&stdfmt)[v4 + 3];
  long long v11 = *(_OWORD *)&(&stdfmt)[v4 + 5];
  long long v12 = *(_OWORD *)&(&stdfmt)[v4 + 7];
  *(_DWORD *)(a2 + 64) = (&stdfmt)[v4 + 9];
  *(_OWORD *)(a2 + 32) = v11;
  *(_OWORD *)(a2 + 48) = v12;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t getdiskinfo(uint64_t a1, int a2, unsigned int *a3)
{
  unint64_t v6 = *(void *)(a1 + 24);
  unint64_t v5 = *(void *)(a1 + 32);
  unsigned int v7 = *(_DWORD *)(a1 + 40);
  if (v6 == -1)
  {
    uint64_t v8 = __error();
    uint64_t v9 = strerror(*v8);
    long long v41 = newfs_ctx;
    uint64_t v42 = qword_1000564B8;
    newfs_print((uint64_t)&v41, 6, (uint64_t)"%s: %s: Partition offset wasn't initialized, setting to default value (%llu)", v10, v11, v12, v13, v14, (uint64_t)v9);
    unint64_t v6 = 0;
  }
  if (!a3[11])
  {
    if (v5 != -1) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v16 = __error();
    int v17 = strerror(*v16);
    long long v41 = newfs_ctx;
    uint64_t v42 = qword_1000564B8;
    unint64_t v5 = 0x2000;
    newfs_print((uint64_t)&v41, 6, (uint64_t)"%s: %s: Block count wasn't initialized, setting to default value (%llu)", v18, v19, v20, v21, v22, (uint64_t)v17);
    goto LABEL_10;
  }
  if (a3[9]) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v5 == -1;
  }
  if (v15) {
    goto LABEL_9;
  }
LABEL_10:
  unsigned int v23 = *a3;
  if (!*a3)
  {
    if (v7 != -1)
    {
      unsigned int v23 = 0;
      LODWORD(v24) = a3[11];
      goto LABEL_22;
    }
LABEL_18:
    int v25 = __error();
    long long v26 = strerror(*v25);
    long long v41 = newfs_ctx;
    uint64_t v42 = qword_1000564B8;
    unsigned int v7 = 512;
    newfs_print((uint64_t)&v41, 6, (uint64_t)"%s: %s: Block size wasn't initialized, setting to default value (%u)", v27, v28, v29, v30, v31, (uint64_t)v26);
    unsigned int v23 = *a3;
    LODWORD(v24) = a3[11];
    if (!*a3) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  LODWORD(v24) = a3[11];
  if (!v24 && v7 == -1) {
    goto LABEL_18;
  }
LABEL_19:
  if (v24) {
    goto LABEL_24;
  }
  unint64_t v24 = v5 * v7 / v23;
  if (HIDWORD(v24)) {
    goto LABEL_33;
  }
  a3[11] = v24;
LABEL_22:
  if (v24)
  {
    if (v23) {
      goto LABEL_24;
    }
LABEL_37:
    *a3 = v7;
    unsigned int v23 = v7;
    if (a2) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (HIDWORD(v5))
  {
LABEL_33:
    uint64_t v34 = __error();
    long long v35 = strerror(*v34);
    long long v41 = newfs_ctx;
    uint64_t v42 = qword_1000564B8;
    newfs_print((uint64_t)&v41, 3, (uint64_t)"%s: %s: Drive is too large, the number of blocks is larger than any FAT FS can support", v36, v37, v38, v39, v40, (uint64_t)v35);
    return 1;
  }
  a3[11] = v5;
  if (!v23) {
    goto LABEL_37;
  }
LABEL_24:
  if (!a2) {
LABEL_25:
  }
    a3[10] = v6 / v23;
LABEL_26:
  a3[16] = (v6 != 0) << 7;
  if (!a3[8]) {
    a3[8] = 32;
  }
  if (a3[9]) {
    return 0;
  }
  uint64_t result = 0;
  if (v5 >> 18)
  {
    if (v5 >> 19)
    {
      if (v5 >> 20)
      {
        if (v5 >> 21) {
          int v33 = 255;
        }
        else {
          int v33 = 128;
        }
      }
      else
      {
        int v33 = 54;
      }
    }
    else
    {
      int v33 = 32;
    }
  }
  else
  {
    int v33 = 16;
  }
  a3[9] = v33;
  return result;
}

uint64_t sd_card_set_defaults(uint64_t result, _DWORD *a2, _DWORD *a3)
{
  if (!*a2 && !a3[1] && *a3 == 512)
  {
    uint64_t v5 = result;
    uint64_t result = sd_card_type_for_path(result);
    switch(result)
    {
      case 3:
        long long v13 = newfs_ctx;
        uint64_t v14 = qword_1000564B8;
        return newfs_print((uint64_t)&v13, 6, (uint64_t)"%s: newfs_exfat should be used for SDXC media", v6, v7, v8, v9, v10, v5);
      case 2:
        *a2 = 32;
        break;
      case 1:
        unsigned int v11 = a3[11];
        if (!(v11 >> 14))
        {
          *a2 = 12;
          int v12 = 16;
LABEL_16:
          a3[1] = v12;
          return result;
        }
        if (!(v11 >> 17))
        {
          *a2 = 12;
LABEL_15:
          int v12 = 32;
          goto LABEL_16;
        }
        *a2 = 16;
        if (!(v11 >> 21)) {
          goto LABEL_15;
        }
        break;
      default:
        return result;
    }
    int v12 = 64;
    goto LABEL_16;
  }
  return result;
}

uint64_t print_bpb(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a1;
  long long v60 = newfs_ctx;
  uint64_t v61 = qword_1000564B8;
  newfs_print((uint64_t)&v60, 6, (uint64_t)"bps=%u spc=%u res=%u nft=%u", a4, a5, a6, a7, a8, v9);
  uint64_t v15 = a1[4];
  if (v15)
  {
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" rde=%u", v10, v11, v12, v13, v14, v15);
  }
  uint64_t v16 = a1[5];
  if (v16)
  {
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" sec=%u", v10, v11, v12, v13, v14, v16);
  }
  uint64_t v17 = a1[6];
  long long v60 = newfs_ctx;
  uint64_t v61 = qword_1000564B8;
  newfs_print((uint64_t)&v60, 6, (uint64_t)" mid=%#x", v10, v11, v12, v13, v14, v17);
  uint64_t v23 = a1[7];
  if (v23)
  {
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" spf=%u", v18, v19, v20, v21, v22, v23);
  }
  uint64_t v24 = a1[8];
  long long v60 = newfs_ctx;
  uint64_t v61 = qword_1000564B8;
  newfs_print((uint64_t)&v60, 6, (uint64_t)" spt=%u hds=%u hid=%u drv=0x%02X", v18, v19, v20, v21, v22, v24);
  uint64_t v30 = a1[11];
  if (v30)
  {
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" bsec=%u", v25, v26, v27, v28, v29, v30);
  }
  if (!a1[7])
  {
    uint64_t v31 = a1[12];
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" bspf=%u rdcl=%u", v25, v26, v27, v28, v29, v31);
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" infs=", v32, v33, v34, v35, v36, v58);
    uint64_t v42 = a1[14];
    if (v42 == 0xFFFF) {
      uint64_t v43 = "%#x";
    }
    else {
      uint64_t v43 = "%u";
    }
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)v43, v37, v38, v39, v40, v41, v42);
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)" bkbs=", v44, v45, v46, v47, v48, v59);
    uint64_t v54 = a1[15];
    if (v54 == 0xFFFF) {
      unsigned int v55 = "%#x";
    }
    else {
      unsigned int v55 = "%u";
    }
    long long v60 = newfs_ctx;
    uint64_t v61 = qword_1000564B8;
    newfs_print((uint64_t)&v60, 6, (uint64_t)v55, v49, v50, v51, v52, v53, v54);
  }
  long long v60 = newfs_ctx;
  uint64_t v61 = qword_1000564B8;
  return newfs_print((uint64_t)&v60, 6, (uint64_t)"\n", v25, v26, v27, v28, v29, v57);
}

uint64_t mklabel(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = 0;
  do
  {
    __darwin_ct_rune_t v5 = (char)*a2;
    if (*a2)
    {
      ++a2;
      uint64_t result = __toupper(v5);
    }
    else
    {
      uint64_t result = 32;
    }
    if (result == -27 && v4 == 0) {
      char v8 = 5;
    }
    else {
      char v8 = result;
    }
    *(unsigned char *)(a1 + v4++) = v8;
  }
  while (v4 != 11);
  return result;
}

char *setstr(char *result, unsigned char *a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    int v3 = *a2;
    if (*a2) {
      ++a2;
    }
    if (v3) {
      char v4 = v3;
    }
    else {
      char v4 = 32;
    }
    *result++ = v4;
  }
  return result;
}

uint64_t sd_card_type_for_path(uint64_t a1)
{
  if (!strncmp((const char *)a1, "/dev/", 5uLL))
  {
    int v4 = *(unsigned __int8 *)(a1 + 5);
    uint64_t v3 = a1 + 5;
    __darwin_ct_rune_t v5 = (const char *)(v4 == 114 ? v3 + 1 : v3);
    CFDictionaryRef v6 = IOBSDNameMatching(kIOMainPortDefault, 0, v5);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      io_object_t v8 = MatchingService;
      CFDictionaryRef v9 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"Card Characteristics", kCFAllocatorDefault, 3u);
      if (!v9)
      {
        uint64_t v2 = 0;
        goto LABEL_16;
      }
      CFDictionaryRef v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFDictionaryGetTypeID())
      {
        Value = CFDictionaryGetValue(v10, @"Card Type");
        uint64_t v2 = (uint64_t)Value;
        if (!Value)
        {
LABEL_14:
          CFRelease(v10);
LABEL_16:
          IOObjectRelease(v8);
          return v2;
        }
        CFTypeID v13 = CFGetTypeID(Value);
        if (v13 == CFStringGetTypeID())
        {
          if (CFEqual((CFTypeRef)v2, @"SDSC"))
          {
            uint64_t v2 = 1;
          }
          else if (CFEqual((CFTypeRef)v2, @"SDHC"))
          {
            uint64_t v2 = 2;
          }
          else if (CFEqual((CFTypeRef)v2, @"SDXC"))
          {
            uint64_t v2 = 3;
          }
          else
          {
            uint64_t v2 = 0;
          }
          goto LABEL_14;
        }
      }
      uint64_t v2 = 0;
      goto LABEL_14;
    }
  }
  return 0;
}

uint64_t argtou(const char *a1, unsigned int a2, unsigned int a3)
{
  __endptr = 0;
  *__error() = 0;
  unint64_t v6 = strtoul(a1, &__endptr, 0);
  if (*__error() || !*a1 || (!*__endptr ? (BOOL v13 = v6 >= a2) : (BOOL v13 = 0), v13 ? (v14 = v6 > a3) : (v14 = 1), v14))
  {
    long long v15 = newfs_ctx;
    uint64_t v16 = qword_1000564B8;
    newfs_print((uint64_t)&v15, 3, (uint64_t)"%s: bad %s", v7, v8, v9, v10, v11, (uint64_t)a1);
    return 0xFFFFFFFFLL;
  }
  return v6;
}

BOOL oklabel(uint64_t a1)
{
  uint64_t v2 = 0;
  do
  {
    unsigned int v3 = *(unsigned __int8 *)(a1 + v2);
    if (v2) {
      unsigned int v4 = 32;
    }
    else {
      unsigned int v4 = 33;
    }
    if (v4 > v3) {
      break;
    }
    BOOL v5 = memchr("\"*+,./:;<=>?[\\]|", *(unsigned __int8 *)(a1 + v2), 0x11uLL) || v2 == 11;
    ++v2;
  }
  while (!v5);
  return v3 == 0;
}

void errexit(char *a1, ...)
{
  va_start(va, a1);
  vfprintf(__stderrp, a1, va);
  exit(8);
}

uint64_t pfatal(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_10001F894(1, a1, &a9);
}

uint64_t vpfatal(uint64_t a1, const char *a2, va_list a3)
{
  return sub_10001F894(1, a2, a3);
}

uint64_t pwarn(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_10001F894(0, a1, &a9);
}

uint64_t vpwarn(uint64_t a1, const char *a2, va_list a3)
{
  return sub_10001F894(0, a2, a3);
}

uint64_t sub_10001F788(char a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  return pfatal("%s (%s)\n", v3, v4, v5, v6, v7, v8, v9, a1);
}

uint64_t perr(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return vperr((uint64_t)a1, a1, &a9);
}

uint64_t vperr(uint64_t a1, const char *a2, va_list a3)
{
  if (fsck_preen())
  {
    uint64_t v5 = __stderrp;
    uint64_t v6 = (const char *)fsck_dev();
    fprintf(v5, "%s: ", v6);
  }
  uint64_t result = fsck_quiet();
  if ((result & 1) == 0)
  {
    uint64_t v8 = __stderrp;
    return vfprintf(v8, a2, a3);
  }
  return result;
}

uint64_t sub_10001F894(int a1, const char *a2, va_list a3)
{
  if (!a1 && fsck_preen())
  {
    uint64_t v6 = (const char *)fsck_dev();
    printf("%s: ", v6);
  }
  uint64_t result = fsck_quiet();
  if ((result & 1) == 0) {
    uint64_t result = vprintf(a2, a3);
  }
  if (a1)
  {
    if (fsck_preen()) {
      putchar(10);
    }
    uint64_t result = fsck_preen();
    if (result)
    {
      uint64_t v8 = (const char *)fsck_dev();
      printf("%s: UNEXPECTED INCONSISTENCY; RUN %s MANUALLY.\n", v8, __progname);
      exit(8);
    }
  }
  return result;
}

uint64_t vprint(uint64_t result, int a2, char *a3, va_list a4)
{
  switch(a2)
  {
    case 2:
      return sub_10001F894(1, a3, a4);
    case 3:
      return vperr(result, a3, a4);
    case 6:
      return vprintf(a3, a4);
  }
  return result;
}

uint64_t fsck_print(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))result)(*(void *)(result + 16), a2, a3, &a9);
  }
  return result;
}

uint64_t fsck_ask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(a1 + 8)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 8))(*(void *)(a1 + 16), a2, a3, &a9);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_10001FD00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001FD44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001FD54(uint64_t a1)
{
}

uint64_t sub_10001FD5C(uint64_t a1, void *a2, int a3, int a4)
{
  id v8 = a2;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else if (a4)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void *)(v11 + 24);
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) - v12;
    int v14 = *(_DWORD *)(a1 + 64);
    unint64_t v15 = (v14 * a4);
    if (v13 + 32 > v15)
    {
      uint64_t v9 = 0;
      *(void *)(v11 + 24) = v12 + v15;
      goto LABEL_4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13 + (v14 * a3);
  }
  uint64_t v9 = 1;
LABEL_4:

  return v9;
}

void sub_10002000C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fsck_set_context_properties(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)&fsck_ctx = result;
  *((void *)&fsck_ctx + 1) = a2;
  qword_100056470 = a3;
  dword_1000564A0 = -1;
  return result;
}

uint64_t fsck_set_alwaysyes(uint64_t result)
{
  dword_10005647C = result;
  return result;
}

BOOL fsck_alwaysyes()
{
  return dword_10005647C != 0;
}

uint64_t fsck_set_alwaysno(uint64_t result)
{
  fsck_state = result;
  return result;
}

BOOL fsck_alwaysno()
{
  return fsck_state != 0;
}

uint64_t fsck_set_preen(uint64_t result)
{
  dword_100056480 = result;
  return result;
}

BOOL fsck_preen()
{
  return dword_100056480 != 0;
}

uint64_t fsck_set_quick(uint64_t result)
{
  dword_100056484 = result;
  return result;
}

BOOL fsck_quick()
{
  return dword_100056484 != 0;
}

uint64_t fsck_set_quiet(uint64_t result)
{
  dword_100056488 = result;
  return result;
}

BOOL fsck_quiet()
{
  return dword_100056488 != 0;
}

uint64_t fsck_set_rdonly(uint64_t result)
{
  dword_10005648C = result;
  return result;
}

BOOL fsck_rdonly()
{
  return dword_10005648C != 0;
}

uint64_t fsck_set_maxmem(uint64_t result)
{
  qword_100056490 = result;
  return result;
}

uint64_t fsck_maxmem()
{
  return qword_100056490;
}

uint64_t fsck_set_dev(uint64_t result)
{
  qword_100056498 = result;
  return result;
}

uint64_t fsck_dev()
{
  return qword_100056498;
}

uint64_t fsck_set_fd(uint64_t result)
{
  dword_1000564A0 = result;
  return result;
}

uint64_t fsck_fd()
{
  return dword_1000564A0;
}

uint64_t newfs_set_context_properties(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)&newfs_ctx = result;
  *((void *)&newfs_ctx + 1) = a2;
  qword_1000564B8 = a3;
  return result;
}

uint64_t newfs_print(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))result)(*(void *)(result + 16), a2, a3, &a9);
  }
  return result;
}

uint64_t newfs_get_wipefs_function_callback()
{
  return *((void *)&newfs_ctx + 1);
}

uint64_t newfs_set_wipefs_function_callback(uint64_t result)
{
  *((void *)&newfs_ctx + 1) = result;
  return result;
}

uint64_t newfs_get_print_function_callback()
{
  return newfs_ctx;
}

uint64_t newfs_set_print_function_callback(uint64_t result)
{
  *(void *)&newfs_ctx = result;
  return result;
}

uint64_t newfs_get_client()
{
  return qword_1000564B8;
}

uint64_t newfs_set_client(uint64_t result)
{
  qword_1000564B8 = result;
  return result;
}

uint64_t *msdosfs_unix2dostime(uint64_t *result, _WORD *a2, _WORD *a3, unsigned char *a4)
{
  uint64_t v4 = *result;
  unsigned int v5 = *result - dword_1000564C0;
  unsigned int v6 = ((v5 >> 1) - 30 * (v5 / 0x3C)) | (32
                                       * (v5 / 0x3C
                                        - 60 * (((143165577 * (unint64_t)(v5 / 0x3C)) >> 32) >> 1)));
  int v7 = v5 / 0xE10 - 24 * ((178956971 * (unint64_t)(v5 / 0xE10)) >> 32);
  unsigned int v8 = v5 / 0x15180;
  uint64_t v9 = &unk_10003DA50;
  if (v5 >= 0x1E13380)
  {
    unsigned int v10 = 1970;
    unsigned int v11 = 365;
    do
    {
      v8 -= v11;
      if ((++v10 & 3) != 0) {
        unsigned int v11 = 365;
      }
      else {
        unsigned int v11 = 366;
      }
    }
    while (v8 >= v11);
    if ((v10 & 3) == 0) {
      uint64_t v9 = &unk_10003DA68;
    }
  }
  else
  {
    unsigned int v10 = 1970;
  }
  int v12 = 0;
  __int16 v13 = v6 | ((_WORD)v7 << 11);
  __int16 v14 = 32;
  do
  {
    unsigned int v15 = (unsigned __int16)v9[v12++];
    v14 -= 32;
  }
  while (v8 >= v15);
  if (v12 != 1) {
    LOWORD(v8) = v8 - v9[v12 - 2];
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4)
  {
    unint64_t v16 = ((unsigned __int128)(result[1] * (__int128)(uint64_t)0xD6BF94D5E57A42BDLL) >> 64) + result[1];
    int v17 = (v16 >> 63) + (v16 >> 23);
    if (v4) {
      char v18 = 100;
    }
    else {
      char v18 = 0;
    }
    *a4 = v17 + v18;
  }
  __int16 v19 = v8 - v14;
  __int16 v20 = ((_WORD)v10 << 9) - 30687;
  if (v10 <= 0x7BC) {
    __int16 v20 = 33;
  }
  *a2 = v20 + v19;
  return result;
}

uint64_t msdosfs_dos2unixtime(uint64_t result, unsigned int a2, unsigned int a3, void *a4)
{
  if (result)
  {
    int v4 = (unsigned __int16)result >> 11;
    if ((result & 0x600) != 0) {
      ++v4;
    }
    int v5 = v4 + 365 * ((unsigned __int16)result >> 9);
    unsigned int v6 = (result >> 5) & 0xF;
    if (v6 - 13 < 0xFFFFFFF4) {
      unsigned int v6 = 1;
    }
    BOOL v7 = v6 >= 2;
    unsigned int v8 = v6 - 2;
    if (v7)
    {
      if ((result & 0x600) != 0) {
        uint64_t v9 = (unsigned __int16 *)&unk_10003DA50;
      }
      else {
        uint64_t v9 = (unsigned __int16 *)&unk_10003DA68;
      }
      v5 += v9[v8];
    }
    *a4 = a3 / 0x64
        + 2 * (a2 & 0x1F)
        + 60 * ((a2 >> 5) & 0x3F)
        + 3600 * ((unsigned __int16)a2 >> 11)
        + dword_1000564C0
        + 86400 * ((result & 0x1F) + v5 - 1)
        + 315532800;
    a4[1] = 10000000 * (a3 % 0x64);
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
  }
  return result;
}

uint64_t msdosfs_unicode2dos(int a1)
{
  if (a1 <= 0xFF) {
    return byte_10003DA80[a1];
  }
  if (a1 > 0x2122) {
    return 1;
  }
  if ((a1 - 8208) <= 0x2F) {
    return byte_10003DB80[a1 - 8208];
  }
  if ((a1 - 338) <= 0x18A)
  {
    if (a1 > 380)
    {
      if (a1 <= 401)
      {
        if (a1 == 381) {
          return -114;
        }
        if (a1 == 382) {
          return -98;
        }
      }
      else
      {
        switch(a1)
        {
          case 402:
            return -125;
          case 710:
            return -120;
          case 732:
            return -104;
        }
      }
    }
    else if (a1 <= 351)
    {
      if (a1 == 338) {
        return -116;
      }
      if (a1 == 339) {
        return -100;
      }
    }
    else
    {
      switch(a1)
      {
        case 352:
          return -118;
        case 353:
          return -102;
        case 376:
          return -97;
      }
    }
    return 1;
  }
  if (a1 == 8482) {
    unsigned __int8 v1 = -103;
  }
  else {
    unsigned __int8 v1 = 1;
  }
  if (a1 == 8364) {
    return 0x80;
  }
  return v1;
}

uint64_t msdosfs_dos2unicodefn(uint64_t a1, uint64_t a2, char a3)
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    int v4 = *(unsigned __int8 *)(a1 + i);
    if (v4 == 5 && i == 0) {
      LOBYTE(v4) = -27;
    }
    if ((a3 & 8) != 0) {
      LOBYTE(v4) = byte_100056174[v4];
    }
    if ((char)v4 < -96) {
      __int16 v6 = word_100056134[v4 - 128];
    }
    else {
      __int16 v6 = v4;
    }
    *(_WORD *)(a2 + 2 * i) = v6;
  }
  int v7 = 9;
  uint64_t v8 = 7;
  while (v8 != -1)
  {
    int v9 = *(unsigned __int16 *)(a2 + 2 * v8);
    --v7;
    --v8;
    if (v9 != 32) {
      goto LABEL_18;
    }
  }
  int v7 = 0;
LABEL_18:
  uint64_t v10 = 0;
  *(_WORD *)(a2 + 2 * v7) = 46;
  unsigned int v11 = (unsigned __int16 *)(a2 + 2 * v7);
  int v12 = v7 + 1;
  do
  {
    uint64_t v13 = *(unsigned __int8 *)(a1 + v10 + 8);
    if ((a3 & 0x10) != 0) {
      LODWORD(v13) = byte_100056174[v13];
    }
    if ((char)v13 <= -97) {
      LOWORD(v13) = word_100056134[(v13 - 128)];
    }
    v11[1] = v13;
    ++v11;
    ++v12;
    ++v10;
  }
  while (v10 != 3);
  int v14 = 0;
  int v15 = v12 - 3;
  while (1)
  {
    int v16 = *v11--;
    if (v16 != 32) {
      break;
    }
    if (++v14 == 3) {
      return v15 - (v14 == 3);
    }
  }
  int v15 = v12 - v14;
  return v15 - (v14 == 3);
}

uint64_t msdosfs_unicode_to_dos_name(unsigned __int16 *a1, uint64_t a2, _WORD *a3, unsigned char *a4)
{
  *a4 = 0;
  memset(a3, 32, 11);
  if (a2 == 2)
  {
    if (*a1 == 46 && a1[1] == 46)
    {
      *a3 = 11822;
      return 1;
    }
  }
  else if (a2 == 1)
  {
    if (*a1 == 46)
    {
      *(unsigned char *)a3 = 46;
      return 1;
    }
  }
  else if ((int)a2 <= 0)
  {
    uint64_t v40 = a4;
LABEL_47:
    uint64_t v28 = a1 + 1;
    int v29 = 1;
LABEL_64:
    unsigned int v31 = 0;
    int v32 = 0;
    uint64_t v33 = a1 + 1;
    while (1)
    {
      unint64_t v34 = *(v33 - 1);
      if (v34 <= 0x7F) {
        break;
      }
      v31 |= 4u;
      if (v34 <= 0xFF) {
        goto LABEL_68;
      }
LABEL_69:
      int v35 = msdosfs_unicode2dos(v34);
      if (v35 == 1) {
        char v36 = 95;
      }
      else {
        char v36 = v35;
      }
      if (v35 == 2) {
        char v36 = 32;
      }
      if ((((_BYTE)v35 - 1) & 0xFE) == 0) {
        int v29 = 3;
      }
      *((unsigned char *)a3 + v32) = v36;
      int v32 = v32 - (v35 == 2) + 1;
      BOOL v37 = v33 < v28;
      if (v33 < v28)
      {
        ++v33;
        if (v32 < 8) {
          continue;
        }
      }
      goto LABEL_80;
    }
    v31 |= byte_10003DBB0[v34];
LABEL_68:
    LODWORD(v34) = byte_100056174[v34];
    goto LABEL_69;
  }
  int v9 = a2 + 1;
  uint64_t v10 = a1;
  do
  {
    uint64_t result = msdosfs_unicode2dos(*v10);
    if (!result) {
      return result;
    }
    ++v10;
    --v9;
  }
  while (v9 >= 2);
  uint64_t v40 = a4;
  if ((int)a2 < 2) {
    goto LABEL_47;
  }
  unsigned int v11 = 0;
  int v12 = 0;
  uint64_t v13 = a1 + 2;
  unsigned int v14 = a2 + 1;
  do
  {
    if (v11) {
      int v15 = v11;
    }
    else {
      int v15 = v13;
    }
    int v16 = (unsigned __int16)*(v13 - 1);
    if (v11) {
      BOOL v17 = v16 == 46;
    }
    else {
      BOOL v17 = 1;
    }
    if (!v17) {
      int v12 = (char *)v11;
    }
    if (v16 == 46) {
      unsigned int v11 = v15;
    }
    else {
      unsigned int v11 = 0;
    }
    ++v13;
    --v14;
  }
  while (v14 > 2);
  if (v12)
  {
    uint64_t v18 = ((char *)v11 - v12) >> 1;
    if (v16 != 46) {
      uint64_t v18 = a2 - ((unint64_t)(v12 - (char *)a1) >> 1);
    }
    if ((int)v18 >= 1)
    {
      uint64_t v19 = 0;
      unsigned int v20 = 0;
      uint64_t v21 = (int)v18;
      int v22 = 8;
      int v23 = 1;
      while (1)
      {
        unint64_t v24 = *(unsigned __int16 *)&v12[2 * v19];
        if (v24 <= 0x7F) {
          break;
        }
        v20 |= 4u;
        if (v24 <= 0xFF) {
          goto LABEL_35;
        }
LABEL_36:
        int v25 = msdosfs_unicode2dos(v24);
        if (v25 == 1) {
          char v26 = 95;
        }
        else {
          char v26 = v25;
        }
        if (v25 == 2) {
          char v26 = 32;
        }
        if ((((_BYTE)v25 - 1) & 0xFE) == 0) {
          int v23 = 3;
        }
        *((unsigned char *)a3 + v22) = v26;
        BOOL v27 = ++v19 < v21;
        if (v19 < v21)
        {
          int v22 = v22 - (v25 == 2) + 1;
          if (v22 < 11) {
            continue;
          }
        }
        goto LABEL_50;
      }
      v20 |= byte_10003DBB0[v24];
LABEL_35:
      LODWORD(v24) = byte_100056174[v24];
      goto LABEL_36;
    }
    unsigned int v20 = 0;
    BOOL v27 = 0;
    int v23 = 1;
LABEL_50:
    if (((v23 != 3) & (v20 >> 2)) != 0) {
      int v30 = 2;
    }
    else {
      int v30 = v23;
    }
    if (v30 == 1)
    {
      if ((~v20 & 3) != 0)
      {
        if (v20) {
          *v40 |= 0x10u;
        }
        int v30 = 1;
      }
      else
      {
        int v30 = 2;
      }
    }
    if (v27) {
      int v29 = 3;
    }
    else {
      int v29 = v30;
    }
    uint64_t v28 = (unsigned __int16 *)(v12 - 2);
  }
  else
  {
    uint64_t v28 = (unsigned __int16 *)((char *)a1 + ((2 * a2 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 4);
    int v29 = 1;
  }
  if (v28 > a1) {
    goto LABEL_64;
  }
  int v32 = 0;
  unsigned int v31 = 0;
  BOOL v37 = 0;
LABEL_80:
  if (((v29 != 3) & (v31 >> 2)) != 0) {
    unsigned int v38 = 2;
  }
  else {
    unsigned int v38 = v29;
  }
  if (v38 == 1)
  {
    if ((~v31 & 3) != 0)
    {
      if (v31) {
        *v40 |= 8u;
      }
      unsigned int v38 = 1;
    }
    else
    {
      unsigned int v38 = 2;
    }
  }
  if (v37) {
    uint64_t result = 3;
  }
  else {
    uint64_t result = v38;
  }
  if (v32)
  {
    if (*(unsigned __int8 *)a3 != 229) {
      goto LABEL_97;
    }
    char v39 = 5;
  }
  else
  {
    char v39 = 95;
  }
  *(unsigned char *)a3 = v39;
LABEL_97:
  if (result != 1) {
    *uint64_t v40 = 0;
  }
  return result;
}

uint64_t msdosfs_apply_generation_to_short_name(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = 0;
  do
  {
    unsigned int v3 = a2;
    a2 /= 0xAu;
    unint64_t v4 = v2 + 1;
    v10[v2 + 1] = (v3 - 10 * a2) | 0x30;
    if (v3 < 0xA) {
      break;
    }
    BOOL v5 = v2++ >= 5;
  }
  while (!v5);
  if (v3 > 9) {
    return 63;
  }
  unsigned int v6 = 7 - v4;
  int v7 = (unsigned char *)(a1 - v4 + 9);
  do
  {
    unsigned int v8 = v6;
    --v7;
    BOOL v5 = v6-- != 0;
  }
  while (v5 && *(unsigned char *)(a1 + v8) == 32);
  *(unsigned char *)(a1 + v8) = 126;
  do
    *v7++ = v10[v4--];
  while (v4);
  return 0;
}

uint64_t msdosfs_unicode2winfn(uint64_t result, int a2, uint64_t a3, int a4, char a5)
{
  uint64_t v5 = 0;
  *(void *)(a3 + 9) = -1;
  *(void *)(a3 + 24) = -1;
  *(void *)(a3 + 17) = -1;
  *(void *)(a3 + 1) = -1;
  uint64_t v6 = a3 + 1;
  int v7 = 13 * a4 - 13;
  *(unsigned char *)a3 = a4;
  *(_WORD *)(a3 + 11) = 15;
  uint64_t v8 = result + 2 * v7;
  LODWORD(result) = a2 - v7;
  *(unsigned char *)(a3 + 13) = a5;
  *(_WORD *)(a3 + 26) = 0;
  do
  {
    BOOL v9 = __OFSUB__(result, 1);
    LODWORD(result) = result - 1;
    if ((int)result < 0 != v9)
    {
      int v16 = (_WORD *)(v6 + v5);
LABEL_15:
      *int v16 = 0;
LABEL_16:
      uint64_t result = 0;
      *(unsigned char *)a3 |= 0x40u;
      return result;
    }
    *(_WORD *)(v6 + v5) = *(_WORD *)(v8 + v5);
    v5 += 2;
  }
  while (v5 != 10);
  uint64_t v10 = 0;
  uint64_t v11 = a3 + 14;
  do
  {
    BOOL v9 = __OFSUB__(result, 1);
    LODWORD(result) = result - 1;
    if ((int)result < 0 != v9)
    {
      int v16 = (_WORD *)(v11 + v10);
      goto LABEL_15;
    }
    *(_WORD *)(v11 + v10) = *(_WORD *)(v8 + v10 + v5);
    v10 += 2;
  }
  while (v10 != 12);
  uint64_t v12 = 0;
  uint64_t v13 = a3 + 28;
  unsigned int v14 = (__int16 *)(v8 + v5 + v10);
  do
  {
    BOOL v9 = __OFSUB__(result, 1);
    uint64_t result = (result - 1);
    if ((int)result < 0 != v9)
    {
      int v16 = (_WORD *)(v13 + v12);
      goto LABEL_15;
    }
    __int16 v15 = *v14++;
    *(_WORD *)(v13 + v12) = v15;
    v12 += 2;
  }
  while (v12 != 4);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t msdosfs_winChkName(uint64_t a1, int a2, unsigned char *a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v6 = a3[13];
  if ((*a3 & 0x40) != 0 || (v7 = 0xFFFFFFFFLL, a4 != -1) && (v29 = v6 == a4, uint64_t v6 = a4, v29))
  {
    uint64_t v8 = 13 * (*a3 & 0x3F);
    uint64_t v9 = v8 - 13;
    uint64_t v10 = (_WORD *)(a5 + 2 * (v8 - 13));
    if (!a5) {
      uint64_t v10 = 0;
    }
    int v11 = a2 - v9;
    if (a2 - (int)v9 < 0 || (*a3 & 0x40) != 0 && v11 > 0xD)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = a1 + 2 * v9;
      uint64_t v15 = 26 * (*a3 & 0x3F);
      uint64_t v16 = a1 + v15 - 16;
      int v17 = a2 - v8;
      int v18 = a2 - v8 + 8;
      do
      {
        uint64_t v19 = *(unsigned __int16 *)&a3[v13 + 1];
        if (v11 <= 0)
        {
          BOOL v29 = v19 == 0;
          goto LABEL_49;
        }
        if (v10) {
          *v10++ = v19;
        }
        uint64_t v20 = *(unsigned __int16 *)(v14 + v13);
        if (v19 != v20)
        {
          *a6 = 1;
          if (v19 <= 0xFF) {
            LODWORD(v19) = byte_100056174[v19];
          }
          if (v20 <= 0xFF) {
            LODWORD(v20) = byte_100056174[v20];
          }
          if (v19 != v20) {
            return 0xFFFFFFFFLL;
          }
        }
        v13 += 2;
        --v11;
      }
      while (v13 != 10);
      uint64_t v21 = 0;
      uint64_t v22 = v15 + a1 - 4;
      int v23 = v17 + 2;
      do
      {
        uint64_t v24 = *(unsigned __int16 *)&a3[v21 + 14];
        if (v18 <= 0)
        {
          BOOL v29 = v24 == 0;
          goto LABEL_49;
        }
        if (v10) {
          *v10++ = v24;
        }
        uint64_t v25 = *(unsigned __int16 *)(v16 + v21);
        if (v24 != v25)
        {
          *a6 = 1;
          if (v24 <= 0xFF) {
            LODWORD(v24) = byte_100056174[v24];
          }
          if (v25 <= 0xFF) {
            LODWORD(v25) = byte_100056174[v25];
          }
          if (v24 != v25) {
            return 0xFFFFFFFFLL;
          }
        }
        v21 += 2;
        --v18;
      }
      while (v21 != 12);
      uint64_t v26 = 0;
      while (1)
      {
        uint64_t v27 = *(unsigned __int16 *)&a3[v26 + 28];
        if (v23 <= 0) {
          break;
        }
        if (v10) {
          *v10++ = v27;
        }
        uint64_t v28 = *(unsigned __int16 *)(v22 + v26);
        if (v27 != v28)
        {
          *a6 = 1;
          if (v27 <= 0xFF) {
            LODWORD(v27) = byte_100056174[v27];
          }
          if (v28 <= 0xFF) {
            LODWORD(v28) = byte_100056174[v28];
          }
          if (v27 != v28) {
            return 0xFFFFFFFFLL;
          }
        }
        v26 += 2;
        --v23;
        if (v26 == 4) {
          return v6;
        }
      }
      BOOL v29 = v27 == 0;
LABEL_49:
      if (v29) {
        return v6;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return v7;
}

uint64_t msdosfs_getunicodefn(char *a1, uint64_t a2, _WORD *a3, uint64_t a4)
{
  char v4 = *a1;
  int v5 = *a1 & 0x3F;
  if ((v5 - 21) < 0xFFFFFFEC) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = a1[13];
  if ((*a1 & 0x40) != 0)
  {
    *a3 = 13 * v5;
    a4 = v8;
    goto LABEL_9;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a4 != -1 && v8 == a4)
  {
LABEL_9:
    uint64_t v9 = 0;
    uint64_t result = a4;
    uint64_t v10 = a1 + 1;
    uint64_t v11 = 26 * (v4 & 0x3F);
    uint64_t v12 = 13 - 13 * (v4 & 0x3F);
    do
    {
      int v13 = *(unsigned __int16 *)&v10[v9];
      if (!*(_WORD *)&v10[v9])
      {
        unint64_t v21 = -v12;
LABEL_24:
        *a3 = v21;
        return result;
      }
      if (v13 == 47) {
        return 0xFFFFFFFFLL;
      }
      *(_WORD *)(a2 + v11 - 26 + v9) = v13;
      v9 += 2;
      --v12;
    }
    while (v9 != 10);
    uint64_t v14 = 0;
    uint64_t v15 = a1 + 15;
    unint64_t v16 = v11 + v9 - 26;
    do
    {
      int v17 = *(unsigned __int16 *)(v15 - 1);
      if (!*(_WORD *)(v15 - 1))
      {
        LOWORD(v21) = v14 - v12;
        goto LABEL_24;
      }
      if (v17 == 47 || v14 - v12 > 254) {
        return 0xFFFFFFFFLL;
      }
      *(_WORD *)(a2 + v16) = v17;
      v16 += 2;
      ++v14;
      v15 += 2;
    }
    while (v14 != 6);
    uint64_t v18 = 0;
    uint64_t v19 = (_WORD *)(a2 + v16);
    while (1)
    {
      int v20 = *(unsigned __int16 *)&a1[v18 + 28];
      if (v20 == 47) {
        return 0xFFFFFFFFLL;
      }
      if (!*(_WORD *)&a1[v18 + 28])
      {
        unint64_t v21 = v16 >> 1;
        goto LABEL_24;
      }
      *v19++ = v20;
      v18 += 2;
      v16 += 2;
      if (v18 == 4) {
        return result;
      }
    }
  }
  return result;
}

uint64_t msdosfs_winChksum(char *a1)
{
  unsigned __int8 v1 = 0;
  for (unsigned int i = 12; i > 1; --i)
  {
    char v3 = *a1++;
    unsigned __int8 v1 = v3 + ((v1 >> 1) | (v1 << 7));
  }
  return v1;
}

uint64_t msdosfs_winSlotCnt(uint64_t a1, int a2)
{
  if (a2 > 255) {
    return 0;
  }
  unsigned int v3 = a2 / 13;
  if (a2 % 13) {
    return v3 + 1;
  }
  else {
    return v3;
  }
}

void sub_10002215C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022198(uint64_t a1)
{
}

void sub_1000221A0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void sub_100022200(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void sub_100022A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 256), 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100022AC0(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
  id v7 = a2;
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_64:
    BOOL v14 = 1;
    goto LABEL_65;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(unsigned char *)(v8 + 24))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v10 = *(void *)(v9 + 24);
    unint64_t v11 = *(void *)(a1 + 112);
    unint64_t v12 = v10 + a4;
    if (v11 < v10 || v12 <= v11)
    {
      BOOL v14 = 0;
      *(void *)(v9 + 24) = v12;
      goto LABEL_65;
    }
    int v15 = v11 - v10;
    a3 += v15;
    a4 -= v15;
    *(unsigned char *)(v8 + 24) = 1;
  }
  if ([*(id *)(a1 + 32) isFat1216RootDir])
  {
    unint64_t v17 = 0;
    unint64_t v49 = 0;
  }
  else
  {
    unint64_t v18 = *(void *)(a1 + 120);
    unint64_t v19 = *(void *)(a1 + 128);
    unint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) % v18 / v19 + v18 / v19 * a3;
    unint64_t v49 = v18 / v19 * (a3 + a4) - 1;
    if (v17 > v49) {
      goto LABEL_13;
    }
  }
  *(void *)&long long v16 = 136315394;
  long long v48 = v16;
  while (2)
  {
    uint64_t v20 = objc_msgSend(*(id *)(a1 + 40), "readDirBlockNum:", v17, v48);
    if (v20)
    {
      uint64_t v46 = (void *)v20;
      (*(void (**)(void, uint64_t, uint64_t, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v20, 4, 0, 0, 0);
LABEL_63:

      goto LABEL_64;
    }
    unint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) % *(void *)(a1 + 128);
    do
    {
      uint64_t v22 = (unsigned __int8 *)[*(id *)(a1 + 40) getBytesAtOffset:v21];
      if (!v22)
      {
        uint64_t v44 = fskit_std_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
          sub_100030D60(v44);
        }

        uint64_t v45 = *(void *)(a1 + 48);
        uint64_t v46 = fs_errorForPOSIXError();
        (*(void (**)(uint64_t, void *, uint64_t, void, void, void))(v45 + 16))(v45, v46, 4, 0, 0, 0);
        goto LABEL_63;
      }
      int v23 = v22;
      if (*v22 != 229 && *v22)
      {
        if ((v22[11] & 0x3F) == 0xF)
        {
          unsigned int v25 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isValid];
          if ((v25 & 1) == 0)
          {
            if ((*v23 & 0x40) == 0)
            {
              uint64_t v26 = fskit_std_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
                *(_DWORD *)buf = v48;
                uint64_t v51 = "-[MsdosDirItem iterateFromOffset:options:replyHandler:]_block_invoke";
                __int16 v52 = 2048;
                uint64_t v53 = v43;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: (offset = %llu) First long-name entry doesn't have the WIN_LAST mask. Skipping entry.", buf, 0x16u);
              }

              goto LABEL_55;
            }
            [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fillWithFirstLongNameEntry:v23];
            *(_WORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 32) = 13
                                                                        * (unsigned __int16)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) numLongNameEntries];
          }
          int v33 = v23[13];
          if (v33 == [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) checkSum])
          {
            uint64_t v34 = v25 ^ 1;
            uint64_t v35 = 0;
            uint64_t v36 = 13
                * [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) numLongNameEntriesLeft]- 13;
            do
            {
              unsigned int v37 = +[Utilities parseCharacterOfLongNameEntry:v23 charIdxInEntry:v35 charIdxInName:v36 unistrName:*(void *)(*(void *)(a1 + 104) + 8) + 32 isFirstLongEntryInSet:v34];
              BOOL v38 = v37 < 2 || v35 >= 0xC;
              uint64_t v35 = (v35 + 1);
            }
            while (!v38);
            if (v37)
            {
              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setNumLongNameEntriesLeft:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "numLongNameEntriesLeft")- 1);
              goto LABEL_22;
            }
            BOOL v29 = fskit_std_log();
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              goto LABEL_54;
            }
            uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            *(_DWORD *)buf = v48;
            uint64_t v51 = "-[MsdosDirItem iterateFromOffset:options:replyHandler:]_block_invoke";
            __int16 v52 = 2048;
            uint64_t v53 = v42;
            unsigned int v31 = v29;
            int v32 = "%s: (offset = %llu) Failed to parse long-name entry's characters. Skipping entry.";
            goto LABEL_53;
          }
          BOOL v29 = fskit_std_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            *(_DWORD *)buf = v48;
            uint64_t v51 = "-[MsdosDirItem iterateFromOffset:options:replyHandler:]_block_invoke";
            __int16 v52 = 2048;
            uint64_t v53 = v39;
            unsigned int v31 = v29;
            int v32 = "%s: (offset = %llu) long-name entry has an invalid checksum value. Skipping entry.";
            goto LABEL_53;
          }
          goto LABEL_54;
        }
        uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isValid])
        {
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "setNumberOfDirEntries:", (unsigned __int16)((unsigned __int16)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "numLongNameEntries")+ 1));
          unsigned int v28 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) numLongNameEntries];
          if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) numLongNameEntriesLeft])
          {
            BOOL v29 = fskit_std_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
              *(_DWORD *)buf = v48;
              uint64_t v51 = "-[MsdosDirItem iterateFromOffset:options:replyHandler:]_block_invoke";
              __int16 v52 = 2048;
              uint64_t v53 = v30;
              unsigned int v31 = v29;
              int v32 = "%s: (offset = %llu) Reached a short-name entry while we still have long-name entries left. Skipping entry.";
LABEL_53:
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
            }
LABEL_54:

            [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
LABEL_55:
            BOOL v24 = 1;
            goto LABEL_23;
          }
          v27 -= 32 * v28;
        }
        else
        {
          *(_WORD *)(*(void *)(*(void *)(a1 + 104) + 8) + 32) = msdosfs_dos2unicodefn((uint64_t)v23, *(void *)(*(void *)(a1 + 104) + 8)+ 34, v23[12]);
          [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setNumberOfDirEntries:1];
        }
        uint64_t v40 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        uint64_t v41 = +[NSMutableData dataWithBytes:v23 length:32];
        [v40 setData:v41];

        [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDosDirEntryDirBlockNum:v17];
        [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDosDirEntryOffsetInDirBlock:v21];
        [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setFirstEntryOffsetInDir:v27];
        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
        goto LABEL_21;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) invalidate];
LABEL_21:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:
      BOOL v24 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 1;
LABEL_23:
      v21 += 32;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += 32;
    }
    while (v21 < *(void *)(a1 + 128) && v24);
    if (++v17 > v49) {
      BOOL v24 = 0;
    }
    if (v24) {
      continue;
    }
    break;
  }
LABEL_13:
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += a4;
  BOOL v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 0;
LABEL_65:

  return v14;
}

void sub_1000234F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100023530(uint64_t a1, void *a2, char a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030E68();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
}

void sub_100023B3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100023B60(uint64_t a1, void *a2, _OWORD *a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030F60();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    unsigned int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v9 = *(_DWORD *)(a1 + 56);
    if (v8 >= v9 - 1)
    {
      id v11 = [*(id *)(a1 + 32) data];
      uint64_t v12 = [v11 bytes];
      long long v13 = v12[1];
      *a3 = *v12;
      a3[1] = v13;
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      msdosfs_unicode2winfn(a1 + 62, *(unsigned __int16 *)(a1 + 60), (uint64_t)&v14, v9 + ~v8, *(unsigned char *)(a1 + 572));
      long long v10 = v15;
      *a3 = v14;
      a3[1] = v10;
    }
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void sub_100023F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023F30(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (v6)
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031084();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    *a3 = -27;
  }
}

void sub_1000240C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000240DC(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    int v7 = *a3;
    if (!*a3)
    {
      unsigned int v8 = fskit_std_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100031170();
      }

      uint64_t v9 = fs_errorForPOSIXError();
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      int v7 = *a3;
    }
    if (v7 != 229 && (v7 & 0x40) == 0 && (a3[11] & 0x3F) == 0xF)
    {
      uint64_t v12 = fskit_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000310F8();
      }

      uint64_t v13 = fs_errorForPOSIXError();
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

void sub_100024808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002483C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  id v12 = a6;
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    if (a3 == 1) {
      goto LABEL_14;
    }
    if (a3 != 2) {
      goto LABEL_13;
    }
    if ([*(id *)(a1 + 32) maxShortNameIndex] <= 0xF423F)
    {
      unsigned int v13 = [*(id *)(a1 + 32) getGenerationNumberOfName:a5];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v13 > *(_DWORD *)(v14 + 24)) {
        *(_DWORD *)(v14 + 24) = v13;
      }
    }
    id v15 = [v12 data];
    uint64_t v16 = [v15 bytes];

    uint64_t v17 = *(uint64_t **)(a1 + 72);
    uint64_t v18 = *v17;
    uint64_t v19 = *(uint64_t *)((char *)v17 + 3);
    BOOL v20 = v18 == *v16 && v19 == *(void *)((char *)v16 + 3);
    if (!v20
      || (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1,
          ![*(id *)(a1 + 32) maxShortNameIndex]))
    {
LABEL_13:
      a3 = 0;
      goto LABEL_14;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  a3 = 1;
LABEL_14:

  return a3;
}

void sub_1000249E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t wipeFSCallback(uint64_t a1)
{
  if (!a1)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003125C(v3, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_17;
  }
  unint64_t v2 = *(void **)(a1 + 16);
  if (!v2)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000312D4(v3, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_17;
  }
  unsigned int v3 = v2;
  id v4 = *(id *)(a1 + 8);
  if (!v4)
  {
    uint64_t v26 = fskit_std_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10003134C(v26, v27, v28, v29, v30, v31, v32, v33);
    }

LABEL_17:
    uint64_t v11 = 22;
    goto LABEL_20;
  }
  id v5 = v4;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = sub_100024CAC;
  uint64_t v45 = sub_100024CBC;
  id v46 = 0;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  unsigned int v37 = sub_100024CC4;
  BOOL v38 = &unk_10004D1B8;
  uint64_t v40 = &v41;
  int v7 = v6;
  uint64_t v39 = v7;
  [v3 wipeResource:v5 completionHandler:&v35];
  unsigned int v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100031430(v8);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v42[5])
  {
    uint64_t v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v42[5], "description", v35, v36, v37, v38);
      id v10 = objc_claimAutoreleasedReturnValue();
      sub_1000313C4((uint64_t)[v10 UTF8String], buf, v9, v10);
    }

    uint64_t v11 = (uint64_t)[(id)v42[5] code];
  }
  else
  {
    uint64_t v11 = 0;
  }

  _Block_object_dispose(&v41, 8);
LABEL_20:

  return v11;
}

void sub_100024C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100024CAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100024CBC(uint64_t a1)
{
}

void sub_100024CC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = fskit_std_log();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031538(a1 + 40, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_1000314B4(v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002521C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_100025250(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    int v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    unsigned int v8 = v5;
  }
  else
  {
    int v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    unsigned int v8 = v11;
  }
  id v9 = v8;
  id v10 = *v7;
  *int v7 = v9;
}

void sub_100025EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_100025F04(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    id v18 = a1;
    id v6 = objc_alloc((Class)NSString);
    int v7 = +[NSString stringWithUTF8String:a3];
    id v8 = [v6 initWithFormat:v7 arguments:a4];

    if ([v8 hasSuffix:@"\n"])
    {
      uint64_t v9 = objc_msgSend(v8, "substringToIndex:", (char *)objc_msgSend(v8, "length") - 1);

      id v8 = (id)v9;
    }
    [v18 logMessage:v8];
  }
  else
  {
    id v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031768(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

BOOL sub_100026018(uint64_t a1, BOOL a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_alloc((Class)NSString);
  id v8 = +[NSString stringWithUTF8String:a3];
  id v9 = [v7 initWithFormat:v8 arguments:a4];

  if (fsck_preen())
  {
    BOOL v10 = fsck_rdonly();
    BOOL v16 = 0;
    if (a2 && !v10)
    {
      long long v25 = fsck_ctx;
      uint64_t v26 = qword_100056470;
      fsck_print((uint64_t)&v25, 6, (uint64_t)"FIXED\n", v11, v12, v13, v14, v15, v24);
      BOOL v16 = a2;
    }
  }
  else if (fsck_alwaysyes() || fsck_rdonly())
  {
    if (!fsck_quiet())
    {
      id v17 = [v9 UTF8String];
      fsck_rdonly();
      long long v25 = fsck_ctx;
      uint64_t v26 = qword_100056470;
      fsck_print((uint64_t)&v25, 6, (uint64_t)"%s? %s\n", v18, v19, v20, v21, v22, (uint64_t)v17);
    }
    BOOL v16 = !fsck_rdonly();
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

void startCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1)
  {
    id v9 = a5;
    id v10 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
    uint64_t v11 = [v9 startPhase:v10 parentUnitCount:a2 phaseTotalCount:a3 completedCounter:a4];

    if (v11)
    {
      uint64_t v12 = fskit_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100031858(v11, v12);
      }
    }
  }
  else
  {
    uint64_t v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000317E0(v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void endCallback(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v12 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
    [v3 endPhase:v12];
  }
  else
  {
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000318F8(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

id readHelper(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = 0;
  id v4 = [a1 readInto:a2 startingAt:a4 length:a3 error:&v9];
  id v5 = v9;
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 code];
    id v4 = 0;
    *__error() = v7;
  }

  return v4;
}

id writeHelper(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = 0;
  id v4 = [a1 writeFrom:a2 startingAt:a4 length:a3 error:&v9];
  id v5 = v9;
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 code];
    id v4 = 0;
    *__error() = v7;
  }

  return v4;
}

uint64_t fstatHelper()
{
  return 0;
}

void sub_1000263FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) BSDName];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = checkfilesys((char *)[v2 UTF8String], (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 32));

  id v3 = [*(id *)(a1 + 40) totalUnitCount];
  if ((uint64_t)v3 > (uint64_t)[*(id *)(a1 + 40) completedUnitCount]) {
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  }
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = 0;
  fsck_set_fd(0xFFFFFFFFLL);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  id v4 = *(void **)(a1 + 48);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    fs_errorForPOSIXError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 didCompleteWithError:v6];
  }
  else
  {
    id v5 = *(void **)(a1 + 48);
    [v5 didCompleteWithError:0];
  }
}

void sub_1000271A0(_Unwind_Exception *a1)
{
}

void sub_1000271E8(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000319E8(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_12;
  }
  if (!*a1)
  {
    uint64_t v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031A60(v10, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_12:

    return;
  }
  id v25 = *a1;
  id v6 = objc_alloc((Class)NSString);
  int v7 = +[NSString stringWithUTF8String:a3];
  id v8 = [v6 initWithFormat:v7 arguments:a4];

  if ([v8 hasSuffix:@"\n"])
  {
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", (char *)objc_msgSend(v8, "length") - 1);

    id v8 = (id)v9;
  }
  [v25 logMessage:v8];
}

void sub_100027328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  long long v10 = *(_OWORD *)(a1 + 144);
  v26[4] = *(_OWORD *)(a1 + 128);
  v26[5] = v10;
  v26[6] = *(_OWORD *)(a1 + 160);
  uint64_t v27 = *(void *)(a1 + 176);
  long long v11 = *(_OWORD *)(a1 + 80);
  v26[0] = *(_OWORD *)(a1 + 64);
  v26[1] = v11;
  long long v12 = *(_OWORD *)(a1 + 112);
  v26[2] = *(_OWORD *)(a1 + 96);
  v26[3] = v12;
  long long v13 = *(_OWORD *)(a1 + 328);
  long long v14 = *(_OWORD *)(a1 + 360);
  long long v15 = *(_OWORD *)(a1 + 376);
  long long v38 = *(_OWORD *)(a1 + 344);
  long long v39 = v14;
  long long v40 = v15;
  long long v16 = *(_OWORD *)(a1 + 264);
  long long v17 = *(_OWORD *)(a1 + 296);
  long long v18 = *(_OWORD *)(a1 + 312);
  long long v34 = *(_OWORD *)(a1 + 280);
  long long v35 = v17;
  long long v36 = v18;
  long long v37 = v13;
  long long v19 = *(_OWORD *)(a1 + 200);
  long long v20 = *(_OWORD *)(a1 + 232);
  long long v30 = *(_OWORD *)(a1 + 216);
  long long v31 = v20;
  long long v32 = *(_OWORD *)(a1 + 248);
  long long v33 = v16;
  *(_OWORD *)buf = *(_OWORD *)(a1 + 184);
  long long v29 = v19;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = format((uint64_t)v26, (int *)buf, v9, a4, a5, a6, a7, a8);
  id v21 = [*(id *)(a1 + 32) totalUnitCount];
  if ((uint64_t)v21 > (uint64_t)[*(id *)(a1 + 32) completedUnitCount]) {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  }
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
  uint64_t v22 = *(void **)(a1 + 392);
  if (v22) {
    free(v22);
  }
  uint64_t v23 = *(void **)(a1 + 40);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v24 = fs_errorForPOSIXError();
    [v23 didCompleteWithError:v24];
  }
  else
  {
    [*(id *)(a1 + 40) didCompleteWithError:0];
  }
  id v25 = fskit_std_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[msdosFileSystem startFormatWithTask:parameters:error:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }
}

uint64_t lseekHelper(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100028A1C(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a6;
  if (v9)
  {
    long long v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100032820();
    }
  }
  if (a3 == 3) {
    [*(id *)(a1 + 32) setEntryData:v10];
  }

  return 1;
}

void sub_1000297E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_10002981C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002982C(uint64_t a1)
{
}

void sub_100029834(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100032A2C();
    }

    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = v5;
    id v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100032990(a1, v10, v11, v12, v13, v14, v15, v16);
    }

    if (!*(unsigned char *)(a1 + 40))
    {
      uint64_t v17 = fs_errorForPOSIXError();
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
      id v9 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
LABEL_5:
    }
  }
}

void sub_100029914(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v11 = v5;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v5;
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) systemInfo];
    uint64_t v9 = [v8 bytesPerCluster] * a3;
    id v10 = [*(id *)(a1 + 32) systemInfo];
    [v10 setRootDirSize:v9];
  }
}

void sub_10002A2C4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100032C04();
    }
  }
}

void sub_10002A9DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002A9FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

id sub_10002AABC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_100056A30;
  qword_100056A30 = (uint64_t)v1;

  id v3 = (void *)qword_100056A30;

  return [v3 setUseMetaRW:0];
}

void sub_10002BD8C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[DirBlock readRelativeDirBlockNum:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get the next cluster(s). Error = %@.", (uint8_t *)&v3, 0x16u);
}

void sub_10002BE20(void *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 136315650;
  __int16 v5 = "-[DirBlock getBytesAtOffset:]";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  id v9 = [a1 size];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: unexpected offset in dir block (%llu), dir block size %zu", (uint8_t *)&v4, 0x20u);
}

void sub_10002BECC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: iterate dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002BF40(uint64_t **a1, NSObject *a2)
{
  uint64_t v2 = **a1;
  int v3 = 136315394;
  uint64_t v4 = "-[DirItem lookupDirEntryNamed:dirNameCache:lookupOffset:replyHandler:]_block_invoke";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: got a wrong offset from hint (%llu).", (uint8_t *)&v3, 0x16u);
}

void sub_10002BFD4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: iterate dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C048(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008EFC((void *)&_mh_execute_header, a1, a3, "%s: insert dir entry to name cache failed with error = %@.", a5, a6, a7, a8, 2u);
}

void sub_10002C0CC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: iterate dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C140(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C1B8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to zero-fill clusters. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C22C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to allocate clusters. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C2A0()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed iterating the directory. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C314()
{
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: iterate dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C394()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't write new dir entries to disk. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C408()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't create dir entry-set. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C47C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't calculate number of dir entries. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C4F0()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't convert name to unistr. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C564(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[DirItem createNewDirEntryNamed:type:attributes:firstDataCluster:replyHandler:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: got an invalid first cluster (%u).", (uint8_t *)&v2, 0x12u);
}

void sub_10002C5F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C668(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  __int16 v4 = "-[DirItem iterateDirEntriesAtOffset:numEntries:shouldWriteToDisk:replyHandler:]";
  __int16 v5 = 2048;
  id v6 = [a1 offsetInVolume];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Dir offset (%llu) is within the metadata zone.", (uint8_t *)&v3, 0x16u);
}

void sub_10002C708()
{
  int v2 = 136315650;
  sub_100008F6C();
  sub_100008F8C((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read dir block idx (%u). Error = %@.", v2);
}

void sub_10002C77C()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to write the updated entries into the device. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C7F0()
{
  int v2 = 136315650;
  sub_100008F6C();
  sub_100008F8C((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read dir block at idx %u. Error = %@.", v2);
}

void sub_10002C864()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: update parent dir modification time failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C8D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C950()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: iterate dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002C9C4(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "-[DirItem getDirEntryOffsetByIndex:replyHandler:]_block_invoke";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s iterateFromOffset error %d.\n", (uint8_t *)&v3, 0x12u);
}

void sub_10002CA64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CADC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't purge meta blocks. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002CB50()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to get clusters chain. Error: %@", v2, v3, v4, v5, 2u);
}

void sub_10002CBC4(int *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "-[DirNameCache insertDirEntryNamedUtf16:offsetInDir:]";
  __int16 v5 = 1024;
  int v6 = v2;
  __int16 v7 = 1024;
  int v8 = 50000;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Name cache full (%u/%u)", (uint8_t *)&v3, 0x18u);
}

void sub_10002CC60(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[DirNameCache insertDirEntryNamedUtf16:offsetInDir:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to add to bucket", (uint8_t *)&v1, 0xCu);
}

void sub_10002CCE4(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[DirNameCache insertDirEntryNamedUtf16:offsetInDir:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: Dir index %u is already in the cache", (uint8_t *)&v2, 0x12u);
}

void sub_10002CD70(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[DirNameCachePool getAvailableEntry]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: No free entries", (uint8_t *)&v1, 0xCu);
}

void sub_10002CDF4(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[DirNameCachePool getNameCacheForDir:cachedOnly:replyHandler:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: No available entry", (uint8_t *)&v1, 0xCu);
}

void sub_10002CE78(_DWORD *a1, int a2)
{
  *a1 = 136315394;
  sub_10000A79C((uint64_t)a1, a2, (uint64_t)"-[DirNameCachePool getNameCacheForDir:cachedOnly:replyHandler:]");
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s: DNC for current dir is in use (%u)", v3, 0x12u);
}

void sub_10002CEC8(os_log_t log)
{
  int v1 = 136315138;
  os_log_t v2 = "-[DirNameCachePool getNameCacheForDir:cachedOnly:replyHandler:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: dispatch_semaphore_wait timed out", (uint8_t *)&v1, 0xCu);
}

void sub_10002CF4C(_DWORD *a1, int a2)
{
  *a1 = 136315394;
  sub_10000A79C((uint64_t)a1, a2, (uint64_t)"-[DirNameCachePool doneWithNameCacheForDir:]");
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Entry for key %u not found", v3, 0x12u);
}

void sub_10002CF9C(_DWORD *a1, int a2)
{
  *a1 = 136315394;
  sub_10000A79C((uint64_t)a1, a2, (uint64_t)"-[DirNameCachePool doneWithNameCacheForDir:]");
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Entry for key %u is already set as not in use", v3, 0x12u);
}

void sub_10002CFEC(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[FATVolume writeSymlinkClusters:withContent:]";
  sub_1000132F0((void *)&_mh_execute_header, (int)a2, a3, "%s: Failed to write link content into the device", a1);
}

void sub_10002D030(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[FATVolume writeSymlinkClusters:withContent:]";
  sub_1000132F0((void *)&_mh_execute_header, (int)a2, a3, "%s: getContigClusterChainLengthStartingAt Failed", a1);
}

void sub_10002D074(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[FATVolume isSymLink:replyHandler:]";
  sub_1000132F0((void *)&_mh_execute_header, (int)a2, a3, "%s: Failed to read link content", a1);
}

void sub_10002D0B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D130(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D1A8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to get the next cluster(s). Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D21C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to clear clusters. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D290()
{
  sub_10001330C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: got an invalid type (%ld).", v2, v3, v4, v5, 2u);
}

void sub_10002D304(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D37C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: insert the new item to name cache failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D3F0()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: update parent dir modification time failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D464()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: failed to create '.' and '..' entries in the new dir. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D4D8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: lookup for new item failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D54C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: create new entry failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D5C0()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: clear dir clusters failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D634()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: writeSymlinkClusters ended with error  %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D6A8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: allocate clusters failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D71C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: lookup in dir failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D790()
{
  v1[0] = 136315394;
  sub_100008F2C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: item named %@ already exists.", (uint8_t *)v1, 0x16u);
}

void sub_10002D810()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't fill dir name cache. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D884()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: file size is invalid. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D8F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D970()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002D9E4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't get dir name cache. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002DA58(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[FATVolume createItemNamed:type:inDirectory:attributes:content:replyHandler:]_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: %u clusters were allocated, while asked for %u. (allowPartial = false).", (uint8_t *)&v4, 0x18u);
}

void sub_10002DAF4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: free clusters of the new item failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002DB68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DBE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DCD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DD48(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 136315650;
  *(void *)(buf + 4) = "-[FATVolume enumerateDirectory:startingAtCookie:verifier:providingAttributes:usingPacker:replyHandler:]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: cookieOffset [%u] not aligned with dirEntrySize [%u]", buf, 0x18u);
}

void sub_10002DDB0(void *a1, NSObject *a2)
{
  [a1 code];
  v3[0] = 136315394;
  sub_100013320();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s iterateFromOffset error %d.\n", (uint8_t *)v3, 0x12u);
}

void sub_10002DE44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DEBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DF34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DFAC()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't fill dir name cache. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002E020()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't get dir name cache. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002E094()
{
  v3[0] = 136315650;
  sub_100008F18();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Failed to fetch extents for file named %@. Error = %@.", (uint8_t *)v3, 0x20u);
}

void sub_10002E124(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E19C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E214(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E28C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E304(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E37C()
{
  v1[0] = 136315394;
  sub_100008F2C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Failed to purge dir's metadata blocks, error %@", (uint8_t *)v1, 0x16u);
}

void sub_10002E3FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E474(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E4EC()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: unable to lookup .. %@", v2, v3, v4, v5, 2u);
}

void sub_10002E560()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: unable to remove old file / directory entry %@", v2, v3, v4, v5, 2u);
}

void sub_10002E5D4()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: lookup new entry failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002E648()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: create new entry failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002E6BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E734()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: unable to free toItem clusters %@", v2, v3, v4, v5, 2u);
}

void sub_10002E7A8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: unable to remove 'toItem' %@", v2, v3, v4, v5, 2u);
}

void sub_10002E81C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: overDirItem checkIfEmpty %@", v2, v3, v4, v5, 2u);
}

void sub_10002E890(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E908(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E980()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: lookupName destinationName returned an error %@", v2, v3, v4, v5, 2u);
}

void sub_10002E9F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EA6C()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002EAE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EBD0(void *a1, uint64_t a2, NSObject *a3)
{
  objc_msgSend(a1, "fs_posixCode");
  v5[0] = 136315650;
  sub_100013320();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Metadata flush failed (%d), flags 0x%lx", (uint8_t *)v5, 0x1Cu);
}

void sub_10002EC74()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: sync failed, error %@", v2, v3, v4, v5, 2u);
}

void sub_10002ECE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002ED60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EDD8()
{
  sub_100008F40(__stack_chk_guard);
  v1[0] = 136315394;
  sub_100008F18();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:end:%@", (uint8_t *)v1, 0x16u);
}

void sub_10002EE58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EED0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EF68()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to read dirty bit value, error %@", v2, v3, v4, v5, 2u);
}

void sub_10002EFDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F054()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: couldn't blockmap file. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F0C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F140(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F1B8()
{
  sub_10001330C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: offset given wasn't 0 - %lld", v2, v3, v4, v5, 2u);
}

void sub_10002F22C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F2A4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F318()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to allocate clusters. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F38C()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to free clusters. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F400(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F478(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F4F0()
{
  int v2 = 136315650;
  sub_10001504C();
  sub_100015068((void *)&_mh_execute_header, v0, v1, "%s: Read with requested offset (%llu) >= file allocated size (%llu). Exiting.", v2, v3, v4);
}

void sub_10002F564()
{
  int v2 = 136315650;
  sub_10001504C();
  sub_100015068((void *)&_mh_execute_header, v0, v1, "%s: allocated size (%llu) < file size (%llu). The file is probably corrupted. Exiting.", v2, v3, v4);
}

void sub_10002F5D8()
{
  v1[0] = 136315650;
  sub_10001504C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Couldn't allocate all clusters for wanted offset and length. Length to write = %llu (instead of %llu).\n", (uint8_t *)v1, 0x20u);
}

void sub_10002F65C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F6D4()
{
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't truncate file. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F750()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@. \n", v2, v3, v4, v5, 2u);
}

void sub_10002F7C4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't fetch file extents. Error = %@", v2, v3, v4, v5, 2u);
}

void sub_10002F838()
{
  int v2 = 136315650;
  sub_10001504C();
  sub_100015068((void *)&_mh_execute_header, v0, v1, "%s: offset + length > file's allocated size (%llu > %llu).", v2, v3, v4);
}

void sub_10002F8AC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to update dir entry with new size. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002F920()
{
  v1[0] = 136315394;
  sub_10001330C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Couldn't find blockmap request (%llu) in dictionary.", (uint8_t *)v1, 0x16u);
}

void sub_10002F9A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FA18()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@. \n", v2, v3, v4, v5, 2u);
}

void sub_10002FA8C()
{
  sub_10001330C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: file offset is within metadata zone = %llu.\n", v2, v3, v4, v5, 2u);
}

void sub_10002FB00()
{
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to get the next cluster(s). Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002FB7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FBF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008EFC((void *)&_mh_execute_header, a2, a3, "%s: couldn't get cluster chain length. Error = %@.", a5, a6, a7, a8, 2u);
}

void sub_10002FC7C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[FATItem getAttributes:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to get parent id (item is not a dir)", (uint8_t *)&v1, 0xCu);
}

void sub_10002FD00(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[FATItem getAttributes:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to get parent id (dir item).", (uint8_t *)&v1, 0xCu);
}

void sub_10002FD84(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "-[FATItem setAttributes:]";
  __int16 v5 = 2048;
  id v6 = [a1 size];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to truncate to %llu", (uint8_t *)&v3, 0x16u);
}

void sub_10002FE24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FE9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002FF14()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't purge symlink's meta blocks. Error: %@", v2, v3, v4, v5, 2u);
}

void sub_10002FF88()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10002FFFC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to free clusters, error %@", v2, v3, v4, v5, 2u);
}

void sub_100030070(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "-[FATItem reclaim]_block_invoke";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to free preallocated clusters, error %d", (uint8_t *)&v3, 0x12u);
}

void sub_100030110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030200()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't purge meta blocks. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030274()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to get clusters chain. Error: %@", v2, v3, v4, v5, 2u);
}

void sub_1000302E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create FAT queue", v1, 2u);
}

void sub_10003032C()
{
  v1[0] = 136315394;
  sub_100013320();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: Cluster %u is not free", (uint8_t *)v1, 0x12u);
}

void sub_1000303AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030424(uint64_t a1, int a2, os_log_t log)
{
  int v3 = *(_DWORD *)(*(void *)a1 + 24);
  int v4 = 136315650;
  uint64_t v5 = "-[FATManager allocateClusters:searchFromCluster:allowPartial:zeroFill:mustBeContig:replyHandler:]_block_invoke_2";
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Cluster (%u) isn't free, curr cluster %u", (uint8_t *)&v4, 0x18u);
}

void sub_1000304C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003053C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000305B4()
{
  v1[0] = 136315394;
  sub_100013320();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "%s: curr cluster is illegal (%u)", (uint8_t *)v1, 0x12u);
}

void sub_100030634()
{
  v1[0] = 136315394;
  sub_100013320();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unexpected free cluster %u", (uint8_t *)v1, 0x12u);
}

void sub_1000306B4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read FAT block from disk. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030728()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't write FAT block to disk. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10003079C()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read FAT block from disk. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030810(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ItemCache initWithVolume:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to initialize queue / hash", (uint8_t *)&v1, 0xCu);
}

void sub_100030894(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ItemCache insertItem:replyHandler:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Item is deleted", (uint8_t *)&v1, 0xCu);
}

void sub_100030918(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[ItemCache insertItem:replyHandler:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Item already cached", (uint8_t *)&v1, 0xCu);
}

void sub_10003099C(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[ItemCache removeItem:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s: item for key %@ not found", (uint8_t *)&v2, 0x16u);
}

void sub_100030A28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030AA8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: create '..' entry failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030B1C()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: create '.' entry failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030B90()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't write dir block to disk. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030C04()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read dir block idx 0. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030C78()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to flush dot entry to disk. Error = %@", v2, v3, v4, v5, 2u);
}

void sub_100030CEC()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't read dir block idx 0. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030D60(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MsdosDirItem iterateFromOffset:options:replyHandler:]_block_invoke";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Got NULL dir entry from dir block", (uint8_t *)&v1, 0xCu);
}

void sub_100030DE4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MsdosDirItem generateUniqueShortName:offsetInDir:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Couldn't find a unique generation number for shortname creation.", (uint8_t *)&v1, 0xCu);
}

void sub_100030E68()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: short name lookup failed with error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030EDC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MsdosDirItem createEntrySetForName:itemType:firstCluster:attrs:offsetInDir:hidden:replyHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Couldn't find a unique generation number for shortname creation.", (uint8_t *)&v1, 0xCu);
}

void sub_100030F60()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't iterate dir entries. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100030FD4(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = 136315650;
  __int16 v6 = "-[MsdosDirItem writeDirEntryDataToDisk:]";
  __int16 v7 = 2048;
  id v8 = [a1 dosDirEntryDirBlockNum];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: Couldn't read dir block idx (%llu). Error = %@.", (uint8_t *)&v5, 0x20u);
}

void sub_100031084()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't iterate dir entries. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_1000310F8()
{
  sub_1000249FC();
  sub_1000249E0((void *)&_mh_execute_header, v0, v1, "%s: [%u] points to non-last long-name dir entry.", v2, v3, v4, v5, 2u);
}

void sub_100031170()
{
  sub_1000249FC();
  sub_1000249E0((void *)&_mh_execute_header, v0, v1, "%s: [%u] points to an empty dir entry.", v2, v3, v4, v5, 2u);
}

void sub_1000311E8()
{
  sub_100008F40(__stack_chk_guard);
  sub_100008F18();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to iterate directory. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_10003125C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000312D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003134C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000313C4(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "wipeFSCallback";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Wipe resource error: %s", buf, 0x16u);
}

void sub_100031430(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "wipeFSCallback";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: waiting for reply from send wipe resource request", (uint8_t *)&v1, 0xCu);
}

void sub_1000314B4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "wipeFSCallback_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: got reply from send wipe resource request with no errors", (uint8_t *)&v1, 0xCu);
}

void sub_100031538(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 136315394;
  uint64_t v4 = "wipeFSCallback_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: got reply from send wipe resource request with err: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000315D0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[msdosFileSystem syncRead:into:startingAt:length:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Expected to read %lu bytes, read %lu", (uint8_t *)&v3, 0x20u);
}

void sub_100031668()
{
  v1[0] = 136315394;
  sub_100008F2C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to read, error %@", (uint8_t *)v1, 0x16u);
}

void sub_1000316E8()
{
  v1[0] = 136315394;
  sub_100008F2C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Setting up probeResult (%@)", (uint8_t *)v1, 0x16u);
}

void sub_100031768(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000317E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031858(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  int v4 = 136315138;
  id v5 = [v3 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to start phase, error %s", (uint8_t *)&v4, 0xCu);
}

void sub_1000318F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031970(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000319E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031A60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031AD8(uint64_t a1, NSObject *a2)
{
  id v3 = [*(id *)(a1 + 8) localizedDescription];
  int v4 = 136315394;
  id v5 = "-[msdosProgressHelper startPhase:parentUnitCount:phaseTotalCount:completedCounter:]";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%s missing endPhase call for %@", (uint8_t *)&v4, 0x16u);
}

void sub_100031B88()
{
  v1[0] = 136315394;
  sub_1000249FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Invalid jump signature (0x%02X)", (uint8_t *)v1, 0x12u);
}

void sub_100031C0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031C84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031CFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031D74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031DEC(void *a1)
{
  int v1 = [a1 resource];
  [v1 blockCount];
  sub_10002A9DC((void *)&_mh_execute_header, v2, v3, "%s: device sector count (%llu) is too small, no room for clusters", v4, v5, v6, v7, 2u);
}

void sub_100031E8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031F04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031F7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031FF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003206C(void *a1)
{
  uint64_t v2 = [a1 systemInfo];
  [v2 rootFirstCluster];
  uint64_t v3 = [a1 systemInfo];
  [v3 maxValidCluster];
  sub_10002A9C0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x22u);
}

void sub_100032154(void *a1)
{
  int v1 = [a1 systemInfo];
  [v1 type];
  sub_1000249FC();
  sub_10002A9C0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void sub_100032200(void *a1, NSObject *a2)
{
  os_log_t v3 = [a1 systemInfo];
  [v3 type];
  v4[0] = 136315394;
  sub_1000249FC();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: FAT%d has 32b FAT sectors", (uint8_t *)v4, 0x12u);
}

void sub_1000322B0()
{
  sub_10002A9D0();
  os_log_t v3 = [v2 systemInfo];
  int v5 = 136315650;
  os_log_type_t v6 = "-[msdosVolume ScanBootSector]";
  __int16 v7 = 1024;
  if ([v3 type] == 12) {
    int v4 = 12;
  }
  else {
    int v4 = 16;
  }
  int v8 = v4;
  __int16 v9 = 1024;
  int v10 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: FAT%d total sectors (%u) fit in 16b but stored in 32b", (uint8_t *)&v5, 0x18u);
}

void sub_10003237C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000323F4()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to read FS Info sector, error %@, ignoring", v2, v3, v4, v5, 2u);
}

void sub_100032468()
{
  sub_10002A9D0();
  uint64_t v1 = [v0 resource];
  [v1 blockCount];
  sub_10002A9A0();
  sub_10002A9FC((void *)&_mh_execute_header, v2, v3, "%s: device sector count (%llu) is less than volume sector count (%u)", v4, v5, v6, v7, 2u);
}

void sub_100032504()
{
  sub_10002A9D0();
  uint64_t v1 = [v0 systemInfo];
  [v1 maxValidCluster];
  sub_10002A9A0();
  sub_10002A9FC((void *)&_mh_execute_header, v2, v3, "%s: max cluster exceeds FAT capacity (%llu, %u)", v4, v5, v6, v7, 2u);
}

void sub_1000325A0(void *a1)
{
  uint64_t v1 = [a1 systemInfo];
  [v1 maxValidCluster];
  sub_10002A9DC((void *)&_mh_execute_header, v2, v3, "%s: Clusters number is too large (0x%llx)", v4, v5, v6, v7, 2u);
}

void sub_100032644()
{
  v1[0] = 136315394;
  sub_1000249FC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Invalid sectors per cluster (%u)", (uint8_t *)v1, 0x12u);
}

void sub_1000326C8()
{
  sub_10002A9D0();
  uint64_t v1 = [v0 systemInfo];
  [v1 bytesPerSector];
  sub_10002A9C0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x18u);
}

void sub_100032780(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *(unsigned __int8 *)(a2 + 511);
  int v5 = 136315650;
  uint64_t v6 = "-[msdosVolume ScanBootSector]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Invalid boot signature (0x%02X 0x%02X)", (uint8_t *)&v5, 0x18u);
}

void sub_100032820()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't iterate root dir. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100032894(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003290C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[msdosVolume FatMount:replyHandler:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Failed to create root item", (uint8_t *)&v1, 0xCu);
}

void sub_100032990(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032A2C()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to read dirty bit value, error: %@", v2, v3, v4, v5, 2u);
}

void sub_100032AA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032B18()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to update FSInfo sector, error %@", v2, v3, v4, v5, 2u);
}

void sub_100032B8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032C04()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Couldn't set the dirty bit. Error = %@.", v2, v3, v4, v5, 2u);
}

void sub_100032C78(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid jump signature (0x%02X)", (uint8_t *)v3, 8u);
}

void sub_100032CF4(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *(unsigned __int8 *)(a2 + 511);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid boot signature (0x%02X 0x%02X)", (uint8_t *)v5, 0xEu);
}

void sub_100032D84(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[Utilities getVolumeName:bps:spc:bootsector:flags:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: This method should not be called after metaRW is enabled.", (uint8_t *)&v1, 0xCu);
}

void sub_100032E08(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[Utilities getVolumeName:bps:spc:bootsector:flags:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: bootsector wasn't given", (uint8_t *)&v1, 0xCu);
}

void sub_100032E8C()
{
  int v2 = 136315650;
  sub_10001504C();
  sub_100015068((void *)&_mh_execute_header, v0, v1, "%s: Expected to read %lu bytes, read %lu", v2, v3, v4);
}

void sub_100032F00()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to read, error %@", v2, v3, v4, v5, 2u);
}

void sub_100032F74()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to meta read, error %@", v2, v3, v4, v5, 2u);
}

void sub_100032FE8()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to read, error %@", v2, v3, v4, v5, 2u);
}

void sub_10003305C()
{
  int v2 = 136315650;
  sub_10001504C();
  sub_100015068((void *)&_mh_execute_header, v0, v1, "%s: Expected to write %lu bytes, wrote %lu", v2, v3, v4);
}

void sub_1000330D0()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to write, error %@", v2, v3, v4, v5, 2u);
}

void sub_100033144()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to meta clear, error %@", v2, v3, v4, v5, 2u);
}

void sub_1000331B8()
{
  sub_100008F2C();
  sub_100008EFC((void *)&_mh_execute_header, v0, v1, "%s: Failed to meta purge, error %@", v2, v3, v4, v5, 2u);
}

void sub_10003322C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "+[Utilities enableMetaRW]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: start", (uint8_t *)&v1, 0xCu);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return ___snprintf_chk(a1, a2, a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uint64_t fs_errorForPOSIXError()
{
  return _fs_errorForPOSIXError();
}

uint64_t fskit_std_log()
{
  return _fskit_std_log();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return _gmtime(a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_FATMask(void *a1, const char *a2, ...)
{
  return [a1 FATMask];
}

id objc_msgSend_ScanBootSector(void *a1, const char *a2, ...)
{
  return [a1 ScanBootSector];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accessTime(void *a1, const char *a2, ...)
{
  return [a1 accessTime];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asynchronousMetadataFlush(void *a1, const char *a2, ...)
{
  return [a1 asynchronousMetadataFlush];
}

id objc_msgSend_birthTime(void *a1, const char *a2, ...)
{
  return [a1 birthTime];
}

id objc_msgSend_blockCount(void *a1, const char *a2, ...)
{
  return [a1 blockCount];
}

id objc_msgSend_blockLength(void *a1, const char *a2, ...)
{
  return [a1 blockLength];
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return [a1 blockSize];
}

id objc_msgSend_blockmapRequests(void *a1, const char *a2, ...)
{
  return [a1 blockmapRequests];
}

id objc_msgSend_bsdFlags(void *a1, const char *a2, ...)
{
  return [a1 bsdFlags];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesPerCluster(void *a1, const char *a2, ...)
{
  return [a1 bytesPerCluster];
}

id objc_msgSend_bytesPerSector(void *a1, const char *a2, ...)
{
  return [a1 bytesPerSector];
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return [a1 cacheKey];
}

id objc_msgSend_changeTime(void *a1, const char *a2, ...)
{
  return [a1 changeTime];
}

id objc_msgSend_checkIfEmpty(void *a1, const char *a2, ...)
{
  return [a1 checkIfEmpty];
}

id objc_msgSend_checkSum(void *a1, const char *a2, ...)
{
  return [a1 checkSum];
}

id objc_msgSend_clustersPerBlock(void *a1, const char *a2, ...)
{
  return [a1 clustersPerBlock];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRootDirItem(void *a1, const char *a2, ...)
{
  return [a1 createRootDirItem];
}

id objc_msgSend_currCount(void *a1, const char *a2, ...)
{
  return [a1 currCount];
}

id objc_msgSend_currSize(void *a1, const char *a2, ...)
{
  return [a1 currSize];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dir(void *a1, const char *a2, ...)
{
  return [a1 dir];
}

id objc_msgSend_dirBlockSize(void *a1, const char *a2, ...)
{
  return [a1 dirBlockSize];
}

id objc_msgSend_dirEntrySize(void *a1, const char *a2, ...)
{
  return [a1 dirEntrySize];
}

id objc_msgSend_dirVersion(void *a1, const char *a2, ...)
{
  return [a1 dirVersion];
}

id objc_msgSend_dirtyBitValue(void *a1, const char *a2, ...)
{
  return [a1 dirtyBitValue];
}

id objc_msgSend_dnc(void *a1, const char *a2, ...)
{
  return [a1 dnc];
}

id objc_msgSend_dosDirEntryDirBlockNum(void *a1, const char *a2, ...)
{
  return [a1 dosDirEntryDirBlockNum];
}

id objc_msgSend_dosDirEntryOffsetInDirBlock(void *a1, const char *a2, ...)
{
  return [a1 dosDirEntryOffsetInDirBlock];
}

id objc_msgSend_enableMetaRW(void *a1, const char *a2, ...)
{
  return [a1 enableMetaRW];
}

id objc_msgSend_entryData(void *a1, const char *a2, ...)
{
  return [a1 entryData];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_fatManager(void *a1, const char *a2, ...)
{
  return [a1 fatManager];
}

id objc_msgSend_fatOffset(void *a1, const char *a2, ...)
{
  return [a1 fatOffset];
}

id objc_msgSend_fatQueue(void *a1, const char *a2, ...)
{
  return [a1 fatQueue];
}

id objc_msgSend_fatSize(void *a1, const char *a2, ...)
{
  return [a1 fatSize];
}

id objc_msgSend_fatType(void *a1, const char *a2, ...)
{
  return [a1 fatType];
}

id objc_msgSend_firstCluster(void *a1, const char *a2, ...)
{
  return [a1 firstCluster];
}

id objc_msgSend_firstClusterInLastAllocation(void *a1, const char *a2, ...)
{
  return [a1 firstClusterInLastAllocation];
}

id objc_msgSend_firstClusterIndexInLastAllocation(void *a1, const char *a2, ...)
{
  return [a1 firstClusterIndexInLastAllocation];
}

id objc_msgSend_firstClusterOffset(void *a1, const char *a2, ...)
{
  return [a1 firstClusterOffset];
}

id objc_msgSend_firstDirBlockNum(void *a1, const char *a2, ...)
{
  return [a1 firstDirBlockNum];
}

id objc_msgSend_firstEntryOffsetInDir(void *a1, const char *a2, ...)
{
  return [a1 firstEntryOffsetInDir];
}

id objc_msgSend_firstFreeCluster(void *a1, const char *a2, ...)
{
  return [a1 firstFreeCluster];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_flushDirEntryData(void *a1, const char *a2, ...)
{
  return [a1 flushDirEntryData];
}

id objc_msgSend_freeClusters(void *a1, const char *a2, ...)
{
  return [a1 freeClusters];
}

id objc_msgSend_fsInfo(void *a1, const char *a2, ...)
{
  return [a1 fsInfo];
}

id objc_msgSend_fsInfoSector(void *a1, const char *a2, ...)
{
  return [a1 fsInfoSector];
}

id objc_msgSend_fsInfoSectorNumber(void *a1, const char *a2, ...)
{
  return [a1 fsInfoSectorNumber];
}

id objc_msgSend_fsOps(void *a1, const char *a2, ...)
{
  return [a1 fsOps];
}

id objc_msgSend_fsSubTypeNum(void *a1, const char *a2, ...)
{
  return [a1 fsSubTypeNum];
}

id objc_msgSend_fsTypeName(void *a1, const char *a2, ...)
{
  return [a1 fsTypeName];
}

id objc_msgSend_getAttrFlags(void *a1, const char *a2, ...)
{
  return [a1 getAttrFlags];
}

id objc_msgSend_getAttrRequestForNewDirEntry(void *a1, const char *a2, ...)
{
  return [a1 getAttrRequestForNewDirEntry];
}

id objc_msgSend_getAvailableEntry(void *a1, const char *a2, ...)
{
  return [a1 getAvailableEntry];
}

id objc_msgSend_getDefaultDOSEncoding(void *a1, const char *a2, ...)
{
  return [a1 getDefaultDOSEncoding];
}

id objc_msgSend_getDirBlockSize(void *a1, const char *a2, ...)
{
  return [a1 getDirBlockSize];
}

id objc_msgSend_getDirSize(void *a1, const char *a2, ...)
{
  return [a1 getDirSize];
}

id objc_msgSend_getDirtyBitCluster(void *a1, const char *a2, ...)
{
  return [a1 getDirtyBitCluster];
}

id objc_msgSend_getDirtyBitMask(void *a1, const char *a2, ...)
{
  return [a1 getDirtyBitMask];
}

id objc_msgSend_getFileID(void *a1, const char *a2, ...)
{
  return [a1 getFileID];
}

id objc_msgSend_getName(void *a1, const char *a2, ...)
{
  return [a1 getName];
}

id objc_msgSend_getNextAvailableFileID(void *a1, const char *a2, ...)
{
  return [a1 getNextAvailableFileID];
}

id objc_msgSend_getSize(void *a1, const char *a2, ...)
{
  return [a1 getSize];
}

id objc_msgSend_getValidDataLength(void *a1, const char *a2, ...)
{
  return [a1 getValidDataLength];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isFAT12Or16(void *a1, const char *a2, ...)
{
  return [a1 isFAT12Or16];
}

id objc_msgSend_isFat1216RootDir(void *a1, const char *a2, ...)
{
  return [a1 isFat1216RootDir];
}

id objc_msgSend_isInUse(void *a1, const char *a2, ...)
{
  return [a1 isInUse];
}

id objc_msgSend_isIncomplete(void *a1, const char *a2, ...)
{
  return [a1 isIncomplete];
}

id objc_msgSend_isPreAllocated(void *a1, const char *a2, ...)
{
  return [a1 isPreAllocated];
}

id objc_msgSend_isRoot(void *a1, const char *a2, ...)
{
  return [a1 isRoot];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_itemCache(void *a1, const char *a2, ...)
{
  return [a1 itemCache];
}

id objc_msgSend_lastCluster(void *a1, const char *a2, ...)
{
  return [a1 lastCluster];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_maxFileSize(void *a1, const char *a2, ...)
{
  return [a1 maxFileSize];
}

id objc_msgSend_maxShortNameIndex(void *a1, const char *a2, ...)
{
  return [a1 maxShortNameIndex];
}

id objc_msgSend_maxValidCluster(void *a1, const char *a2, ...)
{
  return [a1 maxValidCluster];
}

id objc_msgSend_metaDataZoneSize(void *a1, const char *a2, ...)
{
  return [a1 metaDataZoneSize];
}

id objc_msgSend_metadataFlush(void *a1, const char *a2, ...)
{
  return [a1 metadataFlush];
}

id objc_msgSend_modifyTime(void *a1, const char *a2, ...)
{
  return [a1 modifyTime];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameCachePool(void *a1, const char *a2, ...)
{
  return [a1 nameCachePool];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_numBytesPerClusterInFat(void *a1, const char *a2, ...)
{
  return [a1 numBytesPerClusterInFat];
}

id objc_msgSend_numLongNameEntries(void *a1, const char *a2, ...)
{
  return [a1 numLongNameEntries];
}

id objc_msgSend_numLongNameEntriesLeft(void *a1, const char *a2, ...)
{
  return [a1 numLongNameEntriesLeft];
}

id objc_msgSend_numOfFATs(void *a1, const char *a2, ...)
{
  return [a1 numOfFATs];
}

id objc_msgSend_numberOfClusters(void *a1, const char *a2, ...)
{
  return [a1 numberOfClusters];
}

id objc_msgSend_numberOfDirEntries(void *a1, const char *a2, ...)
{
  return [a1 numberOfDirEntries];
}

id objc_msgSend_offsetForNewEntry(void *a1, const char *a2, ...)
{
  return [a1 offsetForNewEntry];
}

id objc_msgSend_offsetInVolume(void *a1, const char *a2, ...)
{
  return [a1 offsetInVolume];
}

id objc_msgSend_openUnlinkedFiles(void *a1, const char *a2, ...)
{
  return [a1 openUnlinkedFiles];
}

id objc_msgSend_originalFileSize(void *a1, const char *a2, ...)
{
  return [a1 originalFileSize];
}

id objc_msgSend_parentDir(void *a1, const char *a2, ...)
{
  return [a1 parentDir];
}

id objc_msgSend_physicalBlockSize(void *a1, const char *a2, ...)
{
  return [a1 physicalBlockSize];
}

id objc_msgSend_preAllocatedOpenFiles(void *a1, const char *a2, ...)
{
  return [a1 preAllocatedOpenFiles];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_reclaim(void *a1, const char *a2, ...)
{
  return [a1 reclaim];
}

id objc_msgSend_releaseBlock(void *a1, const char *a2, ...)
{
  return [a1 releaseBlock];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resource(void *a1, const char *a2, ...)
{
  return [a1 resource];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rootDirBytes(void *a1, const char *a2, ...)
{
  return [a1 rootDirBytes];
}

id objc_msgSend_rootDirSize(void *a1, const char *a2, ...)
{
  return [a1 rootDirSize];
}

id objc_msgSend_rootFirstCluster(void *a1, const char *a2, ...)
{
  return [a1 rootFirstCluster];
}

id objc_msgSend_rootItem(void *a1, const char *a2, ...)
{
  return [a1 rootItem];
}

id objc_msgSend_rootSector(void *a1, const char *a2, ...)
{
  return [a1 rootSector];
}

id objc_msgSend_rwSize(void *a1, const char *a2, ...)
{
  return [a1 rwSize];
}

id objc_msgSend_sem(void *a1, const char *a2, ...)
{
  return [a1 sem];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serialNumberExists(void *a1, const char *a2, ...)
{
  return [a1 serialNumberExists];
}

id objc_msgSend_setArchiveBit(void *a1, const char *a2, ...)
{
  return [a1 setArchiveBit];
}

id objc_msgSend_setDeleted(void *a1, const char *a2, ...)
{
  return [a1 setDeleted];
}

id objc_msgSend_setGMTDiffOffset(void *a1, const char *a2, ...)
{
  return [a1 setGMTDiffOffset];
}

id objc_msgSend_sharedUtilities(void *a1, const char *a2, ...)
{
  return [a1 sharedUtilities];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_startOffset(void *a1, const char *a2, ...)
{
  return [a1 startOffset];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_symlinkLength(void *a1, const char *a2, ...)
{
  return [a1 symlinkLength];
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return [a1 sync];
}

id objc_msgSend_systemInfo(void *a1, const char *a2, ...)
{
  return [a1 systemInfo];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateFATStats(void *a1, const char *a2, ...)
{
  return [a1 updateFATStats];
}

id objc_msgSend_updateModificationTimeOnCreateRemove(void *a1, const char *a2, ...)
{
  return [a1 updateModificationTimeOnCreateRemove];
}

id objc_msgSend_updatePreallocStatus(void *a1, const char *a2, ...)
{
  return [a1 updatePreallocStatus];
}

id objc_msgSend_useMetaRW(void *a1, const char *a2, ...)
{
  return [a1 useMetaRW];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 volumeIdentifier];
}

id objc_msgSend_volumeLabel(void *a1, const char *a2, ...)
{
  return [a1 volumeLabel];
}

id objc_msgSend_writeCounter(void *a1, const char *a2, ...)
{
  return [a1 writeCounter];
}

id objc_msgSend_writeToDisk(void *a1, const char *a2, ...)
{
  return [a1 writeToDisk];
}

id objc_msgSend_writeToDiskFromOffset_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToDiskFromOffset:length:");
}