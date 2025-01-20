@interface CTServerConnectionCopyFirmwarePreflightInfo
@end

@implementation CTServerConnectionCopyFirmwarePreflightInfo

void ___CTServerConnectionCopyFirmwarePreflightInfo_block_invoke(uint64_t a1, uint64_t *a2, CFTypeRef *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  CFTypeID v5 = CFGetTypeID(*a3);
  if (v5 == CFNumberGetTypeID())
  {
    v6 = CTLogRadioModule();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if (*((char *)a2 + 23) < 0) {
      a2 = (uint64_t *)*a2;
    }
    v8 = (uint64_t *)*a3;
    *(void *)buf = 0;
    ctu::cf::assign((ctu::cf *)buf, v8, v7);
    uint64_t v9 = *(void *)buf;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    v10 = "%s = %lld";
LABEL_30:
    _os_log_impl(&dword_18444A000, v6, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);
    return;
  }
  CFTypeID v11 = CFGetTypeID(*a3);
  if (v11 == CFStringGetTypeID())
  {
    v12 = CTLogRadioModule();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *((char *)a2 + 23);
      v14 = (uint64_t *)*a2;
      *(void *)&buf[8] = 0;
      *(void *)&buf[16] = 0;
      ctu::cf::assign();
      memset(v25, 0, 24);
      if (v13 >= 0) {
        v15 = a2;
      }
      else {
        v15 = v14;
      }
      v16 = v25;
      if (SBYTE7(v25[1]) < 0) {
        v16 = *(_OWORD **)&v25[0];
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_18444A000, v12, OS_LOG_TYPE_DEFAULT, "%s = %s", buf, 0x16u);
      if (SBYTE7(v25[1]) < 0)
      {
        v17 = *(void **)&v25[0];
LABEL_24:
        operator delete(v17);
      }
    }
  }
  else
  {
    CFTypeID v18 = CFGetTypeID(*a3);
    if (v18 != CFDataGetTypeID())
    {
      v6 = CTLogRadioModule();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      if (*((char *)a2 + 23) >= 0) {
        v23 = a2;
      }
      else {
        v23 = (uint64_t *)*a2;
      }
      CFTypeRef v24 = *a3;
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      v10 = "%s = %@";
      goto LABEL_30;
    }
    BytePtr = (ctu *)CFDataGetBytePtr((CFDataRef)*a3);
    Length = (const void *)CFDataGetLength((CFDataRef)*a3);
    v21 = CTLogRadioModule();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)a2 + 23) < 0) {
        a2 = (uint64_t *)*a2;
      }
      ctu::hex(BytePtr, Length);
      v22 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
      LODWORD(v25[0]) = 136315394;
      *(void *)((char *)v25 + 4) = a2;
      WORD6(v25[0]) = 2080;
      *(void *)((char *)v25 + 14) = v22;
      _os_log_impl(&dword_18444A000, v21, OS_LOG_TYPE_DEFAULT, "%s = %s", (uint8_t *)v25, 0x16u);
      if ((buf[23] & 0x80000000) != 0)
      {
        v17 = *(void **)buf;
        goto LABEL_24;
      }
    }
  }
}

@end