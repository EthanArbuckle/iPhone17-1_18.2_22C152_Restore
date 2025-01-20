uint64_t start(int a1, uint64_t a2)
{
  const char *v2;
  unsigned char *v4;
  int v5;
  const char *v6;
  int v7;
  unsigned char *v8;
  const char **v9;
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  int v14;
  uint64_t v15;
  unsigned __int16 *v16;
  char *v17;
  unsigned int v18;
  char *v19;
  unsigned int v20;
  const char *v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  const UInt8 *v25;
  unint64_t v26;
  unint64_t v27;
  _WORD *v28;
  uint64_t v29;
  CFStringRef v30;
  CFStringRef v31;
  unint64_t MaximumSizeOfFileSystemRepresentation;
  char *v33;
  char *v34;
  size_t v35;
  FILE *v37;
  int *v38;
  stat v39;
  unsigned __int16 *v40;
  char v41[1024];
  char __str[1024];
  vfsconf __buf;
  long long v44;
  long long v45;
  long long v46;
  const char *v47;
  const char *v48;
  char *v49;
  unsigned char *v50;
  uint64_t v51;
  long long v52;
  uint64_t v53;

  v2 = *(const char **)a2;
  if (a1 < 3) {
    goto LABEL_101;
  }
  memset(&v39, 0, sizeof(v39));
  v4 = *(unsigned char **)(a2 + 8);
  if (*v4 != 45) {
    goto LABEL_101;
  }
  v5 = (char)v4[1];
  v6 = *(const char **)(a2 + 16);
  if (v5 > 111)
  {
    if (v5 == 112)
    {
      if (a1 != 5) {
        goto LABEL_101;
      }
      goto LABEL_15;
    }
    if (v5 == 117 && a1 == 4) {
      goto LABEL_15;
    }
LABEL_101:
    sub_100002AC4(v2);
  }
  if (v5 == 107)
  {
    if (a1 != 3) {
      goto LABEL_101;
    }
  }
  else if (v5 != 109 || a1 != 8)
  {
    goto LABEL_101;
  }
LABEL_15:
  v7 = v4[1];
  if (!strncmp(*(const char **)(a2 + 16), "disk", 4uLL))
  {
    if (snprintf(__str, 0x400uLL, "/dev/r%s", v6) < 1024)
    {
      if (stat(__str, &v39))
      {
LABEL_103:
        v37 = __stderrp;
        v38 = __error();
        strerror(*v38);
        fprintf(v37, "%s: stat %s failed, %s\n");
        goto LABEL_105;
      }
      if (snprintf(v41, 0x400uLL, "/dev/%s", v6) < 1024)
      {
        if (!stat(v41, &v39)) {
          goto LABEL_24;
        }
        goto LABEL_103;
      }
    }
    fprintf(__stderrp, "%s: Specified device name is too long.\n");
    goto LABEL_105;
  }
  if (strncmp(v6, "/dev/fd/", 8uLL)) {
    goto LABEL_105;
  }
  if (v7 != 107 && v7 != 112)
  {
    fprintf(__stderrp, "%s: only support fd during probing or getting voolume uuid");
LABEL_105:
    exit(-6);
  }
  __strlcpy_chk();
LABEL_24:
  if (v5 == 117 || v5 == 109)
  {
    v8 = *(unsigned char **)(a2 + 24);
    v9 = (const char **)(a2 + 32);
  }
  else
  {
    v8 = 0;
    v9 = (const char **)(a2 + 24);
  }
  if (v5 == 112 || v5 == 109)
  {
    v10 = *v9;
    if (strcmp(*v9, "removable") && strcmp(v10, "fixed")) {
      goto LABEL_101;
    }
    v11 = v9[1];
    if (!strcmp(v11, "readonly"))
    {
      v12 = 1;
    }
    else
    {
      if (strcmp(v11, "writable")) {
        goto LABEL_101;
      }
      v12 = 0;
    }
    if (v7 == 109)
    {
      v13 = v9[2];
      if (!strcmp(v13, "nosuid"))
      {
        v14 = 1;
      }
      else
      {
        if (strcmp(v13, "suid")) {
          goto LABEL_101;
        }
        v14 = 0;
      }
      v21 = v9[3];
      if (!strcmp(v21, "nodev"))
      {
        v22 = 0;
        goto LABEL_63;
      }
      if (strcmp(v21, "dev")) {
        goto LABEL_101;
      }
LABEL_61:
      v22 = 1;
LABEL_63:
      v52 = *(_OWORD *)off_100004120;
      v53 = 0;
      *(void *)&v44 = "/sbin/mount";
      *((void *)&v44 + 1) = "-w";
      *(void *)&v45 = "-o";
      *((void *)&v45 + 1) = "suid";
      *(void *)&v46 = "-o";
      *((void *)&v46 + 1) = "dev";
      v47 = "-t";
      v48 = "ntfs";
      v49 = v41;
      v50 = v8;
      v51 = 0;
      if (v8 && *v8)
      {
        if (v12) {
          *((void *)&v44 + 1) = "-r";
        }
        if (v14) {
          *((void *)&v45 + 1) = "nosuid";
        }
        if ((v22 & 1) == 0) {
          *((void *)&v46 + 1) = "nodev";
        }
        memset(&__buf, 0, sizeof(__buf));
        if (getvfsbyname("ntfs", &__buf)) {
          sub_1000036F8(v2, (const char **)&v52);
        }
        return sub_1000036F8(v2, (const char **)&v44);
      }
      return 4294967290;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v5 > 111)
  {
    if (v5 != 112)
    {
      *(void *)&v44 = "/sbin/umount";
      *((void *)&v44 + 1) = v8;
      *(void *)&v45 = 0;
      if (v8 && *v8) {
        return sub_1000036F8(v2, (const char **)&v44);
      }
      return 4294967290;
    }
    *(void *)&v52 = 0;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v15 = sub_100002CC0(__str, (uint64_t)&v44, (unsigned __int16 **)&v52);
    if (v15 == -1)
    {
      v16 = (unsigned __int16 *)v52;
      v19 = (char *)v16 + v16[10];
      *(void *)&__buf.vfc_reserved1 = v52;
      *(void *)&__buf.vfc_name[4] = v19;
      v20 = sub_100003148(0x60u, (unint64_t *)&__buf.vfc_reserved1);
      if (v20)
      {
        if (v20 == -2) {
          v15 = 0xFFFFFFFFLL;
        }
        else {
          v15 = v20;
        }
        goto LABEL_95;
      }
      if (!*(unsigned char *)(*(void *)&__buf.vfc_name[4] + 8))
      {
        v25 = (const UInt8 *)(*(void *)&__buf.vfc_name[4] + *(unsigned __int16 *)(*(void *)&__buf.vfc_name[4] + 20));
        v26 = *(unsigned int *)(*(void *)&__buf.vfc_name[4] + 16);
        if (&v25[v26] <= (const UInt8 *)v16 + DWORD2(v44)
          && (unint64_t)&v25[v26] <= *(void *)&__buf.vfc_name[4]
                                          + (unint64_t)*(unsigned int *)(*(void *)&__buf.vfc_name[4] + 4))
        {
          if (v26 >= 2)
          {
            v27 = v26 >> 1;
            v28 = (_WORD *)(*(void *)&__buf.vfc_name[4] + *(unsigned __int16 *)(*(void *)&__buf.vfc_name[4] + 20));
            do
            {
              if ((*v28 & 0xFFC0) == 0xF000)
              {
                v29 = *v28 & 0x3FLL;
                if (v29 <= 0x29) {
                  *v28 = byte_100003A90[v29];
                }
              }
              ++v28;
              --v27;
            }
            while (v27);
          }
          v30 = CFStringCreateWithBytes(kCFAllocatorDefault, v25, v26 & 0xFFFFFFFE, 0x14000100u, 1u);
          if (v30)
          {
            v31 = v30;
            MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v30);
            v33 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x259BD355uLL);
            if (v33)
            {
              v34 = v33;
              if (CFStringGetFileSystemRepresentation(v31, v33, MaximumSizeOfFileSystemRepresentation)
                && (v35 = strlen(v34), v35 <= MaximumSizeOfFileSystemRepresentation))
              {
                write(1, v34, v35);
                v15 = 0xFFFFFFFFLL;
              }
              else
              {
                v15 = 4294967292;
              }
              free(v34);
            }
            else
            {
              v15 = 4294967292;
            }
            CFRelease(v31);
            goto LABEL_95;
          }
        }
      }
      goto LABEL_94;
    }
  }
  else
  {
    if (v5 != 107)
    {
      v14 = 0;
      goto LABEL_61;
    }
    v40 = 0;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v15 = sub_100002CC0(__str, (uint64_t)&v44, &v40);
    if (v15 == -1)
    {
      v16 = v40;
      v17 = (char *)v40 + v40[10];
      *(void *)&v52 = v40;
      *((void *)&v52 + 1) = v17;
      v18 = sub_100003148(0x40u, (unint64_t *)&v52);
      if (v18)
      {
        if (v18 == -2) {
          v15 = 4294967290;
        }
        else {
          v15 = v18;
        }
        goto LABEL_95;
      }
      if (!*(unsigned char *)(*((void *)&v52 + 1) + 8))
      {
        v23 = *((void *)&v52 + 1) + *(unsigned __int16 *)(*((void *)&v52 + 1) + 20);
        v24 = v23 + *(unsigned int *)(*((void *)&v52 + 1) + 16);
        if (v24 <= (unint64_t)v16 + DWORD2(v44)
          && v24 <= *((void *)&v52 + 1) + (unint64_t)*(unsigned int *)(*((void *)&v52 + 1) + 4)
          && snprintf((char *)&__buf, 0x25uLL, "%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x", *(_DWORD *)v23, *(unsigned __int16 *)(v23 + 4), *(unsigned __int16 *)(v23 + 6), *(unsigned __int8 *)(v23 + 8), *(unsigned __int8 *)(v23 + 9), *(unsigned __int8 *)(v23 + 10), *(unsigned __int8 *)(v23 + 11), *(unsigned __int8 *)(v23 + 12), *(unsigned __int8 *)(v23 + 13), *(unsigned __int8 *)(v23 + 14), *(unsigned __int8 *)(v23 + 15)) == 36)
        {
          write(1, &__buf, 0x24uLL);
          v15 = 4294967293;
LABEL_95:
          free(v16);
          return v15;
        }
      }
LABEL_94:
      v15 = 4294967292;
      goto LABEL_95;
    }
  }
  return v15;
}

