@interface FSURLGetResourcePropertyFlags
@end

@implementation FSURLGetResourcePropertyFlags

const void *___FSURLGetResourcePropertyFlags_block_invoke()
{
  if ((_ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable & 1) == 0)
  {
    uint64_t v3 = *MEMORY[0x1E4F1D6B8];
    _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1;
    *(void *)algn_1E8ECFD68 = v3;
    qword_1E8ECFD70 = 0;
    qword_1E8ECFD78 = 2;
    qword_1E8ECFD80 = *MEMORY[0x1E4F1D678];
    unk_1E8ECFD88 = 0;
    uint64_t v4 = *MEMORY[0x1E4F1D6C8];
    qword_1E8ECFD90 = 4;
    unk_1E8ECFD98 = v4;
    qword_1E8ECFDA0 = 0;
    unk_1E8ECFDA8 = 8;
    qword_1E8ECFDB0 = *MEMORY[0x1E4F1D6E8];
    unk_1E8ECFDB8 = 0;
    uint64_t v5 = *MEMORY[0x1E4F1D6A0];
    qword_1E8ECFDC0 = 16;
    unk_1E8ECFDC8 = v5;
    qword_1E8ECFDD0 = 0;
    unk_1E8ECFDD8 = 32;
    qword_1E8ECFDE0 = *MEMORY[0x1E4F1D6D0];
    unk_1E8ECFDE8 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1D6E0];
    qword_1E8ECFDF0 = 64;
    unk_1E8ECFDF8 = v6;
    qword_1E8ECFE00 = 0;
    unk_1E8ECFE08 = 128;
    qword_1E8ECFE10 = *MEMORY[0x1E4F1D690];
    unk_1E8ECFE18 = 0;
    uint64_t v7 = *MEMORY[0x1E4F1D660];
    qword_1E8ECFE20 = 256;
    unk_1E8ECFE28 = v7;
    qword_1E8ECFE30 = 0;
    unk_1E8ECFE38 = 512;
    qword_1E8ECFE40 = *MEMORY[0x1E4F1D670];
    unk_1E8ECFE48 = 0;
    uint64_t v8 = *MEMORY[0x1E4F1CE08];
    qword_1E8ECFE50 = 1024;
    unk_1E8ECFE58 = v8;
    qword_1E8ECFE60 = 0;
    unk_1E8ECFE68 = 2048;
    qword_1E8ECFE70 = *MEMORY[0x1E4F1CD78];
    unk_1E8ECFE78 = 0;
    uint64_t v9 = *MEMORY[0x1E4F1D6B0];
    qword_1E8ECFE80 = 4096;
    unk_1E8ECFE88 = v9;
    qword_1E8ECFE90 = 0;
    unk_1E8ECFE98 = 0x2000;
    qword_1E8ECFEA0 = *MEMORY[0x1E4F1D6F0];
    unk_1E8ECFEA8 = 0;
    uint64_t v10 = *MEMORY[0x1E4F1D688];
    qword_1E8ECFEB0 = 0x4000;
    unk_1E8ECFEB8 = v10;
    qword_1E8ECFEC0 = 0;
    unk_1E8ECFEC8 = 0x8000;
    qword_1E8ECFED0 = *MEMORY[0x1E4F1D668];
    unk_1E8ECFED8 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1D698];
    qword_1E8ECFEE0 = 0x10000;
    unk_1E8ECFEE8 = v11;
    xmmword_1E8ECFEF0 = 0u;
    unk_1E8ECFF00 = 0u;
    _ZGVZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable = 1;
  }
  _FSURLGetResourcePropertyFlags::maskToPropertyTable = (uint64_t)&_ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
  _FSURLGetResourcePropertyFlags::maskToPropertyTableCount = 1;
  v0 = &qword_1E8ECFD78;
  do
  {
    result = CFDictionaryGetValue((CFDictionaryRef)qword_1EB20E028, (const void *)*(v0 - 2));
    *(v0 - 1) = (uint64_t)result;
    uint64_t v2 = *v0;
    v0 += 3;
  }
  while (v2);
  return result;
}

@end