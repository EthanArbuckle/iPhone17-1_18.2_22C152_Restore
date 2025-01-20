void sub_10000192C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000019E0(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100001BD8(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,Start GNSSLocationService", buf, 2u);
  }
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CLGLS,GNSSLocationService,listener resume GNSSLocationService", v6, 2u);
  }

  return 0;
}

void sub_100001D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002490(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0xF0F]) < 0) {
    operator delete((void *)STACK[0xEF8]);
  }
  sub_100004F30((uint64_t)&STACK[0xF10]);
  sub_100002664(v5 - 224);
  CoreNavigation::CLP::LogEntry::LogEntry::~LogEntry((CoreNavigation::CLP::LogEntry::LogEntry *)(v5 - 160));
  if (*(char *)(v4 + 4007) < 0) {
    operator delete(*(void **)(v5 - 104));
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10000255C(uint64_t a1, uint64_t a2)
{
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)(a2 + 8));
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  if (a1 != a2) {
    sub_100004B28(a1 + 40, *(std::string **)(a2 + 40), *(long long **)(a2 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3));
  }
  memcpy((void *)(a1 + 64), (const void *)(a2 + 64), 0x8C0uLL);
  sub_100004ACC(a1 + 2304, a2 + 2304);
  memcpy((void *)(a1 + 2352), (const void *)(a2 + 2352), 0x519uLL);
  std::string::operator=((std::string *)(a1 + 3664), (const std::string *)(a2 + 3664));
  __int16 v4 = *(_WORD *)(a2 + 3692);
  *(_DWORD *)(a1 + 3688) = *(_DWORD *)(a2 + 3688);
  *(_WORD *)(a1 + 3692) = v4;
  std::string::operator=((std::string *)(a1 + 3696), (const std::string *)(a2 + 3696));
  char v5 = *(unsigned char *)(a2 + 3722);
  *(_WORD *)(a1 + 3720) = *(_WORD *)(a2 + 3720);
  *(unsigned char *)(a1 + 3722) = v5;
  std::string::operator=((std::string *)(a1 + 3728), (const std::string *)(a2 + 3728));
  char v6 = *(unsigned char *)(a2 + 3754);
  *(_WORD *)(a1 + 3752) = *(_WORD *)(a2 + 3752);
  *(unsigned char *)(a1 + 3754) = v6;
  std::string::operator=((std::string *)(a1 + 3760), (const std::string *)(a2 + 3760));
  long long v7 = *(_OWORD *)(a2 + 3813);
  long long v8 = *(_OWORD *)(a2 + 3800);
  *(_OWORD *)(a1 + 3784) = *(_OWORD *)(a2 + 3784);
  *(_OWORD *)(a1 + 3800) = v8;
  *(_OWORD *)(a1 + 3813) = v7;
  return a1;
}

