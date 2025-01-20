void sub_100002170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000021C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000021D0(uint64_t a1)
{
}

void sub_1000021D8(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      v13 = "-[HFSFileSystem probeResource:replyHandler:]_block_invoke";
      __int16 v14 = 2048;
      id v15 = [v6 code];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Falied to read Master Directory Block, error (%ld)", (uint8_t *)&v12, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  v8 = (void *)(a1 + 40);
  if (*(void *)(a1 + 40) + 512 > a2)
  {
    uint64_t v9 = fs_errorForPOSIXError();
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000030BC(v8, a2, v7);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_100002330(void *a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 == 3)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    if (a2 == 1)
    {
      v7 = 0;
    }
    else
    {
      v7 = fs_errorForPOSIXError();
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
    if (a2 != 1) {

    }
    v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000315C(v8);
    }
  }
}

void hfs_ConvertHFSUUIDToUUID(unsigned int *a1, uuid_t uu)
{
  if (*a1 && (unsigned int v3 = a1[1]) != 0)
  {
    data[0] = bswap32(*a1);
    data[1] = bswap32(v3);
    memset(&v4, 0, sizeof(v4));
    CC_MD5_Init(&v4);
    CC_MD5_Update(&v4, &unk_10000368B, 0x10u);
    CC_MD5_Update(&v4, data, 8u);
    CC_MD5_Final(uu, &v4);
    uu[6] = uu[6] & 0xF | 0x30;
    uu[8] = uu[8] & 0x3F | 0x80;
  }
  else
  {
    uuid_clear(uu);
  }
}

uint64_t hfs_GetVolumeUUIDRaw(int a1, unsigned __int8 *a2, int a3)
{
  id v6 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xF0DE2644uLL);
  if (!v6) {
    return 4294967292;
  }
  v7 = v6;
  if ((~sub_100002C14(a1, v6, 1024, 0x200uLL, a3) & 0xFFFFFFFD) == 0)
  {
    int v8 = *v7;
    if (v8 == 17474)
    {
      if (v7[62] != 11080)
      {
LABEL_7:
        uint64_t v9 = (int8x8_t *)(v7 + 58);
LABEL_14:
        *(void *)src = 0;
        uint64_t v14 = 0;
        int8x8_t v12 = vrev32_s8(*v9);
        hfs_ConvertHFSUUIDToUUID((unsigned int *)&v12, src);
        uuid_copy(a2, src);
        free(v7);
        return 4294967293;
      }
      if ((~sub_100002C14(a1, v7, ((unint64_t)(bswap32(v7[14]) >> 16) << 9)+ (bswap32(v7[63]) >> 16) * (unint64_t)bswap32(*((_DWORD *)v7 + 5))+ 1024, 0x200uLL, a3) & 0xFFFFFFFD) != 0)goto LABEL_15; {
      int v8 = *v7;
      }
      if (v8 == 17474) {
        goto LABEL_7;
      }
    }
    if (v8 == 22600 || v8 == 11080)
    {
      uint64_t v9 = (int8x8_t *)(v7 + 52);
      goto LABEL_14;
    }
  }
LABEL_15:
  free(v7);
  return 4294967292;
}