void sub_100002AC4(const char *a1)
{
}

uint64_t sub_100002CC0(const char *a1, uint64_t a2, unsigned __int16 **a3)
{
  uint64_t v42 = 0;
  unsigned int v40 = 0;
  uint64_t v6 = sysconf(29);
  uint64_t v7 = 512;
  if (v6 > 512) {
    uint64_t v7 = v6;
  }
  if (v6 >= 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0x8000;
  }
  if (strncmp(a1, "/dev/rdisk", 0xAuLL))
  {
    if (strncmp(a1, "/dev/fd/", 8uLL)) {
      return 4294967292;
    }
    __endptr = 0;
    int v9 = strtol(a1 + 8, &__endptr, 10);
    if (*__endptr) {
      return 4294967292;
    }
    int v10 = v9;
    memset(&v39, 0, sizeof(v39));
    if (fstat(v9, &v39) || lseek(v10, 0, 0) == -1) {
      return 4294967292;
    }
LABEL_13:
    if (ioctl(v10, 0x40046418uLL, &v40) < 0
      || (v40 <= v8 ? (size_t v12 = v8) : (size_t v12 = v40),
          (v13 = (char *)malloc_type_malloc(v12, 0xF0EED71BuLL)) == 0))
    {
      uint64_t v11 = 4294967292;
LABEL_53:
      close(v10);
      return v11;
    }
    v14 = v13;
    if (read(v10, v13, v12) < 512) {
      goto LABEL_19;
    }
    if (*(void *)(v14 + 3) == 0x202020205346544ELL)
    {
      unsigned int v15 = *(unsigned __int16 *)(v14 + 11);
      if (v15 - 4097 >= 0xFFFFF0FF)
      {
        if ((uint64_t v16 = v14[13], (v16 - 1) <= 0x3F)
          && ((1 << (v16 - 1)) & 0x800000008000808BLL) != 0
          || v16 == 128)
        {
          unsigned int v17 = v16 * v15;
          if (v16 * v15 <= 0x10000
            && !*((_WORD *)v14 + 7)
            && !*(_WORD *)(v14 + 17)
            && !*(_WORD *)(v14 + 19)
            && !*((_WORD *)v14 + 11)
            && !*((_DWORD *)v14 + 8)
            && !v14[16])
          {
            int v18 = v14[64];
            if ((v14[64] + 8) <= 0xE8u)
            {
              if ((v18 - 1) > 0x3F) {
                goto LABEL_51;
              }
              uint64_t v11 = 4294967294;
              if (((1 << (v18 - 1)) & 0x800000008000808BLL) == 0) {
                goto LABEL_52;
              }
            }
            if ((v14[68] + 8) <= 0xE8u)
            {
              unsigned int v19 = v14[68] - 1;
              if (v19 > 0x3F) {
                goto LABEL_51;
              }
              uint64_t v11 = 4294967294;
              if (((1 << v19) & 0x800000008000808BLL) == 0) {
                goto LABEL_52;
              }
            }
            *(_DWORD *)a2 = v15;
            *(_DWORD *)(a2 + 4) = v17;
            if (v17 >= v15)
            {
              size_t v20 = v18 <= 0 ? (1 << -(char)v18) : v17 * v18;
              *(_DWORD *)(a2 + 8) = v20;
              uint64_t v21 = *((void *)v14 + 5) / v16;
              if (!HIDWORD(v21))
              {
                *(void *)(a2 + 40) = v21;
                uint64_t v22 = *((void *)v14 + 6);
                if (v22 < v21)
                {
                  *(void *)(a2 + 16) = v22;
                  uint64_t v23 = *((void *)v14 + 7);
                  if (v23 < v21)
                  {
                    *(void *)(a2 + 24) = v23;
                    v24 = (unsigned __int16 *)malloc_type_malloc(v20, 0x887CBB2FuLL);
                    if (!v24)
                    {
                      uint64_t v11 = 4294967290;
                      goto LABEL_52;
                    }
                    v25 = v24;
                    uint64_t v26 = sub_1000031BC(v10, v14, v12, (uint64_t)v24, *(unsigned int *)(a2 + 8), *(void *)(a2 + 16) * *(unsigned int *)(a2 + 4));
                    uint64_t v27 = *(unsigned int *)(a2 + 8);
                    if (v26 == v27 && !sub_100003298((uint64_t)v25, v27))
                    {
                      __darwin_ino64_t v30 = (__darwin_ino64_t)v25 + v25[10];
                      *(void *)&v39.st_dev = v25;
                      v39.st_ino = v30;
                      uint64_t v28 = sub_100003148(0x80u, (unint64_t *)&v39);
                      if (!v28)
                      {
                        __endptr = 0;
                        uint64_t v28 = sub_100003344(a2, v39.st_ino, &__endptr);
                        if (!v28)
                        {
                          unsigned int v31 = *(_DWORD *)(a2 + 4);
                          int v32 = *(_DWORD *)(a2 + 8);
                          uint64_t v33 = (v31 - 1) & (3 * v32);
                          v38 = __endptr;
                          uint64_t v34 = 3 * v32 / v31;
                          do
                          {
                            uint64_t v35 = sub_100003650(v38, v34, &v42);
                            if (v35 < 0
                              || ((uint64_t v36 = *(unsigned int *)(a2 + 4), v42 * v36 - v33 >= v32)
                                ? (uint64_t v37 = v32)
                                : (uint64_t v37 = v42 * v36 - v33),
                                  sub_1000031BC(v10, v14, v12, (uint64_t)v25, v37, v33 + v35 * v36) != v37))
                            {
                              free(v38);
                              goto LABEL_68;
                            }
                            uint64_t v33 = 0;
                            v32 -= v37;
                            v34 += v42;
                          }
                          while (v32 > 0);
                          free(v38);
                          if (!sub_100003298((uint64_t)v25, *(_DWORD *)(a2 + 8)))
                          {
                            close(v10);
                            free(v14);
                            *a3 = v25;
                            return 0xFFFFFFFFLL;
                          }
LABEL_68:
                          free(v25);
LABEL_19:
                          uint64_t v11 = 4294967292;
LABEL_52:
                          free(v14);
                          goto LABEL_53;
                        }
                      }
                    }
                    else
                    {
                      uint64_t v28 = 4294967292;
                    }
                    free(v25);
                    uint64_t v11 = v28;
                    goto LABEL_52;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_51:
    uint64_t v11 = 4294967294;
    goto LABEL_52;
  }
  int v10 = open(a1, 0);
  if (v10 != -1) {
    goto LABEL_13;
  }
  return 4294967292;
}

uint64_t sub_100003148(unsigned int a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  v2 = (unsigned int *)a2[1];
  if ((unint64_t)v2 >= *a2)
  {
    unint64_t v5 = v3 + *(unsigned int *)(v3 + 28);
    while ((unint64_t)v2 <= v5)
    {
      a2[1] = (unint64_t)v2;
      unsigned int v6 = *v2;
      if (*v2 > a1 || v6 == -1) {
        return 4294967294;
      }
      uint64_t v8 = v2[1];
      if (!v8) {
        return 4294967292;
      }
      if (v6 == a1)
      {
        if (*((unsigned char *)v2 + 9)) {
          return 4294967294;
        }
        else {
          return 0;
        }
      }
      v2 = (unsigned int *)((char *)v2 + v8);
      if ((unint64_t)v2 < v3) {
        return 4294967292;
      }
    }
  }
  return 4294967292;
}

uint64_t sub_1000031BC(int __fd, char *__buf, int64_t __nbyte, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5 < 1) {
    return 0;
  }
  int64_t v6 = a5;
  uint64_t v10 = 0;
  off_t v11 = -__nbyte & a6;
  size_t v12 = (__nbyte - 1) & a6;
  int64_t v13 = __nbyte - v12;
  v14 = &__buf[v12];
  while (1)
  {
    int64_t v15 = v13 >= v6 ? v6 : v13;
    if (pread(__fd, __buf, __nbyte, v11) < (uint64_t)(v15 + v12)) {
      break;
    }
    memcpy((void *)(a4 + v10), v14, v15);
    v10 += v15;
    BOOL v16 = v6 <= v15;
    v6 -= v15;
    if (v16) {
      return v10;
    }
  }
  if (!v10) {
    return -1;
  }
  return v10;
}

uint64_t sub_100003298(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x1FF) != 0) {
    return 0;
  }
  unsigned int v2 = *(unsigned __int16 *)(a1 + 4);
  if (v2) {
    return 0;
  }
  int v3 = *(unsigned __int16 *)(a1 + 6);
  int v4 = v3 - 1;
  BOOL v5 = (unsigned __int16)(v3 - 1) != a2 >> 9 || v2 + 2 * (unsigned __int16)(v3 - 1) > a2;
  if (v5 || (_WORD)v3 == 1) {
    return 0;
  }
  uint64_t v6 = v2 >> 1;
  uint64_t v7 = (_WORD *)(a1 + 510);
  int v8 = v3 - 2;
  uint64_t v9 = 510;
  do
  {
    if (*(unsigned __int16 *)(a1 + v9) != *(unsigned __int16 *)(a1 + 2 * v6))
    {
      *(_DWORD *)a1 = 1145127234;
      return 4294967292;
    }
    v9 += 512;
  }
  while ((unsigned __int16)v8-- != 0);
  off_t v11 = (__int16 *)(a1 + 2 * v6 + 2);
  do
  {
    uint64_t result = 0;
    __int16 v13 = *v11++;
    *uint64_t v7 = v13;
    v7 += 256;
    --v4;
  }
  while ((_WORD)v4);
  return result;
}

uint64_t sub_100003344(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 4294967290;
  }
  if (!*(unsigned char *)(a2 + 8)) {
    return 4294967290;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4 < 0) {
    return 4294967290;
  }
  unint64_t v5 = *(unsigned __int16 *)(a2 + 32);
  unint64_t v6 = *(unsigned int *)(a2 + 4);
  if (v5 > v6) {
    return 4294967292;
  }
  uint64_t v9 = (unsigned char *)(a2 + v5);
  if (!v4)
  {
    if (!*v9) {
      return 4294967294;
    }
    uint64_t v36 = a1;
    uint64_t v10 = malloc_type_malloc(0x400uLL, 0x77C6C304uLL);
    if (v10)
    {
      uint64_t v35 = a3;
      unsigned __int16 v11 = 0;
      goto LABEL_12;
    }
    return 4294967290;
  }
  uint64_t v36 = a1;
  uint64_t v10 = malloc_type_malloc(0x400uLL, 0x77C6C304uLL);
  if (!v10) {
    return 4294967290;
  }
  uint64_t v35 = a3;
  *(_OWORD *)uint64_t v10 = xmmword_100003A80;
  v10[2] = v4;
  unsigned __int16 v11 = 1;
LABEL_12:
  if (v5 >= v6) {
    goto LABEL_50;
  }
  uint64_t v12 = 0;
  unint64_t v13 = a2 + v6;
  size_t v14 = 1024;
  while (*v9)
  {
    unsigned int v15 = v11;
    if (24 * (unint64_t)v11 + 72 > v14)
    {
      uint64_t v37 = v4;
      BOOL v16 = v10;
      uint64_t v17 = v12;
      int v18 = malloc_type_malloc(v14 + 1024, 0x57635A31uLL);
      if (!v18)
      {
        uint64_t v7 = 4294967290;
        uint64_t v10 = v16;
        goto LABEL_51;
      }
      unsigned int v19 = v18;
      memcpy(v18, v16, v14);
      free(v16);
      uint64_t v10 = v19;
      v14 += 1024;
      uint64_t v12 = v17;
      unsigned int v15 = v11;
      uint64_t v4 = v37;
    }
    v10[3 * v15] = v4;
    uint64_t v20 = *v9 & 0xF;
    if ((*v9 & 0xF) == 0 || (unint64_t)&v9[v20] >= v13) {
      goto LABEL_50;
    }
    unint64_t v21 = (char)v9[v20];
    LODWORD(v20) = v20 - 1;
    if (v20)
    {
      uint64_t v20 = v20;
      do
        unint64_t v21 = v9[v20--] | (v21 << 8);
      while ((_BYTE)v20);
    }
    if ((v21 & 0x8000000000000000) != 0) {
      goto LABEL_50;
    }
    v10[3 * v15 + 2] = v21;
    unsigned int v22 = *v9;
    if (v22 >= 0x10)
    {
      unsigned int v24 = v22 & 0xF;
      uint64_t v25 = v24 + (v22 >> 4);
      if ((unint64_t)&v9[v25] >= v13) {
        goto LABEL_50;
      }
      unint64_t v26 = (char)v9[v25];
      LODWORD(v25) = v25 - 1;
      if (v25 > v24)
      {
        uint64_t v25 = v25;
        do
          unint64_t v26 = v9[v25--] | (v26 << 8);
        while (v24 < v25);
      }
      uint64_t v23 = v26 + v12;
      uint64_t v12 = v23;
      if (v23 < -1) {
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v23 = -1;
    }
    v4 += v21;
    v10[3 * v15 + 1] = v23;
    ++v11;
    v9 += (*v9 & 0xF) + (*v9 >> 4) + 1;
    if ((unint64_t)v9 >= v13) {
      goto LABEL_50;
    }
  }
  uint64_t v28 = *(void *)(a2 + 24);
  if (v28 && v4 - 1 != v28) {
    goto LABEL_50;
  }
  if (*(void *)(a2 + 16))
  {
    uint64_t v30 = -2;
LABEL_49:
    uint64_t v7 = 0;
    uint64_t v34 = &v10[3 * v11];
    *uint64_t v34 = v4;
    v34[1] = v30;
    v34[2] = 0;
    *uint64_t v35 = v10;
    return v7;
  }
  if (!v28)
  {
LABEL_48:
    uint64_t v30 = -3;
    goto LABEL_49;
  }
  uint64_t v31 = (*(void *)(a2 + 40) + *(unsigned int *)(v36 + 4) - 1) / *(unsigned int *)(v36 + 4);
  uint64_t v32 = v31 - 1 - v28;
  if (v31 - 1 > v28)
  {
    uint64_t v33 = &v10[3 * v11];
    *uint64_t v33 = v4;
    v4 += v32;
    v33[1] = -2;
    v33[2] = v32;
    ++v11;
    goto LABEL_48;
  }
  if (v28 < v31) {
    goto LABEL_48;
  }
LABEL_50:
  uint64_t v7 = 4294967292;
LABEL_51:
  free(v10);
  return v7;
}

uint64_t sub_100003650(void *a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return -2;
  }
  if (*a1 > a2) {
    return -3;
  }
  unsigned int v4 = 1;
  while (1)
  {
    unsigned int v5 = v4 - 1;
    uint64_t v6 = a1[3 * v4 - 1];
    if (!v6) {
      break;
    }
    uint64_t v7 = a1[3 * v4++];
    if (v7 > a2)
    {
      uint64_t v8 = a2 - a1[3 * v5];
      if (a3) {
        *a3 = v6 - v8;
      }
      uint64_t v9 = a1[3 * v5 + 1];
      if (v9 >= 0) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 0;
      }
      return v10 + v9;
    }
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t v11 = a1[3 * v5 + 1];
  if (v11 >= 0) {
    return -3;
  }
  else {
    return v11;
  }
}

uint64_t sub_1000036F8(const char *a1, const char **a2)
{
  int v15 = 0;
  pid_t v4 = fork();
  if (v4 == -1)
  {
    unsigned int v5 = __stderrp;
    uint64_t v6 = __error();
    strerror(*v6);
    fprintf(v5, "%s: fork failed: %s\n");
    return 4294967290;
  }
  if (!v4)
  {
    execv(*a2, (char *const *)a2);
    int v11 = *__error();
    uint64_t v12 = __stderrp;
    unint64_t v13 = *a2;
    size_t v14 = strerror(v11);
    fprintf(v12, "%s: execv %s failed: %s\n", a1, v13, v14);
    exit(v11);
  }
  if (wait4(v4, &v15, 0, 0) != v4)
  {
    fprintf(__stderrp, "%s: BUG executing %s command.\n");
    return 4294967290;
  }
  if ((v15 & 0x7F) != 0)
  {
    fprintf(__stderrp, "%s: %s command aborted by signal %d.\n");
    return 4294967290;
  }
  if (!BYTE1(v15)) {
    return 4294967293;
  }
  uint64_t v8 = __stderrp;
  uint64_t v9 = *a2;
  uint64_t v10 = strerror(BYTE1(v15));
  fprintf(v8, "%s: %s command failed: %s\n", a1, v9, v10);
  return 4294967292;
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return _CFStringGetMaximumSizeOfFileSystemRepresentation(string);
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

int close(int a1)
{
  return _close(a1);
}

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
}

void exit(int a1)
{
}

pid_t fork(void)
{
  return _fork();
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

int getvfsbyname(const char *a1, vfsconf *a2)
{
  return _getvfsbyname(a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return _wait4(a1, a2, a3, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}