uint64_t sub_100002664(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t ConvertRavenSolutionEventToString(raven *a1)
{
  CoreNavigation::CLP::LogEntry::LogEntry::LogEntry((CoreNavigation::CLP::LogEntry::LogEntry *)v16);
  v19 |= 1u;
  if (!v17) {
    operator new();
  }
  raven::ConvertRavenTimeToProtobuf();
  v19 |= 2u;
  uint64_t v3 = v18;
  if (!v18) {
    operator new();
  }
  *(_DWORD *)(v18 + 320) |= 2u;
  uint64_t v4 = *(void *)(v3 + 272);
  if (!v4) {
    operator new();
  }
  *(_DWORD *)(v4 + 28) |= 1u;
  char v5 = *(const raven::RavenSolutionEvent **)(v4 + 8);
  if (!v5) {
    operator new();
  }
  raven::ConvertRavenSolutionEventToProtobuf(a1, v5, v2);
  uint64_t v6 = wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
  if ((v6 & 1) == 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_1000055EC(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  CoreNavigation::CLP::LogEntry::LogEntry::~LogEntry((CoreNavigation::CLP::LogEntry::LogEntry *)v16);
  return v6;
}

void sub_100002818()
{
}

void sub_100002A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  raven::RavenSolutionEvent::~RavenSolutionEvent((raven::RavenSolutionEvent *)&a16);

  _Unwind_Resume(a1);
}

void sub_100002CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  raven::RavenSolutionEvent::~RavenSolutionEvent((raven::RavenSolutionEvent *)&a18);

  _Unwind_Resume(a1);
}

void sub_100002E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void *sub_100003094(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003140();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void sub_100003140()
{
}

void sub_100003158(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000031B4(exception, a1);
}

void sub_1000031A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000031B4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000031E8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000321C(void *a1)
{
}

uint64_t sub_100003230(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(unsigned char *)(a1 + 2) = 0;
  sub_1000032A8((void *)(a1 + 8), (char *)&unk_100006E53);
  sub_1000032A8((void *)(a1 + 32), (char *)&unk_100006E53);
  *(void *)(a1 + 56) = 0;
  return a1;
}

void sub_10000328C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000032A8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003140();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_10000335C(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100003140();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_1000033FC(uint64_t a1)
{
  uint64_t v2 = a1 + 547;
  *(void *)a1 = off_100008380;
  sub_1000032A8((void *)(a1 + 8), (char *)&unk_100006E53);
  *(unsigned char *)(a1 + 33) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = xmmword_100006100;
  *(_OWORD *)(a1 + 88) = xmmword_100006110;
  *(_OWORD *)(a1 + 104) = xmmword_100006120;
  *(int64x2_t *)(a1 + 120) = vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  *(_OWORD *)(a1 + 136) = xmmword_100006120;
  *(_OWORD *)(a1 + 152) = xmmword_100006110;
  *(_OWORD *)(a1 + 168) = xmmword_100006120;
  *(int64x2_t *)(a1 + 184) = vdupq_n_s64(0x3F9B573EAB367A10uLL);
  *(_OWORD *)(a1 + 200) = xmmword_100006120;
  *(_OWORD *)(a1 + 216) = xmmword_100006110;
  *(_OWORD *)(a1 + 232) = xmmword_100006120;
  *(_OWORD *)(a1 + 248) = xmmword_100006130;
  *(void *)(a1 + 264) = 0x3FF0000000000000;
  __asm { FMOV            V2.2D, #1.0 }
  *(_OWORD *)(a1 + 272) = _Q2;
  *(_OWORD *)(a1 + 288) = xmmword_100006140;
  *(_OWORD *)(a1 + 304) = xmmword_100006150;
  *(_OWORD *)(a1 + 320) = xmmword_100006160;
  *(_OWORD *)(a1 + 336) = xmmword_100006170;
  *(_OWORD *)(a1 + 352) = xmmword_100006180;
  *(_OWORD *)(a1 + 368) = xmmword_100006190;
  *(_OWORD *)(a1 + 384) = xmmword_1000061A0;
  *(_OWORD *)(a1 + 400) = xmmword_1000061B0;
  *(void *)(a1 + 416) = 0x3F847AE147AE147BLL;
  *(_DWORD *)(a1 + 424) = 2;
  *(_OWORD *)(a1 + 432) = xmmword_1000061C0;
  *(_OWORD *)(a1 + 448) = xmmword_1000061D0;
  *(_OWORD *)(a1 + 464) = xmmword_1000061E0;
  *(_OWORD *)(a1 + 480) = xmmword_1000061F0;
  *(_OWORD *)(a1 + 496) = xmmword_100006200;
  *(_OWORD *)(a1 + 512) = xmmword_100006210;
  *(_OWORD *)(a1 + 528) = xmmword_100006220;
  *(_WORD *)(a1 + 544) = 257;
  *(unsigned char *)(a1 + 546) = 1;
  *(_DWORD *)uint64_t v2 = 0;
  *(unsigned char *)(a1 + 551) = 1;
  *(_DWORD *)(a1 + 552) = 0;
  *(_OWORD *)(a1 + 560) = xmmword_100006230;
  *(_DWORD *)(a1 + 576) = 0x1000000;
  *(unsigned char *)(a1 + 580) = 0;
  *(_DWORD *)(a1 + 584) = 0;
  *(unsigned char *)(a1 + 588) = 0;
  *(void *)(v2 + 42) = 0x101010101010101;
  *(unsigned char *)(a1 + 597) = 0;
  *(void *)(a1 + 603) = 0x101010101010101;
  *(void *)(a1 + 598) = 0x101010101010101;
  *(_DWORD *)(a1 + 612) = 1096810496;
  *(void *)(a1 + 616) = 0x3FE0000000000000;
  *(_OWORD *)(a1 + 624) = xmmword_100006240;
  *(_WORD *)(a1 + 640) = 0;
  *(void *)(a1 + 648) = 0x3F847AE147AE147BLL;
  *(_OWORD *)(a1 + 656) = xmmword_100006250;
  *(_OWORD *)(a1 + 672) = xmmword_100006260;
  *(_OWORD *)(a1 + 688) = xmmword_100006270;
  *(_OWORD *)(a1 + 704) = xmmword_100006280;
  *(_OWORD *)(a1 + 720) = xmmword_100006290;
  *(_OWORD *)(a1 + 736) = xmmword_1000062A0;
  *(_OWORD *)(a1 + 752) = xmmword_1000062B0;
  *(_OWORD *)(a1 + 768) = xmmword_1000062C0;
  *(_OWORD *)(a1 + 784) = xmmword_1000062D0;
  *(_OWORD *)(a1 + 800) = xmmword_1000062E0;
  *(void *)(a1 + 816) = 0x3DB5FD7FE1796495;
  *(_DWORD *)(a1 + 824) = 2;
  *(void *)(a1 + 832) = 0x3FE0000000000000;
  *(_WORD *)(a1 + 840) = 256;
  *(_OWORD *)(a1 + 848) = xmmword_1000062F0;
  *(_OWORD *)(a1 + 864) = xmmword_100006300;
  *(_OWORD *)(a1 + 880) = xmmword_100006310;
  *(_OWORD *)(a1 + 896) = xmmword_100006320;
  *(_OWORD *)(a1 + 912) = xmmword_100006330;
  *(_OWORD *)(a1 + 928) = xmmword_100006340;
  *(_OWORD *)(a1 + 944) = xmmword_100006350;
  *(_OWORD *)(a1 + 960) = xmmword_100006360;
  *(void *)(a1 + 976) = 0x3FF0000000000000;
  *(_DWORD *)(a1 + 984) = 350;
  *(_OWORD *)(a1 + 992) = xmmword_100006370;
  *(_OWORD *)(a1 + 1008) = xmmword_100006380;
  *(void *)(a1 + 1024) = 0x3FF0000000000000;
  *(_DWORD *)(a1 + 1032) = 3;
  *(_OWORD *)(a1 + 1040) = xmmword_100006390;
  *(_OWORD *)(a1 + 1056) = xmmword_1000063A0;
  *(_OWORD *)(a1 + 1072) = xmmword_1000063B0;
  *(_OWORD *)(a1 + 1088) = _Q2;
  *(_OWORD *)(a1 + 1104) = xmmword_1000063C0;
  *(_OWORD *)(a1 + 1120) = xmmword_1000063D0;
  *(_OWORD *)(a1 + 1136) = xmmword_1000063E0;
  *(_OWORD *)(a1 + 1152) = xmmword_1000063F0;
  *(_OWORD *)(a1 + 1168) = xmmword_100006400;
  *(void *)(a1 + 1184) = 0x4018000000000000;
  *(_DWORD *)(a1 + 1192) = 3;
  *(_OWORD *)(a1 + 1200) = xmmword_100006410;
  *(_OWORD *)(a1 + 1216) = xmmword_100006420;
  *(_OWORD *)(a1 + 1232) = xmmword_100006430;
  *(_OWORD *)(a1 + 1248) = xmmword_100006440;
  *(_OWORD *)(a1 + 1264) = xmmword_100006410;
  *(_DWORD *)(a1 + 1280) = 6;
  *(void *)(a1 + 1288) = 0x4000000000000000;
  *(_DWORD *)(a1 + 1296) = 6;
  *(void *)(a1 + 1304) = 0x4000000000000000;
  *(_DWORD *)(a1 + 1312) = 2;
  *(void *)(a1 + 1320) = 0x4000000000000000;
  *(_OWORD *)(a1 + 1328) = xmmword_100006450;
  *(_OWORD *)(a1 + 1344) = xmmword_100006460;
  *(_OWORD *)(a1 + 1360) = xmmword_100006470;
  *(_OWORD *)(a1 + 1376) = xmmword_100006480;
  __asm { FMOV            V2.2D, #6.0 }
  *(_OWORD *)(a1 + 1392) = _Q2;
  *(_OWORD *)(a1 + 1408) = xmmword_100006490;
  __asm { FMOV            V2.2D, #3.0 }
  *(_OWORD *)(a1 + 1424) = _Q2;
  *(_OWORD *)(a1 + 1440) = _Q2;
  *(_OWORD *)(a1 + 1456) = xmmword_1000064A0;
  *(_DWORD *)(a1 + 1472) = 2;
  *(void *)(a1 + 1480) = 0x4024000000000000;
  *(int64x2_t *)(a1 + 1488) = vdupq_n_s64(0x3FE0CCCCCCCCCCCDuLL);
  *(_OWORD *)(a1 + 1504) = xmmword_1000064B0;
  *(_OWORD *)(a1 + 1520) = xmmword_1000064C0;
  *(_OWORD *)(a1 + 1536) = xmmword_1000064D0;
  *(int64x2_t *)(a1 + 1552) = vdupq_n_s64(0x4066800000000000uLL);
  *(_OWORD *)(a1 + 1568) = xmmword_1000064E0;
  *(_OWORD *)(a1 + 1584) = xmmword_1000064F0;
  *(_OWORD *)(a1 + 1600) = xmmword_100006500;
  *(_OWORD *)(a1 + 1616) = xmmword_100006510;
  *(_OWORD *)(a1 + 1632) = xmmword_100006520;
  *(void *)(a1 + 1648) = 0;
  *(_OWORD *)(a1 + 1656) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1672) = unk_1000067E0;
  *(_OWORD *)(a1 + 1688) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1704) = unk_1000067E0;
  *(_OWORD *)(a1 + 1720) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1736) = unk_1000067E0;
  *(_OWORD *)(a1 + 1752) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1768) = unk_1000067E0;
  *(_OWORD *)(a1 + 1784) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1800) = unk_1000067E0;
  *(_OWORD *)(a1 + 1816) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1832) = unk_1000067E0;
  *(_OWORD *)(a1 + 1848) = xmmword_100006790;
  *(_OWORD *)(a1 + 1864) = unk_1000067A0;
  *(_OWORD *)(a1 + 1880) = xmmword_100006770;
  *(_OWORD *)(a1 + 1896) = unk_100006780;
  *(_OWORD *)(a1 + 1912) = xmmword_100006790;
  *(_OWORD *)(a1 + 1928) = unk_1000067A0;
  *(_OWORD *)(a1 + 1944) = xmmword_1000067B0;
  *(_OWORD *)(a1 + 1960) = unk_1000067C0;
  *(_OWORD *)(a1 + 1976) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 1992) = unk_1000067E0;
  *(_OWORD *)(a1 + 2008) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 2024) = unk_1000067E0;
  *(_OWORD *)(a1 + 2040) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 2056) = unk_1000067E0;
  *(_OWORD *)(a1 + 2072) = xmmword_1000067D0;
  *(_OWORD *)(a1 + 2088) = unk_1000067E0;
  *(unsigned char *)(a1 + 2104) = 0;
  *(_OWORD *)(a1 + 2112) = xmmword_100006530;
  *(_OWORD *)(a1 + 2128) = xmmword_100006540;
  *(_OWORD *)(a1 + 2144) = xmmword_1000064A0;
  *(_OWORD *)(a1 + 2160) = xmmword_100006550;
  *(_OWORD *)(a1 + 2176) = xmmword_100006560;
  *(_WORD *)(a1 + 2192) = 0;
  *(void *)(a1 + 2200) = 0x4034000000000000;
  *(_DWORD *)(a1 + 2208) = 0;
  *(void *)(a1 + 2216) = 0x404E000000000000;
  *(_OWORD *)(a1 + 2224) = xmmword_100006570;
  *(_OWORD *)(a1 + 2240) = xmmword_100006580;
  *(_OWORD *)(a1 + 2256) = xmmword_100006590;
  *(void *)(a1 + 2272) = 0x3FE3333333333333;
  *(_DWORD *)(a1 + 2280) = 1;
  *(int64x2_t *)(a1 + 2288) = vdupq_n_s64(0x3FE3333333333333uLL);
  *(_WORD *)(a1 + 2304) = 0;
  *(void *)(a1 + 2344) = 0;
  *(_OWORD *)(a1 + 2328) = 0u;
  *(_OWORD *)(a1 + 2312) = 0u;
  *(void *)(a1 + 2352) = 0x3FD51EB851EB851FLL;
  *(_OWORD *)(a1 + 2360) = xmmword_1000067F0;
  *(_OWORD *)(a1 + 2376) = unk_100006800;
  *(_WORD *)(a1 + 2392) = 257;
  *(unsigned char *)(a1 + 2394) = 1;
  *(_OWORD *)(a1 + 2400) = xmmword_100006810;
  *(_OWORD *)(a1 + 2416) = unk_100006820;
  *(_OWORD *)(a1 + 2432) = xmmword_1000065A0;
  *(_OWORD *)(a1 + 2448) = xmmword_1000065B0;
  *(_OWORD *)(a1 + 2464) = xmmword_1000065C0;
  __asm { FMOV            V1.2D, #0.5 }
  *(_OWORD *)(a1 + 2480) = _Q1;
  *(int64x2_t *)(a1 + 2496) = vdupq_n_s64(0x3FEE666666666666uLL);
  *(_OWORD *)(a1 + 2512) = xmmword_1000065D0;
  *(_OWORD *)(a1 + 2528) = xmmword_1000065E0;
  *(unsigned char *)(a1 + 2544) = 1;
  *(void *)(a1 + 2552) = 0x40BC200000000000;
  *(_WORD *)(a1 + 2560) = 1;
  *(unsigned char *)(a1 + 2562) = 0;
  *(void *)(a1 + 2568) = 0x3FF0000000000000;
  *(_OWORD *)(a1 + 2576) = xmmword_100006920;
  *(_OWORD *)(a1 + 2640) = xmmword_100006960;
  *(_OWORD *)(a1 + 2656) = xmmword_100006830;
  *(_OWORD *)(a1 + 2720) = xmmword_100006870;
  *(_OWORD *)(a1 + 2704) = unk_100006860;
  *(_OWORD *)(a1 + 2624) = unk_100006950;
  *(_OWORD *)(a1 + 2608) = xmmword_100006940;
  *(_OWORD *)(a1 + 2592) = *(_OWORD *)algn_100006930;
  *(_OWORD *)(a1 + 2688) = xmmword_100006850;
  *(_OWORD *)(a1 + 2672) = unk_100006840;
  *(unsigned char *)(a1 + 2736) = 0;
  *(_OWORD *)(a1 + 2808) = xmmword_1000068C0;
  *(_OWORD *)(a1 + 2776) = xmmword_1000068A0;
  *(_OWORD *)(a1 + 2792) = unk_1000068B0;
  *(_OWORD *)(a1 + 2744) = xmmword_100006880;
  *(_OWORD *)(a1 + 2760) = unk_100006890;
  *(_OWORD *)(a1 + 2888) = xmmword_100006910;
  *(_OWORD *)(a1 + 2856) = xmmword_1000068F0;
  *(_OWORD *)(a1 + 2872) = unk_100006900;
  *(_OWORD *)(a1 + 2824) = xmmword_1000068D0;
  *(_OWORD *)(a1 + 2840) = unk_1000068E0;
  *(_OWORD *)(a1 + 2952) = unk_100006950;
  *(_OWORD *)(a1 + 2968) = xmmword_100006960;
  *(_OWORD *)(a1 + 2920) = *(_OWORD *)algn_100006930;
  *(_OWORD *)(a1 + 2936) = xmmword_100006940;
  *(_OWORD *)(a1 + 2904) = xmmword_100006920;
  *(_OWORD *)(a1 + 3032) = unk_1000069A0;
  *(_OWORD *)(a1 + 3048) = xmmword_1000069B0;
  *(_OWORD *)(a1 + 3000) = unk_100006980;
  *(_OWORD *)(a1 + 3016) = xmmword_100006990;
  *(_OWORD *)(a1 + 2984) = xmmword_100006970;
  *(void *)(a1 + 3064) = 0x3FEE666666666666;
  *(_OWORD *)(a1 + 3072) = xmmword_1000065F0;
  *(_OWORD *)(a1 + 3088) = xmmword_100006600;
  *(_OWORD *)(a1 + 3104) = xmmword_100006610;
  *(_OWORD *)(a1 + 3120) = xmmword_100006620;
  *(_OWORD *)(a1 + 3136) = xmmword_100006630;
  *(_OWORD *)(a1 + 3152) = xmmword_100006640;
  *(_OWORD *)(a1 + 3168) = xmmword_100006650;
  *(_OWORD *)(a1 + 3184) = xmmword_100006660;
  *(_OWORD *)(a1 + 3200) = xmmword_100006670;
  *(_OWORD *)(a1 + 3216) = xmmword_100006680;
  *(_OWORD *)(a1 + 3232) = xmmword_100006200;
  *(_OWORD *)(a1 + 3248) = xmmword_100006690;
  *(_OWORD *)(a1 + 3264) = xmmword_1000066A0;
  *(_OWORD *)(a1 + 3280) = xmmword_1000066B0;
  *(_OWORD *)(a1 + 3296) = xmmword_1000066C0;
  __asm { FMOV            V0.2D, #5.0 }
  *(_OWORD *)(a1 + 3312) = _Q0;
  *(_OWORD *)(a1 + 3328) = xmmword_1000066D0;
  *(void *)(a1 + 3344) = 0x3FE999999999999ALL;
  *(unsigned char *)(a1 + 3352) = 1;
  *(_OWORD *)(a1 + 3360) = xmmword_1000066E0;
  *(void *)(a1 + 3376) = 0x3FE0000000000000;
  *(void *)(a1 + 3384) = 0x400000005;
  *(_OWORD *)(a1 + 3392) = xmmword_1000066F0;
  *(_OWORD *)(a1 + 3408) = xmmword_100006700;
  *(_OWORD *)(a1 + 3424) = xmmword_100006710;
  *(int64x2_t *)(a1 + 3440) = vdupq_n_s64(0x4014880F19EA2B99uLL);
  *(_OWORD *)(a1 + 3456) = xmmword_100006720;
  *(_OWORD *)(a1 + 3472) = xmmword_100006730;
  *(void *)(a1 + 3488) = 0x4022000000000000;
  *(unsigned char *)(a1 + 3496) = 0;
  *(_OWORD *)(a1 + 3504) = xmmword_100006740;
  *(_WORD *)(a1 + 3520) = 257;
  *(void *)(a1 + 3528) = 0x4072C00000000000;
  *(void *)(a1 + 3536) = 0x412E848000000000;
  *(void *)(a1 + 3544) = 2;
  *(unsigned char *)(a1 + 3552) = 1;
  *(void *)(a1 + 3560) = 0x4014000000000000;
  *(void *)(a1 + 3568) = 0x3F847AE147AE147BLL;
  *(_DWORD *)(a1 + 3576) = 5;
  *(unsigned char *)(a1 + 3580) = 1;
  *(_OWORD *)(a1 + 3584) = xmmword_100006750;
  *(void *)(a1 + 3600) = 0x4014000000000000;
  *(void *)(a1 + 3608) = 100;
  *(_OWORD *)(a1 + 3616) = xmmword_100006760;
  *(void *)(a1 + 3632) = 0x3FD3333333333333;
  *(void *)(a1 + 3640) = 3;
  *(unsigned char *)(a1 + 3648) = 0;
  *(_DWORD *)(a1 + 3652) = 0;
  *(unsigned char *)(a1 + 3656) = 0;
  sub_1000032A8((void *)(a1 + 3664), (char *)&unk_100006E53);
  *(_DWORD *)(a1 + 3688) = 10;
  *(_WORD *)(a1 + 3692) = 0;
  sub_1000032A8((void *)(a1 + 3696), "raven_output.bin");
  *(_WORD *)(a1 + 3720) = 256;
  *(unsigned char *)(a1 + 3722) = 0;
  sub_1000032A8((void *)(a1 + 3728), "raven_debug.txt");
  *(_WORD *)(a1 + 3752) = 0;
  *(unsigned char *)(a1 + 3754) = 0;
  sub_1000032A8((void *)(a1 + 3760), "raven_msr.txt");
  *(unsigned char *)(a1 + 3788) = 1;
  *(_DWORD *)(a1 + 3784) = 16843009;
  *(_WORD *)(a1 + 3789) = 0;
  *(void *)(v2 + 3244) = 0x101010101010101;
  *(unsigned char *)(a1 + 3799) = 0;
  *(_DWORD *)(a1 + 3800) = 16843009;
  *(unsigned char *)(a1 + 3804) = 0;
  *(_DWORD *)(a1 + 3808) = 16843009;
  *(_DWORD *)(a1 + 3805) = 16843009;
  *(unsigned char *)(a1 + 3812) = 0;
  *(unsigned char *)(a1 + 3817) = 1;
  *(_DWORD *)(a1 + 3813) = 16843009;
  *(_WORD *)(a1 + 3818) = 256;
  *(unsigned char *)(a1 + 3820) = 1;
  *(_DWORD *)(a1 + 3824) = 0;
  *(unsigned char *)(a1 + 3828) = 0;
  return a1;
}

void sub_100003E88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  if (*(char *)(v2 + 3751) < 0) {
    operator delete(*v7);
  }
  if (*(char *)(v2 + 3719) < 0) {
    operator delete(*v6);
  }
  if (*(char *)(v2 + 3687) < 0) {
    operator delete(*v5);
  }
  uint64_t v9 = *(std::__shared_weak_count **)(v2 + 2328);
  if (v9) {
    sub_1000049B4(v9);
  }
  sub_100004A28((void ***)va);
  *(void *)uint64_t v2 = v4;
  if (*(char *)(v2 + 31) < 0) {
    operator delete(*v3);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100003F08(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(a1 + 32) = a3;
  sub_1000043A4(v26);
  uint64_t v4 = v26[0];
  if ((*((unsigned char *)&v26[4] + (unint64_t)*(v26[0] - 3)) & 5) != 0)
  {
    LOWORD(__str.__r_.__value_.__l.__data_) = 0;
    v23.__r_.__value_.__s.__data_[0] = 2;
    cnprint::CNPrinter::Print();
  }
  else
  {
    if (*(char *)(a1 + 31) < 0)
    {
      *(void *)(a1 + 16) = 0;
      size_t v5 = *(unsigned char **)(a1 + 8);
    }
    else
    {
      *(unsigned char *)(a1 + 31) = 0;
      size_t v5 = (unsigned char *)(a1 + 8);
    }
    *size_t v5 = 0;
    memset(&__str, 0, sizeof(__str));
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)v26 + (void)*(v4 - 3)));
      uint64_t v6 = std::locale::use_facet((const std::locale *)&v23, &std::ctype<char>::id);
      unsigned __int8 v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
      std::locale::~locale((std::locale *)&v23);
      uint64_t v8 = sub_10000473C(v26, (uint64_t)&__str, v7);
      std::string::size_type v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      LOBYTE(v10) = *((unsigned char *)&__str.__r_.__value_.__s + 23);
      if ((*((unsigned char *)v8 + *(void *)(*v8 - 24) + 32) & 5) != 0) {
        break;
      }
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int64_t v12 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else {
        int64_t v12 = __str.__r_.__value_.__l.__size_;
      }
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_str = &__str;
      }
      else {
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      if (v12 >= 1)
      {
        uint64_t v14 = (char *)p_str + v12;
        v15 = p_str;
        do
        {
          v16 = memchr(v15, 35, v12);
          if (!v16) {
            break;
          }
          if (*v16 == 35)
          {
            if (v16 != v14 && v16 - (unsigned char *)p_str != -1)
            {
              std::string::basic_string(&v23, &__str, 0, v16 - (unsigned char *)p_str, (std::allocator<char> *)&v25);
              if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__str.__r_.__value_.__l.__data_);
              }
              std::string __str = v23;
              std::string::size_type v9 = HIBYTE(v23.__r_.__value_.__r.__words[2]);
              std::string::size_type size = v23.__r_.__value_.__l.__size_;
              std::string::size_type v10 = HIBYTE(v23.__r_.__value_.__r.__words[2]);
            }
            break;
          }
          v15 = (std::string *)(v16 + 1);
          int64_t v12 = v14 - (unsigned char *)v15;
        }
        while (v14 - (unsigned char *)v15 >= 1);
      }
      if ((v10 & 0x80u) != 0) {
        std::string::size_type v9 = size;
      }
      sub_10000492C((uint64_t)&v23, v9 + 1);
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v17 = &v23;
      }
      else {
        uint64_t v17 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      if (v9)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v18 = &__str;
        }
        else {
          uint64_t v18 = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        memmove(v17, v18, v9);
      }
      *(_WORD *)((char *)&v17->__r_.__value_.__l.__data_ + v9) = 10;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v19 = &v23;
      }
      else {
        int v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v20 = HIBYTE(v23.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v20 = v23.__r_.__value_.__l.__size_;
      }
      std::string::append((std::string *)(a1 + 8), (const std::string::value_type *)v19, v20);
      if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v23.__r_.__value_.__l.__data_);
      }
      uint64_t v4 = v26[0];
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return v21;
}