uint64_t hfs_GetNameFromHFSPlusVolumeStartingAt(int a1, uint64_t a2, char *a3, int a4)
{
  int v8 = (unsigned int *)malloc_type_malloc(0x200uLL, 0x1831D1F6uLL);
  if (!v8) {
    return 4294967292;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 4294967292;
  if ((sub_100002C14(a1, v8, a2 + 1024, 0x200uLL, a4) & 0xFFFFFFFDLL) == 0xFFFFFFFCLL)
  {
LABEL_46:
    free(v9);
    return v10;
  }
  int v11 = *(unsigned __int16 *)v9;
  BOOL v12 = v11 == 22600 || v11 == 11080;
  if (!v12 || (v13 = v9[10], (uint64_t v14 = (char *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL)) == 0))
  {
    uint64_t v10 = 4294967292;
    goto LABEL_46;
  }
  id v15 = v14;
  long long v16 = *((_OWORD *)v9 + 18);
  long long v17 = *((_OWORD *)v9 + 19);
  long long v18 = *((_OWORD *)v9 + 21);
  *((_OWORD *)v14 + 2) = *((_OWORD *)v9 + 20);
  *((_OWORD *)v14 + 3) = v18;
  *(_OWORD *)uint64_t v14 = v16;
  *((_OWORD *)v14 + 1) = v17;
  if (!*((_DWORD *)v14 + 15))
  {
    unsigned int v19 = 8;
LABEL_34:
    unsigned int v39 = bswap32(v13);
    size_t size = 0;
    uint64_t v40 = sub_100002DB0(a1, a2, v39, v19, (uint64_t)v15, (unsigned int *)&size + 1, (unsigned int *)&size);
    if (v40 == -3)
    {
      uint64_t v41 = HIDWORD(size);
      v26 = (char *)malloc_type_malloc(HIDWORD(size), 0xB9DBDB40uLL);
      if (v26
        && sub_100002E94(a1, v26, size * (unint64_t)v41, v41, a2, v39, v19, (uint64_t)v15) != -4&& *((_WORD *)v26 + 5)&& (uint64_t v42 = bswap32(*(unsigned __int16 *)&v26[v41 - 2]) >> 16, v43 = &v26[v42], *(_DWORD *)&v26[v42 + 2] == 0x1000000)&& !v43[6]&& (v45 = (UniChar *)malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL)) != 0)
      {
        v46 = v45;
        unsigned int v47 = *((unsigned __int16 *)v43 + 3);
        unint64_t v48 = __rev16(v47);
        UniChar *v45 = v48;
        if (v47)
        {
          unint64_t v49 = 0;
          do
          {
            v45[v49 + 1] = bswap32(*(unsigned __int16 *)&v26[2 * v49 + 8 + v42]) >> 16;
            ++v49;
          }
          while (v49 < v48);
        }
        else
        {
          unint64_t v49 = 0;
          unint64_t v48 = 0;
        }
        v45[v49 + 1] = 0;
        CFStringRef v50 = CFStringCreateWithCharacters(kCFAllocatorDefault, v45 + 1, v48);
        CFStringGetCString(v50, a3, 766, 0x8000100u);
        CFRelease(v50);
        free(v46);
        uint64_t v10 = 4294967293;
      }
      else
      {
        uint64_t v10 = 4294967292;
      }
LABEL_43:
      free(v9);
      if (!v15) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    uint64_t v10 = v40;
LABEL_42:
    v26 = 0;
    goto LABEL_43;
  }
  size_t size = 0;
  unsigned int v19 = 8;
  unsigned int v57 = bswap32(v9[10]);
  uint64_t v56 = (uint64_t)(v9 + 52);
  uint64_t v10 = sub_100002DB0(a1, a2, v57, 8u, (uint64_t)(v9 + 52), (unsigned int *)&size + 1, (unsigned int *)&size);
  if (v10 != -3 || (unsigned int v20 = size) == 0)
  {
LABEL_33:
    if (v10 != -3) {
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  uint64_t v21 = HIDWORD(size);
  v22 = (char *)malloc_type_malloc(HIDWORD(size), 0xE34769FEuLL);
  if (v22)
  {
    v23 = v22;
    uint64_t v24 = sub_100002E94(a1, v22, v21 * (unint64_t)v20, v21, a2, v57, 8u, v56);
    v25 = v23;
    if (v24 == -4)
    {
      uint64_t v10 = 4294967292;
    }
    else
    {
      uint64_t v27 = v21;
      uint64_t v10 = v24;
      unsigned int v52 = v13;
      v54 = a3;
      uint64_t v55 = v27;
      v28 = &v23[v27];
      uint64_t v53 = (uint64_t)&v23[v27 - 4];
      size_t v29 = 64;
      v58 = v25;
      v51 = v28;
      do
      {
        if (v25[8] != 255) {
          break;
        }
        if (*((_WORD *)v25 + 5))
        {
          v30 = &v25[bswap32(*((unsigned __int16 *)v28 - 1)) >> 16];
          if (*((_DWORD *)v30 + 1) != 0x4000000) {
            goto LABEL_31;
          }
          v29 += 64;
          uint64_t v31 = __rev16(*((unsigned __int16 *)v25 + 5)) - 1;
          v32 = (unsigned __int16 *)v53;
          while (1)
          {
            id v15 = (char *)malloc_type_realloc(v15, v29, 0x5106115AuLL);
            v33 = &v15[8 * v19];
            v34 = &v30[bswap32(*(unsigned __int16 *)v30) >> 16];
            long long v35 = *(_OWORD *)(v34 + 50);
            long long v36 = *(_OWORD *)(v34 + 34);
            long long v37 = *(_OWORD *)(v34 + 18);
            *(_OWORD *)v33 = *(_OWORD *)(v34 + 2);
            *((_OWORD *)v33 + 1) = v37;
            *((_OWORD *)v33 + 2) = v36;
            *((_OWORD *)v33 + 3) = v35;
            v19 += 8;
            if (!v31) {
              break;
            }
            unsigned int v38 = *v32--;
            v30 = &v58[bswap32(v38) >> 16];
            v29 += 64;
            --v31;
            if (*((_DWORD *)v30 + 1) != 0x4000000)
            {
              a3 = v54;
              unsigned int v13 = v52;
              v25 = v58;
              goto LABEL_32;
            }
          }
          a3 = v54;
          v25 = v58;
          v28 = v51;
        }
        if (!*(_DWORD *)v25) {
          goto LABEL_31;
        }
        uint64_t v10 = sub_100002E94(a1, v25, v55 * (unint64_t)bswap32(*(_DWORD *)v25), v55, a2, v57, 8u, v56);
      }
      while (v10 != -4);
      uint64_t v10 = 4294967292;
LABEL_31:
      unsigned int v13 = v52;
    }
LABEL_32:
    free(v25);
    goto LABEL_33;
  }
  free(v9);
  v26 = 0;
  uint64_t v10 = 4294967292;
LABEL_44:
  free(v15);
LABEL_45:
  uint64_t v9 = (unsigned int *)v26;
  if (v26) {
    goto LABEL_46;
  }
  return v10;
}

uint64_t sub_100002C14(int a1, void *a2, uint64_t a3, size_t a4, int a5)
{
  uint64_t v9 = a3 % a5;
  size_t v10 = (uint64_t)(a4 + a5 + v9 - 1) / a5 * a5;
  int v11 = (char *)malloc_type_malloc(v10, 0x6E9B641uLL);
  if (v11)
  {
    BOOL v12 = v11;
    if (lseek(a1, a3 - v9, 0) == a3 - v9)
    {
      if (read(a1, v12, v10) == v10)
      {
        memmove(a2, &v12[v9], a4);
        uint64_t v13 = -3;
LABEL_10:
        free(v12);
        return v13;
      }
      if (gbIsLoggerInit)
      {
        uint64_t v14 = gpsHFSLog;
        if (os_log_type_enabled((os_log_t)gpsHFSLog, OS_LOG_TYPE_ERROR))
        {
          int v15 = *__error();
          int v17 = 136315394;
          long long v18 = "readAt";
          __int16 v19 = 1024;
          int v20 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: attempt to read data from device failed (errno = %d)\n", (uint8_t *)&v17, 0x12u);
        }
      }
    }
    uint64_t v13 = -4;
    goto LABEL_10;
  }
  return -4;
}

uint64_t sub_100002DB0(int a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, unsigned int *a6, unsigned int *a7)
{
  uint64_t v14 = (char *)malloc_type_malloc(0x200uLL, 0x30316F26uLL);
  if (!v14) {
    return 4294967292;
  }
  int v15 = v14;
  uint64_t v16 = sub_100002E94(a1, v14, 0, 512, a2, a3, a4, a5);
  if (v16 != -4)
  {
    if (v15[8] == 1)
    {
      *a6 = bswap32(*((unsigned __int16 *)v15 + 16)) >> 16;
      unsigned int v17 = *((_DWORD *)v15 + 5);
      if (v17) {
        unsigned int v17 = bswap32(*((_DWORD *)v15 + 6));
      }
      *a7 = v17;
    }
    else
    {
      uint64_t v16 = 4294967292;
    }
  }
  free(v15);
  return v16;
}

uint64_t sub_100002E94(int a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  if (a4 < 1) {
    return 4294967293;
  }
  if (!a7) {
    return 4294967292;
  }
  int64_t v10 = a4;
  uint64_t v14 = a6;
  int v15 = (unsigned int *)(a8 + 4);
  uint64_t v16 = a7;
LABEL_4:
  uint64_t v17 = a3 / v14;
  uint64_t v18 = a3 % v14;
  uint64_t v19 = v16;
  for (i = v15; *i; i += 2)
  {
    unsigned int v21 = bswap32(*i);
    if (v17 < v21)
    {
      unsigned int v22 = bswap32(*(i - 1)) + v17;
      if ((uint64_t)(v14 * (unint64_t)(v21 - v17) - v18) >= v10) {
        int64_t v23 = v10;
      }
      else {
        int64_t v23 = v14 * (unint64_t)(v21 - v17) - v18;
      }
      if ((~sub_100002C14(a1, a2, v18 + a5 + v14 * (unint64_t)v22, v23, a6) & 0xFFFFFFFD) != 0) {
        return 4294967292;
      }
      a3 += v23;
      a2 += v23;
      uint64_t result = 4294967293;
      BOOL v25 = v10 <= v23;
      v10 -= v23;
      if (v25) {
        return result;
      }
      goto LABEL_4;
    }
    LODWORD(v17) = v17 - v21;
    if (!--v19) {
      return 4294967292;
    }
  }
  return 4294967292;
}

void sub_100002FB4(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[HFSFileSystem probeResource:replyHandler:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: Given device is not a block device", (uint8_t *)&v1, 0xCu);
}

void sub_100003038(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[HFSFileSystem probeResource:replyHandler:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to get volume UUID", (uint8_t *)&v1, 0xCu);
}

void sub_1000030BC(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1 + 512;
  int v4 = 136315650;
  v5 = "-[HFSFileSystem probeResource:replyHandler:]_block_invoke";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Expected to read %lld bytes, read %lu", (uint8_t *)&v4, 0x20u);
}

void sub_10000315C(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[HFSFileSystem probeResource:replyHandler:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to read volume name", (uint8_t *)&v1, 0xCu);
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

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return _CFStringCreateWithCharacters(alloc, chars, numChars);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return [a1 blockSize];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_synchronousReadInto_startingAt_length_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousReadInto:startingAt:length:reply:");
}