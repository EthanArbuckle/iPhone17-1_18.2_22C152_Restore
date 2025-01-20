@interface FSURLGetCatalogInfo
@end

@implementation FSURLGetCatalogInfo

const void *___FSURLGetCatalogInfo_block_invoke()
{
  if ((_ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable & 1) == 0)
  {
    _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 2;
    qword_1E8ED0350 = *MEMORY[0x1E4F1D6E0];
    unk_1E8ED0358 = 0;
    dword_1E8ED0360 = 2;
    qword_1E8ED0368 = *MEMORY[0x1E4F1D6D0];
    unk_1E8ED0370 = 0;
    dword_1E8ED0378 = 49154;
    qword_1E8ED0380 = *MEMORY[0x1E4F1D678];
    unk_1E8ED0388 = 0;
    dword_1E8ED0390 = 2;
    qword_1E8ED0398 = *MEMORY[0x1E4F1D708];
    unk_1E8ED03A0 = 0;
    dword_1E8ED03A8 = 2;
    qword_1E8ED03B0 = *MEMORY[0x1E4F1D698];
    unk_1E8ED03B8 = 0;
    dword_1E8ED03C0 = 8;
    qword_1E8ED03C8 = *MEMORY[0x1E4F1CEB0];
    unk_1E8ED03D0 = 0;
    dword_1E8ED03D8 = 24;
    qword_1E8ED03E0 = *MEMORY[0x1E4F1CDD0];
    unk_1E8ED03E8 = 0;
    dword_1E8ED03F0 = 32;
    qword_1E8ED03F8 = *MEMORY[0x1E4F1D5A0];
    unk_1E8ED0400 = 0;
    dword_1E8ED0408 = 64;
    qword_1E8ED0410 = *MEMORY[0x1E4F1D598];
    unk_1E8ED0418 = 0;
    dword_1E8ED0420 = 128;
    qword_1E8ED0428 = *MEMORY[0x1E4F1D558];
    unk_1E8ED0430 = 0;
    dword_1E8ED0438 = 256;
    qword_1E8ED0440 = *MEMORY[0x1E4F1D590];
    unk_1E8ED0448 = 0;
    dword_1E8ED0450 = 1024;
    qword_1E8ED0458 = qword_1E8ED0380;
    unk_1E8ED0460 = 0;
    dword_1E8ED0468 = 0x400000;
    qword_1E8ED0470 = *MEMORY[0x1E4F1D638];
    unk_1E8ED0478 = 0;
    dword_1E8ED0480 = 268288;
    qword_1E8ED0488 = *MEMORY[0x1E4F1D6C8];
    unk_1E8ED0490 = 0;
    dword_1E8ED0498 = 268288;
    qword_1E8ED04A0 = *MEMORY[0x1E4F1CDE0];
    unk_1E8ED04A8 = 0;
    dword_1E8ED04B0 = 0x4000;
    qword_1E8ED04B8 = *MEMORY[0x1E4F1D640];
    unk_1E8ED04C0 = 0;
    dword_1E8ED04C8 = 0x4000;
    qword_1E8ED04D0 = *MEMORY[0x1E4F1D5B8];
    unk_1E8ED04D8 = 0;
    dword_1E8ED04E0 = 0x8000;
    qword_1E8ED04E8 = *MEMORY[0x1E4F1CDD8];
    unk_1E8ED04F0 = 0;
    dword_1E8ED04F8 = 0x8000;
    qword_1E8ED0500 = *MEMORY[0x1E4F1CDC0];
    unk_1E8ED0508 = 0;
    dword_1E8ED0510 = 0x80000;
    qword_1E8ED0518 = *MEMORY[0x1E4F1D6B0];
    unk_1E8ED0520 = 0;
    dword_1E8ED0528 = 0x80000;
    qword_1E8ED0530 = *MEMORY[0x1E4F1D6F0];
    unk_1E8ED0538 = 0;
    dword_1E8ED0540 = 0x80000;
    qword_1E8ED0548 = *MEMORY[0x1E4F1D688];
    qword_1E8ED0550 = 0;
    dword_1E8ED0558 = 0x80000000;
    qword_1E8ED0560 = *MEMORY[0x1E4F1D738];
    qword_1E8ED0568 = 0;
    dword_1E8ED0570 = 0;
    qword_1E8ED0580 = 0;
    qword_1E8ED0578 = 0;
    _ZGVZZ20_FSURLGetCatalogInfoEUb1_E8theTable = 1;
  }
  _FSURLGetCatalogInfo::maskToPropertyTable = (uint64_t)&_ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
  v0 = &dword_1E8ED0360;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, *((const void **)v0 - 2));
    *((void *)v0 - 1) = result;
    int v2 = *v0;
    v0 += 6;
  }
  while (v2);
  return result;
}

@end