void sub_1000042DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23)
{
}

uint64_t sub_100004344(uint64_t a1, char *a2, char a3)
{
  *(unsigned char *)(a1 + 32) = a3;
  sub_1000046F4((std::string *)(a1 + 8), a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 32);

  return v4(a1);
}

void (__cdecl ***sub_1000043A4(void (__cdecl ***a1)(std::ifstream *__hidden this)))(std::ifstream *__hidden this)
{
  *a1 = v3;
  *(void *)((char *)*(v3 - 3) + (void)a1) = v2;
  a1[1] = 0;
  uint64_t v4 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v4, a1 + 2);
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf();
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (void)a1), *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_100004530(_Unwind_Exception *a1)
{
}

void *sub_100004568(void *a1)
{
  std::filebuf::~filebuf();
  std::istream::~istream();
  std::ios::~ios();
  return a1;
}

std::string *sub_100004634(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = __dst->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    unsigned __int8 v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    unsigned __int8 v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      std::string::size_type v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((unsigned char *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

std::string *sub_1000046F4(std::string *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_100004634(a1, __s, v4);
}

void *sub_10000473C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  std::istream::sentry::sentry();
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    unsigned __int8 v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_10000489C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000485CLL);
  }
  __cxa_rethrow();
}

void sub_100004918(_Unwind_Exception *a1)
{
}

