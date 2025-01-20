@interface MTRUUIDHelper
+ (id)GetShortestServiceUUID:(const ChipBleUUID *)a3;
@end

@implementation MTRUUIDHelper

+ (id)GetShortestServiceUUID:(const ChipBleUUID *)a3
{
  if (*(void *)&a3->var0[4] == 0x8000008000100000 && *(_DWORD *)&a3->var0[12] == -80438433)
  {
    if (a3->var0[0] || a3->var0[1])
    {
      v8 = (void *)MEMORY[0x263EFEF88];
      v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3, 4);
      uint64_t v7 = objc_msgSend_UUIDWithData_(v8, v9, (uint64_t)v5);
    }
    else
    {
      v12 = (void *)MEMORY[0x263EFEF88];
      v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)&a3->var0[2], 2);
      uint64_t v7 = objc_msgSend_UUIDWithData_(v12, v13, (uint64_t)v5);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFEF88];
    v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3, 16);
    uint64_t v7 = objc_msgSend_UUIDWithData_(v4, v6, (uint64_t)v5);
  }
  v10 = (void *)v7;

  return v10;
}

@end