uint64_t sub_10000492C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100003140();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void sub_1000049B4(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_100004A28(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_100004A7C((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100004A7C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

uint64_t sub_100004ACC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  if (v6) {
    sub_1000049B4(v6);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  return a1;
}

void sub_100004B28(uint64_t a1, std::string *__str, long long *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  int v9 = *(std::string **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    sub_100004CA0((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_100004ED0();
    }
    unint64_t v10 = 0x5555555555555556 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_100004CDC((void *)a1, v11);
    int64_t v12 = sub_100004D30(v8, (long long *)__str, a3, *(char **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    uint64_t v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3));
    sub_100004E70(__str, v13, v9);
    int64_t v12 = sub_100004D30(v8, (long long *)v13, a3, *(char **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  sub_100004E70(__str, (std::string *)a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      if (*(char *)(v16 - 1) < 0) {
        operator delete(*(void **)(v16 - 24));
      }
      v16 -= 24;
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_100004C90(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_100004C98(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_100004CA0(uint64_t *a1)
{
  if (*a1)
  {
    sub_100004A7C(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_100004CDC(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100004ED0();
  }
  result = (char *)sub_100004EE8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

char *sub_100004D30(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  uint64_t v4 = __dst;
  unint64_t v11 = __dst;
  int64_t v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_10000335C(v4, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      v4 += 24;
      int64_t v12 = v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  sub_100004DF0((uint64_t)v9);
  return v4;
}

void sub_100004DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100004DF0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100004E28(a1);
  }
  return a1;
}

void sub_100004E28(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

std::string *sub_100004E70(std::string *__str, std::string *a2, std::string *this)
{
  uint64_t v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

void sub_100004ED0()
{
}

void *sub_100004EE8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1000031E8();
  }
  return operator new(24 * a2);
}

uint64_t sub_100004F30(uint64_t a1)
{
  if (*(char *)(a1 + 3783) < 0) {
    operator delete(*(void **)(a1 + 3760));
  }
  if (*(char *)(a1 + 3751) < 0) {
    operator delete(*(void **)(a1 + 3728));
  }
  if (*(char *)(a1 + 3719) < 0) {
    operator delete(*(void **)(a1 + 3696));
  }
  if (*(char *)(a1 + 3687) < 0) {
    operator delete(*(void **)(a1 + 3664));
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 2328);
  if (v2) {
    sub_1000049B4(v2);
  }
  uint64_t v4 = (void **)(a1 + 40);
  sub_100004A28(&v4);
  *(void *)a1 = off_100008380;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t sub_100005000(uint64_t a1)
{
  return a1;
}

void sub_100005064(_Unwind_Exception *a1)
{
  cnframework::TimestampedEvent::~TimestampedEvent(v1);
  _Unwind_Resume(a1);
}

double sub_100005078(uint64_t a1)
{
  memset(v6, 0, 96);
  sub_10000511C((uint64_t)v6);
  long long v2 = v6[3];
  *(_OWORD *)(a1 + 40) = v6[2];
  *(_OWORD *)(a1 + 56) = v2;
  long long v3 = v6[5];
  *(_OWORD *)(a1 + 72) = v6[4];
  *(_OWORD *)(a1 + 88) = v3;
  long long v4 = v6[1];
  *(_OWORD *)(a1 + 8) = v6[0];
  *(_OWORD *)(a1 + 24) = v4;
  sub_100005200(a1 + 104);
  bzero(v6, 0x360uLL);
  sub_1000052D0(v6);
  memcpy((void *)(a1 + 1168), v6, 0x360uLL);
  return sub_100005428(a1 + 2032);
}

uint64_t sub_10000511C(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  CNTimeSpan::SetTimeSpan((CNTimeSpan *)a1, 0, 0.0);
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 24) = 0;
  CNTimeSpan::SetTimeSpan((CNTimeSpan *)(a1 + 24), 0, 0.0);
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 48) = 0;
  CNTimeSpan::SetTimeSpan((CNTimeSpan *)(a1 + 48), 0, 0.0);
  *(unsigned char *)(a1 + 64) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 72) = 0;
  CNTimeSpan::SetTimeSpan((CNTimeSpan *)(a1 + 72), 0, 0.0);
  *(void *)(a1 + 88) = 0x7FF8000000000000;
  return a1;
}

int64x2_t *sub_1000051AC(int64x2_t *a1)
{
  a1->i8[0] = 0;
  sub_10000511C((uint64_t)&a1->i64[1]);
  a1[6].i16[4] = 0;
  a1[7].i64[1] = 0;
  a1[8].i64[0] = 0;
  a1[60] = vdupq_n_s64(0x7FF8000000000000uLL);
  a1[61].i64[0] = 0;
  a1[61].i64[1] = 0x7FF8000000000000;
  sub_100005200((uint64_t)a1);
  return a1;
}

void sub_100005200(uint64_t a1)
{
  *(unsigned char *)a1 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  sub_10000511C((uint64_t)&v5);
  long long v2 = v8;
  *(_OWORD *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 56) = v2;
  long long v3 = v10;
  *(_OWORD *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 88) = v3;
  long long v4 = v6;
  *(_OWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 24) = v4;
  *(_WORD *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  long long v5 = 0uLL;
  CNTimeSpan::SetTimeSpan((CNTimeSpan *)&v5, 0, 0.0);
  *(_OWORD *)(a1 + 120) = v5;
  *(void *)(a1 + 136) = 0;
  *(void *)(a1 + 144) = 0;
  *(_WORD *)(a1 + 160) = 0;
  *(void *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 992) = 0u;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_OWORD *)(a1 + 1024) = 0u;
  *(_OWORD *)(a1 + 1040) = 0u;
  *(void *)(a1 + 1056) = 0;
  *(int64x2_t *)(a1 + 960) = vdupq_n_s64(0x7FF8000000000000uLL);
  *(void *)(a1 + 976) = 0;
  *(void *)(a1 + 984) = 0x7FF8000000000000;
  bzero((void *)(a1 + 164), 0x318uLL);
}

int64x2_t sub_1000052D0(_OWORD *a1)
{
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  uint64_t v1 = sub_10000511C((uint64_t)a1);
  *(unsigned char *)(v1 + 96) = 0;
  int64x2_t result = vdupq_n_s64(0x7FF8000000000000uLL);
  *(int64x2_t *)(v1 + 104) = result;
  *(int64x2_t *)(v1 + 120) = result;
  *(int64x2_t *)(v1 + 136) = result;
  *(int64x2_t *)(v1 + 152) = result;
  *(void *)(v1 + 168) = 0x7FF8000000000000;
  *(_WORD *)(v1 + 176) = 0;
  *(int64x2_t *)(v1 + 184) = result;
  *(int64x2_t *)(v1 + 200) = result;
  *(int64x2_t *)(v1 + 216) = result;
  *(int64x2_t *)(v1 + 232) = result;
  *(int64x2_t *)(v1 + 248) = result;
  *(void *)(v1 + 264) = 0x7FF8000000000000;
  *(int64x2_t *)(v1 + 272) = result;
  *(void *)(v1 + 288) = 0x7FF8000000000000;
  *(unsigned char *)(v1 + 296) = 0;
  *(int64x2_t *)(v1 + 304) = result;
  *(int64x2_t *)(v1 + 320) = result;
  *(int64x2_t *)(v1 + 336) = result;
  *(int64x2_t *)(v1 + 352) = result;
  *(void *)(v1 + 368) = 0x7FF8000000000000;
  *(unsigned char *)(v1 + 376) = 0;
  *(int64x2_t *)(v1 + 384) = result;
  *(int64x2_t *)(v1 + 400) = result;
  *(int64x2_t *)(v1 + 416) = result;
  *(int64x2_t *)(v1 + 432) = result;
  *(void *)(v1 + 448) = 0x7FF8000000000000;
  *(unsigned char *)(v1 + 456) = 0;
  *(int64x2_t *)(v1 + 464) = result;
  *(int64x2_t *)(v1 + 480) = result;
  *(int64x2_t *)(v1 + 496) = result;
  *(int64x2_t *)(v1 + 512) = result;
  *(int64x2_t *)(v1 + 528) = result;
  *(int64x2_t *)(v1 + 544) = result;
  *(int64x2_t *)(v1 + 560) = result;
  *(unsigned char *)(v1 + 576) = 0;
  *(void *)(v1 + 584) = 0x7FF8000000000000;
  *(int64x2_t *)(v1 + 592) = result;
  *(int64x2_t *)(v1 + 608) = result;
  *(int64x2_t *)(v1 + 624) = result;
  *(int64x2_t *)(v1 + 640) = result;
  *(unsigned char *)(v1 + 656) = 0;
  *(void *)(v1 + 664) = 0x7FF8000000000000;
  *(int64x2_t *)(v1 + 672) = result;
  *(int64x2_t *)(v1 + 688) = result;
  *(int64x2_t *)(v1 + 704) = result;
  *(int64x2_t *)(v1 + 720) = result;
  *(unsigned char *)(v1 + 736) = 0;
  *(void *)(v1 + 744) = 0x7FF8000000000000;
  *(int64x2_t *)(v1 + 752) = result;
  *(int64x2_t *)(v1 + 768) = result;
  *(int64x2_t *)(v1 + 784) = result;
  *(int64x2_t *)(v1 + 800) = result;
  *(unsigned char *)(v1 + 816) = 0;
  *(void *)(v1 + 824) = 0x7FF8000000000000;
  *(int64x2_t *)(v1 + 832) = result;
  *(int64x2_t *)(v1 + 848) = result;
  return result;
}

uint64_t sub_1000053AC(uint64_t a1)
{
  uint64_t v2 = sub_10000511C(a1);
  *(unsigned char *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0x3FF0000000000000;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 169) = 0u;
  sub_10000511C(v2 + 192);
  *(unsigned char *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = 0x3FF0000000000000;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 320) = 0;
  *(unsigned char *)(a1 + 328) = 0;
  *(void *)(a1 + 336) = 0x3FF0000000000000;
  *(void *)(a1 + 344) = 0;
  *(void *)(a1 + 352) = 0;
  *(void *)(a1 + 360) = 0;
  *(unsigned char *)(a1 + 368) = 0;
  *(void *)(a1 + 376) = 0x3FE0000000000000;
  *(void *)(a1 + 384) = 0x3FE0000000000000;
  *(unsigned char *)(a1 + 392) = 0;
  sub_100005428(a1);
  return a1;
}

double sub_100005428(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  sub_10000511C((uint64_t)&v10);
  long long v2 = v13;
  *(_OWORD *)(a1 + 32) = v12;
  *(_OWORD *)(a1 + 48) = v2;
  long long v3 = v15;
  *(_OWORD *)(a1 + 64) = v14;
  *(_OWORD *)(a1 + 80) = v3;
  long long v4 = v11;
  *(_OWORD *)a1 = v10;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0x3FF0000000000000;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(void *)(a1 + 176) = 0;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  sub_10000511C((uint64_t)&v10 + 8);
  long long v5 = v12;
  *(_OWORD *)(a1 + 232) = v13;
  long long v6 = v15;
  *(_OWORD *)(a1 + 248) = v14;
  *(_OWORD *)(a1 + 264) = v6;
  double result = *(double *)&v10;
  long long v8 = v11;
  *(_OWORD *)(a1 + 184) = v10;
  *(_OWORD *)(a1 + 200) = v8;
  uint64_t v9 = v16;
  *(_OWORD *)(a1 + 216) = v5;
  *(void *)(a1 + 280) = v9;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = 0x3FF0000000000000;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 320) = 0;
  *(void *)(a1 + 328) = 0;
  *(void *)(a1 + 336) = 0x3FF0000000000000;
  *(void *)(a1 + 344) = 0;
  *(void *)(a1 + 352) = 0;
  *(void *)(a1 + 360) = 0;
  *(void *)(a1 + 368) = 0;
  *(void *)(a1 + 376) = 0x3FE0000000000000;
  *(void *)(a1 + 384) = 0x3FE0000000000000;
  *(unsigned char *)(a1 + 392) = 0;
  return result;
}

void sub_10000550C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005528()
{
}

void sub_100005558(char a1, char a2)
{
  v2[0] = 67240448;
  v2[1] = a1 & 1;
  __int16 v3 = 1026;
  int v4 = a2 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CLGLS,GNSSLocationService,failed to configureInitializeAndStartRavenSupervisorWithPlatformInfo,isConfigured,%{public}d,initialized,%{public}d", (uint8_t *)v2, 0xEu);
}

void sub_1000055EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000056A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000056DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CNTimeSpan::SetTimeSpan(CNTimeSpan *this, uint64_t a2, double a3)
{
  return CNTimeSpan::SetTimeSpan(this, a2, a3);
}

uint64_t cnframework::Supervisor::Pause(cnframework::Supervisor *this)
{
  return cnframework::Supervisor::Pause(this);
}

uint64_t cnframework::Supervisor::Reset(cnframework::Supervisor *this)
{
  return cnframework::Supervisor::Reset(this);
}

uint64_t cnframework::Supervisor::Start(cnframework::Supervisor *this)
{
  return cnframework::Supervisor::Start(this);
}

void cnframework::TimestampedEvent::~TimestampedEvent(cnframework::TimestampedEvent *this)
{
}

uint64_t CoreNavigation::CLP::LogEntry::PrivateData::PrivateDataCapture::PrivateDataCapture(CoreNavigation::CLP::LogEntry::PrivateData::PrivateDataCapture *this)
{
  return CoreNavigation::CLP::LogEntry::PrivateData::PrivateDataCapture::PrivateDataCapture(this);
}

uint64_t CoreNavigation::CLP::LogEntry::LogEntry_TimeStamp::LogEntry_TimeStamp(CoreNavigation::CLP::LogEntry::LogEntry_TimeStamp *this)
{
  return CoreNavigation::CLP::LogEntry::LogEntry_TimeStamp::LogEntry_TimeStamp(this);
}

uint64_t CoreNavigation::CLP::LogEntry::Raven::RavenOutput::RavenOutput(CoreNavigation::CLP::LogEntry::Raven::RavenOutput *this)
{
  return CoreNavigation::CLP::LogEntry::Raven::RavenOutput::RavenOutput(this);
}

uint64_t CoreNavigation::CLP::LogEntry::Raven::LogEntry::LogEntry(CoreNavigation::CLP::LogEntry::Raven::LogEntry *this)
{
  return CoreNavigation::CLP::LogEntry::Raven::LogEntry::LogEntry(this);
}

uint64_t CoreNavigation::CLP::LogEntry::LogEntry::LogEntry(CoreNavigation::CLP::LogEntry::LogEntry *this)
{
  return CoreNavigation::CLP::LogEntry::LogEntry::LogEntry(this);
}

void CoreNavigation::CLP::LogEntry::LogEntry::~LogEntry(CoreNavigation::CLP::LogEntry::LogEntry *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromString()
{
  return wireless_diagnostics::google::protobuf::MessageLite::ParseFromString();
}

uint64_t raven::RavenParameters::LoadConfigurationString(raven::RavenParameters *this, const char *a2, BOOL a3)
{
  return raven::RavenParameters::LoadConfigurationString(this, a2, a3);
}

uint64_t raven::RavenParameters::RavenParameters()
{
  return raven::RavenParameters::RavenParameters();
}

uint64_t raven::RavenSupervisor::RaiseEventsFrom()
{
  return raven::RavenSupervisor::RaiseEventsFrom();
}

uint64_t raven::RavenSupervisor::Configure()
{
  return raven::RavenSupervisor::Configure();
}

uint64_t raven::RavenSupervisor::RavenSupervisor(raven::RavenSupervisor *this)
{
  return raven::RavenSupervisor::RavenSupervisor(this);
}

void raven::RavenSolutionEvent::~RavenSolutionEvent(raven::RavenSolutionEvent *this)
{
}

uint64_t raven::ConvertRavenTimeToProtobuf()
{
  return raven::ConvertRavenTimeToProtobuf();
}

uint64_t raven::ConvertRavenSolutionEventToProtobuf(raven *this, const raven::RavenSolutionEvent *a2, CoreNavigation::CLP::LogEntry::Raven::RavenOutput *a3)
{
  return raven::ConvertRavenSolutionEventToProtobuf(this, a2, a3);
}

uint64_t raven::ConvertProtobufToRavenPlatformInfoObject()
{
  return raven::ConvertProtobufToRavenPlatformInfoObject();
}

uint64_t cnprint::CNPrinter::Print()
{
  return cnprint::CNPrinter::Print();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToString()
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToString();
}

uint64_t raven::RavenSupervisor::IsConfigured(raven::RavenSupervisor *this)
{
  return raven::RavenSupervisor::IsConfigured(this);
}

uint64_t raven::RavenSupervisor::GetRavenSolution()
{
  return raven::RavenSupervisor::GetRavenSolution();
}

uint64_t raven::RavenSupervisor::GetRavenSolution(raven::RavenSupervisor *this, raven::RavenSolutionEvent *a2)
{
  return raven::RavenSupervisor::GetRavenSolution(this, a2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::sentry::sentry()
{
  return std::istream::sentry::sentry();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}