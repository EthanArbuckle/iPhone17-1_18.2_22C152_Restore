uint64_t e1000_init_nvm_params_82575(uint64_t a1)
{
  __int16 v2;
  uint32_t v3;
  uint32_t v4;
  int v5;
  int v6;
  __int16 v7;
  int v8;
  int v9;
  BOOL v10;
  __int16 v11;
  BOOL v12;
  void *v13;
  uint64_t (*v14)(uint64_t);
  uint64_t (*v15)(uint64_t);
  uint32_t readData;

  readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  v2 = readData;
  v3 = (readData >> 11) & 0xF;
  if (v3 >= 9) {
    v3 = 9;
  }
  v4 = v3 + 6;
  v5 = 1 << (v3 + 6);
  *(_WORD *)(a1 + 1232) = v5;
  v6 = *(_DWORD *)(a1 + 284);
  if (v6 > 33)
  {
    v9 = 4;
  }
  else
  {
    v7 = 8;
    *(_WORD *)(a1 + 1238) = 8;
    *(_WORD *)(a1 + 1234) = 1;
    v8 = *(_DWORD *)(a1 + 1220);
    if (v8 == 1)
    {
      *(_WORD *)(a1 + 1240) = 8;
    }
    else if (v8 == 2)
    {
      *(_WORD *)(a1 + 1240) = 32;
      v7 = 16;
    }
    else
    {
      v10 = (v2 & 0x400) == 0;
      if ((v2 & 0x400) != 0) {
        v11 = 32;
      }
      else {
        v11 = 8;
      }
      *(_WORD *)(a1 + 1240) = v11;
      if (v10) {
        v7 = 8;
      }
      else {
        v7 = 16;
      }
    }
    *(_WORD *)(a1 + 1236) = v7;
    if (v4 == 15) {
      *(_WORD *)(a1 + 1240) = 128;
    }
    v9 = 2;
  }
  *(_DWORD *)(a1 + 1216) = v9;
  *(void *)(a1 + 1152) = sub_100001C64;
  *(void *)(a1 + 1168) = sub_100001D50;
  v12 = (v5 & 0x8000u) != 0;
  v13 = e1000_read_nvm_spi;
  if (!v12) {
    v13 = e1000_read_nvm_eerd;
  }
  *(void *)(a1 + 1160) = v13;
  *(void *)(a1 + 1208) = e1000_write_nvm_spi;
  *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
  *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
  *(void *)(a1 + 1192) = sub_100001D8C;
  v14 = sub_100001E8C;
  v15 = sub_100001DF8;
  if (v6 == 31) {
    goto LABEL_23;
  }
  if (v6 == 32)
  {
    v14 = sub_100001F94;
    v15 = sub_100001F40;
LABEL_23:
    *(void *)(a1 + 1200) = v15;
    *(void *)(a1 + 1184) = v14;
  }
  return 0;
}

uint64_t sub_100001C64(uint64_t a1)
{
  uint64_t v2 = sub_100004DB4(a1, 1);
  if (!v2)
  {
    int v3 = *(_DWORD *)(a1 + 284);
    if (v3 == 32)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      uint32_t v4 = readData;
      if ((readData & 0x38000) != 0)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v4 | 0x40000);
      }
      int v3 = *(_DWORD *)(a1 + 284);
    }
    if (v3 == 31)
    {
      uint32_t v7 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v7);
      __dmb(1u);
      uint32_t v5 = v7;
      if ((v7 & 0x8000) != 0)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v5 | 0x8000);
      }
    }
    uint64_t v2 = e1000_acquire_nvm_generic(a1);
    if (v2) {
      sub_100004E68(a1, 1);
    }
  }
  return v2;
}

void sub_100001D50(uint64_t a1)
{
  e1000_release_nvm_generic(a1);
  sub_100004E68(a1, 1);
}

uint64_t sub_100001D8C(uint64_t a1, __int16 *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v5 = (unsigned __int16)*a2;
    if (v5 == 0xFFFF || v5 == 0)
    {
      if (*(_DWORD *)(a1 + 1116) == 3) {
        __int16 v7 = 4376;
      }
      else {
        __int16 v7 = -30447;
      }
      *a2 = v7;
    }
  }
  return result;
}

uint64_t sub_100001DF8(uint64_t a1)
{
  __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 3, 1, &v6);
  if (!result)
  {
    int v3 = 0;
    if (v6 >= 0) {
      int v4 = 1;
    }
    else {
      int v4 = 4;
    }
    while (1)
    {
      unsigned __int16 v5 = ((_WORD)v3 << 6) + 64;
      if (!v3) {
        unsigned __int16 v5 = 0;
      }
      uint64_t result = sub_1000057CC(a1, v5 & 0xFFC0);
      if (result) {
        break;
      }
      if (v4 == ++v3) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100001E8C(uint64_t a1)
{
  __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 3, 1, &v6);
  if (!result)
  {
    if (v6 < 0
      || (v6 |= 0x8000u,
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1208))(a1, 3, 1, &v6),
          !result))
    {
      unsigned __int16 v3 = 0;
      while (1)
      {
        unsigned __int16 v4 = (v3 << 6) + 64;
        if (!v3) {
          unsigned __int16 v4 = 0;
        }
        uint64_t result = sub_10000584C(a1, v4 & 0xFFC0);
        if (result) {
          break;
        }
        unsigned int v5 = v3++;
        if (v5 > 2) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100001F40(uint64_t a1)
{
  unsigned __int16 v2 = 0;
  do
  {
    unsigned __int16 v3 = (v2 << 6) + 64;
    if (!v2) {
      unsigned __int16 v3 = 0;
    }
    uint64_t result = sub_1000057CC(a1, v3 & 0xFFC0);
    unsigned int v5 = v2++;
    if (result) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v5 >= 3;
    }
  }
  while (!v6);
  return result;
}

uint64_t sub_100001F94(uint64_t a1)
{
  unsigned __int16 v2 = 0;
  do
  {
    unsigned __int16 v3 = (v2 << 6) + 64;
    if (!v2) {
      unsigned __int16 v3 = 0;
    }
    uint64_t result = sub_10000584C(a1, v3 & 0xFFC0);
    unsigned int v5 = v2++;
    if (result) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v5 >= 3;
    }
  }
  while (!v6);
  return result;
}

void *e1000_init_function_pointers_82575(void *result)
{
  result[5] = sub_10000203C;
  result[143] = e1000_init_nvm_params_82575;
  result[111] = sub_1000025CC;
  result[158] = e1000_init_mbx_params_pf;
  return result;
}

uint64_t sub_10000203C(uint64_t a1)
{
  e1000_init_mac_ops_generic((void *)a1);
  *(unsigned char *)(a1 + 1376) = 0;
  *(unsigned char *)(a1 + 1379) = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t v3 = readData & 0xC00000;
  switch((readData >> 22) & 3)
  {
    case 1u:
      int v4 = 3;
      goto LABEL_4;
    case 2u:
      if (!sub_100004EE0(a1)) {
        goto LABEL_6;
      }
      goto LABEL_24;
    case 3u:
LABEL_6:
      char v23 = 0;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
      __dmb(1u);
      uint32_t v5 = readData & 0xFFFFFF7F;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v5 | 0x2000000);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      int v6 = -3;
      break;
    default:
      int v4 = 1;
LABEL_4:
      *(_DWORD *)(a1 + 1116) = v4;
      goto LABEL_25;
  }
  while (e1000_read_sfp_data_byte(a1, 0, &v23))
  {
    IODelay(0x186A0uLL);
    if (__CFADD__(v6++, 1))
    {
      int sfp_data_byte = 1;
      goto LABEL_22;
    }
  }
  int sfp_data_byte = e1000_read_sfp_data_byte(a1, 6u, (unsigned char *)(a1 + 1388));
  if (!sfp_data_byte)
  {
    if ((v23 & 0xFE) == 2)
    {
      *(unsigned char *)(a1 + 1379) = 1;
      if ((*(unsigned char *)(a1 + 1388) & 3) != 0)
      {
        int v9 = 3;
LABEL_21:
        int sfp_data_byte = 0;
        *(_DWORD *)(a1 + 1116) = v9;
        goto LABEL_22;
      }
      if ((*(unsigned char *)(a1 + 1388) & 0x20) != 0)
      {
        int v9 = 3;
      }
      else
      {
        if ((*(unsigned char *)(a1 + 1388) & 8) == 0) {
          goto LABEL_17;
        }
        int v9 = 1;
      }
      *(unsigned char *)(a1 + 1376) = 1;
      goto LABEL_21;
    }
LABEL_17:
    int v9 = 0;
    goto LABEL_21;
  }
LABEL_22:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v5);
  if (sfp_data_byte || (int v20 = *(_DWORD *)(a1 + 1116)) == 0)
  {
    *(_DWORD *)(a1 + 1116) = 3;
    if (v3 == 0x800000)
    {
LABEL_24:
      *(_DWORD *)(a1 + 1116) = 1;
      *(unsigned char *)(a1 + 1376) = 1;
    }
  }
  else if ((*(unsigned char *)(a1 + 1388) & 0x20) == 0)
  {
    if (v20 == 1) {
      uint32_t v21 = v2 & 0xFF3FFFFF | 0x800000;
    }
    else {
      uint32_t v21 = v2 | 0xC00000;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v21);
  }
LABEL_25:
  *(_WORD *)(a1 + 326) = 128;
  int v10 = *(_DWORD *)(a1 + 284);
  *(_WORD *)(a1 + 328) = (v10 != 29) << 7;
  if ((v10 & 0xFFFFFFFE) == 0x1E) {
    __int16 v11 = 24;
  }
  else {
    __int16 v11 = 16;
  }
  if ((v10 & 0xFFFFFFFE) == 0x20) {
    __int16 v12 = 32;
  }
  else {
    __int16 v12 = v11;
  }
  *(_WORD *)(a1 + 844) = v12;
  if (v10 > 31)
  {
    *(unsigned char *)(a1 + 1378) = 0;
    if (v10 >= 0x22) {
      *(unsigned char *)(a1 + 1380) = 1;
    }
  }
  *(unsigned char *)(a1 + 850) = 1;
  *(unsigned char *)(a1 + 848) = 1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  *(unsigned char *)(a1 + 849) = (readData & 0xE) != 0;
  *(void *)(a1 + 104) = e1000_get_bus_info_pcie_generic;
  int v13 = *(_DWORD *)(a1 + 284);
  unsigned int v14 = v13 & 0xFFFFFFFE;
  if (v13 < 31)
  {
    *(void *)(a1 + 152) = sub_100003EBC;
  }
  else
  {
    *(void *)(a1 + 152) = sub_100003CB0;
    v15 = e1000_init_hw_i210;
    if (v14 == 34)
    {
      BOOL v16 = 0;
      int v17 = 1;
      goto LABEL_39;
    }
  }
  int v17 = 0;
  BOOL v16 = v14 == 32;
  v15 = sub_100004080;
LABEL_39:
  *(void *)(a1 + 160) = v15;
  *(void *)(a1 + 192) = e1000_setup_link_generic;
  v18 = sub_1000042B8;
  if (*(_DWORD *)(a1 + 1116) == 1) {
    v18 = sub_1000040DC;
  }
  *(void *)(a1 + 200) = v18;
  *(void *)(a1 + 176) = sub_1000044FC;
  *(void *)(a1 + 184) = sub_1000045D8;
  *(void *)(a1 + 72) = sub_1000046A8;
  *(void *)(a1 + 240) = sub_100004730;
  *(void *)(a1 + 224) = sub_100004778;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  if (v16)
  {
    *(void *)(a1 + 216) = e1000_write_vfta_i350;
    *(void *)(a1 + 96) = sub_1000047F8;
  }
  else
  {
    *(void *)(a1 + 216) = e1000_write_vfta_generic;
    *(void *)(a1 + 96) = e1000_clear_vfta_generic;
    if (v13 < 31) {
      goto LABEL_45;
    }
  }
  *(void *)(a1 + 248) = e1000_validate_mdi_setting_crossover_generic;
LABEL_45:
  *(void *)(a1 + 48) = e1000_id_led_init_generic;
  *(void *)(a1 + 56) = e1000_blink_led_generic;
  *(void *)(a1 + 208) = e1000_setup_led_generic;
  *(void *)(a1 + 80) = e1000_cleanup_led_generic;
  *(void *)(a1 + 128) = e1000_led_on_generic;
  *(void *)(a1 + 136) = e1000_led_off_generic;
  *(void *)(a1 + 88) = sub_10000489C;
  *(void *)(a1 + 120) = sub_100004D74;
  *(void *)(a1 + 256) = sub_100004DB4;
  *(void *)(a1 + 264) = sub_100004E68;
  if (v17)
  {
    *(void *)(a1 + 256) = e1000_acquire_swfw_sync_i210;
    *(void *)(a1 + 264) = e1000_release_swfw_sync_i210;
  }
  (*(void (**)(uint64_t))(a1 + 112))(a1);
  return 0;
}

uint64_t sub_1000025CC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) != 1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1072) = 1;
    return result;
  }
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = e1000_power_down_phy_copper_base;
  *(_WORD *)(a1 + 1122) = 47;
  *(_DWORD *)(a1 + 1108) = 100;
  *(void *)(a1 + 896) = e1000_acquire_phy_base;
  *(void *)(a1 + 920) = e1000_check_reset_block_generic;
  *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
  *(void *)(a1 + 944) = sub_100005110;
  *(void *)(a1 + 1000) = e1000_release_phy_base;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  int v2 = *(unsigned __int8 *)(a1 + 1376);
  uint32_t v3 = readData & 0xFDFFFFFF;
  int v4 = sub_1000051E0;
  if (!*(unsigned char *)(a1 + 1376)) {
    int v4 = e1000_phy_hw_reset_generic;
  }
  *(void *)(a1 + 1008) = v4;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3 | (v2 << 25));
  sub_100004F68(a1);
  if (*(unsigned char *)(a1 + 1376) && (sub_100004EE0(a1) & 1) == 0)
  {
    *(void *)(a1 + 976) = sub_100005268;
    *(void *)(a1 + 1032) = sub_1000052E0;
    int v5 = *(_DWORD *)(a1 + 284);
LABEL_14:
    if (v5 == 33) {
      e1000_get_phy_id(a1);
    }
    goto LABEL_16;
  }
  int v5 = *(_DWORD *)(a1 + 284);
  int v6 = e1000_write_phy_reg_gs40g;
  __int16 v7 = e1000_read_phy_reg_gs40g;
  if ((v5 - 31) < 3)
  {
    *(void *)(a1 + 976) = sub_100005358;
    *(void *)(a1 + 1032) = sub_1000053C0;
    goto LABEL_14;
  }
  if ((v5 - 34) >= 2)
  {
    int v6 = e1000_write_phy_reg_igp;
    __int16 v7 = e1000_read_phy_reg_igp;
  }
  *(void *)(a1 + 976) = v7;
  *(void *)(a1 + 1032) = v6;
LABEL_16:
  if (!*(unsigned char *)(a1 + 1376))
  {
    uint32_t v10 = 1;
LABEL_30:
    *(_DWORD *)(a1 + 1100) = v10;
    uint64_t phy_id = e1000_get_phy_id(a1);
    goto LABEL_36;
  }
  __int16 v18 = 0;
  if (sub_100004EE0(a1))
  {
    int v9 = *(_DWORD *)(a1 + 284);
    if ((v9 - 31) < 5)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, &readData);
      __dmb(1u);
LABEL_29:
      uint32_t v10 = (readData >> 21) & 0x1F;
      goto LABEL_30;
    }
    if ((v9 - 29) <= 1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, &readData);
      __dmb(1u);
      goto LABEL_29;
    }
    uint64_t phy_id = 4294967294;
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v11 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v11 & 0xFFFFFF7F);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x493E0uLL);
    *(_DWORD *)(a1 + 1100) = 1;
    while (1)
    {
      if (!(*(unsigned int (**)(uint64_t))(a1 + 896))(a1))
      {
        int v12 = e1000_read_phy_reg_i2c(a1, 2, &v18);
        (*(void (**)(uint64_t))(a1 + 1000))(a1);
        if (!v12 && v18 == 321) {
          break;
        }
      }
      unsigned int v13 = *(_DWORD *)(a1 + 1100) + 1;
      *(_DWORD *)(a1 + 1100) = v13;
      if (v13 >= 8) {
        goto LABEL_32;
      }
    }
    unsigned int v13 = *(_DWORD *)(a1 + 1100);
LABEL_32:
    if (v13 == 8)
    {
      *(_DWORD *)(a1 + 1100) = 0;
      uint64_t phy_id = 4294967294;
    }
    else
    {
      uint64_t phy_id = e1000_get_phy_id(a1);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v11);
  }
LABEL_36:
  int v15 = *(_DWORD *)(a1 + 1104);
  uint64_t result = 4294967294;
  if (v15 > 21040799)
  {
    if (v15 > 44565391)
    {
      if ((v15 - 44565392) >= 2) {
        return result;
      }
      *(_DWORD *)(a1 + 1072) = 6;
      *(void *)(a1 + 912) = e1000_check_polarity_igp;
      *(void *)(a1 + 960) = e1000_get_phy_info_igp;
      *(void *)(a1 + 952) = e1000_get_cable_length_igp_2;
      *(void *)(a1 + 1016) = sub_100005428;
      *(void *)(a1 + 1024) = e1000_set_d3_lplu_state_generic;
      BOOL v16 = e1000_phy_force_speed_duplex_igp;
      goto LABEL_52;
    }
    if (v15 != 21040800)
    {
      if (v15 != 22283168 && v15 != 22283184) {
        return result;
      }
      *(_DWORD *)(a1 + 1072) = 13;
      *(void *)(a1 + 912) = e1000_check_polarity_82577;
      *(void *)(a1 + 960) = e1000_get_phy_info_82577;
      *(void *)(a1 + 952) = e1000_get_cable_length_82577;
      *(void *)(a1 + 1016) = sub_100005558;
      *(void *)(a1 + 1024) = sub_1000055EC;
      BOOL v16 = e1000_phy_force_speed_duplex_82577;
      goto LABEL_52;
    }
    goto LABEL_49;
  }
  if (v15 > 21040575)
  {
    if ((v15 - 21040576) > 0x30 || ((1 << (v15 + 64)) & 0x1000000010001) == 0) {
      return result;
    }
    goto LABEL_49;
  }
  switch(v15)
  {
    case 21040128:
      *(_DWORD *)(a1 + 1072) = 15;
      *(void *)(a1 + 912) = e1000_check_polarity_m88;
      *(void *)(a1 + 960) = e1000_get_phy_info_m88;
      *(void *)(a1 + 952) = e1000_get_cable_length_m88_gen2;
      *(void *)(a1 + 1016) = sub_100005558;
      *(void *)(a1 + 1024) = sub_1000055EC;
      goto LABEL_62;
    case 21040272:
LABEL_49:
      *(_DWORD *)(a1 + 1072) = 2;
      *(void *)(a1 + 912) = e1000_check_polarity_m88;
      *(void *)(a1 + 960) = e1000_get_phy_info_m88;
      *(void *)(a1 + 952) = e1000_get_cable_length_m88_gen2;
      BOOL v16 = e1000_phy_force_speed_duplex_m88;
LABEL_52:
      *(void *)(a1 + 936) = v16;
      if (v15 == 21040800) {
        return e1000_initialize_M88E1543_phy(a1);
      }
      if (v15 == 21040592) {
        return e1000_initialize_M88E1512_phy(a1);
      }
      uint64_t result = phy_id;
      if (v15 == 21040272)
      {
        LOWORD(readData) = 0;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 2);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint32_t *))(a1 + 976))(a1, 16, &readData);
          if (!result)
          {
            uint64_t result = 0;
            if ((readData & 0x300) == 0x100) {
              *(void *)(a1 + 72) = sub_1000056A8;
            }
          }
        }
      }
      return result;
    case 21040320:
      *(_DWORD *)(a1 + 1072) = 2;
      *(void *)(a1 + 912) = e1000_check_polarity_m88;
      *(void *)(a1 + 960) = e1000_get_phy_info_m88;
      *(void *)(a1 + 952) = e1000_get_cable_length_m88;
LABEL_62:
      *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_m88;
      return phy_id;
  }
  return result;
}

uint64_t e1000_reset_init_script_82575(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 284) == 29)
  {
    e1000_write_8bit_ctrl_reg_generic(a1, 0x24u, 0, 12);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x24u, 1, 120);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x24u, 27, 35);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x24u, 35, 21);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B48u, 20, 0);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B48u, 16, 0);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B44u, 0, 236);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B44u, 97, 223);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B44u, 52, 5);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B44u, 47, 129);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B4Cu, 2, 71);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B4Cu, 20, 0);
    e1000_write_8bit_ctrl_reg_generic(a1, 0x5B4Cu, 16, 0);
  }
  return 0;
}

void e1000_vmdq_set_anti_spoofing_pf(uint64_t a1, int a2, char a3)
{
  int v6 = *(_DWORD *)(a1 + 284);
  if ((v6 - 32) >= 2)
  {
    if (v6 != 30) {
      return;
    }
    uint64_t v7 = 13568;
  }
  else
  {
    uint64_t v7 = 23244;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v7, &readData);
  __dmb(1u);
  if (a2) {
    uint32_t v8 = (readData | 0xFFFF) ^ (129 << a3);
  }
  else {
    uint32_t v8 = readData & 0xFFFF0000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v7, v8);
}

void e1000_vmdq_set_loopback_pf(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 284);
  if ((v4 - 32) >= 2)
  {
    if (v4 != 30) {
      return;
    }
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3500uLL, &v11);
    __dmb(1u);
    if (a2) {
      unsigned int v9 = 0x80000000;
    }
    else {
      unsigned int v9 = 0;
    }
    uint32_t v6 = v9 & 0x80000000 | v11 & 0x7FFFFFFF;
    __dmb(2u);
    uint64_t v7 = *(IOPCIDevice **)(a1 + 16);
    uint64_t v8 = 13568;
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5ACCuLL, &readData);
    __dmb(1u);
    if (a2) {
      unsigned int v5 = 0x80000000;
    }
    else {
      unsigned int v5 = 0;
    }
    uint32_t v6 = v5 & 0x80000000 | readData & 0x7FFFFFFF;
    __dmb(2u);
    uint64_t v7 = *(IOPCIDevice **)(a1 + 16);
    uint64_t v8 = 23244;
  }
  IOPCIDevice::MemoryWrite32(v7, 0, v8, v6);
}

void e1000_vmdq_set_replication_pf(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x581CuLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xBFFFFFFF;
  if (a2) {
    int v5 = 0x40000000;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x581CuLL, v4 | v5);
}

uint64_t e1000_rxpbs_adjust_82580(unsigned int a1)
{
  if (a1 > 0xA) {
    return 0;
  }
  else {
    return word_100033E10[a1];
  }
}

uint64_t e1000_read_emi_reg(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, a2);
  if (!result)
  {
    uint32_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 976);
    return v6(a1, 17, a3);
  }
  return result;
}

uint64_t e1000_initialize_M88E1512_phy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1104) != 21040592) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 255);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 8523);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8516);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 3112);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8518);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 45619);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8525);
              if (!result)
              {
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 52236);
                if (!result)
                {
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8537);
                  if (!result)
                  {
                    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 251);
                    if (!result)
                    {
                      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7, 13);
                      if (!result)
                      {
                        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 18);
                        if (!result)
                        {
                          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 20, 32769);
                          if (!result)
                          {
                            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
                            if (!result)
                            {
                              uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
                              if (!result)
                              {
                                IODelay(0xF4240uLL);
                                return 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_initialize_M88E1543_phy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1104) != 21040800) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 255);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 8523);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8516);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 3112);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8518);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 45619);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8525);
              if (!result)
              {
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 17, 56332);
                if (!result)
                {
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 16, 8537);
                  if (!result)
                  {
                    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 251);
                    if (!result)
                    {
                      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7, 49165);
                      if (!result)
                      {
                        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 18);
                        if (!result)
                        {
                          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 20, 32769);
                          if (!result)
                          {
                            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 1);
                            if (!result)
                            {
                              uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 37184);
                              if (!result)
                              {
                                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
                                if (!result)
                                {
                                  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
                                  if (!result)
                                  {
                                    IODelay(0xF4240uLL);
                                    return 0;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_set_eee_i350(uint64_t a1, int a2, int a3)
{
  if (*(int *)(a1 + 284) >= 32 && *(_DWORD *)(a1 + 1116) == 1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, &readData);
    __dmb(1u);
    uint32_t v6 = readData;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData;
    if (*(unsigned char *)(a1 + 1378))
    {
      uint32_t v8 = v6 & 0xFFFFFFF3;
      uint32_t v9 = readData & 0xFFF8FFFF;
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE34uLL, &readData);
      __dmb(1u);
      if (a3) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
      if (a2) {
        int v11 = 8;
      }
      else {
        int v11 = 0;
      }
      uint32_t v8 = v10 | v11 | v6 & 0xFFFFFFF3;
      uint32_t v9 = v7 | 0x70000;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, v8);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, v9);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, &readData);
    __dmb(1u);
  }
  return 0;
}

uint64_t e1000_set_eee_i354(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 1116) != 1) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 1104);
  if (v4 != 21040800 && v4 != 21040592) {
    return 0;
  }
  unsigned __int16 v12 = 0;
  if (*(unsigned char *)(a1 + 1378))
  {
    uint64_t result = e1000_read_xmdio_reg(a1, 60, 7, &v12);
    if (result) {
      return result;
    }
    unsigned __int16 v7 = v12 & 0xFFF9;
LABEL_10:
    unsigned __int16 v12 = v7;
    return e1000_write_xmdio_reg(a1, 60, 7, v7);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 18);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v12);
    if (!result)
    {
      v12 |= 1u;
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1032))(a1, 0);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
        if (!result)
        {
          uint64_t result = e1000_read_xmdio_reg(a1, 60, 7, &v12);
          if (!result)
          {
            if (a3) {
              __int16 v10 = 2;
            }
            else {
              __int16 v10 = 0;
            }
            if (a2) {
              __int16 v11 = 4;
            }
            else {
              __int16 v11 = 0;
            }
            unsigned __int16 v7 = v10 | v11 | v12 & 0xFFF9;
            goto LABEL_10;
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_get_eee_status_i354(uint64_t a1, BOOL *a2)
{
  if (*(_DWORD *)(a1 + 1116) != 1) {
    return 0;
  }
  int v2 = *(_DWORD *)(a1 + 1104);
  if (v2 != 21040800 && v2 != 21040592) {
    return 0;
  }
  unsigned __int16 v6 = 0;
  uint64_t result = e1000_read_xmdio_reg(a1, 1, 3, &v6);
  if (!result) {
    *a2 = (v6 & 0xC00) != 0;
  }
  return result;
}

void e1000_write_vfta_i350(uint64_t a1, int a2, uint32_t data)
{
  int v5 = 4 * a2;
  int v6 = 4 * a2 + 22016;
  int v7 = 10;
  do
  {
    __dmb(2u);
    if (v5 > -11505)
    {
      if (v5 <= -7673)
      {
        if (v5 > -8681)
        {
          if (v5 == -8680)
          {
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v8 = 32792;
            int v10 = 13336;
          }
          else if (v5 == -7680)
          {
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v8 = 1056;
            int v10 = 14336;
          }
          else
          {
            unsigned int v8 = v6;
            if (v5 != -7676) {
              goto LABEL_64;
            }
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v8 = 1060;
            int v10 = 14340;
          }
        }
        else if (v5 == -11504)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 328;
          int v10 = 10512;
        }
        else if (v5 == -11496)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 336;
          int v10 = 10520;
        }
        else
        {
          unsigned int v8 = v6;
          if (v5 != -8688) {
            goto LABEL_64;
          }
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 32784;
          int v10 = 13328;
        }
      }
      else if (v5 <= -7649)
      {
        if (v5 == -7672)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 1064;
          int v10 = 14344;
        }
        else if (v5 == -7664)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 1072;
          int v10 = 14352;
        }
        else
        {
          unsigned int v8 = v6;
          if (v5 != -7656) {
            goto LABEL_64;
          }
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 1080;
          int v10 = 14360;
        }
      }
      else if (v5 > -513)
      {
        if (!v5)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v8 = 1536;
          }
          else {
            unsigned int v8 = 22016;
          }
          goto LABEL_64;
        }
        unsigned int v8 = v6;
        if (v5 != -512) {
          goto LABEL_64;
        }
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 64;
        int v10 = 21504;
      }
      else if (v5 == -7648)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 1088;
        int v10 = 14368;
      }
      else
      {
        unsigned int v8 = v6;
        if (v5 != -1024) {
          goto LABEL_64;
        }
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 512;
        int v10 = 20992;
      }
    }
    else if (v5 <= -11769)
    {
      if (v5 > -12777)
      {
        if (v5 == -12776)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 32776;
          int v10 = 9240;
        }
        else if (v5 == -11776)
        {
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 272;
          int v10 = 10240;
        }
        else
        {
          unsigned int v8 = v6;
          if (v5 != -11772) {
            goto LABEL_64;
          }
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v8 = 276;
          int v10 = 10244;
        }
      }
      else if (v5 == -13472)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 360;
        int v10 = 8544;
      }
      else if (v5 == -13464)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 352;
        int v10 = 8552;
      }
      else
      {
        unsigned int v8 = v6;
        if (v5 != -12784) {
          goto LABEL_64;
        }
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 0x8000;
        int v10 = 9232;
      }
    }
    else if (v5 <= -11745)
    {
      if (v5 == -11768)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 280;
        int v10 = 10248;
      }
      else if (v5 == -11760)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 288;
        int v10 = 10256;
      }
      else
      {
        unsigned int v8 = v6;
        if (v5 != -11752) {
          goto LABEL_64;
        }
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 296;
        int v10 = 10264;
      }
    }
    else if (v5 > -11517)
    {
      if (v5 == -11516)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 316;
        int v10 = 10500;
      }
      else
      {
        unsigned int v8 = v6;
        if (v5 != -11512) {
          goto LABEL_64;
        }
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v8 = 320;
        int v10 = 10504;
      }
    }
    else if (v5 == -11744)
    {
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v8 = 264;
      int v10 = 10272;
    }
    else
    {
      unsigned int v8 = v6;
      if (v5 != -11520) {
        goto LABEL_64;
      }
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v8 = 312;
      int v10 = 10496;
    }
    if (!v9) {
      unsigned int v8 = v10;
    }
LABEL_64:
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v8, data);
    --v7;
  }
  while (v7);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
}

uint64_t sub_100003CB0(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 1377);
  *(unsigned char *)(a1 + 1377) = 0;
  int v3 = *(_DWORD *)(a1 + 284);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  e1000_disable_pcie_primary_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  int v5 = 0;
  if (v2 && v3 != 31)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 256))(a1, 256))
    {
      int v5 = 0;
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      int v5 = 1;
      if ((readData & 0x100000) == 0)
      {
        int v6 = 0x20000000;
        goto LABEL_8;
      }
    }
  }
  int v6 = 0x4000000;
LABEL_8:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4 | v6);
  if (*(_WORD *)(a1 + 9584) != 1080)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
  }
  IODelay(0x1388uLL);
  e1000_get_auto_rd_done_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, 0x100000u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
  __dmb(1u);
  sub_100004F68(a1);
  uint64_t v7 = e1000_check_alt_mac_addr_generic(a1);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(a1 + 264))(a1, 256);
  }
  return v7;
}

uint64_t sub_100003EBC(uint64_t a1)
{
  e1000_disable_pcie_primary_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  LOWORD(readData) = 0;
  if ((v2 & 0xF000) == 0)
  {
    if ((v2 & 0x40000) != 0)
    {
      if (!e1000_read_pcie_cap_reg(a1, 0x28u, (uint16_t *)&readData))
      {
        LOWORD(readData) = readData | 5;
        e1000_write_pcie_cap_reg(a1, 0x28u, (uint16_t *)&readData);
      }
    }
    else
    {
      v2 |= 0x1000u;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, v2 & 0xFFFEFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v3 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v3 | 0x4000000);
  e1000_get_auto_rd_done_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  if ((readData & 0x100) == 0) {
    e1000_reset_init_script_82575(a1);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
  __dmb(1u);
  return e1000_check_alt_mac_addr_generic(a1);
}

uint64_t sub_100004080(uint64_t a1)
{
  (*(void (**)(void))(a1 + 48))();
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  uint64_t inited = e1000_init_hw_base(a1);
  *(_DWORD *)(a1 + 1384) = 1500;
  sub_10000489C(a1);
  return inited;
}

uint64_t sub_1000040DC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  unsigned int v3 = *(_DWORD *)(a1 + 284);
  BOOL v4 = v3 > 0x23;
  uint64_t v5 = (1 << v3) & 0xD80000000;
  if (!v4 && v5 != 0)
  {
    uint32_t v12 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &v12);
    __dmb(1u);
    uint32_t v7 = v12 & 0xFFFFFFDF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v7);
  }
  uint64_t result = sub_1000042B8(a1);
  if (result) {
    return result;
  }
  if (*(unsigned char *)(a1 + 1376))
  {
    if (!*(unsigned char *)(a1 + 1134))
    {
      IODelay(0x493E0uLL);
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1008))(a1);
      if (result) {
        return result;
      }
    }
  }
  int v9 = *(_DWORD *)(a1 + 1072);
  uint64_t result = 4294967294;
  if (v9 > 12)
  {
    if (v9 == 13)
    {
      uint64_t result = e1000_copper_link_setup_82577(a1);
      if (result) {
        return result;
      }
      return e1000_setup_copper_link_generic(a1);
    }
    if (v9 != 15) {
      return result;
    }
LABEL_17:
    int v10 = *(_DWORD *)(a1 + 1104);
    if (v10 <= 21040575)
    {
      if (v10 == 21040128) {
        goto LABEL_28;
      }
      unsigned __int16 v11 = 3216;
    }
    else
    {
      if ((v10 - 21040576) <= 0x30 && ((1 << (v10 + 64)) & 0x1000000010001) != 0) {
        goto LABEL_28;
      }
      unsigned __int16 v11 = 3744;
    }
    if (v10 != (v11 | 0x1410000))
    {
      uint64_t result = e1000_copper_link_setup_m88(a1);
      if (result) {
        return result;
      }
      return e1000_setup_copper_link_generic(a1);
    }
LABEL_28:
    uint64_t result = e1000_copper_link_setup_m88_gen2(a1);
    if (result) {
      return result;
    }
    return e1000_setup_copper_link_generic(a1);
  }
  if (v9 == 2) {
    goto LABEL_17;
  }
  if (v9 == 6)
  {
    uint64_t result = e1000_copper_link_setup_igp(a1);
    if (!result) {
      return e1000_setup_copper_link_generic(a1);
    }
  }
  return result;
}

uint64_t sub_1000042B8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) != 3 && !*(unsigned char *)(a1 + 1376)) {
    return 0;
  }
  __int16 v15 = 0;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, 0x400u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t v3 = readData & 0xFFFFFF7F;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  if ((*(_DWORD *)(a1 + 284) - 29) >= 2) {
    int v4 = 64;
  }
  else {
    int v4 = 786496;
  }
  uint32_t v5 = v4 | readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4208uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  int v7 = v2 & 0xC00000;
  BOOL v8 = *(unsigned char *)(a1 + 851) != 0;
  if (v7 == 0x400000)
  {
    BOOL v8 = 0;
  }
  else if (v7 == 0x800000)
  {
    uint32_t v9 = readData & 0xFFFBFFFF;
    BOOL v8 = 1;
    goto LABEL_15;
  }
  if ((*(_DWORD *)(a1 + 284) - 29) <= 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 3, 1, &v15);
    if (result) {
      return result;
    }
    if ((v15 & 0x4000) != 0) {
      BOOL v8 = 0;
    }
  }
  v5 |= 0x1A01u;
  uint32_t v9 = v6 | 0xC;
LABEL_15:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v5);
  if (v8)
  {
    uint32_t v11 = v9 & 0xFFFCFF4E | 0x30000;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4218uLL, &readData);
    __dmb(1u);
    int v12 = *(_DWORD *)(a1 + 884);
    if (v12 == 3) {
      goto LABEL_19;
    }
    uint32_t v13 = readData & 0xFFFFFE7F;
    if (v12 == 2)
    {
      v13 |= 0x100u;
      goto LABEL_22;
    }
    if (v12 == 1) {
LABEL_19:
    }
      uint32_t v13 = readData | 0x180;
LABEL_22:
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x4218uLL, v13);
    goto LABEL_23;
  }
  uint32_t v11 = v9 & 0xFFFEFF4E | 0x90;
LABEL_23:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x4208uLL, v11);
  uint64_t result = 0;
  if (v8) {
    return result;
  }
  if (!*(unsigned char *)(a1 + 1376)) {
    e1000_force_mac_fc_generic(a1);
  }
  return 0;
}

void sub_1000044FC(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 1116) == 3 || *(unsigned char *)(a1 + 1376)) && !e1000_enable_mng_pass_thru(a1))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4200uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData & 0xFFFFFFF7;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x4200uLL, v2);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &v5);
    __dmb(1u);
    uint32_t v3 = v5 | 0x80;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
    uint32_t v4 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v4);
    __dmb(1u);
    IODelay(0x3E8uLL);
  }
}

void sub_1000045D8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) == 3 || *(unsigned char *)(a1 + 1376))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4200uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData | 8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x4200uLL, v2);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &v5);
    __dmb(1u);
    uint32_t v3 = v5 & 0xFFFFFF7F;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
    uint32_t v4 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v4);
    __dmb(1u);
    IODelay(0x3E8uLL);
  }
}

uint64_t sub_1000046A8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    return e1000_check_for_copper_link_generic(a1);
  }
  else
  {
    sub_100005028(a1, &v4, &v3);
    *(unsigned char *)(a1 + 853) = *(unsigned char *)(a1 + 860) ^ 1;
    return e1000_config_fc_after_link_up_generic(a1);
  }
}

uint64_t sub_100004730(uint64_t a1)
{
  uint64_t result = e1000_check_alt_mac_addr_generic(a1);
  if (!result)
  {
    return e1000_read_mac_addr_generic(a1);
  }
  return result;
}

void sub_100004778(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x404uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFF003FF | 0xFC00;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x404uLL, v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v3);
  __dmb(1u);
}

void sub_1000047F8(uint64_t a1)
{
  for (uint64_t i = 0; i != 128; ++i)
  {
    int v3 = 10;
    do
    {
      __dmb(2u);
      uint64_t v4 = 4 * i + 22016;
      if (!i)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v4 = 1536;
        }
        else {
          uint64_t v4 = 22016;
        }
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0);
      --v3;
    }
    while (v3);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
  }
}

void sub_10000489C(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4100uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4124uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4104uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4108uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4110uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4118uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x411CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4120uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x402CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4104uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4118uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4124uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4128uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x412CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4130uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4134uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4138uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 1116) == 3 || *(unsigned char *)(a1 + 1376))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4228uLL, &readData);
    __dmb(1u);
  }
}

uint64_t sub_100004D74(uint64_t a1, __int16 *a2, __int16 *a3)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    return e1000_get_speed_and_duplex_copper_generic(a1, a2, a3);
  }
  else
  {
    sub_100005028(a1, a2, a3);
    return 0;
  }
}

uint64_t sub_100004DB4(uint64_t a1, int a2)
{
  int v4 = a2 | (a2 << 16);
  int v5 = 200;
  while (1)
  {
    if (e1000_get_hw_semaphore_generic(a1)) {
      return 4294967283;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
    __dmb(1u);
    if ((readData & v4) == 0) {
      break;
    }
    e1000_put_hw_semaphore_generic(a1);
    IODelay(0x1388uLL);
    if (!--v5) {
      return 4294967283;
    }
  }
  uint32_t v7 = readData | a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v7);
  e1000_put_hw_semaphore_generic(a1);
  return 0;
}

void sub_100004E68(uint64_t a1, int a2)
{
  while (e1000_get_hw_semaphore_generic(a1))
    ;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & ~a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v4);
  e1000_put_hw_semaphore_generic(a1);
}

uint64_t sub_100004EE0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 284);
  if ((v1 - 31) >= 5)
  {
    if ((v1 - 29) > 1) {
      return 0;
    }
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, &v5);
    __dmb(1u);
    uint32_t v2 = v5;
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData;
  }
  return v2 >> 31;
}

void sub_100004F68(uint64_t a1)
{
  __int16 v5 = 0;
  if (*(_DWORD *)(a1 + 284) == 31 && *(unsigned char *)(a1 + 1376))
  {
    if (*(_WORD *)(a1 + 1260)) {
      __int16 v2 = (*(_WORD *)(a1 + 1260) << 6) + 100;
    }
    else {
      __int16 v2 = 36;
    }
    if (!(*(unsigned int (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2 & 0xFFFC, 1, &v5))
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, &readData);
      __dmb(1u);
      uint32_t v3 = readData | ((v5 & 4) << 29) | ((v5 & 8) << 27);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, v3);
    }
  }
}

void sub_100005028(uint64_t a1, __int16 *a2, __int16 *a3)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x420CuLL, &readData);
  __dmb(1u);
  char v6 = readData;
  if ((readData & 1) == 0)
  {
    __int16 v7 = 0;
    __int16 v8 = 0;
    *(unsigned char *)(a1 + 860) = 0;
LABEL_14:
    *a2 = v7;
    *a3 = v8;
    return;
  }
  *(unsigned char *)(a1 + 860) = 1;
  if ((v6 & 2) != 0) {
    __int16 v9 = 100;
  }
  else {
    __int16 v9 = 10;
  }
  if ((v6 & 4) != 0) {
    __int16 v9 = 1000;
  }
  *a2 = v9;
  if ((v6 & 8) != 0) {
    __int16 v10 = 2;
  }
  else {
    __int16 v10 = 1;
  }
  *a3 = v10;
  if (*(_DWORD *)(a1 + 284) == 33)
  {
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v11);
    __dmb(1u);
    if ((v11 & 0x3000) == 0x1000)
    {
      __int16 v8 = 2;
      __int16 v7 = 2500;
      goto LABEL_14;
    }
  }
}

uint64_t sub_100005110(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 1260) - 1;
  if (v2 > 2) {
    int v3 = 0x40000;
  }
  else {
    int v3 = dword_100033E28[(__int16)v2];
  }
  int v4 = -100;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1010uLL, &readData);
    __dmb(1u);
    if ((readData & v3) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
  }
  while (!__CFADD__(v4++, 1));
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v7);
  __dmb(1u);
  if ((v7 & 0x100) == 0 && *(_DWORD *)(a1 + 1072) == 6) {
    e1000_phy_init_script_igp3(a1);
  }
  return 0;
}

uint64_t sub_1000051E0(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1032);
  if (!v1) {
    return 0;
  }
  uint64_t result = v1();
  if (result) {
    return result;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
  if (result) {
    return result;
  }
  if (*(_DWORD *)(a1 + 1104) != 21040592) {
    return 0;
  }
  return e1000_initialize_M88E1512_phy(a1);
}

uint64_t sub_100005268(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (a2 > 0xFF) {
    return 4294967292;
  }
  uint64_t result = (*(uint64_t (**)(void))(a1 + 896))();
  if (!result)
  {
    uint64_t phy_reg_i2c = e1000_read_phy_reg_i2c(a1, a2, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return phy_reg_i2c;
  }
  return result;
}

uint64_t sub_1000052E0(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFF) {
    return 4294967292;
  }
  uint64_t result = (*(uint64_t (**)(void))(a1 + 896))();
  if (!result)
  {
    uint64_t v7 = e1000_write_phy_reg_i2c(a1, a2, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return v7;
  }
  return result;
}

uint64_t sub_100005358(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 896))();
  if (!result)
  {
    uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return phy_reg_mdic;
  }
  return result;
}

uint64_t sub_1000053C0(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(a1 + 896))();
  if (!result)
  {
    uint64_t v7 = e1000_write_phy_reg_mdic(a1, a2, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return v7;
  }
  return result;
}

uint64_t sub_100005428(uint64_t a1, int a2)
{
  unsigned int v2 = *(uint64_t (**)(void))(a1 + 976);
  if (!v2) {
    return 0;
  }
  unsigned __int16 v8 = 0;
  uint64_t result = v2();
  if (!result)
  {
    if (a2)
    {
      v8 |= 2u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
      if (!result)
      {
        (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v8);
LABEL_13:
        unsigned __int16 v7 = v8 & 0xFF7F;
        goto LABEL_14;
      }
    }
    else
    {
      v8 &= ~2u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
      int v6 = *(_DWORD *)(a1 + 1096);
      if (v6 == 2)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v8);
        if (!result) {
          goto LABEL_13;
        }
      }
      else if (v6 == 1)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v8);
        if (!result)
        {
          unsigned __int16 v7 = v8 | 0x80;
LABEL_14:
          unsigned __int16 v8 = v7;
          return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 16, v7);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100005558(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
  __dmb(1u);
  if (a2)
  {
    uint32_t v4 = readData & 0xFFFFFFFC | 2;
  }
  else
  {
    uint32_t v5 = readData & 0xFFFFFFFD;
    int v6 = *(_DWORD *)(a1 + 1096);
    if (v6 == 1) {
      uint32_t v5 = readData & 0xFFFFFFFC | 1;
    }
    if (v6 == 2) {
      uint32_t v4 = readData & 0xFFFFFFFC;
    }
    else {
      uint32_t v4 = v5;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v4);
  return 0;
}

uint64_t sub_1000055EC(uint64_t a1, char a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
  __dmb(1u);
  if (a2)
  {
    unsigned int v4 = *(unsigned __int16 *)(a1 + 1120);
    BOOL v5 = v4 > 0x2F;
    uint64_t v6 = (1 << v4) & 0x800000008008;
    if (v5 || v6 == 0) {
      uint32_t v8 = readData;
    }
    else {
      uint32_t v8 = readData & 0xFFFFFFFA | 4;
    }
  }
  else
  {
    uint32_t v9 = readData & 0xFFFFFFFB;
    int v10 = *(_DWORD *)(a1 + 1096);
    if (v10 == 1) {
      uint32_t v9 = readData & 0xFFFFFFFA | 1;
    }
    if (v10 == 2) {
      uint32_t v8 = readData & 0xFFFFFFFA;
    }
    else {
      uint32_t v8 = v9;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v8);
  return 0;
}

uint64_t sub_1000056A8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
  if (!result)
  {
    __int16 v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v5);
    if (!result)
    {
      unsigned int v3 = v5;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 1);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v5);
        if (!result)
        {
          int v4 = (v3 >> 2) & 1;
          if ((v5 & 4) != 0) {
            int v4 = 2;
          }
          if (!v4) {
            goto LABEL_13;
          }
          if (*(unsigned __int8 *)(a1 + 1389) != v4)
          {
            *(unsigned char *)(a1 + 1389) = v4;
            *(unsigned char *)(a1 + 1390) = 1;
          }
          if (v4 == 1)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
            if (result) {
              return result;
            }
            sub_1000046A8(a1);
          }
          else
          {
LABEL_13:
            sub_1000046A8(a1);
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, 0);
            if (result) {
              return result;
            }
          }
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000057CC(uint64_t a1, int a2)
{
  unsigned __int16 v2 = a2;
  unsigned __int16 v4 = 0;
  __int16 v7 = 0;
  unsigned int v5 = a2 + 64;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v7);
    if (result) {
      break;
    }
    v4 += v7;
    if (v5 <= ++v2)
    {
      if (v4 == 47802) {
        return 0;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_10000584C(uint64_t a1, int a2)
{
  unsigned __int16 v2 = a2;
  __int16 v4 = 0;
  __int16 v7 = 0;
  unsigned int v5 = a2 + 63;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v7);
    if (result) {
      break;
    }
    v4 += v7;
    if (v5 <= ++v2)
    {
      __int16 v8 = -17734 - v4;
      return (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1208))(a1, (unsigned __int16)v5, 1, &v8);
    }
  }
  return result;
}

uint64_t sub_1000058E8(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = a1;
  uint64_t v4 = a1 + 352 * a2;
  uint64_t v5 = v4 + 10032;
  unsigned int v6 = *(_DWORD *)(v4 + 10160);
  uint32_t v7 = *(_DWORD *)(v4 + 10164);
  if (v7 == v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    while (1)
    {
      uint64_t v9 = *(void *)(v4 + 10296) + 16 * v6;
      char v11 = *(unsigned char *)(v9 + 8);
      uint64_t v10 = v9 + 8;
      if ((v11 & 1) == 0) {
        break;
      }
      int v12 = *(unsigned __int16 *)(v10 + 4);
      uint64_t v13 = *(void *)(*(void *)(v4 + 10336) + 8 * v6);
      *((void *)&v28 + v8) = v13;
      uint64_t v14 = (v8 + 1);
      *(_DWORD *)(v13 + 64) = v12;
      unsigned int v6 = (v6 + 1) & 0x7F;
      uint64_t v8 = v14;
      if (v7 == v6)
      {
        unsigned int v6 = v7;
        uint64_t v8 = v14;
        break;
      }
    }
    if (v8)
    {
      unsigned int v15 = 0;
      __dmb(1u);
      BOOL v16 = *(IODataQueueDispatchSource **)(v4 + 10360);
      BOOL sendDataAvailable = 0;
      do
      {
        while (1)
        {
          uint64_t v17 = *((void *)&v28 + v15);
          callback[0] = _NSConcreteStackBlock;
          callback[1] = 0x40000000;
          callback[2] = sub_100005E70;
          callback[3] = &unk_1000382B0;
          callback[4] = v17;
          if (!IODataQueueDispatchSource::EnqueueWithCoalesce(v16, 0x68u, &sendDataAvailable, callback)) {
            break;
          }
          IODataQueueDispatchSource::SendDataAvailable(v16);
          if (++v15 >= v8) {
            goto LABEL_14;
          }
        }
        ++v15;
      }
      while (v15 < v8);
      uint64_t v8 = v8 | 0x10000;
LABEL_14:
      unsigned int v2 = a2;
      uint64_t v3 = a1;
      *(_DWORD *)(v5 + 128) = v6;
    }
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  if ((((_BYTE)v6 + ~(_BYTE)v7) & 0x7F) != 0)
  {
    uint64_t v18 = *(void *)(v3 + 352 * v2 + 10368);
    unsigned int v19 = (*(uint64_t (**)(uint64_t, long long *, void))(*(void *)v18 + 104))(v18, &v28, ((_BYTE)v6 + ~(_BYTE)v7) & 0x7F);
    if (v19)
    {
      uint64_t v20 = v19;
      uint32_t v21 = (uint64_t *)&v28;
      do
      {
        uint64_t v22 = *v21++;
        char v23 = (void *)(*(void *)(v5 + 264) + 16 * v7);
        uint64_t v24 = *(void *)(v22 + 48);
        *(void *)(*(void *)(v5 + 304) + 8 * v7) = v24 + 8;
        *char v23 = *(void *)(v24 + 24);
        v23[1] = 0;
        uint32_t v7 = (v7 + 1) & 0x7F;
        --v20;
      }
      while (v20);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(v3 + 16), 0, (v2 << 8) | 0x2818, v7);
      *(_DWORD *)(v5 + 132) = v7;
    }
  }
  return v8;
}

uint64_t sub_100005BBC(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 10160);
  uint32_t v3 = *(_DWORD *)(a1 + 10164);
  if (v3 == v2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    while (1)
    {
      uint64_t v5 = *(void *)(a1 + 10296) + 16 * v2;
      if ((*(unsigned char *)(v5 + 12) & 1) == 0) {
        break;
      }
      int v6 = *(unsigned __int16 *)(v5 + 8);
      uint64_t v7 = *(void *)(*(void *)(a1 + 10336) + 8 * v2);
      *((void *)&v20 + v4) = v7;
      uint64_t v8 = (v4 + 1);
      *(_DWORD *)(v7 + 64) = v6;
      unsigned int v2 = (v2 + 1) & 0x7F;
      uint64_t v4 = v8;
      if (v3 == v2)
      {
        unsigned int v2 = v3;
        uint64_t v4 = v8;
        break;
      }
    }
    if (v4)
    {
      unsigned int v9 = 0;
      __dmb(1u);
      uint64_t v10 = *(IODataQueueDispatchSource **)(a1 + 10360);
      BOOL sendDataAvailable = 0;
      do
      {
        while (1)
        {
          uint64_t v11 = *((void *)&v20 + v9);
          callback[0] = _NSConcreteStackBlock;
          callback[1] = 0x40000000;
          callback[2] = sub_100005E70;
          callback[3] = &unk_1000382B0;
          callback[4] = v11;
          if (!IODataQueueDispatchSource::EnqueueWithCoalesce(v10, 0x68u, &sendDataAvailable, callback)) {
            break;
          }
          IODataQueueDispatchSource::SendDataAvailable(v10);
          if (++v9 >= v4) {
            goto LABEL_14;
          }
        }
        ++v9;
      }
      while (v9 < v4);
      uint64_t v4 = v4 | 0x10000;
LABEL_14:
      *(_DWORD *)(a1 + 10160) = v2;
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if ((((_BYTE)v2 + ~(_BYTE)v3) & 0x7F) != 0)
  {
    unsigned int v12 = (*(uint64_t (**)(void, long long *, void))(**(void **)(a1 + 10368) + 104))(*(void *)(a1 + 10368), &v20, ((_BYTE)v2 + ~(_BYTE)v3) & 0x7F);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = (uint64_t *)&v20;
      do
      {
        uint64_t v15 = *v14++;
        uint64_t v16 = *(void *)(a1 + 10296) + 16 * v3;
        uint64_t v17 = *(void *)(v15 + 48);
        *(void *)(*(void *)(a1 + 10336) + 8 * v3) = v17 + 8;
        *(void *)uint64_t v16 = *(void *)(v17 + 24);
        *(unsigned char *)(v16 + 12) = 0;
        uint32_t v3 = (v3 + 1) & 0x7F;
        --v13;
      }
      while (v13);
      __dmb(2u);
      if (*(int *)(a1 + 284) <= 1) {
        uint64_t v18 = 296;
      }
      else {
        uint64_t v18 = 10264;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v18, v3);
      *(_DWORD *)(a1 + 10164) = v3;
    }
  }
  return v4;
}

uint64_t sub_100005E70(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(v2 + 40);
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(v2 + 73);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(v2 + 64);
  return result;
}

uint64_t e1000_acquire_swfw_sync_i210(uint64_t a1, int a2)
{
  int v4 = 0;
  int v5 = a2 | (a2 << 16);
  while (2)
  {
    int v6 = *(unsigned __int16 *)(a1 + 1232) + 1;
    while (1)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, 2u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &readData);
      __dmb(1u);
      if (readData == -1) {
        return 4294967283;
      }
      if ((readData & 2) != 0) {
        break;
      }
      IODelay(0x32uLL);
      if (!--v6)
      {
        e1000_put_hw_semaphore_generic(a1);
        return 4294967283;
      }
    }
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &v9);
    __dmb(1u);
    if (v9 == -1) {
      return 4294967283;
    }
    if ((v9 & v5) != 0)
    {
      e1000_put_hw_semaphore_generic(a1);
      IODelay(0x1388uLL);
      if (++v4 != 200) {
        continue;
      }
      return 4294967283;
    }
    break;
  }
  uint32_t v8 = v9 | a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v8);
  return 0;
}

void e1000_release_swfw_sync_i210(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & ~a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v4);
  e1000_put_hw_semaphore_generic(a1);
}

uint64_t e1000_read_nvm_srrd_i210(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v8 = 0;
  while (!(*(unsigned int (**)(uint64_t))(a1 + 1152))(a1))
  {
    unsigned __int16 v9 = a3 - v8;
    if ((int)(a3 - v8) >= 512) {
      unsigned __int16 v9 = 512;
    }
    uint64_t nvm_eerd = e1000_read_nvm_eerd(a1, a2, v9, (_WORD *)(a4 + 2 * v8));
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
    if (nvm_eerd) {
      return nvm_eerd;
    }
    unsigned int v8 = (unsigned __int16)(v8 + 512);
    if (v8 >= a3) {
      return 0;
    }
  }
  return 13;
}

uint64_t e1000_write_nvm_srwr_i210(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v8 = 0;
  while (1)
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1152))(a1)) {
      return 13;
    }
    unsigned __int16 v9 = a3 - v8;
    if ((int)(a3 - v8) >= 512) {
      unsigned __int16 v9 = 512;
    }
    int v10 = sub_1000061AC(a1, a2, v9, a4 + 2 * v8);
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
    if (v10) {
      break;
    }
    unsigned int v8 = (unsigned __int16)(v8 + 512);
    if (v8 >= a3) {
      return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000061AC(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    uint64_t v9 = 0;
    uint64_t v11 = a3;
    do
    {
      uint32_t v12 = (4 * (v9 + a2)) | (*(unsigned __int16 *)(a4 + 2 * v9) << 16) | 1;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12018uLL, v12);
      int v13 = 100000;
      do
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12018uLL, &readData);
        __dmb(1u);
        if ((readData & 2) != 0) {
          break;
        }
        IODelay(5uLL);
        --v13;
      }
      while (v13);
      ++v9;
    }
    while (v9 != v11);
    return 0;
  }
  return result;
}

uint64_t e1000_validate_nvm_checksum_i210(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(a1 + 1152))()) {
    return 13;
  }
  uint64_t v3 = *(void *)(a1 + 1160);
  *(void *)(a1 + 1160) = e1000_read_nvm_eerd;
  uint64_t v4 = e1000_validate_nvm_checksum_generic(a1);
  *(void *)(a1 + 1160) = v3;
  (*(void (**)(uint64_t))(a1 + 1168))(a1);
  return v4;
}

uint64_t e1000_update_nvm_checksum_i210(uint64_t a1)
{
  __int16 v9 = 0;
  uint64_t v2 = e1000_read_nvm_eerd(a1, 0, 1u, &v9);
  if (!v2)
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1152))(a1))
    {
      return 13;
    }
    else
    {
      unsigned __int16 v3 = 0;
      __int16 v4 = 0;
      do
      {
        unsigned int v5 = v3;
        uint64_t v6 = e1000_read_nvm_eerd(a1, v3, 1u, &v9);
        if (v6)
        {
          uint64_t v2 = v6;
          (*(void (**)(uint64_t))(a1 + 1168))(a1);
          return v2;
        }
        v4 += v9;
        ++v3;
      }
      while (v5 < 0x3E);
      __int16 v10 = -17734 - v4;
      int v7 = sub_1000061AC(a1, 0x3Fu, 1u, (uint64_t)&v10);
      (*(void (**)(uint64_t))(a1 + 1168))(a1);
      if (v7) {
        return 0xFFFFFFFFLL;
      }
      else {
        return e1000_update_flash_i210(a1);
      }
    }
  }
  return v2;
}

uint64_t e1000_update_flash_i210(uint64_t a1)
{
  uint64_t result = sub_1000064D4(a1);
  if (result != -1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData | 0x800000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v3);
    return sub_1000064D4(a1);
  }
  return result;
}

uint64_t e1000_get_flash_presence_i210(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  return (readData >> 19) & 1;
}

uint64_t sub_1000064D4(uint64_t a1)
{
  int v2 = 20000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
    __dmb(1u);
    if ((readData & 0x4000000) != 0) {
      break;
    }
    IODelay(5uLL);
    if (!--v2) {
      return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

void *e1000_init_function_pointers_i210(void *a1)
{
  uint64_t result = e1000_init_function_pointers_82575(a1);
  a1[143] = sub_100006578;
  return result;
}

uint64_t sub_100006578(uint64_t a1)
{
  uint64_t inited = e1000_init_nvm_params_82575(a1);
  *(void *)(a1 + 1152) = sub_100006A20;
  *(void *)(a1 + 1168) = sub_100006A28;
  *(void *)(a1 + 1192) = sub_100006A30;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v3 = e1000_update_nvm_checksum_i210;
  __int16 v4 = e1000_validate_nvm_checksum_i210;
  unsigned int v5 = e1000_write_nvm_srwr_i210;
  uint64_t v6 = e1000_read_nvm_srrd_i210;
  if ((readData & 0x80000) != 0)
  {
    int v7 = 4;
  }
  else
  {
    __int16 v4 = e1000_null_ops_generic;
    unsigned int v5 = e1000_null_write_nvm;
    uint64_t v6 = sub_100006A9C;
    int v7 = 5;
    uint32_t v3 = e1000_null_ops_generic;
  }
  *(_DWORD *)(a1 + 1216) = v7;
  *(void *)(a1 + 1160) = v6;
  *(void *)(a1 + 1208) = v5;
  *(void *)(a1 + 1200) = v4;
  *(void *)(a1 + 1184) = v3;
  return inited;
}

uint64_t e1000_init_hw_i210(uint64_t a1)
{
  if (*(int *)(a1 + 284) < 34) {
    goto LABEL_11;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  if ((readData & 0x80000) != 0) {
    goto LABEL_11;
  }
  int v17 = 0;
  uint16_t v16 = 0;
  (*(void (**)(uint64_t))(a1 + 896))(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData;
  uint32_t v4 = readData & 0x7FFFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, v4);
  int v5 = sub_100006C64(a1, 10, (_WORD *)&v17 + 1);
  int v6 = HIWORD(v17);
  if (v5) {
    int v6 = 8239;
  }
  uint32_t v7 = (v6 << 16) | 0x1000A0;
  uint32_t v8 = ((unsigned __int16)v6 << 16) | 0xA0;
  int v9 = 5;
  while (1)
  {
    e1000_write_phy_reg_mdic(a1, 0x16u, 252);
    IODelay(0x14uLL);
    e1000_read_phy_reg_mdic(a1, 0xEu, &v17);
    IODelay(0x14uLL);
    e1000_write_phy_reg_mdic(a1, 0x16u, 0);
    int v10 = v17;
    if (v17 != 255) {
      break;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v11 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v11 | 0x80000000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v12 = readData | 0x140000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v12);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12024uLL, v7);
    e1000_read_pci_cfg(a1, 0x44uLL, &v16);
    v16 |= 3u;
    e1000_write_pci_cfg(a1, 0x44uLL, &v16);
    IODelay(0x3E8uLL);
    v16 &= 0xFFFCu;
    e1000_write_pci_cfg(a1, 0x44uLL, &v16);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12024uLL, v8);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, v2);
    if (!--v9)
    {
      uint64_t v13 = 4294967294;
      goto LABEL_10;
    }
  }
  uint64_t v13 = 0;
LABEL_10:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE04uLL, v3);
  (*(void (**)(uint64_t))(a1 + 1000))(a1);
  if (v10 != 255)
  {
LABEL_11:
    *(void *)(a1 + 944) = sub_1000069BC;
    (*(void (**)(uint64_t))(a1 + 48))(a1);
    return e1000_init_hw_base(a1);
  }
  return v13;
}

uint64_t sub_1000069BC(uint64_t a1)
{
  int v2 = -100;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1010uLL, &readData);
    __dmb(1u);
    if ((readData & 0x40000) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
  }
  while (!__CFADD__(v2++, 1));
  return 0;
}

uint64_t sub_100006A20(uint64_t a1)
{
  return e1000_acquire_swfw_sync_i210(a1, 1);
}

void sub_100006A28(uint64_t a1)
{
}

uint64_t sub_100006A30(uint64_t a1, __int16 *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v5 = (unsigned __int16)*a2;
    if (v5 == 0xFFFF || v5 == 0)
    {
      if (*(_DWORD *)(a1 + 1116) == 3) {
        __int16 v7 = 280;
      }
      else {
        __int16 v7 = 2073;
      }
      *a2 = v7;
    }
  }
  return result;
}

uint64_t sub_100006A9C(uint64_t a1, int a2, uint64_t a3, __int16 *a4)
{
  int v6 = (__int16 *)(a1 + 9584);
  switch(a2)
  {
    case 0:
      int v7 = sub_100006C64(a1, 0, a4);
      int v8 = sub_100006C64(a1, 1, a4 + 1) | v7;
      return v8 | sub_100006C64(a1, 2, a4 + 2);
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 16:
    case 17:
    case 18:
      goto LABEL_8;
    case 4:
      uint64_t result = sub_100006C64(a1, 4, a4);
      if (result) {
        goto LABEL_8;
      }
      return result;
    case 11:
      uint64_t result = 0;
      __int16 v10 = v6[2];
      goto LABEL_19;
    case 12:
      uint64_t result = 0;
      __int16 v10 = v6[1];
      goto LABEL_19;
    case 13:
      uint64_t result = 0;
      __int16 v10 = *v6;
      goto LABEL_19;
    case 14:
      uint64_t result = 0;
      __int16 v10 = v6[3];
      goto LABEL_19;
    case 15:
      uint64_t result = sub_100006C64(a1, 15, a4);
      if (!result) {
        return result;
      }
      uint64_t result = 0;
      __int16 v10 = 29251;
      goto LABEL_19;
    case 19:
      uint64_t result = sub_100006C64(a1, 19, a4);
      if (!result) {
        return result;
      }
      uint64_t result = 0;
      __int16 v10 = 193;
      goto LABEL_19;
    default:
      if (a2 == 28)
      {
        uint64_t result = sub_100006C64(a1, 28, a4);
        if (!result) {
          return result;
        }
        uint64_t result = 0;
        __int16 v10 = 388;
      }
      else if (a2 == 31)
      {
        uint64_t result = sub_100006C64(a1, 31, a4);
        if (!result) {
          return result;
        }
        uint64_t result = 0;
        __int16 v10 = 8204;
      }
      else
      {
LABEL_8:
        uint64_t result = 0;
        __int16 v10 = -1;
      }
LABEL_19:
      *a4 = v10;
      return result;
  }
}

uint64_t sub_100006C64(uint64_t a1, int a2, _WORD *a3)
{
  int v6 = 0;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 4 * (v6 & 0x3FFF) + 74016, &readData);
    __dmb(1u);
    uint32_t v7 = readData & 7;
    if (v7 == 2)
    {
      int v8 = v6 + 1;
    }
    else
    {
      if ((readData & 7) == 0) {
        return 4294967276;
      }
      int v8 = v6 + 8;
      if (v7 != 4) {
        int v8 = v6;
      }
      if (v7 == 1 && (unsigned __int16)readData >> 9 == a2)
      {
        uint64_t result = 0;
        *a3 = HIWORD(readData);
        return result;
      }
    }
    int v6 = v8 + 1;
  }
  while ((unsigned __int16)v8 < 0x3Fu);
  return 4294967276;
}

void sub_100006D2C(uint64_t a1)
{
  int v28 = 0;
  __int16 v27 = 0;
  __int16 v26 = 0;
  int v25 = 0;
  uint32_t v16 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v16);
  __dmb(1u);
  char v2 = v16;
  if (v16 != -1)
  {
    if (!*(unsigned char *)(a1 + 10384)) {
      return;
    }
    if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = 136315394;
      int v17 = "updateCarrier";
      __int16 v18 = 1024;
      int v19 = 97;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v16, 0x12u);
    }
    *(unsigned char *)(a1 + 10384) = 0;
    if ((v2 & 2) == 0)
    {
      (*(void (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 9600) + 128))(*(void *)(a1 + 9600), 1, 34);
      (*(void (**)(void, uint64_t))(**(void **)(a1 + 9600) + 136))(*(void *)(a1 + 9600), 4294967294);
      if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v16 = 136315394;
        int v17 = "updateCarrier";
        __int16 v18 = 1024;
        int v19 = 152;
        uint32_t v3 = "e1000::%s(%d): ==>(down)\n";
LABEL_73:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v16, 0x12u);
        return;
      }
      return;
    }
    e1000_read_phy_reg(a1);
    e1000_read_phy_reg(a1);
    e1000_read_phy_reg(a1);
    e1000_read_phy_reg(a1);
    e1000_read_phy_reg(a1);
    e1000_read_phy_reg(a1);
    if ((~HIWORD(v25) & 0x300) != 0)
    {
      if ((v25 & 0x1000000) != 0)
      {
        if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v16 = 136315394;
          int v17 = "updateCarrier";
          __int16 v18 = 1024;
          int v19 = 127;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): - kLinkUpFlow_PauseRxOnly\n", (uint8_t *)&v16, 0x12u);
        }
        int v4 = 1;
      }
      else
      {
        if ((v25 & 0x2000000) == 0)
        {
          if ((dword_10003C000 & 4) != 0)
          {
            BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            int v4 = 0;
            if (!v15) {
              goto LABEL_22;
            }
            uint32_t v16 = 136315394;
            int v17 = "updateCarrier";
            __int16 v18 = 1024;
            int v19 = 133;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): - kLinkUpFlow_None\n", (uint8_t *)&v16, 0x12u);
          }
          int v4 = 0;
          goto LABEL_22;
        }
        if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v16 = 136315394;
          int v17 = "updateCarrier";
          __int16 v18 = 1024;
          int v19 = 130;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): - kLinkUpFlow_PauseTxOnly\n", (uint8_t *)&v16, 0x12u);
        }
        int v4 = 2;
      }
    }
    else
    {
      if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v16 = 136315394;
        int v17 = "updateCarrier";
        __int16 v18 = 1024;
        int v19 = 124;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): - kLinkUpFlow_Symmetric\n", (uint8_t *)&v16, 0x12u);
      }
      int v4 = 3;
    }
LABEL_22:
    *(_DWORD *)(a1 + 880) = v4;
    int v5 = *(_DWORD *)(a1 + 284);
    if (v5 >= 29)
    {
      if (v5 == 36)
      {
        e1000_set_eee_i225(a1, 1, 1, 1);
      }
      else if (v5 == 33)
      {
        e1000_set_eee_i354(a1, 1, 1);
      }
      else
      {
        e1000_set_eee_i350(a1, 1, 1);
      }
    }
    int v24 = 0;
    int speed_and_duplex = e1000_get_speed_and_duplex(a1);
    if ((dword_10003C000 & 4) != 0)
    {
      int v13 = speed_and_duplex;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v16 = 136315650;
        int v17 = "updateCarrier";
        __int16 v18 = 1024;
        int v19 = 160;
        __int16 v20 = 1024;
        int v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_get_speed_and_duplex returned %d\n", (uint8_t *)&v16, 0x18u);
      }
    }
    if (*(_DWORD *)(a1 + 884) == 3 && *(_DWORD *)(a1 + 880) != 3)
    {
      if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v16 = 136315394;
        int v17 = "updateCarrier";
        __int16 v18 = 1024;
        int v19 = 163;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Forcing Flow Control\n", (uint8_t *)&v16, 0x12u);
      }
      *(_DWORD *)(a1 + 880) = 3;
      int v7 = e1000_force_mac_fc(a1);
      if (v7)
      {
        if ((dword_10003C000 & 4) != 0)
        {
          int v14 = v7;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            uint32_t v16 = 136315650;
            int v17 = "updateCarrier";
            __int16 v18 = 1024;
            int v19 = 166;
            __int16 v20 = 1024;
            int v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_force_mac_fc returned %d\n", (uint8_t *)&v16, 0x18u);
          }
        }
      }
    }
    if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = 136315906;
      int v17 = "updateCarrier";
      __int16 v18 = 1024;
      int v19 = 170;
      __int16 v20 = 1024;
      int v21 = HIWORD(v24);
      __int16 v22 = 1024;
      LODWORD(v23) = (unsigned __int16)v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): speed=%u ; duplex=0x%08x\n",
        (uint8_t *)&v16,
        0x1Eu);
    }
    uint64_t v8 = 0;
    if ((unsigned __int16)v24 == 2) {
      unsigned int v9 = 1048608;
    }
    else {
      unsigned int v9 = 2097184;
    }
    if (*(_DWORD *)(a1 + 880)) {
      uint64_t v10 = v9 | 0x400000;
    }
    else {
      uint64_t v10 = v9;
    }
    if (HIWORD(v24) > 0x3E7u)
    {
      if (HIWORD(v24) == 1000)
      {
        uint64_t v10 = v10 | 0x10;
        uint64_t v8 = 1000000000;
      }
      else if (HIWORD(v24) == 2500)
      {
        uint64_t v10 = v10 | 0x16;
        uint64_t v8 = 2500000000;
      }
    }
    else if (HIWORD(v24) == 10)
    {
      uint64_t v10 = v10 | 3;
      uint64_t v8 = 10000000;
    }
    else if (HIWORD(v24) == 100)
    {
      uint64_t v10 = v10 | 6;
      uint64_t v8 = 100000000;
    }
    int v11 = *(_DWORD *)(a1 + 284);
    if (v11 == 36)
    {
      if (*(unsigned char *)(a1 + 1377)) {
        goto LABEL_60;
      }
    }
    else if (v11 < 29 || *(unsigned char *)(a1 + 1378))
    {
      goto LABEL_60;
    }
    int v12 = 10;
    while (1)
    {
      uint32_t v16 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, &v16);
      __dmb(1u);
      if (v16 >> 29) {
        break;
      }
      IODelay(0x64uLL);
      if (!--v12) {
        goto LABEL_60;
      }
    }
    uint64_t v10 = v10 | 0x800000;
LABEL_60:
    if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = 136315906;
      int v17 = "updateCarrier";
      __int16 v18 = 1024;
      int v19 = 218;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): setting Link mode=0%08x, baud=%lld\n", (uint8_t *)&v16, 0x22u);
    }
    (*(void (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 9600) + 128))(*(void *)(a1 + 9600), 3, v10);
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 9600) + 136))(*(void *)(a1 + 9600), 100);
    if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = 136315394;
      int v17 = "updateCarrier";
      __int16 v18 = 1024;
      int v19 = 223;
      uint32_t v3 = "e1000::%s(%d): ==>\n";
      goto LABEL_73;
    }
    return;
  }
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v16 = 136315394;
    int v17 = "updateCarrier";
    __int16 v18 = 1024;
    int v19 = 91;
    uint32_t v3 = "e1000::%s(%d): Hot un-plug detected\n";
    goto LABEL_73;
  }
}

uint64_t sub_100007660(uint64_t a1, int *a2, _DWORD *a3)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "getSupportedMediaArray";
    __int16 v12 = 1024;
    int v13 = 228;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v10, 0x12u);
  }
  if (*(_DWORD *)(a1 + 284) == 36) {
    LODWORD(v6) = 18;
  }
  else {
    LODWORD(v6) = 14;
  }
  if (*a3 >= v6) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = *a3;
  }
  *a3 = v6;
  if (v6)
  {
    int v7 = &dword_100033E58;
    do
    {
      int v8 = *v7;
      v7 += 4;
      *a2++ = v8;
      --v6;
    }
    while (v6);
  }
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "getSupportedMediaArray";
    __int16 v12 = 1024;
    int v13 = 236;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>\n", (uint8_t *)&v10, 0x12u);
  }
  return 0;
}

void sub_1000077C0(uint64_t a1, int a2)
{
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    __int16 v12 = "selMed";
    __int16 v13 = 1024;
    int v14 = 247;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== for type=0%08x\n", (uint8_t *)&v11, 0x18u);
  }
  *(unsigned char *)(a1 + 851) = 1;
  *(_DWORD *)(a1 + 884) = 0;
  int v4 = *(_DWORD *)(a1 + 284);
  if (v4 == 36)
  {
    *(unsigned char *)(a1 + 1377) = 1;
  }
  else if (v4 >= 29)
  {
    *(unsigned char *)(a1 + 1378) = 1;
  }
  if (a2 <= 5242933)
  {
    if (a2 > 2097186)
    {
      if (a2 > 5242914)
      {
        switch(a2)
        {
          case 5242915:
            __int16 v9 = 2;
            break;
          case 5242918:
            __int16 v9 = 8;
            break;
          case 5242928:
            __int16 v7 = 32;
LABEL_68:
            *(_WORD *)(a1 + 1120) = v7;
            *(unsigned char *)(a1 + 846) = v7;
            goto LABEL_69;
          default:
            goto LABEL_74;
        }
        *(unsigned char *)(a1 + 846) = v9;
        *(_WORD *)(a1 + 1120) = v9;
LABEL_69:
        *(_DWORD *)(a1 + 884) = 3;
        goto LABEL_72;
      }
      if (a2 == 2097187)
      {
        __int16 v8 = 1;
      }
      else
      {
        if (a2 != 2097190) {
          goto LABEL_74;
        }
        __int16 v8 = 4;
      }
    }
    else if (a2 <= 1048613)
    {
      if (a2 == 32)
      {
        *(unsigned char *)(a1 + 846) = 8;
        if (v4 == 36) {
          __int16 v10 = 175;
        }
        else {
          __int16 v10 = 47;
        }
        *(_WORD *)(a1 + 1120) = v10;
        *(_DWORD *)(a1 + 884) = 3;
        if (v4 < 29 || v4 == 36) {
          goto LABEL_72;
        }
        goto LABEL_66;
      }
      if (a2 != 1048611) {
        goto LABEL_74;
      }
      __int16 v8 = 2;
    }
    else
    {
      if (a2 != 1048614)
      {
        if (a2 == 1048624)
        {
          __int16 v6 = 32;
        }
        else
        {
          if (a2 != 1048630) {
            goto LABEL_74;
          }
          __int16 v6 = 128;
        }
        *(_WORD *)(a1 + 1120) = v6;
        goto LABEL_60;
      }
      __int16 v8 = 8;
    }
    *(unsigned char *)(a1 + 846) = v8;
    *(_WORD *)(a1 + 1120) = v8;
    goto LABEL_72;
  }
  if (a2 > 13631535)
  {
    if (a2 <= 134217765)
    {
      if (a2 != 13631536)
      {
        if (a2 != 13631542)
        {
          if (a2 == 134217763)
          {
            *(unsigned char *)(a1 + 851) = 0;
            char v5 = 2;
LABEL_58:
            *(unsigned char *)(a1 + 846) = v5;
            *(_WORD *)(a1 + 1120) = 0;
            goto LABEL_72;
          }
          goto LABEL_74;
        }
        *(_WORD *)(a1 + 1120) = 128;
        *(unsigned char *)(a1 + 846) = 0x80;
        *(_DWORD *)(a1 + 884) = 3;
LABEL_53:
        *(unsigned char *)(a1 + 1377) = 0;
        goto LABEL_72;
      }
      *(_WORD *)(a1 + 1120) = 32;
      *(unsigned char *)(a1 + 846) = 32;
      goto LABEL_43;
    }
    if (a2 == 134217766)
    {
      *(unsigned char *)(a1 + 851) = 0;
      char v5 = 8;
      goto LABEL_58;
    }
    if (a2 != 134217776)
    {
      if (a2 == 134217782)
      {
        *(unsigned char *)(a1 + 851) = 0;
        *(unsigned char *)(a1 + 846) = 0x80;
        *(_DWORD *)(a1 + 884) = 0;
        goto LABEL_72;
      }
      goto LABEL_74;
    }
    *(unsigned char *)(a1 + 851) = 0;
    LOBYTE(v6) = 32;
LABEL_60:
    *(unsigned char *)(a1 + 846) = v6;
    goto LABEL_72;
  }
  if (a2 <= 9437231)
  {
    if (a2 != 5242934)
    {
      if (a2 == 9437222)
      {
        *(unsigned char *)(a1 + 846) = 8;
        *(_WORD *)(a1 + 1120) = 8;
LABEL_49:
        if (v4 == 36) {
          goto LABEL_53;
        }
        if (v4 < 29) {
          goto LABEL_72;
        }
LABEL_66:
        *(unsigned char *)(a1 + 1378) = 0;
        goto LABEL_72;
      }
      goto LABEL_74;
    }
    __int16 v7 = 128;
    goto LABEL_68;
  }
  switch(a2)
  {
    case 9437232:
      *(_WORD *)(a1 + 1120) = 32;
      *(unsigned char *)(a1 + 846) = 32;
      goto LABEL_49;
    case 9437238:
      *(_WORD *)(a1 + 1120) = 128;
      *(unsigned char *)(a1 + 846) = 0x80;
      goto LABEL_53;
    case 13631526:
      *(unsigned char *)(a1 + 846) = 8;
      *(_WORD *)(a1 + 1120) = 8;
LABEL_43:
      *(_DWORD *)(a1 + 884) = 3;
      goto LABEL_49;
  }
LABEL_74:
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    __int16 v12 = "selMed";
    __int16 v13 = 1024;
    int v14 = 400;
    __int16 v15 = 1024;
    int v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Uknown medium type=0%08x", (uint8_t *)&v11, 0x18u);
  }
LABEL_72:
  *(unsigned char *)(a1 + 1136) = 1;
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "selMed";
    __int16 v13 = 1024;
    int v14 = 426;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>\n", (uint8_t *)&v11, 0x12u);
  }
}

uint64_t sub_100007CB8(uint64_t a1, int a2)
{
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    __int16 v8 = "handleChosenMedia";
    __int16 v9 = 1024;
    int v10 = 432;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== (%x)\n", (uint8_t *)&v7, 0x18u);
  }
  sub_1000077C0(a1, a2);
  int v4 = e1000_setup_link(a1);
  if (v4)
  {
    if ((dword_10003C000 & 4) != 0)
    {
      int v6 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        __int16 v8 = "handleChosenMedia";
        __int16 v9 = 1024;
        int v10 = 465;
        __int16 v11 = 1024;
        int v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_setup_link returned %d\n", (uint8_t *)&v7, 0x18u);
      }
    }
  }
  *(unsigned char *)(a1 + 10384) = 1;
  sub_100006D2C(a1);
  if ((dword_10003C000 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "handleChosenMedia";
    __int16 v9 = 1024;
    int v10 = 476;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>\n", (uint8_t *)&v7, 0x12u);
  }
  return 0;
}

uint64_t sub_100007E84(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + 352 * a2;
  unsigned int v3 = *(_DWORD *)(v2 + 9808);
  if (v3 == atomic_load_explicit((atomic_uint *volatile)(v2 + 9812), memory_order_acquire)) {
    return 0;
  }
  uint64_t v4 = v2 + 9680;
  int v5 = *(_DWORD *)(a1 + 284);
  if (v5 < 29)
  {
    LODWORD(v13[0]) = 0;
    int v7 = *(IOPCIDevice **)(a1 + 16);
    if (v5 <= 1) {
      uint64_t v8 = 1072;
    }
    else {
      uint64_t v8 = 14352;
    }
    IOPCIDevice::MemoryRead32(v7, 0, v8, (uint32_t *)v13);
    __dmb(1u);
    int v6 = v13[0];
    if (LODWORD(v13[0]) == -1) {
      return 0;
    }
  }
  else
  {
    int v6 = *(_DWORD *)(*(void *)(v4 + 264) + 2048);
  }
  if (v3 == v6) {
    return 0;
  }
  uint64_t v9 = 0;
  do
  {
    uint64_t v11 = *(void *)(*(void *)(v4 + 304) + 8 * v3);
    if (v11)
    {
      int v12 = *(IODataQueueDispatchSource **)(v4 + 328);
      LODWORD(v9) = v9 + 1;
      BOOL sendDataAvailable = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 0x40000000;
      v13[2] = sub_100008214;
      v13[3] = &unk_1000382D0;
      v13[4] = v11;
      if (IODataQueueDispatchSource::EnqueueWithCoalesce(v12, 0x68u, &sendDataAvailable, v13))
      {
        IODataQueueDispatchSource::SendDataAvailable(v12);
        uint64_t v9 = (unsigned __int16)v9;
      }
      else
      {
        uint64_t v9 = v9 | 0x10000;
      }
    }
    unsigned int v3 = (v3 + 1) & 0x7F;
  }
  while (v3 != v6);
  *(_DWORD *)(v4 + 128) = v6;
  if (v9 >= 0x10000) {
    IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(v4 + 328));
  }
  return v9;
}

void sub_100008014(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + 352 * a2;
  unsigned int v3 = *(_DWORD *)(v2 + 9812);
  memset(v27, 0, 512);
  int v4 = *(_DWORD *)(v2 + 9808) + ~v3;
  if ((v4 & 0x7F) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 352 * a2 + 10016);
    unsigned int v8 = (*(uint64_t (**)(uint64_t, _OWORD *, void))(*(void *)v7 + 104))(v7, v27, v4 & 0x7F);
    if (v8)
    {
      uint64_t v9 = v8 - 1;
      uint64_t v10 = v8;
      if (*(int *)(a1 + 284) <= 28)
      {
        __int16 v20 = (uint64_t *)v27;
        do
        {
          uint64_t v21 = *v20++;
          uint64_t v22 = *(void *)(v21 + 48);
          *(void *)(*(void *)(v2 + 9984) + 8 * v3) = v22 + 8;
          int v23 = *(_DWORD *)(v22 + 72);
          uint64_t v24 = *(void *)(v22 + 24) + *(unsigned int *)(v22 + 76);
          if (v9) {
            int v25 = 50331648;
          }
          else {
            int v25 = 184549376;
          }
          uint64_t v26 = *(void *)(v2 + 9944) + 16 * v3;
          *(void *)uint64_t v26 = v24;
          *(_DWORD *)(v26 + 8) = v23 | v25;
          *(_DWORD *)(v26 + 12) = 0;
          unsigned int v3 = (v3 + 1) & 0x7F;
          --v9;
          --v10;
        }
        while (v10);
        atomic_store(v3, (unsigned int *)(v2 + 9812));
        __dmb(2u);
        __int16 v18 = *(IOPCIDevice **)(a1 + 16);
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v19 = 1080;
        }
        else {
          uint64_t v19 = 14360;
        }
      }
      else
      {
        uint64_t v11 = (uint64_t *)v27;
        do
        {
          uint64_t v12 = *v11++;
          uint64_t v13 = *(void *)(v12 + 48);
          *(void *)(*(void *)(v2 + 9984) + 8 * v3) = v13 + 8;
          int v14 = *(_DWORD *)(v13 + 72);
          uint64_t v15 = *(void *)(v13 + 24) + *(unsigned int *)(v13 + 76);
          if (v9) {
            int v16 = 590348288;
          }
          else {
            int v16 = 724566016;
          }
          uint64_t v17 = *(void *)(v2 + 9944) + 16 * v3;
          *(void *)uint64_t v17 = v15;
          *(_DWORD *)(v17 + 8) = v14 | v16;
          *(_DWORD *)(v17 + 12) = v14 << 14;
          unsigned int v3 = (v3 + 1) & 0x7F;
          --v9;
          --v10;
        }
        while (v10);
        atomic_store(v3, (unsigned int *)(v2 + 9812));
        __dmb(2u);
        __int16 v18 = *(IOPCIDevice **)(a1 + 16);
        uint64_t v19 = (a2 << 8) | 0x3818;
      }
      IOPCIDevice::MemoryWrite32(v18, 0, v19, v3);
    }
  }
}

uint64_t sub_100008214(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

void *e1000_init_nvm_ops_generic(void *result)
{
  result[143] = e1000_null_ops_generic;
  result[144] = e1000_null_ops_generic;
  result[145] = e1000_null_read_nvm;
  result[146] = e1000_null_nvm_generic;
  result[147] = sub_1000082BC;
  result[148] = e1000_null_ops_generic;
  result[149] = e1000_null_led_default;
  result[150] = e1000_null_ops_generic;
  result[151] = e1000_null_write_nvm;
  return result;
}

uint64_t e1000_null_read_nvm()
{
  return 0;
}

void sub_1000082BC(uint64_t a1)
{
  IODelay(0xAuLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x2000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v3);
  __dmb(1u);
}

uint64_t e1000_null_led_default()
{
  return 0;
}

uint64_t e1000_null_write_nvm()
{
  return 0;
}

uint64_t e1000_poll_eerd_eewr_done(uint64_t a1, int a2)
{
  int v4 = 100000;
  while (a2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x102CuLL, &readData);
    __dmb(1u);
    if ((readData & 2) != 0) {
      return 0;
    }
LABEL_6:
    IODelay(5uLL);
    if (!--v4) {
      return 0xFFFFFFFFLL;
    }
  }
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x14uLL, &v7);
  __dmb(1u);
  if ((v7 & 2) == 0) {
    goto LABEL_6;
  }
  return 0;
}

uint64_t e1000_acquire_nvm_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 | 0x40);
  uint32_t v8 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v8);
  uint64_t result = 0;
  __dmb(1u);
  if ((v8 & 0x80) == 0)
  {
    int v4 = -999;
    do
    {
      int v5 = v4;
      IODelay(5uLL);
      uint32_t v7 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v7);
      __dmb(1u);
      uint32_t v6 = v7;
      if (!v5) {
        break;
      }
      int v4 = v5 + 1;
    }
    while ((v7 & 0x80) == 0);
    if (v5)
    {
      return 0;
    }
    else
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v6 & 0xFFFFFFBF);
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void e1000_stop_nvm(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  int v2 = *(_DWORD *)(a1 + 1216);
  if (v2 == 3)
  {
    uint32_t v3 = readData & 0xFFFFFFF9;
    uint32_t v5 = readData & 0xFFFFFFF9;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v3);
    sub_1000085F0(a1, &v5);
  }
  else
  {
    if (v2 != 2) {
      return;
    }
    uint32_t v5 = readData | 2;
  }
  sub_100008580(a1, &v5);
}

void sub_100008580(uint64_t a1, uint32_t *a2)
{
  *a2 &= ~1u;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(*(unsigned __int16 *)(a1 + 1234));
}

void sub_1000085F0(uint64_t a1, uint32_t *a2)
{
  *a2 |= 1u;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(*(unsigned __int16 *)(a1 + 1234));
}

void e1000_release_nvm_generic(uint64_t a1)
{
  e1000_stop_nvm(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFBF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2);
}

uint64_t e1000_read_nvm_spi(uint64_t a1, unsigned int a2, signed int a3, _WORD *a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  signed int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  LODWORD(v7) = a3;
  uint64_t v13 = 0xFFFFFFFFLL;
  if (a3)
  {
    if (v6 >= a3)
    {
      uint64_t v13 = (*(uint64_t (**)(void))(a1 + 1152))();
      if (!v13)
      {
        uint64_t v13 = sub_1000087BC(a1);
        if (!v13)
        {
          sub_1000088DC(a1);
          if (*(_WORD *)(a1 + 1236) == 8 && a2 > 0x7F) {
            int v12 = 11;
          }
          else {
            int v12 = 3;
          }
          sub_100008A50(a1, v12, *(_WORD *)(a1 + 1238));
          sub_100008A50(a1, 2 * (a2 & 0x7FFF), *(_WORD *)(a1 + 1236));
          uint64_t v7 = v7;
          do
          {
            *a4++ = __rev16(sub_100008B6C(a1, 16));
            --v7;
          }
          while (v7);
        }
        (*(void (**)(uint64_t))(a1 + 1168))(a1);
      }
    }
  }
  return v13;
}

uint64_t sub_1000087BC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  int v3 = *(_DWORD *)(a1 + 1216);
  if (v3 == 2)
  {
    uint32_t v6 = readData & 0xFFFFFFFC;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v6);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v8);
    __dmb(1u);
    IODelay(1uLL);
    int v7 = 5000;
    while (1)
    {
      sub_100008A50(a1, 5, *(_WORD *)(a1 + 1238));
      if ((sub_100008B6C(a1, 8) & 1) == 0) {
        break;
      }
      IODelay(5uLL);
      sub_1000088DC(a1);
      if (!(_WORD)--v7) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  else
  {
    uint64_t result = 0;
    if (v3 != 3) {
      return result;
    }
    uint32_t v5 = readData & 0xFFFFFFFA;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 & 0xFFFFFFFA);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v5 | 2);
  }
  return 0;
}

void sub_1000088DC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  int v3 = *(_DWORD *)(a1 + 1216);
  if (v3 == 2)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 | 2);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(*(unsigned __int16 *)(a1 + 1234));
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 & 0xFFFFFFFD);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(*(unsigned __int16 *)(a1 + 1234));
  }
  else if (v3 == 3)
  {
    readData &= 0xFFFFFFFC;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 & 0xFFFFFFFC);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v5);
    __dmb(1u);
    IODelay(*(unsigned __int16 *)(a1 + 1234));
    sub_1000085F0(a1, &readData);
    uint32_t v4 = readData | 2;
    readData |= 2u;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v4);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v5);
    __dmb(1u);
    IODelay(*(unsigned __int16 *)(a1 + 1234));
    sub_100008580(a1, &readData);
  }
}

void sub_100008A50(uint64_t a1, int a2, char a3)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v14 = readData;
  unsigned int v6 = 1 << (a3 - 1);
  int v7 = *(_DWORD *)(a1 + 1216);
  if (v7 == 2)
  {
    uint32_t v8 = readData | 8;
  }
  else
  {
    if (v7 != 3) {
      goto LABEL_6;
    }
    uint32_t v8 = readData & 0xFFFFFFF7;
  }
  uint32_t v14 = v8;
  do
  {
LABEL_6:
    uint32_t v9 = v14 & 0xFFFFFFFB | (4 * ((v6 & a2) != 0));
    uint32_t v14 = v9;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v9);
    uint32_t v12 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v12);
    __dmb(1u);
    IODelay(*(unsigned __int16 *)(a1 + 1234));
    sub_1000085F0(a1, &v14);
    sub_100008580(a1, &v14);
    BOOL v10 = v6 > 1;
    v6 >>= 1;
  }
  while (v10);
  uint32_t v11 = v14 & 0xFFFFFFFB;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v11);
}

uint64_t sub_100008B6C(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData & 0xFFFFFFF3;
  for (uint32_t i = 0; a2; --a2)
  {
    sub_1000085F0(a1, &v8);
    uint32_t v6 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v6);
    __dmb(1u);
    uint32_t v8 = v6 & 0xFFFFFFFB;
    uint32_t i = (2 * i) | (v6 >> 3) & 1;
    sub_100008580(a1, &v8);
  }
  return (unsigned __int16)i;
}

uint64_t e1000_read_nvm_microwire(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = 0xFFFFFFFFLL;
  if (a3)
  {
    if (v6 >= a3)
    {
      __int16 v9 = a2;
      uint64_t v12 = (*(uint64_t (**)(void))(a1 + 1152))();
      if (!v12)
      {
        uint64_t v12 = sub_1000087BC(a1);
        if (!v12)
        {
          uint64_t v11 = 0;
          do
          {
            sub_100008A50(a1, 6, *(_WORD *)(a1 + 1238));
            sub_100008A50(a1, (unsigned __int16)(v11 + v9), *(_WORD *)(a1 + 1236));
            *(_WORD *)(a4 + 2 * v11) = sub_100008B6C(a1, 16);
            sub_1000088DC(a1);
            ++v11;
          }
          while (a3 != v11);
        }
        (*(void (**)(uint64_t))(a1 + 1168))(a1);
      }
    }
  }
  return v12;
}

uint64_t e1000_read_nvm_eerd(uint64_t a1, unsigned int a2, unsigned int a3, _WORD *a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    uint64_t v10 = a3;
    for (uint32_t i = (4 * a2) | 1; ; i += 4)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x14uLL, i);
      if (e1000_poll_eerd_eewr_done(a1, 0)) {
        break;
      }
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x14uLL, &readData);
      __dmb(1u);
      *a4++ = HIWORD(readData);
      if (!--v10) {
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t e1000_write_nvm_spi(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  signed int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    unsigned __int16 v12 = 0;
    unsigned int v13 = a2 + 1;
    while (1)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1152))(a1);
      if (result) {
        break;
      }
      if (sub_1000087BC(a1))
      {
        (*(void (**)(uint64_t))(a1 + 1168))(a1);
        return 0xFFFFFFFFLL;
      }
      sub_1000088DC(a1);
      sub_100008A50(a1, 6, *(_WORD *)(a1 + 1238));
      sub_1000088DC(a1);
      if (*(_WORD *)(a1 + 1236) == 8 && a2 > 0x7F) {
        int v15 = 10;
      }
      else {
        int v15 = 2;
      }
      sub_100008A50(a1, v15, *(_WORD *)(a1 + 1238));
      sub_100008A50(a1, 2 * ((v12 + (_WORD)a2) & 0x7FFF), *(_WORD *)(a1 + 1236));
      uint64_t v16 = v12;
      if (v12 <= a3) {
        uint64_t v17 = a3;
      }
      else {
        uint64_t v17 = v12;
      }
      unsigned int v18 = 2 * (v13 + v12);
      while (v17 != v16)
      {
        sub_100008A50(a1, bswap32(*(unsigned __int16 *)(a4 + 2 * v16++)) >> 16, 16);
        unsigned int v19 = v18 % *(unsigned __int16 *)(a1 + 1240);
        v18 += 2;
        if (!v19)
        {
          sub_1000088DC(a1);
          LOWORD(v17) = v16;
          break;
        }
      }
      IODelay(0x2710uLL);
      (*(void (**)(uint64_t))(a1 + 1168))(a1);
      unsigned __int16 v12 = v17;
      if (a3 <= (unsigned __int16)v17) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t e1000_write_nvm_microwire(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0xFFFFFFFFLL;
  if (a3)
  {
    if (v6 >= a3)
    {
      __int16 v9 = a2;
      uint64_t v11 = (*(uint64_t (**)(void))(a1 + 1152))();
      if (!v11)
      {
        if (sub_1000087BC(a1))
        {
LABEL_7:
          uint64_t v11 = 0xFFFFFFFFLL;
        }
        else
        {
          sub_100008A50(a1, 19, *(unsigned char *)(a1 + 1238) + 2);
          sub_100008A50(a1, 0, *(unsigned char *)(a1 + 1236) - 2);
          sub_1000088DC(a1);
          uint64_t v13 = 0;
          do
          {
            sub_100008A50(a1, 5, *(_WORD *)(a1 + 1238));
            sub_100008A50(a1, (unsigned __int16)(v13 + v9), *(_WORD *)(a1 + 1236));
            sub_100008A50(a1, *(unsigned __int16 *)(a4 + 2 * v13), 16);
            sub_1000088DC(a1);
            unsigned int v14 = 0;
            while (1)
            {
              uint32_t readData = 0;
              IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
              __dmb(1u);
              if ((readData & 8) != 0) {
                break;
              }
              IODelay(0x32uLL);
              BOOL v5 = v14++ >= 0xC7;
              if (v5) {
                goto LABEL_7;
              }
            }
            sub_1000088DC(a1);
            ++v13;
          }
          while (v13 != a3);
          sub_100008A50(a1, 16, *(unsigned char *)(a1 + 1238) + 2);
          sub_100008A50(a1, 0, *(unsigned char *)(a1 + 1236) - 2);
          uint64_t v11 = 0;
        }
        (*(void (**)(uint64_t))(a1 + 1168))(a1);
      }
    }
  }
  return v11;
}

uint64_t e1000_read_pba_string_generic(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((*(_DWORD *)(a1 + 284) & 0xFFFFFFFE) == 0x22 && !e1000_get_flash_presence_i210(a1)) {
    return 4294967278;
  }
  if (!a2) {
    return 4294967280;
  }
  int v15 = 0;
  unsigned __int16 v14 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1160))(a1, 8, 1, (char *)&v15 + 2);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1160))(a1, 9, 1, &v15);
    if (!result)
    {
      __int16 v7 = HIWORD(v15);
      if (HIWORD(v15) == 64250)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, (unsigned __int16)v15, 1, &v14);
        if (!result)
        {
          if ((unsigned __int16)(v14 + 1) < 2u) {
            return 4294967278;
          }
          if (2 * v14 - 1 <= a3)
          {
            LOWORD(v15) = v15 + 1;
            if (--v14)
            {
              uint64_t v12 = 0;
              unsigned int v13 = 0;
              while (1)
              {
                uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(a1 + 1160))(a1, (unsigned __int16)(v15 + v13), 1, (char *)&v15 + 2);
                if (result) {
                  break;
                }
                *(_WORD *)(a2 + v12) = bswap32(HIWORD(v15)) >> 16;
                ++v13;
                v12 += 2;
                if (v13 >= v14) {
                  goto LABEL_30;
                }
              }
            }
            else
            {
              uint64_t v12 = 0;
LABEL_30:
              uint64_t result = 0;
              *(unsigned char *)(a2 + v12) = 0;
            }
          }
          else
          {
            return 4294967279;
          }
        }
        return result;
      }
      if (a3 < 0xB) {
        return 17;
      }
      uint64_t v8 = 0;
      *(unsigned char *)a2 = HIWORD(v15) >> 12;
      *(unsigned char *)(a2 + 1) = HIBYTE(v7) & 0xF;
      *(unsigned char *)(a2 + 2) = v7 >> 4;
      *(unsigned char *)(a2 + 3) = v7 & 0xF;
      __int16 v9 = v15;
      *(unsigned char *)(a2 + 4) = (unsigned __int16)v15 >> 12;
      *(unsigned char *)(a2 + 5) = HIBYTE(v9) & 0xF;
      *(_WORD *)(a2 + 6) = 45;
      *(unsigned char *)(a2 + 8) = v9 >> 4;
      *(_WORD *)(a2 + 9) = v9 & 0xF;
      while (1)
      {
        unsigned int v10 = *(unsigned __int8 *)(a2 + v8);
        if (v10 < 0xA) {
          break;
        }
        if (v10 <= 0xF)
        {
          char v11 = 55;
          goto LABEL_19;
        }
LABEL_20:
        uint64_t result = 0;
        if (++v8 == 10) {
          return result;
        }
      }
      char v11 = 48;
LABEL_19:
      *(unsigned char *)(a2 + v8) = v10 + v11;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t e1000_read_pba_length_generic(uint64_t a1, int *a2)
{
  if (!a2) {
    return 4294967280;
  }
  int v7 = 0;
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1160))(a1, 8, 1, (char *)&v7 + 2);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1160))(a1, 9, 1, &v7);
    if (!result)
    {
      if (SHIWORD(v7) == -1286)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, (unsigned __int16)v7, 1, &v6);
        if (result) {
          return result;
        }
        if ((unsigned __int16)(v6 + 1) < 2u) {
          return 4294967278;
        }
        int v5 = 2 * v6 - 1;
      }
      else
      {
        int v5 = 11;
      }
      uint64_t result = 0;
      *a2 = v5;
    }
  }
  return result;
}

uint64_t e1000_read_pba_num_generic(uint64_t a1, _DWORD *a2)
{
  unsigned __int16 v5 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, 8, 1, &v5);
  if (!result)
  {
    if (v5 == 64250)
    {
      return 4294967282;
    }
    else
    {
      *a2 = v5 << 16;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, 9, 1, &v5);
      if (!result) {
        *a2 |= v5;
      }
    }
  }
  return result;
}

uint64_t e1000_read_pba_raw(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5)
{
  if (!a5) {
    return 4294967292;
  }
  if (a2)
  {
    if (a3 < 0xA) {
      return 4294967292;
    }
    int v10 = *(unsigned __int16 *)(a2 + 16);
    *a5 = v10;
    a5[1] = *(_WORD *)(a2 + 18);
  }
  else
  {
    uint64_t result = e1000_read_nvm(a1);
    if (result) {
      return result;
    }
    int v10 = *a5;
  }
  if (v10 == 64250)
  {
    if (*((void *)a5 + 1))
    {
      unsigned __int16 v12 = 0;
      uint64_t result = e1000_get_pba_block_size(a1, a2, a3, &v12);
      if (result) {
        return result;
      }
      if (v12 <= a4)
      {
        if (!a2)
        {
          uint64_t result = e1000_read_nvm(a1);
          if (result) {
            return result;
          }
          return 0;
        }
        if (a5[1] + v12 < a3)
        {
          memcpy(*((void **)a5 + 1), (const void *)(a2 + 2 * a5[1]), 2 * v12);
          return 0;
        }
      }
    }
    return 4294967292;
  }
  return 0;
}

uint64_t e1000_get_pba_block_size(uint64_t a1, uint64_t a2, unsigned int a3, _WORD *a4)
{
  if (a2)
  {
    if (a3 <= 9) {
      return 4294967292;
    }
    if (*(__int16 *)(a2 + 16) == -1286)
    {
      if (*(unsigned __int16 *)(a2 + 18) < a3)
      {
        unsigned __int16 v5 = (__int16 *)(a2 + 2 * *(unsigned __int16 *)(a2 + 18));
        goto LABEL_10;
      }
      return 4294967292;
    }
LABEL_12:
    __int16 v8 = 0;
    goto LABEL_13;
  }
  v9[0] = 0;
  uint64_t result = e1000_read_nvm(a1);
  if (result) {
    return result;
  }
  if (v9[1] != -1286) {
    goto LABEL_12;
  }
  unsigned __int16 v5 = v9;
  uint64_t result = e1000_read_nvm(a1);
  if (result) {
    return result;
  }
LABEL_10:
  __int16 v8 = *v5;
  if ((unsigned __int16)(*v5 + 1) < 2u) {
    return 4294967278;
  }
LABEL_13:
  uint64_t result = 0;
  if (a4) {
    *a4 = v8;
  }
  return result;
}

uint64_t e1000_write_pba_raw(uint64_t a1, uint64_t a2, unsigned int a3, __int16 *a4)
{
  if (!a4) {
    return 4294967292;
  }
  if (a2)
  {
    if (a3 < 0xA) {
      return 4294967292;
    }
    *(_WORD *)(a2 + 16) = *a4;
    *(_WORD *)(a2 + 18) = a4[1];
  }
  else
  {
    uint64_t result = e1000_write_nvm(a1);
    if (result) {
      return result;
    }
  }
  if (*a4 == -1286)
  {
    __int16 v9 = (unsigned __int16 *)*((void *)a4 + 1);
    if (v9)
    {
      if (!a2)
      {
        uint64_t result = e1000_write_nvm(a1);
        if (result) {
          return result;
        }
        return 0;
      }
      uint64_t v10 = *v9;
      if (v10 + (unsigned __int16)a4[1] < a3)
      {
        memcpy((void *)(a2 + 2 * (unsigned __int16)a4[1]), *((const void **)a4 + 1), 2 * v10);
        return 0;
      }
    }
    return 4294967292;
  }
  return 0;
}

uint64_t e1000_read_mac_addr_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  uint32_t v7 = 0;
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v3 = 64;
  }
  else {
    uint64_t v3 = 21504;
  }
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v3, &v7);
  __dmb(1u);
  uint32x4_t v4 = (uint32x4_t)vld1q_dup_f32((const float *)&v7);
  int16x8_t v5 = (int16x8_t)vshlq_u32(v4, (uint32x4_t)xmmword_100033F80);
  *(int16x4_t *)v5.i8 = vmovn_s32((int32x4_t)v5);
  v5.i32[0] = vmovn_s16(v5).u32[0];
  *(_DWORD *)(a1 + 278) = v5.i32[0];
  *(_WORD *)(a1 + 282) = v2;
  *(_WORD *)(a1 + 276) = *(_WORD *)(a1 + 282);
  *(_DWORD *)(a1 + 272) = v5.i32[0];
  return 0;
}

uint64_t e1000_validate_nvm_checksum_generic(uint64_t a1)
{
  unsigned __int16 v2 = 0;
  unsigned __int16 v3 = 0;
  __int16 v6 = 0;
  while (1)
  {
    unsigned int v4 = v2;
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v6);
    if (result) {
      break;
    }
    v3 += v6;
    ++v2;
    if (v4 >= 0x3F)
    {
      if (v3 == 47802) {
        return 0;
      }
      else {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t e1000_update_nvm_checksum_generic(uint64_t a1)
{
  __int16 v2 = 0;
  unsigned __int16 v3 = 0;
  __int16 v6 = 0;
  while (1)
  {
    unsigned int v4 = v3;
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v3, 1, &v6);
    if (result) {
      break;
    }
    v2 += v6;
    ++v3;
    if (v4 >= 0x3E)
    {
      __int16 v7 = -17734 - v2;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1208))(a1, 63, 1, &v7);
    }
  }
  return result;
}

uint64_t sub_100009940(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 280);
  unsigned int v3 = *(_DWORD *)(a2 + 128);
  if (v3 != *(_DWORD *)(a2 + 132))
  {
    uint64_t v5 = result;
    int v6 = v2 - 1;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 304) + 8 * v3);
      if (v7) {
        v9[6] = v7 - 8;
      }
      uint64_t result = (*(uint64_t (**)(void, void *))(**(void **)(v5 + 10560) + 64))(*(void *)(v5 + 10560), v9);
      int v8 = *(_DWORD *)(a2 + 132);
      unsigned int v3 = (*(_DWORD *)(a2 + 128) + 1) & v6;
      *(_DWORD *)(a2 + 128) = v3;
    }
    while (v3 != v8);
  }
  return result;
}

uint64_t e1000_acquire_phy_base(uint64_t a1)
{
  unint64_t v1 = *(unsigned __int16 *)(a1 + 1260);
  if (v1 >= 4) {
    int v2 = 2;
  }
  else {
    int v2 = 0x40002000040002uLL >> (16 * v1);
  }
  return (*(uint64_t (**)(uint64_t, void))(a1 + 256))(a1, v2 & 0x3FFFE);
}

uint64_t e1000_release_phy_base(uint64_t a1)
{
  unint64_t v1 = *(unsigned __int16 *)(a1 + 1260);
  if (v1 >= 4) {
    int v2 = 2;
  }
  else {
    int v2 = 0x40002000040002uLL >> (16 * v1);
  }
  return (*(uint64_t (**)(uint64_t, void))(a1 + 264))(a1, v2 & 0x3FFFE);
}

uint64_t e1000_init_hw_base(uint64_t a1)
{
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  if (*(_WORD *)(a1 + 326))
  {
    int v2 = 0;
    unsigned int v3 = 0;
    do
    {
      __dmb(2u);
      if (v2 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v4 = 64;
        }
        else {
          unsigned int v4 = 21504;
        }
      }
      else if (v2)
      {
        if (v2 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v4 = 1536;
          }
          else {
            unsigned int v4 = 22016;
          }
        }
        else
        {
          unsigned int v4 = v2 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v4 = 512;
      }
      else
      {
        unsigned int v4 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0);
      ++v3;
      v2 += 4;
    }
    while (v3 < *(unsigned __int16 *)(a1 + 326));
  }
  if (*(_WORD *)(a1 + 328))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 40960;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, 0);
      ++v5;
      v6 += 4;
    }
    while (v5 < *(unsigned __int16 *)(a1 + 328));
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
  e1000_clear_hw_cntrs_base_generic(a1);
  return v7;
}

void e1000_power_down_phy_copper_base(uint64_t a1)
{
  if (*(void *)(a1 + 920)
    && !e1000_enable_mng_pass_thru(a1)
    && !(*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
  {
    e1000_power_down_phy_copper(a1);
  }
}

void e1000_rx_fifo_flush_base(uint64_t a1)
{
  readData[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, readData);
  __dmb(1u);
  uint32_t v2 = readData[0] | 0x10000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v2);
  if (*(_DWORD *)(a1 + 284) == 29)
  {
    readData[0] = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, readData);
    __dmb(1u);
    if ((readData[0] & 0x20000) != 0)
    {
      uint64_t v3 = 0;
      uint64_t v4 = 10280;
      do
      {
        uint32_t v14 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v4, &v14);
        __dmb(1u);
        uint32_t v5 = v14;
        readData[v3] = v14;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, v5 & 0xFDFFFFFF);
        v4 += 256;
        ++v3;
      }
      while (v3 != 4);
      for (int i = 0; i != 10; ++i)
      {
        IODelay(0x3E8uLL);
        uint64_t v7 = 0;
        int v8 = 0;
        do
        {
          uint32_t v14 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v7 + 10280, &v14);
          __dmb(1u);
          v8 |= v14;
          v7 += 256;
        }
        while (v7 != 1024);
        if ((v8 & 0x2000000) == 0) {
          break;
        }
      }
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v2 & 0xFFFBFFFF);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5004uLL, &v14);
      __dmb(1u);
      uint32_t v9 = v14;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5004uLL, 0);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &v14);
      __dmb(1u);
      uint32_t v10 = v14;
      uint32_t v11 = v14 & 0xFFFFFFD9;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v11 | 0x20);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v11 | 0x22);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v14);
      __dmb(1u);
      IODelay(0x7D0uLL);
      uint64_t v12 = 0;
      uint64_t v13 = 10280;
      do
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v13, readData[v12]);
        v13 += 256;
        ++v12;
      }
      while (v12 != 4);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v10);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v14);
      __dmb(1u);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5004uLL, v9);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v2);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ACuLL, &v14);
      __dmb(1u);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40A0uLL, &v14);
      __dmb(1u);
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4010uLL, &v14);
      __dmb(1u);
    }
  }
}

void *e1000_init_function_pointers_82543(void *result)
{
  result[5] = sub_100009FAC;
  result[143] = sub_10000A170;
  result[111] = sub_10000A1F0;
  return result;
}

uint64_t sub_100009FAC(uint64_t a1)
{
  if ((*(unsigned __int16 *)(a1 + 9584) | 8) == 0x1009) {
    int v1 = 2;
  }
  else {
    int v1 = 1;
  }
  BOOL v2 = (*(unsigned __int16 *)(a1 + 9584) | 8) != 4105;
  BOOL v3 = (*(unsigned __int16 *)(a1 + 9584) | 8) == 4105;
  *(_DWORD *)(a1 + 1116) = v1;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(void *)(a1 + 104) = e1000_get_bus_info_pci_generic;
  *(void *)(a1 + 112) = e1000_set_lan_id_multi_port_pci;
  *(void *)(a1 + 152) = sub_10000A570;
  *(void *)(a1 + 160) = sub_10000A698;
  *(void *)(a1 + 192) = sub_10000A840;
  uint64_t v4 = sub_10000AA04;
  if (v2) {
    uint64_t v4 = sub_10000A8C8;
  }
  *(void *)(a1 + 200) = v4;
  uint32_t v5 = sub_10000ACD8;
  if (v2) {
    uint32_t v5 = sub_10000AAD4;
  }
  *(void *)(a1 + 72) = v5;
  uint64_t v6 = e1000_get_speed_and_duplex_fiber_serdes_generic;
  if (v2) {
    uint64_t v6 = e1000_get_speed_and_duplex_copper_generic;
  }
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = sub_10000AE44;
  *(void *)(a1 + 96) = e1000_clear_vfta_generic;
  *(void *)(a1 + 120) = v6;
  *(void *)(a1 + 128) = sub_10000B680;
  *(void *)(a1 + 136) = sub_10000B70C;
  *(void *)(a1 + 88) = sub_10000B798;
  if (*(_DWORD *)(a1 + 284) == 2 && v3) {
    *(_DWORD *)(a1 + 1376) &= ~1u;
  }
  return 0;
}

uint64_t sub_10000A170(uint64_t a1)
{
  *(_DWORD *)(a1 + 1216) = 3;
  *(void *)(a1 + 1232) = 0x3000600320040;
  *(void *)(a1 + 1160) = e1000_read_nvm_microwire;
  *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
  *(void *)(a1 + 1192) = e1000_valid_led_default_generic;
  *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
  *(void *)(a1 + 1208) = e1000_write_nvm_microwire;
  return 0;
}

uint64_t sub_10000A1F0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
    *(void *)(a1 + 1064) = e1000_power_down_phy_copper;
    *(_DWORD *)(a1 + 1100) = 1;
    *(_WORD *)(a1 + 1122) = 47;
    *(_DWORD *)(a1 + 1108) = 10000;
    *(_DWORD *)(a1 + 1072) = 2;
    *(void *)(a1 + 912) = e1000_check_polarity_m88;
    *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
    *(void *)(a1 + 936) = sub_10000B9BC;
    *(void *)(a1 + 952) = e1000_get_cable_length_m88;
    *(void *)(a1 + 944) = e1000_get_cfg_done_generic;
    int v2 = *(_DWORD *)(a1 + 284);
    BOOL v3 = e1000_read_phy_reg_m88;
    BOOL v4 = v2 == 2;
    if (v2 == 2) {
      BOOL v3 = sub_10000BCA4;
    }
    *(void *)(a1 + 976) = v3;
    if (v2 == 2) {
      uint32_t v5 = sub_10000BE04;
    }
    else {
      uint32_t v5 = e1000_phy_hw_reset_generic;
    }
    *(void *)(a1 + 1008) = v5;
    uint64_t v6 = e1000_write_phy_reg_m88;
    if (v4) {
      uint64_t v6 = sub_10000BEE8;
    }
    *(void *)(a1 + 1032) = v6;
    *(void *)(a1 + 960) = e1000_get_phy_info_m88;
    if (!v4 || !*(unsigned char *)(a1 + 1381))
    {
      uint64_t result = v5(a1);
      if (result) {
        return result;
      }
      IODelay(0x4E20uLL);
    }
    uint64_t result = e1000_get_phy_id(a1);
    if (!result)
    {
      int v8 = *(_DWORD *)(a1 + 284);
      uint64_t result = 4294967294;
      if (v8 == 3)
      {
        if (*(_DWORD *)(a1 + 1104) == 21040176) {
          return 0;
        }
        else {
          return 4294967294;
        }
      }
      else if (v8 == 2)
      {
        if (*(_DWORD *)(a1 + 1104) == 21040208) {
          return 0;
        }
        else {
          return 4294967294;
        }
      }
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1072) = 1;
  }
  return result;
}

uint64_t e1000_set_tbi_compatibility_82543(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 284) == 2) {
    *(_DWORD *)(result + 1376) = *(_DWORD *)(result + 1376) & 0xFFFFFFFE | a2;
  }
  return result;
}

uint64_t e1000_tbi_sbp_enabled_82543(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 284) == 2) {
    return (*(unsigned __int8 *)(a1 + 1376) >> 1) & 1;
  }
  else {
    return 0;
  }
}

uint64_t e1000_tbi_adjust_stats_82543(uint64_t result, void *a2, int a3, unsigned __int8 *a4, int a5)
{
  if (*(_DWORD *)(result + 284) == 2 && (*(unsigned char *)(result + 1376) & 2) != 0)
  {
    uint64_t v5 = (a3 - 1);
    --*a2;
    ++a2[26];
    a2[30] += v5;
    int v6 = *a4;
    if (v6 == 255)
    {
      if (a4[1] == 255)
      {
        uint64_t v7 = a2 + 27;
LABEL_8:
        ++*v7;
LABEL_9:
        if (v5 == a5)
        {
          uint64_t v8 = a2[35];
          if (v8) {
            a2[35] = v8 - 1;
          }
        }
        if (a3 > 511)
        {
          switch(a3)
          {
            case 512:
              ++a2[23];
              uint32_t v9 = a2 + 24;
              break;
            case 1024:
              ++a2[24];
              uint32_t v9 = a2 + 25;
              break;
            case 1523:
              uint32_t v9 = a2 + 25;
              uint64_t v10 = 1;
              goto LABEL_26;
            default:
              return result;
          }
        }
        else
        {
          switch(a3)
          {
            case 65:
              ++a2[20];
              uint32_t v9 = a2 + 21;
              break;
            case 128:
              ++a2[21];
              uint32_t v9 = a2 + 22;
              break;
            case 256:
              ++a2[22];
              uint32_t v9 = a2 + 23;
              break;
            default:
              return result;
          }
        }
        uint64_t v10 = -1;
LABEL_26:
        *v9 += v10;
        return result;
      }
    }
    else if ((v6 & 1) == 0)
    {
      goto LABEL_9;
    }
    uint64_t v7 = a2 + 28;
    goto LABEL_8;
  }
  return result;
}

uint64_t sub_10000A570(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  *(_DWORD *)(a1 + 1376) &= ~2u;
  IODelay(0x2710uLL);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v5);
  __dmb(1u);
  uint32_t v2 = v5;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x4000000);
  (*(void (**)(uint64_t))(a1 + 1176))(a1);
  IODelay(0x7D0uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &v4);
  __dmb(1u);
  return 0;
}

uint64_t sub_10000A698(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x38uLL, 0);
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  if (*(_WORD *)(a1 + 326))
  {
    int v2 = 0;
    unsigned int v3 = 0;
    do
    {
      __dmb(2u);
      if (v2 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v4 = 64;
        }
        else {
          unsigned int v4 = 21504;
        }
      }
      else if (v2)
      {
        if (v2 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v4 = 1536;
          }
          else {
            unsigned int v4 = 22016;
          }
        }
        else
        {
          unsigned int v4 = v2 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v4 = 512;
      }
      else
      {
        unsigned int v4 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      ++v3;
      v2 += 4;
    }
    while (v3 < *(unsigned __int16 *)(a1 + 326));
  }
  if (*(_DWORD *)(a1 + 284) == 2 && *(unsigned char *)(a1 + 1380))
  {
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v8);
    __dmb(1u);
    uint32_t v5 = v8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v5 | 4);
  }
  e1000_pcix_mmrbc_workaround_generic(a1);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
  sub_10000B798(a1);
  return v6;
}

uint64_t sub_10000A840(uint64_t a1)
{
  __int16 v4 = 0;
  if (*(_DWORD *)(a1 + 284) == 2)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 15, 1, &v4)) {
      return 0xFFFFFFFFLL;
    }
    uint32_t v3 = (16 * v4) & 0xF00;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
  }
  return e1000_setup_link_generic(a1);
}

uint64_t sub_10000A8C8(uint64_t a1)
{
  BOOL v6 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if (*(_DWORD *)(a1 + 284) == 2)
  {
    uint32_t v3 = readData | 0x1840;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v3);
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1008))(a1);
    if (result) {
      return result;
    }
    *(unsigned char *)(a1 + 1134) = 0;
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFE7BF | 0x40);
  }
  uint64_t result = e1000_copper_link_setup_m88(a1);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 851))
    {
      uint64_t result = e1000_copper_link_autoneg(a1);
      if (result) {
        return result;
      }
    }
    else
    {
      uint64_t result = sub_10000B9BC(a1);
      if (result) {
        return result;
      }
    }
    uint64_t result = e1000_phy_has_link_generic(a1, 0xAu, 0xAu, &v6);
    if (!result)
    {
      if (!v6) {
        return 0;
      }
      if (*(_DWORD *)(a1 + 284) == 3)
      {
        (*(void (**)(uint64_t))(a1 + 224))(a1);
        return e1000_config_fc_after_link_up_generic(a1);
      }
      uint64_t result = sub_10000BA1C(a1);
      if (!result) {
        return e1000_config_fc_after_link_up_generic(a1);
      }
    }
  }
  return result;
}

uint64_t sub_10000AA04(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  (*(void (**)(uint64_t))(a1 + 224))(a1);
  uint64_t result = e1000_commit_fc_settings_generic(a1);
  if (!result)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFFFF7);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v5);
    __dmb(1u);
    IODelay(0x3E8uLL);
    uint32_t v4 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v4);
    uint64_t result = 0;
    __dmb(1u);
    if ((v4 & 0x80000) == 0) {
      return e1000_poll_fiber_serdes_link_generic(a1);
    }
  }
  return result;
}

uint64_t sub_10000AAD4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 853)) {
    return 0;
  }
  int v11 = 0;
  BOOL v10 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v10);
  if (result) {
    return result;
  }
  if (!v10) {
    return 0;
  }
  *(unsigned char *)(a1 + 853) = 0;
  e1000_check_downshift_generic(a1);
  if (*(unsigned char *)(a1 + 851))
  {
    if (*(_DWORD *)(a1 + 284) == 3)
    {
      (*(void (**)(uint64_t))(a1 + 224))(a1);
    }
    else
    {
      uint64_t result = sub_10000BA1C(a1);
      if (result) {
        return result;
      }
    }
    uint64_t result = e1000_config_fc_after_link_up_generic(a1);
    if (*(_DWORD *)(a1 + 284) == 2 && (*(unsigned char *)(a1 + 1376) & 1) != 0)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, int *))(a1 + 120))(a1, (char *)&v11 + 2, &v11);
      if (!result)
      {
        int v4 = *(_DWORD *)(a1 + 284);
        if (HIWORD(v11) == 1000)
        {
          int v5 = *(_DWORD *)(a1 + 1376);
          if (v4 != 2) {
            goto LABEL_18;
          }
          if ((v5 & 2) != 0) {
            return 0;
          }
          if (v5) {
            unsigned int v6 = v5 | 2;
          }
          else {
LABEL_18:
          }
            unsigned int v6 = v5 & 0xFFFFFFFD;
          *(_DWORD *)(a1 + 1376) = v6;
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &readData);
          __dmb(1u);
          uint32_t v7 = readData | 4;
          __dmb(2u);
        }
        else
        {
          if (v4 != 2) {
            return 0;
          }
          int v8 = *(_DWORD *)(a1 + 1376);
          if ((v8 & 2) == 0) {
            return 0;
          }
          *(_DWORD *)(a1 + 1376) = v8 & 0xFFFFFFFD;
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &readData);
          __dmb(1u);
          uint32_t v7 = readData & 0xFFFFFFFB;
          __dmb(2u);
        }
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v7);
        return 0;
      }
    }
  }
  else
  {
    if ((*(unsigned char *)(a1 + 846) & 3) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
      sub_10000BAF0(a1);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
      __dmb(1u);
      uint32_t v3 = readData;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xC8uLL, v3 & 0xFFFFFFFB);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 0x9Du);
    }
    return 4294967293;
  }
  return result;
}

uint64_t sub_10000ACD8(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  char v3 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0x20000000;
  if ((v2 & 0x80000) == 0 && ((v3 & 2) == 0 ? (BOOL v5 = v4 == 0) : (BOOL v5 = 0), v5))
  {
    if (*(unsigned char *)(a1 + 852))
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312) & 0x7FFFFFFF);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
      __dmb(1u);
      uint32_t v6 = readData | 0x41;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v6);
      return e1000_config_fc_after_link_up_generic(a1);
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a1 + 852) = 1;
    }
  }
  else
  {
    uint64_t result = 0;
    if ((v2 & 0x40) != 0)
    {
      if (v4)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312));
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFFFBF);
        uint64_t result = 0;
        *(unsigned char *)(a1 + 860) = 1;
      }
    }
  }
  return result;
}

void sub_10000AE44(uint64_t a1, int a2, uint32_t data)
{
  if ((a2 & 1) != 0 && *(_DWORD *)(a1 + 284) == 3)
  {
    uint32_t readData = 0;
    int v5 = 4 * a2;
    uint64_t v6 = (4 * a2 + 22012);
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v6, &readData);
    __dmb(1u);
    uint32_t v7 = readData;
    __dmb(2u);
    if (v5 > -11745)
    {
      if (v5 == -11744)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v9 = 264;
        int v10 = 10272;
        goto LABEL_15;
      }
      if (v5 == -512)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v9 = 64;
        int v10 = 21504;
        goto LABEL_15;
      }
    }
    else
    {
      if (v5 == -11776)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v9 = 272;
        int v10 = 10240;
        goto LABEL_15;
      }
      if (v5 == -11772)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v9 = 276;
        int v10 = 10244;
        goto LABEL_15;
      }
    }
    unsigned int v9 = v5 + 22016;
    if (v5 > -11497)
    {
      if (v5 <= -7673)
      {
        if (v5 <= -8681)
        {
          if (v5 == -11496)
          {
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 336;
            int v10 = 10520;
          }
          else
          {
            if (v5 != -8688) {
              goto LABEL_17;
            }
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 32784;
            int v10 = 13328;
          }
        }
        else
        {
          switch(v5)
          {
            case -8680:
              BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v9 = 32792;
              int v10 = 13336;
              break;
            case -7680:
              BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v9 = 1056;
              int v10 = 14336;
              break;
            case -7676:
              BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v9 = 1060;
              int v10 = 14340;
              break;
            default:
              goto LABEL_17;
          }
        }
      }
      else if (v5 > -7649)
      {
        if (v5 == -7648)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 1088;
          int v10 = 14368;
        }
        else if (v5 == -1024)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 512;
          int v10 = 20992;
        }
        else
        {
          if (v5) {
            goto LABEL_17;
          }
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 1536;
          int v10 = 22016;
        }
      }
      else
      {
        switch(v5)
        {
          case -7672:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 1064;
            int v10 = 14344;
            break;
          case -7664:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 1072;
            int v10 = 14352;
            break;
          case -7656:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 1080;
            int v10 = 14360;
            break;
          default:
            goto LABEL_17;
        }
      }
    }
    else if (v5 <= -11761)
    {
      if (v5 <= -12785)
      {
        if (v5 == -13472)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 360;
          int v10 = 8544;
        }
        else
        {
          if (v5 != -13464) {
            goto LABEL_17;
          }
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 352;
          int v10 = 8552;
        }
      }
      else
      {
        switch(v5)
        {
          case -12784:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 0x8000;
            int v10 = 9232;
            break;
          case -12776:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 32776;
            int v10 = 9240;
            break;
          case -11768:
            BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v9 = 280;
            int v10 = 10248;
            break;
          default:
            goto LABEL_17;
        }
      }
    }
    else if (v5 > -11517)
    {
      switch(v5)
      {
        case -11516:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 316;
          int v10 = 10500;
          break;
        case -11512:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 320;
          int v10 = 10504;
          break;
        case -11504:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 328;
          int v10 = 10512;
          break;
        default:
          goto LABEL_17;
      }
    }
    else
    {
      switch(v5)
      {
        case -11760:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 288;
          int v10 = 10256;
          break;
        case -11752:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 296;
          int v10 = 10264;
          break;
        case -11520:
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v9 = 312;
          int v10 = 10496;
          break;
        default:
          goto LABEL_17;
      }
    }
LABEL_15:
    if (!v8) {
      unsigned int v9 = v10;
    }
LABEL_17:
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v9, data);
    uint32_t v15 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v15);
    __dmb(1u);
    __dmb(2u);
    if (v6 == 21504)
    {
      if (*(int *)(a1 + 284) <= 1) {
        LODWORD(v6) = 64;
      }
      else {
        LODWORD(v6) = 21504;
      }
      goto LABEL_113;
    }
    if (v5 <= -11509)
    {
      if (v5 > -11765)
      {
        if (v5 > -11741)
        {
          switch(v5)
          {
            case -11740:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 264;
              int v13 = 10272;
              break;
            case -11516:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 312;
              int v13 = 10496;
              break;
            case -11512:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 316;
              int v13 = 10500;
              break;
            default:
              goto LABEL_113;
          }
        }
        else
        {
          switch(v5)
          {
            case -11764:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 280;
              int v13 = 10248;
              break;
            case -11756:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 288;
              int v13 = 10256;
              break;
            case -11748:
              BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
              int v12 = 296;
              int v13 = 10264;
              break;
            default:
              goto LABEL_113;
          }
        }
      }
      else if (v5 > -12773)
      {
        switch(v5)
        {
          case -12772:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 32776;
            int v13 = 9240;
            break;
          case -11772:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 272;
            int v13 = 10240;
            break;
          case -11768:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 276;
            int v13 = 10244;
            break;
          default:
            goto LABEL_113;
        }
      }
      else
      {
        switch(v5)
        {
          case -13468:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 360;
            int v13 = 8544;
            break;
          case -13460:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 352;
            int v13 = 8552;
            break;
          case -12780:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 0x8000;
            int v13 = 9232;
            break;
          default:
            goto LABEL_113;
        }
      }
    }
    else if (v5 <= -7673)
    {
      if (v5 > -8685)
      {
        switch(v5)
        {
          case -8684:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 32784;
            int v13 = 13328;
            break;
          case -8676:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 32792;
            int v13 = 13336;
            break;
          case -7676:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 1056;
            int v13 = 14336;
            break;
          default:
            goto LABEL_113;
        }
      }
      else
      {
        switch(v5)
        {
          case -11508:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 320;
            int v13 = 10504;
            break;
          case -11500:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 328;
            int v13 = 10512;
            break;
          case -11492:
            BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
            int v12 = 336;
            int v13 = 10520;
            break;
          default:
            goto LABEL_113;
        }
      }
    }
    else if (v5 <= -7653)
    {
      switch(v5)
      {
        case -7672:
          BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
          int v12 = 1060;
          int v13 = 14340;
          break;
        case -7668:
          BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
          int v12 = 1064;
          int v13 = 14344;
          break;
        case -7660:
          BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
          int v12 = 1072;
          int v13 = 14352;
          break;
        default:
          goto LABEL_113;
      }
    }
    else if (v5 > -1021)
    {
      if (v5 == -1020)
      {
        BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
        int v12 = 512;
        int v13 = 20992;
      }
      else
      {
        if (v5 != 4) {
          goto LABEL_113;
        }
        BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
        int v12 = 1536;
        int v13 = 22016;
      }
    }
    else
    {
      if (v5 != -7652)
      {
        if (v5 == -7644)
        {
          BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
          int v12 = 1088;
          int v13 = 14368;
          goto LABEL_110;
        }
LABEL_113:
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, v7);
        uint32_t v14 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v14);
        __dmb(1u);
        return;
      }
      BOOL v11 = *(_DWORD *)(a1 + 284) <= 1;
      int v12 = 1080;
      int v13 = 14360;
    }
LABEL_110:
    if (v11) {
      LODWORD(v6) = v12;
    }
    else {
      LODWORD(v6) = v13;
    }
    goto LABEL_113;
  }
  e1000_write_vfta_generic(a1, a2, data);
}

uint64_t sub_10000B680(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 284) == 3 && *(_DWORD *)(a1 + 1116) == 1) {
    uint32_t v2 = readData & 0xFFBBFFFF | 0x400000;
  }
  else {
    uint32_t v2 = readData | 0x440000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  return 0;
}

uint64_t sub_10000B70C(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 284) == 3 && *(_DWORD *)(a1 + 1116) == 1) {
    uint32_t v2 = readData | 0x40000;
  }
  else {
    uint32_t v2 = readData & 0xFFBBFFFF;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x400000);
  return 0;
}

void sub_10000B798(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
}

uint64_t sub_10000B9BC(uint64_t a1)
{
  uint64_t result = e1000_phy_force_speed_duplex_m88(a1);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 851) || (*(unsigned char *)(a1 + 846) & 3) == 0)
    {
      return 0;
    }
    else
    {
      return sub_10000BAF0(a1);
    }
  }
  return result;
}

uint64_t sub_10000BA1C(uint64_t a1)
{
  if (*(void *)(a1 + 976))
  {
    __int16 v10 = 0;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v2 = readData;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 17, &v10);
    if (result) {
      return result;
    }
    if ((v10 & 0x2000) != 0) {
      int v4 = 6145;
    }
    else {
      int v4 = 6144;
    }
    unsigned int v5 = v4 | v2 & 0xFFFFE47E;
    (*(void (**)(uint64_t))(a1 + 224))(a1);
    int v6 = v10 & 0xC000;
    int v7 = v5 | 0x200;
    if (v6 != 0x8000) {
      int v7 = v5;
    }
    if (v6 == 0x4000) {
      uint32_t v8 = v5 | 0x100;
    }
    else {
      uint32_t v8 = v7;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v8);
  }
  return 0;
}

uint64_t sub_10000BAF0(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1032);
  if (!v1) {
    return 0;
  }
  uint64_t result = v1();
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 30, 0xFFFFLL);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 29, 0);
      if (!result)
      {
        __int16 v6 = 0;
        BOOL v5 = 0;
        int v4 = 20;
        while (1)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v6);
          if (result) {
            break;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v6);
          if (result) {
            break;
          }
          if ((v6 & 0xFFFB) != 0)
          {
            IODelay(0x186A0uLL);
            if ((_WORD)--v4) {
              continue;
            }
          }
          IODelay(0xF4240uLL);
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 25);
          if (!result)
          {
            IODelay(0xC350uLL);
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 30, 65520);
            if (!result)
            {
              IODelay(0xC350uLL);
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 30, 65280);
              if (!result)
              {
                IODelay(0xC350uLL);
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 30, 0);
                if (!result)
                {
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 29, 0);
                  if (!result) {
                    return e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v5);
                  }
                }
              }
            }
          }
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000BCA4(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (a2 > 0x1F) {
    return 4294967292;
  }
  uint64_t v15 = v3;
  uint64_t v16 = v4;
  sub_10000BF5C(a1, -1, 32);
  sub_10000BF5C(a1, a2 | (32 * *(_DWORD *)(a1 + 1100)) | 0x1800, 14);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v9 = readData & 0xFEEFFFFF;
  readData &= 0xFEEFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v9);
  uint32_t v13 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v13);
  __dmb(1u);
  sub_10000C038(a1, &readData);
  sub_10000C0A0(a1, &readData);
  uint32_t v10 = 0;
  unsigned int v11 = 0;
  do
  {
    sub_10000C038(a1, &readData);
    uint32_t v13 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v13);
    __dmb(1u);
    uint32_t readData = v13;
    uint32_t v10 = (2 * v10) | (v13 >> 20) & 1;
    sub_10000C0A0(a1, &readData);
  }
  while (v11++ < 0xF);
  sub_10000C038(a1, &readData);
  sub_10000C0A0(a1, &readData);
  uint64_t result = 0;
  *a3 = v10;
  return result;
}

uint64_t sub_10000BE04(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t v3 = readData & 0xFFFFFEEF | 0x100;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v7);
  __dmb(1u);
  IODelay(0x2710uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v2 | 0x110);
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v6);
  __dmb(1u);
  IODelay(0x96uLL);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(a1 + 944);
  if (v4) {
    return v4(a1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000BEE8(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 > 0x1F) {
    return 4294967292;
  }
  sub_10000BF5C(a1, -1, 32);
  sub_10000BF5C(a1, a3 | (a2 << 18) | (*(_DWORD *)(a1 + 1100) << 23) | 0x50020000, 32);
  return 0;
}

void sub_10000BF5C(uint64_t a1, int a2, char a3)
{
  unsigned int v5 = 1 << (a3 - 1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v6 = readData & 0xFCEFFFFF;
  do
  {
    int v7 = (v5 & a2) != 0;
    int v11 = v6 | (v7 << 20) | 0x3000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v6 | (v7 << 20) | 0x3000000);
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v9);
    __dmb(1u);
    IODelay(0xAuLL);
    sub_10000C038(a1, &v11);
    sub_10000C0A0(a1, &v11);
    BOOL v8 = v5 > 1;
    v5 >>= 1;
  }
  while (v8);
}

void sub_10000C038(uint64_t a1, _DWORD *a2)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, *a2 | 0x200000);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
}

void sub_10000C0A0(uint64_t a1, _DWORD *a2)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, *a2 & 0xFFDFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
}

uint64_t e1000_read_mbx(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1272);
  if (v1) {
    return v1();
  }
  else {
    return 4294967281;
  }
}

uint64_t e1000_write_mbx(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(unsigned __int16 *)(a1 + 1356) < a3) {
    return 4294967281;
  }
  uint64_t v4 = *(uint64_t (**)(void))(a1 + 1280);
  if (v4) {
    return v4();
  }
  else {
    return 0;
  }
}

uint64_t e1000_check_for_msg(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1304);
  if (v1) {
    return v1();
  }
  else {
    return 4294967281;
  }
}

uint64_t e1000_check_for_ack(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1312);
  if (v1) {
    return v1();
  }
  else {
    return 4294967281;
  }
}

uint64_t e1000_check_for_rst(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 1320);
  if (v1) {
    return v1();
  }
  else {
    return 4294967281;
  }
}

uint64_t e1000_read_posted_mbx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a1 + 1272)) {
    return 4294967281;
  }
  int v5 = *(_DWORD *)(a1 + 1348);
  if (!v5) {
    return 4294967281;
  }
  uint32_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1304);
  if (v9)
  {
    for (int i = v9(a1, a4); i; int i = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1304))(a1, a4))
    {
      if (!--v5)
      {
        *(_DWORD *)(a1 + 1348) = 0;
        return 4294967281;
      }
      IODelay(*(unsigned int *)(a1 + 1352));
    }
  }
  int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1272);
  return v11(a1, a2, a3, a4);
}

uint64_t e1000_write_posted_mbx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t))(a1 + 1280);
  if (v4 && *(_DWORD *)(a1 + 1348))
  {
    uint64_t result = v4(a1);
    if (result) {
      return result;
    }
    int v8 = *(_DWORD *)(a1 + 1348);
    if (v8)
    {
      uint32_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1312);
      if (!v9) {
        return 0;
      }
      uint64_t result = v9(a1, a4);
      if (!result) {
        return result;
      }
      while (--v8)
      {
        IODelay(*(unsigned int *)(a1 + 1352));
        int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1312))(a1, a4);
        uint64_t result = 0;
        if (!v10) {
          return result;
        }
      }
      *(_DWORD *)(a1 + 1348) = 0;
    }
  }
  return 4294967281;
}

void *e1000_init_mbx_ops_generic(void *result)
{
  result[158] = e1000_null_ops_generic;
  result[159] = sub_10000C38C;
  result[160] = sub_10000C38C;
  result[163] = sub_10000C394;
  result[164] = sub_10000C394;
  result[165] = sub_10000C394;
  result[161] = e1000_read_posted_mbx;
  result[162] = e1000_write_posted_mbx;
  return result;
}

uint64_t sub_10000C38C()
{
  return 0;
}

uint64_t sub_10000C394()
{
  return 0;
}

uint64_t e1000_init_mbx_params_pf(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 284);
  BOOL v2 = v1 > 0x21;
  uint64_t v3 = (1 << v1) & 0x340000000;
  if (!v2 && v3 != 0)
  {
    *(_DWORD *)(a1 + 1352) = 0;
    *(_WORD *)(a1 + 1356) = 16;
    *(void *)(a1 + 1272) = sub_10000C468;
    *(void *)(a1 + 1280) = sub_10000CC9C;
    *(void *)(a1 + 1288) = e1000_read_posted_mbx;
    *(void *)(a1 + 1296) = e1000_write_posted_mbx;
    *(void *)(a1 + 1304) = sub_10000D4FC;
    *(void *)(a1 + 1312) = sub_10000D540;
    *(void *)(a1 + 1320) = sub_10000D584;
    *(void *)(a1 + 1344) = 0;
    *(void *)(a1 + 1336) = 0;
    *(void *)(a1 + 1328) = 0;
  }
  return 0;
}

uint64_t sub_10000C468(uint64_t a1, uint32_t *a2, int a3, unsigned int a4)
{
  LODWORD(v5) = a3;
  uint64_t v8 = sub_10000D60C(a1, a4);
  if (!v8)
  {
    if (v5)
    {
      uint64_t v5 = v5;
      int v9 = (a4 << 6) + 2048;
      int v10 = 8552;
      do
      {
        uint32_t readData = 0;
        if (v9 > 10511)
        {
          if (v9 <= 14343)
          {
            if (v9 > 13335)
            {
              if (v9 == 13336)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 13336;
                int v13 = 32792;
LABEL_59:
                if (v12) {
                  unsigned int v11 = v13;
                }
                goto LABEL_70;
              }
              int v10 = 14336;
              if (v9 == 14336)
              {
                BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 1056;
LABEL_68:
                if (!v14) {
                  unsigned int v11 = v10;
                }
                goto LABEL_70;
              }
              unsigned int v11 = v9;
              if (v9 == 14340)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 14340;
                int v13 = 1060;
                goto LABEL_59;
              }
            }
            else
            {
              if (v9 == 10512)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 10512;
                int v13 = 328;
                goto LABEL_59;
              }
              int v10 = 10520;
              if (v9 == 10520)
              {
                BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 336;
                goto LABEL_68;
              }
              unsigned int v11 = v9;
              if (v9 == 13328)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v11 = 13328;
                int v13 = 32784;
                goto LABEL_59;
              }
            }
          }
          else if (v9 <= 14367)
          {
            if (v9 == 14344)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 14344;
              int v13 = 1064;
              goto LABEL_59;
            }
            int v10 = 14352;
            if (v9 == 14352)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 1072;
              goto LABEL_68;
            }
            unsigned int v11 = v9;
            if (v9 == 14360)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 14360;
              int v13 = 1080;
              goto LABEL_59;
            }
          }
          else if (v9 > 21503)
          {
            int v10 = 21504;
            if (v9 == 21504)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 64;
              goto LABEL_68;
            }
            unsigned int v11 = v9;
            if (v9 == 22016)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 22016;
              int v13 = 1536;
              goto LABEL_59;
            }
          }
          else
          {
            int v10 = 14368;
            if (v9 == 14368)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 1088;
              goto LABEL_68;
            }
            unsigned int v11 = v9;
            if (v9 == 20992)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 20992;
              int v13 = 512;
              goto LABEL_59;
            }
          }
        }
        else if (v9 <= 10247)
        {
          if (v9 > 9239)
          {
            if (v9 == 9240)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 9240;
              int v13 = 32776;
              goto LABEL_59;
            }
            int v10 = 10240;
            if (v9 == 10240)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 272;
              goto LABEL_68;
            }
            unsigned int v11 = v9;
            if (v9 == 10244)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 10244;
              int v13 = 276;
              goto LABEL_59;
            }
          }
          else
          {
            if (v9 == 8544)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 8544;
              int v13 = 360;
              goto LABEL_59;
            }
            if (v9 == 8552)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 352;
              goto LABEL_68;
            }
            unsigned int v11 = v9;
            if (v9 == 9232)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v11 = 9232;
              int v13 = 0x8000;
              goto LABEL_59;
            }
          }
        }
        else if (v9 <= 10271)
        {
          if (v9 == 10248)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 10248;
            int v13 = 280;
            goto LABEL_59;
          }
          int v10 = 10256;
          if (v9 == 10256)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 288;
            goto LABEL_68;
          }
          unsigned int v11 = v9;
          if (v9 == 10264)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 10264;
            int v13 = 296;
            goto LABEL_59;
          }
        }
        else if (v9 > 10499)
        {
          int v10 = 10500;
          if (v9 == 10500)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 316;
            goto LABEL_68;
          }
          unsigned int v11 = v9;
          if (v9 == 10504)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 10504;
            int v13 = 320;
            goto LABEL_59;
          }
        }
        else
        {
          int v10 = 10272;
          if (v9 == 10272)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 264;
            goto LABEL_68;
          }
          unsigned int v11 = v9;
          if (v9 == 10496)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v11 = 10496;
            int v13 = 312;
            goto LABEL_59;
          }
        }
LABEL_70:
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v11, &readData);
        __dmb(1u);
        *a2++ = readData;
        v9 += 4;
        --v5;
        int v10 = 8552;
      }
      while (v5);
    }
    __dmb(2u);
    int v15 = 4 * a4;
    unsigned int v16 = 4 * a4 + 3072;
    if ((int)(4 * a4) > 7439)
    {
      if (v15 <= 11271)
      {
        if (v15 > 10263)
        {
          switch(v15)
          {
            case 10264:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 32792;
              int v18 = 13336;
              break;
            case 11264:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 1056;
              int v18 = 14336;
              break;
            case 11268:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 1060;
              int v18 = 14340;
              break;
            default:
              goto LABEL_134;
          }
        }
        else
        {
          switch(v15)
          {
            case 7440:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 328;
              int v18 = 10512;
              break;
            case 7448:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 336;
              int v18 = 10520;
              break;
            case 10256:
              BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v16 = 32784;
              int v18 = 13328;
              break;
            default:
              goto LABEL_134;
          }
        }
      }
      else if (v15 <= 11295)
      {
        switch(v15)
        {
          case 11272:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 1064;
            int v18 = 14344;
            break;
          case 11280:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 1072;
            int v18 = 14352;
            break;
          case 11288:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 1080;
            int v18 = 14360;
            break;
          default:
            goto LABEL_134;
        }
      }
      else if (v15 > 18431)
      {
        if (v15 == 18944)
        {
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 1536;
          int v18 = 22016;
        }
        else
        {
          if (v15 != 18432) {
            goto LABEL_134;
          }
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 64;
          int v18 = 21504;
        }
      }
      else if (v15 == 11296)
      {
        BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v16 = 1088;
        int v18 = 14368;
      }
      else
      {
        if (v15 != 17920) {
          goto LABEL_134;
        }
        BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v16 = 512;
        int v18 = 20992;
      }
    }
    else if (v15 <= 7175)
    {
      if (v15 > 6167)
      {
        switch(v15)
        {
          case 6168:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 32776;
            int v18 = 9240;
            break;
          case 7168:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 272;
            int v18 = 10240;
            break;
          case 7172:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 276;
            int v18 = 10244;
            break;
          default:
            goto LABEL_134;
        }
      }
      else
      {
        switch(v15)
        {
          case 5472:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 360;
            int v18 = 8544;
            break;
          case 5480:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 352;
            int v18 = 8552;
            break;
          case 6160:
            BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v16 = 0x8000;
            int v18 = 9232;
            break;
          default:
            goto LABEL_134;
        }
      }
    }
    else if (v15 <= 7199)
    {
      switch(v15)
      {
        case 7176:
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 280;
          int v18 = 10248;
          break;
        case 7184:
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 288;
          int v18 = 10256;
          break;
        case 7192:
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 296;
          int v18 = 10264;
          break;
        default:
          goto LABEL_134;
      }
    }
    else if (v15 > 7427)
    {
      if (v15 == 7428)
      {
        BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v16 = 316;
        int v18 = 10500;
      }
      else
      {
        if (v15 != 7432) {
          goto LABEL_134;
        }
        BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v16 = 320;
        int v18 = 10504;
      }
    }
    else
    {
      if (v15 != 7200)
      {
        if (v15 == 7424)
        {
          BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v16 = 312;
          int v18 = 10496;
          goto LABEL_132;
        }
LABEL_134:
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v16, 2u);
        ++*(_DWORD *)(a1 + 1332);
        return v8;
      }
      BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v16 = 264;
      int v18 = 10272;
    }
LABEL_132:
    if (!v17) {
      unsigned int v16 = v18;
    }
    goto LABEL_134;
  }
  return v8;
}

uint64_t sub_10000CC9C(uint64_t a1, uint32_t *a2, int a3, unsigned int a4)
{
  LODWORD(v5) = a3;
  uint64_t v8 = sub_10000D60C(a1, a4);
  if (!v8)
  {
    if (!sub_10000DAB4(a1, 1 << a4)) {
      ++*(_DWORD *)(a1 + 1340);
    }
    if (!sub_10000DAB4(a1, 0x10000 << a4)) {
      ++*(_DWORD *)(a1 + 1336);
    }
    if (v5)
    {
      uint64_t v5 = v5;
      int v9 = (a4 << 6) + 2048;
      int v10 = 8552;
      do
      {
        __dmb(2u);
        if (v9 > 10511)
        {
          if (v9 <= 14343)
          {
            if (v9 > 13335)
            {
              if (v9 == 13336)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 13336;
                int v13 = 32792;
LABEL_63:
                if (v12) {
                  int v11 = v13;
                }
                goto LABEL_74;
              }
              int v10 = 14336;
              if (v9 == 14336)
              {
                BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 1056;
LABEL_72:
                if (!v14) {
                  int v11 = v10;
                }
                goto LABEL_74;
              }
              int v11 = v9;
              if (v9 == 14340)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 14340;
                int v13 = 1060;
                goto LABEL_63;
              }
            }
            else
            {
              if (v9 == 10512)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 10512;
                int v13 = 328;
                goto LABEL_63;
              }
              int v10 = 10520;
              if (v9 == 10520)
              {
                BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 336;
                goto LABEL_72;
              }
              int v11 = v9;
              if (v9 == 13328)
              {
                BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
                int v11 = 13328;
                int v13 = 32784;
                goto LABEL_63;
              }
            }
          }
          else if (v9 <= 14367)
          {
            if (v9 == 14344)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 14344;
              int v13 = 1064;
              goto LABEL_63;
            }
            int v10 = 14352;
            if (v9 == 14352)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 1072;
              goto LABEL_72;
            }
            int v11 = v9;
            if (v9 == 14360)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 14360;
              int v13 = 1080;
              goto LABEL_63;
            }
          }
          else if (v9 > 21503)
          {
            int v10 = 21504;
            if (v9 == 21504)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 64;
              goto LABEL_72;
            }
            int v11 = v9;
            if (v9 == 22016)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 22016;
              int v13 = 1536;
              goto LABEL_63;
            }
          }
          else
          {
            int v10 = 14368;
            if (v9 == 14368)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 1088;
              goto LABEL_72;
            }
            int v11 = v9;
            if (v9 == 20992)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 20992;
              int v13 = 512;
              goto LABEL_63;
            }
          }
        }
        else if (v9 <= 10247)
        {
          if (v9 > 9239)
          {
            if (v9 == 9240)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 9240;
              int v13 = 32776;
              goto LABEL_63;
            }
            int v10 = 10240;
            if (v9 == 10240)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 272;
              goto LABEL_72;
            }
            int v11 = v9;
            if (v9 == 10244)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 10244;
              int v13 = 276;
              goto LABEL_63;
            }
          }
          else
          {
            if (v9 == 8544)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 8544;
              int v13 = 360;
              goto LABEL_63;
            }
            if (v9 == 8552)
            {
              BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 352;
              goto LABEL_72;
            }
            int v11 = v9;
            if (v9 == 9232)
            {
              BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
              int v11 = 9232;
              int v13 = 0x8000;
              goto LABEL_63;
            }
          }
        }
        else if (v9 <= 10271)
        {
          if (v9 == 10248)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 10248;
            int v13 = 280;
            goto LABEL_63;
          }
          int v10 = 10256;
          if (v9 == 10256)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 288;
            goto LABEL_72;
          }
          int v11 = v9;
          if (v9 == 10264)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 10264;
            int v13 = 296;
            goto LABEL_63;
          }
        }
        else if (v9 > 10499)
        {
          int v10 = 10500;
          if (v9 == 10500)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 316;
            goto LABEL_72;
          }
          int v11 = v9;
          if (v9 == 10504)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 10504;
            int v13 = 320;
            goto LABEL_63;
          }
        }
        else
        {
          int v10 = 10272;
          if (v9 == 10272)
          {
            BOOL v14 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 264;
            goto LABEL_72;
          }
          int v11 = v9;
          if (v9 == 10496)
          {
            BOOL v12 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 10496;
            int v13 = 312;
            goto LABEL_63;
          }
        }
LABEL_74:
        uint32_t v15 = *a2++;
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v11, v15);
        v9 += 4;
        --v5;
        int v10 = 8552;
      }
      while (v5);
    }
    __dmb(2u);
    int v16 = 4 * a4;
    unsigned int v17 = 4 * a4 + 3072;
    if ((int)(4 * a4) > 7439)
    {
      if (v16 <= 11271)
      {
        if (v16 > 10263)
        {
          switch(v16)
          {
            case 10264:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 32792;
              int v19 = 13336;
              break;
            case 11264:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 1056;
              int v19 = 14336;
              break;
            case 11268:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 1060;
              int v19 = 14340;
              break;
            default:
              goto LABEL_138;
          }
        }
        else
        {
          switch(v16)
          {
            case 7440:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 328;
              int v19 = 10512;
              break;
            case 7448:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 336;
              int v19 = 10520;
              break;
            case 10256:
              BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v17 = 32784;
              int v19 = 13328;
              break;
            default:
              goto LABEL_138;
          }
        }
      }
      else if (v16 <= 11295)
      {
        switch(v16)
        {
          case 11272:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 1064;
            int v19 = 14344;
            break;
          case 11280:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 1072;
            int v19 = 14352;
            break;
          case 11288:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 1080;
            int v19 = 14360;
            break;
          default:
            goto LABEL_138;
        }
      }
      else if (v16 > 18431)
      {
        if (v16 == 18944)
        {
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 1536;
          int v19 = 22016;
        }
        else
        {
          if (v16 != 18432) {
            goto LABEL_138;
          }
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 64;
          int v19 = 21504;
        }
      }
      else if (v16 == 11296)
      {
        BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v17 = 1088;
        int v19 = 14368;
      }
      else
      {
        if (v16 != 17920) {
          goto LABEL_138;
        }
        BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v17 = 512;
        int v19 = 20992;
      }
    }
    else if (v16 <= 7175)
    {
      if (v16 > 6167)
      {
        switch(v16)
        {
          case 6168:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 32776;
            int v19 = 9240;
            break;
          case 7168:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 272;
            int v19 = 10240;
            break;
          case 7172:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 276;
            int v19 = 10244;
            break;
          default:
            goto LABEL_138;
        }
      }
      else
      {
        switch(v16)
        {
          case 5472:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 360;
            int v19 = 8544;
            break;
          case 5480:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 352;
            int v19 = 8552;
            break;
          case 6160:
            BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v17 = 0x8000;
            int v19 = 9232;
            break;
          default:
            goto LABEL_138;
        }
      }
    }
    else if (v16 <= 7199)
    {
      switch(v16)
      {
        case 7176:
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 280;
          int v19 = 10248;
          break;
        case 7184:
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 288;
          int v19 = 10256;
          break;
        case 7192:
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 296;
          int v19 = 10264;
          break;
        default:
          goto LABEL_138;
      }
    }
    else if (v16 > 7427)
    {
      if (v16 == 7428)
      {
        BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v17 = 316;
        int v19 = 10500;
      }
      else
      {
        if (v16 != 7432) {
          goto LABEL_138;
        }
        BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v17 = 320;
        int v19 = 10504;
      }
    }
    else
    {
      if (v16 != 7200)
      {
        if (v16 == 7424)
        {
          BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v17 = 312;
          int v19 = 10496;
          goto LABEL_136;
        }
LABEL_138:
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v17, 1u);
        ++*(_DWORD *)(a1 + 1328);
        return v8;
      }
      BOOL v18 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v17 = 264;
      int v19 = 10272;
    }
LABEL_136:
    if (!v18) {
      unsigned int v17 = v19;
    }
    goto LABEL_138;
  }
  return v8;
}

uint64_t sub_10000D4FC(uint64_t a1, char a2)
{
  uint64_t result = sub_10000DAB4(a1, 1 << a2);
  if (result) {
    return 4294967281;
  }
  ++*(_DWORD *)(a1 + 1340);
  return result;
}

uint64_t sub_10000D540(uint64_t a1, char a2)
{
  uint64_t result = sub_10000DAB4(a1, 0x10000 << a2);
  if (result) {
    return 4294967281;
  }
  ++*(_DWORD *)(a1 + 1336);
  return result;
}

uint64_t sub_10000D584(uint64_t a1, char a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC88uLL, &readData);
  __dmb(1u);
  if ((readData & (1 << a2)) == 0) {
    return 4294967281;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xC88uLL, 1 << a2);
  uint64_t result = 0;
  ++*(_DWORD *)(a1 + 1344);
  return result;
}

uint64_t sub_10000D60C(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = 4 * a2;
  int v4 = -11;
  while (1)
  {
    __dmb(2u);
    uint64_t v5 = *(IOPCIDevice **)(a1 + 16);
    if (v3 > 7439)
    {
      if (v3 <= 11271)
      {
        if (v3 > 10263)
        {
          switch(v3)
          {
            case 10264:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 32792;
              uint64_t v8 = 13336;
              break;
            case 11264:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 1056;
              uint64_t v8 = 14336;
              break;
            case 11268:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 1060;
              uint64_t v8 = 14340;
              break;
            default:
              goto LABEL_75;
          }
        }
        else
        {
          switch(v3)
          {
            case 7440:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 328;
              uint64_t v8 = 10512;
              break;
            case 7448:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 336;
              uint64_t v8 = 10520;
              break;
            case 10256:
              BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v7 = 32784;
              uint64_t v8 = 13328;
              break;
            default:
              goto LABEL_75;
          }
        }
      }
      else if (v3 <= 11295)
      {
        switch(v3)
        {
          case 11272:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 1064;
            uint64_t v8 = 14344;
            break;
          case 11280:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 1072;
            uint64_t v8 = 14352;
            break;
          case 11288:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 1080;
            uint64_t v8 = 14360;
            break;
          default:
            goto LABEL_75;
        }
      }
      else if (v3 > 18431)
      {
        if (v3 == 18432)
        {
          BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v7 = 64;
          uint64_t v8 = 21504;
        }
        else
        {
          if (v3 != 18944)
          {
LABEL_75:
            IOPCIDevice::MemoryWrite32(v5, 0, v3 + 3072, 8u);
            uint32_t readData = 0;
            uint64_t v10 = v3 + 3072;
            goto LABEL_71;
          }
          BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v7 = 1536;
          uint64_t v8 = 22016;
        }
      }
      else if (v3 == 11296)
      {
        BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v7 = 1088;
        uint64_t v8 = 14368;
      }
      else
      {
        if (v3 != 17920) {
          goto LABEL_75;
        }
        BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v7 = 512;
        uint64_t v8 = 20992;
      }
      goto LABEL_65;
    }
    if (v3 <= 7175)
    {
      if (v3 > 6167)
      {
        switch(v3)
        {
          case 6168:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 32776;
            uint64_t v8 = 9240;
            break;
          case 7168:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 272;
            uint64_t v8 = 10240;
            break;
          case 7172:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 276;
            uint64_t v8 = 10244;
            break;
          default:
            goto LABEL_75;
        }
      }
      else
      {
        switch(v3)
        {
          case 5472:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 360;
            uint64_t v8 = 8544;
            break;
          case 5480:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v8 = 8552;
            uint64_t v7 = 352;
            break;
          case 6160:
            BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v7 = 0x8000;
            uint64_t v8 = 9232;
            break;
          default:
            goto LABEL_75;
        }
      }
      goto LABEL_65;
    }
    if (v3 > 7199)
    {
      if (v3 > 7427)
      {
        if (v3 == 7428)
        {
          BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v7 = 316;
          uint64_t v8 = 10500;
        }
        else
        {
          if (v3 != 7432) {
            goto LABEL_75;
          }
          BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v7 = 320;
          uint64_t v8 = 10504;
        }
      }
      else if (v3 == 7200)
      {
        BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v7 = 264;
        uint64_t v8 = 10272;
      }
      else
      {
        if (v3 != 7424) {
          goto LABEL_75;
        }
        BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v7 = 312;
        uint64_t v8 = 10496;
      }
      goto LABEL_65;
    }
    if (v3 == 7176)
    {
      BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v7 = 280;
      uint64_t v8 = 10248;
      goto LABEL_65;
    }
    if (v3 == 7184)
    {
      BOOL v6 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v7 = 288;
      uint64_t v8 = 10256;
LABEL_65:
      if (v6) {
        uint64_t v9 = v7;
      }
      else {
        uint64_t v9 = v8;
      }
      goto LABEL_68;
    }
    if (v3 != 7192) {
      goto LABEL_75;
    }
    uint64_t v7 = 296;
    uint64_t v8 = 10264;
    uint64_t v9 = *(int *)(a1 + 284) <= 1 ? 296 : 10264;
LABEL_68:
    IOPCIDevice::MemoryWrite32(v5, 0, v9, 8u);
    uint32_t readData = 0;
    uint64_t v10 = *(int *)(a1 + 284) <= 1 ? v7 : v8;
LABEL_71:
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v10, &readData);
    __dmb(1u);
    if ((readData & 8) != 0) {
      return 0;
    }
    IODelay(0x3E8uLL);
    if (__CFADD__(v4++, 1)) {
      return 4294967281;
    }
  }
}

uint64_t sub_10000DAB4(uint64_t a1, uint32_t a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC80uLL, &readData);
  __dmb(1u);
  if ((readData & a2) == 0) {
    return 4294967281;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xC80uLL, a2);
  return 0;
}

void *e1000_init_phy_ops_generic(void *result)
{
  result[111] = e1000_null_ops_generic;
  result[112] = e1000_null_ops_generic;
  result[114] = e1000_null_ops_generic;
  result[115] = e1000_null_ops_generic;
  result[116] = e1000_null_ops_generic;
  result[117] = e1000_null_ops_generic;
  result[118] = e1000_null_ops_generic;
  result[119] = e1000_null_ops_generic;
  result[120] = e1000_null_ops_generic;
  result[121] = e1000_null_set_page;
  result[122] = e1000_null_read_reg;
  result[123] = e1000_null_read_reg;
  result[124] = e1000_null_read_reg;
  result[125] = e1000_null_phy_generic;
  result[126] = e1000_null_ops_generic;
  result[127] = e1000_null_lplu_state;
  result[128] = e1000_null_lplu_state;
  result[129] = e1000_null_write_reg;
  result[130] = e1000_null_write_reg;
  result[131] = e1000_null_write_reg;
  result[132] = e1000_null_phy_generic;
  result[133] = e1000_null_phy_generic;
  result[113] = e1000_null_ops_generic;
  return result;
}

uint64_t e1000_null_set_page()
{
  return 0;
}

uint64_t e1000_null_read_reg()
{
  return 0;
}

uint64_t e1000_null_lplu_state()
{
  return 0;
}

uint64_t e1000_null_write_reg()
{
  return 0;
}

uint64_t e1000_check_reset_block_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  __dmb(1u);
  return ((int)(readData << 13) >> 31) & 0xC;
}

uint64_t e1000_get_phy_id(uint64_t a1)
{
  if (!*(void *)(a1 + 976)) {
    return 0;
  }
  unsigned __int16 v8 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 2, &v8);
    if (result) {
      break;
    }
    *(_DWORD *)(a1 + 1104) = v8 << 16;
    IODelay(0x14uLL);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 3, &v8);
    if (result) {
      break;
    }
    char v5 = v8;
    int v6 = *(_DWORD *)(a1 + 1104) | v8 & 0xFFF0;
    *(_DWORD *)(a1 + 1104) = v6;
    *(_DWORD *)(a1 + 1112) = v5 & 0xF;
    if (v6) {
      BOOL v7 = v6 == -16;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      char v2 = 0;
      if (v3) {
        continue;
      }
    }
    return 0;
  }
  return result;
}

uint64_t e1000_phy_reset_dsp_generic(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1032);
  if (!v1) {
    return 0;
  }
  uint64_t result = v1();
  if (!result)
  {
    int v4 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032);
    return v4(a1, 30, 0);
  }
  return result;
}

uint64_t e1000_read_phy_reg_mdic(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if (a2 > 0x1F) {
    return 4294967292;
  }
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  uint32_t v9 = (a2 << 16) | (*(_DWORD *)(a1 + 1100) << 21) | 0x8000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, v9);
  int v10 = 1919;
  do
  {
    int v11 = v10;
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, &readData);
    __dmb(1u);
    if ((readData & 0x10000000) != 0) {
      break;
    }
    int v10 = v11 - 1;
  }
  while (v11);
  if ((readData & 0x50000000) != 0x10000000 || (HIWORD(readData) & 0x1F) != a2) {
    return 4294967294;
  }
  *a3 = readData;
  if (*(_DWORD *)(a1 + 284) == 23) {
    IODelay(0x64uLL);
  }
  return 0;
}

uint64_t e1000_write_phy_reg_mdic(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 > 0x1F) {
    return 4294967292;
  }
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  uint32_t v8 = a3 | (a2 << 16) | (*(_DWORD *)(a1 + 1100) << 21) | 0x4000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, v8);
  int v9 = 1919;
  do
  {
    int v10 = v9;
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x20uLL, &readData);
    __dmb(1u);
    if ((readData & 0x10000000) != 0) {
      break;
    }
    int v9 = v10 - 1;
  }
  while (v10);
  if ((readData & 0x50000000) != 0x10000000 || (HIWORD(readData) & 0x1F) != a2) {
    return 4294967294;
  }
  if (*(_DWORD *)(a1 + 284) == 23) {
    IODelay(0x64uLL);
  }
  return 0;
}

uint64_t e1000_read_phy_reg_i2c(uint64_t a1, int a2, _WORD *a3)
{
  uint32_t v5 = (a2 << 16) | (*(_DWORD *)(a1 + 1100) << 24) | 0x8000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, v5);
  int v6 = 199;
  do
  {
    int v7 = v6;
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, &readData);
    __dmb(1u);
    if ((readData & 0x20000000) != 0) {
      break;
    }
    int v6 = v7 - 1;
  }
  while (v7);
  if ((readData & 0xA0000000) != 0x20000000) {
    return 4294967294;
  }
  uint64_t result = 0;
  *a3 = bswap32(readData) >> 16;
  return result;
}

uint64_t e1000_write_phy_reg_i2c(uint64_t a1, unsigned int a2, unsigned int a3)
{
  int v3 = *(_DWORD *)(a1 + 1100);
  if ((v3 - 8) < 0xFFFFFFF9) {
    return 4294967293;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, (__PAIR64__(a2, bswap32(a3)) >> 16) | (v3 << 24));
  int v6 = 200;
  while (1)
  {
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, &readData);
    __dmb(1u);
    if ((readData & 0x20000000) != 0) {
      break;
    }
    if (!--v6) {
      return 4294967294;
    }
  }
  return ((int)readData >> 31) & 0xFFFFFFFE;
}

uint64_t e1000_read_sfp_data_byte(uint64_t a1, unsigned int a2, unsigned char *a3)
{
  if (a2 > 0x1FF) {
    return 4294967294;
  }
  uint64_t v11 = v3;
  uint64_t v12 = v4;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, (a2 << 16) | 0x8000000);
  int v8 = 199;
  do
  {
    int v9 = v8;
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, &readData);
    __dmb(1u);
    if ((readData & 0x20000000) != 0) {
      break;
    }
    int v8 = v9 - 1;
  }
  while (v9);
  if ((readData & 0xA0000000) != 0x20000000) {
    return 4294967294;
  }
  uint64_t result = 0;
  *a3 = readData;
  return result;
}

uint64_t e1000_write_sfp_data_byte(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 > 0x1FF) {
    return 4294967294;
  }
  uint64_t v14 = v3;
  uint64_t v15 = v4;
  unsigned int v8 = a2 << 16;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, (a2 << 16) | 0x8000000);
  int v9 = 200;
  int v10 = a3 | v8;
  do
  {
    IODelay(0x32uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, &readData);
    __dmb(1u);
    int v11 = readData;
    if ((readData & 0x20000000) != 0)
    {
      if ((readData & 0x8000000) == 0) {
        return (v11 >> 31) & 0xFFFFFFFE;
      }
      uint32_t v12 = readData & 0xFF00;
      int v11 = v12 | v10;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1028uLL, v12 | v10);
    }
    --v9;
  }
  while (v9);
  if ((v11 & 0x20000000) == 0) {
    return 4294967294;
  }
  return (v11 >> 31) & 0xFFFFFFFE;
}

uint64_t e1000_read_phy_reg_m88(uint64_t a1, char a2, _WORD *a3)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 896);
  if (!v3) {
    return 0;
  }
  uint64_t result = v3();
  if (!result)
  {
    uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2 & 0x1F, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return phy_reg_mdic;
  }
  return result;
}

uint64_t e1000_write_phy_reg_m88(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 896);
  if (!v3) {
    return 0;
  }
  uint64_t result = v3();
  if (!result)
  {
    uint64_t v8 = e1000_write_phy_reg_mdic(a1, a2 & 0x1F, a3);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return v8;
  }
  return result;
}

uint64_t e1000_set_page_igp(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1100) = 1;
  return e1000_write_phy_reg_mdic(a1, 0x1Fu, a2);
}

uint64_t e1000_read_phy_reg_igp(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return sub_10000E368(a1, a2, a3, 0);
}

uint64_t sub_10000E368(uint64_t a1, unsigned int a2, _WORD *a3, char a4)
{
  if (a4) {
    goto LABEL_14;
  }
  int v9 = *(uint64_t (**)(uint64_t))(a1 + 896);
  if (!v9) {
    return 0;
  }
  uint64_t phy_reg_mdic = v9(a1);
  if (!phy_reg_mdic)
  {
LABEL_14:
    if (a2 < 0x10 || (uint64_t phy_reg_mdic = e1000_write_phy_reg_mdic(a1, 0x1Fu, (unsigned __int16)a2), !phy_reg_mdic)) {
      uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    if ((a4 & 1) == 0) {
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
    }
  }
  return phy_reg_mdic;
}

uint64_t e1000_read_phy_reg_igp_locked(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return sub_10000E368(a1, a2, a3, 1);
}

uint64_t e1000_write_phy_reg_igp(uint64_t a1, unsigned int a2, int a3)
{
  return sub_10000E42C(a1, a2, a3, 0);
}

uint64_t sub_10000E42C(uint64_t a1, unsigned int a2, int a3, char a4)
{
  if (a4) {
    goto LABEL_14;
  }
  int v9 = *(uint64_t (**)(uint64_t))(a1 + 896);
  if (!v9) {
    return 0;
  }
  uint64_t v8 = v9(a1);
  if (!v8)
  {
LABEL_14:
    if (a2 < 0x10 || (uint64_t v8 = e1000_write_phy_reg_mdic(a1, 0x1Fu, (unsigned __int16)a2), !v8)) {
      uint64_t v8 = e1000_write_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    if ((a4 & 1) == 0) {
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
    }
  }
  return v8;
}

uint64_t e1000_write_phy_reg_igp_locked(uint64_t a1, unsigned int a2, int a3)
{
  return sub_10000E42C(a1, a2, a3, 1);
}

uint64_t e1000_read_kmrn_reg_generic(uint64_t a1, char a2, _WORD *a3)
{
  return sub_10000E4F0(a1, a2, a3, 0);
}

uint64_t sub_10000E4F0(uint64_t a1, char a2, _WORD *a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t))(a1 + 896);
    if (!v8) {
      return 0;
    }
    uint64_t result = v8(a1);
    if (result) {
      return result;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, ((a2 & 0x1F) << 16) | 0x200000);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(2uLL);
  uint32_t v10 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, &v10);
  uint64_t result = 0;
  __dmb(1u);
  *a3 = v10;
  if (a4) {
    return result;
  }
  (*(void (**)(uint64_t))(a1 + 1000))(a1);
  return 0;
}

uint64_t e1000_read_kmrn_reg_locked(uint64_t a1, char a2, _WORD *a3)
{
  return sub_10000E4F0(a1, a2, a3, 1);
}

uint64_t e1000_write_kmrn_reg_generic(uint64_t a1, char a2, int a3)
{
  return sub_10000E5D8(a1, a2, a3, 0);
}

uint64_t sub_10000E5D8(uint64_t a1, char a2, int a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t))(a1 + 896);
    if (!v8) {
      return 0;
    }
    uint64_t result = v8(a1);
    if (result) {
      return result;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, a3 & 0xFFE0FFFF | ((a2 & 0x1F) << 16));
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(2uLL);
  uint64_t result = 0;
  if (a4) {
    return result;
  }
  (*(void (**)(uint64_t))(a1 + 1000))(a1);
  return 0;
}

uint64_t e1000_write_kmrn_reg_locked(uint64_t a1, char a2, int a3)
{
  return sub_10000E5D8(a1, a2, a3, 1);
}

uint64_t e1000_copper_link_setup_82577(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1134)) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 1072) != 13 || (uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1008))(a1), !result))
  {
    __int16 v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 22, &v6);
    if (!result)
    {
      unsigned __int16 v3 = (*(_DWORD *)(a1 + 1072) - 11) >= 2 ? v6 | 0x8000 : v6;
      __int16 v6 = v3 | 0xC00;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, v3 | 0xC00u);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 18, &v6);
        if (!result)
        {
          unsigned __int16 v4 = v6 & 0xF9FF;
          v6 &= 0xF9FFu;
          int v5 = *(unsigned __int8 *)(a1 + 1130);
          if (v5 != 1)
          {
            if (v5 == 2) {
              v4 |= 0x200u;
            }
            else {
              v4 |= 0x400u;
            }
            __int16 v6 = v4;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 18, v4);
          if (!result) {
            return sub_10000E7B8(a1);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000E7B8(uint64_t a1)
{
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 9, &v6);
  if (!result)
  {
    unsigned __int16 v3 = v6;
    if ((v6 & 0x800) != 0) {
      int v4 = 1;
    }
    else {
      int v4 = 2;
    }
    if ((v6 & 0x1000) == 0) {
      int v4 = 3;
    }
    *(_DWORD *)(a1 + 1088) = v4;
    int v5 = *(_DWORD *)(a1 + 1084);
    switch(v5)
    {
      case 3:
        v3 &= ~0x1000u;
        break;
      case 2:
        unsigned __int16 v3 = v3 & 0xE7FF | 0x1000;
        break;
      case 1:
        v3 |= 0x1800u;
        break;
      default:
        return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 9, v3);
    }
    unsigned __int16 v6 = v3;
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 9, v3);
  }
  return result;
}

uint64_t e1000_copper_link_setup_m88(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1134)) {
    return 0;
  }
  unsigned __int16 v13 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v13);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 1072);
    __int16 v4 = v13;
    if (v3 != 8) {
      __int16 v4 = v13 | 0x800;
    }
    __int16 v5 = v4 & 0xFF9F;
    int v6 = *(unsigned __int8 *)(a1 + 1130);
    __int16 v7 = v4 & 0xFF9F | 0x40;
    __int16 v8 = v4 | 0x60;
    if (v6 == 2) {
      __int16 v8 = v5 | 0x20;
    }
    if (v6 == 3) {
      __int16 v8 = v7;
    }
    if (v6 != 1) {
      __int16 v5 = v8;
    }
    unsigned __int16 v9 = v5 & 0xFFFD;
    unsigned __int16 v13 = v5 & 0xFFFD;
    if (*(unsigned char *)(a1 + 1131))
    {
      unsigned __int16 v9 = v5 | 2;
      unsigned __int16 v13 = v5 | 2;
    }
    if (v3 == 8)
    {
      if (*(_DWORD *)(a1 + 1104) == 21040305)
      {
        unsigned __int16 v13 = v9 & 0xF7FF;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
        if (result) {
          return result;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
        if (result) {
          return result;
        }
        unsigned __int16 v9 = v13;
      }
      v9 |= 0x800u;
      unsigned __int16 v13 = v9;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 16, v9);
    if (result) {
      return result;
    }
    int v10 = *(_DWORD *)(a1 + 1072);
    if (v10 == 2)
    {
      if (*(_DWORD *)(a1 + 1112) > 3u || *(_DWORD *)(a1 + 1104) == 21040305)
      {
LABEL_35:
        uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
        if (!result)
        {
          if (*(_DWORD *)(a1 + 1072) != 9) {
            return 0;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 20, &v13);
          if (!result)
          {
            unsigned __int16 v13 = v13 & 0xFFC3 | 0x20;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 20, v13);
            if (!result) {
              return 0;
            }
          }
        }
        return result;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 20, &v13);
      if (result) {
        return result;
      }
      if (*(_DWORD *)(a1 + 1112) == 2 && *(_DWORD *)(a1 + 1104) == 21040320)
      {
        __int16 v11 = 2048;
        __int16 v12 = -3585;
      }
      else
      {
        __int16 v11 = 256;
        __int16 v12 = -3841;
      }
      unsigned __int16 v13 = (v13 | 0x70) & v12 | v11;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 20);
      if (result) {
        return result;
      }
      int v10 = *(_DWORD *)(a1 + 1072);
    }
    if (v10 == 8 && *(_DWORD *)(a1 + 1104) == 21040305)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 3);
      if (result) {
        return result;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 30, 0);
      if (result) {
        return result;
      }
    }
    goto LABEL_35;
  }
  return result;
}

uint64_t e1000_copper_link_setup_m88_gen2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1134)) {
    return 0;
  }
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v6);
  if (result) {
    return result;
  }
  __int16 v3 = v6 & 0xFF9F;
  int v4 = *(unsigned __int8 *)(a1 + 1130);
  if (v4 != 1)
  {
    if (v4 == 3)
    {
      if (*(_DWORD *)(a1 + 1104) != 21040272)
      {
        v3 |= 0x40u;
        goto LABEL_12;
      }
    }
    else if (v4 == 2)
    {
      v3 |= 0x20u;
      goto LABEL_12;
    }
    __int16 v3 = v6 | 0x60;
  }
LABEL_12:
  __int16 v5 = v3 & 0xFFFD | (2 * *(unsigned __int8 *)(a1 + 1131));
  if (*(_DWORD *)(a1 + 1104) == 21040800)
  {
    unsigned __int16 v6 = v5 & 0xF7FF;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
    if (result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
    if (result) {
      return result;
    }
    __int16 v5 = v6;
  }
  unsigned __int16 v6 = v5 & 0x87FF | 0x5800;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 16, v6);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
    if (!result) {
      return sub_10000E7B8(a1);
    }
  }
  return result;
}

uint64_t e1000_copper_link_setup_igp(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1134)) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void))(a1 + 1008))();
  if (!result)
  {
    IODelay(0x186A0uLL);
    if (*(_DWORD *)(a1 + 1072) != 3
      || (uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1024))(a1, 0), !result))
    {
      __int16 v3 = *(uint64_t (**)(uint64_t, void))(a1 + 1016);
      if (!v3 || (uint64_t result = v3(a1, 0), !result))
      {
        unsigned __int16 v6 = 0;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 18, &v6);
        if (!result)
        {
          int v4 = *(unsigned __int8 *)(a1 + 1130);
          if (v4 == 2) {
            unsigned __int16 v5 = v6 & 0xCFFF | 0x2000;
          }
          else {
            unsigned __int16 v5 = v4 == 1 ? v6 & 0xCFFF : v6 | 0x1000;
          }
          unsigned __int16 v6 = v5;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 18, v5);
          if (!result)
          {
            if (!*(unsigned char *)(a1 + 851)) {
              return 0;
            }
            if (*(_WORD *)(a1 + 1120) != 32) {
              return sub_10000E7B8(a1);
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v6);
            if (!result)
            {
              v6 &= ~0x80u;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
              if (!result)
              {
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 9, &v6);
                if (!result)
                {
                  v6 &= ~0x1000u;
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 9);
                  if (!result) {
                    return sub_10000E7B8(a1);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_phy_setup_autoneg(uint64_t a1)
{
  int v9 = 0;
  unsigned __int16 v8 = 0;
  *(_WORD *)(a1 + 1120) &= *(_WORD *)(a1 + 1122);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 4, (char *)&v9 + 2);
  if (!result)
  {
    __int16 v3 = *(_WORD *)(a1 + 1122);
    if ((v3 & 0x20) != 0)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 9, &v9);
      if (result) {
        return result;
      }
      __int16 v3 = *(_WORD *)(a1 + 1122);
    }
    if ((v3 & 0x80) == 0
      || *(_DWORD *)(a1 + 1104) != 1741282304
      || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 458784, &v8),
          !result))
    {
      __int16 v4 = v9 & 0xFCFF;
      LOWORD(v9) = v9 & 0xFCFF;
      __int16 v5 = *(_WORD *)(a1 + 1120);
      if ((v5 & 0x20) != 0) {
        LOWORD(v9) = v4 | 0x200;
      }
      unsigned __int16 v8 = v8 & 0xFF7F | v5 & 0x80;
      switch(*(_DWORD *)(a1 + 880))
      {
        case 0:
          unsigned __int16 v6 = HIWORD(v9) & 0xF21F | (32 * (v5 & 0xF)) & 0xF3FF;
          goto LABEL_16;
        case 1:
        case 3:
          unsigned __int16 v6 = HIWORD(v9) & 0xFE1F | (32 * (v5 & 0xF)) | 0xC00;
          goto LABEL_16;
        case 2:
          unsigned __int16 v6 = HIWORD(v9) & 0xF21F | (32 * (v5 & 0xF)) & 0xF3FF | 0x800;
LABEL_16:
          HIWORD(v9) = v6;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 4, v6);
          if (!result)
          {
            __int16 v7 = *(_WORD *)(a1 + 1122);
            if ((v7 & 0x20) != 0)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 9, (unsigned __int16)v9);
              __int16 v7 = *(_WORD *)(a1 + 1122);
            }
            else
            {
              uint64_t result = 0;
            }
            if ((v7 & 0x80) != 0 && *(_DWORD *)(a1 + 1104) == 1741282304) {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 458784, v8);
            }
          }
          break;
        default:
          uint64_t result = 4294967293;
          break;
      }
    }
  }
  return result;
}

uint64_t e1000_copper_link_autoneg(uint64_t a1)
{
  unsigned __int16 v2 = *(_WORD *)(a1 + 1122);
  if ((*(_WORD *)(a1 + 1120) & v2) != 0) {
    v2 &= *(_WORD *)(a1 + 1120);
  }
  *(_WORD *)(a1 + 1120) = v2;
  uint64_t result = e1000_phy_setup_autoneg(a1);
  if (!result)
  {
    __int16 v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 976))(a1, 0, &v5);
    if (!result)
    {
      v5 |= 0x1200u;
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1032))(a1, 0);
      if (!result)
      {
        if (*(unsigned char *)(a1 + 1136) && *(void *)(a1 + 976))
        {
          __int16 v6 = 0;
          int v4 = 45;
          while (1)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v6);
            if (result) {
              break;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v6);
            if (result) {
              break;
            }
            if ((v6 & 0x20) == 0)
            {
              IODelay(0x186A0uLL);
              if ((_WORD)--v4) {
                continue;
              }
            }
            goto LABEL_13;
          }
        }
        else
        {
LABEL_13:
          uint64_t result = 0;
          *(unsigned char *)(a1 + 853) = 1;
        }
      }
    }
  }
  return result;
}

uint64_t e1000_setup_copper_link_generic(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 851))
  {
    uint64_t result = e1000_copper_link_autoneg(a1);
    if (result) {
      return result;
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 936))(a1);
    if (result) {
      return result;
    }
  }
  BOOL v3 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 0xAu, 0xAu, &v3);
  if (!result)
  {
    if (v3)
    {
      (*(void (**)(uint64_t))(a1 + 224))(a1);
      return e1000_config_fc_after_link_up_generic(a1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t e1000_phy_has_link_generic(uint64_t a1, unsigned int a2, unsigned int a3, BOOL *a4)
{
  if (!*(void *)(a1 + 976)) {
    return 0;
  }
  if (a2)
  {
    int v7 = 0;
    __int16 v11 = 0;
    if (a3 <= 0x3E7) {
      uint64_t v8 = a3;
    }
    else {
      uint64_t v8 = 1000 * (a3 / 0x3E8);
    }
    BOOL v9 = 1;
    while (1)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v11)) {
        IODelay(v8);
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 1, &v11);
      if (result) {
        break;
      }
      if ((v11 & 4) == 0)
      {
        IODelay(v8);
        BOOL v9 = ++v7 < a2;
        if (a2 != v7) {
          continue;
        }
      }
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v9 = 0;
LABEL_15:
    uint64_t result = 0;
  }
  *a4 = v9;
  return result;
}

uint64_t e1000_phy_force_speed_duplex_igp(uint64_t a1)
{
  unsigned __int16 v4 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v4);
  if (!result)
  {
    e1000_phy_force_speed_duplex_setup(a1, &v4);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 1032))(a1, 0, v4);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 18, &v4);
      if (!result)
      {
        v4 &= 0xCFFFu;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 18);
        if (!result)
        {
          IODelay(1uLL);
          if (*(unsigned char *)(a1 + 1136))
          {
            uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
            if (!result) {
              return e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void e1000_phy_force_speed_duplex_setup(uint64_t a1, _WORD *a2)
{
  *(_DWORD *)(a1 + 880) = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  __int16 v4 = *a2 & 0xCEBF;
  if ((*(unsigned char *)(a1 + 846) & 5) != 0)
  {
    int v5 = 6144;
  }
  else
  {
    v4 |= 0x100u;
    int v5 = 6145;
  }
  if ((*(unsigned char *)(a1 + 846) & 0xC) != 0)
  {
    v4 |= 0x2000u;
    uint32_t v6 = readData & 0xFFFFE4DE | v5 | 0x100;
  }
  else
  {
    uint32_t v6 = readData & 0xFFFFE4DE | v5;
  }
  *a2 = v4;
  (*(void (**)(uint64_t))(a1 + 224))(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v6);
}

uint64_t e1000_phy_force_speed_duplex_m88(uint64_t a1)
{
  unsigned __int16 v9 = 0;
  if (*(_DWORD *)(a1 + 1072) != 15)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v9);
    if (result) {
      return result;
    }
    v9 &= 0xFF9Fu;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
    if (result) {
      return result;
    }
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v9);
  if (result) {
    return result;
  }
  e1000_phy_force_speed_duplex_setup(a1, &v9);
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 1032))(a1, 0, v9);
  if (result) {
    return result;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
  if (result) {
    return result;
  }
  if (*(unsigned char *)(a1 + 1136))
  {
    BOOL v8 = 0;
    uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v8);
    if (result) {
      return result;
    }
    if (v8)
    {
LABEL_8:
      uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v8);
      if (result) {
        return result;
      }
      goto LABEL_9;
    }
    int v5 = *(_DWORD *)(a1 + 1104);
    if (v5 <= 21040575)
    {
      if (v5 == 21040128) {
        goto LABEL_8;
      }
      int v6 = 21040272;
    }
    else
    {
      if ((v5 - 21040576) <= 0x30 && ((1 << (v5 + 64)) & 0x1000000010001) != 0
        || v5 == 21040800)
      {
        goto LABEL_8;
      }
      int v6 = 1741282304;
    }
    if (v5 != v6 && *(_DWORD *)(a1 + 1072) == 2)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 29);
      if (result) {
        return result;
      }
      int v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032);
      if (v7)
      {
        uint64_t result = v7(a1, 30, 193);
        if (result) {
          return result;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 30, 0);
        if (result) {
          return result;
        }
      }
    }
    goto LABEL_8;
  }
LABEL_9:
  if (*(_DWORD *)(a1 + 1072) != 2) {
    return 0;
  }
  uint64_t result = 0;
  int v3 = *(_DWORD *)(a1 + 1104);
  if (v3 <= 21040575)
  {
    if (v3 == 21040128) {
      return result;
    }
    int v4 = 21040272;
    goto LABEL_26;
  }
  if (((v3 - 21040576) > 0x30 || ((1 << (v3 + 64)) & 0x1000000010001) == 0)
    && v3 != 21040800)
  {
    int v4 = 1741282304;
LABEL_26:
    if (v3 != v4)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 20, &v9);
      if (!result)
      {
        v9 |= 0x70u;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 20);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v9);
          if (!result)
          {
            v9 |= 0x800u;
            return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_phy_force_speed_duplex_ife(uint64_t a1)
{
  unsigned __int16 v4 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v4);
  if (!result)
  {
    e1000_phy_force_speed_duplex_setup(a1, &v4);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 1032))(a1, 0, v4);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 28, &v4);
      if (!result)
      {
        v4 &= 0xFF3Fu;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 28);
        if (!result)
        {
          IODelay(1uLL);
          if (!*(unsigned char *)(a1 + 1136)) {
            return 0;
          }
          uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
          if (!result)
          {
            uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
            if (!result) {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_set_d3_lplu_state_generic(uint64_t a1, char a2)
{
  unsigned __int16 v2 = *(uint64_t (**)(void))(a1 + 976);
  if (!v2) {
    return 0;
  }
  __int16 v12 = 0;
  uint64_t result = v2();
  if (result) {
    return result;
  }
  if (a2)
  {
    unsigned int v6 = *(unsigned __int16 *)(a1 + 1120);
    BOOL v7 = v6 > 0x2F;
    uint64_t v8 = (1 << v6) & 0x800000008008;
    if (!v7 && v8 != 0)
    {
      v12 |= 4u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
      if (result) {
        return result;
      }
LABEL_17:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v12);
      if (!result)
      {
        __int16 v11 = v12 & 0xFF7F;
        goto LABEL_19;
      }
      return result;
    }
    return 0;
  }
  v12 &= ~4u;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
  if (result) {
    return result;
  }
  int v10 = *(_DWORD *)(a1 + 1096);
  if (v10 == 2) {
    goto LABEL_17;
  }
  if (v10 != 1) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v12);
  if (!result)
  {
    __int16 v11 = v12 | 0x80;
LABEL_19:
    __int16 v12 = v11;
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
  }
  return result;
}

uint64_t e1000_check_downshift_generic(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1072) - 2;
  if v2 < 0xE && ((0x20DFu >> v2))
  {
    uint64_t v4 = dword_100034098[v2];
    int v5 = dword_1000340D0[v2];
    __int16 v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, v4, &v6);
    if (!result) {
      *(unsigned char *)(a1 + 1135) = (unsigned __int16)(v5 & v6) != 0;
    }
  }
  else
  {
    uint64_t result = 0;
    *(unsigned char *)(a1 + 1135) = 0;
  }
  return result;
}

uint64_t e1000_check_polarity_m88(uint64_t a1)
{
  unsigned __int16 v3 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v3);
  if (!result) {
    *(_DWORD *)(a1 + 1092) = (v3 >> 1) & 1;
  }
  return result;
}

uint64_t e1000_check_polarity_igp(uint64_t a1)
{
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v6);
  if (!result)
  {
    unsigned int v3 = v6 >> 14;
    uint64_t v4 = v3 <= 2 ? 17 : 180;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, v4, &v6);
    if (!result)
    {
      if (v3 <= 2) {
        __int16 v5 = 2;
      }
      else {
        __int16 v5 = 120;
      }
      *(_DWORD *)(a1 + 1092) = (unsigned __int16)(v5 & v6) != 0;
    }
  }
  return result;
}

uint64_t e1000_check_polarity_ife(uint64_t a1)
{
  __int16 v6 = 0;
  int v2 = *(unsigned __int8 *)(a1 + 1133);
  if (*(unsigned char *)(a1 + 1133)) {
    uint64_t v3 = 16;
  }
  else {
    uint64_t v3 = 17;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, v3, &v6);
  if (!result)
  {
    if (v2) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 32;
    }
    *(_DWORD *)(a1 + 1092) = (unsigned __int16)(v5 & v6) != 0;
  }
  return result;
}

uint64_t e1000_get_cable_length_m88(uint64_t a1)
{
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v6);
  if (!result)
  {
    unint64_t v3 = ((unint64_t)v6 >> 7) & 7;
    if (v3 <= 5)
    {
      uint64_t result = 0;
      int v4 = word_100033FA0[v3];
      *(_WORD *)(a1 + 1128) = v4;
      int v5 = word_100033FA0[(v3 + 1)];
      *(_WORD *)(a1 + 1126) = v5;
      *(_WORD *)(a1 + 1124) = (v5 + v4) >> 1;
    }
    else
    {
      return 4294967294;
    }
  }
  return result;
}

uint64_t e1000_get_cable_length_m88_gen2(uint64_t a1)
{
  int v14 = 0;
  unsigned __int16 v13 = 0;
  int v2 = *(_DWORD *)(a1 + 1104);
  uint64_t result = 4294967294;
  if (v2 <= 21040575)
  {
    if (v2 == 21040128)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void, char *))(a1 + 976))(a1, (*(_DWORD *)(a1 + 1100) + 458768), (char *)&v14 + 2);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 458773, &v14);
        if (!result)
        {
          if ((v14 & 0x400) != 0) {
            unsigned int v9 = 1;
          }
          else {
            unsigned int v9 = 100;
          }
          unsigned int v10 = HIWORD(v14) / v9;
          *(_WORD *)(a1 + 1128) = v10;
          *(_WORD *)(a1 + 1126) = v10;
          *(_WORD *)(a1 + 1124) = v10;
          return 0;
        }
      }
    }
    else if (v2 == 21040272)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 22, &v13);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 5);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 26, (char *)&v14 + 2);
          if (!result)
          {
            unint64_t v8 = ((unint64_t)HIWORD(v14) >> 7) & 7;
            if (v8 > 5) {
              return 4294967294;
            }
            int v11 = word_100033FA0[v8];
            *(_WORD *)(a1 + 1128) = v11;
            int v12 = word_100033FA0[(v8 + 1)];
            *(_WORD *)(a1 + 1126) = v12;
            unsigned int v7 = (v12 + v11) >> 1;
LABEL_34:
            *(_WORD *)(a1 + 1124) = v7;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 22, v13);
            if (result) {
              return result;
            }
            return 0;
          }
        }
      }
    }
  }
  else
  {
    if (((v2 - 21040576) > 0x30 || ((1 << (v2 + 64)) & 0x1000000010001) == 0)
      && v2 != 21040800)
    {
      if (v2 != 1741282304) {
        return result;
      }
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 22, &v13);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 22, 7);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, char *))(a1 + 976))(a1, (*(_DWORD *)(a1 + 1100) + 16), (char *)&v14 + 2);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 21, &v14);
          if (!result)
          {
            if ((v14 & 0x400) != 0) {
              unsigned int v6 = 1;
            }
            else {
              unsigned int v6 = 100;
            }
            unsigned int v7 = HIWORD(v14) / v6;
            *(_WORD *)(a1 + 1128) = v7;
            *(_WORD *)(a1 + 1126) = v7;
            goto LABEL_34;
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_get_cable_length_igp_2(uint64_t a1)
{
  uint64_t v2 = 0;
  unsigned __int16 v3 = 0;
  __int16 v4 = 0;
  unsigned __int16 v12 = 0;
  unsigned __int16 v5 = 112;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, (unsigned __int16)word_100033FAE[v2], &v12);
    if (result) {
      break;
    }
    if ((unsigned __int16)(v12 + 7680) < 0x2000u) {
      return 4294967294;
    }
    ++v2;
    unsigned int v7 = word_100033FB6[v12 >> 9];
    if (word_100033FB6[v5] > v7) {
      unsigned __int16 v5 = v12 >> 9;
    }
    if (word_100033FB6[v3] < v7) {
      unsigned __int16 v3 = v12 >> 9;
    }
    v4 += v7;
    if (v2 == 4)
    {
      uint64_t result = 0;
      unsigned int v8 = (unsigned __int16)(v4 - (word_100033FB6[v5] + word_100033FB6[v3])) >> 1;
      if (v8 <= 0xF) {
        __int16 v9 = 15;
      }
      else {
        __int16 v9 = v8;
      }
      unsigned __int16 v10 = v9 - 15;
      *(_WORD *)(a1 + 1128) = v10;
      unsigned int v11 = v8 + 15;
      *(_WORD *)(a1 + 1126) = v11;
      *(_WORD *)(a1 + 1124) = (v11 + v10) >> 1;
      return result;
    }
  }
  return result;
}

uint64_t e1000_get_phy_info_m88(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) != 1) {
    return 4294967293;
  }
  unsigned __int16 v5 = 0;
  BOOL v4 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v4);
  if (result) {
    return result;
  }
  if (!v4) {
    return 4294967293;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v5);
  if (!result)
  {
    *(unsigned char *)(a1 + 1133) = (v5 & 2) != 0;
    unsigned __int16 v6 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v6);
    if (!result)
    {
      *(_DWORD *)(a1 + 1092) = (v6 >> 1) & 1;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v5);
      if (!result)
      {
        unsigned __int16 v3 = v5;
        *(unsigned char *)(a1 + 1132) = (v5 & 0x40) != 0;
        if ((v3 & 0xC000) == 0x8000)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 952))(a1);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 10, &v5);
            if (!result) {
              *(void *)(a1 + 1076) = *(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)0xFFFFFFF4FFFFFFF3) & 0xFFFFFFF1FFFFFFF1;
            }
          }
        }
        else
        {
          uint64_t result = 0;
          *(_WORD *)(a1 + 1124) = 255;
          *(void *)(a1 + 1076) = 0xFF000000FFLL;
        }
      }
    }
  }
  return result;
}

uint64_t e1000_get_phy_info_igp(uint64_t a1)
{
  unsigned __int16 v7 = 0;
  BOOL v6 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v6);
  if (!result)
  {
    if (!v6) {
      return 4294967293;
    }
    *(unsigned char *)(a1 + 1133) = 1;
    uint64_t result = e1000_check_polarity_igp(a1);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v7);
      if (!result)
      {
        unsigned int v3 = v7;
        *(unsigned char *)(a1 + 1132) = (v7 & 0x800) != 0;
        if (v3 < 0xC000)
        {
          int v5 = 255;
          *(_WORD *)(a1 + 1124) = 255;
          *(_DWORD *)(a1 + 1076) = 255;
          goto LABEL_12;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 952))(a1);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 10, &v7);
          if (!result)
          {
            unsigned int v4 = v7;
            *(_DWORD *)(a1 + 1076) = (v7 >> 13) & 1;
            int v5 = (v4 >> 12) & 1;
LABEL_12:
            uint64_t result = 0;
            *(_DWORD *)(a1 + 1080) = v5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t e1000_get_phy_info_ife(uint64_t a1)
{
  unsigned __int16 v5 = 0;
  BOOL v4 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v4);
  if (!result)
  {
    if (!v4) {
      return 4294967293;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v5);
    if (!result)
    {
      unsigned int v3 = v5;
      *(unsigned char *)(a1 + 1133) = (v5 & 0x10) == 0;
      if ((v3 & 0x10) != 0)
      {
        *(_DWORD *)(a1 + 1092) = (v3 >> 5) & 1;
      }
      else
      {
        uint64_t result = e1000_check_polarity_ife(a1);
        if (result) {
          return result;
        }
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 28, &v5);
      if (!result)
      {
        *(unsigned char *)(a1 + 1132) = (v5 & 0x20) != 0;
        *(_WORD *)(a1 + 1124) = 255;
        *(void *)(a1 + 1076) = 0xFF000000FFLL;
      }
    }
  }
  return result;
}

uint64_t e1000_phy_sw_reset_generic(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 976);
  if (!v1) {
    return 0;
  }
  __int16 v4 = 0;
  uint64_t result = v1();
  if (!result)
  {
    v4 |= 0x8000u;
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1032))(a1, 0);
    if (!result)
    {
      IODelay(1uLL);
      return 0;
    }
  }
  return result;
}

uint64_t e1000_phy_hw_reset_generic(uint64_t a1)
{
  uint64_t v2 = *(unsigned int (**)(uint64_t))(a1 + 920);
  if (v2 && v2(a1)) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (!result)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v4 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4 | 0x80000000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(*(unsigned int *)(a1 + 1108));
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x64uLL);
    int v5 = -9999;
    do
    {
      int v6 = v5;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
      __dmb(1u);
      __int16 v7 = readData;
      IODelay(1uLL);
      if ((v7 & 0x100) != 0) {
        break;
      }
      int v5 = v6 + 1;
    }
    while (v6);
    IODelay(0x64uLL);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    return (*(uint64_t (**)(uint64_t))(a1 + 944))(a1);
  }
  return result;
}

uint64_t e1000_get_cfg_done_generic()
{
  return 0;
}

uint64_t e1000_phy_init_script_igp3(uint64_t a1)
{
  return 0;
}

uint64_t e1000_get_phy_type_from_id(int a1)
{
  uint64_t result = 2;
  if (a1 > 21040799)
  {
    if (a1 <= 44565263)
    {
      if (a1 <= 22282383)
      {
        if (a1 != 21040800)
        {
          if (a1 == 22282320) {
            return 10;
          }
          return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 22282384:
          return 11;
        case 22282400:
          return 12;
        case 22283168:
          return 13;
      }
    }
    else if (a1 > 44565375)
    {
      switch(a1)
      {
        case 1741282304:
          return 16;
        case 44565392:
          return 6;
        case 44565376:
          return 4;
      }
    }
    else
    {
      unsigned int v3 = a1 - 44565264;
      if (v3 <= 0x20 && ((1 << v3) & 0x100010001) != 0) {
        return 7;
      }
    }
    return 0;
  }
  if (a1 > 21040303)
  {
    if ((a1 - 21040576) <= 0x30 && ((1 << (a1 + 64)) & 0x1000000010001) != 0) {
      return result;
    }
    if ((a1 - 21040304) < 2) {
      return 8;
    }
    if (a1 == 21040320) {
      return result;
    }
    return 0;
  }
  if (a1 <= 21040159)
  {
    if (a1 == 5099584) {
      return 9;
    }
    if (a1 == 21040128) {
      return 15;
    }
    return 0;
  }
  if (((a1 - 21040160) > 0x30 || ((1 << (a1 - 32)) & 0x1000000010001) == 0)
    && a1 != 21040272)
  {
    if (a1 == 21040288) {
      return 5;
    }
    return 0;
  }
  return result;
}

uint64_t e1000_determine_phy_address(uint64_t a1)
{
  int v2 = 0;
  *(_DWORD *)(a1 + 1104) = 0;
  while (2)
  {
    *(_DWORD *)(a1 + 1100) = v2;
    int v3 = 10;
    do
    {
      e1000_get_phy_id(a1);
      if (e1000_get_phy_type_from_id(*(_DWORD *)(a1 + 1104))) {
        return 0;
      }
      IODelay(0x3E8uLL);
      --v3;
    }
    while (v3);
    if (++v2 != 8) {
      continue;
    }
    break;
  }
  return 4294967290;
}

uint64_t e1000_write_phy_reg_bm(uint64_t a1, unsigned int a2, int a3)
{
  __int16 v14 = a3;
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 896))();
  if (!v6)
  {
    if (a2 >> 5 == 800)
    {
      uint64_t v7 = e1000_access_phy_wakeup_reg_bm(a1, a2, &v14, 0, 0);
    }
    else
    {
      if (a2 >> 13 > 2 || a2 == 31 || a2 == 25)
      {
        int v8 = 1;
        int v9 = 1;
      }
      else
      {
        int v8 = 0;
        int v9 = 2;
      }
      *(_DWORD *)(a1 + 1100) = v9;
      if (a2 >= 0x10)
      {
        BOOL v10 = v8 == 0;
        char v11 = v8 ? 5 : 0;
        unsigned int v12 = v10 ? 22 : 31;
        uint64_t v6 = e1000_write_phy_reg_mdic(a1, v12, (unsigned __int16)(a2 >> 5 << v11));
        if (v6) {
          goto LABEL_18;
        }
      }
      uint64_t v7 = e1000_write_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    uint64_t v6 = v7;
LABEL_18:
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v6;
}

uint64_t e1000_access_phy_wakeup_reg_bm(uint64_t a1, unsigned int a2, _WORD *a3, int a4, char a5)
{
  unsigned __int16 v12 = 0;
  if (*(_DWORD *)(a1 + 284) == 22)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
    __dmb(1u);
  }
  if ((a5 & 1) != 0 || (uint64_t result = e1000_enable_phy_wakeup_reg_access_bm(a1, &v12), !result))
  {
    uint64_t result = e1000_write_phy_reg_mdic(a1, 0x11u, a2 & 0x1F | (32 * (a2 >> 21)));
    if (!result)
    {
      if (a4)
      {
        uint64_t result = e1000_read_phy_reg_mdic(a1, 0x12u, a3);
        if (result) {
          return result;
        }
      }
      else
      {
        uint64_t result = e1000_write_phy_reg_mdic(a1, 0x12u, (unsigned __int16)*a3);
        if (result) {
          return result;
        }
      }
      if ((a5 & 1) == 0) {
        return e1000_disable_phy_wakeup_reg_access_bm(a1, &v12);
      }
    }
  }
  return result;
}

uint64_t e1000_read_phy_reg_bm(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 896))();
  if (!v6)
  {
    if (a2 >> 5 == 800)
    {
      uint64_t phy_reg_mdic = e1000_access_phy_wakeup_reg_bm(a1, a2, a3, 1, 0);
    }
    else
    {
      if (a2 >> 13 > 2 || a2 == 31 || a2 == 25)
      {
        int v8 = 1;
        int v9 = 1;
      }
      else
      {
        int v8 = 0;
        int v9 = 2;
      }
      *(_DWORD *)(a1 + 1100) = v9;
      if (a2 >= 0x10)
      {
        BOOL v10 = v8 == 0;
        char v11 = v8 ? 5 : 0;
        unsigned int v12 = v10 ? 22 : 31;
        uint64_t v6 = e1000_write_phy_reg_mdic(a1, v12, (unsigned __int16)(a2 >> 5 << v11));
        if (v6) {
          goto LABEL_18;
        }
      }
      uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    uint64_t v6 = phy_reg_mdic;
LABEL_18:
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v6;
}

uint64_t e1000_read_phy_reg_bm2(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 896))();
  if (!v6)
  {
    if ((a2 & 0x1FFFE0) == 0x6400)
    {
      uint64_t phy_reg_mdic = e1000_access_phy_wakeup_reg_bm(a1, a2, a3, 1, 0);
    }
    else
    {
      *(_DWORD *)(a1 + 1100) = 1;
      if (a2 >= 0x10)
      {
        uint64_t v6 = e1000_write_phy_reg_mdic(a1, 0x16u, (unsigned __int16)(a2 >> 5));
        if (v6) {
          goto LABEL_8;
        }
      }
      uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    uint64_t v6 = phy_reg_mdic;
LABEL_8:
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v6;
}

uint64_t e1000_write_phy_reg_bm2(uint64_t a1, unsigned int a2, int a3)
{
  __int16 v9 = a3;
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 896))();
  if (!v6)
  {
    if ((a2 & 0x1FFFE0) == 0x6400)
    {
      uint64_t v7 = e1000_access_phy_wakeup_reg_bm(a1, a2, &v9, 0, 0);
    }
    else
    {
      *(_DWORD *)(a1 + 1100) = 1;
      if (a2 >= 0x10)
      {
        uint64_t v6 = e1000_write_phy_reg_mdic(a1, 0x16u, (unsigned __int16)(a2 >> 5));
        if (v6) {
          goto LABEL_8;
        }
      }
      uint64_t v7 = e1000_write_phy_reg_mdic(a1, a2 & 0x1F, a3);
    }
    uint64_t v6 = v7;
LABEL_8:
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v6;
}

uint64_t e1000_enable_phy_wakeup_reg_access_bm(uint64_t a1, _WORD *a2)
{
  if (!a2) {
    return 4294967292;
  }
  *(_DWORD *)(a1 + 1100) = 1;
  uint64_t result = e1000_write_phy_reg_mdic(a1, 0x1Fu, 24608);
  if (!result)
  {
    uint64_t result = e1000_read_phy_reg_mdic(a1, 0x11u, a2);
    if (!result)
    {
      uint64_t result = e1000_write_phy_reg_mdic(a1, 0x11u, *a2 & 0xFFCB | 4u);
      if (!result)
      {
        *(_DWORD *)(a1 + 1100) = 1;
        return e1000_write_phy_reg_mdic(a1, 0x1Fu, 25600);
      }
    }
  }
  return result;
}

uint64_t e1000_disable_phy_wakeup_reg_access_bm(uint64_t a1, unsigned __int16 *a2)
{
  if (!a2) {
    return 4294967292;
  }
  *(_DWORD *)(a1 + 1100) = 1;
  uint64_t result = e1000_write_phy_reg_mdic(a1, 0x1Fu, 24608);
  if (!result)
  {
    int v5 = *a2;
    return e1000_write_phy_reg_mdic(a1, 0x11u, v5);
  }
  return result;
}

void e1000_power_up_phy_copper(uint64_t a1)
{
  __int16 v2 = 0;
  (*(void (**)(uint64_t, void, __int16 *))(a1 + 976))(a1, 0, &v2);
  v2 &= ~0x800u;
  (*(void (**)(uint64_t, void))(a1 + 1032))(a1, 0);
  IODelay(0x12CuLL);
}

void e1000_power_down_phy_copper(uint64_t a1)
{
  __int16 v2 = 0;
  (*(void (**)(uint64_t, void, __int16 *))(a1 + 976))(a1, 0, &v2);
  v2 |= 0x800u;
  (*(void (**)(uint64_t, void))(a1 + 1032))(a1, 0);
  IODelay(0x3E8uLL);
}

uint64_t e1000_read_phy_reg_hv(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return sub_1000110FC(a1, a2, a3, 0, 0);
}

uint64_t sub_1000110FC(uint64_t a1, unsigned int a2, _WORD *a3, char a4, char a5)
{
  unsigned int v10 = (unsigned __int16)(a2 >> 5);
  if (v10 > 0x2FF) {
    int v11 = 1;
  }
  else {
    int v11 = 2;
  }
  *(_DWORD *)(a1 + 1100) = v11;
  if ((a4 & 1) == 0)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (v12) {
      return v12;
    }
  }
  if (v10 == 800)
  {
    uint64_t phy_reg_mdic = e1000_access_phy_wakeup_reg_bm(a1, a2, a3, 1, a5);
  }
  else if (v10 - 1 > 0x2FE)
  {
    if ((a2 & 0x1F | (32 * (a2 >> 21))) >= 0x10 && (a5 & 1) == 0)
    {
      unsigned __int16 v14 = v10 == 768 ? 0 : a2;
      *(_DWORD *)(a1 + 1100) = 1;
      uint64_t v12 = e1000_write_phy_reg_mdic(a1, 0x1Fu, v14 & 0xFFE0);
      *(_DWORD *)(a1 + 1100) = v11;
      if (v12) {
        goto LABEL_18;
      }
    }
    uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, a2 & 0x1F, a3);
  }
  else
  {
    uint64_t phy_reg_mdic = sub_100011DC0(a1, a2, a3, 1);
  }
  uint64_t v12 = phy_reg_mdic;
LABEL_18:
  if ((a4 & 1) == 0) {
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v12;
}

uint64_t e1000_read_phy_reg_hv_locked(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return sub_1000110FC(a1, a2, a3, 1, 0);
}

uint64_t e1000_read_phy_reg_page_hv(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return sub_1000110FC(a1, a2, a3, 1, 1);
}

uint64_t e1000_write_phy_reg_hv(uint64_t a1, unsigned int a2, int a3)
{
  return sub_100011258(a1, a2, a3, 0, 0);
}

uint64_t sub_100011258(uint64_t a1, unsigned int a2, int a3, char a4, char a5)
{
  __int16 v17 = a3;
  unsigned int v10 = (unsigned __int16)(a2 >> 5);
  if (v10 > 0x2FF) {
    int v11 = 1;
  }
  else {
    int v11 = 2;
  }
  *(_DWORD *)(a1 + 1100) = v11;
  if ((a4 & 1) == 0)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (v12) {
      return v12;
    }
  }
  if (v10 == 800)
  {
    uint64_t v13 = e1000_access_phy_wakeup_reg_bm(a1, a2, &v17, 0, a5);
  }
  else if (v10 - 1 > 0x2FE)
  {
    if ((a5 & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 1072) == 9)
      {
        if (*(_DWORD *)(a1 + 1112))
        {
          if ((a3 & 0x800) != 0 && (a2 & 0x1F) == 0 && *(_DWORD *)(a1 + 1100) == 2)
          {
            __int16 v16 = 32511;
            uint64_t v12 = sub_100011DC0(a1, 67, &v16, 0);
            if (v12) {
              goto LABEL_24;
            }
          }
        }
      }
      if ((a2 & 0x1F | (32 * (a2 >> 21))) >= 0x10)
      {
        unsigned __int16 v14 = v10 == 768 ? 0 : a2;
        *(_DWORD *)(a1 + 1100) = 1;
        uint64_t v12 = e1000_write_phy_reg_mdic(a1, 0x1Fu, v14 & 0xFFE0);
        *(_DWORD *)(a1 + 1100) = v11;
        if (v12) {
          goto LABEL_24;
        }
      }
    }
    uint64_t v13 = e1000_write_phy_reg_mdic(a1, a2 & 0x1F, a3);
  }
  else
  {
    uint64_t v13 = sub_100011DC0(a1, a2, &v17, 0);
  }
  uint64_t v12 = v13;
LABEL_24:
  if ((a4 & 1) == 0) {
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v12;
}

uint64_t e1000_write_phy_reg_hv_locked(uint64_t a1, unsigned int a2, int a3)
{
  return sub_100011258(a1, a2, a3, 1, 0);
}

uint64_t e1000_write_phy_reg_page_hv(uint64_t a1, unsigned int a2, int a3)
{
  return sub_100011258(a1, a2, a3, 1, 1);
}

uint64_t e1000_link_stall_workaround_hv(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1072) != 9) {
    return 0;
  }
  unsigned __int16 v3 = 0;
  (*(void (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v3);
  uint64_t result = 0;
  if ((v3 & 0x4000) == 0)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 17, &v3);
    if (!result)
    {
      v3 &= 0xCC00u;
      if (v3 == 35840)
      {
        IODelay(0x30D40uLL);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24848, 1028);
        if (!result) {
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24848, 1024);
        }
        return result;
      }
      return 0;
    }
  }
  return result;
}

uint64_t e1000_check_polarity_82577(uint64_t a1)
{
  unsigned __int16 v3 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 26, &v3);
  if (!result) {
    *(_DWORD *)(a1 + 1092) = (v3 >> 10) & 1;
  }
  return result;
}

uint64_t e1000_phy_force_speed_duplex_82577(uint64_t a1)
{
  unsigned __int16 v4 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, 0, &v4);
  if (!result)
  {
    e1000_phy_force_speed_duplex_setup(a1, &v4);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 1032))(a1, 0, v4);
    if (!result)
    {
      IODelay(1uLL);
      if (*(unsigned char *)(a1 + 1136))
      {
        uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
        if (!result) {
          return e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v3);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t e1000_get_phy_info_82577(uint64_t a1)
{
  unsigned __int16 v5 = 0;
  BOOL v4 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v4);
  if (!result)
  {
    if (v4)
    {
      *(unsigned char *)(a1 + 1133) = 1;
      unsigned __int16 v6 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 26, &v6);
      if (!result)
      {
        *(_DWORD *)(a1 + 1092) = (v6 >> 10) & 1;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 26, &v5);
        if (!result)
        {
          unsigned __int16 v3 = v5;
          *(unsigned char *)(a1 + 1132) = (v5 & 0x800) != 0;
          if ((v3 & 0x300) == 0x200)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 952))(a1);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 10, &v5);
              if (!result) {
                *(void *)(a1 + 1076) = *(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(v5), (int8x8_t)0xFFFF0000FFFFLL), (uint32x2_t)0xFFFFFFF4FFFFFFF3) & 0xFFFFFFF1FFFFFFF1;
              }
            }
          }
          else
          {
            uint64_t result = 0;
            *(_WORD *)(a1 + 1124) = 255;
            *(void *)(a1 + 1076) = 0xFF000000FFLL;
          }
        }
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t e1000_get_cable_length_82577(uint64_t a1)
{
  unsigned __int16 v4 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 31, &v4);
  if (!result)
  {
    int v3 = (v4 >> 2);
    if (v3 == 255)
    {
      return 4294967294;
    }
    else
    {
      uint64_t result = 0;
      *(_WORD *)(a1 + 1124) = v3;
    }
  }
  return result;
}

uint64_t e1000_write_phy_reg_gs40g(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(void))(a1 + 896))();
  if (!v6)
  {
    uint64_t v6 = e1000_write_phy_reg_mdic(a1, 0x16u, HIWORD(a2));
    if (!v6) {
      uint64_t v6 = e1000_write_phy_reg_mdic(a1, (unsigned __int16)a2, a3);
    }
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return v6;
}

uint64_t e1000_read_phy_reg_gs40g(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t phy_reg_mdic = (*(uint64_t (**)(void))(a1 + 896))();
  if (!phy_reg_mdic)
  {
    uint64_t phy_reg_mdic = e1000_write_phy_reg_mdic(a1, 0x16u, HIWORD(a2));
    if (!phy_reg_mdic) {
      uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, (unsigned __int16)a2, a3);
    }
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
  return phy_reg_mdic;
}

uint64_t e1000_write_phy_reg_gpy(uint64_t a1, int a2, int a3)
{
  unsigned int v5 = (unsigned __int16)a2;
  if (BYTE2(a2))
  {
    unsigned __int16 v7 = a3;
    return sub_100011CC0(a1, (unsigned __int16)a2, BYTE2(a2), &v7, 0);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (!result)
    {
      uint64_t result = e1000_write_phy_reg_mdic(a1, v5, a3);
      if (!result)
      {
        (*(void (**)(uint64_t))(a1 + 1000))(a1);
        return 0;
      }
    }
  }
  return result;
}

uint64_t e1000_write_xmdio_reg(uint64_t a1, uint64_t a2, int a3, unsigned __int16 a4)
{
  unsigned __int16 v5 = a4;
  return sub_100011CC0(a1, a2, a3, &v5, 0);
}

uint64_t e1000_read_phy_reg_gpy(uint64_t a1, int a2, unsigned __int16 *a3)
{
  unsigned int v5 = (unsigned __int16)a2;
  if (BYTE2(a2))
  {
    return sub_100011CC0(a1, (unsigned __int16)a2, BYTE2(a2), a3, 1);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (!result)
    {
      uint64_t result = e1000_read_phy_reg_mdic(a1, v5, a3);
      if (!result)
      {
        (*(void (**)(uint64_t))(a1 + 1000))(a1);
        return 0;
      }
    }
  }
  return result;
}

uint64_t e1000_read_xmdio_reg(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4)
{
  return sub_100011CC0(a1, a2, a3, a4, 1);
}

uint64_t e1000_read_phy_reg_mphy(uint64_t a1, unsigned __int16 a2, uint32_t *a3)
{
  if (!e1000_is_mphy_ready(a1)) {
    return 4294967294;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  uint32_t v7 = readData;
  if ((readData & 0x80000000) != 0)
  {
    if (!e1000_is_mphy_ready(a1)) {
      return 4294967294;
    }
    uint32_t v7 = v6 | 0x40000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v6 | 0x40000000);
  }
  if (e1000_is_mphy_ready(a1))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v7 & 0xDFFF0000 | a2);
    if (e1000_is_mphy_ready(a1))
    {
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE10uLL, &v9);
      __dmb(1u);
      *a3 = v9;
      if ((v6 & 0x80000000) == 0 || e1000_is_mphy_ready(a1))
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, 0x80000000);
        return 0;
      }
    }
  }
  return 4294967294;
}

BOOL e1000_is_mphy_ready(uint64_t a1)
{
  char v2 = 1;
  do
  {
    char v3 = v2;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData;
    if ((readData & 0x10000) == 0) {
      break;
    }
    IODelay(0x14uLL);
    char v2 = 0;
  }
  while ((v3 & 1) != 0);
  return (v4 & 0x10000) == 0;
}

uint64_t e1000_write_phy_reg_mphy(uint64_t a1, unsigned __int16 a2, uint32_t a3, int a4)
{
  if (!e1000_is_mphy_ready(a1)) {
    return 4294967294;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData;
  uint32_t v9 = readData;
  if ((readData & 0x80000000) != 0)
  {
    if (!e1000_is_mphy_ready(a1)) {
      return 4294967294;
    }
    uint32_t v9 = v8 | 0x40000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v8 | 0x40000000);
  }
  if (e1000_is_mphy_ready(a1))
  {
    int v10 = a4 ? 0x20000000 : 0;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v10 & 0xFFFF0000 | a2 | v9 & 0xDFFF0000);
    if (e1000_is_mphy_ready(a1))
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE10uLL, a3);
      if ((v8 & 0x80000000) == 0 || e1000_is_mphy_ready(a1))
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, 0x80000000);
        return 0;
      }
    }
  }
  return 4294967294;
}

uint64_t sub_100011CC0(uint64_t a1, uint64_t a2, int a3, unsigned __int16 *a4, int a5)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 13);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 14, a2);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 13, a3 | 0x4000u);
      if (!result)
      {
        uint64_t result = a5
               ? (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 14, a4)
               : (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 14, *a4);
        if (!result)
        {
          int v11 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032);
          return v11(a1, 13, 0);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100011DC0(uint64_t a1, char a2, _WORD *a3, int a4)
{
  if (*(_DWORD *)(a1 + 1072) == 9) {
    unsigned int v7 = 29;
  }
  else {
    unsigned int v7 = 16;
  }
  *(_DWORD *)(a1 + 1100) = 2;
  uint64_t result = e1000_write_phy_reg_mdic(a1, v7, a2 & 0x3F);
  if (!result)
  {
    unsigned int v9 = v7 + 1;
    if (a4)
    {
      return e1000_read_phy_reg_mdic(a1, v9, a3);
    }
    else
    {
      int v10 = (unsigned __int16)*a3;
      return e1000_write_phy_reg_mdic(a1, v9, v10);
    }
  }
  return result;
}

uint64_t e1000_read_pcie_cap_reg(uint64_t a1, unsigned int a2, uint16_t *a3)
{
  uint64_t foundCapabilityOffset = 0;
  unsigned int v5 = *(IOPCIDevice **)(a1 + 9608);
  uint64_t PCICapability = IOPCIDevice::FindPCICapability(v5, 0x10u, 0, &foundCapabilityOffset, 0);
  if (!PCICapability) {
    IOPCIDevice::ConfigurationRead16(v5, foundCapabilityOffset + a2, a3);
  }
  return PCICapability;
}

uint64_t e1000_write_pcie_cap_reg(uint64_t a1, unsigned int a2, uint16_t *a3)
{
  uint64_t foundCapabilityOffset = 0;
  unsigned int v5 = *(IOPCIDevice **)(a1 + 9608);
  uint64_t PCICapability = IOPCIDevice::FindPCICapability(v5, 0x10u, 0, &foundCapabilityOffset, 0);
  if (!PCICapability) {
    IOPCIDevice::ConfigurationWrite16(v5, foundCapabilityOffset + a2, *a3);
  }
  return PCICapability;
}

void e1000_read_pci_cfg(uint64_t a1, uint64_t offset, uint16_t *a3)
{
}

void e1000_write_pci_cfg(uint64_t a1, uint64_t offset, uint16_t *a3)
{
}

void e1000_pci_set_mwi(uint64_t a1)
{
}

void e1000_pci_clear_mwi(uint64_t a1)
{
}

uint64_t e1000_read_emi_reg_locked(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, a2);
  if (!result)
  {
    uint32_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 984);
    return v6(a1, 17, a3);
  }
  return result;
}

uint64_t e1000_write_emi_reg_locked(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, a2);
  if (!result)
  {
    uint32_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040);
    return v6(a1, 17, a3);
  }
  return result;
}

uint64_t e1000_set_eee_pchlan(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1072);
  if (v2 == 11)
  {
    uint64_t v3 = 1038;
    uint64_t v4 = 6190;
    uint64_t v5 = 1039;
  }
  else
  {
    if (v2 != 12) {
      return 0;
    }
    uint64_t v3 = 32769;
    uint64_t v4 = 37889;
    uint64_t v5 = 32770;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (!v6)
  {
    int v12 = 0;
    __int16 v11 = 0;
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 984))(a1, 24724, &v12);
    if (v6)
    {
LABEL_7:
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
      return v6;
    }
    LOWORD(v12) = v12 & 0x9FFF;
    if (!*(unsigned char *)(a1 + 9574))
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, v5);
      if (v6) {
        goto LABEL_7;
      }
      unsigned int v9 = (_WORD *)(a1 + 9576);
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 984))(a1, 17, a1 + 9576);
      if (v6) {
        goto LABEL_7;
      }
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, v3);
      if (v6) {
        goto LABEL_7;
      }
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 984))(a1, 17, (char *)&v12 + 2);
      if (v6) {
        goto LABEL_7;
      }
      __int16 v10 = *v9 & HIWORD(v12);
      if ((v10 & 4) != 0) {
        LOWORD(v12) = v12 | 0x4000;
      }
      if ((v10 & 2) != 0)
      {
        (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 5, &v11);
        if ((v11 & 0x100) != 0) {
          LOWORD(v12) = v12 | 0x2000;
        }
        else {
          *v9 &= ~2u;
        }
      }
    }
    if (*(_DWORD *)(a1 + 1072) == 11)
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 17426);
      if (v6) {
        goto LABEL_7;
      }
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 17, &v11);
      if (v6) {
        goto LABEL_7;
      }
      unsigned __int16 v8 = v11 & 0xFFFB;
      v11 &= ~4u;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 17426)) {
        (*(void (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 17, v8);
      }
    }
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, v4);
    if (!v6)
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 17, &v11);
      if (!v6) {
        uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24724, (unsigned __int16)v12);
      }
    }
    goto LABEL_7;
  }
  return v6;
}

uint64_t e1000_init_function_pointers_ich8lan(uint64_t result)
{
  *(void *)(result + 40) = sub_10001237C;
  *(void *)(result + 1144) = sub_1000126B0;
  unsigned int v1 = *(_DWORD *)(result + 284) - 19;
  if (v1 <= 9) {
    *(void *)(result + 888) = off_1000382F0[v1];
  }
  return result;
}

uint64_t sub_10001237C(uint64_t a1)
{
  *(_DWORD *)(a1 + 1116) = 1;
  *(_WORD *)(a1 + 326) = 32;
  int v2 = *(_DWORD *)(a1 + 284);
  if (v2 == 19) {
    __int16 v3 = 6;
  }
  else {
    __int16 v3 = 7;
  }
  *(_WORD *)(a1 + 844) = v3;
  *(_DWORD *)(a1 + 847) = 16777473;
  *(void *)(a1 + 104) = sub_1000144D0;
  *(void *)(a1 + 112) = e1000_set_lan_id_single_port;
  *(void *)(a1 + 152) = sub_1000144F0;
  *(void *)(a1 + 160) = sub_1000147A4;
  *(void *)(a1 + 192) = sub_100014CAC;
  *(void *)(a1 + 200) = sub_100014D88;
  *(void *)(a1 + 72) = sub_100014F20;
  *(void *)(a1 + 120) = sub_100015654;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 88) = sub_100015794;
  switch(v2)
  {
    case 19:
    case 20:
    case 21:
      *(void *)(a1 + 64) = sub_100015A94;
      *(void *)(a1 + 48) = e1000_id_led_init_generic;
      *(void *)(a1 + 56) = e1000_blink_led_generic;
      *(void *)(a1 + 208) = e1000_setup_led_generic;
      *(void *)(a1 + 80) = sub_100015AE4;
      *(void *)(a1 + 128) = sub_100015B4C;
      *(void *)(a1 + 136) = sub_100015BB4;
      goto LABEL_12;
    case 22:
      goto LABEL_6;
    case 23:
      *(_WORD *)(a1 + 844) = 5;
      *(void *)(a1 + 232) = sub_100015C1C;
      goto LABEL_5;
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
LABEL_5:
      *(void *)(a1 + 144) = sub_100015E2C;
LABEL_6:
      uint16_t v6 = 0;
      e1000_read_pci_cfg(a1, 8uLL, &v6);
      int v2 = *(_DWORD *)(a1 + 284);
      char v4 = v6;
      if (v2 <= 24) {
        char v4 = v6 & 0xF;
      }
      *(unsigned char *)(a1 + 9592) = v4;
      *(void *)(a1 + 64) = sub_100015F34;
      *(void *)(a1 + 48) = sub_100015F7C;
      *(void *)(a1 + 208) = sub_1000160D8;
      *(void *)(a1 + 80) = sub_1000160EC;
      *(void *)(a1 + 128) = sub_100016100;
      *(void *)(a1 + 136) = sub_1000161AC;
      break;
    default:
      break;
  }
  if (v2 < 24)
  {
LABEL_12:
    if (v2 == 19) {
      *(unsigned char *)(a1 + 1376) = 1;
    }
  }
  else
  {
    *(_WORD *)(a1 + 844) = 12;
    *(void *)(a1 + 232) = sub_100016258;
    *(void *)(a1 + 200) = sub_1000164A0;
  }
  return 0;
}

uint64_t sub_1000126B0(uint64_t a1)
{
  *(_DWORD *)(a1 + 1216) = 6;
  if (*(int *)(a1 + 284) < 25)
  {
    if (!*(void *)(a1 + 24)) {
      return 4294967293;
    }
    __dmb(0xDu);
    unsigned int v2 = **(_DWORD **)(a1 + 24);
    *(_DWORD *)(a1 + 1228) = (v2 & 0x1FFF) << 12;
    *(_DWORD *)(a1 + 1224) = ((((HIWORD(v2) & 0x1FFF) - (v2 & 0x1FFF)) << 10) + 1024) & 0x3FFFFC00;
  }
  else
  {
    *(_DWORD *)(a1 + 1228) = 0;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xCuLL, &readData);
    __dmb(1u);
    *(_DWORD *)(a1 + 1224) = (((readData << 11) & 0x1F000) + 4096) >> 2;
    *(void *)(a1 + 24) = *(void *)(a1 + 16) + 57344;
  }
  uint64_t v3 = 0;
  *(_WORD *)(a1 + 1232) = 2048;
  do
  {
    uint64_t v4 = a1 + v3;
    *(unsigned char *)(v4 + 1380) = 0;
    *(_WORD *)(v4 + 1378) = -1;
    v3 += 4;
  }
  while (v3 != 0x2000);
  uint64_t result = 0;
  *(void *)(a1 + 1152) = sub_1000172B8;
  *(void *)(a1 + 1168) = nullsub_1;
  int v6 = *(_DWORD *)(a1 + 284);
  BOOL v7 = v6 <= 24;
  if (v6 <= 24) {
    unsigned __int16 v8 = sub_1000176C4;
  }
  else {
    unsigned __int16 v8 = sub_1000172C4;
  }
  unsigned int v9 = sub_1000177D0;
  if (!v7) {
    unsigned int v9 = sub_1000174A0;
  }
  *(void *)(a1 + 1160) = v8;
  *(void *)(a1 + 1184) = v9;
  *(void *)(a1 + 1192) = sub_1000179F4;
  *(void *)(a1 + 1200) = sub_100017A4C;
  *(void *)(a1 + 1208) = sub_100017B2C;
  return result;
}

uint64_t sub_100012864(uint64_t a1)
{
  *(_DWORD *)(a1 + 1100) = 1;
  *(_DWORD *)(a1 + 1108) = 100;
  *(void *)(a1 + 896) = sub_100016598;
  *(void *)(a1 + 920) = sub_1000185A4;
  *(void *)(a1 + 952) = e1000_get_cable_length_igp_2;
  *(void *)(a1 + 944) = sub_100018618;
  *(void *)(a1 + 976) = e1000_read_phy_reg_igp;
  *(void *)(a1 + 1000) = sub_100017254;
  *(void *)(a1 + 1008) = sub_100016DF8;
  *(void *)(a1 + 1016) = sub_10001877C;
  *(void *)(a1 + 1024) = sub_1000188C0;
  *(void *)(a1 + 1032) = e1000_write_phy_reg_igp;
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = sub_100018A20;
  if (!e1000_determine_phy_address(a1)
    || (*(void *)(a1 + 1032) = e1000_write_phy_reg_bm,
        *(void *)(a1 + 976) = e1000_read_phy_reg_bm,
        uint64_t result = e1000_determine_phy_address(a1),
        !result))
  {
    unsigned int v3 = 0;
    *(_DWORD *)(a1 + 1104) = 0;
    while (!e1000_get_phy_type_from_id(*(_DWORD *)(a1 + 1104)) && v3 <= 0x63)
    {
      ++v3;
      IODelay(0x3E8uLL);
      uint64_t result = e1000_get_phy_id(a1);
      if (result) {
        return result;
      }
    }
    int v4 = *(_DWORD *)(a1 + 1104);
    if ((v4 - 44565264) > 0x20 || ((1 << (v4 - 16)) & 0x100010001) == 0)
    {
      if (v4 == 21040304)
      {
        *(_DWORD *)(a1 + 1072) = 8;
        *(_WORD *)(a1 + 1122) = 47;
        *(void *)(a1 + 976) = e1000_read_phy_reg_bm;
        *(void *)(a1 + 1032) = e1000_write_phy_reg_bm;
        *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
        int v6 = e1000_phy_force_speed_duplex_m88;
        BOOL v7 = e1000_check_polarity_m88;
        unsigned __int16 v8 = e1000_get_phy_info_m88;
      }
      else
      {
        if (v4 != 44565392) {
          return 4294967294;
        }
        *(_DWORD *)(a1 + 1072) = 6;
        *(_WORD *)(a1 + 1122) = 47;
        *(void *)(a1 + 984) = e1000_read_phy_reg_igp_locked;
        *(void *)(a1 + 1040) = e1000_write_phy_reg_igp_locked;
        int v6 = e1000_phy_force_speed_duplex_igp;
        BOOL v7 = e1000_check_polarity_igp;
        unsigned __int16 v8 = e1000_get_phy_info_igp;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 1072) = 7;
      *(_WORD *)(a1 + 1122) = 15;
      int v6 = e1000_phy_force_speed_duplex_ife;
      BOOL v7 = e1000_check_polarity_ife;
      unsigned __int16 v8 = e1000_get_phy_info_ife;
    }
    uint64_t result = 0;
    *(void *)(a1 + 960) = v8;
    *(void *)(a1 + 912) = v7;
    *(void *)(a1 + 936) = v6;
  }
  return result;
}

uint64_t sub_100012BA4(uint64_t a1)
{
  *(_DWORD *)(a1 + 1108) = 100;
  *(void *)(a1 + 896) = sub_100016598;
  *(void *)(a1 + 920) = sub_1000185A4;
  *(void *)(a1 + 944) = sub_100018618;
  *(void *)(a1 + 968) = e1000_set_page_igp;
  *(void *)(a1 + 976) = e1000_read_phy_reg_hv;
  *(void *)(a1 + 984) = e1000_read_phy_reg_hv_locked;
  *(void *)(a1 + 992) = e1000_read_phy_reg_page_hv;
  *(void *)(a1 + 1000) = sub_100017254;
  *(void *)(a1 + 1008) = sub_100016DF8;
  *(void *)(a1 + 1016) = sub_100018A84;
  *(void *)(a1 + 1024) = sub_100018A84;
  *(void *)(a1 + 1032) = e1000_write_phy_reg_hv;
  *(void *)(a1 + 1040) = e1000_write_phy_reg_hv_locked;
  *(void *)(a1 + 1048) = e1000_write_phy_reg_page_hv;
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = sub_100018A20;
  *(_WORD *)(a1 + 1122) = 47;
  *(void *)(a1 + 1100) = 1;
  uint64_t result = sub_1000140DC(a1);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 1104);
    if (!v3)
    {
      if ((*(_DWORD *)(a1 + 284) - 23) < 6) {
        goto LABEL_7;
      }
      uint64_t result = e1000_get_phy_id(a1);
      if (result) {
        return result;
      }
      int v3 = *(_DWORD *)(a1 + 1104);
      if (!v3 || v3 == -16)
      {
LABEL_7:
        uint64_t result = sub_100016C40(a1);
        if (result) {
          return result;
        }
        uint64_t result = e1000_get_phy_id(a1);
        if (result) {
          return result;
        }
        int v3 = *(_DWORD *)(a1 + 1104);
      }
    }
    int phy_type_from_id = e1000_get_phy_type_from_id(v3);
    *(_DWORD *)(a1 + 1072) = phy_type_from_id;
    if ((phy_type_from_id - 10) >= 3)
    {
      if (phy_type_from_id == 9)
      {
        uint64_t result = 0;
        *(void *)(a1 + 912) = e1000_check_polarity_m88;
        *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_m88;
        *(void *)(a1 + 952) = e1000_get_cable_length_m88;
        *(void *)(a1 + 960) = e1000_get_phy_info_m88;
      }
      else
      {
        return 4294967294;
      }
    }
    else
    {
      uint64_t result = 0;
      *(void *)(a1 + 912) = e1000_check_polarity_82577;
      *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_82577;
      *(void *)(a1 + 952) = e1000_get_cable_length_82577;
      *(void *)(a1 + 960) = e1000_get_phy_info_82577;
      *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
      *(_WORD *)(a1 + 9578) = 0;
    }
  }
  return result;
}

uint64_t e1000_configure_k1_ich8lan(uint64_t a1, int a2)
{
  unsigned __int16 v10 = 0;
  uint64_t result = e1000_read_kmrn_reg_locked(a1, 7, &v10);
  if (!result)
  {
    if (a2) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    unsigned __int16 v10 = v10 & 0xFFFD | v5;
    uint64_t result = e1000_write_kmrn_reg_locked(a1, 7, v10);
    if (!result)
    {
      IODelay(0x14uLL);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
      __dmb(1u);
      uint32_t v6 = readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
      __dmb(1u);
      uint32_t v7 = readData;
      uint32_t v8 = readData & 0xFFFFF4FF | 0x800;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v8);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v6 | 0x8000);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      IODelay(0x14uLL);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v7);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v6);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      IODelay(0x14uLL);
      return 0;
    }
  }
  return result;
}

uint64_t e1000_copy_rx_addrs_to_phy_ich8lan(uint64_t a1)
{
  unsigned __int16 v15 = 0;
  uint64_t result = (*(uint64_t (**)(void))(a1 + 896))();
  if (!result)
  {
    if (!e1000_enable_phy_wakeup_reg_access_bm(a1, &v15))
    {
      if (*(_WORD *)(a1 + 844))
      {
        uint64_t v3 = 0;
        unsigned int v4 = 0;
        int v5 = 1245184;
        int v6 = 19;
        do
        {
          uint32_t readData = 0;
          if (v4 >= 0x10) {
            int v7 = 21600;
          }
          else {
            int v7 = 21504;
          }
          unsigned int v8 = v3 + v7;
          if (v8 == 21504)
          {
            if (*(int *)(a1 + 284) <= 1) {
              uint64_t v9 = 64;
            }
            else {
              uint64_t v9 = 21504;
            }
          }
          else if (v8 == 22016)
          {
            if (*(int *)(a1 + 284) <= 1) {
              uint64_t v9 = 1536;
            }
            else {
              uint64_t v9 = 22016;
            }
          }
          else
          {
            uint64_t v9 = v8;
          }
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v9, &readData);
          __dmb(1u);
          uint32_t v10 = readData;
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, ((_BYTE)v6 - 3) & 0x1C | (v5 - 196608) & 0xFFE00000 | 0x6400, (unsigned __int16)readData);
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, (v6 - 2) & 0x1D | (v5 - 0x20000) & 0xFFE00000 | 0x6400, HIWORD(v10));
          uint32_t v13 = 0;
          if (v4 >= 0x10) {
            uint64_t v11 = 21604;
          }
          else {
            uint64_t v11 = 21508;
          }
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v3 + v11, &v13);
          __dmb(1u);
          uint32_t v12 = v13;
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, ((_BYTE)v6 - 1) & 0x1E | (v5 - 0x10000) & 0xFFE00000 | 0x6400, (unsigned __int16)v13);
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, v5 & 0xFFE00000 | v6 & 0x1F | 0x6400, HIWORD(v12) & 0x8000);
          ++v4;
          v3 += 8;
          v5 += 0x40000;
          v6 += 4;
        }
        while (v4 < *(unsigned __int16 *)(a1 + 844));
      }
      e1000_disable_phy_wakeup_reg_access_bm(a1, &v15);
    }
    return (*(uint64_t (**)(uint64_t))(a1 + 1000))(a1);
  }
  return result;
}

uint64_t e1000_lv_jumbo_workaround_ich8lan(uint64_t a1, int a2)
{
  if (*(int *)(a1 + 284) < 23) {
    return 0;
  }
  int v20 = 0;
  (*(void (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 24628, (char *)&v20 + 2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24628, HIWORD(v20) | 0x4000u);
  if (!result)
  {
    if (a2)
    {
      if (*(_WORD *)(a1 + 844))
      {
        uint64_t v5 = 0;
        do
        {
          uint32_t readData = 0;
          int v6 = 8 * v5;
          if (v5 >= 0x10) {
            int v7 = 21604;
          }
          else {
            int v7 = 21508;
          }
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, (v7 + v6), &readData);
          __dmb(1u);
          __int16 v8 = readData;
          if ((readData & 0x80000000) != 0)
          {
            uint32_t readData = 0;
            unsigned int v9 = 8 * v5 + 21600;
            if (v5 < 0x10) {
              unsigned int v9 = v6 + 21504;
            }
            if (v9 == 22016)
            {
              if (*(int *)(a1 + 284) <= 1) {
                unsigned int v9 = 1536;
              }
              else {
                unsigned int v9 = 22016;
              }
            }
            else if (v9 == 21504)
            {
              if (*(int *)(a1 + 284) <= 1) {
                unsigned int v9 = 64;
              }
              else {
                unsigned int v9 = 21504;
              }
            }
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v9, &readData);
            uint64_t v10 = 0;
            __dmb(1u);
            __int16 v19 = v8;
            __dmb(2u);
            unsigned int v11 = -1;
            do
            {
              v11 ^= *((unsigned __int8 *)&readData + v10);
              int v12 = -8;
              do
                unsigned int v11 = ((int)(v11 << 31) >> 31) & 0xEDB88320 ^ (v11 >> 1);
              while (!__CFADD__(v12++, 1));
              ++v10;
            }
            while (v10 != 6);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 4 * v5 + 24400, ~v11);
          }
          ++v5;
        }
        while (v5 < *(unsigned __int16 *)(a1 + 844));
      }
      e1000_copy_rx_addrs_to_phy_ich8lan(a1);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, &readData);
      __dmb(1u);
      uint32_t v14 = readData & 0xFFFC3FFF | 0x38000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, v14);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &readData);
      __dmb(1u);
      uint32_t v15 = readData | 0x4000000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v15);
      uint64_t result = e1000_read_kmrn_reg_generic(a1, 1, &v20);
      if (result) {
        return result;
      }
      uint64_t result = e1000_write_kmrn_reg_generic(a1, 1, (unsigned __int16)v20 | 1u);
      if (result) {
        return result;
      }
      uint64_t result = e1000_read_kmrn_reg_generic(a1, 16, &v20);
      if (result) {
        return result;
      }
      LOWORD(v20) = v20 & 0xF0FF | 0xB00;
      uint64_t result = e1000_write_kmrn_reg_generic(a1, 16, (unsigned __int16)v20);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24631, &v20);
      LOWORD(v20) = v20 & 0xF01F | 0x6E0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24631, (unsigned __int16)v20);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24624, &v20);
      LOWORD(v20) = v20 & 0xDFFF;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24624);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24852, &v20);
      LOWORD(v20) = v20 & 0xF003 | 0x7C;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24852, (unsigned __int16)v20);
      if (result) {
        return result;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24855, 61696);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24657, &v20);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24657, (unsigned __int16)v20 | 0x400u);
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, &readData);
      __dmb(1u);
      uint32_t v16 = readData & 0xFFFC3FFF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, v16);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &readData);
      __dmb(1u);
      uint32_t v17 = readData & 0xFBFFFFFF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v17);
      uint64_t result = e1000_read_kmrn_reg_generic(a1, 1, &v20);
      if (result) {
        return result;
      }
      uint64_t result = e1000_write_kmrn_reg_generic(a1, 1, (unsigned __int16)v20 & 0xFFFE);
      if (result) {
        return result;
      }
      uint64_t result = e1000_read_kmrn_reg_generic(a1, 16, &v20);
      if (result) {
        return result;
      }
      LOWORD(v20) = v20 & 0xF0FF | 0xB00;
      uint64_t result = e1000_write_kmrn_reg_generic(a1, 16, (unsigned __int16)v20);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24631, &v20);
      LOWORD(v20) = v20 & 0xF01F;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24631);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24624, &v20);
      LOWORD(v20) = v20 | 0x2000;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24624);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24852, &v20);
      LOWORD(v20) = v20 & 0xF003 | 0x20;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24852, (unsigned __int16)v20);
      if (result) {
        return result;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24855, 32256);
      if (result) {
        return result;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 24657, &v20);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24657, (unsigned __int16)v20 & 0xFBFF);
    }
    if (!result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24628, HIWORD(v20) & 0xBFFF);
    }
  }
  return result;
}

uint64_t e1000_set_kmrn_lock_loss_workaround_ich8lan(uint64_t result, char a2)
{
  if (*(_DWORD *)(result + 284) == 19) {
    *(unsigned char *)(result + 1376) = a2;
  }
  return result;
}

uint64_t e1000_igp3_phy_powerdown_workaround_ich8lan(uint64_t result)
{
  if (*(_DWORD *)(result + 1072) == 6)
  {
    uint64_t v1 = result;
    char v2 = 0;
    unsigned __int16 v7 = 0;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(v1 + 16), 0, 0xF10uLL, &readData);
      __dmb(1u);
      uint32_t v3 = readData | 0x48;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(v1 + 16), 0, 0xF10uLL, v3);
      if (*(_DWORD *)(v1 + 284) == 19) {
        e1000_gig_downshift_workaround_ich8lan(v1);
      }
      (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(v1 + 976))(v1, 24850, &v7);
      v7 &= 0xFCFFu;
      (*(void (**)(uint64_t, uint64_t, void))(v1 + 1032))(v1, 24850, v7 | 0x200u);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(v1 + 976))(v1, 24850, &v7);
      v7 &= 0x300u;
      if (v2 & 1 | (v7 == 512)) {
        break;
      }
      uint32_t v5 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(v1 + 16), 0, 0, &v5);
      __dmb(1u);
      uint32_t v4 = v5;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(v1 + 16), 0, 0, v4 | 0x80000000);
      char v2 = 1;
    }
  }
  return result;
}

uint64_t e1000_gig_downshift_workaround_ich8lan(uint64_t result)
{
  if (*(_DWORD *)(result + 284) == 19)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 1072) != 7)
    {
      unsigned __int16 v3 = 0;
      uint64_t result = e1000_read_kmrn_reg_generic(result, 3, &v3);
      if (!result)
      {
        int v2 = v3 | 0x1000;
        v3 |= 0x1000u;
        uint64_t result = e1000_write_kmrn_reg_generic(v1, 3, v2);
        if (!result) {
          return e1000_write_kmrn_reg_generic(v1, 3, v3 & 0xEFFF);
        }
      }
    }
  }
  return result;
}

void e1000_suspend_workarounds_ich8lan(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x40;
  if (*(_DWORD *)(a1 + 1072) == 12)
  {
    __int16 v8 = 0;
    int v3 = *(unsigned __int16 *)(a1 + 9584);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    __int16 v4 = readData;
    BOOL v5 = (v3 - 5465) >= 2 && (v3 - 5538) >= 2;
    if (!v5 || *(int *)(a1 + 284) >= 25)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      uint32_t v6 = readData;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v6 & 0xFFFFFEFF);
    }
    if (!(*(unsigned int (**)(uint64_t))(a1 + 896))(a1))
    {
      if (!*(unsigned char *)(a1 + 9574))
      {
        LOWORD(readData) = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 32769)
          || (*(unsigned int (**)(uint64_t, uint64_t, uint32_t *))(a1 + 984))(a1, 17, &readData))
        {
LABEL_17:
          (*(void (**)(uint64_t))(a1 + 1000))(a1);
          goto LABEL_18;
        }
        if ((readData & 2) != 0 && (*(_WORD *)(a1 + 9576) & 2) != 0 && (*(_WORD *)(a1 + 1120) & 8) != 0)
        {
          v2 &= 0xFFFFFFF9;
          (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24722, &v8);
          v8 |= 0x800u;
          (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24722);
        }
      }
      if (!*(unsigned char *)(a1 + 9581))
      {
        if ((v4 & 0x8000) == 0)
        {
          (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 4219910, &v8);
          v8 |= 0x80u;
          (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 4219910);
          (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24636, &v8);
          v8 |= 0x1000u;
          (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24636);
          (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24730, &v8);
          v8 &= ~0x10u;
          (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24730);
        }
        (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24733, &v8);
        v8 |= 2u;
        (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24733);
      }
      goto LABEL_17;
    }
  }
LABEL_18:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v2);
  int v7 = *(_DWORD *)(a1 + 284);
  if (v7 == 19)
  {
    e1000_gig_downshift_workaround_ich8lan(a1);
    int v7 = *(_DWORD *)(a1 + 284);
  }
  if (v7 >= 22)
  {
    sub_100013CD4(a1, 0);
    if (*(_DWORD *)(a1 + 284) == 22) {
      e1000_phy_hw_reset_generic(a1);
    }
    if (!(*(unsigned int (**)(uint64_t))(a1 + 896))(a1))
    {
      sub_100013E90(a1);
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
    }
  }
}

uint64_t sub_100013CD4(uint64_t a1, int a2)
{
  if (*(int *)(a1 + 284) >= 22)
  {
    uint64_t v2 = (*(uint64_t (**)(void))(a1 + 896))();
    if (v2) {
      return v2;
    }
    unsigned __int16 v12 = 0;
    if (*(_DWORD *)(a1 + 284) == 22)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
      uint64_t v2 = 0;
      __dmb(1u);
      if ((readData & 8) != 0) {
        goto LABEL_21;
      }
    }
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x28uLL, &v10);
    uint64_t v2 = 0;
    __dmb(1u);
    if ((v10 & 0x8000000) == 0
      || (uint32_t v9 = 0,
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &v9),
          __dmb(1u),
          uint32_t v5 = v9,
          uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 24601, &v12),
          v2))
    {
LABEL_21:
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
      return v2;
    }
    unsigned __int16 v6 = v12 & 0xFFBB;
    v12 &= 0xFFBBu;
    if (a2)
    {
      if ((v5 & 0x42) != 0) {
        unsigned __int16 v12 = v5 & 0x40 | (4 * ((v5 >> 1) & 1)) | v6;
      }
    }
    else
    {
      if ((v5 & 0x48) != 0) {
        v6 |= 0x40u;
      }
      if ((v5 & 6) != 0) {
        v6 |= 4u;
      }
      if ((v5 & 0x4E) != 0) {
        unsigned __int16 v12 = v6;
      }
      if (*(_DWORD *)(a1 + 284) == 22) {
        goto LABEL_20;
      }
    }
    int v7 = (*(uint64_t (**)(uint64_t))(a1 + 920))(a1);
    unsigned __int16 v6 = v12;
    if (!v7)
    {
      unsigned __int16 v6 = v12 | 0x400;
      v12 |= 0x400u;
    }
LABEL_20:
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24601, v6);
    goto LABEL_21;
  }
  return 0;
}

uint64_t sub_100013E90(uint64_t a1)
{
  __int16 v8 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xCuLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint64_t result = e1000_read_phy_reg_hv_locked(a1, 0x601Au, &v8);
  if (!result)
  {
    int v4 = (v2 >> 12) & 3;
    int v5 = (v2 >> 17) & 0x7F | v8 & 0xFF00 | 0x280;
    __int16 v8 = (v2 >> 17) & 0x7F | v8 & 0xFF00 | 0x280;
    if (*(_DWORD *)(a1 + 1072) == 12 && v4 != 0)
    {
      LOWORD(v5) = (((_WORD)v4 - 1) << 11) & 0x1000 | ((((_WORD)v4 - 1) & 1) << 8) | v5 & 0xEEFF;
      __int16 v8 = v5;
    }
    return e1000_write_phy_reg_hv_locked(a1, 0x601Au, (unsigned __int16)v5);
  }
  return result;
}

uint64_t e1000_resume_workarounds_pchlan(uint64_t a1)
{
  if (*(int *)(a1 + 284) >= 23)
  {
    uint64_t v1 = sub_1000140DC(a1);
    if (v1) {
      return v1;
    }
    if (!*(unsigned char *)(a1 + 9581) && *(_DWORD *)(a1 + 1072) == 12)
    {
      __int16 v5 = 0;
      uint64_t v1 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
      if (v1) {
        return v1;
      }
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24722, &v5);
      v5 &= ~0x800u;
      (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24722);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
      __dmb(1u);
      if ((readData & 0x8000) == 0)
      {
        uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24730, &v5);
        if (v1)
        {
LABEL_13:
          (*(void (**)(uint64_t))(a1 + 1000))(a1);
          return v1;
        }
        v5 |= 0x10u;
        (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24730);
        (*(void (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 4219910, 0);
      }
      uint64_t v1 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 984))(a1, 24733, &v5);
      if (!v1)
      {
        v5 &= ~2u;
        (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24733);
      }
      goto LABEL_13;
    }
  }
  return 0;
}

uint64_t sub_1000140DC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  sub_100016518(a1, 1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (v3) {
    goto LABEL_2;
  }
  int v6 = *(_DWORD *)(a1 + 284);
  if ((v6 - 24) >= 5)
  {
    if (v6 == 22) {
      goto LABEL_27;
    }
    if (v6 != 23)
    {
      uint64_t v3 = 0;
      int v8 = 1;
      goto LABEL_17;
    }
LABEL_14:
    if (sub_100018B1C(a1)) {
      goto LABEL_15;
    }
    if (*(_DWORD *)(a1 + 284) != 22)
    {
LABEL_33:
      if ((*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
      {
        int v8 = 0;
        uint64_t v3 = 4294967294;
        goto LABEL_16;
      }
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3CuLL, &readData);
      __dmb(1u);
      uint32_t v9 = readData & 0xF3FFFFFF | 0x8000000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3CuLL, v9);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
      __dmb(1u);
      uint32_t v10 = readData & 0xFFFCFFFF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v10 | 0x10000);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      IODelay(0x3E8uLL);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v10);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      if (*(int *)(a1 + 284) >= 24)
      {
        int v12 = 20;
        uint64_t v11 = 30000;
        do
        {
          IODelay(0x1388uLL);
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
          __dmb(1u);
          if ((readData & 4) != 0) {
            break;
          }
          BOOL v4 = (unsigned __int16)v12-- == 0;
        }
        while (!v4);
      }
      else
      {
        uint64_t v11 = 50000;
      }
      IODelay(v11);
      if (*(int *)(a1 + 284) >= 24)
      {
        if ((sub_100018B1C(a1) & 1) == 0)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
          __dmb(1u);
          uint32_t v13 = readData & 0xFFFFF7FF;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v13);
          int v8 = sub_100018B1C(a1);
          if (v8) {
            uint64_t v3 = 0;
          }
          else {
            uint64_t v3 = 4294967294;
          }
          goto LABEL_16;
        }
        goto LABEL_15;
      }
LABEL_28:
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
      goto LABEL_29;
    }
LABEL_27:
    if (v2 < 0) {
      goto LABEL_28;
    }
    goto LABEL_33;
  }
  if ((sub_100018B1C(a1) & 1) == 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData | 0x800;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v7);
    IODelay(0xC350uLL);
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v3 = 0;
  int v8 = 1;
LABEL_16:
  int v6 = *(_DWORD *)(a1 + 284);
LABEL_17:
  if (v6 < 24 || *(unsigned char *)(a1 + 9574) || v2 < 0)
  {
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    if (!v8) {
      goto LABEL_2;
    }
    goto LABEL_29;
  }
  LOWORD(readData) = 0;
  IODelay(0x3E8uLL);
  (*(void (**)(uint64_t, uint64_t, uint32_t *))(a1 + 984))(a1, 24724, &readData);
  if ((readData & 0x1000) != 0)
  {
    LOWORD(readData) = readData & 0xEFFF;
    (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24724);
  }
  (*(void (**)(uint64_t))(a1 + 1000))(a1);
  if (v8)
  {
LABEL_29:
    if ((*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = e1000_phy_hw_reset_generic(a1);
      if (!v3) {
        uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 920))(a1);
      }
    }
  }
LABEL_2:
  BOOL v4 = *(_DWORD *)(a1 + 284) == 23 && (v2 & 0x8000) == 0;
  if (v4)
  {
    IODelay(0x2710uLL);
    sub_100016518(a1, 0);
  }
  return v3;
}

uint64_t sub_1000144D0(uint64_t a1)
{
  *(_DWORD *)(a1 + 1256) = 1;
  *(void *)(a1 + 1248) = 3;
  *(_WORD *)(a1 + 1260) = 0;
  return 0;
}

uint64_t sub_1000144F0(uint64_t a1)
{
  __int16 v8 = 0;
  e1000_disable_pcie_primary_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  int v2 = *(_DWORD *)(a1 + 284);
  if (v2 == 19)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1000uLL, 8u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1008uLL, 0x10u);
    int v2 = *(_DWORD *)(a1 + 284);
  }
  if (v2 == 22)
  {
    uint64_t result = e1000_read_nvm(a1);
    if (result) {
      return result;
    }
    *(unsigned char *)(a1 + 9572) = v8 & 1;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  if (!(*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
  {
    v4 |= 0x80000000;
    if (*(_DWORD *)(a1 + 284) == 23)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
      __dmb(1u);
      if ((readData & 0x8000) == 0) {
        sub_100016518(a1, 1);
      }
    }
  }
  sub_100016598(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4 | 0x4000000);
  IODelay(0x4E20uLL);
  if (*(_DWORD *)(a1 + 284) == 23)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3CuLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData & 0xF3FFFFFF | 0x8000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3CuLL, v5);
  }
  if ((v4 & 0x80000000) == 0
    || (uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 944))(a1), !result)
    && (uint64_t result = sub_100016678(a1), !result))
  {
    if (*(_DWORD *)(a1 + 284) == 22)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F50uLL, 0x65656565u);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3004uLL, &readData);
    __dmb(1u);
    uint32_t v6 = readData | 0x50000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3004uLL, v6);
    return 0;
  }
  return result;
}

uint64_t sub_1000147A4(uint64_t a1)
{
  __int16 v23 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
  __dmb(1u);
  if (*(int *)(a1 + 284) <= 21) {
    int v2 = 0x400000;
  }
  else {
    int v2 = 5242880;
  }
  uint32_t v3 = v2 | readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v4);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
  __dmb(1u);
  uint32_t v5 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, v5);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if (*(_DWORD *)(a1 + 284) == 19) {
    uint32_t v6 = readData | 0x30000000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, v6 | 0xD800000);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, &readData);
  __dmb(1u);
  uint32_t v7 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
  __dmb(1u);
  uint32_t v8 = (readData & 0x10000000 | v7 & 0xAAFFFFFF) ^ 0x55000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, v8);
  if (*(_DWORD *)(a1 + 284) == 19)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    uint32_t v9 = readData & 0x7FFFFFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, v9);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 284) == 19) {
    int v10 = 196800;
  }
  else {
    int v10 = 192;
  }
  uint32_t v11 = v10 | readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v11);
  if (*(int *)(a1 + 284) >= 24)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100CuLL, &readData);
    __dmb(1u);
    uint32_t v12 = readData | 0x10000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100CuLL, v12);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v13 = readData | 0x80000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v13);
  }
  (*(void (**)(uint64_t))(a1 + 48))(a1);
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  __int16 v23 = 0;
  if (*(_WORD *)(a1 + 326))
  {
    unsigned __int16 v14 = 0;
    do
    {
      __dmb(2u);
      unsigned int v15 = 4 * v14 + 20992;
      if (4 * v14 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v15 = 64;
        }
        else {
          unsigned int v15 = 21504;
        }
      }
      else if (v14)
      {
        if (4 * v14 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v15 = 1536;
          }
          else {
            unsigned int v15 = 22016;
          }
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v15 = 512;
      }
      else
      {
        unsigned int v15 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v15, 0);
      __int16 v23 = ++v14;
    }
    while (*(unsigned __int16 *)(a1 + 326) > v14);
  }
  if (*(_DWORD *)(a1 + 1072) != 9
    || ((*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24625, &v23),
        v23 &= ~0x10u,
        (*(void (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24625),
        uint64_t v16 = sub_100016DF8(a1),
        !v16))
  {
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
    __dmb(1u);
    uint32_t v17 = readData & 0xFEC0FFC0 | 0x101001F;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v17);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
    __dmb(1u);
    uint32_t v18 = readData & 0xFEC0FFC0 | 0x101001F;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, v18);
    if (*(_DWORD *)(a1 + 284) == 19) {
      int v19 = 63;
    }
    else {
      int v19 = -64;
    }
    e1000_set_pcie_no_snoop_generic(a1, v19);
    if (*(int *)(a1 + 284) >= 27)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, &readData);
      __dmb(1u);
      uint32_t v20 = readData | 0x1000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, v20);
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v21 = readData | 0x20000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v21);
    sub_100015794(a1);
  }
  return v16;
}

uint64_t sub_100014CAC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 884);
  if (v2 == 255)
  {
    int v2 = 3;
    *(_DWORD *)(a1 + 884) = 3;
  }
  *(_DWORD *)(a1 + 880) = v2;
  if ((*(unsigned int (**)(uint64_t))(a1 + 920))(a1)
    || (uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 200))(a1), !result))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x170uLL, *(unsigned __int16 *)(a1 + 872));
    if ((*(_DWORD *)(a1 + 1072) - 9) > 3
      || (__dmb(2u),
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F40uLL, *(unsigned __int16 *)(a1 + 874)),
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24635, *(unsigned __int16 *)(a1 + 872)), !result))
    {
      return e1000_set_fc_watermarks_generic(a1);
    }
  }
  return result;
}

uint64_t sub_100014D88(uint64_t a1)
{
  unsigned __int16 v8 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  uint64_t result = e1000_write_kmrn_reg_generic(a1, 4, 0xFFFF);
  if (!result)
  {
    uint64_t result = e1000_read_kmrn_reg_generic(a1, 9, &v8);
    if (!result)
    {
      int v4 = v8 | 0x3F;
      v8 |= 0x3Fu;
      uint64_t result = e1000_write_kmrn_reg_generic(a1, 9, v4);
      if (!result)
      {
        switch(*(_DWORD *)(a1 + 1072))
        {
          case 6:
            uint64_t result = e1000_copper_link_setup_igp(a1);
            if (!result) {
              goto LABEL_18;
            }
            break;
          case 7:
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 28, &v8);
            if (!result)
            {
              int v5 = *(unsigned __int8 *)(a1 + 1130);
              if (v5 == 2) {
                unsigned __int16 v6 = v8 & 0xFF3F | 0x40;
              }
              else {
                unsigned __int16 v6 = v5 == 1 ? v8 & 0xFF3F : v8 | 0x80;
              }
              unsigned __int16 v8 = v6;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 28, v6);
              if (!result) {
                goto LABEL_18;
              }
            }
            break;
          case 8:
          case 9:
            uint64_t result = e1000_copper_link_setup_m88(a1);
            if (!result) {
              goto LABEL_18;
            }
            break;
          case 0xA:
          case 0xB:
            uint64_t result = e1000_copper_link_setup_82577(a1);
            if (!result) {
              goto LABEL_18;
            }
            break;
          default:
LABEL_18:
            uint64_t result = e1000_setup_copper_link_generic(a1);
            break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100014F20(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 853)) {
    return 0;
  }
  BOOL v36 = 0;
  unsigned __int16 v35 = 0;
  uint64_t has_link_generic = e1000_phy_has_link_generic(a1, 1u, 0, &v36);
  if (has_link_generic) {
    return has_link_generic;
  }
  int v3 = *(_DWORD *)(a1 + 284);
  if (v3 == 22)
  {
    uint64_t has_link_generic = sub_100016CA4(a1, v36);
    if (has_link_generic) {
      return has_link_generic;
    }
    int v3 = *(_DWORD *)(a1 + 284);
  }
  if (v3 >= 23 && v36)
  {
    int v34 = 0;
    e1000_get_speed_and_duplex_copper_generic(a1, (__int16 *)&v34 + 1, (__int16 *)&v34);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData & 0xFFFFFC00;
    if ((unsigned __int16)v34 == 1 && HIWORD(v34) == 10)
    {
      uint64_t v5 = 0;
      int v6 = 255;
    }
    else
    {
      if (HIWORD(v34) != 1000 && *(_DWORD *)(a1 + 284) > 24 && (unsigned __int16)v34 == 2) {
        int v6 = 12;
      }
      else {
        int v6 = 8;
      }
      uint64_t v5 = 1;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, v4 | v6);
    uint64_t has_link_generic = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (has_link_generic) {
      return has_link_generic;
    }
    if (*(_DWORD *)(a1 + 284) == 23) {
      uint64_t v9 = 13330;
    }
    else {
      uint64_t v9 = 45580;
    }
    uint64_t has_link_generic = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, v9);
    if (!has_link_generic) {
      uint64_t has_link_generic = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 17, v5);
    }
    if (*(unsigned char *)(a1 + 9580)) {
      sub_100016E70(a1);
    }
    if (*(unsigned char *)(a1 + 9578) || *(unsigned char *)(a1 + 9579))
    {
      (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 24657, &v35);
      unsigned __int16 v10 = v35;
      if (*(unsigned char *)(a1 + 9578))
      {
        unsigned __int16 v10 = v35 | 0x80;
        v35 |= 0x80u;
      }
      if (*(unsigned char *)(a1 + 9579))
      {
        v10 &= ~0x100u;
        unsigned __int16 v35 = v10;
      }
      (*(void (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24657, v10);
    }
    if (*(int *)(a1 + 284) >= 24)
    {
      (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 24732, &v35);
      BOOL v11 = HIWORD(v34) == 10 || HIWORD(v34) == 100;
      __int16 v12 = v11 ? 1000 : 250;
      unsigned __int16 v35 = v35 & 0xF800 | v12;
      (*(void (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24732, v35 & 0xFFFE);
      if (HIWORD(v34) == 1000)
      {
        (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 24657, &v35);
        v35 |= 0x200u;
        (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24657);
      }
    }
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    if (has_link_generic) {
      return has_link_generic;
    }
    int v3 = *(_DWORD *)(a1 + 284);
    if (v3 >= 25)
    {
      LOWORD(readData) = 0;
      int v13 = HIWORD(v34);
      uint64_t v14 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
      uint64_t has_link_generic = v14;
      if (v13 == 1000)
      {
        if (v14) {
          return has_link_generic;
        }
        uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint32_t *))(a1 + 984))(a1, 24852, &readData);
        if (v15)
        {
          uint64_t has_link_generic = v15;
LABEL_70:
          (*(void (**)(uint64_t))(a1 + 1000))(a1);
          return has_link_generic;
        }
        int v17 = (unsigned __int16)readData;
        if ((readData & 0xFE0) >= 0x60)
        {
          (*(void (**)(uint64_t))(a1 + 1000))(a1);
LABEL_58:
          int v3 = *(_DWORD *)(a1 + 284);
          goto LABEL_59;
        }
        LOWORD(readData) = readData & 0xF003 | 0x60;
        uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24852, v17 & 0xFFFFF003 | 0x60);
      }
      else
      {
        if (v14) {
          return has_link_generic;
        }
        uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 24852, 49187);
      }
      uint64_t has_link_generic = v16;
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
      if (has_link_generic) {
        return has_link_generic;
      }
      goto LABEL_58;
    }
  }
LABEL_59:
  if (v3 > 23)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, &readData);
    __dmb(1u);
    uint32_t v18 = readData | 7;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v18);
  }
  int v19 = *(unsigned __int16 *)(a1 + 9584);
  BOOL v20 = (v19 - 5538) >= 2;
  unsigned int v21 = v19 - 5465;
  if (v20 && v21 > 1) {
    goto LABEL_75;
  }
  BOOL v23 = v36;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v24 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  uint32_t v25 = readData;
  LOWORD(readData) = 0;
  if (v23 && (v25 & 0x80) != 0)
  {
    uint64_t has_link_generic = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (has_link_generic) {
      return has_link_generic;
    }
    uint64_t has_link_generic = e1000_read_kmrn_reg_locked(a1, 7, &readData);
    if (has_link_generic) {
      goto LABEL_70;
    }
    uint64_t has_link_generic = e1000_write_kmrn_reg_locked(a1, 7, (unsigned __int16)readData & 0xFFFD);
    if (has_link_generic) {
      goto LABEL_70;
    }
    IODelay(0xAuLL);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v24 | 0x100);
    uint64_t has_link_generic = e1000_write_kmrn_reg_locked(a1, 7, (unsigned __int16)readData);
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    if (has_link_generic) {
      return has_link_generic;
    }
LABEL_75:
    *(_WORD *)(a1 + 9576) = 0;
    if (*(int *)(a1 + 284) >= 24)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      uint32_t v27 = readData;
      if (*(_DWORD *)(a1 + 284) == 25)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF18uLL, &readData);
        __dmb(1u);
        uint32_t v27 = readData & 0x80000000 | v27 & 0x7FFFFFFF;
      }
      if (*(unsigned char *)(a1 + 9573)) {
        uint32_t v28 = v27 & 0x7FFFFFFF;
      }
      else {
        uint32_t v28 = v27;
      }
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v28);
    }
    if (v36)
    {
      *(unsigned char *)(a1 + 853) = 0;
      int v29 = *(_DWORD *)(a1 + 284);
      if (v29 != 22)
      {
        if (v29 != 23)
        {
LABEL_91:
          e1000_check_downshift_generic(a1);
          if (*(int *)(a1 + 1072) < 12 || (uint64_t has_link_generic = e1000_set_eee_pchlan(a1), !has_link_generic))
          {
            if (*(unsigned char *)(a1 + 851))
            {
              (*(void (**)(uint64_t))(a1 + 224))(a1);
              return e1000_config_fc_after_link_up_generic(a1);
            }
            else
            {
              return 4294967293;
            }
          }
          return has_link_generic;
        }
        uint64_t has_link_generic = sub_10001715C(a1);
        if (has_link_generic) {
          return has_link_generic;
        }
      }
      if (*(_DWORD *)(a1 + 1072) == 9)
      {
        uint64_t has_link_generic = e1000_link_stall_workaround_hv(a1);
        if (has_link_generic) {
          return has_link_generic;
        }
      }
      (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 24656, &v35);
      v35 &= 0x8FFFu;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      uint64_t v30 = v35;
      if ((readData & 1) == 0)
      {
        uint64_t v30 = v35 | 0x1000u;
        v35 |= 0x1000u;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24656, v30);
      goto LABEL_91;
    }
    return 0;
  }
  uint32_t v26 = v24 & 0xFFFFFEFF;
  if (!v23
    || *(_DWORD *)(a1 + 1112) > 5u
    || (~v25 & 0x41) == 0
    || (uint64_t has_link_generic = (*(uint64_t (**)(uint64_t, uint64_t, uint32_t *))(a1 + 976))(a1, 24658, &readData),
        !has_link_generic)
    && ((v25 & 0x40) != 0 ? (__int16 v32 = 1280) : (__int16 v32 = 12800),
        (unsigned __int16 v33 = readData & 0xC0FF | v32, (v25 & 0x40) != 0) ? (v26 = v24 & 0xFFFFFCFF) : (v26 = v24 & 0xFFFFFCFF | 0x200),
        LOWORD(readData) = readData & 0xC0FF | v32,
        uint64_t has_link_generic = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24658, v33),
        !has_link_generic))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v26);
    goto LABEL_75;
  }
  return has_link_generic;
}

uint64_t sub_100015654(uint64_t a1, __int16 *a2, __int16 *a3)
{
  uint64_t result = e1000_get_speed_and_duplex_copper_generic(a1, a2, a3);
  if (!result)
  {
    if (*(_DWORD *)(a1 + 284) == 19
      && *(_DWORD *)(a1 + 1072) == 6
      && *a2 == 1000
      && *(unsigned char *)(a1 + 1376)
      && (v11 = 0, BOOL v10 = 0, e1000_phy_has_link_generic(a1, 1u, 0, &v10), v10))
    {
      unsigned int v6 = 0;
      while (1)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24659, &v11);
        if (result) {
          break;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24659, &v11);
        if (result) {
          break;
        }
        if ((v11 & 2) == 0) {
          return 0;
        }
        (*(void (**)(uint64_t))(a1 + 1008))(a1);
        IODelay(0x1388uLL);
        if (v6++ >= 9)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
          __dmb(1u);
          uint32_t v8 = readData | 0x48;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v8);
          e1000_gig_downshift_workaround_ich8lan(a1);
          return 4294967294;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100015794(uint64_t a1)
{
  __int16 v3 = 0;
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4100uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4124uLL, &readData);
  __dmb(1u);
  if ((*(_DWORD *)(a1 + 1072) - 9) <= 3 && !(*(unsigned int (**)(uint64_t))(a1 + 896))(a1))
  {
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(a1 + 968))(a1, 24896))
    {
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24912, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24913, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24914, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24915, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24916, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24917, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24919, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24920, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24921, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24922, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24923, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24924, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24925, &v3);
      (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 992))(a1, 24926, &v3);
    }
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
  }
}

BOOL sub_100015A94(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  return (readData & 0x800E) == 32772;
}

uint64_t sub_100015AE4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1072) == 7)
  {
    uint64_t v1 = *(uint64_t (**)(void))(a1 + 1032);
    return v1();
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, *(_DWORD *)(a1 + 292));
    return 0;
  }
}

uint64_t sub_100015B4C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1072) == 7)
  {
    uint64_t v1 = *(uint64_t (**)(void))(a1 + 1032);
    return v1();
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, *(_DWORD *)(a1 + 300));
    return 0;
  }
}

uint64_t sub_100015BB4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1072) == 7)
  {
    uint64_t v1 = *(uint64_t (**)(void))(a1 + 1032);
    return v1();
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, *(_DWORD *)(a1 + 296));
    return 0;
  }
}

uint64_t sub_100015C1C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint32_t v4 = *(_DWORD *)a2;
  int v5 = *(unsigned __int16 *)(a2 + 4);
  int v6 = *(_DWORD *)a2 | v5;
  unsigned int v7 = v5 | 0x80000000;
  if (v6) {
    uint32_t v8 = v7;
  }
  else {
    uint32_t v8 = 0;
  }
  if (a3)
  {
    if (*(unsigned __int16 *)(a1 + 844) <= a3 || sub_100016598(a1)) {
      return 4294967293;
    }
    __dmb(2u);
    int v10 = 8 * a3;
    unsigned int v11 = 8 * a3 + 21552;
    unsigned int v12 = v11;
    if (8 * a3 == 464)
    {
      if (*(int *)(a1 + 284) <= 1) {
        unsigned int v12 = 1536;
      }
      else {
        unsigned int v12 = 22016;
      }
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v12, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (v10 + 21556), v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    sub_100017254(a1);
    uint32_t readData = 0;
    if (8 * a3 == 464)
    {
      if (*(int *)(a1 + 284) <= 1) {
        unsigned int v11 = 1536;
      }
      else {
        unsigned int v11 = 22016;
      }
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v11, &readData);
    __dmb(1u);
    if (readData != v4) {
      return 4294967293;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, (v10 + 21556), &readData);
    uint64_t result = 0;
    __dmb(1u);
    if (readData != v8) {
      return 4294967293;
    }
  }
  else
  {
    __dmb(2u);
    uint64_t v14 = *(IOPCIDevice **)(a1 + 16);
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v15 = 64;
    }
    else {
      uint64_t v15 = 21504;
    }
    IOPCIDevice::MemoryWrite32(v14, 0, v15, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    uint64_t result = 0;
    __dmb(1u);
  }
  return result;
}

uint64_t sub_100015E2C(uint64_t a1, uint64_t a2, int a3)
{
  unsigned __int16 v11 = 0;
  e1000_update_mc_addr_list_generic(a1, a2, a3);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (!result)
  {
    if (!e1000_enable_phy_wakeup_reg_access_bm(a1, &v11))
    {
      if (*(_WORD *)(a1 + 326))
      {
        int v5 = 0;
        int v6 = 0;
        uint64_t v7 = 83;
        do
        {
          unsigned int v8 = v6 & 0xFFE00000 | v5 & 0x1E;
          uint64_t v9 = (unsigned __int16 *)(a1 + 4 * v7);
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, v8 + 8414208, *v9);
          (*(void (**)(uint64_t, void, void))(a1 + 1048))(a1, v8 + 8414209, v9[1]);
          v6 += 0x20000;
          v5 += 2;
          unint64_t v10 = v7 - 82;
          ++v7;
        }
        while (v10 < *(unsigned __int16 *)(a1 + 326));
      }
      e1000_disable_phy_wakeup_reg_access_bm(a1, &v11);
    }
    return (*(uint64_t (**)(uint64_t))(a1 + 1000))(a1);
  }
  return result;
}

BOOL sub_100015F34(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  return (~readData & 0x8004) == 0;
}

uint64_t sub_100015F7C(uint64_t a1)
{
  unsigned __int16 v13 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(a1 + 1192))(a1, &v13);
  if (!result)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
    char v3 = 0;
    int v4 = 0;
    __dmb(1u);
    uint32_t v5 = readData;
    *(_DWORD *)(a1 + 292) = readData;
    *(_DWORD *)(a1 + 296) = v5;
    *(_DWORD *)(a1 + 300) = v5;
    unsigned int v6 = v13;
    int v7 = v5;
    do
    {
      int v8 = (v6 >> v4) & 0xF;
      int v9 = 2;
      int v10 = 31 << v3;
      switch(v8)
      {
        case 2:
          goto LABEL_7;
        case 3:
LABEL_6:
          int v8 = 10;
LABEL_7:
          uint32_t v5 = v5 & ~v10 | (v8 << v3);
          *(_DWORD *)(a1 + 300) = v5;
          break;
        case 4:
        case 5:
        case 6:
          goto LABEL_5;
        case 7:
        case 8:
        case 9:
          int v9 = 10;
LABEL_5:
          int v7 = v7 & ~v10 | (v9 << v3);
          *(_DWORD *)(a1 + 296) = v7;
          int v11 = v8 - 5;
          int v8 = 2;
          switch(v11)
          {
            case 0:
            case 3:
              goto LABEL_7;
            case 1:
            case 4:
              goto LABEL_6;
            default:
              goto LABEL_8;
          }
        default:
          break;
      }
LABEL_8:
      v4 += 4;
      v3 += 5;
    }
    while (v4 != 16);
    return 0;
  }
  return result;
}

uint64_t sub_1000160D8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24606, *(unsigned __int16 *)(a1 + 296));
}

uint64_t sub_1000160EC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24606, *(unsigned __int16 *)(a1 + 292));
}

uint64_t sub_100016100(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 300);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  if ((readData & 2) == 0)
  {
    for (int i = 0; i != 15; i += 5)
    {
      if ((((unsigned __int16)v2 >> i) & 8) != 0) {
        int v4 = v2 & ~(8 << i);
      }
      else {
        int v4 = v2 | (8 << i);
      }
      if ((((unsigned __int16)v2 >> i) & 7) == 2) {
        int v2 = v4;
      }
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24606, (unsigned __int16)v2);
}

uint64_t sub_1000161AC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 296);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  if ((readData & 2) == 0)
  {
    for (int i = 0; i != 15; i += 5)
    {
      if ((((unsigned __int16)v2 >> i) & 8) != 0) {
        int v4 = v2 & ~(8 << i);
      }
      else {
        int v4 = v2 | (8 << i);
      }
      if ((((unsigned __int16)v2 >> i) & 7) == 2) {
        int v2 = v4;
      }
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 24606, (unsigned __int16)v2);
}

uint64_t sub_100016258(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint32_t v4 = *(_DWORD *)a2;
  int v5 = *(unsigned __int16 *)(a2 + 4);
  int v6 = *(_DWORD *)a2 | v5;
  unsigned int v7 = v5 | 0x80000000;
  if (v6) {
    uint32_t v8 = v7;
  }
  else {
    uint32_t v8 = 0;
  }
  if (a3)
  {
    if (*(unsigned __int16 *)(a1 + 844) <= a3) {
      return 4294967293;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    uint32_t v10 = (readData >> 7) & 7;
    if (v10)
    {
      if (v10 == 1 || v10 < a3) {
        return 4294967293;
      }
    }
    if (sub_100016598(a1)) {
      return 4294967293;
    }
    __dmb(2u);
    int v11 = 8 * a3;
    unsigned int v12 = 8 * a3 + 21504;
    unsigned int v13 = v12;
    if (8 * a3 == 512)
    {
      if (*(int *)(a1 + 284) <= 1) {
        unsigned int v13 = 1536;
      }
      else {
        unsigned int v13 = 22016;
      }
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v13, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (v11 + 21508), v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    sub_100017254(a1);
    uint32_t readData = 0;
    if (8 * a3 == 512)
    {
      if (*(int *)(a1 + 284) <= 1) {
        unsigned int v12 = 1536;
      }
      else {
        unsigned int v12 = 22016;
      }
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v12, &readData);
    __dmb(1u);
    if (readData != v4) {
      return 4294967293;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, (v11 + 21508), &readData);
    uint64_t result = 0;
    __dmb(1u);
    if (readData != v8) {
      return 4294967293;
    }
  }
  else
  {
    __dmb(2u);
    uint64_t v15 = *(IOPCIDevice **)(a1 + 16);
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v16 = 64;
    }
    else {
      uint64_t v16 = 21504;
    }
    IOPCIDevice::MemoryWrite32(v15, 0, v16, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    uint64_t result = 0;
    __dmb(1u);
  }
  return result;
}

uint64_t sub_1000164A0(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  uint64_t result = e1000_copper_link_setup_82577(a1);
  if (!result) {
    return e1000_setup_copper_link_generic(a1);
  }
  return result;
}

void sub_100016518(uint64_t a1, int a2)
{
  if (*(int *)(a1 + 284) >= 23)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData & 0xFFFFFF7F;
    if (a2) {
      int v5 = 128;
    }
    else {
      int v5 = 0;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v4 | v5);
  }
}

uint64_t sub_100016598(uint64_t a1)
{
  int v2 = -100;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
    __dmb(1u);
    if ((readData & 0x20) == 0) {
      break;
    }
    IODelay(0x3E8uLL);
    BOOL v3 = __CFADD__(v2++, 1);
    if (v3) {
      return 4294967293;
    }
  }
  uint32_t v4 = readData | 0x20;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v4);
  int v5 = -1000;
  while (1)
  {
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &v8);
    __dmb(1u);
    uint32_t v6 = v8;
    if ((v8 & 0x20) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
    BOOL v3 = __CFADD__(v5++, 1);
    if (v3)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v6 & 0xFFFFFFDF);
      return 4294967293;
    }
  }
  return 0;
}

uint64_t sub_100016678(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(a1 + 920))()) {
    return 0;
  }
  __int16 v17 = 0;
  IODelay(0x2710uLL);
  int v4 = *(_DWORD *)(a1 + 284);
  if (v4 == 23)
  {
    uint64_t v2 = sub_100016C40(a1);
    if (v2) {
      return v2;
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
    if (v2) {
      return v2;
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 2127);
    if (v2) {
      goto LABEL_70;
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 17, 52);
    if (v2) {
      goto LABEL_70;
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 9233);
    if (v2) {
      goto LABEL_70;
    }
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 17, 5);
    goto LABEL_17;
  }
  if (v4 == 22)
  {
    int v5 = *(_DWORD *)(a1 + 1072);
    if (v5 != 10) {
      goto LABEL_40;
    }
    uint64_t v2 = sub_100016C40(a1);
    if (v2) {
      return v2;
    }
    int v5 = *(_DWORD *)(a1 + 1072);
    if (v5 == 10)
    {
      if ((*(_DWORD *)(a1 + 1112) - 1) >= 2)
      {
LABEL_48:
        uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
        if (v2) {
          return v2;
        }
        *(_DWORD *)(a1 + 1100) = 1;
        uint64_t v2 = e1000_write_phy_reg_mdic(a1, 0x1Fu, 0);
        (*(void (**)(uint64_t))(a1 + 1000))(a1);
        if (v2) {
          return v2;
        }
        uint64_t v2 = sub_100016CA4(a1, 1);
        if (v2) {
          return v2;
        }
        uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
        if (v2) {
          return v2;
        }
        LOWORD(readData) = 0;
        uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint32_t *))(a1 + 984))(a1, 24625, &readData);
        if (v2) {
          goto LABEL_70;
        }
        uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1040))(a1, 24625, readData);
        if (v2) {
          goto LABEL_70;
        }
        uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 2183);
        if (v2) {
          goto LABEL_70;
        }
        uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 17, 52);
LABEL_17:
        uint64_t v2 = v6;
        (*(void (**)(uint64_t))(a1 + 1000))(a1);
        if (v2) {
          return v2;
        }
        int v4 = *(_DWORD *)(a1 + 284);
        goto LABEL_19;
      }
    }
    else
    {
LABEL_40:
      if (v5 != 9) {
        goto LABEL_48;
      }
      unsigned int v16 = *(_DWORD *)(a1 + 1112);
      if (v16 != 1)
      {
LABEL_46:
        if (v16 <= 1)
        {
          e1000_phy_sw_reset_generic(a1);
          (*(void (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 12608);
        }
        goto LABEL_48;
      }
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24633, 17457);
    if (v2) {
      return v2;
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24656, 41476);
    if (v2) {
      return v2;
    }
    if (*(_DWORD *)(a1 + 1072) != 9) {
      goto LABEL_48;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 1112);
    goto LABEL_46;
  }
LABEL_19:
  if (v4 >= 22)
  {
    (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24625, &v17);
    v17 &= ~0x10u;
    (*(void (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24625);
    int v4 = *(_DWORD *)(a1 + 284);
  }
  if ((v4 - 22) < 7) {
    goto LABEL_22;
  }
  if (v4 != 19 || *(_DWORD *)(a1 + 1072) != 6) {
    goto LABEL_60;
  }
  if ((*(_WORD *)(a1 + 9584) & 0xFFFE) == 0x104A) {
    int v7 = 1;
  }
  else {
LABEL_22:
  }
    int v7 = 0x8000000;
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (v8) {
    return v8;
  }
  uint32_t readData = 0;
  int v19 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x28uLL, &readData);
  __dmb(1u);
  if ((readData & v7) != 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
    __dmb(1u);
    uint32_t v9 = readData;
    if (*(int *)(a1 + 284) > 22 || (readData & 1) == 0)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF08uLL, &readData);
      __dmb(1u);
      int v10 = BYTE2(readData);
      if (BYTE2(readData))
      {
        int v11 = *(_DWORD *)(a1 + 284);
        BOOL v12 = v11 == 22;
        if ((v9 & 8) != 0) {
          BOOL v12 = 0;
        }
        if (v11 > 22 || v12)
        {
          uint64_t v2 = sub_100013E90(a1);
          if (v2) {
            goto LABEL_70;
          }
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
          __dmb(1u);
          uint64_t v2 = e1000_write_phy_reg_hv_locked(a1, 0x601Eu, (unsigned __int16)readData);
          if (v2) {
            goto LABEL_70;
          }
        }
        __int16 v13 = 0;
        int v14 = (v9 >> 15) & 0x1FFE;
        do
        {
          uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(a1 + 1160))(a1, (unsigned __int16)v14, 1, (char *)&v19 + 2);
          if (v15) {
            goto LABEL_66;
          }
          uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(a1 + 1160))(a1, (unsigned __int16)v14 | 1u, 1, &v19);
          if (v15) {
            goto LABEL_66;
          }
          if ((unsigned __int16)v19 == 31)
          {
            __int16 v13 = HIWORD(v19);
          }
          else
          {
            LOWORD(v19) = v19 & 0x1F | v13;
            uint64_t v15 = (*(uint64_t (**)(uint64_t))(a1 + 1040))(a1);
            if (v15) {
              goto LABEL_66;
            }
          }
          LOWORD(v14) = v14 + 2;
        }
        while (--v10);
      }
    }
  }
  (*(void (**)(uint64_t))(a1 + 1000))(a1);
LABEL_60:
  uint64_t v8 = sub_100013CD4(a1, 1);
  if (*(_DWORD *)(a1 + 284) != 23) {
    return v8;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  if ((readData & 0x8000) == 0)
  {
    IODelay(0x2710uLL);
    sub_100016518(a1, 0);
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 896))(a1);
  if (!v2)
  {
    uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 16, 18437);
    if (v2)
    {
LABEL_70:
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
      return v2;
    }
    uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 17, 4999);
LABEL_66:
    uint64_t v2 = v15;
    goto LABEL_70;
  }
  return v2;
}

uint64_t sub_100016C40(uint64_t a1)
{
  __int16 v3 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24624, &v3);
  if (!result)
  {
    v3 |= 0x400u;
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24624);
  }
  return result;
}

uint64_t sub_100016CA4(uint64_t a1, int a2)
{
  uint64_t v2 = 0;
  unsigned __int16 v9 = 0;
  if (*(_DWORD *)(a1 + 284) == 22)
  {
    int v5 = *(unsigned __int8 *)(a1 + 9572);
    uint64_t v2 = (*(uint64_t (**)(void))(a1 + 896))();
    if (!v2)
    {
      if (!a2)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 24659, 16640);
LABEL_15:
        uint64_t v2 = v7;
        if (!v7) {
          uint64_t v2 = e1000_configure_k1_ich8lan(a1, v5 != 0);
        }
        goto LABEL_17;
      }
      int v6 = *(_DWORD *)(a1 + 1072);
      if (v6 == 9)
      {
        uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 17, &v9);
        if (v2) {
          goto LABEL_17;
        }
        v9 &= 0xCC00u;
        if (v9 == 35840) {
          int v5 = 0;
        }
        int v6 = *(_DWORD *)(a1 + 1072);
      }
      if (v6 != 10)
      {
LABEL_13:
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1040))(a1, 24659, 256);
        goto LABEL_15;
      }
      uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 26, &v9);
      if (!v2)
      {
        v9 &= 0x1340u;
        if (v9 == 4672) {
          int v5 = 0;
        }
        goto LABEL_13;
      }
LABEL_17:
      (*(void (**)(uint64_t))(a1 + 1000))(a1);
    }
  }
  return v2;
}

uint64_t sub_100016DF8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 284) == 23)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    if ((readData & 0x8000) == 0) {
      sub_100016518(a1, 1);
    }
  }
  uint64_t result = e1000_phy_hw_reset_generic(a1);
  if (!result) {
    return sub_100016678(a1);
  }
  return result;
}

uint64_t sub_100016E70(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 1072);
  if (v1 >= 11)
  {
    uint64_t v2 = result;
    if (v1 == 11) {
      int v3 = 0;
    }
    else {
      int v3 = 32255;
    }
    if (v1 == 11) {
      uint64_t v4 = 11273;
    }
    else {
      uint64_t v4 = 43528;
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(result + 1040))(result, 16, v4)) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11279))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11285))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11311))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11313))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 7);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11315))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11317))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 7);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11319))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11321))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 7);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11323))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 1);
    }
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11325))) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 1040))(v2, 17, 7);
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 1040))(v2, 16, (v3 + 11369));
    if (!result)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 1040);
      return v5(v2, 17, 0);
    }
  }
  return result;
}

uint64_t sub_10001715C(uint64_t a1)
{
  uint64_t result = 0;
  unsigned __int16 v6 = 0;
  if (*(_DWORD *)(a1 + 284) != 23) {
    return result;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 26, &v6);
  if (result) {
    return result;
  }
  if ((~v6 & 0x1040) != 0) {
    return 0;
  }
  if ((v6 & 0x300) == 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData & 0xFFFFFFF8 | 3;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, v3);
    return 0;
  }
  __int16 v5 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 24657, &v5);
  if (!result)
  {
    v5 &= ~0x4000u;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 24657);
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100017254(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
  __dmb(1u);
  if ((readData & 0x20) != 0)
  {
    uint32_t v2 = readData & 0xFFFFFFDF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v2);
  }
}

uint64_t sub_1000172B8()
{
  return 0;
}

uint64_t sub_1000172C4(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v28 = 0;
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  signed int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v24 = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    (*(void (**)(void))(a1 + 1152))();
    int v11 = sub_100017BD0(a1, (uint32_t *)&v28 + 1);
    LOWORD(v12) = 0;
    if (!v11 && HIDWORD(v28)) {
      int v12 = *(_DWORD *)(a1 + 1224);
    }
    int v13 = 0;
    unsigned __int16 v14 = 0;
    __int16 v27 = v12 + a2;
    __int16 v26 = (v12 + a2) & 0xFFFE;
    uint64_t v15 = a1 + 1378;
    while (1)
    {
      if (a3 - v13 == 1)
      {
        uint64_t v16 = v13 + a2;
        if (*(unsigned char *)(v15 + 4 * v16 + 2))
        {
          LOWORD(v16) = *(_WORD *)(v15 + 4 * v16);
        }
        else
        {
          uint64_t v21 = sub_100017D48(a1, (unsigned __int16)(v26 + v13), &v28);
          if (v21)
          {
LABEL_28:
            uint64_t v24 = v21;
LABEL_29:
            (*(void (**)(void))(a1 + 1168))();
            return v24;
          }
          LOWORD(v16) = v28;
          if (v27) {
            LODWORD(v16) = WORD1(v28);
          }
        }
        uint64_t v23 = v14;
      }
      else
      {
        unsigned int v17 = v13 + a2;
        uint64_t v18 = v15 + 4 * (v13 + a2);
        int v20 = *(unsigned __int8 *)(v18 + 2);
        int v19 = (unsigned char *)(v18 + 2);
        if (v20 && *(unsigned char *)(v15 + 4 * (v17 + 1) + 2)) {
          goto LABEL_16;
        }
        uint64_t v21 = sub_100017D48(a1, (unsigned __int16)(v14 + v27), &v28);
        if (v21) {
          goto LABEL_28;
        }
        if (*v19) {
LABEL_16:
        }
          __int16 v22 = *(_WORD *)(v15 + 4 * v17);
        else {
          __int16 v22 = v28;
        }
        *(_WORD *)(a4 + 2 * v14) = v22;
        uint64_t v16 = v17 + 1;
        if (*(unsigned char *)(v15 + 4 * v16 + 2)) {
          LOWORD(v16) = *(_WORD *)(v15 + 4 * v16);
        }
        else {
          LOWORD(v16) = WORD1(v28);
        }
        uint64_t v23 = v13 | 1u;
      }
      *(_WORD *)(a4 + 2 * v23) = v16;
      v14 += 2;
      int v13 = v14;
      if (v14 >= a3)
      {
        uint64_t v24 = 0;
        goto LABEL_29;
      }
    }
  }
  return v24;
}

uint64_t sub_1000174A0(uint64_t a1)
{
  int v14 = 0;
  uint64_t updated = e1000_update_nvm_checksum_generic(a1);
  if (!updated)
  {
    if (*(_DWORD *)(a1 + 1216) != 6) {
      return 0;
    }
    uint32_t v15 = 0;
    (*(void (**)(uint64_t))(a1 + 1152))(a1);
    int v3 = sub_100017BD0(a1, &v15);
    int v4 = *(_DWORD *)(a1 + 1224);
    if (v3 || !v15)
    {
      uint64_t updated = sub_1000180CC(a1, 1);
      if (!updated)
      {
        int v5 = v4;
        int v4 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t updated = sub_1000180CC(a1, 0);
      if (!updated)
      {
        int v5 = 0;
LABEL_9:
        unint64_t v6 = 0;
        uint64_t v7 = (unsigned char *)(a1 + 1384);
        int v8 = v5;
        do
        {
          uint64_t v9 = sub_100017D48(a1, v4 + (int)v6, &v14);
          uint64_t updated = v9;
          if (*(v7 - 4)) {
            LOWORD(v14) = *((_WORD *)v7 - 3);
          }
          if (*v7) {
            HIWORD(v14) = *((_WORD *)v7 - 1);
          }
          if (v9) {
            goto LABEL_23;
          }
          if (v6 == 18) {
            v14 |= 0xC0000000;
          }
          IODelay(0x64uLL);
          if (sub_100018280(a1, v8 + (int)v6, v14)) {
            goto LABEL_22;
          }
          v7 += 8;
          BOOL v10 = v6 > 0x7FD;
          v6 += 2;
        }
        while (!v10);
        uint64_t updated = sub_100017D48(a1, v8 + 18, &v14);
        if (updated) {
          goto LABEL_23;
        }
        v14 &= ~0x40000000u;
        if (sub_100018280(a1, v8 + 18, v14))
        {
LABEL_22:
          uint64_t updated = 0xFFFFFFFFLL;
          goto LABEL_23;
        }
        uint64_t updated = sub_100017D48(a1, v4 + 18, &v14);
        if (!updated)
        {
          v14 &= 0xFFFFFFu;
          if (sub_100018280(a1, v4 + 18, v14)) {
            goto LABEL_22;
          }
          for (uint64_t i = 0; i != 0x2000; i += 4)
          {
            uint64_t v12 = a1 + i;
            *(unsigned char *)(v12 + 1380) = 0;
            *(_WORD *)(v12 + 1378) = -1;
          }
          (*(void (**)(uint64_t))(a1 + 1168))(a1);
          (*(void (**)(uint64_t))(a1 + 1176))(a1);
          IODelay(0x2710uLL);
          return 0;
        }
      }
    }
LABEL_23:
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
  }
  return updated;
}

uint64_t sub_1000176C4(uint64_t a1, unsigned int a2, unsigned int a3, __int16 *a4)
{
  uint32_t v19 = 0;
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    (*(void (**)(void))(a1 + 1152))();
    int v11 = sub_100017BD0(a1, &v19);
    int v12 = 0;
    if (!v11 && v19) {
      int v12 = *(_DWORD *)(a1 + 1224);
    }
    __int16 v18 = 0;
    uint64_t v16 = a3;
    unsigned int v13 = 2 * (v12 + a2);
    uint64_t v14 = a1 + 4 * a2 + 1378;
    while (1)
    {
      uint32_t v15 = (__int16 *)v14;
      if (!*(unsigned char *)(v14 + 2))
      {
        uint32_t v15 = &v18;
        if (sub_100017E38(a1, v13, 2, &v18)) {
          break;
        }
      }
      *a4++ = *v15;
      v13 += 2;
      v14 += 4;
      if (!--v16) {
        goto LABEL_14;
      }
    }
    uint64_t v16 = 0xFFFFFFFFLL;
LABEL_14:
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
  }
  return v16;
}

uint64_t sub_1000177D0(uint64_t a1)
{
  unsigned __int16 v16 = 0;
  uint64_t updated = e1000_update_nvm_checksum_generic(a1);
  if (!updated)
  {
    if (*(_DWORD *)(a1 + 1216) != 6) {
      return 0;
    }
    uint32_t v17 = 0;
    (*(void (**)(uint64_t))(a1 + 1152))(a1);
    int v3 = sub_100017BD0(a1, &v17);
    int v4 = *(_DWORD *)(a1 + 1224);
    if (v3 || !v17)
    {
      uint64_t updated = sub_1000180CC(a1, 1);
      if (!updated)
      {
        int v5 = v4;
        int v4 = 0;
LABEL_9:
        uint64_t v6 = 0;
        int v7 = 2 * v4;
        int v8 = 2 * v5;
        uint64_t v9 = 1380;
        do
        {
          if (*(unsigned char *)(a1 + v9))
          {
            uint64_t v10 = a1 + 2 * v6;
            unsigned int v11 = *(unsigned __int16 *)(v10 + 1378);
            unsigned __int16 v16 = *(_WORD *)(v10 + 1378);
          }
          else
          {
            if (sub_100017E38(a1, v7 + (int)v6, 2, &v16)) {
              goto LABEL_23;
            }
            unsigned int v11 = v16;
          }
          if (v6 == 38)
          {
            unsigned __int16 v16 = v11 | 0xC000;
            int v12 = ((unsigned __int16)(v11 | 0xC000) >> 8);
          }
          else
          {
            int v12 = v11 >> 8;
          }
          IODelay(0x64uLL);
          if (sub_100018414(a1, v8 + (int)v6, v11)) {
            goto LABEL_23;
          }
          IODelay(0x64uLL);
          if (sub_100018414(a1, v8 + (int)v6 + 1, v12)) {
            goto LABEL_23;
          }
          v6 += 2;
          v9 += 4;
        }
        while (v6 != 4096);
        if (sub_100017E38(a1, v8 + 38, 2, &v16)
          || sub_100018414(a1, (v8 + 38) | 1u, HIBYTE(v16) & 0xBF)
          || sub_100018414(a1, v7 + 39, 0))
        {
LABEL_23:
          uint64_t updated = 0xFFFFFFFFLL;
          goto LABEL_24;
        }
        for (uint64_t i = 0; i != 0x2000; i += 4)
        {
          uint64_t v14 = a1 + i;
          *(unsigned char *)(v14 + 1380) = 0;
          *(_WORD *)(v14 + 1378) = -1;
        }
        (*(void (**)(uint64_t))(a1 + 1168))(a1);
        (*(void (**)(uint64_t))(a1 + 1176))(a1);
        IODelay(0x2710uLL);
        return 0;
      }
    }
    else
    {
      uint64_t updated = sub_1000180CC(a1, 0);
      if (!updated)
      {
        int v5 = 0;
        goto LABEL_9;
      }
    }
LABEL_24:
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
  }
  return updated;
}

uint64_t sub_1000179F4(uint64_t a1, _WORD *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _WORD *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v4 = (unsigned __int16)*a2;
    if (v4 == 0xFFFF || v4 == 0) {
      *a2 = 6529;
    }
  }
  return result;
}

uint64_t sub_100017A4C(uint64_t a1)
{
  unsigned __int16 v6 = 0;
  if ((*(_DWORD *)(a1 + 284) - 24) >= 5) {
    uint64_t v2 = 25;
  }
  else {
    uint64_t v2 = 3;
  }
  if ((*(_DWORD *)(a1 + 284) - 24) < 5) {
    __int16 v3 = 1;
  }
  else {
    __int16 v3 = 64;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, v2, 1, &v6);
  if (!result)
  {
    if (((unsigned __int16)v3 & v6) != 0) {
      return e1000_validate_nvm_checksum_generic(a1);
    }
    int v5 = *(_DWORD *)(a1 + 284);
    if (v5 > 26)
    {
      if (v5 == 27) {
        return 0;
      }
      return e1000_validate_nvm_checksum_generic(a1);
    }
    v6 |= v3;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1208))(a1, v2, 1, &v6);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1184))(a1);
      if (!result) {
        return e1000_validate_nvm_checksum_generic(a1);
      }
    }
  }
  return result;
}

uint64_t sub_100017B2C(uint64_t a1, unsigned int a2, unsigned int a3, __int16 *a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    (*(void (**)(uint64_t))(a1 + 1152))(a1);
    uint64_t v11 = a3;
    int v12 = (unsigned char *)(a1 + 4 * a2 + 1380);
    do
    {
      *int v12 = 1;
      __int16 v13 = *a4++;
      *((_WORD *)v12 - 1) = v13;
      v12 += 4;
      --v11;
    }
    while (v11);
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
    return 0;
  }
  return result;
}

uint64_t sub_100017BD0(uint64_t a1, uint32_t *a2)
{
  int v4 = *(_DWORD *)(a1 + 1224);
  int v9 = 0;
  int v5 = *(_DWORD *)(a1 + 284);
  if ((v5 - 25) >= 4)
  {
    if ((v5 - 19) < 2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      if ((~readData & 0x300) == 0)
      {
        uint64_t result = 0;
        uint32_t v7 = (readData >> 22) & 1;
LABEL_8:
        *a2 = v7;
        return result;
      }
      int v5 = *(_DWORD *)(a1 + 284);
    }
    *a2 = 0;
    __int16 v10 = 0;
    if (v5 <= 24 && !sub_100017E38(a1, 0x27u, 1, &v10))
    {
      if ((v10 & 0xC0) == 0x80) {
        goto LABEL_4;
      }
      __int16 v11 = 0;
      if (*(int *)(a1 + 284) <= 24 && !sub_100017E38(a1, 2 * v4 + 39, 1, &v11) && (v11 & 0xC0) == 0x80)
      {
LABEL_16:
        uint64_t result = 0;
        uint32_t v7 = 1;
        goto LABEL_8;
      }
    }
    return 0xFFFFFFFFLL;
  }
  *a2 = 0;
  uint64_t result = sub_100017D48(a1, 0x13u, &v9);
  if (!result)
  {
    if ((v9 & 0xC000) == 0x8000)
    {
LABEL_4:
      uint64_t result = 0;
      *a2 = 0;
      return result;
    }
    uint64_t result = sub_100017D48(a1, v4 + 19, &v9);
    if (!result)
    {
      if ((v9 & 0xC000) == 0x8000) {
        goto LABEL_16;
      }
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_100017D48(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (!a3 || (a2 >> 23)) {
    return 0xFFFFFFFFLL;
  }
  if (*(int *)(a1 + 284) >= 25)
  {
    unsigned int v6 = 0;
    int v7 = *(_DWORD *)(a1 + 1228) + 2 * a2;
    do
    {
      IODelay(1uLL);
      if (sub_100017F38(a1)) {
        break;
      }
      __dmb(0xDu);
      unsigned int v8 = *(_DWORD *)(*(void *)(a1 + 24) + 4) & 0xFCF90000 | 0x3000000;
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 4) = v8;
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 8) = v7;
      uint64_t result = sub_100018018(a1);
      __dmb(0xDu);
      uint64_t v9 = *(void *)(a1 + 24);
      if (!result)
      {
        *a3 = *(_DWORD *)(v9 + 16);
        return result;
      }
    }
    while ((*(_WORD *)(v9 + 4) & 3) != 0 && v6++ < 0xA);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100017E38(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  if (HIBYTE(a2)) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v8 = 0;
  unsigned int v9 = *(_DWORD *)(a1 + 1228) + a2;
  __int16 v10 = (((_BYTE)a3 - 1) & 3) << 8;
  while (1)
  {
    IODelay(1uLL);
    if (sub_100017F38(a1)) {
      return 0xFFFFFFFFLL;
    }
    __dmb(0xDu);
    __int16 v11 = *(_WORD *)(*(void *)(a1 + 24) + 6) & 0xFCF9 | v10;
    __dmb(0xEu);
    *(_WORD *)(*(void *)(a1 + 24) + 6) = v11;
    __dmb(0xEu);
    *(_DWORD *)(*(void *)(a1 + 24) + 8) = v9;
    uint64_t result = sub_100018018(a1);
    __dmb(0xDu);
    uint64_t v12 = *(void *)(a1 + 24);
    if (!result) {
      break;
    }
    if ((*(_WORD *)(v12 + 4) & 3) == 0 || v8++ >= 0xA) {
      return 0xFFFFFFFFLL;
    }
  }
  int v14 = *(_DWORD *)(v12 + 16);
  if (a3 == 1) {
    LOWORD(v14) = v14;
  }
  *a4 = v14;
  return result;
}

uint64_t sub_100017F38(uint64_t a1)
{
  __dmb(0xDu);
  int v1 = *(unsigned __int16 *)(*(void *)(a1 + 24) + 4);
  if ((v1 & 0x4000) == 0) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v1 | 6;
  int v5 = *(_DWORD *)(a1 + 284);
  __dmb(0xEu);
  if (v5 < 25)
  {
    *(_WORD *)(*(void *)(a1 + 24) + 4) = v4;
    if ((v1 & 0x20) != 0)
    {
LABEL_5:
      int v6 = 10000000;
      while (1)
      {
        __dmb(0xDu);
        int v7 = *(unsigned __int16 *)(*(void *)(a1 + 24) + 4);
        if ((v7 & 0x20) == 0) {
          break;
        }
        IODelay(1uLL);
        if (!--v6) {
          return 0xFFFFFFFFLL;
        }
      }
      int v8 = v7 | 1;
      int v9 = *(_DWORD *)(a1 + 284);
      __dmb(0xEu);
      goto LABEL_12;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 24) + 4) = v4;
    if ((v1 & 0x20) != 0) {
      goto LABEL_5;
    }
  }
  int v8 = v1 | 7;
  int v9 = *(_DWORD *)(a1 + 284);
  __dmb(0xEu);
LABEL_12:
  uint64_t result = 0;
  if (v9 < 25) {
    *(_WORD *)(*(void *)(a1 + 24) + 4) = v8;
  }
  else {
    *(_DWORD *)(*(void *)(a1 + 24) + 4) = v8;
  }
  return result;
}

uint64_t sub_100018018(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 284);
  __dmb(0xDu);
  uint64_t v3 = *(void *)(a1 + 24);
  if (v2 < 25) {
    int v4 = *(unsigned __int16 *)(v3 + 6);
  }
  else {
    int v4 = HIWORD(*(_DWORD *)(v3 + 4));
  }
  int v5 = v4 | 1;
  int v6 = *(_DWORD *)(a1 + 284);
  __dmb(0xEu);
  if (v6 < 25) {
    *(_WORD *)(*(void *)(a1 + 24) + 6) = v5;
  }
  else {
    *(_DWORD *)(*(void *)(a1 + 24) + 4) = v5 << 16;
  }
  int v7 = 10000001;
  while (1)
  {
    __dmb(0xDu);
    __int16 v8 = *(_WORD *)(*(void *)(a1 + 24) + 4);
    if (v8) {
      break;
    }
    IODelay(1uLL);
    if (!--v7) {
      return 0xFFFFFFFFLL;
    }
  }
  if ((v8 & 2) == 0) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000180CC(uint64_t a1, int a2)
{
  unsigned int v2 = 2 * *(_DWORD *)(a1 + 1224);
  __dmb(0xDu);
  int v3 = (*(unsigned __int16 *)(*(void *)(a1 + 24) + 4) >> 3) & 3;
  int v4 = 4096;
  switch(v3)
  {
    case 1:
      goto LABEL_7;
    case 2:
      int v3 = 1;
      int v4 = 0x2000;
      goto LABEL_7;
    case 3:
      int v3 = 1;
      int v4 = 0x10000;
      goto LABEL_7;
    default:
      if (v2 < 0x100) {
        return 0;
      }
      int v3 = v2 >> 8;
      int v4 = 256;
LABEL_7:
      int v7 = 0;
      int v8 = 0;
      int v9 = 0;
      if (!a2) {
        unsigned int v2 = 0;
      }
      unsigned int v10 = *(_DWORD *)(a1 + 1228) + v2;
      break;
  }
LABEL_10:
  if (v8 <= 9) {
    int v11 = 9;
  }
  else {
    int v11 = v8;
  }
  int v12 = v11 + 1;
  unsigned int v13 = v10 + v7;
  while (1)
  {
    unsigned int v10 = v13;
    if (sub_100017F38(a1)) {
      return 0xFFFFFFFFLL;
    }
    int v14 = *(_DWORD *)(a1 + 284);
    __dmb(0xDu);
    uint64_t v15 = *(void *)(a1 + 24);
    if (v14 < 25) {
      int v16 = *(unsigned __int16 *)(v15 + 6);
    }
    else {
      int v16 = HIWORD(*(_DWORD *)(v15 + 4));
    }
    int v17 = v16 | 6;
    int v18 = *(_DWORD *)(a1 + 284);
    __dmb(0xEu);
    if (v18 < 25) {
      *(_WORD *)(*(void *)(a1 + 24) + 6) = v17;
    }
    else {
      *(_DWORD *)(*(void *)(a1 + 24) + 4) = v17 << 16;
    }
    __dmb(0xEu);
    *(_DWORD *)(*(void *)(a1 + 24) + 8) = v10;
    if (!sub_100018018(a1)) {
      goto LABEL_25;
    }
    __dmb(0xDu);
    if ((*(_WORD *)(*(void *)(a1 + 24) + 4) & 3) == 0) {
      return 0xFFFFFFFFLL;
    }
    ++v8;
    unsigned int v13 = v10 + v7;
    if (v12 == v8)
    {
      int v8 = v12;
LABEL_25:
      ++v9;
      v7 += v4;
      if (v9 == v3) {
        return 0;
      }
      goto LABEL_10;
    }
  }
}

uint64_t sub_100018280(uint64_t a1, int a2, int a3)
{
  unsigned int v5 = 2 * a2;
  uint64_t result = sub_1000182F8(a1, 2 * a2, a3);
  if (result)
  {
    unsigned int v7 = 0;
    while (1)
    {
      IODelay(0x64uLL);
      if (!sub_1000182F8(a1, v5, a3)) {
        break;
      }
      if (v7++ >= 0x63)
      {
        unsigned int v7 = 100;
        break;
      }
    }
    if (v7 == 100) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000182F8(uint64_t a1, unsigned int a2, int a3)
{
  if (!HIBYTE(a2) || *(int *)(a1 + 284) <= 24)
  {
    unsigned int v5 = 0;
    int v6 = *(_DWORD *)(a1 + 1228) + (a2 & 0xFFFFFF);
    do
    {
      IODelay(1uLL);
      if (sub_100017F38(a1)) {
        break;
      }
      int v7 = *(_DWORD *)(a1 + 284);
      __dmb(0xDu);
      uint64_t v8 = *(void *)(a1 + 24);
      if (v7 < 25) {
        int v9 = *(unsigned __int16 *)(v8 + 6);
      }
      else {
        int v9 = HIWORD(*(_DWORD *)(v8 + 4));
      }
      unsigned int v10 = v9 & 0xFFFFFCF9 | 0x304;
      int v11 = *(_DWORD *)(a1 + 284);
      __dmb(0xEu);
      if (v11 < 25) {
        *(_WORD *)(*(void *)(a1 + 24) + 6) = v10;
      }
      else {
        *(_DWORD *)(*(void *)(a1 + 24) + 4) = v10 << 16;
      }
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 8) = v6;
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 16) = a3;
      uint64_t result = sub_100018018(a1);
      if (!result) {
        return result;
      }
      __dmb(0xDu);
    }
    while ((*(_WORD *)(*(void *)(a1 + 24) + 4) & 3) != 0 && v5++ < 0xA);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100018414(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = sub_100018488(a1, a2, a3);
  if (result)
  {
    unsigned int v7 = 0;
    while (1)
    {
      IODelay(0x64uLL);
      if (!sub_100018488(a1, a2, a3)) {
        break;
      }
      if (v7++ >= 0x63)
      {
        unsigned int v7 = 100;
        break;
      }
    }
    if (v7 == 100) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100018488(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!HIBYTE(a2) && *(int *)(a1 + 284) <= 24)
  {
    unsigned int v6 = 0;
    unsigned int v7 = *(_DWORD *)(a1 + 1228) + a2;
    do
    {
      IODelay(1uLL);
      if (sub_100017F38(a1)) {
        break;
      }
      int v8 = *(_DWORD *)(a1 + 284);
      __dmb(0xDu);
      uint64_t v9 = *(void *)(a1 + 24);
      if (v8 < 25) {
        LOWORD(v9) = *(_WORD *)(v9 + 6);
      }
      else {
        LODWORD(v9) = HIWORD(*(_DWORD *)(v9 + 4));
      }
      int v10 = v9 & 0xFCF9 | 4;
      int v11 = *(_DWORD *)(a1 + 284);
      __dmb(0xEu);
      if (v11 < 25) {
        *(_WORD *)(*(void *)(a1 + 24) + 6) = v10;
      }
      else {
        *(_DWORD *)(*(void *)(a1 + 24) + 4) = v10 << 16;
      }
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 8) = v7;
      __dmb(0xEu);
      *(_DWORD *)(*(void *)(a1 + 24) + 16) = a3;
      uint64_t result = sub_100018018(a1);
      if (!result) {
        return result;
      }
      __dmb(0xDu);
    }
    while ((*(_WORD *)(*(void *)(a1 + 24) + 4) & 3) != 0 && v6++ < 0xA);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000185A4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1134)) {
    return 12;
  }
  int v2 = 31;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    if ((readData & 0x40) != 0) {
      break;
    }
    IODelay(0x2710uLL);
    if (!--v2) {
      return 12;
    }
  }
  return 0;
}

uint64_t sub_100018618(uint64_t a1)
{
  e1000_get_cfg_done_generic();
  if (*(int *)(a1 + 284) < 21)
  {
    e1000_get_auto_rd_done_generic(a1);
  }
  else
  {
    int v2 = -1499;
    do
    {
      int v3 = v2;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      __int16 v4 = readData;
      IODelay(0x64uLL);
      if ((v4 & 0x200) != 0) {
        break;
      }
      int v2 = v3 + 1;
    }
    while (v3);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData & 0xFFFFFDFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, v5);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if ((readData & 0x400) != 0)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, v6 & 0xFFFFFBFF);
  }
  if (*(int *)(a1 + 284) > 20)
  {
    if (sub_100017BD0(a1, &readData)) {
      return 4294967293;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
    uint64_t result = 0;
    __dmb(1u);
    if ((readData & 0x100) == 0)
    {
      if (*(_DWORD *)(a1 + 1072) == 6) {
        e1000_phy_init_script_igp3(a1);
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001877C(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 1072) == 7) {
    return 0;
  }
  __int16 v10 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
  __dmb(1u);
  uint32_t v5 = readData;
  __dmb(2u);
  uint32_t v6 = *(IOPCIDevice **)(a1 + 16);
  if (a2)
  {
    IOPCIDevice::MemoryWrite32(v6, 0, 0xF10uLL, v5 | 2);
    uint64_t result = 0;
    if (*(_DWORD *)(a1 + 1072) != 6) {
      return result;
    }
    if (*(_DWORD *)(a1 + 284) == 19) {
      e1000_gig_downshift_workaround_ich8lan(a1);
    }
LABEL_13:
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v10);
    if (result) {
      return result;
    }
    __int16 v8 = v10 & 0xFF7F;
    goto LABEL_15;
  }
  IOPCIDevice::MemoryWrite32(v6, 0, 0xF10uLL, v5 & 0xFFFFFFFD);
  uint64_t result = 0;
  if (*(_DWORD *)(a1 + 1072) != 6) {
    return result;
  }
  int v7 = *(_DWORD *)(a1 + 1096);
  if (v7 == 2) {
    goto LABEL_13;
  }
  if (v7 != 1) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v10);
  if (!result)
  {
    __int16 v8 = v10 | 0x80;
LABEL_15:
    __int16 v10 = v8;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000188C0(uint64_t a1, char a2)
{
  __int16 v14 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
  __dmb(1u);
  if (a2)
  {
    unsigned int v4 = *(unsigned __int16 *)(a1 + 1120);
    BOOL v5 = v4 > 0x2F;
    uint64_t v6 = (1 << v4) & 0x800000008008;
    if (!v5 && v6 != 0)
    {
      uint32_t v8 = readData | 4;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v8);
      uint64_t result = 0;
      if (*(_DWORD *)(a1 + 1072) != 6) {
        return result;
      }
      if (*(_DWORD *)(a1 + 284) == 19) {
        e1000_gig_downshift_workaround_ich8lan(a1);
      }
LABEL_14:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v14);
      if (result) {
        return result;
      }
      __int16 v12 = v14 & 0xFF7F;
      goto LABEL_16;
    }
  }
  else
  {
    uint32_t v10 = readData & 0xFFFFFFFB;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v10);
    uint64_t result = 0;
    if (*(_DWORD *)(a1 + 1072) != 6) {
      return result;
    }
    int v11 = *(_DWORD *)(a1 + 1096);
    if (v11 == 2) {
      goto LABEL_14;
    }
    if (v11 == 1)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v14);
      if (result) {
        return result;
      }
      __int16 v12 = v14 | 0x80;
LABEL_16:
      __int16 v14 = v12;
      return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
    }
  }
  return 0;
}

void sub_100018A20(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(a1 + 64))() & 1) == 0 && !(*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
  {
    e1000_power_down_phy_copper(a1);
  }
}

uint64_t sub_100018A84(uint64_t a1, int a2)
{
  unsigned __int16 v8 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 24601, &v8);
  if (!result)
  {
    if (a2) {
      __int16 v5 = 4;
    }
    else {
      __int16 v5 = 0;
    }
    unsigned __int16 v8 = v8 & 0xFFFB | v5;
    int v6 = (*(uint64_t (**)(uint64_t))(a1 + 920))(a1);
    uint64_t v7 = v8;
    if (!v6)
    {
      uint64_t v7 = v8 | 0x400u;
      v8 |= 0x400u;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 24601, v7);
  }
  return result;
}

uint64_t sub_100018B1C(uint64_t a1)
{
  unsigned __int16 v15 = 0;
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    int phy_id = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 2, &v15);
    int v5 = v15;
    if (!phy_id && v15 != 0xFFFF)
    {
      int phy_id = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 3, &v15);
      char v7 = v15;
      if (!phy_id && v15 != 0xFFFF) {
        break;
      }
    }
    char v2 = 0;
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
  }
  int v10 = v15 & 0xFFF0 | (v5 << 16);
  int v11 = *(_DWORD *)(a1 + 1104);
  if (v11)
  {
    if (v11 == v10) {
      goto LABEL_23;
    }
  }
  else if (v10)
  {
    *(_DWORD *)(a1 + 1104) = v10;
    *(_DWORD *)(a1 + 1112) = v7 & 0xF;
    goto LABEL_23;
  }
  int phy_id = 0;
LABEL_12:
  if (*(int *)(a1 + 284) <= 23)
  {
    (*(void (**)(uint64_t))(a1 + 1000))(a1);
    int phy_id = sub_100016C40(a1);
    if (!phy_id) {
      int phy_id = e1000_get_phy_id(a1);
    }
    (*(void (**)(uint64_t))(a1 + 896))(a1);
  }
  if (phy_id) {
    return 0;
  }
LABEL_23:
  if (*(int *)(a1 + 284) >= 24)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    if ((readData & 0x8000) == 0)
    {
      (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 984))(a1, 24631, &v15);
      v15 &= ~1u;
      (*(void (**)(uint64_t, uint64_t))(a1 + 1040))(a1, 24631);
      uint32_t v13 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &v13);
      __dmb(1u);
      uint32_t v12 = v13 & 0xFFFFF7FF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v12);
    }
  }
  return 1;
}

void *e1000_init_function_pointers_82540(void *result)
{
  result[5] = sub_100018D30;
  result[143] = sub_100018F4C;
  result[111] = sub_100019090;
  return result;
}

uint64_t sub_100018D30(uint64_t a1)
{
  int v1 = 0;
  unsigned int v2 = *(unsigned __int16 *)(a1 + 9584);
  unsigned int v3 = 2;
  if (v2 > 0x1027)
  {
    switch(v2)
    {
      case 0x107Bu:
        goto LABEL_10;
      case 0x107Au:
        goto LABEL_12;
      case 0x1028u:
LABEL_10:
        int v1 = 0;
        unsigned int v3 = 3;
        goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v2 - 4113 >= 2 && v2 != 4135)
  {
LABEL_11:
    unsigned int v3 = 1;
    int v1 = 1;
  }
LABEL_12:
  *(_DWORD *)(a1 + 1116) = v3;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(void *)(a1 + 104) = e1000_get_bus_info_pci_generic;
  *(void *)(a1 + 112) = e1000_set_lan_id_multi_port_pci;
  *(void *)(a1 + 152) = sub_1000191E4;
  *(void *)(a1 + 160) = sub_100019348;
  *(void *)(a1 + 192) = e1000_setup_link_generic;
  int v5 = sub_1000196B0;
  BOOL v6 = v1 == 0;
  if (v1) {
    int v5 = sub_100019560;
  }
  *(void *)(a1 + 200) = v5;
  char v7 = off_100038340[v3 - 1];
  unsigned __int16 v8 = e1000_get_speed_and_duplex_fiber_serdes_generic;
  if (!v6) {
    unsigned __int16 v8 = e1000_get_speed_and_duplex_copper_generic;
  }
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  *(void *)(a1 + 96) = e1000_clear_vfta_generic;
  *(void *)(a1 + 240) = sub_100019844;
  *(void *)(a1 + 48) = e1000_id_led_init_generic;
  *(void *)(a1 + 208) = e1000_setup_led_generic;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = e1000_cleanup_led_generic;
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 128) = e1000_led_on_generic;
  *(void *)(a1 + 136) = e1000_led_off_generic;
  *(void *)(a1 + 88) = sub_1000198EC;
  return 0;
}

uint64_t sub_100018F4C(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  *(_DWORD *)(a1 + 1216) = 3;
  *(_WORD *)(a1 + 1234) = 50;
  *(_WORD *)(a1 + 1238) = 3;
  int v3 = *(_DWORD *)(a1 + 1220);
  if (v3 == 3)
  {
    *(_WORD *)(a1 + 1236) = 6;
    __int16 v4 = 64;
  }
  else if (v3 == 4)
  {
    *(_WORD *)(a1 + 1236) = 8;
    __int16 v4 = 256;
  }
  else
  {
    BOOL v5 = (v2 & 0x200) == 0;
    if ((v2 & 0x200) != 0) {
      __int16 v6 = 8;
    }
    else {
      __int16 v6 = 6;
    }
    *(_WORD *)(a1 + 1236) = v6;
    if (v5) {
      __int16 v4 = 64;
    }
    else {
      __int16 v4 = 256;
    }
  }
  *(_WORD *)(a1 + 1232) = v4;
  *(void *)(a1 + 1152) = e1000_acquire_nvm_generic;
  *(void *)(a1 + 1160) = e1000_read_nvm_microwire;
  *(void *)(a1 + 1168) = e1000_release_nvm_generic;
  *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
  *(void *)(a1 + 1192) = e1000_valid_led_default_generic;
  *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
  *(void *)(a1 + 1208) = e1000_write_nvm_microwire;
  return 0;
}

uint64_t sub_100019090(uint64_t a1)
{
  *(_DWORD *)(a1 + 1100) = 1;
  *(_WORD *)(a1 + 1122) = 47;
  *(_DWORD *)(a1 + 1108) = 10000;
  *(_DWORD *)(a1 + 1072) = 2;
  *(void *)(a1 + 912) = e1000_check_polarity_m88;
  *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
  *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_m88;
  *(void *)(a1 + 952) = e1000_get_cable_length_m88;
  *(void *)(a1 + 944) = e1000_get_cfg_done_generic;
  *(void *)(a1 + 976) = e1000_read_phy_reg_m88;
  *(void *)(a1 + 1008) = e1000_phy_hw_reset_generic;
  *(void *)(a1 + 1032) = e1000_write_phy_reg_m88;
  *(void *)(a1 + 960) = e1000_get_phy_info_m88;
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = sub_100019B64;
  uint64_t result = e1000_get_phy_id(a1);
  if (!result)
  {
    if ((*(_DWORD *)(a1 + 284) - 4) <= 4 && *(_DWORD *)(a1 + 1104) == 21040160) {
      return 0;
    }
    else {
      return 4294967294;
    }
  }
  return result;
}

uint64_t sub_1000191E4(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  int v3 = *(_DWORD *)(a1 + 284);
  if (v3 == 8 || v3 == 6)
  {
    __dmb(2u);
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 0;
    __dmb(2u);
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, v2 | 0x4000000);
  IODelay(0x1388uLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  __dmb(1u);
  uint32_t v5 = readData & 0xFFFFDFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, v5);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
  __dmb(1u);
  return 0;
}

uint64_t sub_100019348(uint64_t a1)
{
  (*(void (**)(void))(a1 + 48))();
  if (*(int *)(a1 + 284) <= 5)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x38uLL, 0);
  }
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  if (*(_WORD *)(a1 + 326))
  {
    int v2 = 0;
    unsigned int v3 = 0;
    do
    {
      __dmb(2u);
      if (v2 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v4 = 64;
        }
        else {
          unsigned int v4 = 21504;
        }
      }
      else if (v2)
      {
        if (v2 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v4 = 1536;
          }
          else {
            unsigned int v4 = 22016;
          }
        }
        else
        {
          unsigned int v4 = v2 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v4 = 512;
      }
      else
      {
        unsigned int v4 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
      __dmb(1u);
      ++v3;
      v2 += 4;
    }
    while (v3 < *(unsigned __int16 *)(a1 + 326));
  }
  if (*(int *)(a1 + 284) <= 5) {
    e1000_pcix_mmrbc_workaround_generic(a1);
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &v11);
  __dmb(1u);
  uint32_t v6 = v11 & 0xFEC0FFFF | 0x1010000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v6);
  sub_1000198EC(a1);
  int v7 = *(unsigned __int16 *)(a1 + 9584);
  if (v7 == 4277 || v7 == 4249)
  {
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &v10);
    __dmb(1u);
    uint32_t v8 = v10 | 0x20000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v8);
  }
  return v5;
}

uint64_t sub_100019560(uint64_t a1)
{
  __int16 v7 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  int v3 = *(_DWORD *)(a1 + 284);
  if (v3 == 6)
  {
    __int16 v8 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 7, 1, &v8)) {
      return 4294967294;
    }
    if (v8 <= -2)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 11)
        || (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 30, 33028))
      {
        return 4294967294;
      }
      *(unsigned char *)(a1 + 1134) = 0;
    }
    int v3 = *(_DWORD *)(a1 + 284);
  }
  BOOL v5 = v3 == 8 || v3 == 6;
  if (!v5
    || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v7), !result)
    && (v7 |= 8u, uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16), !result))
  {
    uint64_t result = e1000_copper_link_setup_m88(a1);
    if (!result) {
      return e1000_setup_copper_link_generic(a1);
    }
  }
  return result;
}

uint64_t sub_1000196B0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 284);
  if (v2 != 8 && v2 != 6) {
    return e1000_setup_fiber_serdes_link_generic(a1);
  }
  if (*(_DWORD *)(a1 + 1116) != 3) {
    goto LABEL_24;
  }
  unsigned __int16 v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1160))(a1, 6, 1, &v6);
  if (!result && v6 != 0xFFFF)
  {
    LOBYTE(v6) = v6 & 0xF;
    unsigned __int16 v6 = v6;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 26);
  }
  if (!result)
  {
LABEL_24:
    int v7 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 29, (char *)&v7 + 2);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 5);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 30, &v7);
        if (!result)
        {
          LOWORD(v7) = v7 & 0xFEFF;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 30);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 29, 4);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 30, &v7);
              if (!result)
              {
                LOWORD(v7) = v7 | 0x800;
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 30);
                if (!result)
                {
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 29, HIWORD(v7));
                  if (!result) {
                    return e1000_setup_fiber_serdes_link_generic(a1);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100019844(uint64_t a1)
{
  unsigned __int16 v2 = 0;
  __int16 v6 = 0;
  for (uint64_t i = 279; ; i += 2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v6);
    if (result) {
      break;
    }
    *(_WORD *)(a1 + i - 1) = v6;
    unint64_t v5 = i - 279;
    ++v2;
    if (v5 >= 4)
    {
      if (*(_WORD *)(a1 + 1260) == 1) {
        *(unsigned char *)(a1 + 283) ^= 1u;
      }
      *(_WORD *)(a1 + 276) = *(_WORD *)(a1 + 282);
      *(_DWORD *)(a1 + 272) = *(_DWORD *)(a1 + 278);
      return result;
    }
  }
  return result;
}

void sub_1000198EC(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
}

void sub_100019B64(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  __dmb(1u);
  if ((readData & 1) == 0) {
    e1000_power_down_phy_copper(a1);
  }
}

void *e1000_init_mac_ops_generic(void *result)
{
  result[5] = e1000_null_ops_generic;
  result[19] = e1000_null_ops_generic;
  result[20] = e1000_null_ops_generic;
  result[25] = e1000_null_ops_generic;
  result[26] = e1000_null_ops_generic;
  result[13] = e1000_null_ops_generic;
  result[14] = sub_100019CC4;
  result[30] = e1000_read_mac_addr_generic;
  result[28] = sub_100019D14;
  result[10] = e1000_null_ops_generic;
  result[11] = e1000_null_mac_generic;
  result[16] = e1000_null_ops_generic;
  result[17] = e1000_null_ops_generic;
  result[24] = e1000_null_ops_generic;
  result[15] = e1000_null_link_info;
  result[9] = e1000_null_ops_generic;
  result[7] = e1000_null_ops_generic;
  result[8] = e1000_null_mng_mode;
  result[18] = e1000_null_update_mc;
  result[12] = e1000_null_mac_generic;
  result[27] = e1000_null_write_vfta;
  result[31] = sub_100019DB0;
  result[29] = e1000_rar_set_generic;
  return result;
}

uint64_t e1000_null_ops_generic()
{
  return 0;
}

void sub_100019CC4(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  *(_WORD *)(a1 + 1260) = ((unsigned __int16)readData >> 2) & 3;
}

void sub_100019D14(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFC00FFF | 0x3F000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v3);
  __dmb(1u);
}

uint64_t e1000_null_link_info()
{
  return 0;
}

uint64_t e1000_null_mng_mode()
{
  return 0;
}

uint64_t sub_100019DB0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 851)) {
    return 0;
  }
  int v2 = *(unsigned __int8 *)(a1 + 1130);
  if (v2 != 3 && v2 != 0) {
    return 0;
  }
  *(unsigned char *)(a1 + 1130) = 1;
  return 4294967293;
}

uint64_t e1000_rar_set_generic(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint32_t v5 = *(_DWORD *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 4);
  int v7 = *(unsigned __int8 *)(a2 + 5);
  __dmb(2u);
  __int16 v8 = *(IOPCIDevice **)(a1 + 16);
  int v9 = 8 * a3;
  if (a3 >= 0x10) {
    int v10 = 21600;
  }
  else {
    int v10 = 21504;
  }
  int v11 = v10 + 8 * a3;
  if (v11 <= 10511)
  {
    if (v11 <= 10247)
    {
      if (v11 <= 9231)
      {
        int v12 = 8544;
        if (v11 == 8544)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 360;
        }
        else
        {
          int v12 = 8552;
          if (v11 != 8552) {
            goto LABEL_59;
          }
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 352;
        }
      }
      else
      {
        int v12 = 9232;
        if (v11 == 9232)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 0x8000;
        }
        else
        {
          int v12 = 9240;
          if (v11 == 9240)
          {
            BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 32776;
          }
          else
          {
            int v12 = 10240;
            if (v11 != 10240) {
              goto LABEL_59;
            }
            BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
            int v11 = 272;
          }
        }
      }
    }
    else if (v11 > 10271)
    {
      int v12 = 10272;
      if (v11 == 10272)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 264;
      }
      else
      {
        int v12 = 10496;
        if (v11 == 10496)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 312;
        }
        else
        {
          int v12 = 10504;
          if (v11 != 10504) {
            goto LABEL_59;
          }
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 320;
        }
      }
    }
    else
    {
      int v12 = 10248;
      if (v11 == 10248)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 280;
      }
      else
      {
        int v12 = 10256;
        if (v11 == 10256)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 288;
        }
        else
        {
          int v12 = 10264;
          if (v11 != 10264) {
            goto LABEL_59;
          }
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 296;
        }
      }
    }
  }
  else if (v11 > 14351)
  {
    if (v11 > 20991)
    {
      int v12 = 20992;
      if (v11 == 20992)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 512;
      }
      else
      {
        int v12 = 22016;
        if (v11 == 22016)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 1536;
        }
        else
        {
          int v12 = 21504;
          if (v11 != 21504) {
            goto LABEL_59;
          }
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 64;
        }
      }
    }
    else
    {
      int v12 = 14352;
      if (v11 == 14352)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 1072;
      }
      else
      {
        int v12 = 14360;
        if (v11 == 14360)
        {
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 1080;
        }
        else
        {
          int v12 = 14368;
          if (v11 != 14368) {
            goto LABEL_59;
          }
          BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
          int v11 = 1088;
        }
      }
    }
  }
  else if (v11 > 13335)
  {
    int v12 = 13336;
    if (v11 == 13336)
    {
      BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
      int v11 = 32792;
    }
    else
    {
      int v12 = 14336;
      if (v11 == 14336)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 1056;
      }
      else
      {
        int v12 = 14344;
        if (v11 != 14344) {
          goto LABEL_59;
        }
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 1064;
      }
    }
  }
  else
  {
    int v12 = 10512;
    if (v11 == 10512)
    {
      BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
      int v11 = 328;
    }
    else
    {
      int v12 = 10520;
      if (v11 == 10520)
      {
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 336;
      }
      else
      {
        int v12 = 13328;
        if (v11 != 13328) {
          goto LABEL_59;
        }
        BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
        int v11 = 32784;
      }
    }
  }
  if (!v13) {
    int v11 = v12;
  }
LABEL_59:
  IOPCIDevice::MemoryWrite32(v8, 0, v11, v5);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  __dmb(2u);
  if (a3 >= 0x10) {
    int v14 = 21604;
  }
  else {
    int v14 = 21508;
  }
  unsigned int v15 = v9 + v14;
  int v16 = 14340;
  if (v15 == 14340)
  {
    BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
    unsigned int v15 = 1060;
  }
  else
  {
    int v16 = 10500;
    if (v15 == 10500)
    {
      BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v15 = 316;
    }
    else
    {
      int v16 = 10244;
      if (v15 != 10244) {
        goto LABEL_70;
      }
      BOOL v17 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v15 = 276;
    }
  }
  if (!v17) {
    unsigned int v15 = v16;
  }
LABEL_70:
  int v18 = v6 | (v7 << 8);
  int v19 = v5 | v18;
  unsigned int v20 = v18 | 0x80000000;
  if (v19) {
    uint32_t v21 = v20;
  }
  else {
    uint32_t v21 = 0;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v15, v21);
  uint32_t v23 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v23);
  __dmb(1u);
  return 0;
}

uint64_t e1000_null_rar_set()
{
  return 0;
}

uint64_t e1000_get_bus_info_pci_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  if ((readData & 0x2000) != 0) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  *(_DWORD *)(a1 + 1248) = v3;
  if ((v2 & 0x2000) != 0)
  {
    int v5 = v2 & 0xC000;
    if ((v2 & 0xC000) != 0)
    {
      if (v5 == 0x4000) {
        int v6 = 3;
      }
      else {
        int v6 = 8;
      }
      if (v5 == 0x8000) {
        int v4 = 5;
      }
      else {
        int v4 = v6;
      }
    }
    else
    {
      int v4 = 2;
    }
  }
  else if ((v2 & 0x800) != 0)
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 1;
  }
  *(_DWORD *)(a1 + 1252) = v4;
  if ((v2 & 0x1000) != 0) {
    int v7 = 10;
  }
  else {
    int v7 = 9;
  }
  *(_DWORD *)(a1 + 1256) = v7;
  (*(void (**)(uint64_t))(a1 + 112))(a1);
  return 0;
}

uint64_t e1000_get_bus_info_pcie_generic(uint64_t a1)
{
  uint16_t v7 = 0;
  *(_DWORD *)(a1 + 1248) = 3;
  if (e1000_read_pcie_cap_reg(a1, 0x12u, &v7))
  {
    *(void *)(a1 + 1252) = 0;
  }
  else
  {
    unsigned int v2 = v7;
    int v3 = v7 & 0xF;
    if (v3 == 2) {
      int v4 = 7;
    }
    else {
      int v4 = 0;
    }
    if (v3 == 1) {
      int v5 = 6;
    }
    else {
      int v5 = v4;
    }
    *(_DWORD *)(a1 + 1252) = v5;
    *(_DWORD *)(a1 + 1256) = (v2 >> 4) & 0x3F;
  }
  (*(void (**)(uint64_t))(a1 + 112))(a1);
  return 0;
}

void e1000_set_lan_id_multi_port_pci(uint64_t a1)
{
  uint16_t v4 = 0;
  e1000_read_pci_cfg(a1, 0xEuLL, &v4);
  LOWORD(v2) = 0;
  if ((v4 & 0x80) != 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    int v2 = ((unsigned __int16)readData >> 2) & 3;
  }
  *(_WORD *)(a1 + 1260) = v2;
}

uint64_t e1000_set_lan_id_single_port(uint64_t result)
{
  *(_WORD *)(result + 1260) = 0;
  return result;
}

void e1000_clear_vfta_generic(uint64_t a1)
{
  for (int i = 0; i != 512; i += 4)
  {
    __dmb(2u);
    if (i)
    {
      unsigned int v3 = i + 22016;
    }
    else if (*(int *)(a1 + 284) <= 1)
    {
      unsigned int v3 = 1536;
    }
    else
    {
      unsigned int v3 = 22016;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v3, 0);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
  }
}

void e1000_write_vfta_generic(uint64_t a1, int a2, uint32_t data)
{
  __dmb(2u);
  uint16_t v4 = *(IOPCIDevice **)(a1 + 16);
  int v5 = 4 * a2;
  unsigned int v6 = 4 * a2 + 22016;
  if (4 * a2 > -11505)
  {
    if (v5 <= -7673)
    {
      if (v5 > -8681)
      {
        switch(v5)
        {
          case -8680:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 32792;
            int v8 = 13336;
            break;
          case -7680:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 1056;
            int v8 = 14336;
            break;
          case -7676:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 1060;
            int v8 = 14340;
            break;
          default:
            goto LABEL_64;
        }
      }
      else
      {
        switch(v5)
        {
          case -11504:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 328;
            int v8 = 10512;
            break;
          case -11496:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 336;
            int v8 = 10520;
            break;
          case -8688:
            BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v6 = 32784;
            int v8 = 13328;
            break;
          default:
            goto LABEL_64;
        }
      }
    }
    else if (v5 <= -7649)
    {
      switch(v5)
      {
        case -7672:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 1064;
          int v8 = 14344;
          break;
        case -7664:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 1072;
          int v8 = 14352;
          break;
        case -7656:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 1080;
          int v8 = 14360;
          break;
        default:
          goto LABEL_64;
      }
    }
    else if (v5 > -513)
    {
      if (v5)
      {
        if (v5 != -512) {
          goto LABEL_64;
        }
        BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v6 = 64;
        int v8 = 21504;
      }
      else
      {
        BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v6 = 1536;
        int v8 = 22016;
      }
    }
    else if (v5 == -7648)
    {
      BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v6 = 1088;
      int v8 = 14368;
    }
    else
    {
      if (v5 != -1024) {
        goto LABEL_64;
      }
      BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v6 = 512;
      int v8 = 20992;
    }
  }
  else if (v5 <= -11769)
  {
    if (v5 > -12777)
    {
      switch(v5)
      {
        case -12776:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 32776;
          int v8 = 9240;
          break;
        case -11776:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 272;
          int v8 = 10240;
          break;
        case -11772:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 276;
          int v8 = 10244;
          break;
        default:
          goto LABEL_64;
      }
    }
    else
    {
      switch(v5)
      {
        case -13472:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 360;
          int v8 = 8544;
          break;
        case -13464:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 352;
          int v8 = 8552;
          break;
        case -12784:
          BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v6 = 0x8000;
          int v8 = 9232;
          break;
        default:
          goto LABEL_64;
      }
    }
  }
  else if (v5 <= -11745)
  {
    switch(v5)
    {
      case -11768:
        BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v6 = 280;
        int v8 = 10248;
        break;
      case -11760:
        BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v6 = 288;
        int v8 = 10256;
        break;
      case -11752:
        BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
        unsigned int v6 = 296;
        int v8 = 10264;
        break;
      default:
        goto LABEL_64;
    }
  }
  else if (v5 > -11517)
  {
    if (v5 == -11516)
    {
      BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v6 = 316;
      int v8 = 10500;
    }
    else
    {
      if (v5 != -11512) {
        goto LABEL_64;
      }
      BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
      unsigned int v6 = 320;
      int v8 = 10504;
    }
  }
  else if (v5 == -11744)
  {
    BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
    unsigned int v6 = 264;
    int v8 = 10272;
  }
  else
  {
    if (v5 != -11520) {
      goto LABEL_64;
    }
    BOOL v7 = *(_DWORD *)(a1 + 284) <= 1;
    unsigned int v6 = 312;
    int v8 = 10496;
  }
  if (!v7) {
    unsigned int v6 = v8;
  }
LABEL_64:
  IOPCIDevice::MemoryWrite32(v4, 0, v6, data);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
}

uint64_t e1000_init_rx_addrs_generic(uint64_t a1, unsigned int a2)
{
  __int16 v7 = 0;
  int v6 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 232))(a1, a1 + 272, 0);
  if (a2 >= 2)
  {
    uint64_t v5 = 1;
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, int *, uint64_t))(a1 + 232))(a1, &v6, v5);
      uint64_t v5 = (v5 + 1);
    }
    while (a2 != v5);
  }
  return result;
}

uint64_t e1000_check_alt_mac_addr_generic(uint64_t a1)
{
  int v10 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1160))(a1, 3, 1, &v10);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 284);
    BOOL v4 = v3 != 15 && (v3 - 31) >= 0xFFFFFFEE;
    if (!v4) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1160))(a1, 55, 1, (char *)&v10 + 2);
    if (!result)
    {
      if ((unsigned __int16)(HIWORD(v10) + 1) < 2u) {
        return 0;
      }
      int v5 = *(unsigned __int16 *)(a1 + 1260);
      switch(v5)
      {
        case 3:
          __int16 v6 = HIWORD(v10) + 9;
          break;
        case 2:
          __int16 v6 = HIWORD(v10) + 6;
          break;
        case 1:
          __int16 v6 = HIWORD(v10) + 3;
          break;
        default:
          goto LABEL_17;
      }
      HIWORD(v10) = v6;
LABEL_17:
      __int16 v7 = 0;
      for (unint64_t i = 0; ; i += 2)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(a1 + 1160))(a1, (unsigned __int16)(HIWORD(v10) + v7), 1, &v10);
        if (result) {
          break;
        }
        *(_WORD *)&v9[i] = v10;
        ++v7;
        BOOL v4 = i >= 4;
        if (v4)
        {
          if ((v9[0] & 1) == 0) {
            (*(void (**)(uint64_t, unsigned char *, void))(a1 + 232))(a1, v9, 0);
          }
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t e1000_hash_mc_addr_generic(uint64_t a1, uint64_t a2)
{
  int v2 = 0;
  unsigned int v3 = 32 * *(unsigned __int16 *)(a1 + 326) - 1;
  do
  {
    char v4 = v2;
    unsigned int v5 = v3 >> v2++;
  }
  while (v5 != 255);
  int v6 = *(_DWORD *)(a1 + 304);
  char v7 = v4 + 4;
  char v8 = v4 + 2;
  if (v6 == 1) {
    ++v4;
  }
  if (v6 == 2) {
    char v4 = v8;
  }
  if (v6 == 3) {
    char v4 = v7;
  }
  return ((*(unsigned __int8 *)(a2 + 5) << v4) | (*(unsigned __int8 *)(a2 + 4) >> (8 - v4))) & v3;
}

void e1000_update_mc_addr_list_generic(uint64_t a1, uint64_t a2, int a3)
{
  *(_OWORD *)(a1 + 812) = 0u;
  *(_OWORD *)(a1 + 828) = 0u;
  *(_OWORD *)(a1 + 780) = 0u;
  *(_OWORD *)(a1 + 796) = 0u;
  *(_OWORD *)(a1 + 748) = 0u;
  *(_OWORD *)(a1 + 764) = 0u;
  *(_OWORD *)(a1 + 716) = 0u;
  *(_OWORD *)(a1 + 732) = 0u;
  *(_OWORD *)(a1 + 684) = 0u;
  *(_OWORD *)(a1 + 700) = 0u;
  *(_OWORD *)(a1 + 652) = 0u;
  *(_OWORD *)(a1 + 668) = 0u;
  *(_OWORD *)(a1 + 620) = 0u;
  *(_OWORD *)(a1 + 636) = 0u;
  *(_OWORD *)(a1 + 588) = 0u;
  *(_OWORD *)(a1 + 604) = 0u;
  *(_OWORD *)(a1 + 556) = 0u;
  *(_OWORD *)(a1 + 572) = 0u;
  *(_OWORD *)(a1 + 524) = 0u;
  *(_OWORD *)(a1 + 540) = 0u;
  *(_OWORD *)(a1 + 492) = 0u;
  *(_OWORD *)(a1 + 508) = 0u;
  *(_OWORD *)(a1 + 460) = 0u;
  *(_OWORD *)(a1 + 476) = 0u;
  *(_OWORD *)(a1 + 428) = 0u;
  *(_OWORD *)(a1 + 444) = 0u;
  *(_OWORD *)(a1 + 396) = 0u;
  *(_OWORD *)(a1 + 412) = 0u;
  *(_OWORD *)(a1 + 364) = 0u;
  *(_OWORD *)(a1 + 380) = 0u;
  *(_OWORD *)(a1 + 332) = 0u;
  *(_OWORD *)(a1 + 348) = 0u;
  int v4 = *(unsigned __int16 *)(a1 + 326);
  if (a3)
  {
    int v5 = a3;
    do
    {
      unsigned int v7 = e1000_hash_mc_addr_generic(a1, a2);
      uint64_t v8 = a1 + 4 * ((v4 + 0x7FFFFFF) & (v7 >> 5));
      *(_DWORD *)(v8 + 332) |= 1 << v7;
      a2 += 6;
      --v5;
    }
    while (v5);
  }
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a1 + 4 * (v4 - 1) + 332;
    int v11 = 4 * v4;
    int v12 = 4 * v4 + 20988;
    do
    {
      int v13 = v11 + v9;
      __dmb(2u);
      if (v11 + v9 == 516)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v14 = 64;
        }
        else {
          uint64_t v14 = 21504;
        }
      }
      else if (v13 == 4)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v14 = 512;
        }
        else {
          uint64_t v14 = 20992;
        }
      }
      else if (v13 == 1028)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v14 = 1536;
        }
        else {
          uint64_t v14 = 22016;
        }
      }
      else
      {
        uint64_t v14 = (v12 + v9);
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v14, *(_DWORD *)(v10 + v9));
      v9 -= 4;
      --v4;
    }
    while (v4);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
}

void e1000_pcix_mmrbc_workaround_generic(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1248) == 2)
  {
    int v3 = 0;
    e1000_read_pci_cfg(a1, 0xE6uLL, (uint16_t *)&v3 + 1);
    e1000_read_pci_cfg(a1, 0xEAuLL, (uint16_t *)&v3);
    unsigned int v2 = ((unsigned __int16)v3 >> 5) & 3;
    if (v2 == 3) {
      unsigned int v2 = 2;
    }
    if (((HIWORD(v3) >> 2) & 3u) > v2)
    {
      HIWORD(v3) = HIWORD(v3) & 0xFFF3 | (4 * v2);
      e1000_write_pci_cfg(a1, 0xE6uLL, (uint16_t *)&v3 + 1);
    }
  }
}

void e1000_clear_hw_cntrs_base_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4000uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4008uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4010uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4014uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4018uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x401CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4020uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4028uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4030uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4038uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4040uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4048uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x404CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4050uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4054uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4058uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4074uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4078uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x407CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4080uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4088uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x408CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4090uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4094uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40A0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40A4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40A8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ACuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40C0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40C4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40C8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40CCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4148uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x414CuLL, &readData);
  __dmb(1u);
}

uint64_t e1000_check_for_copper_link_generic(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 853)) {
    return 0;
  }
  BOOL v3 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v3);
  if (result) {
    return result;
  }
  if (!v3) {
    return 0;
  }
  *(unsigned char *)(a1 + 853) = 0;
  e1000_check_downshift_generic(a1);
  if (!*(unsigned char *)(a1 + 851)) {
    return 4294967293;
  }
  (*(void (**)(uint64_t))(a1 + 224))(a1);
  return e1000_config_fc_after_link_up_generic(a1);
}

uint64_t e1000_config_fc_after_link_up_generic(uint64_t a1)
{
  int v11 = 0;
  int v12 = 0;
  __int16 v10 = 0;
  int v2 = *(_DWORD *)(a1 + 1116);
  if (*(unsigned char *)(a1 + 852))
  {
    if ((v2 & 0xFFFFFFFE) != 2) {
      goto LABEL_7;
    }
  }
  else if (v2 != 1)
  {
LABEL_31:
    if (v2 == 3 && *(unsigned char *)(a1 + 851))
    {
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x420CuLL, &v9);
      uint64_t result = 0;
      __dmb(1u);
      if ((v9 & 0x10000) == 0) {
        return result;
      }
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4218uLL, &v9);
      __dmb(1u);
      uint32_t v6 = v9;
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x421CuLL, &v9);
      __dmb(1u);
      if ((v6 & 0x80) != 0)
      {
        int v7 = *(_DWORD *)(a1 + 884);
        if (v7 == 3) {
          goto LABEL_45;
        }
      }
      else
      {
        if ((v6 & 0x100) != 0 && (v9 & 0x80) != 0 && (v9 & 0x100) != 0)
        {
          int v7 = 2;
LABEL_45:
          *(_DWORD *)(a1 + 880) = v7;
          goto LABEL_46;
        }
        if ((~v6 & 0x180) != 0 || (v9 & 0x80) != 0 || (v9 & 0x100) == 0)
        {
          *(_DWORD *)(a1 + 880) = 0;
LABEL_46:
          uint32_t v9 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4208uLL, &v9);
          __dmb(1u);
          uint32_t v8 = v9 | 0x80;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x4208uLL, v8);
          uint64_t result = e1000_force_mac_fc_generic(a1);
          if (result) {
            return result;
          }
          return 0;
        }
      }
      int v7 = 1;
      goto LABEL_45;
    }
    return 0;
  }
  uint64_t result = e1000_force_mac_fc_generic(a1);
  if (result) {
    return result;
  }
  int v2 = *(_DWORD *)(a1 + 1116);
LABEL_7:
  if (v2 != 1) {
    goto LABEL_31;
  }
  if (!*(unsigned char *)(a1 + 851)) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 1, (char *)&v12 + 2);
  if (result) {
    return result;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 1, (char *)&v12 + 2);
  if (result) {
    return result;
  }
  if ((v12 & 0x200000) == 0) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 4, &v12);
  if (result) {
    return result;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 5, (char *)&v11 + 2);
  if (result) {
    return result;
  }
  if ((v12 & 0x400) != 0 && (v11 & 0x4000000) != 0)
  {
    int v5 = *(_DWORD *)(a1 + 884);
    if (v5 == 3) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  int v4 = v12 & 0xC00;
  if (v4 == 3072)
  {
    if ((HIWORD(v11) & 0xC00) != 0x800)
    {
LABEL_25:
      *(_DWORD *)(a1 + 880) = 0;
      goto LABEL_26;
    }
LABEL_23:
    int v5 = 1;
    goto LABEL_24;
  }
  if (v4 != 2048 || (~HIWORD(v11) & 0xC00) != 0) {
    goto LABEL_25;
  }
  int v5 = 2;
LABEL_24:
  *(_DWORD *)(a1 + 880) = v5;
LABEL_26:
  uint64_t result = (*(uint64_t (**)(uint64_t, int *, __int16 *))(a1 + 120))(a1, &v11, &v10);
  if (!result)
  {
    if (v10 == 1) {
      *(_DWORD *)(a1 + 880) = 0;
    }
    uint64_t result = e1000_force_mac_fc_generic(a1);
    if (!result)
    {
      int v2 = *(_DWORD *)(a1 + 1116);
      goto LABEL_31;
    }
  }
  return result;
}

uint64_t e1000_check_for_fiber_link_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  char v3 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0x20000000;
  if ((v2 & 0x80000) == 0 || ((v3 & 2) == 0 ? (BOOL v5 = v4 == 0) : (BOOL v5 = 0), !v5))
  {
    if ((v2 & 0x40) != 0)
    {
      if (v4)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312));
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFFFBF);
        *(unsigned char *)(a1 + 860) = 1;
      }
    }
    return 0;
  }
  if (*(unsigned char *)(a1 + 852))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312) & 0x7FFFFFFF);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v6 = readData | 0x41;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v6);
    uint64_t result = e1000_config_fc_after_link_up_generic(a1);
    if (result) {
      return result;
    }
    return 0;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 852) = 1;
  return result;
}

uint64_t e1000_check_for_serdes_link_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  char v3 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
  __dmb(1u);
  if (v3 & 2 | readData & 0x20000000)
  {
    if ((v2 & 0x40) != 0 && (readData & 0x20000000) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312));
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFFFBF);
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, &readData);
      __dmb(1u);
      if ((readData & 0x80000000) != 0) {
        goto LABEL_12;
      }
      IODelay(0xAuLL);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
      char v6 = 0;
      __dmb(1u);
      if ((readData & 0x40000000) == 0) {
        goto LABEL_11;
      }
      if ((readData & 0x8000000) != 0) {
        goto LABEL_12;
      }
    }
    char v6 = 1;
LABEL_11:
    *(unsigned char *)(a1 + 860) = v6;
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 852))
  {
    uint64_t result = 0;
    *(unsigned char *)(a1 + 852) = 1;
    return result;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312) & 0x7FFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v4 = readData | 0x41;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4);
  uint64_t result = e1000_config_fc_after_link_up_generic(a1);
  if (result) {
    return result;
  }
LABEL_12:
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  if ((readData & 0x80000000) != 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    if ((readData & 2) != 0
      && (IODelay(0xAuLL),
          uint32_t readData = 0,
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData),
          __dmb(1u),
          (readData & 0x40000000) != 0)
      && (readData & 0x8000000) == 0)
    {
      uint64_t result = 0;
      *(unsigned char *)(a1 + 860) = 1;
    }
    else
    {
      uint64_t result = 0;
      *(unsigned char *)(a1 + 860) = 0;
    }
  }
  return result;
}

uint64_t e1000_set_default_fc_generic(uint64_t a1)
{
  __int16 v6 = 0;
  unsigned __int16 v2 = 15;
  if (*(_DWORD *)(a1 + 284) == 32)
  {
    if (*(_WORD *)(a1 + 1260)) {
      unsigned __int16 v2 = (*(_WORD *)(a1 + 1260) << 6) + 79;
    }
    else {
      unsigned __int16 v2 = 15;
    }
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v6);
  if (!result)
  {
    if ((v6 & 0x3000) == 0x2000) {
      int v4 = 2;
    }
    else {
      int v4 = 3;
    }
    if ((v6 & 0x3000) != 0) {
      int v5 = v4;
    }
    else {
      int v5 = 0;
    }
    *(_DWORD *)(a1 + 884) = v5;
  }
  return result;
}

uint64_t e1000_setup_link_generic(uint64_t a1)
{
  unsigned __int16 v2 = *(unsigned int (**)(uint64_t))(a1 + 920);
  if (v2 && v2(a1)) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 884);
  if (v3 == 255)
  {
    if (*(_DWORD *)(a1 + 284) == 36)
    {
      int v3 = 3;
      *(_DWORD *)(a1 + 884) = 3;
    }
    else
    {
      uint64_t result = e1000_set_default_fc_generic(a1);
      if (result) {
        return result;
      }
      int v3 = *(_DWORD *)(a1 + 884);
    }
  }
  *(_DWORD *)(a1 + 880) = v3;
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 200))(a1);
  if (!result)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x30uLL, 0x8808u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x2CuLL, 0x100u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x28uLL, 0xC28001u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x170uLL, *(unsigned __int16 *)(a1 + 872));
    e1000_set_fc_watermarks_generic(a1);
    return 0;
  }
  return result;
}

uint64_t e1000_set_fc_watermarks_generic(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 880) & 2) != 0)
  {
    if (*(unsigned char *)(a1 + 876)) {
      uint32_t v3 = *(_DWORD *)(a1 + 868) | 0x80000000;
    }
    else {
      uint32_t v3 = *(_DWORD *)(a1 + 868);
    }
    uint32_t v2 = *(_DWORD *)(a1 + 864);
  }
  else
  {
    uint32_t v2 = 0;
    uint32_t v3 = 0;
  }
  __dmb(2u);
  int v4 = *(IOPCIDevice **)(a1 + 16);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v5 = 360;
  }
  else {
    uint64_t v5 = 8544;
  }
  IOPCIDevice::MemoryWrite32(v4, 0, v5, v3);
  __dmb(2u);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v6 = 352;
  }
  else {
    uint64_t v6 = 8552;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, v2);
  return 0;
}

uint64_t e1000_commit_fc_settings_generic(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 880);
  if (v1 > 3) {
    return 4294967293;
  }
  uint32_t v3 = dword_100034130[v1];
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, v3);
  uint64_t result = 0;
  *(_DWORD *)(a1 + 312) = v3;
  return result;
}

uint64_t e1000_poll_fiber_serdes_link_generic(uint64_t a1)
{
  int v2 = 50;
  while (1)
  {
    IODelay(0x2710uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    if ((readData & 2) != 0) {
      break;
    }
    if (!--v2)
    {
      *(unsigned char *)(a1 + 852) = 1;
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 72))(a1);
      if (result) {
        return result;
      }
      break;
    }
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 852) = 0;
  return result;
}

uint64_t e1000_setup_fiber_serdes_link_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  (*(void (**)(uint64_t))(a1 + 224))(a1);
  uint64_t result = e1000_commit_fc_settings_generic(a1);
  if (!result)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 & 0xFFFFFFF7);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v5);
    __dmb(1u);
    IODelay(0x3E8uLL);
    if (*(_DWORD *)(a1 + 1116) == 3) {
      return e1000_poll_fiber_serdes_link_generic(a1);
    }
    uint32_t v4 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v4);
    uint64_t result = 0;
    __dmb(1u);
    if ((v4 & 0x80000) != 0) {
      return e1000_poll_fiber_serdes_link_generic(a1);
    }
  }
  return result;
}

uint64_t e1000_force_mac_fc_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  switch(*(_DWORD *)(a1 + 880))
  {
    case 0:
      uint32_t v2 = readData & 0xE7FFFFFF;
      goto LABEL_7;
    case 1:
      uint32_t v2 = readData & 0xE7FFFFFF | 0x8000000;
      goto LABEL_7;
    case 2:
      uint32_t v2 = readData & 0xE7FFFFFF | 0x10000000;
      goto LABEL_7;
    case 3:
      uint32_t v2 = readData | 0x18000000;
LABEL_7:
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
      uint64_t result = 0;
      break;
    default:
      uint64_t result = 4294967293;
      break;
  }
  return result;
}

uint64_t e1000_get_speed_and_duplex_copper_generic(uint64_t a1, __int16 *a2, __int16 *a3)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  char v6 = readData;
  if ((readData & 0x80) != 0)
  {
    BOOL v7 = *(_DWORD *)(a1 + 284) != 36 || (readData & 0x400000) == 0;
    __int16 v8 = 2500;
    __int16 v9 = 1000;
  }
  else
  {
    BOOL v7 = (readData & 0x40) == 0;
    __int16 v8 = 100;
    __int16 v9 = 10;
  }
  if (v7) {
    __int16 v8 = v9;
  }
  *a2 = v8;
  if (v6) {
    __int16 v10 = 2;
  }
  else {
    __int16 v10 = 1;
  }
  *a3 = v10;
  return 0;
}

uint64_t e1000_get_speed_and_duplex_fiber_serdes_generic(uint64_t a1, _WORD *a2, _WORD *a3)
{
  *a2 = 1000;
  *a3 = 2;
  return 0;
}

uint64_t e1000_get_hw_semaphore_generic(uint64_t a1)
{
  int v2 = 2000;
  while (1)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, 2u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &readData);
    __dmb(1u);
    if ((readData & 2) != 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v2)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, 0);
      return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

void e1000_put_hw_semaphore_generic(uint64_t a1)
{
}

uint64_t e1000_get_auto_rd_done_generic(uint64_t a1)
{
  int v2 = 10;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
    __dmb(1u);
    if ((readData & 0x200) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
    if (!--v2) {
      return 4294967287;
    }
  }
  return 0;
}

uint64_t e1000_valid_led_default_generic(uint64_t a1, _WORD *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _WORD *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v4 = (unsigned __int16)*a2;
    if (v4 == 0xFFFF || v4 == 0) {
      *a2 = -30447;
    }
  }
  return result;
}

uint64_t e1000_id_led_init_generic(uint64_t a1)
{
  unsigned __int16 v14 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(a1 + 1192))(a1, &v14);
  if (!result)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
    char v3 = 0;
    int v4 = 0;
    __dmb(1u);
    uint32_t v5 = readData;
    *(_DWORD *)(a1 + 292) = readData;
    *(_DWORD *)(a1 + 296) = v5;
    *(_DWORD *)(a1 + 300) = v5;
    unsigned int v6 = v14;
    int v7 = v5;
    do
    {
      int v8 = (v6 >> v4) & 0xF;
      switch(v8)
      {
        case 2:
LABEL_7:
          int v11 = v5 & ~(255 << v3);
          int v12 = 14 << v3;
          goto LABEL_9;
        case 3:
LABEL_8:
          int v11 = v5 & ~(255 << v3);
          int v12 = 15 << v3;
LABEL_9:
          uint32_t v5 = v11 | v12;
          *(_DWORD *)(a1 + 300) = v5;
          break;
        case 4:
        case 5:
        case 6:
          int v9 = v7 & ~(255 << v3);
          int v10 = 14 << v3;
          goto LABEL_6;
        case 7:
        case 8:
        case 9:
          int v9 = v7 & ~(255 << v3);
          int v10 = 15 << v3;
LABEL_6:
          int v7 = v9 | v10;
          *(_DWORD *)(a1 + 296) = v7;
          switch(v8)
          {
            case 5:
            case 8:
              goto LABEL_7;
            case 6:
            case 9:
              goto LABEL_8;
            default:
              goto LABEL_10;
          }
        default:
          break;
      }
LABEL_10:
      v4 += 4;
      v3 += 8;
    }
    while (v4 != 16);
    return 0;
  }
  return result;
}

uint64_t e1000_setup_led_generic(uint64_t a1)
{
  if (*(uint64_t (**)())(a1 + 208) != e1000_setup_led_generic) {
    return 4294967293;
  }
  int v3 = *(_DWORD *)(a1 + 1116);
  if (v3 == 1)
  {
    __dmb(2u);
    unsigned int v6 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v5 = *(_DWORD *)(a1 + 296);
    goto LABEL_7;
  }
  if (v3 == 2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData;
    *(_DWORD *)(a1 + 292) = readData;
    uint32_t v5 = v4 & 0xFFFFFF30 | 0xF;
    __dmb(2u);
    unsigned int v6 = *(IOPCIDevice **)(a1 + 16);
LABEL_7:
    IOPCIDevice::MemoryWrite32(v6, 0, 0xE00uLL, v5);
  }
  return 0;
}

uint64_t e1000_cleanup_led_generic(uint64_t a1)
{
  return 0;
}

uint64_t e1000_blink_led_generic(uint64_t a1)
{
  uint32_t v1 = 142;
  if (*(_DWORD *)(a1 + 1116) != 2)
  {
    unsigned int v2 = -8;
    uint32_t v1 = *(_DWORD *)(a1 + 300);
    do
    {
      int v3 = (*(_DWORD *)(a1 + 300) >> (v2 + 8)) & 0xF;
      int v4 = *(_DWORD *)(a1 + 292) >> (v2 + 8);
      if ((v4 & 0x40) == 0 && v3 == 14 || (v4 & 0x40) != 0 && v3 == 15) {
        uint32_t v1 = v1 & ~(15 << (v2 + 8)) | (142 << (v2 + 8));
      }
      v2 += 8;
    }
    while (v2 < 0x18);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, v1);
  return 0;
}

uint64_t e1000_led_on_generic(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1116);
  if (v2 == 1)
  {
    __dmb(2u);
    int v4 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v3 = *(_DWORD *)(a1 + 300);
    uint64_t v5 = 3584;
    goto LABEL_5;
  }
  if (v2 == 2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v3 = readData & 0xFFBBFFFF | 0x400000;
    __dmb(2u);
    int v4 = *(IOPCIDevice **)(a1 + 16);
    uint64_t v5 = 0;
LABEL_5:
    IOPCIDevice::MemoryWrite32(v4, 0, v5, v3);
  }
  return 0;
}

uint64_t e1000_led_off_generic(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1116);
  if (v2 == 1)
  {
    __dmb(2u);
    int v4 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v3 = *(_DWORD *)(a1 + 296);
    uint64_t v5 = 3584;
    goto LABEL_5;
  }
  if (v2 == 2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v3 = readData | 0x440000;
    __dmb(2u);
    int v4 = *(IOPCIDevice **)(a1 + 16);
    uint64_t v5 = 0;
LABEL_5:
    IOPCIDevice::MemoryWrite32(v4, 0, v5, v3);
  }
  return 0;
}

void e1000_set_pcie_no_snoop_generic(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(_DWORD *)(a1 + 1248) == 3)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, &readData);
      __dmb(1u);
      uint32_t v4 = readData & 0xFFFFFFC0 | a2;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, v4);
    }
  }
}

uint64_t e1000_disable_pcie_primary_generic(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1248) == 3)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v2 = readData | 4;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
    int v3 = -800;
    while (1)
    {
      uint32_t v6 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v6);
      __dmb(1u);
      if ((v6 & 0x80000) == 0) {
        break;
      }
      IODelay(0x64uLL);
      if (__CFADD__(v3++, 1)) {
        return 4294967286;
      }
    }
  }
  return 0;
}

void e1000_reset_adaptive_generic(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 847))
  {
    *(_WORD *)(a1 + 324) = 10;
    *(void *)(a1 + 316) = 0x4002800500000;
    *(unsigned char *)(a1 + 854) = 0;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x458uLL, 0);
  }
}

void e1000_update_adaptive_generic(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 847))
  {
    unsigned int v1 = *(_DWORD *)(a1 + 308);
    if (*(_DWORD *)(a1 + 288) * *(unsigned __int16 *)(a1 + 322) <= v1)
    {
      if (v1 <= 0x3E8 && *(unsigned char *)(a1 + 854) != 0)
      {
        *(_WORD *)(a1 + 316) = 0;
        *(unsigned char *)(a1 + 854) = 0;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x458uLL, 0);
      }
    }
    else if (v1 >= 0x3E9)
    {
      *(unsigned char *)(a1 + 854) = 1;
      unsigned int v2 = *(unsigned __int16 *)(a1 + 316);
      if (v2 < *(unsigned __int16 *)(a1 + 318))
      {
        if (*(_WORD *)(a1 + 316)) {
          __int16 v3 = *(_WORD *)(a1 + 324) + v2;
        }
        else {
          __int16 v3 = *(_WORD *)(a1 + 320);
        }
        *(_WORD *)(a1 + 316) = v3;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x458uLL, *(unsigned __int16 *)(a1 + 316));
      }
    }
  }
}

uint64_t e1000_validate_mdi_setting_crossover_generic()
{
  return 0;
}

uint64_t e1000_write_8bit_ctrl_reg_generic(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v5 = a2;
  uint32_t v6 = a4 | (a3 << 8);
  __dmb(2u);
  int v7 = *(IOPCIDevice **)(a1 + 16);
  if (a2 == 21504)
  {
    BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v9 = 64;
    uint64_t v10 = 21504;
    goto LABEL_3;
  }
  if (a2 <= 0x2907uLL)
  {
    if (a2 > 0x2807uLL)
    {
      if (a2 > 0x281FuLL)
      {
        if (a2 == 10272)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v9 = 264;
          uint64_t v10 = 10272;
        }
        else if (a2 == 10496)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v9 = 312;
          uint64_t v10 = 10496;
        }
        else
        {
          uint64_t v11 = a2;
          if (a2 != 10500) {
            goto LABEL_6;
          }
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v9 = 316;
          uint64_t v10 = 10500;
        }
      }
      else if (a2 == 10248)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 280;
        uint64_t v10 = 10248;
      }
      else if (a2 == 10256)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 288;
        uint64_t v10 = 10256;
      }
      else
      {
        uint64_t v11 = a2;
        if (a2 != 10264) {
          goto LABEL_6;
        }
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 296;
        uint64_t v10 = 10264;
      }
    }
    else if (a2 > 0x2417uLL)
    {
      if (a2 == 9240)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 32776;
        uint64_t v10 = 9240;
      }
      else if (a2 == 10240)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 272;
        uint64_t v10 = 10240;
      }
      else
      {
        uint64_t v11 = a2;
        if (a2 != 10244) {
          goto LABEL_6;
        }
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 276;
        uint64_t v10 = 10244;
      }
    }
    else if (a2 == 8544)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 360;
      uint64_t v10 = 8544;
    }
    else if (a2 == 8552)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 352;
      uint64_t v10 = 8552;
    }
    else
    {
      uint64_t v11 = a2;
      if (a2 != 9232) {
        goto LABEL_6;
      }
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 0x8000;
      uint64_t v10 = 9232;
    }
LABEL_3:
    if (v8) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v10;
    }
    goto LABEL_6;
  }
  if (a2 <= 0x3803uLL)
  {
    if (a2 > 0x340FuLL)
    {
      if (a2 == 13328)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 32784;
        uint64_t v10 = 13328;
      }
      else if (a2 == 13336)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 32792;
        uint64_t v10 = 13336;
      }
      else
      {
        uint64_t v11 = a2;
        if (a2 != 14336) {
          goto LABEL_6;
        }
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v9 = 1056;
        uint64_t v10 = 14336;
      }
    }
    else if (a2 == 10504)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 320;
      uint64_t v10 = 10504;
    }
    else if (a2 == 10512)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 328;
      uint64_t v10 = 10512;
    }
    else
    {
      uint64_t v11 = a2;
      if (a2 != 10520) {
        goto LABEL_6;
      }
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 336;
      uint64_t v10 = 10520;
    }
    goto LABEL_3;
  }
  if (a2 <= 0x3817uLL)
  {
    if (a2 == 14340)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 1060;
      uint64_t v10 = 14340;
    }
    else if (a2 == 14344)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 1064;
      uint64_t v10 = 14344;
    }
    else
    {
      uint64_t v11 = a2;
      if (a2 != 14352) {
        goto LABEL_6;
      }
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 1072;
      uint64_t v10 = 14352;
    }
    goto LABEL_3;
  }
  if (a2 > 0x51FFuLL)
  {
    if (a2 == 20992)
    {
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 512;
      uint64_t v10 = 20992;
    }
    else
    {
      uint64_t v11 = a2;
      if (a2 != 22016) {
        goto LABEL_6;
      }
      BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v9 = 1536;
      uint64_t v10 = 22016;
    }
    goto LABEL_3;
  }
  if (a2 == 14360)
  {
    BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v9 = 1080;
    uint64_t v10 = 14360;
    goto LABEL_3;
  }
  uint64_t v11 = a2;
  if (a2 == 14368)
  {
    BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v9 = 1088;
    uint64_t v10 = 14368;
    goto LABEL_3;
  }
LABEL_6:
  IOPCIDevice::MemoryWrite32(v7, 0, v11, v6);
  int v12 = 639;
  do
  {
    int v13 = v12;
    IODelay(5uLL);
    uint32_t readData = 0;
    if (v5 == 21504)
    {
      if (*(int *)(a1 + 284) <= 1) {
        uint64_t v14 = 64;
      }
      else {
        uint64_t v14 = 21504;
      }
      goto LABEL_75;
    }
    if (v5 <= 10503)
    {
      if (v5 > 10247)
      {
        if (v5 > 10271)
        {
          if (v5 == 10272)
          {
            BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v17 = 10272;
            uint64_t v18 = 264;
          }
          else
          {
            uint64_t v15 = 10496;
            if (v5 == 10496)
            {
              BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
              uint64_t v20 = 312;
              goto LABEL_72;
            }
            uint64_t v14 = v5;
            if (v5 != 10500) {
              goto LABEL_75;
            }
            BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v17 = 10500;
            uint64_t v18 = 316;
          }
        }
        else if (v5 == 10248)
        {
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 10248;
          uint64_t v18 = 280;
        }
        else
        {
          uint64_t v15 = 10256;
          if (v5 == 10256)
          {
            BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v20 = 288;
            goto LABEL_72;
          }
          uint64_t v14 = v5;
          if (v5 != 10264) {
            goto LABEL_75;
          }
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 10264;
          uint64_t v18 = 296;
        }
      }
      else if (v5 > 9239)
      {
        if (v5 == 9240)
        {
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 9240;
          uint64_t v18 = 32776;
        }
        else
        {
          uint64_t v15 = 10240;
          if (v5 == 10240)
          {
            BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v20 = 272;
            goto LABEL_72;
          }
          uint64_t v14 = v5;
          if (v5 != 10244) {
            goto LABEL_75;
          }
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 10244;
          uint64_t v18 = 276;
        }
      }
      else if (v5 == 8544)
      {
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 8544;
        uint64_t v18 = 360;
      }
      else
      {
        uint64_t v15 = 8552;
        if (v5 == 8552)
        {
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v20 = 352;
          goto LABEL_72;
        }
        uint64_t v14 = v5;
        if (v5 != 9232) {
          goto LABEL_75;
        }
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 9232;
        uint64_t v18 = 0x8000;
      }
      goto LABEL_67;
    }
    if (v5 <= 14339)
    {
      if (v5 > 13327)
      {
        if (v5 == 13328)
        {
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 13328;
          uint64_t v18 = 32784;
        }
        else
        {
          uint64_t v15 = 13336;
          if (v5 == 13336)
          {
            BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v20 = 32792;
            goto LABEL_72;
          }
          uint64_t v14 = v5;
          if (v5 != 14336) {
            goto LABEL_75;
          }
          BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v17 = 14336;
          uint64_t v18 = 1056;
        }
      }
      else if (v5 == 10504)
      {
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 10504;
        uint64_t v18 = 320;
      }
      else
      {
        uint64_t v15 = 10512;
        if (v5 == 10512)
        {
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v20 = 328;
          goto LABEL_72;
        }
        uint64_t v14 = v5;
        if (v5 != 10520) {
          goto LABEL_75;
        }
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 10520;
        uint64_t v18 = 336;
      }
      goto LABEL_67;
    }
    if (v5 <= 14359)
    {
      if (v5 == 14340)
      {
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 14340;
        uint64_t v18 = 1060;
      }
      else
      {
        uint64_t v15 = 14344;
        if (v5 == 14344)
        {
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v20 = 1064;
          goto LABEL_72;
        }
        uint64_t v14 = v5;
        if (v5 != 14352) {
          goto LABEL_75;
        }
        BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v17 = 14352;
        uint64_t v18 = 1072;
      }
      goto LABEL_67;
    }
    if (v5 > 20991)
    {
      uint64_t v15 = 20992;
      if (v5 == 20992)
      {
        BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v20 = 512;
        goto LABEL_72;
      }
      uint64_t v14 = v5;
      if (v5 != 22016) {
        goto LABEL_75;
      }
      BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v17 = 22016;
      uint64_t v18 = 1536;
LABEL_67:
      if (v16) {
        uint64_t v14 = v18;
      }
      else {
        uint64_t v14 = v17;
      }
      goto LABEL_75;
    }
    uint64_t v15 = 14360;
    if (v5 != 14360)
    {
      uint64_t v14 = v5;
      if (v5 != 14368) {
        goto LABEL_75;
      }
      BOOL v16 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v17 = 14368;
      uint64_t v18 = 1088;
      goto LABEL_67;
    }
    BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v20 = 1080;
LABEL_72:
    if (v19) {
      uint64_t v14 = v20;
    }
    else {
      uint64_t v14 = v15;
    }
LABEL_75:
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v14, &readData);
    __dmb(1u);
    if ((readData & 0x80000000) != 0) {
      break;
    }
    int v12 = v13 - 1;
  }
  while (v13);
  if ((readData & 0x80000000) == 0) {
    return 4294967294;
  }
  else {
    return 0;
  }
}

void *e1000_init_function_pointers_80003es2lan(void *result)
{
  result[5] = sub_10001CD98;
  result[143] = sub_10001CFEC;
  result[111] = sub_10001D148;
  return result;
}

uint64_t sub_10001CD98(uint64_t a1)
{
  BOOL v2 = *(unsigned __int16 *)(a1 + 9584) == 4248;
  if (*(_WORD *)(a1 + 9584) == 4248) {
    int v3 = 3;
  }
  else {
    int v3 = 1;
  }
  uint32_t v4 = e1000_check_for_copper_link_generic;
  *(_DWORD *)(a1 + 1116) = v3;
  if (v2)
  {
    uint32_t v4 = e1000_check_for_serdes_link_generic;
    uint64_t v5 = e1000_setup_fiber_serdes_link_generic;
  }
  else
  {
    uint64_t v5 = sub_10001D300;
  }
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 200) = v5;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(unsigned char *)(a1 + 850) = 1;
  *(unsigned char *)(a1 + 848) = 1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  *(unsigned char *)(a1 + 849) = (readData & 0xE) != 0;
  *(unsigned char *)(a1 + 847) = 0;
  *(void *)(a1 + 104) = e1000_get_bus_info_pcie_generic;
  *(void *)(a1 + 152) = sub_10001D3EC;
  *(void *)(a1 + 160) = sub_10001D56C;
  *(void *)(a1 + 192) = e1000_setup_link_generic;
  *(void *)(a1 + 64) = e1000_check_mng_mode_generic;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  *(void *)(a1 + 96) = e1000_clear_vfta_generic;
  *(void *)(a1 + 240) = sub_10001D9C4;
  *(void *)(a1 + 48) = e1000_id_led_init_generic;
  *(void *)(a1 + 56) = e1000_blink_led_generic;
  *(void *)(a1 + 208) = e1000_setup_led_generic;
  *(void *)(a1 + 80) = e1000_cleanup_led_generic;
  *(void *)(a1 + 128) = e1000_led_on_generic;
  *(void *)(a1 + 136) = e1000_led_off_generic;
  *(void *)(a1 + 88) = sub_10001DA0C;
  *(void *)(a1 + 120) = sub_10001DD80;
  (*(void (**)(uint64_t))(a1 + 112))(a1);
  return 0;
}

uint64_t sub_10001CFEC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  __int16 v3 = 8;
  *(_WORD *)(a1 + 1238) = 8;
  *(_WORD *)(a1 + 1234) = 1;
  int v4 = *(_DWORD *)(a1 + 1220);
  if (v4 == 1)
  {
    *(_WORD *)(a1 + 1240) = 8;
  }
  else if (v4 == 2)
  {
    *(_WORD *)(a1 + 1240) = 32;
    __int16 v3 = 16;
  }
  else
  {
    if ((v2 & 0x400) != 0) {
      __int16 v5 = 32;
    }
    else {
      __int16 v5 = 8;
    }
    *(_WORD *)(a1 + 1240) = v5;
    if ((v2 & 0x400) != 0) {
      __int16 v3 = 16;
    }
    else {
      __int16 v3 = 8;
    }
  }
  *(_WORD *)(a1 + 1236) = v3;
  *(_DWORD *)(a1 + 1216) = 2;
  if (((v2 >> 11) & 8) != 0) {
    char v6 = 8;
  }
  else {
    char v6 = (v2 >> 11) & 0xF;
  }
  *(_WORD *)(a1 + 1232) = 1 << (v6 + 6);
  *(void *)(a1 + 1152) = sub_10001E338;
  *(void *)(a1 + 1160) = e1000_read_nvm_eerd;
  *(void *)(a1 + 1168) = sub_10001E388;
  *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
  *(void *)(a1 + 1192) = e1000_valid_led_default_generic;
  *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
  *(void *)(a1 + 1208) = e1000_write_nvm_spi;
  return 0;
}

uint64_t sub_10001D148(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
    *(void *)(a1 + 1064) = sub_10001E3C8;
    *(_DWORD *)(a1 + 1100) = 1;
    *(_WORD *)(a1 + 1122) = 47;
    *(_DWORD *)(a1 + 1108) = 100;
    *(_DWORD *)(a1 + 1072) = 5;
    *(void *)(a1 + 896) = sub_10001E308;
    *(void *)(a1 + 912) = e1000_check_polarity_m88;
    *(void *)(a1 + 920) = e1000_check_reset_block_generic;
    *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
    *(void *)(a1 + 944) = sub_10001E42C;
    *(void *)(a1 + 960) = e1000_get_phy_info_m88;
    *(void *)(a1 + 1000) = sub_10001E320;
    *(void *)(a1 + 1008) = e1000_phy_hw_reset_generic;
    *(void *)(a1 + 1024) = e1000_set_d3_lplu_state_generic;
    *(void *)(a1 + 936) = sub_10001E4B8;
    *(void *)(a1 + 952) = sub_10001E634;
    *(void *)(a1 + 976) = sub_10001E6C8;
    *(void *)(a1 + 1032) = sub_10001E808;
    *(void *)(a1 + 904) = sub_10001E948;
    LODWORD(result) = e1000_get_phy_id(a1);
    if (*(_DWORD *)(a1 + 1104) == 21040288) {
      return result;
    }
    else {
      return 4294967294;
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1072) = 1;
  }
  return result;
}

uint64_t sub_10001D300(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  uint64_t result = sub_10001DDEC(a1, 132, 0xFFFF);
  if (!result)
  {
    unsigned __int16 v6 = 0;
    uint64_t result = sub_10001DE84(a1, 137, &v6);
    if (!result)
    {
      int v4 = v6 | 0x3F;
      v6 |= 0x3Fu;
      uint64_t result = sub_10001DDEC(a1, 137, v4);
      if (!result)
      {
        uint64_t result = sub_10001DE84(a1, 2, &v6);
        if (!result)
        {
          uint64_t result = sub_10001DDEC(a1, 2, v6 | 0x10u);
          if (!result)
          {
            uint64_t result = sub_10001DF40(a1);
            if (!result) {
              return e1000_setup_copper_link_generic(a1);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001D3EC(uint64_t a1)
{
  e1000_disable_pcie_primary_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v7);
  __dmb(1u);
  uint32_t v2 = v7;
  if (*(_WORD *)(a1 + 1260)) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  uint64_t result = sub_10001E1DC(a1, v3);
  if (!result)
  {
    unsigned __int16 v9 = 0;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x4000000);
    if (*(_WORD *)(a1 + 1260)) {
      int v5 = 4;
    }
    else {
      int v5 = 2;
    }
    sub_10001E290(a1, v5);
    if (!sub_10001DE84(a1, 9, &v9)) {
      sub_10001DDEC(a1, 9, v9 | 0x200);
    }
    uint64_t result = e1000_get_auto_rd_done_generic(a1);
    if (!result)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
      uint32_t v6 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &v6);
      __dmb(1u);
      return e1000_check_alt_mac_addr_generic(a1);
    }
  }
  return result;
}

uint64_t sub_10001D56C(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 1116) == 1) {
    int v4 = -2013265921;
  }
  else {
    int v4 = -2014314497;
  }
  uint32_t v5 = v4 & readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, v5);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
  __dmb(1u);
  uint32_t v7 = (v6 & 0xEFFFFFFF | (((readData >> 28) & 1) << 28)) ^ 0x10000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, v7);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData | 0x30000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v8);
  (*(void (**)(uint64_t))(a1 + 48))(a1);
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  if (*(_WORD *)(a1 + 326))
  {
    int v9 = 0;
    unsigned int v10 = 0;
    do
    {
      __dmb(2u);
      if (v9 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v11 = 64;
        }
        else {
          unsigned int v11 = 21504;
        }
      }
      else if (v9)
      {
        if (v9 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v11 = 1536;
          }
          else {
            unsigned int v11 = 22016;
          }
        }
        else
        {
          unsigned int v11 = v9 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v11 = 512;
      }
      else
      {
        unsigned int v11 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v11, 0);
      ++v10;
      v9 += 4;
    }
    while (v10 < *(unsigned __int16 *)(a1 + 326));
  }
  else
  {
    LOWORD(v10) = 0;
  }
  __int16 v20 = v10;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
  if (!v12)
  {
    unsigned __int16 v21 = 0;
    if (!sub_10001DE84(a1, 9, &v21)) {
      sub_10001DDEC(a1, 9, v21 | 0x200);
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
    __dmb(1u);
    uint32_t v13 = readData & 0xFE80FFFF | 0x1410000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v13);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
    __dmb(1u);
    uint32_t v14 = readData & 0xFE80FFFF | 0x1410000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, v14);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
    __dmb(1u);
    uint32_t v15 = readData | 0x1000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v15);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x404uLL, &readData);
    __dmb(1u);
    uint32_t v16 = readData & 0xFFF003FF | 0x10000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x404uLL, v16);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, &readData);
    __dmb(1u);
    uint32_t v17 = readData & 0xFFFFFC00 | 8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, v17);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, &readData);
    __dmb(1u);
    uint32_t v18 = readData & 0xFFEFFFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5F04uLL, v18);
    *(unsigned char *)(a1 + 1376) = 1;
    uint64_t v12 = sub_10001DE84(a1, 31, &v20);
    if (!v12 && (v20 & 0xC) == 4) {
      *(unsigned char *)(a1 + 1376) = 0;
    }
    sub_10001DA0C(a1);
  }
  return v12;
}

uint64_t sub_10001D9C4(uint64_t a1)
{
  uint64_t result = e1000_check_alt_mac_addr_generic(a1);
  if (!result)
  {
    return e1000_read_mac_addr_generic(a1);
  }
  return result;
}

void sub_10001DA0C(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4100uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4124uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4104uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4108uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4110uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4118uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x411CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4120uLL, &readData);
  __dmb(1u);
}

uint64_t sub_10001DD80(uint64_t a1, __int16 *a2, __int16 *a3)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    uint64_t speed_and_duplex_copper_generic = e1000_get_speed_and_duplex_copper_generic(a1, a2, a3);
    (*(void (**)(uint64_t))(a1 + 904))(a1);
    return speed_and_duplex_copper_generic;
  }
  else
  {
    return e1000_get_speed_and_duplex_fiber_serdes_generic(a1, a2, a3);
  }
}

uint64_t sub_10001DDEC(uint64_t a1, char a2, int a3)
{
  uint64_t v6 = sub_10001E1DC(a1, 8);
  if (!v6)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, a3 & 0xFFE0FFFF | ((a2 & 0x1F) << 16));
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(2uLL);
    sub_10001E290(a1, 8);
  }
  return v6;
}

uint64_t sub_10001DE84(uint64_t a1, char a2, _WORD *a3)
{
  uint64_t v6 = sub_10001E1DC(a1, 8);
  if (!v6)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, ((a2 & 0x1F) << 16) | 0x200000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(2uLL);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x34uLL, &v8);
    __dmb(1u);
    *a3 = v8;
    sub_10001E290(a1, 8);
  }
  return v6;
}

uint64_t sub_10001DF40(uint64_t a1)
{
  unsigned __int16 v10 = 0;
  if (*(unsigned char *)(a1 + 1134)) {
    goto LABEL_2;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 85, &v10);
  if (!result)
  {
    v10 |= 0x17u;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 85);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 16, &v10);
      if (!result)
      {
        __int16 v5 = v10 & 0xFF9F;
        int v6 = *(unsigned __int8 *)(a1 + 1130);
        __int16 v7 = v10 | 0x60;
        if (v6 == 2) {
          __int16 v7 = v5 | 0x20;
        }
        if (v6 != 1) {
          __int16 v5 = v7;
        }
        unsigned __int16 v8 = v5 & 0xFFFD;
        unsigned __int16 v10 = v5 & 0xFFFD;
        if (*(unsigned char *)(a1 + 1131))
        {
          unsigned __int16 v8 = v5 | 2;
          unsigned __int16 v10 = v5 | 2;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 16, v8);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 928))(a1);
          if (!result)
          {
LABEL_2:
            unsigned __int16 v10 = 2056;
            uint64_t result = sub_10001DDEC(a1, 0, 2056);
            if (!result)
            {
              uint64_t result = sub_10001DE84(a1, 31, &v10);
              if (!result)
              {
                int v3 = v10 | 0x2000;
                v10 |= 0x2000u;
                uint64_t result = sub_10001DDEC(a1, 31, v3);
                if (!result)
                {
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 26, &v10);
                  if (!result)
                  {
                    v10 &= ~0x2000u;
                    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 26);
                    if (!result)
                    {
                      uint32_t readData = 0;
                      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
                      __dmb(1u);
                      uint32_t v4 = readData & 0xFF3FFFFF;
                      __dmb(2u);
                      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v4);
                      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 6196, &v10);
                      if (!result)
                      {
                        if (((*(uint64_t (**)(uint64_t))(a1 + 64))(a1) & 1) != 0
                          || (v10 |= 1u,
                              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 6196),
                              !result)
                          && (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 6192, &v10), !result)&& (v10 &= ~0x800u, uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 6192), !result))
                        {
                          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 6226, &v10);
                          if (!result)
                          {
                            v10 |= 0x10u;
                            return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 6226);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001E1DC(uint64_t a1, int a2)
{
  int v4 = a2 | (a2 << 16);
  int v5 = 50;
  while (1)
  {
    if (e1000_get_hw_semaphore_generic(a1)) {
      return 4294967283;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
    __dmb(1u);
    if ((readData & v4) == 0) {
      break;
    }
    e1000_put_hw_semaphore_generic(a1);
    IODelay(0x1388uLL);
    if (!--v5) {
      return 4294967283;
    }
  }
  uint32_t v7 = readData | a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v7);
  e1000_put_hw_semaphore_generic(a1);
  return 0;
}

void sub_10001E290(uint64_t a1, int a2)
{
  while (e1000_get_hw_semaphore_generic(a1))
    ;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & ~a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v4);
  e1000_put_hw_semaphore_generic(a1);
}

uint64_t sub_10001E308(uint64_t a1)
{
  if (*(_WORD *)(a1 + 1260)) {
    int v1 = 4;
  }
  else {
    int v1 = 2;
  }
  return sub_10001E1DC(a1, v1);
}

void sub_10001E320(uint64_t a1)
{
  if (*(_WORD *)(a1 + 1260)) {
    int v1 = 4;
  }
  else {
    int v1 = 2;
  }
  sub_10001E290(a1, v1);
}

uint64_t sub_10001E338(uint64_t a1)
{
  uint64_t v2 = sub_10001E1DC(a1, 1);
  if (!v2)
  {
    uint64_t v2 = e1000_acquire_nvm_generic(a1);
    if (v2) {
      sub_10001E290(a1, 1);
    }
  }
  return v2;
}

void sub_10001E388(uint64_t a1)
{
  e1000_release_nvm_generic(a1);
  sub_10001E290(a1, 1);
}

void sub_10001E3C8(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(a1 + 64))() & 1) == 0 && !(*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
  {
    e1000_power_down_phy_copper(a1);
  }
}

uint64_t sub_10001E42C(uint64_t a1)
{
  if (*(_WORD *)(a1 + 1260) == 1) {
    int v2 = 0x80000;
  }
  else {
    int v2 = 0x40000;
  }
  int v3 = -100;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1010uLL, &readData);
    __dmb(1u);
    if ((readData & v2) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
    if (__CFADD__(v3++, 1)) {
      return 4294967287;
    }
  }
  return 0;
}

uint64_t sub_10001E4B8(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 976);
  if (!v1) {
    return 0;
  }
  __int16 v6 = 0;
  BOOL v5 = 0;
  uint64_t result = v1();
  if (!result)
  {
    v6 &= 0xFF9Fu;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 976))(a1, 0, &v6);
      if (!result)
      {
        e1000_phy_force_speed_duplex_setup(a1, &v6);
        v6 |= 0x8000u;
        uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1032))(a1, 0);
        if (!result)
        {
          IODelay(1uLL);
          if (!*(unsigned char *)(a1 + 1136)
            || (uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v5), !result)
            && (v5 || (uint64_t result = e1000_phy_reset_dsp_generic(a1), !result))
            && (uint64_t result = e1000_phy_has_link_generic(a1, 0x14u, 0x186A0u, &v5), !result))
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 85, &v6);
            if (!result)
            {
              if ((*(unsigned char *)(a1 + 846) & 3) != 0) {
                __int16 v4 = 4;
              }
              else {
                __int16 v4 = 5;
              }
              return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 85, v6 & 0xFFF8 | v4 & 0xFFFD | 0x10u);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001E634(uint64_t a1)
{
  int v1 = *(uint64_t (**)(void))(a1 + 976);
  if (!v1) {
    return 0;
  }
  __int16 v7 = 0;
  uint64_t result = v1();
  if (!result)
  {
    uint64_t v4 = v7 & 7;
    if (v4 <= 5)
    {
      uint64_t result = 0;
      int v5 = word_100034140[v4];
      *(_WORD *)(a1 + 1128) = v5;
      int v6 = word_100034140[(v4 + 5)];
      *(_WORD *)(a1 + 1126) = v6;
      *(_WORD *)(a1 + 1124) = (v6 + v5) >> 1;
    }
    else
    {
      return 4294967294;
    }
  }
  return result;
}

uint64_t sub_10001E6C8(uint64_t a1, unsigned __int16 a2, _WORD *a3)
{
  if (*(_WORD *)(a1 + 1260)) {
    int v6 = 4;
  }
  else {
    int v6 = 2;
  }
  uint64_t v7 = sub_10001E1DC(a1, v6);
  if (v7) {
    return v7;
  }
  unsigned int v8 = a2 & 0x1F;
  if (v8 <= 0x1D) {
    unsigned int v9 = 22;
  }
  else {
    unsigned int v9 = 29;
  }
  int v10 = a2 >> 5;
  unsigned __int16 v15 = v10;
  uint64_t phy_reg_mdic = e1000_write_phy_reg_mdic(a1, v9, v10);
  if (phy_reg_mdic) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 1376))
  {
    uint64_t phy_reg_mdic = e1000_read_phy_reg_mdic(a1, v8, a3);
LABEL_9:
    uint64_t v7 = phy_reg_mdic;
LABEL_10:
    if (*(_WORD *)(a1 + 1260)) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    sub_10001E290(a1, v12);
    return v7;
  }
  IODelay(0xC8uLL);
  e1000_read_phy_reg_mdic(a1, v9, &v15);
  if (v10 == v15)
  {
    IODelay(0xC8uLL);
    uint64_t v7 = e1000_read_phy_reg_mdic(a1, v8, a3);
    IODelay(0xC8uLL);
    goto LABEL_10;
  }
  if (*(_WORD *)(a1 + 1260)) {
    int v14 = 4;
  }
  else {
    int v14 = 2;
  }
  sub_10001E290(a1, v14);
  return 4294967294;
}

uint64_t sub_10001E808(uint64_t a1, unsigned __int16 a2, int a3)
{
  if (*(_WORD *)(a1 + 1260)) {
    int v6 = 4;
  }
  else {
    int v6 = 2;
  }
  uint64_t v7 = sub_10001E1DC(a1, v6);
  if (v7) {
    return v7;
  }
  unsigned int v8 = a2 & 0x1F;
  if (v8 <= 0x1D) {
    unsigned int v9 = 22;
  }
  else {
    unsigned int v9 = 29;
  }
  int v10 = a2 >> 5;
  unsigned __int16 v15 = v10;
  uint64_t v11 = e1000_write_phy_reg_mdic(a1, v9, v10);
  if (v11) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 1376))
  {
    uint64_t v11 = e1000_write_phy_reg_mdic(a1, v8, a3);
LABEL_9:
    uint64_t v7 = v11;
LABEL_10:
    if (*(_WORD *)(a1 + 1260)) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    sub_10001E290(a1, v12);
    return v7;
  }
  IODelay(0xC8uLL);
  e1000_read_phy_reg_mdic(a1, v9, &v15);
  if (v10 == v15)
  {
    IODelay(0xC8uLL);
    uint64_t v7 = e1000_write_phy_reg_mdic(a1, v8, a3);
    IODelay(0xC8uLL);
    goto LABEL_10;
  }
  if (*(_WORD *)(a1 + 1260)) {
    int v14 = 4;
  }
  else {
    int v14 = 2;
  }
  sub_10001E290(a1, v14);
  return 4294967294;
}

uint64_t sub_10001E948(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) != 1) {
    return 0;
  }
  int v11 = 0;
  uint64_t result = e1000_get_speed_and_duplex_copper_generic(a1, (__int16 *)&v11 + 1, (__int16 *)&v11);
  if (!result)
  {
    if (HIWORD(v11) == 1000)
    {
      __int16 v14 = 0;
      uint64_t result = sub_10001DDEC(a1, 16, 0);
      if (!result)
      {
        __int16 v13 = 0;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, &readData);
        __dmb(1u);
        uint32_t v3 = readData & 0xFFFFFC00 | 8;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, v3);
        unsigned int v4 = 0;
        while (1)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6192, &v14);
          if (result) {
            break;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6192, &v13);
          if (result) {
            break;
          }
          if (v14 == v13 || v4++ >= 4)
          {
            __int16 v6 = v14 & 0xF7FF;
            goto LABEL_26;
          }
        }
      }
    }
    else
    {
      int v7 = (unsigned __int16)v11;
      __int16 v14 = 4;
      uint64_t result = sub_10001DDEC(a1, 16, 4);
      if (!result)
      {
        __int16 v13 = 0;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, &readData);
        __dmb(1u);
        uint32_t v8 = readData & 0xFFFFFC00 | 9;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, v8);
        unsigned int v9 = 0;
        while (1)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6192, &v14);
          if (result) {
            break;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6192, &v13);
          if (result) {
            break;
          }
          if (v14 == v13 || v9++ >= 4)
          {
            __int16 v6 = v14 & 0xF7FF | ((v7 == 1) << 11);
LABEL_26:
            __int16 v14 = v6;
            return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 6192);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001EB3C(uint64_t a1, IOService *a2)
{
  uint64_t v4 = 3758097088;
  int v24 = 1;
  IOParseBootArgNumber("e1000", &v24, 4);
  if (!v24) {
    return 3758097084;
  }
  properties = 0;
  if (IOService::CopyProperties(a2, &properties, 0)) {
    sub_1000335DC();
  }
  Object = OSDictionary::getObject(properties, "device-id");
  __int16 v6 = (const OSData *)OSMetaClassBase::safeMetaCast(Object, gOSDataMetaClass);
  uint64_t v7 = 0;
  int v8 = *(_DWORD *)OSData::getBytesNoCopy(v6);
  while (dword_100038358[v7] != v8)
  {
    v7 += 4;
    if (v7 == 732)
    {
      if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315650;
        uint32_t v18 = "probe";
        __int16 v19 = 1024;
        int v20 = 336;
        __int16 v21 = 1024;
        LODWORD(v22) = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): not handling dev_id 0x%x\n", (uint8_t *)&v17, 0x18u);
      }
      goto LABEL_18;
    }
  }
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)&dword_100038358[v7 + 2];
    int v17 = 136315650;
    uint32_t v18 = "probe";
    __int16 v19 = 1024;
    int v20 = 310;
    __int16 v21 = 2080;
    uint64_t v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %s\n", (uint8_t *)&v17, 0x1Cu);
  }
  *(void *)a1 = a1;
  *(void *)(a1 + 16) = a2;
  *(_WORD *)(a1 + 9590) = -32634;
  *(_WORD *)(a1 + 9584) = v8;
  unsigned int v9 = OSDictionary::getObject(properties, "subsystem-vendor-id");
  int v10 = (const OSData *)OSMetaClassBase::safeMetaCast(v9, gOSDataMetaClass);
  if (v10) {
    *(_WORD *)(a1 + 9586) = *(_DWORD *)OSData::getBytesNoCopy(v10);
  }
  int v11 = OSDictionary::getObject(properties, "subsystem-id");
  int v12 = (const OSData *)OSMetaClassBase::safeMetaCast(v11, gOSDataMetaClass);
  if (v12) {
    *(_WORD *)(a1 + 9588) = *(_DWORD *)OSData::getBytesNoCopy(v12);
  }
  __int16 v13 = OSDictionary::getObject(properties, "revision-id");
  __int16 v14 = (const OSData *)OSMetaClassBase::safeMetaCast(v13, gOSDataMetaClass);
  *(unsigned char *)(a1 + 9592) = *(_DWORD *)OSData::getBytesNoCopy(v14);
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0;
  }
  properties = OSDictionaryCreate();
  OSDictionarySetStringValue(properties, "IOVendor", "Intel");
  OSDictionarySetStringValue(properties, "IOModel", *(const char **)&dword_100038358[v7 + 2]);
  IOService::SetProperties(*(IOService **)(a1 + 9600), properties, 0);
  uint64_t v4 = 0;
LABEL_18:
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v4;
}

uint64_t sub_10001EE58(uint64_t a1)
{
  IOPCIDevice::ConfigurationRead16(*(IOPCIDevice **)(a1 + 9608), 4uLL, (uint16_t *)(a1 + 1262));
  e1000_setup_init_funcs(a1, 1);
  e1000_get_bus_info(a1);
  if (*(int *)(a1 + 284) <= 12)
  {
    e1000_init_script_state_82541(a1, 1);
    e1000_set_tbi_compatibility_82543(a1, 1);
  }
  if (e1000_check_reset_block(a1) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 136315394;
    int v12 = "start";
    __int16 v13 = 1024;
    int v14 = 354;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): PHY reset is blocked due to SOL/IDER session.\n", (uint8_t *)&v11, 0x12u);
  }
  e1000_reset_hw(a1);
  int v2 = e1000_validate_nvm_checksum(a1);
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v11 = 136315650;
      int v12 = "start";
      __int16 v13 = 1024;
      int v14 = 359;
      __int16 v15 = 1024;
      int v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_validate_nvm_checksum() returned %d\n", (uint8_t *)&v11, 0x18u);
    }
  }
  if (e1000_read_mac_addr(a1)) {
    int mac_addr_generic = e1000_read_mac_addr_generic(a1);
  }
  else {
    int mac_addr_generic = 0;
  }
  uint32_t v11 = 0;
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v5 = 64;
  }
  else {
    uint64_t v5 = 21504;
  }
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v5, &v11);
  __dmb(1u);
  *(_DWORD *)(a1 + 10568) = v11;
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, &v11);
  __dmb(1u);
  uint32_t v6 = v11;
  *(_DWORD *)(a1 + 10572) = v11;
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a1 + 10568);
    uint32_t v11 = 136315906;
    int v12 = "start";
    __int16 v13 = 1024;
    int v14 = 366;
    __int16 v15 = 1024;
    int v16 = v10;
    __int16 v17 = 1024;
    uint32_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): fCurrentRAL=%x, RAH=%x\n", (uint8_t *)&v11, 0x1Eu);
  }
  *(_WORD *)(a1 + 9672) = 257;
  int v7 = *(_DWORD *)(a1 + 284);
  if (v7 < 29)
  {
    if (v7 <= 12) {
      *(unsigned char *)(a1 + 855) = 1;
    }
  }
  else
  {
    uint32_t v11 = 0;
    IOParseBootArgNumber("e1000", &v11, 4);
    int v8 = *(_DWORD *)(a1 + 284);
    if (v8 == 34 || v8 == 36 && (v11 & 2) != 0)
    {
      *(unsigned char *)(a1 + 10393) = 1;
      *(void *)&v19.ipv4_cnt = 0x20001000081008;
      *(void *)&v19.wakeTCPCount = 0x2000040A00640020;
      if (IOUserNetworkEthernet::ReportNicProxyLimits(*(IOUserNetworkEthernet **)(a1 + 9600), v19, 0)) {
        sub_100033608();
      }
    }
  }
  if (mac_addr_generic) {
    return 3758097084;
  }
  sub_10001F17C(a1);
  return 0;
}

void sub_10001F17C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 284);
  __dmb(2u);
  int v2 = *(IOPCIDevice **)(a1 + 16);
  if (v1 == 15)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(v2, 0, 0x5B50uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData | 8;
    uint64_t v4 = v2;
    uint64_t v5 = 23376;
  }
  else
  {
    uint32_t v6 = 0;
    IOPCIDevice::MemoryRead32(v2, 0, 0x18uLL, &v6);
    __dmb(1u);
    uint32_t v3 = v6 | 0x10000000;
    uint64_t v4 = v2;
    uint64_t v5 = 24;
  }
  IOPCIDevice::MemoryWrite32(v4, 0, v5, v3);
}

uint64_t sub_10001F21C(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v8 = 136315394;
    unsigned int v9 = "resetHW";
    __int16 v10 = 1024;
    int v11 = 413;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v8, 0x12u);
  }
  int v2 = e1000_phy_hw_reset(a1);
  if (v2)
  {
    if (dword_10003C000)
    {
      int v6 = v2;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v8 = 136315650;
        unsigned int v9 = "resetHW";
        __int16 v10 = 1024;
        int v11 = 415;
        __int16 v12 = 1024;
        int v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_phy_hw_reset returned %d\n", (uint8_t *)&v8, 0x18u);
      }
    }
  }
  int v3 = e1000_reset_hw(a1);
  if (v3)
  {
    if (dword_10003C000)
    {
      int v7 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v8 = 136315650;
        unsigned int v9 = "resetHW";
        __int16 v10 = 1024;
        int v11 = 416;
        __int16 v12 = 1024;
        int v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): e1000_reset_hw returned %d\n", (uint8_t *)&v8, 0x18u);
      }
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, 0);
  if (*(_DWORD *)(a1 + 284) == 34)
  {
    __dmb(2u);
    uint64_t v4 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(v4, 0, 0x5BB8uLL, &v8);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v4, 0, 0x5BB8uLL, v8 & 0xFFFFFF7F);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x38uLL, 0x8100u);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v8 = 136315650;
    unsigned int v9 = "resetHW";
    __int16 v10 = 1024;
    int v11 = 425;
    __int16 v12 = 1024;
    int v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v8, 0x18u);
  }
  return 0;
}

uint64_t sub_10001F4C4(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 10396);
    uint32_t v11 = 136315650;
    __int16 v12 = "initHW";
    __int16 v13 = 1024;
    int v14 = 431;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== fMaxPacketSize=0x%08x\n", (uint8_t *)&v11, 0x18u);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x38uLL, 0x8100u);
  if (*(_DWORD *)(a1 + 10396) >= 0x601u) {
    int v2 = 15360;
  }
  else {
    int v2 = 4096;
  }
  if (*(_DWORD *)(a1 + 10396) >= 0x601u) {
    int v3 = 12288;
  }
  else {
    int v3 = 2048;
  }
  *(_DWORD *)(a1 + 864) = v2;
  *(_DWORD *)(a1 + 868) = v3;
  *(_WORD *)(a1 + 872) = -1;
  *(unsigned char *)(a1 + 876) = 1;
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 136315906;
    __int16 v12 = "initHW";
    __int16 v13 = 1024;
    int v14 = 448;
    __int16 v15 = 1024;
    int v16 = 0xFFFF;
    __int16 v17 = 1024;
    int v18 = v2 | (v3 << 16);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): pause_time=0x%08x; low_water/high_water=0x%08x\n",
      (uint8_t *)&v11,
      0x1Eu);
  }
  __dmb(2u);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v4 = 360;
  }
  else {
    uint64_t v4 = 8544;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0x80008180);
  __dmb(2u);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v5 = 352;
  }
  else {
    uint64_t v5 = 8552;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v5, 0x8190u);
  sub_10001F21C(a1);
  if (e1000_init_hw(a1)) {
    uint64_t v6 = 3758097084;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1000uLL, &v11);
    __dmb(1u);
    uint32_t v10 = v11;
    uint32_t v11 = 136315650;
    __int16 v12 = "initHW";
    __int16 v13 = 1024;
    int v14 = 457;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Packet Buffer Allocation=0x%08x\n", (uint8_t *)&v11, 0x18u);
  }
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v11);
  __dmb(1u);
  uint32_t v7 = v11;
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 136315650;
    __int16 v12 = "initHW";
    __int16 v13 = 1024;
    int v14 = 461;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): initHW ctrl=0x%08x\n", (uint8_t *)&v11, 0x18u);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v7 | 0x18000000);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 136315650;
    __int16 v12 = "initHW";
    __int16 v13 = 1024;
    int v14 = 469;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v11, 0x18u);
  }
  return v6;
}

void sub_10001F884(uint64_t a1)
{
  int v2 = (unsigned __int8 *)(a1 + 9672);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v32 = 136315394;
    unsigned __int16 v33 = "enableIntrs";
    __int16 v34 = 1024;
    int v35 = 475;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v32, 0x12u);
  }
  v2[720] = 1;
  if (!*(void *)(a1 + 9640))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE0uLL, 0xFFFFFFFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 0x9Du);
    goto LABEL_57;
  }
  if (*(_DWORD *)(a1 + 284) == 29)
  {
    uint32_t v3 = 0x80000000;
  }
  else
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1514uLL, 0xC0000011);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1740uLL, 0x8000u);
    int v8 = *(_DWORD *)(a1 + 284);
    if ((v8 - 31) < 6)
    {
      if (v2[1])
      {
        int v9 = 0;
        int v10 = 0;
        uint32_t v3 = 1;
        int v11 = 0x10000;
        do
        {
          uint32_t v32 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, (v9 & 0x7FFFFFFCu) + 5888, &v32);
          __dmb(1u);
          unsigned int v12 = v10 + 1;
          if (v10) {
            uint32_t v13 = v11 | v32 & 0xFF00FFFF | 0x800000;
          }
          else {
            uint32_t v13 = (v10 + 1) | v32 & 0xFFFFFF00 | 0x80;
          }
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (v9 & 0x7FFFFFFCu) + 5888, v13);
          v3 |= 2 << v10;
          v11 += 0x10000;
          v9 += 2;
          ++v10;
        }
        while (v12 < v2[1]);
      }
      else
      {
        uint32_t v3 = 1;
      }
      if (*v2)
      {
        int v19 = 0;
        int v20 = 0;
        do
        {
          uint32_t v32 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, (v19 & 0x7FFFFFFCu) + 5888, &v32);
          __dmb(1u);
          uint32_t v21 = v32;
          unsigned int v22 = v20 + 1;
          if (v20) {
            int v23 = 0xFFFFFF;
          }
          else {
            int v23 = -65281;
          }
          if (v20) {
            char v24 = 24;
          }
          else {
            char v24 = 8;
          }
          if (v20) {
            unsigned int v25 = 0x80000000;
          }
          else {
            unsigned int v25 = 0x8000;
          }
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (v19 & 0x7FFFFFFCu) + 5888, (v22 << v24) | v25 | v21 & v23);
          v3 |= 2 << v20;
          v19 += 2;
          ++v20;
        }
        while (v22 < *v2);
      }
      goto LABEL_56;
    }
    if (v8 != 29)
    {
      if (v8 == 30)
      {
        if (v2[1])
        {
          char v14 = 0;
          unsigned int v15 = 0;
          uint32_t v3 = 1;
          int v16 = 0x10000;
          do
          {
            uint32_t v32 = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v14 & 0x1C | 0x1700u, &v32);
            __dmb(1u);
            unsigned int v17 = v15 + 1;
            if (v15 <= 7) {
              uint32_t v18 = (v15 + 1) | v32 & 0xFFFFFF00 | 0x80;
            }
            else {
              uint32_t v18 = v16 | v32 & 0xFF00FFFF | 0x800000;
            }
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v14 & 0x1C | 0x1700u, v18);
            v3 |= 2 << v15;
            v16 += 0x10000;
            v14 += 4;
            ++v15;
          }
          while (v17 < v2[1]);
        }
        else
        {
          uint32_t v3 = 1;
        }
        if (*v2)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          do
          {
            uint32_t v32 = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v26 & 0x1C | 0x1700u, &v32);
            __dmb(1u);
            uint32_t v28 = v32;
            if (v27 >= 8) {
              int v29 = 0xFFFFFF;
            }
            else {
              int v29 = -65281;
            }
            if (v27 >= 8) {
              char v30 = 24;
            }
            else {
              char v30 = 8;
            }
            if (v27 >= 8) {
              unsigned int v31 = 0x80000000;
            }
            else {
              unsigned int v31 = 0x8000;
            }
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v26 & 0x1C | 0x1700u, ((v27 + 1) << v30) | v31 | v28 & v29);
            v3 |= 2 << v27;
            v26 += 4;
            ++v27;
          }
          while (v27 < *v2);
        }
      }
      else
      {
        uint32_t v3 = 1;
      }
      goto LABEL_56;
    }
    uint32_t v3 = -2147483647;
  }
  __dmb(2u);
  uint64_t v4 = *(IOPCIDevice **)(a1 + 16);
  uint32_t v32 = 0;
  IOPCIDevice::MemoryRead32(v4, 0, 0x18uLL, &v32);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v4, 0, 0x18uLL, v32 | 0x81000001);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1600uLL, 0x80000000);
  if (v2[1])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 5636;
    do
    {
      uint32_t v7 = 257 << v5;
      v3 |= 257 << v5++;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, v7);
      v6 += 4;
    }
    while (v5 < v2[1]);
  }
LABEL_56:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x152CuLL, v3);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1530uLL, v3);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1524uLL, v3);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 4u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1680uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1684uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1684uLL, 0x100u);
LABEL_57:
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v32 = 136315394;
    unsigned __int16 v33 = "enableIntrs";
    __int16 v34 = 1024;
    int v35 = 587;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>\n", (uint8_t *)&v32, 0x12u);
  }
}

void sub_10001FE6C(uint64_t a1)
{
  if ((dword_10003C000 & 0x400) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint32_t v3 = "disableIntrs";
    __int16 v4 = 1024;
    int v5 = 592;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v2, 0x12u);
  }
  *(unsigned char *)(a1 + 10392) = 0;
  if (*(void *)(a1 + 9640))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1528uLL, 0xFFFFFFFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x152CuLL, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE0uLL, 0);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    uint32_t v3 = "disableIntrs";
    __int16 v4 = 1024;
    int v5 = 604;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>\n", (uint8_t *)&v2, 0x12u);
  }
}

uint64_t sub_10001FFEC(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315394;
    v67 = "initReceiveUnit";
    __int16 v68 = 1024;
    int v69 = 613;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&readData, 0x12u);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if ((*(_DWORD *)(a1 + 284) & 0xFFFFFFFE) != 0x10)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v2 & 0xFFFFFFFD);
  }
  uint32_t v65 = v2;
  e1000_rar_set(a1);
  if (dword_10003C000)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_168;
    }
    uint32_t v56 = *(unsigned __int8 *)(a1 + 272);
    uint32_t v57 = *(unsigned __int8 *)(a1 + 273);
    int v58 = *(unsigned __int8 *)(a1 + 274);
    int v59 = *(unsigned __int8 *)(a1 + 275);
    int v60 = *(unsigned __int8 *)(a1 + 276);
    int v61 = *(unsigned __int8 *)(a1 + 277);
    uint32_t readData = 136316930;
    v67 = "initReceiveUnit";
    __int16 v68 = 1024;
    int v69 = 626;
    __int16 v70 = 1024;
    uint32_t v71 = v56;
    __int16 v72 = 1024;
    uint32_t v73 = v57;
    __int16 v74 = 1024;
    int v75 = v58;
    __int16 v76 = 1024;
    int v77 = v59;
    __int16 v78 = 1024;
    int v79 = v60;
    __int16 v80 = 1024;
    int v81 = v61;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): mac address: %02x:%02x:%02x:%02x:%02x:%02x\n", (uint8_t *)&readData, 0x36u);
    if (dword_10003C000)
    {
LABEL_168:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t readData = 0;
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v62 = 64;
        }
        else {
          uint64_t v62 = 21504;
        }
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v62, &readData);
        __dmb(1u);
        uint32_t v63 = readData;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, &readData);
        __dmb(1u);
        uint32_t v64 = readData;
        uint32_t readData = 136315906;
        v67 = "initReceiveUnit";
        __int16 v68 = 1024;
        int v69 = 628;
        __int16 v70 = 1024;
        uint32_t v71 = v63;
        __int16 v72 = 1024;
        uint32_t v73 = v64;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): set mac address: ral=0x%08x rah=0x%08x\n", (uint8_t *)&readData, 0x1Eu);
      }
    }
  }
  uint64_t v3 = 21516;
  uint64_t v4 = 14;
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v3 - 4, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v3, 0);
    v3 += 8;
    --v4;
  }
  while (v4);
  for (int i = 0; i != 512; i += 4)
  {
    __dmb(2u);
    if (i)
    {
      unsigned int v6 = i + 20992;
    }
    else if (*(int *)(a1 + 284) <= 1)
    {
      unsigned int v6 = 512;
    }
    else
    {
      unsigned int v6 = 20992;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, 0);
  }
  for (uint64_t j = 0; j != 32; j += 4)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, j + 21632, 0);
  }
  for (uint64_t k = 0; k != 128; k += 4)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, k + 23552, 0);
  }
  if (*(int *)(a1 + 284) > 12)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, &readData);
    __dmb(1u);
    uint32_t v9 = readData;
    if (*(_DWORD *)(a1 + 284) == 16) {
      uint32_t v9 = readData | 0x1000;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v9 | 0x8000);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5000uLL, &readData);
  __dmb(1u);
  if (*(int *)(a1 + 284) <= 29) {
    int v10 = 768;
  }
  else {
    int v10 = 2816;
  }
  uint32_t v11 = v10 | readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5000uLL, v11);
  unsigned int v12 = (unsigned __int8 *)(a1 + 9673);
  LODWORD(v13) = *(unsigned __int8 *)(a1 + 9673);
  if (*(unsigned char *)(a1 + 9673))
  {
    unint64_t v14 = 0;
    unsigned int v15 = (uint32_t *)(a1 + 10304);
    int v16 = 49176;
    int v17 = 10240;
    do
    {
      __dmb(2u);
      unsigned int v18 = v16 - 16;
      if (v14 < 4) {
        unsigned int v18 = v17 + 8;
      }
      switch(v18)
      {
        case 0x3808u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v18 = 1064;
          }
          else {
            unsigned int v18 = 14344;
          }
          break;
        case 0x2908u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v18 = 320;
          }
          else {
            unsigned int v18 = 10504;
          }
          break;
        case 0x2808u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v18 = 280;
          }
          else {
            unsigned int v18 = 10248;
          }
          break;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v18, 0x800u);
      __dmb(2u);
      int v19 = v16 - 24;
      if (v14 < 4) {
        int v19 = v17;
      }
      if (v19 > 20991)
      {
        if (v19 == 20992)
        {
          BOOL v21 = *(_DWORD *)(a1 + 284) <= 1;
          int v19 = 20992;
          int v22 = 512;
LABEL_55:
          if (v21) {
            int v19 = v22;
          }
          goto LABEL_61;
        }
        int v20 = 22016;
        if (v19 != 22016)
        {
          if (v19 != 21504) {
            goto LABEL_61;
          }
          BOOL v21 = *(_DWORD *)(a1 + 284) <= 1;
          int v19 = 21504;
          int v22 = 64;
          goto LABEL_55;
        }
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        int v19 = 1536;
      }
      else
      {
        if (v19 == 10240)
        {
          BOOL v21 = *(_DWORD *)(a1 + 284) <= 1;
          int v19 = 10240;
          int v22 = 272;
          goto LABEL_55;
        }
        int v20 = 10496;
        if (v19 != 10496)
        {
          if (v19 != 14336) {
            goto LABEL_61;
          }
          BOOL v21 = *(_DWORD *)(a1 + 284) <= 1;
          int v19 = 14336;
          int v22 = 1056;
          goto LABEL_55;
        }
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        int v19 = 312;
      }
      if (!v23) {
        int v19 = v20;
      }
LABEL_61:
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v19, *v15);
      __dmb(2u);
      unsigned int v24 = v16 - 20;
      if (v14 < 4) {
        unsigned int v24 = v17 + 4;
      }
      switch(v24)
      {
        case 0x3804u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v24 = 1060;
          }
          else {
            unsigned int v24 = 14340;
          }
          break;
        case 0x2904u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v24 = 316;
          }
          else {
            unsigned int v24 = 10500;
          }
          break;
        case 0x2804u:
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v24 = 276;
          }
          else {
            unsigned int v24 = 10244;
          }
          break;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v24, v15[1]);
      __dmb(2u);
      int v25 = v16 - 8;
      if (v14 < 4) {
        int v25 = v17 + 16;
      }
      if (v25 > 13327)
      {
        int v26 = 13328;
        if (v25 != 13328)
        {
          if (v25 != 14352) {
            goto LABEL_91;
          }
          BOOL v27 = *(_DWORD *)(a1 + 284) <= 1;
          int v25 = 14352;
          int v28 = 1072;
          goto LABEL_84;
        }
        BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
        int v25 = 32784;
      }
      else
      {
        int v26 = 10256;
        if (v25 != 10256)
        {
          if (v25 != 10512) {
            goto LABEL_91;
          }
          BOOL v27 = *(_DWORD *)(a1 + 284) <= 1;
          int v25 = 10512;
          int v28 = 328;
LABEL_84:
          if (v27) {
            int v25 = v28;
          }
          goto LABEL_91;
        }
        BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
        int v25 = 288;
      }
      if (!v29) {
        int v25 = v26;
      }
LABEL_91:
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v25, *(v15 - 36));
      __dmb(2u);
      int v30 = v17 + 24;
      if (v14 >= 4) {
        int v30 = v16;
      }
      if (v30 > 13335)
      {
        int v31 = 13336;
        if (v30 == 13336)
        {
          BOOL v34 = *(_DWORD *)(a1 + 284) <= 1;
          int v30 = 32792;
LABEL_105:
          if (!v34) {
            int v30 = v31;
          }
          goto LABEL_107;
        }
        if (v30 == 14360)
        {
          BOOL v32 = *(_DWORD *)(a1 + 284) <= 1;
          int v30 = 14360;
          int v33 = 1080;
LABEL_100:
          if (v32) {
            int v30 = v33;
          }
        }
      }
      else
      {
        int v31 = 10264;
        if (v30 == 10264)
        {
          BOOL v34 = *(_DWORD *)(a1 + 284) <= 1;
          int v30 = 296;
          goto LABEL_105;
        }
        if (v30 == 10520)
        {
          BOOL v32 = *(_DWORD *)(a1 + 284) <= 1;
          int v30 = 10520;
          int v33 = 336;
          goto LABEL_100;
        }
      }
LABEL_107:
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v30, *(v15 - 35));
      ++v14;
      unint64_t v13 = *v12;
      v17 += 256;
      v16 += 64;
      v15 += 88;
    }
    while (v14 < v13);
  }
  int v35 = *(_DWORD *)(a1 + 284);
  if ((v35 - 20) < 2 || v35 == 23)
  {
    if (*(_DWORD *)(a1 + 10388) >= 0x5DDu)
    {
      __dmb(2u);
      long long v41 = *(IOPCIDevice **)(a1 + 16);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(v41, 0, 0x2828uLL, &readData);
      __dmb(1u);
      IOPCIDevice::MemoryWrite32(v41, 0, 0x2828uLL, readData | 3);
    }
  }
  else if (v35 == 16)
  {
    if (v13)
    {
      unsigned int v36 = 0;
      unsigned int v37 = 49192;
      unsigned int v38 = 10280;
      do
      {
        uint32_t readData = 0;
        if (v36 >= 4) {
          uint64_t v39 = v37;
        }
        else {
          uint64_t v39 = v38;
        }
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v39, &readData);
        __dmb(1u);
        uint32_t v40 = readData | 0x1040420;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v39, v40);
        ++v36;
        v37 += 64;
        v38 += 256;
      }
      while (v36 < *v12);
    }
  }
  else if (v35 >= 29 && v13)
  {
    unsigned int v51 = 0;
    do
    {
      uint32_t v52 = (*(_DWORD *)(a1 + 10388) >> 10) - 2113928192;
      __dmb(2u);
      if (v51 >= 4) {
        uint64_t v53 = (v51 << 6) + 49164;
      }
      else {
        uint64_t v53 = (v51 << 8) + 10252;
      }
      if (v51 >= 4) {
        uint64_t v54 = (v51 << 6) + 49192;
      }
      else {
        uint64_t v54 = (v51 << 8) + 10280;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v53, v52);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v54, 0x2040808u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v54, &readData);
      __dmb(1u);
      if ((readData & 0x2000000) == 0)
      {
        int v55 = 0;
        while (v55 != 10000)
        {
          ++v55;
          IODelay(0x3E8uLL);
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v54, &readData);
          __dmb(1u);
          if ((readData & 0x2000000) != 0)
          {
            if ((v55 - 1) < 0x270F) {
              goto LABEL_151;
            }
            break;
          }
        }
        if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t readData = 136315650;
          v67 = "initReceiveUnit";
          __int16 v68 = 1024;
          int v69 = 697;
          __int16 v70 = 1024;
          uint32_t v71 = v51;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Enable not set in rxdctl for ring[%d]\n", (uint8_t *)&readData, 0x18u);
        }
      }
LABEL_151:
      ++v51;
    }
    while (v51 < *v12);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  unsigned int v42 = v65 & 0xFBFC4FD9 | (*(_DWORD *)(a1 + 304) << 12);
  uint32_t v43 = v42 | 0x4008022;
  if (*(int *)(a1 + 284) <= 28)
  {
    int v44 = *(_DWORD *)(a1 + 10388);
    int v45 = v42 | 0x6028022;
    int v46 = v42 | 0x6018022;
    if (v44 == 0x4000) {
      uint32_t v47 = v46;
    }
    else {
      uint32_t v47 = v43;
    }
    if (v44 == 8196) {
      unsigned int v48 = v45;
    }
    else {
      unsigned int v48 = v47;
    }
    unsigned int v49 = v46 | 0x20000;
    if (v44 != 4096) {
      unsigned int v49 = v43;
    }
    if (v44 == 2048) {
      unsigned int v49 = v43 & 0xFDFFFFFB;
    }
    if (v44 > 8195) {
      unsigned int v49 = v48;
    }
    uint32_t v43 = v49 & 0xFFFFF3FF;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v43);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xC350uLL);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315650;
    v67 = "initReceiveUnit";
    __int16 v68 = 1024;
    int v69 = 747;
    __int16 v70 = 1024;
    uint32_t v71 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&readData, 0x18u);
  }
  return 0;
}

uint64_t sub_100020B6C(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v21 = 136315394;
    int v22 = "initTransmitUnit";
    __int16 v23 = 1024;
    int v24 = 754;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v21, 0x12u);
  }
  uint32_t v21 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &v21);
  __dmb(1u);
  uint32_t v2 = v21;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v2 & 0xFFFFFFFD);
  uint32_t v21 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v21);
  __dmb(1u);
  IODelay(0x2710uLL);
  if (*(unsigned char *)(a1 + 9672))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = (uint32_t *)(a1 + 9952);
    unsigned int v6 = 14396;
    do
    {
      __dmb(2u);
      int v7 = v3 + 57344;
      if (v4 < 4) {
        int v7 = v6 - 60;
      }
      if (v7 > 21503)
      {
        if (v7 == 22016)
        {
          if (*(int *)(a1 + 284) <= 1) {
            int v7 = 1536;
          }
          else {
            int v7 = 22016;
          }
        }
        else if (v7 == 21504)
        {
          BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
          int v7 = 21504;
          int v9 = 64;
LABEL_13:
          if (v8) {
            int v7 = v9;
          }
        }
      }
      else if (v7 == 14336)
      {
        if (*(int *)(a1 + 284) <= 1) {
          int v7 = 1056;
        }
        else {
          int v7 = 14336;
        }
      }
      else if (v7 == 20992)
      {
        BOOL v8 = *(_DWORD *)(a1 + 284) <= 1;
        int v7 = 20992;
        int v9 = 512;
        goto LABEL_13;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v7, *v5);
      __dmb(2u);
      if (v3)
      {
        unsigned int v10 = v3 + 57348;
        if (v4 < 4) {
          unsigned int v10 = v6 - 56;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v10 = 1060;
      }
      else
      {
        unsigned int v10 = v6 - 56;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v10, v5[1]);
      __dmb(2u);
      if (v3)
      {
        unsigned int v11 = v3 + 57352;
        if (v4 < 4) {
          unsigned int v11 = v6 - 52;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v11 = 1064;
      }
      else
      {
        unsigned int v11 = v6 - 52;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v11, 0x800u);
      __dmb(2u);
      if (v3)
      {
        unsigned int v12 = v3 + 57360;
        if (v4 < 4) {
          unsigned int v12 = v6 - 44;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v12 = 1072;
      }
      else
      {
        unsigned int v12 = v6 - 44;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v12, *(v5 - 36));
      __dmb(2u);
      if (v3)
      {
        unsigned int v13 = v3 + 57368;
        if (v4 < 4) {
          unsigned int v13 = v6 - 36;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v13 = 1080;
      }
      else
      {
        unsigned int v13 = v6 - 36;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v13, *(v5 - 35));
      if (*(int *)(a1 + 284) >= 29)
      {
        uint64_t v14 = *(void *)v5 + 2048;
        __dmb(2u);
        if (v4 >= 4) {
          uint64_t v15 = (v3 + 57400);
        }
        else {
          uint64_t v15 = v6 - 4;
        }
        if (v4 >= 4) {
          uint64_t v16 = (v3 + 57404);
        }
        else {
          uint64_t v16 = v6;
        }
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v15, v14 | 1);
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v16, HIDWORD(v14));
      }
      __dmb(2u);
      if (v4 >= 4) {
        uint64_t v17 = (v3 + 57384);
      }
      else {
        uint64_t v17 = v6 - 20;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v17, 0x2000108u);
      ++v4;
      v3 += 64;
      v5 += 88;
      v6 += 256;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 9672));
  }
  int v18 = *(_DWORD *)(a1 + 284);
  if (v18 == 1)
  {
    uint32_t v19 = 10487818;
  }
  else if (v18 == 18)
  {
    uint32_t v19 = 7340040;
  }
  else if ((*(_DWORD *)(a1 + 1116) & 0xFFFFFFFE) == 2)
  {
    uint32_t v19 = 6299657;
  }
  else
  {
    uint32_t v19 = 6299656;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x410uLL, v19);
  if (*(_DWORD *)(a1 + 284) == 34
    && (dword_10003C000 & 1) != 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v21 = 136315394;
    int v22 = "initTransmitUnit";
    __int16 v23 = 1024;
    int v24 = 808;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Shared mac type test passed\n", (uint8_t *)&v21, 0x12u);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 0xA503F0FA);
  uint32_t v21 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v21);
  __dmb(1u);
  IODelay(0x2710uLL);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v21 = 136315650;
    int v22 = "initTransmitUnit";
    __int16 v23 = 1024;
    int v24 = 827;
    __int16 v25 = 1024;
    int v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v21, 0x18u);
  }
  return 0;
}

uint64_t sub_1000210BC(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "up";
    __int16 v6 = 1024;
    int v7 = 833;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v4, 0x12u);
  }
  sub_10001F17C(a1);
  sub_1000212A8(a1);
  sub_10001F4C4(a1);
  e1000_power_up_phy(a1);
  uint64_t v2 = sub_10002B724(a1);
  if (v2)
  {
    if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      int v5 = "up";
      __int16 v6 = 1024;
      int v7 = 845;
      __int16 v8 = 1024;
      int v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): allocateRings failed err=%d\n", (uint8_t *)&v4, 0x18u);
    }
  }
  else
  {
    sub_100020B6C(a1);
    sub_10001FFEC(a1);
    sub_10001F884(a1);
  }
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    int v5 = "up";
    __int16 v6 = 1024;
    int v7 = 863;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v4, 0x18u);
  }
  *(unsigned char *)(a1 + 10384) = 1;
  return v2;
}

void sub_1000212A8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 10393))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5808uLL, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5810uLL, 0xFFFFFFFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5838uLL, 0);
    __dmb(2u);
    uint64_t v2 = *(IOPCIDevice **)(a1 + 16);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(v2, 0, 0, &readData);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v2, 0, 0, readData & 0xFFEFFFFF);
  }
}

uint64_t sub_100021378(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    int v4 = "down";
    __int16 v5 = 1024;
    int v6 = 872;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v3, 0x12u);
  }
  sub_10001FE6C(a1);
  sub_10001F21C(a1);
  IODelay(0x2710uLL);
  e1000_power_down_phy(a1);
  IODelay(0x2710uLL);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315650;
    int v4 = "down";
    __int16 v5 = 1024;
    int v6 = 880;
    __int16 v7 = 1024;
    int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v3, 0x18u);
  }
  return 0;
}

uint64_t sub_1000214B8(uint64_t a1, int a2)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v7 = 136315650;
    int v8 = "setPromiscuousModeEnable";
    __int16 v9 = 1024;
    int v10 = 886;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== active=%d\n", (uint8_t *)&v7, 0x18u);
  }
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, &v7);
  __dmb(1u);
  uint32_t v4 = v7 & 0xFFFFFFE7;
  if (a2) {
    int v5 = 24;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, v4 | v5);
  return 0;
}

uint64_t sub_1000215AC(uint64_t a1, int a2)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315650;
    __int16 v11 = "setAllMulticastModeEnable";
    __int16 v12 = 1024;
    int v13 = 902;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== active=%d\n", (uint8_t *)&readData, 0x18u);
  }
  uint64_t v4 = 0;
  int v5 = 0;
  uint32_t v6 = 0;
  *(unsigned char *)(a1 + 10576) = a2;
  do
  {
    uint32_t readData = 0;
    uint64_t v7 = v4 | 0x5200;
    uint64_t v8 = v7;
    if (!v4)
    {
      if (*(int *)(a1 + 284) <= 1) {
        uint64_t v8 = 512;
      }
      else {
        uint64_t v8 = 20992;
      }
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v8, &readData);
    __dmb(1u);
    if (a2) {
      uint32_t v6 = *(_DWORD *)(a1 + 10580 + v4);
    }
    if (v6 != readData)
    {
      if ((dword_10003C000 & 0x40000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t readData = 136315906;
        __int16 v11 = "setAllMulticastModeEnable";
        __int16 v12 = 1024;
        int v13 = 911;
        __int16 v14 = 1024;
        int v15 = v5;
        __int16 v16 = 1024;
        uint32_t v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Setting mta[0x%02x] to 0x%08x\n", (uint8_t *)&readData, 0x1Eu);
      }
      __dmb(2u);
      if (!v4)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint64_t v7 = 512;
        }
        else {
          uint64_t v7 = 20992;
        }
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v7, v6);
    }
    ++v5;
    v4 += 4;
  }
  while (v4 != 512);
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315650;
    __int16 v11 = "setAllMulticastModeEnable";
    __int16 v12 = 1024;
    int v13 = 916;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&readData, 0x18u);
  }
  return 0;
}

uint64_t sub_100021824(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315650;
    long long v41 = "setMcastAddresses";
    __int16 v42 = 1024;
    int v43 = 946;
    __int16 v44 = 1024;
    int v45 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== count=%u\n", (uint8_t *)&readData, 0x18u);
  }
  uint32_t readData = 0;
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v6 = 64;
  }
  else {
    uint64_t v6 = 21504;
  }
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v6, &readData);
  __dmb(1u);
  uint32_t v7 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, &readData);
  __dmb(1u);
  if (v7 != *(_DWORD *)(a1 + 10568) || readData != *(_DWORD *)(a1 + 10572))
  {
    __dmb(2u);
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v8 = 64;
    }
    else {
      uint64_t v8 = 21504;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v8, *(_DWORD *)(a1 + 10568));
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5404uLL, *(_DWORD *)(a1 + 10572));
  }
  uint64_t v9 = 21516;
  uint64_t v10 = 13;
  do
  {
    if (a3)
    {
      if ((dword_10003C000 & 0x40000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *a2;
        int v14 = a2[1];
        int v15 = a2[2];
        int v16 = a2[3];
        int v17 = a2[4];
        int v18 = a2[5];
        uint32_t readData = 136316930;
        long long v41 = "setMcastAddresses";
        __int16 v42 = 1024;
        int v43 = 964;
        __int16 v44 = 1024;
        int v45 = v13;
        __int16 v46 = 1024;
        int v47 = v14;
        __int16 v48 = 1024;
        int v49 = v15;
        __int16 v50 = 1024;
        int v51 = v16;
        __int16 v52 = 1024;
        int v53 = v17;
        __int16 v54 = 1024;
        int v55 = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): mcast addr %02x:%02x:%02x:%02x:%02x:%02x\n", (uint8_t *)&readData, 0x36u);
      }
      uint32_t v11 = *(_DWORD *)a2;
      uint32_t v12 = *((unsigned __int16 *)a2 + 2) | 0x800C0000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v9 - 4, v11);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v9, v12);
      --a3;
      a2 += 6;
    }
    else
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v9 - 4, 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v9, 0);
    }
    v9 += 8;
    --v10;
  }
  while (v10);
  if (*(unsigned char *)(a1 + 10576))
  {
    for (int i = 0; i != 512; i += 4)
    {
      __dmb(2u);
      if (i)
      {
        unsigned int v20 = i + 20992;
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v20 = 512;
      }
      else
      {
        unsigned int v20 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v20, 0);
    }
  }
  *(unsigned char *)(a1 + 10576) = a3 != 0;
  if (a3)
  {
    while (1)
    {
      if ((dword_10003C000 & 0x40000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = *a2;
        int v32 = a2[1];
        int v33 = a2[2];
        int v34 = a2[3];
        int v35 = a2[4];
        int v36 = a2[5];
        uint32_t readData = 136316930;
        long long v41 = "setMcastAddresses";
        __int16 v42 = 1024;
        int v43 = 1003;
        __int16 v44 = 1024;
        int v45 = v31;
        __int16 v46 = 1024;
        int v47 = v32;
        __int16 v48 = 1024;
        int v49 = v33;
        __int16 v50 = 1024;
        int v51 = v34;
        __int16 v52 = 1024;
        int v53 = v35;
        __int16 v54 = 1024;
        int v55 = v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): mcast addr %02x:%02x:%02x:%02x:%02x:%02x\n", (uint8_t *)&readData, 0x36u);
      }
      unsigned int v39 = 0;
      uint32_t readData = 0;
      sub_100022430(a1, (uint64_t)a2, &readData, &v39);
      uint32_t v38 = 0;
      signed int v21 = 4 * readData;
      uint32_t v22 = 4 * readData + 20992;
      if ((int)(4 * readData) <= -10481)
      {
        if (v21 <= -10745)
        {
          if (v21 > -11753)
          {
            switch(v21)
            {
              case -11752:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 32776;
                int v24 = 9240;
                break;
              case -10752:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 272;
                int v24 = 10240;
                break;
              case -10748:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 276;
                int v24 = 10244;
                break;
              default:
                goto LABEL_95;
            }
          }
          else
          {
            switch(v21)
            {
              case -12448:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 360;
                int v24 = 8544;
                break;
              case -12440:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 352;
                int v24 = 8552;
                break;
              case -11760:
                BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
                uint32_t v22 = 0x8000;
                int v24 = 9232;
                break;
              default:
                goto LABEL_95;
            }
          }
        }
        else if (v21 <= -10721)
        {
          switch(v21)
          {
            case -10744:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 280;
              int v24 = 10248;
              break;
            case -10736:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 288;
              int v24 = 10256;
              break;
            case -10728:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 296;
              int v24 = 10264;
              break;
            default:
              goto LABEL_95;
          }
        }
        else if (v21 > -10493)
        {
          if (v21 == -10492)
          {
            BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
            uint32_t v22 = 316;
            int v24 = 10500;
          }
          else
          {
            if (v21 != -10488) {
              goto LABEL_95;
            }
            BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
            uint32_t v22 = 320;
            int v24 = 10504;
          }
        }
        else if (v21 == -10720)
        {
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          uint32_t v22 = 264;
          int v24 = 10272;
        }
        else
        {
          if (v21 != -10496) {
            goto LABEL_95;
          }
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          uint32_t v22 = 312;
          int v24 = 10496;
        }
        goto LABEL_93;
      }
      if (v21 <= -6649)
      {
        if (v21 > -7657)
        {
          switch(v21)
          {
            case -7656:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 32792;
              int v24 = 13336;
              break;
            case -6656:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 1056;
              int v24 = 14336;
              break;
            case -6652:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 1060;
              int v24 = 14340;
              break;
            default:
              goto LABEL_95;
          }
        }
        else
        {
          switch(v21)
          {
            case -10480:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 328;
              int v24 = 10512;
              break;
            case -10472:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 336;
              int v24 = 10520;
              break;
            case -7664:
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              uint32_t v22 = 32784;
              int v24 = 13328;
              break;
            default:
              goto LABEL_95;
          }
        }
        goto LABEL_93;
      }
      if (v21 <= -6625) {
        break;
      }
      if (v21 > 511)
      {
        if (v21 == 1024)
        {
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          uint32_t v22 = 1536;
          int v24 = 22016;
        }
        else
        {
          if (v21 != 512) {
            goto LABEL_95;
          }
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          uint32_t v22 = 64;
          int v24 = 21504;
        }
        goto LABEL_93;
      }
      if (v21 == -6624)
      {
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        uint32_t v22 = 1088;
        int v24 = 14368;
LABEL_93:
        if (!v23) {
          uint32_t v22 = v24;
        }
        goto LABEL_95;
      }
      if (!v21)
      {
        if (*(int *)(a1 + 284) <= 1) {
          uint32_t v22 = 512;
        }
        else {
          uint32_t v22 = 20992;
        }
      }
LABEL_95:
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v22, &v38);
      __dmb(1u);
      uint32_t v25 = v38;
      char v26 = v39;
      __dmb(2u);
      signed int v27 = 4 * readData;
      if ((int)(4 * readData) > -10721)
      {
        if (v27 == -10720)
        {
          BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v29 = 264;
          int v30 = 10272;
          goto LABEL_104;
        }
        if (v27 == 512)
        {
          BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v29 = 64;
          int v30 = 21504;
          goto LABEL_104;
        }
      }
      else
      {
        if (v27 == -10752)
        {
          BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v29 = 272;
          int v30 = 10240;
          goto LABEL_104;
        }
        if (v27 == -10748)
        {
          BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
          unsigned int v29 = 276;
          int v30 = 10244;
          goto LABEL_104;
        }
      }
      unsigned int v29 = v27 + 20992;
      if (v27 > -10473)
      {
        if (v27 <= -6649)
        {
          if (v27 <= -7657)
          {
            if (v27 == -10472)
            {
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 336;
              int v30 = 10520;
LABEL_104:
              if (!v28) {
                unsigned int v29 = v30;
              }
              goto LABEL_106;
            }
            if (v27 == -7664)
            {
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 32784;
              int v30 = 13328;
              goto LABEL_104;
            }
          }
          else
          {
            switch(v27)
            {
              case -7656:
                BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v29 = 32792;
                int v30 = 13336;
                goto LABEL_104;
              case -6656:
                BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v29 = 1056;
                int v30 = 14336;
                goto LABEL_104;
              case -6652:
                BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
                unsigned int v29 = 1060;
                int v30 = 14340;
                goto LABEL_104;
            }
          }
        }
        else if (v27 > -6625)
        {
          if (v27 == -6624)
          {
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 1088;
            int v30 = 14368;
            goto LABEL_104;
          }
          if (v27)
          {
            if (v27 == 1024)
            {
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 1536;
              int v30 = 22016;
              goto LABEL_104;
            }
          }
          else if (*(int *)(a1 + 284) <= 1)
          {
            unsigned int v29 = 512;
          }
          else
          {
            unsigned int v29 = 20992;
          }
        }
        else
        {
          switch(v27)
          {
            case -6648:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 1064;
              int v30 = 14344;
              goto LABEL_104;
            case -6640:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 1072;
              int v30 = 14352;
              goto LABEL_104;
            case -6632:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 1080;
              int v30 = 14360;
              goto LABEL_104;
          }
        }
      }
      else if (v27 <= -10737)
      {
        if (v27 <= -11761)
        {
          if (v27 == -12448)
          {
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 360;
            int v30 = 8544;
            goto LABEL_104;
          }
          if (v27 == -12440)
          {
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 352;
            int v30 = 8552;
            goto LABEL_104;
          }
        }
        else
        {
          switch(v27)
          {
            case -11760:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 0x8000;
              int v30 = 9232;
              goto LABEL_104;
            case -11752:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 32776;
              int v30 = 9240;
              goto LABEL_104;
            case -10744:
              BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
              unsigned int v29 = 280;
              int v30 = 10248;
              goto LABEL_104;
          }
        }
      }
      else if (v27 > -10493)
      {
        switch(v27)
        {
          case -10492:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 316;
            int v30 = 10500;
            goto LABEL_104;
          case -10488:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 320;
            int v30 = 10504;
            goto LABEL_104;
          case -10480:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 328;
            int v30 = 10512;
            goto LABEL_104;
        }
      }
      else
      {
        switch(v27)
        {
          case -10736:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 288;
            int v30 = 10256;
            goto LABEL_104;
          case -10728:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 296;
            int v30 = 10264;
            goto LABEL_104;
          case -10496:
            BOOL v28 = *(_DWORD *)(a1 + 284) <= 1;
            unsigned int v29 = 312;
            int v30 = 10496;
            goto LABEL_104;
        }
      }
LABEL_106:
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v29, (1 << v26) | v25);
      a2 += 6;
      if (!--a3) {
        goto LABEL_163;
      }
    }
    switch(v21)
    {
      case -6648:
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        uint32_t v22 = 1064;
        int v24 = 14344;
        break;
      case -6640:
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        uint32_t v22 = 1072;
        int v24 = 14352;
        break;
      case -6632:
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        uint32_t v22 = 1080;
        int v24 = 14360;
        break;
      default:
        goto LABEL_95;
    }
    goto LABEL_93;
  }
LABEL_163:
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t readData = 136315650;
    long long v41 = "setMcastAddresses";
    __int16 v42 = 1024;
    int v43 = 1022;
    __int16 v44 = 1024;
    int v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&readData, 0x18u);
  }
  return 0;
}

void sub_100022430(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)a2 >> 16;
    unsigned int v11 = *a3;
    unsigned int v12 = *a4;
    int v15 = 136316162;
    int v16 = "hashMcastAddress";
    __int16 v17 = 1024;
    int v18 = 925;
    __int16 v19 = 2048;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    unsigned int v22 = v11;
    __int16 v23 = 1024;
    unsigned int v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== mcAddr=0x%012llx mtaWord=0x%08x mtaBit=0x%08x\n", (uint8_t *)&v15, 0x28u);
  }
  int v7 = *(unsigned __int8 *)(a2 + 4) >> 4;
  unsigned int v8 = *(unsigned __int8 *)(a2 + 5);
  *a3 = v8 >> 1;
  unsigned int v9 = v7 & 0xFFFFFFEF | (16 * (v8 & 1));
  *a4 = v9;
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)a2 >> 16;
    unsigned int v14 = *a3;
    int v15 = 136316162;
    int v16 = "hashMcastAddress";
    __int16 v17 = 1024;
    int v18 = 939;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    __int16 v21 = 1024;
    unsigned int v22 = v14;
    __int16 v23 = 1024;
    unsigned int v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> mcAddr=0x%012llx mtaWord=0x%08x mtaBit=0x%08x\n", (uint8_t *)&v15, 0x28u);
  }
}

void sub_1000225C4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 284) == 15)
  {
    __dmb(2u);
    uint64_t v2 = *(IOPCIDevice **)(a1 + 16);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(v2, 0, 0x5B50uLL, &readData);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v2, 0, 0x5B50uLL, readData & 0xFFFFFFF7);
  }
  __dmb(2u);
  int v3 = *(IOPCIDevice **)(a1 + 16);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(v3, 0, 0x18uLL, &v4);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v3, 0, 0x18uLL, v4 & 0xEFFFFFFF);
}

void sub_100022670(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C000 & 0x20000) != 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    int v5 = *(unsigned __int8 *)(a2 + 10);
    int v13 = 136315650;
    unsigned int v14 = "activateWOL";
    __int16 v15 = 1024;
    int v16 = 1151;
    __int16 v17 = 1024;
    LODWORD(v18) = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): flags = %x\n", (uint8_t *)&v13, 0x18u);
    if ((dword_10003C000 & 0x20000) != 0)
    {
LABEL_27:
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v6 = *(unsigned __int8 *)(a2 + 13);
      int v13 = 136315650;
      unsigned int v14 = "activateWOL";
      __int16 v15 = 1024;
      int v16 = 1152;
      __int16 v17 = 1024;
      LODWORD(v18) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.v4AddrCount = %d\n", (uint8_t *)&v13, 0x18u);
      if ((dword_10003C000 & 0x20000) != 0)
      {
LABEL_21:
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        int v7 = *(unsigned __int8 *)(a2 + 15);
        int v13 = 136315650;
        unsigned int v14 = "activateWOL";
        __int16 v15 = 1024;
        int v16 = 1154;
        __int16 v17 = 1024;
        LODWORD(v18) = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.v6AddrCount = %d\n", (uint8_t *)&v13, 0x18u);
        if ((dword_10003C000 & 0x20000) != 0)
        {
LABEL_22:
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_23;
          }
          int v8 = *(unsigned __int16 *)(a2 + 32);
          int v13 = 136315650;
          unsigned int v14 = "activateWOL";
          __int16 v15 = 1024;
          int v16 = 1156;
          __int16 v17 = 1024;
          LODWORD(v18) = v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.UDPPortCount = %d\n", (uint8_t *)&v13, 0x18u);
          if ((dword_10003C000 & 0x20000) != 0)
          {
LABEL_23:
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_24;
            }
            int v9 = *(unsigned __int16 *)(a2 + 34);
            int v13 = 136315650;
            unsigned int v14 = "activateWOL";
            __int16 v15 = 1024;
            int v16 = 1158;
            __int16 v17 = 1024;
            LODWORD(v18) = v9;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.TCPPortCount = %d\n", (uint8_t *)&v13, 0x18u);
            if ((dword_10003C000 & 0x20000) != 0)
            {
LABEL_24:
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_25;
              }
              int v10 = *(unsigned __int16 *)(a2 + 44);
              int v13 = 136315650;
              unsigned int v14 = "activateWOL";
              __int16 v15 = 1024;
              int v16 = 1160;
              __int16 v17 = 1024;
              LODWORD(v18) = v10;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.v4KACount = %d\n", (uint8_t *)&v13, 0x18u);
              if ((dword_10003C000 & 0x20000) != 0)
              {
LABEL_25:
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_26;
                }
                int v11 = *(unsigned __int16 *)(a2 + 46);
                int v13 = 136315650;
                unsigned int v14 = "activateWOL";
                __int16 v15 = 1024;
                int v16 = 1162;
                __int16 v17 = 1024;
                LODWORD(v18) = v11;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.v6KACount = %d\n", (uint8_t *)&v13, 0x18u);
                if ((dword_10003C000 & 0x20000) != 0)
                {
LABEL_26:
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    int v12 = *(_DWORD *)(a2 + 64);
                    int v13 = 136315650;
                    unsigned int v14 = "activateWOL";
                    __int16 v15 = 1024;
                    int v16 = 1164;
                    __int16 v17 = 1024;
                    LODWORD(v18) = v12;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ips.RRCount = %d\n", (uint8_t *)&v13, 0x18u);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  e1000_power_up_phy(a1);
  IODelay(0x186A0uLL);
  sub_100023214(a1, a2, v4);
}

void sub_100023214(uint64_t a1, uint64_t a2, __n128 a3)
{
  *(_DWORD *)uint32_t v64 = 0;
  unsigned __int16 v63 = 0;
  int v3 = (unsigned __int16 *)(a2 + 32);
  unsigned int v4 = *(unsigned __int16 *)(a2 + 32);
  uint64_t v47 = a2;
  if (*(_WORD *)(a2 + 32))
  {
    unint64_t v5 = 0;
    int v6 = dword_10003C000;
    int v7 = (os_log_s *)&_os_log_default;
    a3.n128_u64[0] = 136316162;
    do
    {
      if ((v6 & 0x40000) != 0)
      {
        unsigned int v42 = *(unsigned __int16 *)((char *)&v3[v5] + *(unsigned int *)(a2 + 36));
        int v8 = v7;
        __n128 v44 = a3;
        BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        a3 = v44;
        int v7 = v8;
        a2 = v47;
        if (v9)
        {
          *(_DWORD *)buf = v44.n128_u32[0];
          uint32_t v56 = "mDNS_Callback";
          __int16 v57 = 1024;
          int v58 = 2241;
          __int16 v59 = 1024;
          *(_DWORD *)int v60 = v5;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v5;
          *(_WORD *)int v61 = 1024;
          *(_DWORD *)&v61[2] = __rev16(v42);
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): (%d) udp port %d at %d\n", buf, 0x24u);
          a3 = v44;
          int v7 = v8;
          a2 = v47;
          int v6 = dword_10003C000;
          unsigned int v4 = *v3;
        }
      }
      ++v5;
    }
    while (v5 < v4);
  }
  unsigned int v10 = *(unsigned __int16 *)(a2 + 34);
  if (*(_WORD *)(a2 + 34))
  {
    unint64_t v11 = 0;
    int v12 = dword_10003C000;
    int v13 = (os_log_s *)&_os_log_default;
    a3.n128_u64[0] = 136316162;
    do
    {
      if ((v12 & 0x40000) != 0)
      {
        unsigned int v43 = *(unsigned __int16 *)((char *)&v3[v11] + *(unsigned int *)(a2 + 40));
        unsigned int v14 = v13;
        __n128 v45 = a3;
        BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        a3 = v45;
        int v13 = v14;
        a2 = v47;
        if (v15)
        {
          *(_DWORD *)buf = v45.n128_u32[0];
          uint32_t v56 = "mDNS_Callback";
          __int16 v57 = 1024;
          int v58 = 2245;
          __int16 v59 = 1024;
          *(_DWORD *)int v60 = v11;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v11;
          *(_WORD *)int v61 = 1024;
          *(_DWORD *)&v61[2] = __rev16(v43);
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): (%d) tcp port %d at %d\n", buf, 0x24u);
          a3 = v45;
          int v13 = v14;
          a2 = v47;
          int v12 = dword_10003C000;
          unsigned int v10 = *(unsigned __int16 *)(v47 + 34);
        }
      }
      ++v11;
    }
    while (v11 < v10);
  }
  *(_DWORD *)(a1 + 10400) = 0;
  int v16 = (unsigned __int8 *)(a2 + 12);
  if (*(unsigned char *)(a2 + 13))
  {
    unint64_t v17 = 0;
    int v18 = dword_10003C000;
    a3.n128_u64[0] = 136316162;
    do
    {
      unsigned int v19 = *(_DWORD *)&v16[4 * v17 + *(unsigned int *)(a2 + 16)];
      unsigned int v20 = -1 << -v16[*(unsigned int *)(a2 + 20) + v17];
      if ((v18 & 0x40000) != 0)
      {
        __n128 v46 = a3;
        BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        a3 = v46;
        a2 = v47;
        if (v21)
        {
          unsigned int v22 = "host";
          if (v17 < *v16) {
            unsigned int v22 = "local";
          }
          *(_DWORD *)buf = v46.n128_u32[0];
          uint32_t v56 = "mDNS_Callback";
          __int16 v57 = 1024;
          int v58 = 2256;
          __int16 v59 = 2080;
          *(void *)int v60 = v22;
          *(_WORD *)&v60[8] = 1024;
          *(_DWORD *)int v61 = bswap32(v19);
          *(_WORD *)&v61[4] = 1024;
          unsigned int v62 = v20;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %s ipv4 %08x, mask %08x\n", buf, 0x28u);
          a3 = v46;
          a2 = v47;
          int v18 = dword_10003C000;
        }
      }
      if (v17 < *v16) {
        *(_DWORD *)(a1 + 10400) = v19;
      }
      *(_DWORD *)(a1 + 10404) = bswap32(v20);
      ++v17;
    }
    while (v17 < *(unsigned __int8 *)(a2 + 13));
  }
  *(_OWORD *)(a1 + 10408) = 0u;
  if (*(unsigned char *)(a2 + 15))
  {
    unint64_t v23 = 0;
    int v24 = dword_10003C000;
    do
    {
      uint64_t v25 = *(unsigned int *)(a2 + 24);
      if ((v24 & 0x40000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = "host";
        if (v23 < *(unsigned __int8 *)(v47 + 14)) {
          int v33 = "local";
        }
        *(_DWORD *)buf = 136315650;
        uint32_t v56 = "mDNS_Callback";
        __int16 v57 = 1024;
        int v58 = 2268;
        __int16 v59 = 2080;
        *(void *)int v60 = v33;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %s ipv6 addr\n", buf, 0x1Cu);
      }
      char v26 = &v16[v25];
      signed int v27 = (char *)buf;
      for (size_t i = 512; i != 464; i -= 3)
      {
        int v30 = *v26++;
        int v29 = v30;
        if (i == 467) {
          uint64_t v31 = 32;
        }
        else {
          uint64_t v31 = 58;
        }
        snprintf(v27, i, "%02x%c", v29, v31);
        v27 += 3;
      }
      a2 = v47;
      if (v23 < *(unsigned __int8 *)(v47 + 14))
      {
        for (uint64_t j = 0; j != 16; j += 4)
          *(_DWORD *)(a1 + 10408 + j) = *(_DWORD *)&v16[v25 + j];
      }
      int v24 = dword_10003C000;
      if ((dword_10003C000 & 0x40000) != 0)
      {
        BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        a2 = v47;
        if (v34)
        {
          *(_DWORD *)int v49 = 136315650;
          __int16 v50 = "mDNS_Callback";
          __int16 v51 = 1024;
          int v52 = 2278;
          __int16 v53 = 2080;
          __int16 v54 = buf;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %s\n", v49, 0x1Cu);
          a2 = v47;
          int v24 = dword_10003C000;
        }
      }
      ++v23;
      v16 += 16;
    }
    while (v23 < *(unsigned __int8 *)(a2 + 15));
  }
  if (e1000_read_nvm_eerd(a1, 0x10u, 1u, &v64[1]))
  {
    if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v56 = "mDNS_Callback";
      __int16 v57 = 1024;
      int v58 = 2292;
      int v35 = "e1000::%s(%d): Could not read word offset 0x10 from EEPROM\n";
      uint32_t v36 = 18;
LABEL_67:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
    }
  }
  else if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint32_t v56 = "mDNS_Callback";
    __int16 v57 = 1024;
    int v58 = 2294;
    __int16 v59 = 1024;
    *(_DWORD *)int v60 = v64[1];
    int v35 = "e1000::%s(%d): Offset to FW: 0x%x\n";
    uint32_t v36 = 24;
    goto LABEL_67;
  }
  if (e1000_read_nvm_eerd(a1, 0x25u, 1u, v64))
  {
    if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v56 = "mDNS_Callback";
      __int16 v57 = 1024;
      int v58 = 2297;
      unsigned int v37 = "e1000::%s(%d): Could not read word offset 0x25 from EEPROM\n";
      uint32_t v38 = 18;
LABEL_70:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v37, buf, v38);
    }
  }
  else if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint32_t v56 = "mDNS_Callback";
    __int16 v57 = 1024;
    int v58 = 2299;
    __int16 v59 = 1024;
    *(_DWORD *)int v60 = v64[0];
    unsigned int v37 = "e1000::%s(%d): Offset to mDNS data: 0x%x\n";
    uint32_t v38 = 24;
    goto LABEL_70;
  }
  if (e1000_read_nvm_eerd(a1, 0x26u, 1u, &v63))
  {
    if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v56 = "mDNS_Callback";
      __int16 v57 = 1024;
      int v58 = 2302;
      unsigned int v39 = "e1000::%s(%d): Could not read word offset 0x26 from EEPROM\n";
      uint32_t v40 = 18;
LABEL_73:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
    }
  }
  else if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint32_t v56 = "mDNS_Callback";
    __int16 v57 = 1024;
    int v58 = 2304;
    __int16 v59 = 1024;
    *(_DWORD *)int v60 = v63;
    unsigned int v39 = "e1000::%s(%d): Max size for mDNS flash data: 0x%x KB\n";
    uint32_t v40 = 24;
    goto LABEL_73;
  }
  if ((dword_10003C000 & 0x100000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12114uLL, (uint32_t *)buf);
    __dmb(1u);
    int v41 = *(_DWORD *)buf;
    *(_DWORD *)buf = 136315650;
    uint32_t v56 = "mDNS_Callback";
    __int16 v57 = 1024;
    int v58 = 2306;
    __int16 v59 = 1024;
    *(_DWORD *)int v60 = v41;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FL_SECU: 0x%x\n", buf, 0x18u);
  }
  operator new[]();
}

void sub_100023E44()
{
}

void sub_1000245F0()
{
}

uint64_t sub_100024850(uint64_t a1, uint32_t a2)
{
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &v7);
  __dmb(1u);
  if ((v7 & 0x40000000) != 0)
  {
    if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v7 = 136315394;
      int v8 = "setupARPOffload";
      __int16 v9 = 1024;
      int v10 = 1322;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): MANC.MPROXYE is set\n", (uint8_t *)&v7, 0x12u);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5840uLL, a2);
    __dmb(2u);
    unsigned int v4 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(v4, 0, 0x5838uLL, &v7);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v4, 0, 0x5838uLL, v7 | 1);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F0CuLL, 0x80000000);
    IODelay(0xFuLL);
    __dmb(2u);
    unint64_t v5 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(v5, 0, 0x100uLL, &v7);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v5, 0, 0x100uLL, v7 | 0x40801E);
    sub_100025738();
  }
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v7 = 136315394;
    int v8 = "setupARPOffload";
    __int16 v9 = 1024;
    int v10 = 1319;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FAILURE: MANC.MPROXYE is not set, firmware does not have proxying capabilities.\n", (uint8_t *)&v7, 0x12u);
  }
  return 3758097130;
}

uint64_t sub_100024B38(uint64_t a1)
{
  __dmb(2u);
  uint64_t v2 = *(IOPCIDevice **)(a1 + 16);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(v2, 0, 0x5590uLL, &readData);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v2, 0, 0x5590uLL, readData | 0x600);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5590uLL, &v4);
  __dmb(1u);
  if ((~v4 & 0x600) != 0) {
    return 3758097130;
  }
  else {
    return 0;
  }
}

uint64_t sub_100024BD0(uint64_t a1, uint32_t *a2)
{
  uint32_t v8 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &v8);
  __dmb(1u);
  if ((v8 & 0x40000000) != 0)
  {
    if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v8 = 136315394;
      __int16 v9 = "setupNSOffload";
      __int16 v10 = 1024;
      int v11 = 1369;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): MANC.MPROXYE is set\n", (uint8_t *)&v8, 0x12u);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5880uLL, *a2);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5884uLL, a2[1]);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5888uLL, a2[2]);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x588CuLL, a2[3]);
    __dmb(2u);
    uint32_t v4 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(v4, 0, 0x5838uLL, &v8);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v4, 0, 0x5838uLL, v8 | 0x10000);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F0CuLL, 0x80000000);
    IODelay(0xFuLL);
    __dmb(2u);
    unint64_t v5 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(v5, 0, 0x100uLL, &v8);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v5, 0, 0x100uLL, v8 | 0x40801E);
    __dmb(2u);
    int v6 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(v6, 0, 0x5F60uLL, &v8);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v6, 0, 0x5F60uLL, v8 | 0x200);
    sub_100025C90();
  }
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v8 = 136315394;
    __int16 v9 = "setupNSOffload";
    __int16 v10 = 1024;
    int v11 = 1366;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FAILURE: MANC.MPROXYE is not set, firmware does not have proxying capabilities.\n", (uint8_t *)&v8, 0x12u);
  }
  return 3758097130;
}

uint64_t sub_100024F38(uint64_t a1)
{
  __dmb(2u);
  uint64_t v2 = *(IOPCIDevice **)(a1 + 16);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(v2, 0, 0x5590uLL, &readData);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v2, 0, 0x5590uLL, readData | 0x1800);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5590uLL, &v4);
  __dmb(1u);
  if ((~v4 & 0x1800) != 0) {
    return 3758097130;
  }
  else {
    return 0;
  }
}

uint64_t sub_100024FD0(uint64_t a1)
{
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5590uLL, &v4);
  __dmb(1u);
  uint32_t v2 = v4 | 7;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5590uLL, v2);
  IODelay(0x2710uLL);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5590uLL, &v4);
  __dmb(1u);
  if ((~v4 & 7) == 0) {
    sub_1000254E8();
  }
  return 3758097130;
}

void sub_100025164(uint64_t a1, int a2, int a3, int a4)
{
  memset(v17, 0, sizeof(v17));
  v16[0] = 28672;
  v16[1] = 0;
  BYTE12(v17[0]) = 8;
  BYTE14(v17[0]) = 69;
  switch(a2)
  {
    case 0:
      LODWORD(v17[0]) = *(_DWORD *)(a1 + 272);
      WORD2(v17[0]) = *(_WORD *)(a1 + 276);
      LOBYTE(v16[0]) = 63;
      BYTE7(v17[1]) = 6;
      char v6 = 0x80;
      BYTE2(v16[0]) = 0x80;
      HIBYTE(v17[2]) = 2;
      uint64_t v7 = 5;
      goto LABEL_10;
    case 1:
      BYTE7(v17[1]) = 17;
      BYTE2(v16[0]) = 0x80;
      __int16 v8 = -27631;
      goto LABEL_8;
    case 2:
      if ((dword_10003C000 & 0x20000) != 0)
      {
        int v11 = a4;
        BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        a4 = v11;
        if (v10)
        {
          uint32_t readData = 136315394;
          int v13 = "i210_setup_ipv4_flex_filter_wakeup";
          __int16 v14 = 1024;
          int v15 = 2876;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): UDP Directed written to Flex Filter\n", (uint8_t *)&readData, 0x12u);
          a4 = v11;
        }
      }
      BYTE7(v17[1]) = 17;
      WORD1(v16[0]) = -16256;
      *(_DWORD *)((char *)&v17[1] + 14) = a4;
      char v6 = 3;
      goto LABEL_9;
    case 3:
      BYTE7(v17[1]) = 6;
      char v6 = 0x80;
      BYTE2(v16[0]) = 0x80;
      BYTE4(v17[2]) = 22;
      BYTE4(v16[0]) = 48;
      uint64_t v7 = 5;
      HIBYTE(v17[2]) = 16;
      goto LABEL_10;
    case 4:
      BYTE7(v17[1]) = 17;
      BYTE2(v16[0]) = 0x80;
      __int16 v8 = -11508;
LABEL_8:
      WORD2(v17[2]) = v8;
      char v6 = 48;
LABEL_9:
      uint64_t v7 = 4;
LABEL_10:
      *(unsigned char *)((unint64_t)v16 | v7) = v6;
      sub_1000279A0(a1, a3, 0x40u, (uint64_t)v17, (uint64_t)v16);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, 2u);
      __dmb(2u);
      __int16 v9 = *(IOPCIDevice **)(a1 + 16);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(v9, 0, 0x5808uLL, &readData);
      __dmb(1u);
      IOPCIDevice::MemoryWrite32(v9, 0, 0x5808uLL, readData | (0x10000 << a3));
      break;
    default:
      return;
  }
}

void sub_1000253BC(uint64_t a1, int a2, char a3)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = 61440;
  uint64_t v9 = 0;
  WORD6(v10) = -8826;
  BYTE14(v10) = 96;
  if (a2 == 6)
  {
    BYTE4(v11) = 6;
    BYTE2(v8) = 19;
    BYTE8(v13) = 22;
    HIBYTE(v8) = 3;
    char v5 = 16;
  }
  else
  {
    if (a2 != 5) {
      return;
    }
    BYTE4(v11) = 6;
    BYTE2(v8) = 19;
    char v5 = 2;
  }
  BYTE3(v14) = v5;
  LOBYTE(v9) = 8;
  sub_1000279A0(a1, a3, 0x80u, (uint64_t)&v10, (uint64_t)&v8);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5800uLL, 2u);
  __dmb(2u);
  char v6 = *(IOPCIDevice **)(a1 + 16);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(v6, 0, 0x5808uLL, &readData);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v6, 0, 0x5808uLL, readData | (0x10000 << a3));
}

void sub_1000254E8()
{
}

void sub_100025738()
{
}

void sub_100025C90()
{
}

uint64_t sub_100025FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = *(unsigned char **)(a2 + 8);
  unsigned int v7 = *v6;
  if (*v6)
  {
    uint64_t v9 = 0;
    char v10 = 0;
    uint64_t v11 = a4 + 64;
    do
    {
      if ((~v7 & 0xC0) != 0)
      {
        uint64_t v15 = *(unsigned int *)(a2 + 4);
        if (*(unsigned __int16 *)(a2 + 24) + v15 + 1 >= *(_DWORD *)a2) {
          return 0;
        }
        *(unsigned char *)(a3 + v15) = v7;
        unsigned int v16 = *(_DWORD *)a2;
        unsigned int v17 = *(_DWORD *)(a2 + 4) + 1;
        *(_DWORD *)(a2 + 4) = v17;
        if (v17 + v7 + *(unsigned __int16 *)(a2 + 24) >= v16) {
          return 0;
        }
        memcpy((void *)(a3 + v17), *(const void **)(a2 + 8), v7);
        *(_DWORD *)(a2 + 4) += v7;
        char v6 = (unsigned char *)(*(void *)(a2 + 8) + v7 + 1);
      }
      else
      {
        int v13 = *(unsigned __int16 *)v6;
        long long v12 = v6 + 1;
        unsigned int v14 = bswap32(v13 & 0xFFFFFF3F);
        if ((v10 & 1) == 0) {
          uint64_t v9 = v12;
        }
        char v6 = (unsigned char *)(v11 + *(_DWORD *)(a4 + 76) + HIWORD(v14));
        char v10 = 1;
      }
      *(void *)(a2 + 8) = v6;
      unsigned int v7 = *v6;
    }
    while (*v6);
    *(unsigned char *)(a3 + (*(_DWORD *)(a2 + 4))++) = 0;
    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
  }
  else
  {
    *(unsigned char *)(a3 + (*(_DWORD *)(a2 + 4))++) = 0;
LABEL_14:
    uint64_t v9 = *(unsigned char **)(a2 + 8);
  }
  *(void *)(a2 + 8) = v9 + 1;
  return 1;
}

uint64_t sub_100026134(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t *a4)
{
  if ((unint64_t)(a2[1] + *((unsigned __int16 *)a2 + 12)) + 10 >= *a2) {
    return 0;
  }
  uint32_t v4 = (uint64_t *)*((void *)a2 + 1);
  __int16 v5 = *((_WORD *)v4 + 4);
  uint64_t v6 = *v4;
  *a4 = v6;
  *((_WORD *)a4 + 4) = v5;
  *((_WORD *)a4 + 1) = WORD1(v6) & 0xFF7F;
  uint64_t v7 = a3 + a2[1];
  uint64_t v8 = *a4;
  *(_WORD *)(v7 + 8) = v5;
  *(void *)uint64_t v7 = v8;
  uint64_t v9 = a2[1];
  a2[1] = v9 + 10;
  *((void *)a2 + 1) += 10;
  *((void *)a2 + 2) = a3 + v9;
  return 1;
}

uint64_t sub_1000261AC(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, unsigned __int16 *a5)
{
  uint64_t v8 = a1;
  uint64_t v9 = *a5;
  if (v9 <= 0x2F)
  {
    if (((1 << v9) & 0x809004269064) != 0)
    {
LABEL_3:
      unsigned int v37 = 0;
      int v10 = 0;
      unint64_t v11 = 0;
      int v12 = 0;
      int v13 = 0;
      LOBYTE(v14) = 0;
      uint64_t v15 = (_WORD *)*((void *)a2 + 1);
      unsigned int v16 = *(unsigned __int8 *)v15;
      uint64_t v38 = a4 + 64;
      do
      {
        if ((~v16 & 0xC0) != 0)
        {
          uint64_t v17 = a2[1];
          if (*((unsigned __int16 *)a2 + 12) + v17 + 1 >= *a2) {
            return 0;
          }
          *(unsigned char *)(a3 + v17) = v16;
          int v18 = (*a5 != 33) | v10;
          unsigned int v20 = *a2;
          uint64_t v19 = a2[1];
          if (!((*a5 != 33) | v10 & 1)) {
            unint64_t v11 = a3 + v19;
          }
          unsigned int v21 = v19 + 1;
          a2[1] = v21;
          if (v21 + v16 + *((unsigned __int16 *)a2 + 12) >= v20) {
            return 0;
          }
          v10 |= v18 ^ 1;
          int v22 = v16 + 1;
          memcpy((void *)(a3 + v21), (const void *)(*((void *)a2 + 1) + 1), v16);
          LODWORD(v23) = a2[1] + v16;
          a2[1] = v23;
          uint64_t v15 = (_WORD *)(*((void *)a2 + 1) + v16 + 1);
          *((void *)a2 + 1) = v15;
          if (v14)
          {
            v12 += v22;
            int v14 = 1;
          }
          else
          {
            v13 += v22;
            if (a5[4] <= (unsigned __int16)v13)
            {
              unint64_t v24 = 0;
              uint64_t v8 = a1;
              goto LABEL_21;
            }
            int v14 = 0;
          }
        }
        else
        {
          if ((v14 & 1) == 0)
          {
            unsigned int v37 = (char *)v15 + 1;
            int v12 = a5[4] - 2;
          }
          uint64_t v15 = (_WORD *)(v38 + *(_DWORD *)(a4 + 76) + (bswap32(*v15 & 0xFF3F) >> 16));
          *((void *)a2 + 1) = v15;
          int v14 = 1;
        }
        unsigned int v16 = *(unsigned __int8 *)v15;
      }
      while (!v14 || *(unsigned char *)v15);
      *(unsigned char *)(a3 + a2[1]) = 0;
      uint64_t v23 = (a2[1] + 1);
      a2[1] = v23;
      unint64_t v24 = a3 + v23;
      if (*a5 != 33) {
        unint64_t v24 = 0;
      }
      *(_WORD *)(*((void *)a2 + 2) + 8) = bswap32(v12 + 1) >> 16;
      uint64_t v8 = a1;
      *((void *)a2 + 1) = v37 + 1;
      goto LABEL_21;
    }
    if (v9 == 33)
    {
      uint64_t v29 = a2[1];
      if (*((unsigned __int16 *)a2 + 12) + v29 + 6 >= *a2) {
        return 0;
      }
      uint64_t v30 = a3 + v29;
      uint64_t v31 = (int *)*((void *)a2 + 1);
      int v32 = *v31;
      *(_WORD *)(v30 + 4) = *((_WORD *)v31 + 2);
      *(_DWORD *)uint64_t v30 = v32;
      a2[1] += 6;
      *((void *)a2 + 1) += 6;
      goto LABEL_3;
    }
  }
  uint64_t v33 = a2[1];
  size_t v34 = a5[4];
  if (v33 + *((unsigned __int16 *)a2 + 12) + v34 >= *a2) {
    return 0;
  }
  memcpy((void *)(a3 + v33), *((const void **)a2 + 1), v34);
  unint64_t v11 = 0;
  unint64_t v24 = 0;
  LODWORD(v23) = a2[1] + a5[4];
  a2[1] = v23;
LABEL_21:
  if (*(unsigned char *)(v8 + 10424)) {
    return 1;
  }
  uint64_t v25 = 1;
  if (v11)
  {
    BOOL v26 = v24 > v11;
    unsigned int v27 = v24 - v11;
    if (v26)
    {
      *(_DWORD *)(v8 + 10552) = v27;
      if (v27 == 7 && *(_DWORD *)(v11 + 1) == 1633906540 && *(_WORD *)(v11 + 5) == 108)
      {
        *(_DWORD *)(v8 + 10552) = 0;
        return 1;
      }
      if (*((unsigned __int16 *)a2 + 12) + v27 + v23 < *a2)
      {
        memcpy((void *)(v8 + 10424), (const void *)v11, v27);
        return 1;
      }
      return 0;
    }
  }
  return v25;
}

uint64_t sub_1000264E8(uint64_t a1, char *a2, uint64_t a3, unsigned int a4)
{
  long long v58 = 0u;
  long long v59 = 0u;
  bzero(a2, a4);
  LODWORD(v58) = a4;
  int v10 = (_DWORD *)(a3 + 64);
  __int16 v9 = *(_WORD *)(a3 + 64);
  __int16 v11 = 4 * v9;
  unsigned __int16 v12 = 4 * v9 + 20;
  WORD4(v59) = v12;
  *((_WORD *)a2 + 3) = v9;
  *((_WORD *)a2 + 6) = 1000;
  *((_WORD *)a2 + 2) = 1;
  *((_DWORD *)a2 + 4) = 65537;
  int v13 = *(_DWORD *)(a1 + 10400);
  int v14 = &dword_10003C000;
  if (v13)
  {
    a2[10] = 1;
    a2[8] = 1;
    *((_DWORD *)a2 + 5) = v13;
    *((_DWORD *)a2 + 6) = *(_DWORD *)(a1 + 10404);
    unsigned __int16 v12 = v11 + 32;
    WORD4(v59) = v11 + 32;
    uint64_t v15 = 28;
  }
  else if ((dword_10003C000 & 0x20000) != 0)
  {
    uint64_t result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      int v49 = "buildRRrecords";
      __int16 v50 = 1024;
      int v51 = 2082;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): buildRRrecords - IPAddress is empty\n", buf, 0x12u);
    }
    uint64_t v15 = 20;
    int v14 = &dword_10003C000;
  }
  else
  {
    uint64_t v15 = 20;
  }
  if (*(_DWORD *)(a1 + 10412) | *(_DWORD *)(a1 + 10408) | *(_DWORD *)(a1 + 10416) | *(_DWORD *)(a1 + 10420))
  {
    for (uint64_t i = 0; i != 16; i += 4)
      *(_DWORD *)&a2[v15 + i] = *(_DWORD *)(a1 + 10408 + i);
    a2[11] = 1;
    a2[9] = 1;
    v15 |= 0x20uLL;
    v12 += 36;
    WORD4(v59) = v12;
  }
  else if ((*((unsigned char *)v14 + 2) & 2) != 0)
  {
    uint64_t result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (result)
    {
      *(_DWORD *)buf = 136315394;
      int v49 = "buildRRrecords";
      __int16 v50 = 1024;
      int v51 = 2103;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): buildRRrecords - Adding NO IPv6 information\n", buf, 0x12u);
    }
    int v14 = &dword_10003C000;
  }
  uint64_t v17 = &a2[v12];
  *(_OWORD *)(a1 + 10520) = 0u;
  *(_OWORD *)(a1 + 10536) = 0u;
  *(_OWORD *)(a1 + 10488) = 0u;
  *(_OWORD *)(a1 + 10504) = 0u;
  *(_OWORD *)(a1 + 10456) = 0u;
  *(_OWORD *)(a1 + 10472) = 0u;
  *(_OWORD *)(a1 + 10424) = 0u;
  *(_OWORD *)(a1 + 10440) = 0u;
  if (!*v10)
  {
    LODWORD(v18) = 0;
LABEL_21:
    if (*(_DWORD *)(a1 + 10552) && *(unsigned char *)(a1 + 10424))
    {
      if (a2[10])
      {
        uint64_t v26 = 0;
        int v46 = WORD4(v59);
        int v27 = DWORD1(v58);
        unint64_t v45 = v58;
        while (1)
        {
          if ((*((unsigned char *)v14 + 2) & 0x10) != 0)
          {
            BOOL v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            int v14 = &dword_10003C000;
            if (v31)
            {
              *(_DWORD *)buf = 136315394;
              int v49 = "buildRRrecords";
              __int16 v50 = 1024;
              int v51 = 2150;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Adding record A\n", buf, 0x12u);
              int v14 = &dword_10003C000;
            }
          }
          ++*((_WORD *)a2 + 3);
          *(_DWORD *)&a2[4 * v18 + 4 * v26 + v15] = v27;
          if ((*((unsigned char *)v14 + 2) & 0x10) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            int v49 = "buildRRrecords";
            __int16 v50 = 1024;
            int v51 = 2155;
            __int16 v52 = 1024;
            int v53 = v18 + v26;
            __int16 v54 = 1024;
            int v55 = v27;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): RR[%d] starting at offset 0x%x\n", buf, 0x1Eu);
          }
          size_t v28 = *(unsigned int *)(a1 + 10552);
          if (v28 + (v27 + v46) + 14 >= v45) {
            return 0;
          }
          memcpy(&v17[v27], (const void *)(a1 + 10424), v28);
          int v14 = &dword_10003C000;
          uint64_t v29 = (*(_DWORD *)(a1 + 10552) + v27);
          uint64_t v56 = 0x7800000001000100;
          unsigned __int16 v57 = 1024;
          uint64_t v30 = &v17[v29];
          *((_WORD *)v30 + 4) = 1024;
          *(void *)uint64_t v30 = 0x7800000001000100;
          *(_DWORD *)&v17[(v29 + 10)] = *(_DWORD *)(a1 + 10400);
          int v27 = v29 + 14;
          if (++v26 >= (unint64_t)a2[10])
          {
            DWORD1(v58) = v29 + 14;
            goto LABEL_35;
          }
        }
      }
      LODWORD(v26) = 0;
LABEL_35:
      if (a2[11])
      {
        unint64_t v32 = 0;
        uint64_t v47 = (v26 + v18);
        int v44 = WORD4(v59);
        int v33 = DWORD1(v58);
        unint64_t v43 = v58;
        while (1)
        {
          int v34 = v33;
          if ((*((unsigned char *)v14 + 2) & 0x10) != 0)
          {
            BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            int v14 = &dword_10003C000;
            if (v41)
            {
              *(_DWORD *)buf = 136315394;
              int v49 = "buildRRrecords";
              __int16 v50 = 1024;
              int v51 = 2189;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Adding record AAAA\n", buf, 0x12u);
              int v14 = &dword_10003C000;
            }
          }
          ++*((_WORD *)a2 + 3);
          *(_DWORD *)&a2[4 * v32 + 4 * v47 + v15] = v34;
          if ((*((unsigned char *)v14 + 2) & 0x10) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            int v49 = "buildRRrecords";
            __int16 v50 = 1024;
            int v51 = 2193;
            __int16 v52 = 1024;
            int v53 = v32 + v47;
            __int16 v54 = 1024;
            int v55 = v34;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): RR[%d] starting at offset 0x%x\n", buf, 0x1Eu);
          }
          size_t v35 = *(unsigned int *)(a1 + 10552);
          if (v35 + (v34 + v44) + 26 >= v43) {
            return 0;
          }
          memcpy(&v17[v34], (const void *)(a1 + 10424), v35);
          uint64_t v36 = 0;
          int v37 = *(_DWORD *)(a1 + 10552);
          uint64_t v38 = (v37 + v34);
          uint64_t v56 = 0x7800000001001C00;
          unsigned __int16 v57 = 4096;
          unsigned int v39 = &v17[v38];
          *((_WORD *)v39 + 4) = 4096;
          *(void *)unsigned int v39 = 0x7800000001001C00;
          int v40 = v38 + 10;
          do
          {
            *(_DWORD *)&v17[(v40 + v36)] = *(_DWORD *)(a1 + 10408 + v36);
            v36 += 4;
          }
          while (v36 != 16);
          ++v32;
          int v33 = v40 + 16;
          int v14 = &dword_10003C000;
          if (v32 >= a2[11])
          {
            __int16 v42 = v34 + v37 + 26;
            DWORD1(v58) = v34 + v37 + 26;
            goto LABEL_50;
          }
        }
      }
      __int16 v42 = WORD2(v58);
LABEL_50:
      *(_WORD *)a2 = v42;
    }
    return DWORD1(v58) + WORD4(v59);
  }
  unint64_t v18 = 0;
  uint64_t v19 = v15;
  unsigned int v20 = &a2[v15];
  while (1)
  {
    *((void *)&v58 + 1) = (char *)v10 + *(unsigned int *)(a3 + *(unsigned int *)(a3 + 72) + 4 * v18 + 64);
    int v21 = DWORD1(v58);
    *(_DWORD *)&v20[4 * v18] = DWORD1(v58);
    if ((*((unsigned char *)v14 + 2) & 0x10) != 0)
    {
      uint64_t result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (result)
      {
        *(_DWORD *)buf = 136315906;
        int v49 = "buildRRrecords";
        __int16 v50 = 1024;
        int v51 = 2120;
        __int16 v52 = 1024;
        int v53 = v18;
        __int16 v54 = 1024;
        int v55 = v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): RR[%d] starting at offset 0x%x\n", buf, 0x1Eu);
      }
    }
    uint64_t result = sub_100025FF0(result, (uint64_t)&v58, (uint64_t)v17, a3);
    if (!result) {
      return result;
    }
    uint64_t v22 = DWORD1(v58);
    if ((unint64_t)(DWORD1(v58) + WORD4(v59)) + 10 >= v58) {
      return 0;
    }
    uint64_t v23 = *((void *)&v58 + 1);
    uint64_t v24 = **((void **)&v58 + 1);
    uint64_t v56 = v24;
    unsigned __int16 v57 = *(_WORD *)(*((void *)&v58 + 1) + 8);
    WORD1(v56) = WORD1(v24) & 0xFF7F;
    uint64_t v25 = &v17[DWORD1(v58)];
    *((_WORD *)v25 + 4) = v57;
    *(void *)uint64_t v25 = v56;
    DWORD1(v58) = v22 + 10;
    *((void *)&v58 + 1) = v23 + 10;
    *(void *)&long long v59 = &v17[v22];
    LOWORD(v56) = bswap32(v24) >> 16;
    WORD1(v56) = bswap32(WORD1(v24) & 0xFF7F) >> 16;
    HIDWORD(v56) = bswap32(HIDWORD(v56));
    unsigned __int16 v57 = bswap32(v57) >> 16;
    uint64_t result = sub_1000261AC(a1, (int *)&v58, (uint64_t)v17, a3, (unsigned __int16 *)&v56);
    if (!result) {
      return result;
    }
    ++v18;
    int v14 = &dword_10003C000;
    if (v18 >= *v10)
    {
      uint64_t v15 = v19;
      goto LABEL_21;
    }
  }
}

uint64_t FLASH_Write(uint64_t a1, uint32_t *a2, uint32_t data, int a4)
{
  BOOL v16 = 0;
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    int v13 = "FLASH_Write";
    __int16 v14 = 1024;
    int v15 = 2479;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Starting FLASH_Write()\n", (uint8_t *)&v12, 0x12u);
  }
  if (data > 0x100) {
    return 1;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12050uLL, data);
  if (sub_100026E90(a1, 0x1000000, a4)) {
    return 1;
  }
  uint32_t v9 = (data >> 2) + 1;
  do
  {
    if (!v9) {
      return 11;
    }
    uint32_t v10 = *a2;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1204CuLL, v10);
    if (sub_100026F00(a1, &v16)) {
      return 1;
    }
    ++a2;
    --v9;
  }
  while (!v16);
  if ((dword_10003C000 & 0x20000) == 0) {
    return 0;
  }
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v11)
  {
    int v12 = 136315394;
    int v13 = "FLASH_Write";
    __int16 v14 = 1024;
    int v15 = 2521;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FLASH_Write() completed successfully\n", (uint8_t *)&v12, 0x12u);
    return 0;
  }
  return result;
}

BOOL sub_100026E90(uint64_t a1, int a2, int a3)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, a3 | a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &readData);
  __dmb(1u);
  return ((readData >> 28) & 1) == 0;
}

uint64_t sub_100026F00(uint64_t a1, BOOL *a2)
{
  if (a2) {
    *a2 = 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &readData);
  BOOL v4 = 0;
  __dmb(1u);
  if ((readData & 0x60000000) == 0x40000000)
  {
LABEL_8:
    if (a2)
    {
      uint32_t v7 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &v7);
      __dmb(1u);
      *a2 = (v7 & 0x80000000) != 0;
    }
  }
  else
  {
    int v5 = 0;
    while (v5 != 999999)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &readData);
      __dmb(1u);
      ++v5;
      if ((readData & 0x60000000) == 0x40000000)
      {
        BOOL v4 = (v5 - 1) > 0xF423E;
        goto LABEL_8;
      }
    }
    return 1;
  }
  return v4;
}

uint64_t FLASH_Read(uint64_t a1, _DWORD *a2, uint32_t data, int a4)
{
  BOOL v15 = 0;
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v11 = 136315394;
    int v12 = "FLASH_Read";
    __int16 v13 = 1024;
    int v14 = 2534;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Starting FLASH_Read()\n", (uint8_t *)&v11, 0x12u);
  }
  if (data >> 13) {
    return 1;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12050uLL, data);
  if (sub_100026E90(a1, 0, a4)) {
    return 1;
  }
  uint32_t v9 = (data >> 2) + 1;
  do
  {
    if (!v9) {
      return 11;
    }
    if (sub_100026F00(a1, &v15)) {
      return 1;
    }
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1204CuLL, &v11);
    __dmb(1u);
    *a2++ = v11;
    --v9;
  }
  while (!v15);
  if ((dword_10003C000 & 0x20000) == 0) {
    return 0;
  }
  BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v10)
  {
    uint32_t v11 = 136315394;
    int v12 = "FLASH_Read";
    __int16 v13 = 1024;
    int v14 = 2577;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FLASH_Read() completed successfully\n", (uint8_t *)&v11, 0x12u);
    return 0;
  }
  return result;
}

BOOL flasher_need_to_erase_sector(const unsigned __int8 *a1, const unsigned __int8 *a2)
{
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    BOOL v10 = "flasher_need_to_erase_sector";
    __int16 v11 = 1024;
    int v12 = 2617;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Starting flasher_need_to_erase_sector()\n", (uint8_t *)&v9, 0x12u);
  }
  BOOL v4 = a2 + 4;
  do
  {
    int v5 = *(_DWORD *)a1;
    a1 += 4;
    int v6 = *((_DWORD *)v4 - 1) & ~v5;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v4 >= a2 + 4096;
    }
    v4 += 4;
  }
  while (!v7);
  return v6 != 0;
}

uint64_t flasher_dump_sector(uint64_t a1, const unsigned __int8 *a2, int a3)
{
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v20 = "flasher_dump_sector";
    __int16 v21 = 1024;
    int v22 = 2679;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Calling flasher_read_sector()\n", buf, 0x12u);
  }
  unint64_t v7 = 0;
  do
  {
    if (FLASH_Read(a1, &buf[v7], 0x100u, a3 + (int)v7))
    {
      if ((dword_10003C000 & 0x20000) == 0) {
        return 3;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315650;
        size_t v28 = "flasher_read_sector";
        __int16 v29 = 1024;
        int v30 = 2640;
        __int16 v31 = 1024;
        int v32 = v7 + a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ERROR:Can't read flash at 0x%X\n", (uint8_t *)&v27, 0x18u);
        if ((dword_10003C000 & 0x20000) == 0) {
          return 3;
        }
      }
      uint64_t v10 = 3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315650;
        size_t v28 = "flasher_dump_sector";
        __int16 v29 = 1024;
        int v30 = 2683;
        __int16 v31 = 1024;
        int v32 = 3;
        BOOL v16 = "e1000::%s(%d): ERROR: Calling flasher_read_sector() returned %d\n";
        goto LABEL_56;
      }
      return v10;
    }
    BOOL v8 = v7 > 0xEFF;
    v7 += 256;
  }
  while (!v8);
  int v18 = a3;
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315650;
    size_t v28 = "flasher_read_sector";
    __int16 v29 = 1024;
    int v30 = 2645;
    __int16 v31 = 1024;
    int v32 = buf[0];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): flasher_read_sector() read successfully %x\n", (uint8_t *)&v27, 0x18u);
  }
  int v9 = buf;
  if (flasher_need_to_erase_sector(buf, a2))
  {
    if (sub_100026E90(a1, 0x2000000, a3) || sub_100026F00(a1, 0))
    {
      if ((dword_10003C000 & 0x20000) == 0) {
        return 1;
      }
      uint64_t v10 = 1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315906;
        size_t v28 = "flasher_dump_sector";
        __int16 v29 = 1024;
        int v30 = 2691;
        __int16 v31 = 1024;
        int v32 = a3;
        __int16 v33 = 1024;
        int v34 = 1;
        BOOL v16 = "e1000::%s(%d): ERROR:Couldn't erase sector at 0x%X function returned %d\n";
        uint32_t v17 = 30;
        goto LABEL_57;
      }
      return v10;
    }
    if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315394;
      size_t v28 = "FLASH_EraseSector";
      __int16 v29 = 1024;
      int v30 = 2666;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): FLASH_EraseSector() completed successfully\n", (uint8_t *)&v27, 0x12u);
    }
    int v9 = (uint8_t *)&unk_10003C030;
  }
  for (unint64_t i = 0; ; i += 256)
  {
    if (!memcmp(&a2[i], &v9[i], 0x100uLL))
    {
      if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315394;
        size_t v28 = "flasher_dump_sector";
        __int16 v29 = 1024;
        int v30 = 2710;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Data same, moving to next burst\n", (uint8_t *)&v27, 0x12u);
      }
      goto LABEL_26;
    }
    if ((dword_10003C000 & 0x20000) == 0)
    {
      int v12 = a3 + i;
      goto LABEL_20;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315650;
      size_t v28 = "flasher_dump_sector";
      __int16 v29 = 1024;
      int v30 = 2702;
      __int16 v31 = 1024;
      int v32 = i;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Need to write offset %x, data is different\n", (uint8_t *)&v27, 0x18u);
      int v12 = i + v18;
      if ((dword_10003C000 & 0x20000) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      int v12 = a3 + i;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      uint64_t v24 = "flasher_dump_burst";
      __int16 v25 = 1024;
      int v26 = 2587;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): Starting flasher_dump_burst()\n", (uint8_t *)&v23, 0x12u);
    }
LABEL_20:
    uint64_t v13 = FLASH_Write(a1, (uint32_t *)&a2[i], 0x100u, v12);
    if (v13)
    {
      uint64_t v10 = v13;
      goto LABEL_42;
    }
    if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      uint64_t v24 = "flasher_dump_burst";
      __int16 v25 = 1024;
      int v26 = 2596;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): VERYFYING:\nCalling FLASH_Read()\n", (uint8_t *)&v23, 0x12u);
    }
    if (FLASH_Read(a1, &v27, 0x100u, v12))
    {
      uint64_t v10 = 3;
      goto LABEL_42;
    }
    if (memcmp(&v27, &a2[i], 0x100uLL)) {
      break;
    }
LABEL_26:
    if (i >= 0xF00) {
      return 0;
    }
  }
  uint64_t v10 = 4;
LABEL_42:
  if ((dword_10003C000 & 0x20000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315650;
    size_t v28 = "flasher_dump_sector";
    __int16 v29 = 1024;
    int v30 = 2706;
    __int16 v31 = 1024;
    int v32 = v10;
    BOOL v16 = "e1000::%s(%d): ERROR: Calling flasher_dump_burst() returned %d\n";
LABEL_56:
    uint32_t v17 = 24;
LABEL_57:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, v17);
  }
  return v10;
}

void sub_1000279A0(uint64_t a1, int a2, uint32_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8 = 0;
  int v38 = a2 << 8;
  int v42 = (a2 << 8) + 36864;
  int v43 = (a2 << 8) + 38400;
  int v40 = (a2 << 8) + 36872;
  int v41 = (a2 << 8) + 38408;
  v9.i32[1] = 8;
LABEL_2:
  uint64_t v10 = 0;
  int v45 = 2 * v8;
  char v11 = 1;
  do
  {
    while (1)
    {
      v9.i32[0] = *(_DWORD *)(a4 + (v10 | v8));
      char v12 = v11;
      int8x16_t v13 = (int8x16_t)vshlq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v9)), (uint32x4_t)xmmword_100034180);
      int8x8_t v14 = vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
      uint32_t v15 = v14.i32[0] | v14.i32[1];
      __dmb(2u);
      BOOL v16 = *(IOPCIDevice **)(a1 + 16);
      if (a2 <= 3) {
        break;
      }
      int v21 = (v43 + 2 * v8) | v10;
      if (v21 <= 10511)
      {
        if (v21 > 10255)
        {
          if (v21 > 10495)
          {
            int v22 = 10496;
            if (v21 != 10496)
            {
              if (v21 != 10500) {
                goto LABEL_98;
              }
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              int v21 = 10500;
              int v24 = 316;
              goto LABEL_74;
            }
            BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
            int v21 = 312;
            goto LABEL_96;
          }
          int v22 = 10256;
          if (v21 == 10256)
          {
            BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
            int v21 = 288;
            goto LABEL_96;
          }
          if (v21 != 10272) {
            goto LABEL_98;
          }
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          int v21 = 10272;
          int v24 = 264;
        }
        else
        {
          if (v21 > 10239)
          {
            int v22 = 10240;
            if (v21 != 10240)
            {
              if (v21 != 10244) {
                goto LABEL_98;
              }
              BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
              int v21 = 10244;
              int v24 = 276;
              goto LABEL_74;
            }
            BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
            int v21 = 272;
            goto LABEL_96;
          }
          int v22 = 8544;
          if (v21 == 8544)
          {
            BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
            int v21 = 360;
            goto LABEL_96;
          }
          if (v21 != 9232) {
            goto LABEL_98;
          }
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          int v21 = 9232;
          int v24 = 0x8000;
        }
LABEL_74:
        if (v23) {
          int v21 = v24;
        }
        goto LABEL_98;
      }
      if (v21 <= 14351)
      {
        if (v21 > 14335)
        {
          int v22 = 14336;
          if (v21 != 14336)
          {
            if (v21 != 14340) {
              goto LABEL_98;
            }
            BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
            int v21 = 14340;
            int v24 = 1060;
            goto LABEL_74;
          }
          BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
          int v21 = 1056;
          goto LABEL_96;
        }
        int v22 = 10512;
        if (v21 == 10512)
        {
          BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
          int v21 = 328;
          goto LABEL_96;
        }
        if (v21 != 13328) {
          goto LABEL_98;
        }
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        int v21 = 13328;
        int v24 = 32784;
        goto LABEL_74;
      }
      if (v21 <= 20991)
      {
        int v22 = 14352;
        if (v21 != 14352)
        {
          if (v21 != 14368) {
            goto LABEL_98;
          }
          BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
          int v21 = 14368;
          int v24 = 1088;
          goto LABEL_74;
        }
        BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
        int v21 = 1072;
LABEL_96:
        if (!v26) {
          int v21 = v22;
        }
        goto LABEL_98;
      }
      if (v21 == 20992)
      {
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        int v21 = 20992;
        int v24 = 512;
        goto LABEL_74;
      }
      int v22 = 22016;
      if (v21 == 22016)
      {
        BOOL v26 = *(_DWORD *)(a1 + 284) <= 1;
        int v21 = 1536;
        goto LABEL_96;
      }
      if (v21 == 21504)
      {
        BOOL v23 = *(_DWORD *)(a1 + 284) <= 1;
        int v21 = 21504;
        int v24 = 64;
        goto LABEL_74;
      }
LABEL_98:
      IOPCIDevice::MemoryWrite32(v16, 0, v21, v15);
      char v11 = 0;
      uint64_t v10 = 4;
      if ((v12 & 1) == 0)
      {
        __dmb(2u);
        int v27 = v41 + v45;
        if (v41 + v45 <= 10503)
        {
          if (v27 > 10247)
          {
            int v28 = 10248;
            if (v27 != 10248)
            {
              if (v27 == 10264)
              {
                BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
                int v27 = 10264;
                int v30 = 296;
                goto LABEL_132;
              }
              goto LABEL_148;
            }
            BOOL v35 = *(_DWORD *)(a1 + 284) <= 1;
            int v27 = 280;
          }
          else
          {
            int v28 = 8552;
            if (v27 != 8552)
            {
              if (v27 == 9240)
              {
                BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
                int v27 = 9240;
                int v30 = 32776;
                goto LABEL_132;
              }
LABEL_148:
              IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v27, *(unsigned __int8 *)(a5 + (v8 >> 3)));
              if (v8 >= 0x78)
              {
                __dmb(2u);
                int v37 = 38652;
                goto LABEL_156;
              }
LABEL_154:
              v8 += 8;
              goto LABEL_2;
            }
            BOOL v35 = *(_DWORD *)(a1 + 284) <= 1;
            int v27 = 352;
          }
        }
        else if (v27 <= 13335)
        {
          int v28 = 10504;
          if (v27 != 10504)
          {
            if (v27 == 10520)
            {
              BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
              int v27 = 10520;
              int v30 = 336;
              goto LABEL_132;
            }
            goto LABEL_148;
          }
          BOOL v35 = *(_DWORD *)(a1 + 284) <= 1;
          int v27 = 320;
        }
        else
        {
          if (v27 == 13336)
          {
            BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
            int v27 = 13336;
            int v30 = 32792;
            goto LABEL_132;
          }
          int v28 = 14344;
          if (v27 != 14344)
          {
            if (v27 == 14360)
            {
              BOOL v29 = *(_DWORD *)(a1 + 284) <= 1;
              int v27 = 14360;
              int v30 = 1080;
LABEL_132:
              if (v29) {
                int v27 = v30;
              }
            }
            goto LABEL_148;
          }
          BOOL v35 = *(_DWORD *)(a1 + 284) <= 1;
          int v27 = 1064;
        }
        if (!v35) {
          int v27 = v28;
        }
        goto LABEL_148;
      }
    }
    int v17 = (v42 + 2 * v8) | v10;
    if (v17 <= 10511)
    {
      if (v17 > 10255)
      {
        if (v17 > 10495)
        {
          int v18 = 10496;
          if (v17 != 10496)
          {
            if (v17 != 10500) {
              goto LABEL_93;
            }
            BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
            int v17 = 10500;
            int v20 = 316;
            goto LABEL_69;
          }
          BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 312;
        }
        else
        {
          int v18 = 10256;
          if (v17 != 10256)
          {
            if (v17 != 10272) {
              goto LABEL_93;
            }
            BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
            int v17 = 10272;
            int v20 = 264;
            goto LABEL_69;
          }
          BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 288;
        }
      }
      else if (v17 > 10239)
      {
        int v18 = 10240;
        if (v17 != 10240)
        {
          if (v17 != 10244) {
            goto LABEL_93;
          }
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 10244;
          int v20 = 276;
          goto LABEL_69;
        }
        BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 272;
      }
      else
      {
        int v18 = 8544;
        if (v17 != 8544)
        {
          if (v17 != 9232) {
            goto LABEL_93;
          }
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 9232;
          int v20 = 0x8000;
          goto LABEL_69;
        }
        BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 360;
      }
    }
    else if (v17 <= 14351)
    {
      if (v17 > 14335)
      {
        int v18 = 14336;
        if (v17 != 14336)
        {
          if (v17 != 14340) {
            goto LABEL_93;
          }
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 14340;
          int v20 = 1060;
          goto LABEL_69;
        }
        BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 1056;
      }
      else
      {
        int v18 = 10512;
        if (v17 != 10512)
        {
          if (v17 != 13328) {
            goto LABEL_93;
          }
          BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
          int v17 = 13328;
          int v20 = 32784;
          goto LABEL_69;
        }
        BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 328;
      }
    }
    else if (v17 <= 20991)
    {
      int v18 = 14352;
      if (v17 != 14352)
      {
        if (v17 != 14368) {
          goto LABEL_93;
        }
        BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 14368;
        int v20 = 1088;
        goto LABEL_69;
      }
      BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
      int v17 = 1072;
    }
    else
    {
      if (v17 == 20992)
      {
        BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 20992;
        int v20 = 512;
LABEL_69:
        if (v19) {
          int v17 = v20;
        }
        goto LABEL_93;
      }
      int v18 = 22016;
      if (v17 != 22016)
      {
        if (v17 != 21504) {
          goto LABEL_93;
        }
        BOOL v19 = *(_DWORD *)(a1 + 284) <= 1;
        int v17 = 21504;
        int v20 = 64;
        goto LABEL_69;
      }
      BOOL v25 = *(_DWORD *)(a1 + 284) <= 1;
      int v17 = 1536;
    }
    if (!v25) {
      int v17 = v18;
    }
LABEL_93:
    IOPCIDevice::MemoryWrite32(v16, 0, v17, v15);
    char v11 = 0;
    uint64_t v10 = 4;
  }
  while ((v12 & 1) != 0);
  __dmb(2u);
  int v31 = v40 + v45;
  if (v40 + v45 > 10503)
  {
    if (v31 <= 13335)
    {
      int v32 = 10504;
      if (v31 != 10504)
      {
        if (v31 == 10520)
        {
          BOOL v33 = *(_DWORD *)(a1 + 284) <= 1;
          int v31 = 10520;
          int v34 = 336;
          goto LABEL_137;
        }
        goto LABEL_153;
      }
      BOOL v36 = *(_DWORD *)(a1 + 284) <= 1;
      int v31 = 320;
    }
    else
    {
      if (v31 == 13336)
      {
        BOOL v33 = *(_DWORD *)(a1 + 284) <= 1;
        int v31 = 13336;
        int v34 = 32792;
        goto LABEL_137;
      }
      int v32 = 14344;
      if (v31 != 14344)
      {
        if (v31 == 14360)
        {
          BOOL v33 = *(_DWORD *)(a1 + 284) <= 1;
          int v31 = 14360;
          int v34 = 1080;
LABEL_137:
          if (v33) {
            int v31 = v34;
          }
        }
        goto LABEL_153;
      }
      BOOL v36 = *(_DWORD *)(a1 + 284) <= 1;
      int v31 = 1064;
    }
LABEL_151:
    if (!v36) {
      int v31 = v32;
    }
    goto LABEL_153;
  }
  if (v31 > 10247)
  {
    int v32 = 10248;
    if (v31 != 10248)
    {
      if (v31 == 10264)
      {
        BOOL v33 = *(_DWORD *)(a1 + 284) <= 1;
        int v31 = 10264;
        int v34 = 296;
        goto LABEL_137;
      }
      goto LABEL_153;
    }
    BOOL v36 = *(_DWORD *)(a1 + 284) <= 1;
    int v31 = 280;
    goto LABEL_151;
  }
  int v32 = 8552;
  if (v31 == 8552)
  {
    BOOL v36 = *(_DWORD *)(a1 + 284) <= 1;
    int v31 = 352;
    goto LABEL_151;
  }
  if (v31 == 9240)
  {
    BOOL v33 = *(_DWORD *)(a1 + 284) <= 1;
    int v31 = 9240;
    int v34 = 32776;
    goto LABEL_137;
  }
LABEL_153:
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v31, *(unsigned __int8 *)(a5 + (v8 >> 3)));
  if (v8 <= 0x77) {
    goto LABEL_154;
  }
  __dmb(2u);
  int v37 = 37116;
LABEL_156:
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (v38 + v37), a3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
}

uint64_t DriverKit_AppleEthernetE1000::init(IOUserNetworkEthernet *this)
{
  IOParseBootArgNumber("e1000.log_level", &dword_10003C000, 4);
  uint64_t result = IOMallocZeroTyped();
  if (result)
  {
    this[1].IOService::OSObject::OSMetaClassBase::__vftable = (IOUserNetworkEthernet_vtbl *)result;
    if (IOUserNetworkEthernet::init(this))
    {
      return 1;
    }
    else
    {
      uint64_t result = (uint64_t)this[1].IOService::OSObject::OSMetaClassBase::__vftable;
      if (result)
      {
        IOFree((void *)result, 0x2B58uLL);
        uint64_t result = 0;
        this[1].IOService::OSObject::OSMetaClassBase::__vftable = 0;
      }
    }
  }
  return result;
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetE1000::init(DriverKit_AppleEthernetE1000 *this)
{
  return DriverKit_AppleEthernetE1000::init((IOUserNetworkEthernet *)((char *)this - 24));
}

void DriverKit_AppleEthernetE1000::free(IOUserNetworkEthernet *this)
{
  uint32_t v2 = this[1].IOService::OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 0x2B58uLL);
    this[1].IOService::OSObject::OSMetaClassBase::__vftable = 0;
  }
  IOUserNetworkEthernet::free(this);
}

void non-virtual thunk to'DriverKit_AppleEthernetE1000::free(DriverKit_AppleEthernetE1000 *this)
{
}

uint64_t DriverKit_AppleEthernetE1000::Start_Impl(DriverKit_AppleEthernetE1000 *this, IOService *anObject)
{
  if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint32_t readData = 136315650;
    uint32_t v15 = "Start_Impl";
    __int16 v16 = 1024;
    int v17 = 23;
    __int16 v18 = 2048;
    BOOL v19 = this;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %p\n", readData, 0x1Cu);
  }
  BOOL v4 = (IOService *)OSMetaClassBase::safeMetaCast(anObject, gIOPCIDeviceMetaClass);
  if (!v4) {
    sub_100033634();
  }
  int v5 = (IOPCIDevice *)v4;
  *(void *)(*((void *)this + 8) + 9600) = this;
  *(void *)(*((void *)this + 8) + 9608) = v4;
  uint64_t v6 = sub_10001EB3C(*((void *)this + 8), v4);
  if (!v6)
  {
    if (IOService::Start((IOService *)this, anObject, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch)) {
      sub_10003389C();
    }
    if (OSObject::CopyDispatchQueue((OSObject *)this, "Default", (IODispatchQueue **)(*((void *)this + 8) + 9616), 0))
    {
      sub_100033870();
    }
    if (IODispatchQueue::Create("interrupt", 0, 0, (IODispatchQueue **)(*((void *)this + 8) + 9624))) {
      sub_100033844();
    }
    if (OSObject::SetDispatchQueue((OSObject *)this, "interrupt", *(IODispatchQueue **)(*((void *)this + 8) + 9624), 0))
    {
      sub_100033818();
    }
    action = 0;
    uint64_t interruptType = 0;
    int v11 = 0;
    IOParseBootArgNumber("e1000.fi0", &v11, 4);
    e1000_set_mac_type(*((void *)this + 8));
    if (*(int *)(*((void *)this + 8) + 284) >= 29 && v11 != 2)
    {
      if (!v11) {
        IOPCIDevice::ConfigureInterrupts(v5, 0x20000u, 2u, 2u, 0, 0);
      }
      IOPCIDevice::ConfigureInterrupts(v5, 0x10000u, 1u, 1u, 0, 0);
    }
    IOPCIDevice::ConfigureInterrupts(v5, 1u, 1u, 1u, 0, 0);
    int v7 = 0;
    uint32_t v8 = 0;
    while (!IOInterruptDispatchSource::GetInterruptType(v5, v8, &interruptType))
    {
      if ((interruptType & 0x30000) != 0)
      {
        if (IOInterruptDispatchSource::Create(v5, v8, *(IODispatchQueue **)(*((void *)this + 8) + 9624), (IOInterruptDispatchSource **)(*((void *)this + 8) + 8 * v7 + 9632)))
        {
          sub_1000337EC();
        }
        if (v7)
        {
          if (DriverKit_AppleEthernetE1000::CreateActionQueueInterruptOccurred((OSObject *)this, 8uLL, &action))sub_1000337C0(); {
        }
          }
        else if (DriverKit_AppleEthernetE1000::CreateActionInterruptOccurred((OSObject *)this, 8uLL, &action))
        {
          sub_100033794();
        }
        if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 8) + 8 * v7 + 9632), action, 0))
        {
          sub_100033768();
        }
        if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 8) + 8 * v7 + 9632), 1, 0)) {
          sub_10003373C();
        }
        if (v11) {
          break;
        }
        ++v7;
      }
      ++v8;
      if (v7 >= 2) {
        break;
      }
    }
    uint64_t v9 = *((void *)this + 8);
    if (!*(void *)(v9 + 9632))
    {
      if (IOInterruptDispatchSource::Create(v5, 0, *(IODispatchQueue **)(v9 + 9624), (IOInterruptDispatchSource **)(v9 + 9632)))
      {
        sub_100033710();
      }
      if (DriverKit_AppleEthernetE1000::CreateActionInterruptOccurred((OSObject *)this, 8uLL, &action)) {
        sub_1000336E4();
      }
      if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 8) + 9632), action, 0))
      {
        sub_1000336B8();
      }
      if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 8) + 9632), 1, 0)) {
        sub_10003368C();
      }
      uint64_t v9 = *((void *)this + 8);
    }
    if (!*(void *)(v9 + 9640)
      && (dword_10003C000 & 1) != 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint32_t readData = 136315394;
      uint32_t v15 = "Start_Impl";
      __int16 v16 = 1024;
      int v17 = 74;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): using one irq.\n", readData, 0x12u);
    }
    if (IOPCIDevice::Open(v5, (IOService *)this, 0)) {
      sub_100033660();
    }
    readData[0] = 0;
    IOPCIDevice::ConfigurationRead8(v5, 4uLL, readData);
    IOPCIDevice::ConfigurationWrite8(v5, 4uLL, readData[0] | 2);
    uint64_t v6 = sub_10001EE58(*((void *)this + 8));
    if (v6
      || (uint64_t v6 = sub_10002B9E4(*((void *)this + 8)), v6)
      || (uint64_t v6 = IOService::RegisterService((IOService *)this, 0), v6))
    {
      IOService::Stop((IOService *)this, v5, 0);
    }
  }
  return v6;
}

uint64_t DriverKit_AppleEthernetE1000::Stop_Impl(DriverKit_AppleEthernetE1000 *this, IOService *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*((void *)this + 8) + 10392);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "Stop_Impl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 91;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = this;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): %p ivars->intrsEnabled=%d\n", buf, 0x22u);
  }
  uint64_t v5 = *((void *)this + 8);
  if (*(unsigned char *)(v5 + 10392)) {
    sub_1000338C8();
  }
  if (!*(unsigned char *)(v5 + 11092))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2000000000;
    if (*(void *)(v5 + 9640)) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
    *(_DWORD *)&buf[24] = v6;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 1107296256;
    handler[2] = sub_1000289A4;
    handler[3] = &unk_100038EC8;
    handler[4] = buf;
    handler[5] = this;
    handler[6] = a2;
    IODispatchSource::Cancel(*(IODispatchSource **)(v5 + 9632), handler, 0);
    uint64_t v7 = *((void *)this + 8);
    uint32_t v8 = *(IODispatchSource **)(v7 + 9640);
    if (v8)
    {
      IODispatchSource::Cancel(v8, handler, 0);
      uint64_t v7 = *((void *)this + 8);
    }
    *(unsigned char *)(v7 + 11092) = 1;
    _Block_object_dispose(buf, 8);
  }
  return 0;
}

uint64_t sub_1000289A4(uint64_t result)
{
  int v1 = *(IOService **)(result + 40);
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(result + 32) + 8) + 24), 0xFFFFFFFF, memory_order_relaxed) <= 1)
  {
    uint64_t v2 = result;
    (*((void (**)(OSMetaClass_vtbl *))v1[1].meta[301].getMetaClass + 2))(v1[1].meta[301].__vftable);
    meta = v1[1].meta;
    uint64_t v4 = *(void *)&meta[301].refcount;
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
      *(void *)&v1[1].meta[301].refcount = 0;
      meta = v1[1].meta;
    }
    (*(void (**)(OSMetaClassPrivate *))(*(void *)meta[300].metaClassPrivate + 16))(meta[300].metaClassPrivate);
    IOPCIDevice::Close(*(IOPCIDevice **)&v1[1].meta[300].refcount, v1, 0);
    uint64_t v5 = *(IOService **)(v2 + 48);
    return IOService::Stop(v1, v5, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
  }
  return result;
}

void sub_100028ABC(uint64_t a1, uint64_t a2)
{
}

void sub_100028ACC(uint64_t a1)
{
}

void DriverKit_AppleEthernetE1000::InterruptOccurred_Impl(DriverKit_AppleEthernetE1000 *this, OSAction *a2)
{
  uint64_t v2 = *((void *)this + 8);
  if (*(void *)(v2 + 9640)) {
    sub_10002C714(v2);
  }
  else {
    sub_10002C5CC(v2);
  }
}

void DriverKit_AppleEthernetE1000::QueueInterruptOccurred_Impl(DriverKit_AppleEthernetE1000 *this, OSAction *a2)
{
}

uint64_t DriverKit_AppleEthernetE1000::SetInterfaceEnable_Impl(DriverKit_AppleEthernetE1000 *this, int a2)
{
  if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "disable";
    *(void *)&uint8_t buf[4] = "SetInterfaceEnable_Impl";
    *(_DWORD *)buf = 136315650;
    if (a2) {
      uint64_t v7 = "enable";
    }
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==(%s)\n", buf, 0x1Cu);
  }
  uint8_t readData = 0;
  IOPCIDevice::ConfigurationRead8(*(IOPCIDevice **)(*((void *)this + 8) + 9608), 4uLL, &readData);
  if (a2) {
    IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 8) + 9608), 4uLL, readData | 4);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2000000000;
  *(_DWORD *)&buf[24] = -1;
  uint64_t v4 = *(IODispatchQueue **)(*((void *)this + 8) + 9624);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_100028D40;
  block[4] = buf;
  block[5] = this;
  char v16 = a2;
  block[3] = &unk_100038EF8;
  IODispatchQueue::DispatchSync(v4, block);
  if (!a2 || *(_DWORD *)(*(void *)&buf[8] + 24)) {
    IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 8) + 9608), 4uLL, readData & 0xFB);
  }
  if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)(*(void *)&buf[8] + 24);
    int v9 = 136315650;
    uint64_t v10 = "SetInterfaceEnable_Impl";
    __int16 v11 = 1024;
    int v12 = 156;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==>0x%08x\n", (uint8_t *)&v9, 0x18u);
  }
  uint64_t v5 = *(unsigned int *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v5;
}

uint64_t sub_100028D40(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(unsigned char *)(result + 48))
  {
    uint64_t result = sub_10002C424(*(IOUserNetworkPacketQueue ***)(v2 + 64));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24)) {
    uint64_t result = sub_10002C52C(*(IOUserNetworkPacketQueue ***)(v2 + 64));
  }
  if (!*(unsigned char *)(v1 + 48)) {
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t DriverKit_AppleEthernetE1000::SetPromiscuousModeEnable_Impl(DriverKit_AppleEthernetE1000 *this, int a2)
{
  return sub_1000214B8(*((void *)this + 8), a2);
}

uint64_t DriverKit_AppleEthernetE1000::SetAllMulticastModeEnable_Impl(DriverKit_AppleEthernetE1000 *this, int a2)
{
  if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "disable";
    uint64_t v7 = "SetAllMulticastModeEnable_Impl";
    int v6 = 136315650;
    if (a2) {
      uint64_t v5 = "enable";
    }
    __int16 v8 = 1024;
    int v9 = 169;
    __int16 v10 = 2080;
    __int16 v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): - %s\n", (uint8_t *)&v6, 0x1Cu);
  }
  return sub_1000215AC(*((void *)this + 8), a2);
}

uint64_t DriverKit_AppleEthernetE1000::setMulticastAddresses(DriverKit_AppleEthernetE1000 *this, const ether_addr *a2, int a3)
{
  return sub_100021824(*((void *)this + 8), a2->octet, a3);
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetE1000::setMulticastAddresses(DriverKit_AppleEthernetE1000 *this, const ether_addr *a2, int a3)
{
  return sub_100021824(*((void *)this + 2), a2->octet, a3);
}

uint64_t DriverKit_AppleEthernetE1000::SelectMediaType_Impl(DriverKit_AppleEthernetE1000 *this, int a2)
{
  if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "SelectMediaType_Impl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 182;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): type=0x%08x\n", buf, 0x18u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2000000000;
  int v10 = 0;
  uint64_t v4 = *(IODispatchQueue **)(*((void *)this + 8) + 9624);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_100028FE0;
  block[4] = buf;
  block[5] = this;
  block[3] = &unk_100038F28;
  int v8 = a2;
  IODispatchQueue::DispatchSync(v4, block);
  uint64_t v5 = *(unsigned int *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v5;
}

uint64_t sub_100028FE0(uint64_t a1)
{
  uint64_t result = sub_100007CB8(*(void *)(*(void *)(a1 + 40) + 64), *(_DWORD *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void DriverKit_AppleEthernetE1000::TxSubmit_Impl(DriverKit_AppleEthernetE1000 *this, OSAction *a2)
{
  uint64_t v2 = *((void *)this + 8);
  if (!*(unsigned char *)(v2 + 10392)) {
    sub_1000338F4();
  }
  sub_100008014(v2, 0);
}

void DriverKit_AppleEthernetE1000::RxSubmit_Impl(DriverKit_AppleEthernetE1000 *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(unsigned char *)(v3 + 10392))
  {
    if (*(int *)(v3 + 284) < 13) {
      unsigned int v4 = sub_100005BBC(v3);
    }
    else {
      unsigned int v4 = sub_1000058E8(v3, 0);
    }
    if (v4 >= 0x10000)
    {
      uint64_t v5 = *(IODataQueueDispatchSource **)(*((void *)this + 8) + 10360);
      IODataQueueDispatchSource::SendDataAvailable(v5);
    }
  }
  else if ((dword_10003C000 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "RxSubmit_Impl";
    __int16 v8 = 1024;
    int v9 = 199;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): called with intrsEnabled == false\n", (uint8_t *)&v6, 0x12u);
  }
}

uint64_t DriverKit_AppleEthernetE1000::GetMaxTransferUnit_Impl(DriverKit_AppleEthernetE1000 *this, unsigned int *a2)
{
  *a2 = 9000;
  return 0;
}

uint64_t DriverKit_AppleEthernetE1000::GetHardwareAssists_Impl(DriverKit_AppleEthernetE1000 *this, unsigned int *a2)
{
  if (*(unsigned char *)(*((void *)this + 8) + 10393)) {
    unsigned int v2 = 201457664;
  }
  else {
    unsigned int v2 = 0x20000;
  }
  *a2 = v2;
  return 0;
}

uint64_t DriverKit_AppleEthernetE1000::hwConfigNicProxyData(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 10)) {
    sub_100022670(*(void *)(result + 64), a2);
  }
  return result;
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetE1000::hwConfigNicProxyData(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 10)) {
    sub_100022670(*(void *)(result + 16), a2);
  }
  return result;
}

uint64_t e1000_init_mac_params(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 40);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_init_nvm_params(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1144);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_init_phy_params(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 888);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_init_mbx_params(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1264);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_set_mac_type(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int16 *)(a1 + 9584);
  uint64_t v2 = 4294967291;
  if (v1 > 0x125A)
  {
    if (*(unsigned __int16 *)(a1 + 9584) <= 0x159Fu)
    {
      switch(*(_WORD *)(a1 + 9584))
      {
        case 0x1501:
LABEL_42:
          int v3 = 19;
          goto LABEL_70;
        case 0x1502:
        case 0x1503:
          int v3 = 23;
          goto LABEL_70;
        case 0x1504:
        case 0x1505:
        case 0x1506:
        case 0x1507:
        case 0x1508:
        case 0x1509:
        case 0x150B:
        case 0x1512:
        case 0x1513:
        case 0x1514:
        case 0x1515:
        case 0x1517:
        case 0x1519:
        case 0x151A:
        case 0x151B:
        case 0x151C:
        case 0x151D:
        case 0x151E:
        case 0x151F:
        case 0x1520:
        case 0x1528:
        case 0x1529:
        case 0x152A:
        case 0x152B:
        case 0x152C:
        case 0x152D:
        case 0x152E:
        case 0x152F:
        case 0x1530:
        case 0x1531:
        case 0x1532:
        case 0x153C:
        case 0x153D:
        case 0x153E:
        case 0x153F:
        case 0x1540:
        case 0x1541:
        case 0x1542:
        case 0x1543:
        case 0x1544:
        case 0x1545:
          return v2;
        case 0x150A:
        case 0x150D:
        case 0x1518:
        case 0x1526:
LABEL_40:
          int v3 = 30;
          goto LABEL_70;
        case 0x150C:
          int v3 = 17;
          goto LABEL_70;
        case 0x150E:
        case 0x150F:
        case 0x1510:
        case 0x1511:
        case 0x1516:
        case 0x1527:
          goto LABEL_33;
        case 0x1521:
        case 0x1522:
        case 0x1523:
        case 0x1524:
        case 0x1546:
          int v3 = 32;
          goto LABEL_70;
        case 0x1525:
LABEL_62:
          int v3 = 21;
          goto LABEL_70;
        case 0x1533:
        case 0x1534:
        case 0x1535:
        case 0x1536:
        case 0x1537:
        case 0x1538:
          goto LABEL_38;
        case 0x1539:
          int v3 = 35;
          goto LABEL_70;
        case 0x153A:
        case 0x153B:
          goto LABEL_39;
        default:
          char v8 = v1 - 89;
          if (v1 - 5465 > 0x23) {
            goto LABEL_49;
          }
          if (((1 << v8) & 3) != 0)
          {
LABEL_39:
            int v3 = 24;
            goto LABEL_70;
          }
          if (((1 << v8) & 0xC00000) != 0) {
            goto LABEL_69;
          }
          if (((1 << v8) & 0xC00000000) != 0)
          {
LABEL_38:
            int v3 = 34;
            goto LABEL_70;
          }
LABEL_49:
          if (v1 - 4699 < 5) {
            goto LABEL_50;
          }
          return v2;
      }
    }
    if (*(unsigned __int16 *)(a1 + 9584) <= 0x1A1Du)
    {
      switch(*(_WORD *)(a1 + 9584))
      {
        case 0x15D6:
        case 0x15D7:
        case 0x15D8:
        case 0x15E3:
          goto LABEL_69;
        case 0x15D9:
        case 0x15DA:
        case 0x15DB:
        case 0x15DC:
        case 0x15DD:
        case 0x15DE:
        case 0x15E4:
        case 0x15E5:
        case 0x15E6:
        case 0x15E7:
        case 0x15E8:
        case 0x15E9:
        case 0x15EA:
        case 0x15EB:
        case 0x15EC:
        case 0x15ED:
        case 0x15EE:
        case 0x15EF:
        case 0x15F0:
        case 0x15F1:
          return v2;
        case 0x15DF:
        case 0x15E0:
        case 0x15E1:
        case 0x15E2:
          goto LABEL_32;
        case 0x15F2:
        case 0x15F3:
        case 0x15F7:
        case 0x15F8:
        case 0x15FD:
          goto LABEL_50;
        case 0x15F4:
        case 0x15F5:
        case 0x15F9:
        case 0x15FA:
        case 0x15FB:
        case 0x15FC:
          goto LABEL_68;
        case 0x15F6:
          goto LABEL_38;
        default:
          char v7 = v1 + 96;
          if (v1 - 5536 > 0x1E) {
            goto LABEL_60;
          }
          if (((1 << v7) & 0xF) != 0) {
            goto LABEL_39;
          }
          if (((1 << v7) & 0x78000000) != 0) {
            goto LABEL_32;
          }
          if (((1 << v7) & 0x3800000) != 0) {
            goto LABEL_69;
          }
LABEL_60:
          if (v1 - 6684 >= 2) {
            return v2;
          }
          int v3 = 28;
          break;
      }
      goto LABEL_70;
    }
    if (*(unsigned __int16 *)(a1 + 9584) > 0x294Bu)
    {
      if (v1 - 12544 >= 3 && v1 - 21762 >= 2)
      {
        if (v1 != 10572) {
          return v2;
        }
LABEL_4:
        int v3 = 20;
      }
      else
      {
LABEL_50:
        int v3 = 36;
      }
      goto LABEL_70;
    }
    if (v1 - 8000 > 5 || ((1 << (v1 - 64)) & 0x23) == 0)
    {
      if (v1 - 6686 >= 2) {
        return v2;
      }
LABEL_68:
      int v3 = 27;
    }
    else
    {
      int v3 = 33;
    }
LABEL_70:
    uint64_t v2 = 0;
    *(_DWORD *)(a1 + 284) = v3;
    return v2;
  }
  if (*(unsigned __int16 *)(a1 + 9584) > 0x1048u)
  {
    switch(*(_WORD *)(a1 + 9584))
    {
      case 0x1075:
        int v3 = 12;
        goto LABEL_70;
      case 0x1076:
      case 0x1077:
      case 0x1078:
      case 0x107C:
        int v3 = 10;
        goto LABEL_70;
      case 0x1079:
      case 0x107A:
      case 0x107B:
      case 0x108A:
      case 0x1099:
      case 0x10B5:
        int v3 = 8;
        goto LABEL_70;
      case 0x107D:
      case 0x107E:
      case 0x107F:
      case 0x10B9:
        int v3 = 14;
        goto LABEL_70;
      case 0x1080:
      case 0x1081:
      case 0x1082:
      case 0x1083:
      case 0x1084:
      case 0x1085:
      case 0x1086:
      case 0x1087:
      case 0x1088:
      case 0x1089:
      case 0x108D:
      case 0x108E:
      case 0x108F:
      case 0x1090:
      case 0x1091:
      case 0x1092:
      case 0x1093:
      case 0x1094:
      case 0x1095:
      case 0x1097:
      case 0x109B:
      case 0x109C:
      case 0x109D:
      case 0x109E:
      case 0x109F:
      case 0x10A0:
      case 0x10A1:
      case 0x10A2:
      case 0x10A3:
      case 0x10A6:
      case 0x10A8:
      case 0x10AA:
      case 0x10AB:
      case 0x10AC:
      case 0x10AD:
      case 0x10AE:
      case 0x10AF:
      case 0x10B0:
      case 0x10B1:
      case 0x10B2:
      case 0x10B3:
      case 0x10B4:
      case 0x10B6:
      case 0x10B7:
      case 0x10B8:
      case 0x10BE:
      case 0x10C1:
      case 0x10C6:
      case 0x10C7:
      case 0x10C8:
      case 0x10CA:
      case 0x10CF:
      case 0x10D0:
      case 0x10D1:
      case 0x10D2:
      case 0x10D4:
      case 0x10D7:
      case 0x10D8:
      case 0x10DB:
      case 0x10DC:
      case 0x10DD:
      case 0x10E0:
      case 0x10E1:
      case 0x10E2:
      case 0x10E3:
      case 0x10E4:
      case 0x10E9:
      case 0x10EC:
      case 0x10ED:
      case 0x10EE:
      case 0x10F1:
      case 0x10F2:
      case 0x10F3:
      case 0x10F4:
        return v2;
      case 0x108B:
      case 0x108C:
      case 0x109A:
        int v3 = 15;
        goto LABEL_70;
      case 0x1096:
      case 0x1098:
      case 0x10BA:
      case 0x10BB:
        int v3 = 18;
        goto LABEL_70;
      case 0x10A4:
      case 0x10A5:
      case 0x10BC:
      case 0x10D5:
      case 0x10D9:
      case 0x10DA:
        goto LABEL_64;
      case 0x10A7:
      case 0x10A9:
      case 0x10D6:
        int v3 = 29;
        goto LABEL_70;
      case 0x10BD:
      case 0x10BF:
      case 0x10C0:
      case 0x10C2:
      case 0x10C3:
      case 0x10CB:
      case 0x10CC:
      case 0x10CD:
      case 0x10CE:
      case 0x10E5:
      case 0x10F5:
        goto LABEL_4;
      case 0x10C4:
      case 0x10C5:
        goto LABEL_42;
      case 0x10C9:
      case 0x10E6:
      case 0x10E7:
      case 0x10E8:
        goto LABEL_40;
      case 0x10D3:
      case 0x10F6:
        int v3 = 16;
        goto LABEL_70;
      case 0x10DE:
      case 0x10DF:
        goto LABEL_62;
      case 0x10EA:
      case 0x10EB:
      case 0x10EF:
      case 0x10F0:
        int v3 = 22;
        goto LABEL_70;
      default:
        if (v1 - 4169 < 5) {
          goto LABEL_42;
        }
        if (v1 - 4190 >= 3) {
          return v2;
        }
LABEL_64:
        int v3 = 13;
        break;
    }
    goto LABEL_70;
  }
  if (*(unsigned __int16 *)(a1 + 9584) <= 0xD54u)
  {
    if (v1 - 1080 > 8 || ((1 << (v1 - 56)) & 0x115) == 0)
    {
      if (v1 - 3404 < 4)
      {
LABEL_32:
        int v3 = 26;
      }
      else
      {
        if (v1 != 3411) {
          return v2;
        }
LABEL_69:
        int v3 = 25;
      }
    }
    else
    {
LABEL_33:
      int v3 = 31;
    }
    goto LABEL_70;
  }
  unsigned int v4 = v1 - 4096;
  int v3 = 1;
  switch(v4)
  {
    case 0u:
      goto LABEL_70;
    case 1u:
    case 4u:
      int v3 = 2;
      goto LABEL_70;
    case 8u:
    case 9u:
    case 0xCu:
    case 0xDu:
      int v3 = 3;
      goto LABEL_70;
    case 0xEu:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x1Eu:
      int v3 = 4;
      goto LABEL_70;
    case 0xFu:
    case 0x11u:
      int v3 = 5;
      goto LABEL_70;
    case 0x10u:
    case 0x12u:
    case 0x1Du:
      int v3 = 7;
      goto LABEL_70;
    case 0x13u:
    case 0x14u:
    case 0x18u:
      int v3 = 9;
      goto LABEL_70;
    case 0x19u:
    case 0x1Au:
      int v3 = 11;
      goto LABEL_70;
    case 0x26u:
    case 0x27u:
    case 0x28u:
      int v3 = 6;
      goto LABEL_70;
    default:
      return v2;
  }
  return v2;
}

uint64_t e1000_setup_init_funcs(uint64_t a1, int a2)
{
  uint64_t result = e1000_set_mac_type(a1);
  if (!result)
  {
    if (!*(void *)(a1 + 16)) {
      return 4294967293;
    }
    e1000_init_mac_ops_generic((void *)a1);
    e1000_init_phy_ops_generic((void *)a1);
    e1000_init_nvm_ops_generic((void *)a1);
    e1000_init_mbx_ops_generic((void *)a1);
    switch(*(_DWORD *)(a1 + 284))
    {
      case 1:
        e1000_init_function_pointers_82542((void *)a1);
        break;
      case 2:
      case 3:
        e1000_init_function_pointers_82543((void *)a1);
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        e1000_init_function_pointers_82540((void *)a1);
        break;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
        e1000_init_function_pointers_82541((void *)a1);
        break;
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x10:
      case 0x11:
        e1000_init_function_pointers_82571((void *)a1);
        break;
      case 0x12:
        e1000_init_function_pointers_80003es2lan((void *)a1);
        break;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x16:
      case 0x17:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
      case 0x1C:
        e1000_init_function_pointers_ich8lan(a1);
        break;
      case 0x1D:
      case 0x1E:
      case 0x1F:
      case 0x20:
      case 0x21:
        e1000_init_function_pointers_82575((void *)a1);
        break;
      case 0x22:
      case 0x23:
        e1000_init_function_pointers_i210((void *)a1);
        break;
      case 0x24:
        e1000_init_function_pointers_i225((void *)a1);
        break;
      default:
        return 4294967293;
    }
    if (!a2) {
      return 0;
    }
    uint64_t v5 = *(uint64_t (**)(uint64_t))(a1 + 40);
    if (!v5) {
      return 4294967293;
    }
    uint64_t result = v5(a1);
    if (result) {
      return result;
    }
    int v6 = *(uint64_t (**)(uint64_t))(a1 + 1144);
    if (!v6) {
      return 4294967293;
    }
    uint64_t result = v6(a1);
    if (result) {
      return result;
    }
    char v7 = *(uint64_t (**)(uint64_t))(a1 + 888);
    if (!v7) {
      return 4294967293;
    }
    uint64_t result = v7(a1);
    if (result) {
      return result;
    }
    char v8 = *(uint64_t (**)(uint64_t))(a1 + 1264);
    if (!v8) {
      return 4294967293;
    }
    return v8(a1);
  }
  return result;
}

uint64_t e1000_get_bus_info(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 104);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_clear_vfta(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 96);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_write_vfta(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 216);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_update_mc_addr_list(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 144);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_check_for_link(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 72);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_check_mng_mode(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 64);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_reset_hw(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 152);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_init_hw(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 160);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_setup_link(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 192);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_get_speed_and_duplex(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 120);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_setup_led(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 208);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_cleanup_led(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 80);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_blink_led(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_id_led_init(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 48);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_led_on(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 128);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_led_off(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 136);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_config_collision_dist(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 224);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_rar_set(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 232);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_validate_mdi_setting(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 248);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_check_reset_block(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 920);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_read_phy_reg(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 976);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_write_phy_reg(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1032);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_release_phy(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 1000);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_acquire_phy(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 896);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_cfg_on_link_up(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 904);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_get_cable_length(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 952);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_get_phy_info(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 960);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_phy_hw_reset(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1008);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_phy_commit(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 928);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_set_d0_lplu_state(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1016);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_set_d3_lplu_state(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1024);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_read_mac_addr(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 240);
  if (v1) {
    return v1();
  }
  else {
    return e1000_read_mac_addr_generic(a1);
  }
}

uint64_t e1000_validate_nvm_checksum(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1200);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_update_nvm_checksum(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1184);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_reload_nvm(uint64_t result)
{
  unsigned int v1 = *(uint64_t (**)(void))(result + 1176);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_read_nvm(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1160);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_write_nvm(uint64_t a1)
{
  unsigned int v1 = *(uint64_t (**)(void))(a1 + 1208);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t e1000_power_up_phy(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(uint64_t (**)(uint64_t))(result + 1056);
  if (v2) {
    uint64_t result = v2(result);
  }
  int v3 = *(uint64_t (**)(uint64_t))(v1 + 192);
  if (v3)
  {
    return v3(v1);
  }
  return result;
}

uint64_t e1000_power_down_phy(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 1064);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_power_up_fiber_serdes_link(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 184);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_shutdown_fiber_serdes_link(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 176);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t e1000_set_eee(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 168);
  if (v1) {
    return v1();
  }
  else {
    return 4294967293;
  }
}

uint64_t e1000_acquire_swfw_sync_i225(uint64_t a1, int a2)
{
  int v4 = a2 | (a2 << 16);
  int v5 = 200;
  while (1)
  {
    if (sub_10002A120(a1)) {
      return 4294967283;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
    __dmb(1u);
    if (readData == -1) {
      return 4294967283;
    }
    if ((readData & v4) == 0) {
      break;
    }
    e1000_put_hw_semaphore_generic(a1);
    IODelay(0x1388uLL);
    if (!--v5) {
      return 4294967283;
    }
  }
  uint32_t v7 = readData | a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v7);
  return 0;
}

uint64_t sub_10002A120(uint64_t a1)
{
  int v2 = 2000;
  while (1)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, 2u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &readData);
    __dmb(1u);
    if (readData == -1) {
      return 0xFFFFFFFFLL;
    }
    if ((readData & 2) != 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v2)
    {
      e1000_put_hw_semaphore_generic(a1);
      return 0xFFFFFFFFLL;
    }
  }
  return 0;
}

void e1000_release_swfw_sync_i225(uint64_t a1, int a2)
{
  if (!sub_10002A120(a1))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData & ~a2;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B5CuLL, v4);
    e1000_put_hw_semaphore_generic(a1);
  }
}

uint64_t e1000_setup_copper_link_i225(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &v5);
  __dmb(1u);
  uint32_t v3 = v5 & 0xFFFFFFDF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v3);
  return e1000_setup_copper_link_generic(a1);
}

uint64_t e1000_read_nvm_srrd_i225(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v8 = 0;
  while (!(*(unsigned int (**)(uint64_t))(a1 + 1152))(a1))
  {
    unsigned __int16 v9 = a3 - v8;
    if ((int)(a3 - v8) >= 512) {
      unsigned __int16 v9 = 512;
    }
    uint64_t nvm_eerd = e1000_read_nvm_eerd(a1, a2, v9, (_WORD *)(a4 + 2 * v8));
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
    if (nvm_eerd) {
      return nvm_eerd;
    }
    unsigned int v8 = (unsigned __int16)(v8 + 512);
    if (v8 >= a3) {
      return 0;
    }
  }
  return 13;
}

uint64_t e1000_write_nvm_srwr_i225(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  unsigned int v8 = 0;
  while (1)
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1152))(a1)) {
      return 13;
    }
    unsigned __int16 v9 = a3 - v8;
    if ((int)(a3 - v8) >= 512) {
      unsigned __int16 v9 = 512;
    }
    int v10 = sub_10002A454(a1, a2, v9, a4 + 2 * v8);
    (*(void (**)(uint64_t))(a1 + 1168))(a1);
    if (v10) {
      break;
    }
    unsigned int v8 = (unsigned __int16)(v8 + 512);
    if (v8 >= a3) {
      return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10002A454(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1232);
  BOOL v5 = v4 >= a2;
  int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v6 >= (int)a3)
  {
    uint64_t v10 = 0;
    uint64_t v12 = a3;
    do
    {
      uint32_t v13 = (4 * (v10 + a2)) | (*(unsigned __int16 *)(a4 + 2 * v10) << 16) | 1;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12018uLL, v13);
      int v14 = 100000;
      while (1)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12018uLL, &readData);
        __dmb(1u);
        if ((readData & 2) != 0) {
          break;
        }
        IODelay(5uLL);
        if (!--v14) {
          return 0xFFFFFFFFLL;
        }
      }
      uint64_t result = 0;
      ++v10;
    }
    while (v10 != v12);
  }
  return result;
}

uint64_t e1000_validate_nvm_checksum_i225(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(a1 + 1152))()) {
    return 13;
  }
  uint64_t v3 = *(void *)(a1 + 1160);
  *(void *)(a1 + 1160) = e1000_read_nvm_eerd;
  uint64_t v4 = e1000_validate_nvm_checksum_generic(a1);
  *(void *)(a1 + 1160) = v3;
  (*(void (**)(uint64_t))(a1 + 1168))(a1);
  return v4;
}

uint64_t e1000_update_nvm_checksum_i225(uint64_t a1)
{
  __int16 v9 = 0;
  uint64_t v2 = e1000_read_nvm_eerd(a1, 0, 1u, &v9);
  if (!v2)
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 1152))(a1))
    {
      return 13;
    }
    else
    {
      unsigned __int16 v3 = 0;
      __int16 v4 = 0;
      do
      {
        unsigned int v5 = v3;
        uint64_t v6 = e1000_read_nvm_eerd(a1, v3, 1u, &v9);
        if (v6)
        {
          uint64_t v2 = v6;
          (*(void (**)(uint64_t))(a1 + 1168))(a1);
          return v2;
        }
        v4 += v9;
        ++v3;
      }
      while (v5 < 0x3E);
      __int16 v10 = -17734 - v4;
      int v7 = sub_10002A454(a1, 0x3Fu, 1u, (uint64_t)&v10);
      (*(void (**)(uint64_t))(a1 + 1168))(a1);
      if (v7) {
        return 0xFFFFFFFFLL;
      }
      else {
        return e1000_update_flash_i225(a1);
      }
    }
  }
  return v2;
}

uint64_t e1000_update_flash_i225(uint64_t a1)
{
  LOWORD(data) = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12114uLL, &readData);
  __dmb(1u);
  char v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  if ((readData & 0x8000) != 0)
  {
    uint64_t result = sub_1000064D4(a1);
    if (result != -1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      uint32_t v8 = readData | 0x800000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v8);
      return sub_1000064D4(a1);
    }
  }
  else if ((v2 & 4) != 0)
  {
    return 0;
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData;
    uint32_t v4 = (readData >> 13) & 0x1000;
    uint64_t result = e1000_write_erase_flash_command_i225(a1, 0x2000000, v4);
    if (result)
    {
      int v6 = 0;
      for (int i = ((v3 >> 25) & 1) << 13; ; i += 2)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12050uLL, 2u);
        uint64_t result = e1000_write_erase_flash_command_i225(a1, 0x1000000, i);
        if (result) {
          break;
        }
        uint64_t result = e1000_read_nvm_eerd(a1, (unsigned __int16)(v4 + v6), 1u, &data);
        if (result) {
          break;
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1204CuLL, (unsigned __int16)data);
        uint64_t result = e1000_poll_eerd_eewr_done(a1, 0);
        if (result) {
          break;
        }
        IODelay(0x3E8uLL);
        if (++v6 == 2048) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t e1000_get_flash_presence_i225(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  return (readData >> 19) & 1;
}

uint64_t e1000_set_flsw_flash_burst_counter_i225(uint64_t a1, uint32_t data)
{
  if (data > 0xFFF) {
    return 16;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12050uLL, data);
  return 0;
}

uint64_t e1000_write_erase_flash_command_i225(uint64_t a1, int a2, int a3)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &readData);
  __dmb(1u);
  if ((readData & 0x40000000) == 0)
  {
    int v6 = -999;
    do
    {
      int v7 = v6;
      IODelay(5uLL);
      uint32_t v10 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &v10);
      __dmb(1u);
      if (!v7) {
        break;
      }
      int v6 = v7 + 1;
    }
    while ((v10 & 0x40000000) == 0);
    if (!v7) {
      return 0xFFFFFFFFLL;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, a3 | a2);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x12048uLL, &v9);
  __dmb(1u);
  return ~HIBYTE(v9) & 0x10;
}

void *e1000_init_function_pointers_i225(void *a1)
{
  e1000_init_mac_ops_generic(a1);
  e1000_init_phy_ops_generic(a1);
  uint64_t result = e1000_init_nvm_ops_generic(a1);
  a1[5] = sub_10002AA70;
  a1[143] = sub_10002AB94;
  a1[111] = sub_10002AD30;
  return result;
}

uint64_t sub_10002AA70(uint64_t a1)
{
  *(_DWORD *)(a1 + 1116) = 1;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 16;
  *(void *)(a1 + 168) = e1000_set_eee_i225;
  *(void *)(a1 + 152) = sub_10002B1C0;
  *(void *)(a1 + 160) = e1000_init_hw_i225;
  *(void *)(a1 + 192) = e1000_setup_link_generic;
  *(void *)(a1 + 72) = e1000_check_for_copper_link_generic;
  *(void *)(a1 + 120) = e1000_get_speed_and_duplex_copper_generic;
  *(void *)(a1 + 256) = e1000_acquire_swfw_sync_i225;
  *(void *)(a1 + 264) = e1000_release_swfw_sync_i225;
  *(unsigned char *)(a1 + 1378) = 1;
  *(void *)(a1 + 200) = e1000_setup_copper_link_i225;
  *(unsigned char *)(a1 + 850) = 1;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  return 0;
}

uint64_t sub_10002AB94(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  uint32_t v3 = (readData >> 11) & 0xF;
  if (v3 >= 9) {
    uint32_t v3 = 9;
  }
  uint32_t v4 = v3 + 6;
  *(_WORD *)(a1 + 1232) = 1 << v4;
  *(_WORD *)(a1 + 1238) = 8;
  *(_WORD *)(a1 + 1234) = 1;
  *(_DWORD *)(a1 + 1216) = 2;
  BOOL v5 = (v2 & 0x400) == 0;
  if ((v2 & 0x400) != 0) {
    __int16 v6 = 32;
  }
  else {
    __int16 v6 = 8;
  }
  *(_WORD *)(a1 + 1240) = v6;
  if (v5) {
    __int16 v7 = 8;
  }
  else {
    __int16 v7 = 16;
  }
  *(_WORD *)(a1 + 1236) = v7;
  if (v4 == 15) {
    *(_WORD *)(a1 + 1240) = 128;
  }
  *(void *)(a1 + 1152) = sub_10002B2D4;
  *(void *)(a1 + 1168) = sub_10002B2DC;
  *(void *)(a1 + 1192) = sub_10002B2E4;
  uint32_t v14 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &v14);
  __dmb(1u);
  uint32_t v8 = e1000_null_ops_generic;
  uint32_t v9 = e1000_null_write_nvm;
  if ((v14 & 0x80000) != 0)
  {
    *(void *)(a1 + 1160) = e1000_read_nvm_srrd_i225;
    __int16 v11 = e1000_update_nvm_checksum_i225;
    uint32_t v8 = e1000_validate_nvm_checksum_i225;
    uint32_t v9 = e1000_write_nvm_srwr_i225;
    int v10 = 4;
  }
  else
  {
    int v10 = 1;
    __int16 v11 = e1000_null_ops_generic;
  }
  *(_DWORD *)(a1 + 1216) = v10;
  *(void *)(a1 + 1208) = v9;
  *(void *)(a1 + 1200) = v8;
  *(void *)(a1 + 1184) = v11;
  return 0;
}

uint64_t sub_10002AD30(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) == 1)
  {
    *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
    *(void *)(a1 + 1064) = e1000_power_down_phy_copper_base;
    *(_WORD *)(a1 + 1122) = 175;
    *(_DWORD *)(a1 + 1108) = 100;
    *(void *)(a1 + 896) = e1000_acquire_phy_base;
    *(void *)(a1 + 920) = e1000_check_reset_block_generic;
    *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
    *(void *)(a1 + 1000) = e1000_release_phy_base;
    *(void *)(a1 + 1008) = e1000_phy_hw_reset_generic;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData;
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1008))(a1);
    if (!result)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v2);
      *(void *)(a1 + 976) = e1000_read_phy_reg_gpy;
      *(void *)(a1 + 1032) = e1000_write_phy_reg_gpy;
      uint64_t result = e1000_get_phy_id(a1);
      unsigned int v4 = *(_DWORD *)(a1 + 1104) & 0xFFFFFC00;
      *(_DWORD *)(a1 + 1104) = v4;
      if (v4 == 1741282304)
      {
        *(_DWORD *)(a1 + 1072) = 16;
        *(void *)(a1 + 1016) = e1000_set_d0_lplu_state_i225;
        *(void *)(a1 + 1024) = e1000_set_d3_lplu_state_i225;
      }
      else
      {
        return 4294967294;
      }
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1072) = 1;
  }
  return result;
}

uint64_t e1000_init_hw_i225(uint64_t a1)
{
  *(void *)(a1 + 944) = sub_10002AEF8;
  return e1000_init_hw_base(a1);
}

uint64_t sub_10002AEF8(uint64_t a1)
{
  int v2 = -100;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1010uLL, &readData);
    __dmb(1u);
    if ((readData & 0x40000) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
  }
  while (!__CFADD__(v2++, 1));
  return 0;
}

uint64_t e1000_set_d0_lplu_state_i225(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xFFFFF7BF;
  if (a2) {
    int v5 = 2112;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v4 | v5);
  return 0;
}

uint64_t e1000_set_d3_lplu_state_i225(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xFFFFEDF7;
  if (a2) {
    int v5 = 4616;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE14uLL, v4 | v5);
  return 0;
}

uint64_t e1000_set_eee_i225(uint64_t a1, int a2, int a3, int a4)
{
  if (*(_DWORD *)(a1 + 284) == 36 && *(_DWORD *)(a1 + 1116) == 1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, &readData);
    __dmb(1u);
    uint32_t v8 = readData;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, &readData);
    __dmb(1u);
    uint32_t v9 = readData;
    if (*(unsigned char *)(a1 + 1377))
    {
      uint32_t v10 = v8 & 0xFFFFFFE3;
      uint32_t v11 = readData & 0xFFF8FFFF;
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE34uLL, &readData);
      __dmb(1u);
      if (a4) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
      if (a3) {
        int v13 = 8;
      }
      else {
        int v13 = 0;
      }
      if (a2) {
        int v14 = 16;
      }
      else {
        int v14 = 0;
      }
      uint32_t v10 = v13 | v14 | v12 | v8 & 0xFFFFFFE3;
      uint32_t v11 = v9 | 0x70000;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, v10);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, v11);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE38uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE30uLL, &readData);
    __dmb(1u);
  }
  return 0;
}

uint64_t sub_10002B1C0(uint64_t a1)
{
  e1000_disable_pcie_primary_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v5);
  __dmb(1u);
  uint32_t v2 = v5;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x4000000);
  e1000_get_auto_rd_done_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &v4);
  __dmb(1u);
  return e1000_check_alt_mac_addr_generic(a1);
}

uint64_t sub_10002B2D4(uint64_t a1)
{
  return e1000_acquire_swfw_sync_i225(a1, 1);
}

void sub_10002B2DC(uint64_t a1)
{
}

uint64_t sub_10002B2E4(uint64_t a1, __int16 *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v5 = (unsigned __int16)*a2;
    if (v5 == 0xFFFF || v5 == 0)
    {
      if (*(_DWORD *)(a1 + 1116) == 3) {
        __int16 v7 = 280;
      }
      else {
        __int16 v7 = 2073;
      }
      *a2 = v7;
    }
  }
  return result;
}

uint64_t sub_10002B350(uint64_t a1, uint64_t a2, int a3)
{
  uint32_t segmentsCount = 1;
  uint64_t flags = 0;
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *(_DWORD *)(a2 + 280);
    *(_DWORD *)buf = 136315650;
    int v17 = "allocRing";
    __int16 v18 = 1024;
    int v19 = 14;
    __int16 v20 = 1024;
    int v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <== ringsize=%d\n", buf, 0x18u);
  }
  __int16 v6 = (IOBufferMemoryDescriptor **)(a2 + 296);
  uint64_t v7 = IOBufferMemoryDescriptor::Create(3uLL, (IOVMPageSize + 16 * (*(_DWORD *)(a2 + 280) + a3) - 1) / IOVMPageSize * IOVMPageSize, IOVMPageSize, (IOBufferMemoryDescriptor **)(a2 + 296));
  if (v7)
  {
    uint64_t v8 = v7;
    if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v17 = "allocRing";
      __int16 v18 = 1024;
      int v19 = 22;
      uint32_t v9 = "e1000::%s(%d): can't alloc IOBufferMemoryDescriptor\n";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x12u);
    }
  }
  else
  {
    uint64_t AddressRange = IOBufferMemoryDescriptor::GetAddressRange(*v6, &range);
    if (AddressRange)
    {
      uint64_t v8 = AddressRange;
      if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v17 = "allocRing";
        __int16 v18 = 1024;
        int v19 = 30;
        uint32_t v9 = "e1000::%s(%d): GetAddressRange failed\n";
        goto LABEL_18;
      }
    }
    else
    {
      *(void *)(a2 + 264) = range.address;
      specification.options = 0;
      memset(specification._resv, 0, sizeof(specification._resv));
      specification.maxAddressBits = 64;
      uint64_t v11 = IODMACommand::Create(*(IOService **)(a1 + 9608), 0, &specification, (IODMACommand **)(a2 + 288));
      if (v11)
      {
        uint64_t v8 = v11;
        if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          int v17 = "allocRing";
          __int16 v18 = 1024;
          int v19 = 42;
          uint32_t v9 = "e1000::%s(%d): can't alloc IODMACommand\n";
          goto LABEL_18;
        }
      }
      else
      {
        uint64_t v8 = IODMACommand::PrepareForDMA(*(IODMACommand **)(a2 + 288), 0, *v6, 0, 0, &flags, &segmentsCount, &range, 0);
        if (!v8)
        {
          *(void *)(a2 + 272) = range.address;
          operator new[]();
        }
        if ((dword_10003C000 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          int v17 = "allocRing";
          __int16 v18 = 1024;
          int v19 = 50;
          uint32_t v9 = "e1000::%s(%d): PrepareForDMA failed\n";
          goto LABEL_18;
        }
      }
    }
  }
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v17 = "allocRing";
    __int16 v18 = 1024;
    int v19 = 62;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", buf, 0x18u);
  }
  return v8;
}

uint64_t sub_10002B724(uint64_t a1)
{
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "allocateRings";
    __int16 v9 = 1024;
    int v10 = 70;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): <==\n", (uint8_t *)&v7, 0x12u);
  }
  uint64_t v2 = a1 + 9680;
  uint64_t v3 = -1;
  while (++v3 < (unint64_t)*(unsigned __int8 *)(a1 + 9673))
  {
    *(_DWORD *)(v2 + 632) = 128;
    uint64_t v4 = sub_10002B350(a1, v2 + 352, 0);
    if (!v4)
    {
      *(_DWORD *)(v2 + 280) = 128;
      uint64_t v4 = sub_10002B350(a1, v2, *(_DWORD *)(a1 + 284) > 28);
      v2 += 352;
      if (!v4) {
        continue;
      }
    }
    uint64_t v5 = v4;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_8:
  if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    uint64_t v8 = "allocateRings";
    __int16 v9 = 1024;
    int v10 = 81;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v7, 0x18u);
  }
  return v5;
}

uint64_t sub_10002B8C8(uint64_t a1, void *a2)
{
  uint64_t v3 = (IODMACommand *)a2[36];
  if (v3)
  {
    IODMACommand::CompleteDMA(v3, 0, 0);
    uint64_t v4 = a2[36];
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
      a2[36] = 0;
    }
  }
  uint64_t v5 = a2[37];
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    a2[37] = 0;
  }
  uint64_t result = a2[38];
  if (result) {
    operator delete[]();
  }
  a2[38] = 0;
  a2[16] = 0;
  return result;
}

uint64_t sub_10002B980(uint64_t result)
{
  uint64_t v1 = (unsigned __int8 *)(result + 9673);
  if (*(unsigned char *)(result + 9673))
  {
    unint64_t v2 = 0;
    uint64_t v3 = (void *)(result + 10032);
    do
    {
      uint64_t v4 = sub_10002B8C8(result, v3);
      uint64_t result = sub_10002B8C8(v4, v3 - 44);
      ++v2;
      v3 += 44;
    }
    while (v2 < *v1);
  }
  return result;
}

uint64_t sub_10002B9E4(uint64_t a1)
{
  uint8_t returnFunctionNumber;
  uint8_t returnDeviceNumber[2];
  char __str[16];
  long long v38;
  IOUserNetworkPacketBufferPoolOptions options;

  sub_1000077C0(a1, 32);
  *(_DWORD *)(a1 + 10396) = 1500;
  *(_DWORD *)(a1 + 10388) = 0x4000;
  *(_OWORD *)__str = 0u;
  int v38 = 0u;
  *(_WORD *)returnDeviceNumber = 0;
  returnFunctionNumber = 0;
  IOPCIDevice::GetBusDeviceFunction(*(IOPCIDevice **)(a1 + 9608), &returnDeviceNumber[1], returnDeviceNumber, &returnFunctionNumber, 0);
  snprintf(__str, 0x20uLL, "e1000:%d:%d:%d:%s", returnDeviceNumber[1], returnDeviceNumber[0], returnFunctionNumber, (const char *)&unk_1000360B2);
  *(void *)&options.packetCount = 0x20000000200;
  options.bufferSize = *(_DWORD *)(a1 + 10388);
  *(void *)&options.maxBuffersPerPacket = 1;
  options.poolFlags = 0x20000000;
  options.dmaSpecification.maxAddressBits = 64;
  uint64_t v2 = IOUserNetworkPacketBufferPool::CreateWithOptions(*(IOService **)(a1 + 9608), "e1000", &options, (IOUserNetworkPacketBufferPool **)(a1 + 10560));
  if (v2)
  {
    uint64_t v3 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v30 = "startInterface";
      __int16 v31 = 1024;
      int v32 = 131;
      __int16 v33 = 1024;
      int v34 = v3;
LABEL_4:
      uint64_t v4 = buf;
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", v4, 0x18u);
    }
  }
  else
  {
    uint64_t v5 = IOUserNetworkTxSubmissionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 10560), *(OSObject **)(a1 + 9600), 0x80u, 0, *(IODispatchQueue **)(a1 + 9616), (IOUserNetworkTxSubmissionQueue **)(a1 + 10016));
    if (v5)
    {
      uint64_t v3 = v5;
      if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        int v30 = "startInterface";
        __int16 v31 = 1024;
        int v32 = 138;
        __int16 v33 = 1024;
        int v34 = v3;
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t ActionTxSubmit = DriverKit_AppleEthernetE1000::CreateActionTxSubmit(*(OSObject **)(a1 + 9600), 8uLL, (OSAction **)(a1 + 9992));
      if (ActionTxSubmit)
      {
        uint64_t v3 = ActionTxSubmit;
        if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          int v30 = "startInterface";
          __int16 v31 = 1024;
          int v32 = 144;
          __int16 v33 = 1024;
          int v34 = v3;
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v7 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 10016) + 72))(*(void *)(a1 + 10016), a1 + 10000);
        if (v7)
        {
          uint64_t v3 = v7;
          if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            int v30 = "startInterface";
            __int16 v31 = 1024;
            int v32 = 150;
            __int16 v33 = 1024;
            int v34 = v3;
            goto LABEL_4;
          }
        }
        else
        {
          uint64_t v8 = IODataQueueDispatchSource::SetDataAvailableHandler(*(IODataQueueDispatchSource **)(a1 + 10000), *(OSAction **)(a1 + 9992), 0);
          if (v8)
          {
            uint64_t v3 = v8;
            if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              int v30 = "startInterface";
              __int16 v31 = 1024;
              int v32 = 156;
              __int16 v33 = 1024;
              int v34 = v3;
              goto LABEL_4;
            }
          }
          else
          {
            uint64_t v9 = IOUserNetworkTxCompletionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 10560), *(OSObject **)(a1 + 9600), 0x80u, 0, *(IODispatchQueue **)(a1 + 9616), (IOUserNetworkTxCompletionQueue **)(a1 + 10024));
            if (v9)
            {
              uint64_t v3 = v9;
              if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                int v30 = "startInterface";
                __int16 v31 = 1024;
                int v32 = 162;
                __int16 v33 = 1024;
                int v34 = v3;
                goto LABEL_4;
              }
            }
            else
            {
              uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 10024) + 72))(*(void *)(a1 + 10024), a1 + 10008);
              if (v11)
              {
                uint64_t v3 = v11;
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                  return v3;
                }
                *(_DWORD *)buf = 136315650;
                int v30 = "startInterface";
                __int16 v31 = 1024;
                int v32 = 168;
                __int16 v33 = 1024;
                int v34 = v3;
                goto LABEL_4;
              }
              uint64_t v12 = IOUserNetworkRxSubmissionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 10560), *(OSObject **)(a1 + 9600), 0x80u, 0, *(IODispatchQueue **)(a1 + 9616), (IOUserNetworkRxSubmissionQueue **)(a1 + 10368));
              if (v12)
              {
                uint64_t v3 = v12;
                if ((dword_10003C000 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  int v30 = "startInterface";
                  __int16 v31 = 1024;
                  int v32 = 175;
                  __int16 v33 = 1024;
                  int v34 = v3;
                  goto LABEL_4;
                }
              }
              else
              {
                uint64_t ActionRxSubmit = DriverKit_AppleEthernetE1000::CreateActionRxSubmit(*(OSObject **)(a1 + 9600), 8uLL, (OSAction **)(a1 + 10344));
                if (ActionRxSubmit)
                {
                  uint64_t v3 = ActionRxSubmit;
                  if ((dword_10003C000 & 1) != 0
                    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    int v30 = "startInterface";
                    __int16 v31 = 1024;
                    int v32 = 181;
                    __int16 v33 = 1024;
                    int v34 = v3;
                    goto LABEL_4;
                  }
                }
                else
                {
                  uint64_t v14 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 10368) + 72))(*(void *)(a1 + 10368), a1 + 10352);
                  if (v14)
                  {
                    uint64_t v3 = v14;
                    if ((dword_10003C000 & 1) != 0
                      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315650;
                      int v30 = "startInterface";
                      __int16 v31 = 1024;
                      int v32 = 187;
                      __int16 v33 = 1024;
                      int v34 = v3;
                      goto LABEL_4;
                    }
                  }
                  else
                  {
                    uint64_t v15 = IODataQueueDispatchSource::SetDataAvailableHandler(*(IODataQueueDispatchSource **)(a1 + 10352), *(OSAction **)(a1 + 10344), 0);
                    if (v15)
                    {
                      uint64_t v3 = v15;
                      if ((dword_10003C000 & 1) != 0
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136315650;
                        int v30 = "startInterface";
                        __int16 v31 = 1024;
                        int v32 = 193;
                        __int16 v33 = 1024;
                        int v34 = v3;
                        goto LABEL_4;
                      }
                    }
                    else
                    {
                      uint64_t v16 = IOUserNetworkRxCompletionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 10560), *(OSObject **)(a1 + 9600), 0x80u, 0, *(IODispatchQueue **)(a1 + 9616), (IOUserNetworkRxCompletionQueue **)(a1 + 10376));
                      if (!v16)
                      {
                        uint64_t v17 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 10376) + 72))(*(void *)(a1 + 10376), a1 + 10360);
                        if (v17)
                        {
                          uint64_t v3 = v17;
                          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                            return v3;
                          }
                          *(_DWORD *)buf = 136315650;
                          int v30 = "startInterface";
                          __int16 v31 = 1024;
                          int v32 = 205;
                          __int16 v33 = 1024;
                          int v34 = v3;
                          goto LABEL_4;
                        }
                        unsigned int v28 = 18;
                        uint64_t v18 = sub_100007660(a1, (int *)buf, &v28);
                        if (v18)
                        {
                          uint64_t v3 = v18;
                          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                            return v3;
                          }
                          *(_DWORD *)int v27 = 136315650;
                          *(void *)&v27[4] = "startInterface";
                          *(_WORD *)&v27[12] = 1024;
                          *(_DWORD *)&v27[14] = 216;
                          *(_WORD *)&v27[18] = 1024;
                          *(_DWORD *)&v27[20] = v3;
                        }
                        else
                        {
                          uint64_t v19 = (*(uint64_t (**)(void, uint8_t *, void))(**(void **)(a1 + 9600) + 72))(*(void *)(a1 + 9600), buf, v28);
                          if (!v19)
                          {
                            long long v20 = *(_OWORD *)(a1 + 10368);
                            *(_OWORD *)int v27 = *(_OWORD *)(a1 + 10016);
                            *(_OWORD *)&v27[16] = v20;
                            uint64_t v3 = (*(uint64_t (**)(void, unint64_t, void, unsigned char *, uint64_t))(**(void **)(a1 + 9600) + 272))(*(void *)(a1 + 9600), *(unsigned int *)(a1 + 272) | ((unint64_t)*(unsigned __int16 *)(a1 + 276) << 32), *(void *)(a1 + 10560), v27, 4);
                            if ((dword_10003C000 & 1) != 0
                              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              int v21 = 136315650;
                              int v22 = "startInterface";
                              __int16 v23 = 1024;
                              int v24 = 230;
                              __int16 v25 = 1024;
                              int v26 = v3;
                              uint64_t v4 = (uint8_t *)&v21;
                              goto LABEL_5;
                            }
                            return v3;
                          }
                          uint64_t v3 = v19;
                          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                            return v3;
                          }
                          *(_DWORD *)int v27 = 136315650;
                          *(void *)&v27[4] = "startInterface";
                          *(_WORD *)&v27[12] = 1024;
                          *(_DWORD *)&v27[14] = 221;
                          *(_WORD *)&v27[18] = 1024;
                          *(_DWORD *)&v27[20] = v3;
                        }
                        uint64_t v4 = v27;
                        goto LABEL_5;
                      }
                      uint64_t v3 = v16;
                      if ((dword_10003C000 & 1) != 0
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136315650;
                        int v30 = "startInterface";
                        __int16 v31 = 1024;
                        int v32 = 199;
                        __int16 v33 = 1024;
                        int v34 = v3;
                        goto LABEL_4;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_10002C424(IOUserNetworkPacketQueue **a1)
{
  uint64_t v2 = sub_1000210BC((uint64_t)a1);
  if (!v2)
  {
    sub_100006D2C((uint64_t)a1);
    uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[1297], 1, 0);
    if (!v2)
    {
      uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[1296], 1, 0);
      if (!v2)
      {
        uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[1253], 1, 0);
        if (!v2) {
          uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[1252], 1, 0);
        }
      }
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    uint64_t v5 = "enable";
    __int16 v6 = 1024;
    int v7 = 247;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "e1000::%s(%d): ==> 0x%08x\n", (uint8_t *)&v4, 0x18u);
  }
  return v2;
}

uint64_t sub_10002C52C(IOUserNetworkPacketQueue **a1)
{
  sub_100021378((uint64_t)a1);
  IOUserNetworkPacketQueue::SetEnable(a1[1296], 0, 0);
  sub_100009940((uint64_t)a1, (uint64_t)(a1 + 1254));
  IOUserNetworkPacketQueue::SetEnable(a1[1297], 0, 0);
  IOUserNetworkPacketQueue::SetEnable(a1[1252], 0, 0);
  sub_100009940((uint64_t)a1, (uint64_t)(a1 + 1210));
  IOUserNetworkPacketQueue::SetEnable(a1[1253], 0, 0);
  return sub_10002B980((uint64_t)a1);
}

void sub_10002C5CC(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1 + 10384);
  if (*(unsigned char *)(a1 + 10392))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
    __dmb(1u);
    char v3 = readData;
    if (readData != -1)
    {
      unsigned int v4 = 0;
      while ((v3 & 0x9D) != 0)
      {
        if ((v3 & 0xC) != 0)
        {
          *uint64_t v1 = 1;
          sub_100006D2C(a1);
        }
        __dmb(1u);
        if (v3) {
          sub_100007E84(a1, 0);
        }
        if (v3 < 0)
        {
          if (*(int *)(a1 + 284) < 13) {
            unsigned int v5 = sub_100005BBC(a1);
          }
          else {
            unsigned int v5 = sub_1000058E8(a1, 0);
          }
          if (v5) {
            unsigned int v4 = HIWORD(v5);
          }
        }
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
        __dmb(1u);
        char v3 = readData;
        if (readData == -1) {
          return;
        }
      }
      if (v4) {
        IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(a1 + 10360));
      }
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 0x9Du);
    }
  }
}

void sub_10002C714(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1 + 10384);
  if (*(unsigned char *)(a1 + 10392))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData;
    if (readData != -1)
    {
      if ((readData & 0xC) != 0)
      {
        *uint64_t v1 = 1;
        sub_100006D2C(a1);
      }
      int v4 = *(_DWORD *)(a1 + 284);
      if (v4 >= 29)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 4u);
        __dmb(2u);
        unsigned int v5 = *(IOPCIDevice **)(a1 + 16);
        if (*(_DWORD *)(a1 + 284) == 29) {
          uint32_t v6 = 0x80000000;
        }
        else {
          uint32_t v6 = 1;
        }
        uint64_t v7 = 5412;
        goto LABEL_13;
      }
      if (v4 == 16)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD0uLL, 0x1000004u);
        if (v3)
        {
          __dmb(2u);
          unsigned int v5 = *(IOPCIDevice **)(a1 + 16);
          uint64_t v7 = 200;
          uint32_t v6 = 2;
LABEL_13:
          IOPCIDevice::MemoryWrite32(v5, 0, v7, v6);
        }
      }
    }
  }
}

void sub_10002C81C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 10392))
  {
    unsigned int v2 = 0;
    __dmb(1u);
    do
    {
      int v3 = sub_100007E84(a1, 0);
      unsigned int v4 = sub_1000058E8(a1, 0);
      if (v4) {
        unsigned int v2 = HIWORD(v4);
      }
    }
    while (v4 | v3);
    if (v2) {
      IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(a1 + 10360));
    }
    __dmb(2u);
    unsigned int v5 = *(IOPCIDevice **)(a1 + 16);
    if (*(_DWORD *)(a1 + 284) == 29) {
      uint32_t v6 = 513;
    }
    else {
      uint32_t v6 = 2;
    }
    IOPCIDevice::MemoryWrite32(v5, 0, 0x1524uLL, v6);
  }
}

uint64_t e1000_calculate_checksum(unsigned __int8 *a1, unsigned int a2)
{
  int v2 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v3 = a2;
      do
      {
        int v4 = *a1++;
        v2 += v4;
        --v3;
      }
      while (v3);
    }
    return -v2;
  }
  return v2;
}

uint64_t e1000_mng_enable_host_if_generic(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 849)) {
    return 4294967285;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
  __dmb(1u);
  if ((readData & 1) == 0) {
    return 4294967285;
  }
  for (unsigned int i = 0; ; ++i)
  {
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &v5);
    __dmb(1u);
    if ((v5 & 2) == 0) {
      break;
    }
    IODelay(0x3E8uLL);
    if (i >= 9) {
      return 4294967285;
    }
  }
  return 0;
}

BOOL e1000_check_mng_mode_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
  __dmb(1u);
  return (readData & 0xE) == 6;
}

BOOL e1000_enable_tx_pkt_filtering_generic(uint64_t a1)
{
  *(unsigned char *)(a1 + 861) = 1;
  if (((*(uint64_t (**)(void))(a1 + 64))() & 1) != 0 && !e1000_mng_enable_host_if_generic(a1))
  {
    uint64_t v3 = 0;
    int v4 = (_DWORD *)(a1 + 1360);
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v3 * 4 + 36592, &readData);
      __dmb(1u);
      v4[v3++] = readData;
    }
    while (v3 != 4);
    int v5 = *(unsigned __int8 *)(a1 + 1375);
    *(unsigned char *)(a1 + 1375) = 0;
    if (v5 != -vaddvq_s8(*(int8x16_t *)(a1 + 1360)) || *v4 != 1414349129)
    {
      BOOL result = 1;
      *(unsigned char *)(a1 + 861) = 1;
      return result;
    }
    if (*(unsigned char *)(a1 + 1364)) {
      return *(unsigned char *)(a1 + 861) != 0;
    }
  }
  BOOL result = 0;
  *(unsigned char *)(a1 + 861) = 0;
  return result;
}

uint64_t e1000_mng_write_cmd_header_generic(uint64_t a1, int8x8_t *a2)
{
  if (a2)
  {
    int8x8_t v4 = *a2;
    v4.i8[0] = vaddv_s8(*a2);
    int v5 = -v4.i32[0];
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  uint64_t v6 = 0;
  a2->i8[1] = v5;
  char v7 = 1;
  do
  {
    char v8 = v7;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (4 * v6) | 0x8800, a2->u32[v6]);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    char v7 = 0;
    __dmb(1u);
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  return 0;
}

uint64_t e1000_mng_host_if_write_generic(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4, unsigned char *a5)
{
  uint32_t data = 0;
  if (!a3) {
    return 4294967292;
  }
  unsigned __int16 v5 = a3;
  if (a4 + a3 > 0x6F8) {
    return 4294967292;
  }
  unsigned int v10 = a4 >> 2;
  uint64_t v11 = a4 & 3;
  if ((a4 & 3) != 0)
  {
    uint32_t readData = 0;
    uint64_t v12 = ((unsigned __int16)a4 & 0xFFFC) + 34816;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v12, &readData);
    __dmb(1u);
    uint32_t data = readData;
    int v13 = *a5;
    uint64_t v14 = v11;
    do
    {
      int v15 = *a2++;
      *((unsigned char *)&data + v14) = v15;
      v13 += v15;
      *a5 = v13;
      ++v14;
    }
    while (v14 != 4);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v12, data);
    unsigned __int16 v5 = v11 + v5 - 4;
    ++v10;
  }
  unint64_t v16 = v5 & 3;
  if (v5 >= 4u)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v5 >> 2;
    do
    {
      uint64_t v19 = 0;
      int v20 = *a5;
      do
      {
        int v21 = a2[v19];
        *((unsigned char *)&data + v19) = v21;
        v20 += v21;
        *a5 = v20;
        ++v19;
      }
      while (v19 != 4);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 4 * (v17 + v10) + 34816, data);
      ++v17;
      a2 += 4;
    }
    while (v17 != v18);
    if (!v16) {
      return 0;
    }
LABEL_16:
    unint64_t v22 = 0;
    int v23 = *a5;
    do
    {
      if (v22 >= v16)
      {
        int v24 = 0;
      }
      else
      {
        int v25 = *a2++;
        int v24 = v25;
      }
      *((unsigned char *)&data + v22) = v24;
      v23 += v24;
      *a5 = v23;
      ++v22;
    }
    while (v22 != 4);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 4 * (v17 + v10) + 34816, data);
    return 0;
  }
  LODWORD(v17) = 0;
  if ((v5 & 3) != 0) {
    goto LABEL_16;
  }
  return 0;
}

uint64_t e1000_mng_write_dhcp_info_generic(uint64_t a1, unsigned __int8 *a2, int a3)
{
  v9.i32[0] = 64;
  v9.i16[3] = a3;
  v9.i16[2] = 0;
  uint64_t result = e1000_mng_enable_host_if_generic(a1);
  if (!result)
  {
    uint64_t result = e1000_mng_host_if_write_generic(a1, a2, a3, 8u, (unsigned char *)&v9 + 1);
    if (!result)
    {
      e1000_mng_write_cmd_header_generic(a1, &v9);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
      __dmb(1u);
      uint32_t v7 = readData;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, v7 | 2);
      return 0;
    }
  }
  return result;
}

BOOL e1000_enable_mng_pass_thru(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 850)) {
    return 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  BOOL result = 0;
  __dmb(1u);
  if ((readData & 0x20000) == 0) {
    return result;
  }
  if (*(unsigned char *)(a1 + 848))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
    __dmb(1u);
    char v3 = readData;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B30uLL, &readData);
    __dmb(1u);
    return (readData & 0x20000000) == 0 && (v3 & 0xE) == 4;
  }
  if ((*(_DWORD *)(a1 + 284) & 0xFFFFFFFE) == 0x10)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B30uLL, &readData);
    __dmb(1u);
    int nvm = e1000_read_nvm(a1);
    BOOL result = nvm == 0;
    if (nvm) {
      return result;
    }
    return 0;
  }
  return (readData & 3) == 1;
}

uint64_t e1000_host_interface_command(uint64_t a1, uint32_t *a2, unsigned int a3)
{
  if (!*(unsigned char *)(a1 + 849) || !*(unsigned char *)(a1 + 850)) {
    return 0;
  }
  if (!a3) {
    return 4294967285;
  }
  uint64_t result = 4294967285;
  if (a3 <= 0x700 && (a3 & 3) == 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData;
    if ((readData & 1) == 0) {
      return 4294967285;
    }
    unsigned int v8 = a3 >> 2;
    if (a3 >= 4)
    {
      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = 34816;
      uint64_t v11 = a2;
      do
      {
        __dmb(2u);
        uint32_t v12 = *v11++;
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v10, v12);
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, v7 | 2);
    int v13 = 500;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
      __dmb(1u);
      if ((readData & 2) == 0) {
        break;
      }
      IODelay(0x3E8uLL);
      uint64_t result = 4294967285;
      if (!--v13) {
        return result;
      }
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
    __dmb(1u);
    if ((readData & 4) != 0) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = 4294967285;
    }
    if ((readData & 4) != 0 && a3 >= 4)
    {
      if (v8 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v8;
      }
      uint64_t v15 = 34816;
      do
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v15, &readData);
        uint64_t result = 0;
        __dmb(1u);
        *a2++ = readData;
        v15 += 4;
        --v14;
      }
      while (v14);
    }
  }
  return result;
}

uint64_t e1000_load_firmware(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(int *)(a1 + 284) < 34) {
    return 4294967293;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
  __dmb(1u);
  if ((~readData & 0x201) != 0) {
    return 4294967293;
  }
  uint64_t result = 4294967280;
  if (a3 && a3 <= 0x10000 && (a3 & 3) == 0)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1500uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData;
    uint32_t v8 = readData | 0x40;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, v8);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, v7 | 0xC0);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    int v9 = 500;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1500uLL, &readData);
      __dmb(1u);
      if ((readData & 0x40000) != 0) {
        break;
      }
      IODelay(0x3E8uLL);
      if (--v9 == -500) {
        goto LABEL_13;
      }
    }
    if (!v9) {
      return 4294967285;
    }
LABEL_13:
    int v10 = 500;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
      __dmb(1u);
      if ((readData & 0x800E) == 0x8008) {
        break;
      }
      IODelay(0x3E8uLL);
      if (!--v10) {
        return 4294967285;
      }
    }
    if (a3 >= 4)
    {
      unsigned __int8 v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = a3 & 0xFFFFFFFC;
      do
      {
        if (!v11)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F40uLL, (v12 & 0x7FFFFC00) + 0x10000);
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, (4 * v11) | 0x8800u, *(_DWORD *)(a2 + v12));
        v12 += 4;
        ++v11;
      }
      while (v13 != v12);
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
    __dmb(1u);
    uint32_t v14 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, v14 | 2);
    int v15 = 500;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, &readData);
      __dmb(1u);
      if ((readData & 2) == 0) {
        break;
      }
      IODelay(0x3E8uLL);
      if (!--v15) {
        return 4294967285;
      }
    }
    return 0;
  }
  return result;
}

void *e1000_init_function_pointers_82542(void *result)
{
  result[5] = sub_10002D3EC;
  result[143] = sub_10002D54C;
  result[111] = sub_10002D5CC;
  return result;
}

uint64_t sub_10002D3EC(uint64_t a1)
{
  *(_DWORD *)(a1 + 1116) = 2;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(void *)(a1 + 104) = sub_10002D76C;
  *(void *)(a1 + 112) = e1000_set_lan_id_multi_port_pci;
  *(void *)(a1 + 152) = sub_10002D784;
  *(void *)(a1 + 160) = sub_10002D8D8;
  *(void *)(a1 + 192) = sub_10002DAF8;
  *(void *)(a1 + 200) = e1000_setup_fiber_serdes_link_generic;
  *(void *)(a1 + 72) = e1000_check_for_fiber_link_generic;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  *(void *)(a1 + 96) = e1000_clear_vfta_generic;
  *(void *)(a1 + 240) = sub_10002DC34;
  *(void *)(a1 + 232) = sub_10002DCC4;
  *(void *)(a1 + 128) = sub_10002E110;
  *(void *)(a1 + 136) = sub_10002E178;
  *(void *)(a1 + 88) = sub_10002E1E0;
  *(void *)(a1 + 120) = e1000_get_speed_and_duplex_fiber_serdes_generic;
  return 0;
}

uint64_t sub_10002D54C(uint64_t a1)
{
  *(_DWORD *)(a1 + 1216) = 3;
  *(void *)(a1 + 1232) = 0x3000600320040;
  *(void *)(a1 + 1160) = e1000_read_nvm_microwire;
  *(void *)(a1 + 1168) = e1000_stop_nvm;
  *(void *)(a1 + 1208) = e1000_write_nvm_microwire;
  *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
  *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
  return 0;
}

uint64_t sub_10002D5CC(uint64_t a1)
{
  *(_DWORD *)(a1 + 1072) = 1;
  return 0;
}

uint64_t e1000_translate_register_82542(int a1)
{
  if (a1 > 10519)
  {
    if (a1 > 14351)
    {
      int v1 = 20991;
      if (a1 == 21504) {
        int v15 = 64;
      }
      else {
        int v15 = a1;
      }
      if (a1 == 22016) {
        int v16 = 1536;
      }
      else {
        int v16 = v15;
      }
      if (a1 == 20992) {
        unsigned int v4 = 512;
      }
      else {
        unsigned int v4 = v16;
      }
      int v5 = 14352;
      int v6 = 1072;
      int v7 = 14360;
      int v8 = 1080;
      BOOL v9 = a1 == 14368;
      int v10 = 1088;
    }
    else
    {
      int v1 = 14335;
      if (a1 == 14344) {
        int v11 = 1064;
      }
      else {
        int v11 = a1;
      }
      if (a1 == 14340) {
        int v12 = 1060;
      }
      else {
        int v12 = v11;
      }
      if (a1 == 14336) {
        unsigned int v4 = 1056;
      }
      else {
        unsigned int v4 = v12;
      }
      int v5 = 10520;
      int v6 = 336;
      int v7 = 13328;
      int v8 = 32784;
      BOOL v9 = a1 == 13336;
      int v10 = 32792;
    }
  }
  else if (a1 > 10263)
  {
    int v1 = 10499;
    if (a1 == 10512) {
      int v13 = 328;
    }
    else {
      int v13 = a1;
    }
    if (a1 == 10504) {
      int v14 = 320;
    }
    else {
      int v14 = v13;
    }
    if (a1 == 10500) {
      unsigned int v4 = 316;
    }
    else {
      unsigned int v4 = v14;
    }
    int v5 = 10264;
    int v6 = 296;
    int v7 = 10272;
    int v8 = 264;
    BOOL v9 = a1 == 10496;
    int v10 = 312;
  }
  else
  {
    int v1 = 10243;
    if (a1 == 10256) {
      int v2 = 288;
    }
    else {
      int v2 = a1;
    }
    if (a1 == 10248) {
      int v3 = 280;
    }
    else {
      int v3 = v2;
    }
    if (a1 == 10244) {
      unsigned int v4 = 276;
    }
    else {
      unsigned int v4 = v3;
    }
    int v5 = 8544;
    int v6 = 360;
    int v7 = 8552;
    int v8 = 352;
    BOOL v9 = a1 == 10240;
    int v10 = 272;
  }
  if (!v9) {
    int v10 = a1;
  }
  if (a1 == v7) {
    int v17 = v8;
  }
  else {
    int v17 = v10;
  }
  if (a1 == v5) {
    unsigned int v18 = v6;
  }
  else {
    unsigned int v18 = v17;
  }
  if (a1 <= v1) {
    return v18;
  }
  else {
    return v4;
  }
}

uint64_t sub_10002D76C(uint64_t a1)
{
  *(void *)(a1 + 1248) = 1;
  *(_DWORD *)(a1 + 1256) = 0;
  return 0;
}

uint64_t sub_10002D784(uint64_t a1)
{
  int v2 = (unsigned char *)(a1 + 9592);
  if (*(unsigned char *)(a1 + 9592) == 2) {
    e1000_pci_clear_mwi(a1);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v6);
  __dmb(1u);
  uint32_t v3 = v6;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v3 | 0x4000000);
  (*(void (**)(uint64_t))(a1 + 1176))(a1);
  IODelay(0x7D0uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &v5);
  __dmb(1u);
  if (*v2 == 2 && (*(_WORD *)(a1 + 1262) & 0x10) != 0) {
    e1000_pci_set_mwi(a1);
  }
  return 0;
}

uint64_t sub_10002D8D8(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x38uLL, 0);
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  if (*(unsigned char *)(a1 + 9592) == 2)
  {
    e1000_pci_clear_mwi(a1);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x1388uLL);
  }
  e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
  if (*(unsigned char *)(a1 + 9592) == 2)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v9);
    __dmb(1u);
    IODelay(0x3E8uLL);
    if ((*(_WORD *)(a1 + 1262) & 0x10) != 0) {
      e1000_pci_set_mwi(a1);
    }
  }
  if (*(_WORD *)(a1 + 326))
  {
    int v2 = 0;
    unsigned int v3 = 0;
    do
    {
      __dmb(2u);
      if (v2 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v4 = 64;
        }
        else {
          unsigned int v4 = 21504;
        }
      }
      else if (v2)
      {
        if (v2 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v4 = 1536;
          }
          else {
            unsigned int v4 = 22016;
          }
        }
        else
        {
          unsigned int v4 = v2 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v4 = 512;
      }
      else
      {
        unsigned int v4 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v4, 0);
      ++v3;
      v2 += 4;
    }
    while (v3 < *(unsigned __int16 *)(a1 + 326));
  }
  if (*(unsigned char *)(a1 + 1376))
  {
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &v8);
    __dmb(1u);
    uint32_t v5 = v8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v5 | 4);
  }
  uint64_t v6 = sub_10002DAF8(a1);
  sub_10002E1E0(a1);
  return v6;
}

uint64_t sub_10002DAF8(uint64_t a1)
{
  uint64_t result = e1000_set_default_fc_generic(a1);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 884);
    switch(v3)
    {
      case 0:
      case 2:
        int v3 = 0;
        *(_DWORD *)(a1 + 884) = 0;
        goto LABEL_7;
      case 1:
      case 3:
        goto LABEL_5;
      default:
        if (v3 == 255)
        {
LABEL_5:
          int v3 = 1;
          *(_DWORD *)(a1 + 884) = 1;
          if (!*(unsigned char *)(a1 + 855)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
LABEL_7:
        if (*(unsigned char *)(a1 + 855) && v3)
        {
LABEL_9:
          int v3 = 0;
          *(_DWORD *)(a1 + 884) = 0;
        }
LABEL_10:
        *(_DWORD *)(a1 + 880) = v3;
        uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 200))(a1);
        if (!result)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x28uLL, 0xC28001u);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x2CuLL, 0x100u);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x30uLL, 0x8808u);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x170uLL, *(unsigned __int16 *)(a1 + 872));
          uint64_t result = e1000_set_fc_watermarks_generic(a1);
        }
        break;
    }
  }
  return result;
}

uint64_t sub_10002DC34(uint64_t a1)
{
  unsigned __int16 v2 = 0;
  __int16 v6 = 0;
  for (uint64_t i = 279; ; i += 2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1160))(a1, v2, 1, &v6);
    if (result) {
      break;
    }
    *(_WORD *)(a1 + i - 1) = v6;
    unint64_t v5 = i - 279;
    ++v2;
    if (v5 >= 4)
    {
      *(_WORD *)(a1 + 276) = *(_WORD *)(a1 + 282);
      *(_DWORD *)(a1 + 272) = *(_DWORD *)(a1 + 278);
      return result;
    }
  }
  return result;
}

uint64_t sub_10002DCC4(uint64_t a1, uint64_t a2, int a3)
{
  uint32_t v4 = *(_DWORD *)a2;
  int v5 = *(unsigned __int8 *)(a2 + 4);
  int v6 = *(unsigned __int8 *)(a2 + 5);
  __dmb(2u);
  int v7 = *(IOPCIDevice **)(a1 + 16);
  int v8 = 8 * a3;
  if (8 * a3 > -10993)
  {
    if (v8 > -7153)
    {
      if (v8 > -513)
      {
        switch(v8)
        {
          case -512:
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v10 = 512;
            uint64_t v11 = 20992;
            goto LABEL_69;
          case 512:
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v10 = 1536;
            uint64_t v11 = 22016;
            goto LABEL_69;
          case 0:
            if (*(int *)(a1 + 284) <= 1) {
              uint64_t v16 = 64;
            }
            else {
              uint64_t v16 = 21504;
            }
            IOPCIDevice::MemoryWrite32(v7, 0, v16, v4);
            __dmb(2u);
            unsigned int v17 = 21508;
            goto LABEL_74;
        }
      }
      else
      {
        switch(v8)
        {
          case -7152:
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v10 = 1072;
            uint64_t v11 = 14352;
            goto LABEL_69;
          case -7144:
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v10 = 1080;
            uint64_t v11 = 14360;
            goto LABEL_69;
          case -7136:
            BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
            uint64_t v10 = 1088;
            uint64_t v11 = 14368;
            goto LABEL_69;
        }
      }
      goto LABEL_79;
    }
    if (v8 <= -8169)
    {
      switch(v8)
      {
        case -10992:
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v10 = 328;
          uint64_t v11 = 10512;
          goto LABEL_69;
        case -10984:
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v10 = 336;
          uint64_t v11 = 10520;
          goto LABEL_69;
        case -8176:
          BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
          uint64_t v10 = 32784;
          uint64_t v11 = 13328;
LABEL_69:
          if (v9) {
            uint64_t v21 = v10;
          }
          else {
            uint64_t v21 = v11;
          }
          IOPCIDevice::MemoryWrite32(v7, 0, v21, v4);
          __dmb(2u);
          goto LABEL_73;
      }
      goto LABEL_79;
    }
    if (v8 == -8168)
    {
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 32792;
      uint64_t v11 = 13336;
      goto LABEL_69;
    }
    if (v8 != -7168)
    {
      if (v8 == -7160)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v10 = 1064;
        uint64_t v11 = 14344;
        goto LABEL_69;
      }
      goto LABEL_79;
    }
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v18 = 1056;
    }
    else {
      uint64_t v18 = 14336;
    }
    IOPCIDevice::MemoryWrite32(v7, 0, v18, v4);
    __dmb(2u);
    BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v14 = 1060;
    uint64_t v15 = 14340;
LABEL_63:
    if (v13) {
      uint64_t v20 = v14;
    }
    else {
      uint64_t v20 = v15;
    }
    goto LABEL_75;
  }
  if (v8 <= -11257)
  {
    if (v8 <= -12273)
    {
      if (v8 == -12960)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v10 = 360;
        uint64_t v11 = 8544;
        goto LABEL_69;
      }
      if (v8 == -12952)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v10 = 352;
        uint64_t v11 = 8552;
        goto LABEL_69;
      }
      goto LABEL_79;
    }
    if (v8 == -12272)
    {
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 0x8000;
      uint64_t v11 = 9232;
      goto LABEL_69;
    }
    if (v8 == -12264)
    {
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 32776;
      uint64_t v11 = 9240;
      goto LABEL_69;
    }
    if (v8 != -11264) {
      goto LABEL_79;
    }
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v12 = 272;
    }
    else {
      uint64_t v12 = 10240;
    }
    IOPCIDevice::MemoryWrite32(v7, 0, v12, v4);
    __dmb(2u);
    BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v14 = 276;
    uint64_t v15 = 10244;
    goto LABEL_63;
  }
  if (v8 > -11233)
  {
    if (v8 == -11232)
    {
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 264;
      uint64_t v11 = 10272;
      goto LABEL_69;
    }
    if (v8 != -11008)
    {
      if (v8 == -11000)
      {
        BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
        uint64_t v10 = 320;
        uint64_t v11 = 10504;
        goto LABEL_69;
      }
      goto LABEL_79;
    }
    if (*(int *)(a1 + 284) <= 1) {
      uint64_t v19 = 312;
    }
    else {
      uint64_t v19 = 10496;
    }
    IOPCIDevice::MemoryWrite32(v7, 0, v19, v4);
    __dmb(2u);
    BOOL v13 = *(_DWORD *)(a1 + 284) <= 1;
    uint64_t v14 = 316;
    uint64_t v15 = 10500;
    goto LABEL_63;
  }
  switch(v8)
  {
    case -11256:
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 280;
      uint64_t v11 = 10248;
      goto LABEL_69;
    case -11248:
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 288;
      uint64_t v11 = 10256;
      goto LABEL_69;
    case -11240:
      BOOL v9 = *(_DWORD *)(a1 + 284) <= 1;
      uint64_t v10 = 296;
      uint64_t v11 = 10264;
      goto LABEL_69;
  }
LABEL_79:
  IOPCIDevice::MemoryWrite32(v7, 0, (v8 + 21504), v4);
  __dmb(2u);
LABEL_73:
  unsigned int v17 = v8 + 21508;
LABEL_74:
  uint64_t v20 = v17;
LABEL_75:
  int v22 = v5 | (v6 << 8);
  int v23 = v4 | v22;
  unsigned int v24 = v22 | 0x80000000;
  if (v23) {
    uint32_t v25 = v24;
  }
  else {
    uint32_t v25 = 0;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v20, v25);
  return 0;
}

uint64_t sub_10002E110(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x440000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  return 0;
}

uint64_t sub_10002E178(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFBBFFFF | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  return 0;
}

void sub_10002E1E0(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
}

void *e1000_init_function_pointers_82571(void *result)
{
  result[5] = sub_10002E39C;
  result[143] = sub_10002E7C0;
  result[111] = sub_10002E9A0;
  return result;
}

uint64_t sub_10002E39C(uint64_t a1)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 9584);
  int v3 = e1000_get_speed_and_duplex_fiber_serdes_generic;
  uint32_t v4 = e1000_check_for_fiber_link_generic;
  int v5 = sub_10002EF10;
  int v6 = 2;
  if (v2 > 0x107E)
  {
    if (v2 - 4313 >= 2)
    {
      if (v2 == 4261) {
        goto LABEL_11;
      }
      if (v2 != 4223) {
        goto LABEL_10;
      }
    }
LABEL_9:
    int v3 = e1000_get_speed_and_duplex_fiber_serdes_generic;
    uint32_t v4 = sub_10002EF6C;
    int v5 = sub_10002EF10;
    int v6 = 3;
    goto LABEL_11;
  }
  switch(v2)
  {
    case 0x105Fu:
      goto LABEL_11;
    case 0x1060u:
      goto LABEL_9;
    case 0x107Eu:
      goto LABEL_11;
  }
LABEL_10:
  int v3 = e1000_get_speed_and_duplex_copper_generic;
  uint32_t v4 = e1000_check_for_copper_link_generic;
  int v5 = sub_10002F1C8;
  int v6 = 1;
LABEL_11:
  *(_DWORD *)(a1 + 1116) = v6;
  *(void *)(a1 + 200) = v5;
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 120) = v3;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(unsigned char *)(a1 + 850) = 1;
  *(unsigned char *)(a1 + 847) = 1;
  *(void *)(a1 + 104) = e1000_get_bus_info_pcie_generic;
  *(void *)(a1 + 152) = sub_10002F274;
  *(void *)(a1 + 160) = sub_10002F518;
  *(void *)(a1 + 192) = sub_10002FA68;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  *(void *)(a1 + 96) = sub_10002FA90;
  *(void *)(a1 + 240) = sub_10002FB6C;
  *(void *)(a1 + 48) = e1000_id_led_init_generic;
  *(void *)(a1 + 208) = e1000_setup_led_generic;
  *(void *)(a1 + 80) = e1000_cleanup_led_generic;
  *(void *)(a1 + 136) = e1000_led_off_generic;
  *(void *)(a1 + 88) = sub_10002FBC4;
  int v7 = *(_DWORD *)(a1 + 284);
  if ((v7 - 16) >= 2)
  {
    if (v7 == 15)
    {
      *(void *)(a1 + 112) = e1000_set_lan_id_single_port;
      *(void *)(a1 + 64) = e1000_check_mng_mode_generic;
      *(void *)(a1 + 128) = e1000_led_on_generic;
      *(void *)(a1 + 56) = e1000_blink_led_generic;
      *(unsigned char *)(a1 + 848) = 1;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B54uLL, &readData);
      __dmb(1u);
      *(unsigned char *)(a1 + 849) = (readData & 0xE) != 0;
      int v7 = *(_DWORD *)(a1 + 284);
    }
    else
    {
      *(void *)(a1 + 64) = e1000_check_mng_mode_generic;
      *(void *)(a1 + 128) = e1000_led_on_generic;
      *(void *)(a1 + 56) = e1000_blink_led_generic;
      *(unsigned char *)(a1 + 848) = 1;
    }
  }
  else
  {
    *(void *)(a1 + 112) = e1000_set_lan_id_single_port;
    *(void *)(a1 + 64) = sub_10002FF38;
    *(void *)(a1 + 128) = sub_10002FF80;
  }
  if ((v7 - 13) > 1) {
    goto LABEL_19;
  }
  uint32_t v12 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B58uLL, &v12);
  __dmb(1u);
  uint32_t v8 = v12;
  if ((v12 & 2) == 0)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B58uLL, v8 | 2);
LABEL_19:
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &v11);
    __dmb(1u);
    uint32_t v9 = v11;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, v9 & 0xFFFFFFFE);
  }
  *(_DWORD *)(a1 + 1380) = 0;
  return 0;
}

uint64_t sub_10002E7C0(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  __int16 v3 = 8;
  *(_WORD *)(a1 + 1238) = 8;
  *(_WORD *)(a1 + 1234) = 1;
  int v4 = *(_DWORD *)(a1 + 1220);
  if (v4 == 1)
  {
    *(_WORD *)(a1 + 1240) = 8;
  }
  else if (v4 == 2)
  {
    *(_WORD *)(a1 + 1240) = 32;
    __int16 v3 = 16;
  }
  else
  {
    if ((v2 & 0x400) != 0) {
      __int16 v5 = 32;
    }
    else {
      __int16 v5 = 8;
    }
    *(_WORD *)(a1 + 1240) = v5;
    if ((v2 & 0x400) != 0) {
      __int16 v3 = 16;
    }
    else {
      __int16 v3 = 8;
    }
  }
  *(_WORD *)(a1 + 1236) = v3;
  int v6 = *(_DWORD *)(a1 + 284);
  if ((v6 - 15) <= 2 && (v2 & 0x18000) == 0x18000)
  {
    *(_DWORD *)(a1 + 1216) = 4;
    *(_WORD *)(a1 + 1232) = 2048;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v2 & 0xFFEFFFFF);
    int v6 = *(_DWORD *)(a1 + 284);
  }
  else
  {
    *(_DWORD *)(a1 + 1216) = 2;
    if (((v2 >> 11) & 8) != 0) {
      char v7 = 8;
    }
    else {
      char v7 = (v2 >> 11) & 0xF;
    }
    *(_WORD *)(a1 + 1232) = 1 << (v7 + 6);
  }
  unsigned int v8 = v6 & 0xFFFFFFFE;
  BOOL v9 = v8 == 16;
  if (v8 == 16) {
    uint64_t v10 = sub_1000300F0;
  }
  else {
    uint64_t v10 = sub_100030158;
  }
  uint32_t v11 = sub_1000301B8;
  if (v9) {
    uint32_t v11 = sub_100030154;
  }
  *(void *)(a1 + 1152) = v10;
  *(void *)(a1 + 1168) = v11;
  *(void *)(a1 + 1160) = e1000_read_nvm_eerd;
  *(void *)(a1 + 1184) = sub_1000301F0;
  *(void *)(a1 + 1200) = sub_100030378;
  *(void *)(a1 + 1192) = sub_100030444;
  *(void *)(a1 + 1208) = sub_1000304C4;
  return 0;
}

uint64_t sub_10002E9A0(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1116) != 1)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1072) = 1;
    return result;
  }
  *(_DWORD *)(a1 + 1100) = 1;
  *(_WORD *)(a1 + 1122) = 47;
  *(_DWORD *)(a1 + 1108) = 100;
  *(void *)(a1 + 920) = e1000_check_reset_block_generic;
  *(void *)(a1 + 1008) = e1000_phy_hw_reset_generic;
  *(void *)(a1 + 1016) = sub_100030734;
  *(void *)(a1 + 1024) = e1000_set_d3_lplu_state_generic;
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = sub_100030848;
  int v2 = *(_DWORD *)(a1 + 284);
  if ((v2 - 13) < 2)
  {
    *(_DWORD *)(a1 + 1072) = 4;
    *(void *)(a1 + 944) = sub_1000308B4;
    *(void *)(a1 + 960) = e1000_get_phy_info_igp;
    *(void *)(a1 + 912) = e1000_check_polarity_igp;
    *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_igp;
    *(void *)(a1 + 952) = e1000_get_cable_length_igp_2;
    __int16 v3 = e1000_read_phy_reg_igp;
    *(void *)(a1 + 976) = e1000_read_phy_reg_igp;
    *(void *)(a1 + 1032) = e1000_write_phy_reg_igp;
    *(void *)(a1 + 896) = sub_1000305BC;
    *(void *)(a1 + 1000) = sub_1000306D4;
  }
  else
  {
    if ((v2 - 16) >= 2)
    {
      if (v2 != 15) {
        return 4294967294;
      }
      *(_DWORD *)(a1 + 1072) = 2;
      *(void *)(a1 + 944) = e1000_get_cfg_done_generic;
      *(void *)(a1 + 960) = e1000_get_phy_info_m88;
      *(void *)(a1 + 912) = e1000_check_polarity_m88;
      *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
      *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_m88;
      *(void *)(a1 + 952) = e1000_get_cable_length_m88;
      *(void *)(a1 + 976) = e1000_read_phy_reg_m88;
      *(void *)(a1 + 1032) = e1000_write_phy_reg_m88;
      *(void *)(a1 + 896) = sub_1000305BC;
      *(void *)(a1 + 1000) = sub_1000306D4;
      uint64_t result = e1000_get_phy_id(a1);
      if (result) {
        return result;
      }
      goto LABEL_10;
    }
    *(_DWORD *)(a1 + 1072) = 8;
    *(void *)(a1 + 944) = e1000_get_cfg_done_generic;
    *(void *)(a1 + 960) = e1000_get_phy_info_m88;
    *(void *)(a1 + 912) = e1000_check_polarity_m88;
    *(void *)(a1 + 928) = e1000_phy_sw_reset_generic;
    *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_m88;
    *(void *)(a1 + 952) = e1000_get_cable_length_m88;
    __int16 v3 = e1000_read_phy_reg_bm2;
    *(void *)(a1 + 976) = e1000_read_phy_reg_bm2;
    *(void *)(a1 + 1032) = e1000_write_phy_reg_bm2;
    *(void *)(a1 + 896) = sub_1000300F0;
    *(void *)(a1 + 1000) = sub_100030154;
    *(void *)(a1 + 1016) = sub_100030920;
    *(void *)(a1 + 1024) = sub_100030998;
  }
  unsigned __int16 v9 = 0;
  if ((v2 - 16) >= 2)
  {
    if ((v2 - 13) <= 1)
    {
      *(_DWORD *)(a1 + 1104) = 44565376;
      goto LABEL_10;
    }
    return 4294967294;
  }
  uint64_t result = v3(a1, 2u, &v9);
  if (result) {
    return result;
  }
  *(_DWORD *)(a1 + 1104) = v9 << 16;
  IODelay(0x14uLL);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 976))(a1, 3, &v9);
  if (result) {
    return result;
  }
  char v8 = v9;
  *(_DWORD *)(a1 + 1104) |= v9;
  *(_DWORD *)(a1 + 1112) = v8 & 0xF;
LABEL_10:
  int v5 = *(_DWORD *)(a1 + 284);
  uint64_t result = 4294967294;
  if ((v5 - 13) < 2)
  {
    if (*(_DWORD *)(a1 + 1104) == 44565376) {
      return 0;
    }
    else {
      return 4294967294;
    }
  }
  else
  {
    if ((v5 - 16) >= 2)
    {
      if (v5 != 15) {
        return result;
      }
      int v6 = *(_DWORD *)(a1 + 1104);
      int v7 = 21040320;
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 1104);
      int v7 = 21040305;
    }
    if (v6 == v7) {
      return 0;
    }
    else {
      return 4294967294;
    }
  }
}

BOOL e1000_check_phy_82574(uint64_t a1)
{
  int v4 = 0;
  int v2 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 21, &v4);
  BOOL result = 0;
  if (!v2) {
    return (__int16)v4 == -1
  }
        && !(*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 10, (char *)&v4 + 2)
        && BYTE2(v4) == 0xFF;
  return result;
}

BOOL e1000_get_laa_state_82571(uint64_t a1)
{
  return *(_DWORD *)(a1 + 284) == 13 && *(unsigned char *)(a1 + 1376) != 0;
}

uint64_t e1000_set_laa_state_82571(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 284) == 13)
  {
    *(unsigned char *)(result + 1376) = a2;
    if (a2) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 232))(result, result + 272, *(unsigned __int16 *)(result + 844) - 1);
    }
  }
  return result;
}

uint64_t sub_10002EF10(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 284) - 13) <= 1)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x24uLL, 0x400u);
  }
  return e1000_setup_fiber_serdes_link_generic(a1);
}

uint64_t sub_10002EF6C(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  char v3 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
  __dmb(1u);
  if ((readData & 0x48000000) != 0x40000000)
  {
    if ((readData & 0x40000000) != 0)
    {
      int v6 = 5;
      while (1)
      {
        IODelay(0xAuLL);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x180uLL, &readData);
        __dmb(1u);
        if ((~readData & 0x60000000) != 0 && (readData & 0x8000000) != 0) {
          break;
        }
        if (!--v6)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, &readData);
          __dmb(1u);
          uint32_t v8 = readData | 0x80000000;
          __dmb(2u);
          unsigned __int16 v9 = *(IOPCIDevice **)(a1 + 16);
          uint64_t v10 = 376;
          goto LABEL_29;
        }
      }
    }
    uint64_t result = 0;
    *(unsigned char *)(a1 + 860) = 0;
    goto LABEL_9;
  }
  int v4 = *(_DWORD *)(a1 + 856);
  if (v4 == 1)
  {
    if ((readData & 0x20000000) == 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312) & 0x7FFFFFFF);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x41);
      uint64_t result = e1000_config_fc_after_link_up_generic(a1);
      if (result) {
        return result;
      }
      int v11 = 3;
      goto LABEL_26;
    }
    uint64_t result = 0;
    if ((v3 & 2) != 0)
    {
      int v11 = 2;
LABEL_26:
      *(_DWORD *)(a1 + 856) = v11;
      goto LABEL_27;
    }
LABEL_9:
    *(_DWORD *)(a1 + 856) = 0;
    return result;
  }
  if (v4 == 3)
  {
    if ((readData & 0x20000000) == 0) {
      goto LABEL_22;
    }
LABEL_28:
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x178uLL, *(_DWORD *)(a1 + 312));
    __dmb(2u);
    unsigned __int16 v9 = *(IOPCIDevice **)(a1 + 16);
    uint32_t v8 = v2 & 0xFFFFFFBF;
    uint64_t v10 = 0;
LABEL_29:
    IOPCIDevice::MemoryWrite32(v9, 0, v10, v8);
    goto LABEL_30;
  }
  if (v4 != 2) {
    goto LABEL_28;
  }
  if ((v3 & 2) != 0)
  {
LABEL_22:
    uint64_t result = 0;
LABEL_27:
    *(unsigned char *)(a1 + 860) = 1;
    return result;
  }
LABEL_30:
  uint64_t result = 0;
  *(_DWORD *)(a1 + 856) = 1;
  *(unsigned char *)(a1 + 860) = 0;
  return result;
}

uint64_t sub_10002F1C8(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  int v3 = *(_DWORD *)(a1 + 1072);
  switch(v3)
  {
    case 8:
      goto LABEL_4;
    case 4:
      uint64_t result = e1000_copper_link_setup_igp(a1);
      if (result) {
        return result;
      }
      return e1000_setup_copper_link_generic(a1);
    case 2:
LABEL_4:
      uint64_t result = e1000_copper_link_setup_m88(a1);
      if (result) {
        return result;
      }
      return e1000_setup_copper_link_generic(a1);
  }
  return 4294967294;
}

uint64_t sub_10002F274(uint64_t a1)
{
  int v2 = e1000_disable_pcie_primary_generic(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData & 0xFFFFFFFD;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x2710uLL);
  if ((*(_DWORD *)(a1 + 284) - 15) <= 2) {
    int v2 = sub_10003003C(a1);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v4 | 0x4000000);
  int v5 = *(_DWORD *)(a1 + 284);
  if (((v5 - 16) < 2 || v5 == 15) && !v2) {
    sub_1000300F4(a1);
  }
  if (*(_DWORD *)(a1 + 1216) == 4)
  {
    IODelay(0xAuLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v6 = readData | 0x2000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v6);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
  }
  uint64_t result = e1000_get_auto_rd_done_generic(a1);
  if (!result)
  {
    int v8 = *(_DWORD *)(a1 + 284);
    if ((v8 - 15) >= 3)
    {
      if ((v8 - 13) <= 1)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
        __dmb(1u);
        uint32_t v9 = readData & 0xFFFFFF3F;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v9);
      }
    }
    else
    {
      IODelay(0x61A8uLL);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
    __dmb(1u);
    if (*(_DWORD *)(a1 + 284) == 13)
    {
      uint64_t result = e1000_check_alt_mac_addr_generic(a1);
      if (result) {
        return result;
      }
      if (*(_DWORD *)(a1 + 284) == 13)
      {
        *(unsigned char *)(a1 + 1376) = 1;
        (*(void (**)(uint64_t, uint64_t, void))(a1 + 232))(a1, a1 + 272, *(unsigned __int16 *)(a1 + 844) - 1);
      }
    }
    uint64_t result = 0;
    if (*(_DWORD *)(a1 + 1116) == 3) {
      *(_DWORD *)(a1 + 856) = 0;
    }
  }
  return result;
}

uint64_t sub_10002F518(uint64_t a1)
{
  unsigned __int16 v2 = *(_WORD *)(a1 + 844);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData | 0x400000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, v4);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, &readData);
  __dmb(1u);
  uint32_t v5 = readData & 0x87FFFFFF;
  int v6 = *(_DWORD *)(a1 + 284);
  if ((v6 - 13) <= 1) {
    uint32_t v5 = readData & 0x807FFFFF | 0x7800000;
  }
  if ((v6 - 16) >= 2) {
    uint32_t v7 = v5;
  }
  else {
    uint32_t v7 = readData & 0x83FFFFFF | 0x4000000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3840uLL, v7);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, &readData);
  __dmb(1u);
  int v8 = *(_DWORD *)(a1 + 284);
  if ((v8 - 13) <= 1)
  {
    uint32_t v9 = readData;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
    __dmb(1u);
    uint32_t v10 = (readData & 0x10000000 | v9 & 0x88BFFFFF) ^ 0x17400000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3940uLL, v10);
    int v8 = *(_DWORD *)(a1 + 284);
  }
  if ((v8 - 15) <= 2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
    __dmb(1u);
    uint32_t v11 = readData & 0xDFFFFFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v11);
    int v8 = *(_DWORD *)(a1 + 284);
    if ((v8 - 15) <= 2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
      __dmb(1u);
      uint32_t v12 = readData & 0xFF3FFFFF | 0x400000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v12);
      int v8 = *(_DWORD *)(a1 + 284);
    }
  }
  if (v8 == 13)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1100uLL, &readData);
    __dmb(1u);
    uint32_t v13 = readData | 1;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x1100uLL, v13);
    int v8 = *(_DWORD *)(a1 + 284);
  }
  if ((v8 - 13) <= 1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, &readData);
    __dmb(1u);
    uint32_t v14 = readData & 0xFFF7FFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x18uLL, v14);
    int v8 = *(_DWORD *)(a1 + 284);
  }
  if (v8 <= 15)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, &readData);
    __dmb(1u);
    uint32_t v15 = readData | 0x30000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5008uLL, v15);
    int v8 = *(_DWORD *)(a1 + 284);
  }
  if ((v8 & 0xFFFFFFFE) == 0x10)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, &readData);
    __dmb(1u);
    uint32_t v16 = readData | 0x400000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, v16);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B64uLL, &readData);
    __dmb(1u);
    uint32_t v17 = readData | 1;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B64uLL, v17);
  }
  (*(void (**)(uint64_t))(a1 + 48))(a1);
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  if (*(_DWORD *)(a1 + 284) == 13) {
    v2 += (char)-*(unsigned char *)(a1 + 1376);
  }
  e1000_init_rx_addrs_generic(a1, v2);
  if (*(_WORD *)(a1 + 326))
  {
    int v18 = 0;
    unsigned int v19 = 0;
    do
    {
      __dmb(2u);
      if (v18 == 512)
      {
        if (*(int *)(a1 + 284) <= 1) {
          unsigned int v20 = 64;
        }
        else {
          unsigned int v20 = 21504;
        }
      }
      else if (v18)
      {
        if (v18 == 1024)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v20 = 1536;
          }
          else {
            unsigned int v20 = 22016;
          }
        }
        else
        {
          unsigned int v20 = v18 + 20992;
        }
      }
      else if (*(int *)(a1 + 284) <= 1)
      {
        unsigned int v20 = 512;
      }
      else
      {
        unsigned int v20 = 20992;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v20, 0);
      ++v19;
      v18 += 4;
    }
    while (v19 < *(unsigned __int16 *)(a1 + 326));
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &readData);
  __dmb(1u);
  uint32_t v22 = readData & 0xFE80FFFF | 0x1410000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v22);
  int v23 = *(_DWORD *)(a1 + 284);
  if ((v23 - 16) >= 2)
  {
    if (v23 != 15)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3928uLL, &readData);
      __dmb(1u);
      uint32_t v24 = readData & 0xFE80FFFF | 0x1410000;
      __dmb(2u);
      uint32_t v25 = *(IOPCIDevice **)(a1 + 16);
      uint64_t v26 = 14632;
      goto LABEL_42;
    }
    e1000_enable_tx_pkt_filtering_generic(a1);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B00uLL, &readData);
  __dmb(1u);
  uint32_t v24 = readData | 0x8000000;
  __dmb(2u);
  uint32_t v25 = *(IOPCIDevice **)(a1 + 16);
  uint64_t v26 = 23296;
LABEL_42:
  IOPCIDevice::MemoryWrite32(v25, 0, v26, v24);
  sub_10002FBC4(a1);
  return v21;
}

uint64_t sub_10002FA68(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 284) - 15) <= 2 && *(_DWORD *)(a1 + 884) == 255) {
    *(_DWORD *)(a1 + 884) = 3;
  }
  return e1000_setup_link_generic(a1);
}

void sub_10002FA90(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 284) - 15) > 2)
  {
    int v3 = 0;
    int v4 = 0;
  }
  else
  {
    unsigned int v2 = *(unsigned __int16 *)(a1 + 1366);
    if (*(_WORD *)(a1 + 1366)) {
      int v3 = 1 << v2;
    }
    else {
      int v3 = 0;
    }
    if (*(_WORD *)(a1 + 1366)) {
      int v4 = (v2 >> 5) & 0x7F;
    }
    else {
      int v4 = 0;
    }
  }
  int v5 = 0;
  int v6 = 4 * v4;
  do
  {
    if (v6 == v5) {
      uint32_t v7 = v3;
    }
    else {
      uint32_t v7 = 0;
    }
    __dmb(2u);
    if (v5)
    {
      unsigned int v8 = v5 + 22016;
    }
    else if (*(int *)(a1 + 284) <= 1)
    {
      unsigned int v8 = 1536;
    }
    else
    {
      unsigned int v8 = 22016;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v8, v7);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    v5 += 4;
  }
  while (v5 != 512);
}

uint64_t sub_10002FB6C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 284) != 13 || (uint64_t result = e1000_check_alt_mac_addr_generic(a1), !result))
  {
    return e1000_read_mac_addr_generic(a1);
  }
  return result;
}

void sub_10002FBC4(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4100uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4124uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4104uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4108uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x410CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4110uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4118uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x411CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4120uLL, &readData);
  __dmb(1u);
}

BOOL sub_10002FF38(uint64_t a1)
{
  __int16 v4 = 0;
  int v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 15, 1, &v4);
  return (v4 & 0x6000) != 0 && v1 == 0;
}

uint64_t sub_10002FF80(uint64_t a1)
{
  uint32_t v2 = *(_DWORD *)(a1 + 300);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  if ((readData & 2) == 0)
  {
    int v3 = (const float *)(a1 + 300);
    uint32x4_t v4 = (uint32x4_t)vld1q_dup_f32(v3);
    v5.i64[0] = 0xFF000000FFLL;
    v5.i64[1] = 0xFF000000FFLL;
    int32x4_t v6 = (int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v4, (uint32x4_t)xmmword_100033F80), v5);
    v5.i64[0] = 0xE0000000ELL;
    v5.i64[1] = 0xE0000000ELL;
    int8x16_t v7 = vandq_s8((int8x16_t)vceqq_s32(v6, (int32x4_t)v5), (int8x16_t)xmmword_1000341A0);
    int8x8_t v8 = vorr_s8(vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)v2), (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL));
    uint32_t v2 = v8.i32[0] | v8.i32[1];
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, v2);
  return 0;
}

uint64_t sub_10003003C(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  int v3 = 10;
  while (1)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v2 | 0x20);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &v5);
    __dmb(1u);
    uint32_t v2 = v5;
    if ((v5 & 0x20) != 0) {
      break;
    }
    IODelay(0x7D0uLL);
    if (!--v3)
    {
      sub_1000300F4(a1);
      return 4294967294;
    }
  }
  return 0;
}

void sub_1000300F4(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFDF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF00uLL, v2);
}

uint64_t sub_100030158(uint64_t a1)
{
  if (sub_1000305BC(a1)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 284) == 15) {
    return 0;
  }
  uint64_t v2 = e1000_acquire_nvm_generic(a1);
  if (v2) {
    sub_1000306D4(a1);
  }
  return v2;
}

void sub_1000301B8(uint64_t a1)
{
  e1000_release_nvm_generic(a1);
  sub_1000306D4(a1);
}

uint64_t sub_1000301F0(uint64_t a1)
{
  uint64_t result = e1000_update_nvm_checksum_generic(a1);
  if (!result)
  {
    if (*(_DWORD *)(a1 + 1216) == 4)
    {
      unsigned int v3 = 0;
      while (1)
      {
        IODelay(0x3E8uLL);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
        __dmb(1u);
        if ((readData & 0x80000) == 0) {
          break;
        }
        BOOL v4 = v3++ >= 0x7CF;
        if (v4) {
          return 0xFFFFFFFFLL;
        }
      }
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x103CuLL, &readData);
      __dmb(1u);
      if (BYTE1(readData) << 8 == 56064)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, 0x40u);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
        __dmb(1u);
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x8F00uLL, 0x80u);
      }
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
      __dmb(1u);
      uint32_t v5 = readData | 0x80000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, v5);
      unsigned int v6 = 0;
      while (1)
      {
        IODelay(0x3E8uLL);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
        __dmb(1u);
        if ((readData & 0x80000) == 0) {
          break;
        }
        BOOL v4 = v6++ >= 0x7CF;
        if (v4)
        {
          unsigned int v6 = 2000;
          break;
        }
      }
      if (v6 == 2000) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100030378(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1216) == 4)
  {
    __int16 v3 = 0;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 16, 1, &v3)
      && (v3 & 0x10) == 0
      && !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 35, 1, &v3)
      && (v3 & 0x80000000) == 0)
    {
      v3 |= 0x8000u;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1208))(a1, 35, 1, &v3)) {
        (*(void (**)(uint64_t))(a1 + 1184))(a1);
      }
    }
  }
  return e1000_validate_nvm_checksum_generic(a1);
}

uint64_t sub_100030444(uint64_t a1, __int16 *a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1160))(a1, 4, 1, a2);
  if (!result)
  {
    int v5 = (unsigned __int16)*a2;
    if ((*(_DWORD *)(a1 + 284) - 15) <= 2)
    {
      if (v5 != 63302) {
        return result;
      }
      __int16 v6 = 6161;
      goto LABEL_11;
    }
    if (v5 == 0xFFFF || v5 == 0)
    {
      __int16 v6 = -30447;
LABEL_11:
      *a2 = v6;
    }
  }
  return result;
}

uint64_t sub_1000304C4(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  BOOL v4 = (unsigned __int16 *)a4;
  int v6 = *(_DWORD *)(a1 + 284);
  if ((v6 - 15) >= 3)
  {
    if ((v6 - 13) >= 2) {
      return 0xFFFFFFFFLL;
    }
    return e1000_write_nvm_spi(a1, a2, a3, a4);
  }
  else
  {
    unsigned int v7 = *(unsigned __int16 *)(a1 + 1232);
    BOOL v8 = v7 >= a2;
    signed int v9 = v7 - a2;
    if (v9 == 0 || !v8) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = 0xFFFFFFFFLL;
    if (a3 && v9 >= (int)a3)
    {
      int v11 = 4 * a2;
      uint64_t v12 = a3;
      while (1)
      {
        int v14 = *v4++;
        int v13 = v14;
        uint64_t result = e1000_poll_eerd_eewr_done(a1, 1);
        if (result) {
          break;
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x102CuLL, v11 | (v13 << 16) | 1);
        uint64_t result = e1000_poll_eerd_eewr_done(a1, 1);
        if (result) {
          break;
        }
        v11 += 4;
        if (!--v12) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000305BC(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(a1 + 1232);
  int v3 = v2 + 1;
  if (*(_DWORD *)(a1 + 1380) <= 2u) {
    int v4 = v2 + 1;
  }
  else {
    int v4 = 1;
  }
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &readData);
    __dmb(1u);
    if ((readData & 1) == 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v4) {
      goto LABEL_8;
    }
  }
  if (v4) {
    goto LABEL_9;
  }
LABEL_8:
  ++*(_DWORD *)(a1 + 1380);
LABEL_9:
  while (1)
  {
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &v8);
    __dmb(1u);
    uint32_t v5 = v8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, v5 | 2);
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &v7);
    __dmb(1u);
    if ((v7 & 2) != 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v3) {
      goto LABEL_14;
    }
  }
  if (v3) {
    return 0;
  }
LABEL_14:
  sub_1000306D4(a1);
  return 0xFFFFFFFFLL;
}

void sub_1000306D4(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFFC;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5B50uLL, v2);
}

uint64_t sub_100030734(uint64_t a1, int a2)
{
  uint32_t v2 = *(uint64_t (**)(void))(a1 + 976);
  if (v2)
  {
    __int16 v8 = 0;
    uint64_t result = v2();
    if (result) {
      return result;
    }
    if (a2)
    {
      v8 |= 2u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
      if (result) {
        return result;
      }
      goto LABEL_10;
    }
    v8 &= ~2u;
    (*(void (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 25);
    int v6 = *(_DWORD *)(a1 + 1096);
    if (v6 == 2)
    {
LABEL_10:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v8);
      if (result) {
        return result;
      }
      __int16 v7 = v8 & 0xFF7F;
LABEL_12:
      __int16 v8 = v7;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
      if (result) {
        return result;
      }
      return 0;
    }
    if (v6 == 1)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v8);
      if (result) {
        return result;
      }
      __int16 v7 = v8 | 0x80;
      goto LABEL_12;
    }
  }
  return 0;
}

void sub_100030848(uint64_t a1)
{
  if (*(void *)(a1 + 920)
    && ((*(uint64_t (**)(void))(a1 + 64))() & 1) == 0
    && !(*(unsigned int (**)(uint64_t))(a1 + 920))(a1))
  {
    e1000_power_down_phy_copper(a1);
  }
}

uint64_t sub_1000308B4(uint64_t a1)
{
  int v2 = -100;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1010uLL, &readData);
    __dmb(1u);
    if ((readData & 0x40000) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
    if (__CFADD__(v2++, 1)) {
      return 4294967287;
    }
  }
  return 0;
}

uint64_t sub_100030920(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xFFFFFFFD;
  if (a2) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v4 | v5);
  return 0;
}

uint64_t sub_100030998(uint64_t a1, char a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, &readData);
  __dmb(1u);
  if (a2)
  {
    unsigned int v4 = *(unsigned __int16 *)(a1 + 1120);
    BOOL v5 = v4 > 0x2F;
    uint64_t v6 = (1 << v4) & 0x800000008008;
    if (v5 || v6 == 0) {
      uint32_t v8 = readData;
    }
    else {
      uint32_t v8 = readData | 4;
    }
  }
  else
  {
    uint32_t v8 = readData & 0xFFFFFFFB;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xF10uLL, v8);
  return 0;
}

void *e1000_init_function_pointers_82541(void *result)
{
  result[5] = sub_100030A70;
  result[143] = sub_100030BE8;
  result[111] = sub_100030E74;
  return result;
}

uint64_t sub_100030A70(uint64_t a1)
{
  *(_DWORD *)(a1 + 1116) = 1;
  *(_WORD *)(a1 + 326) = 128;
  *(_WORD *)(a1 + 844) = 15;
  *(unsigned char *)(a1 + 850) = 1;
  *(void *)(a1 + 104) = e1000_get_bus_info_pci_generic;
  *(void *)(a1 + 112) = e1000_set_lan_id_single_port;
  *(void *)(a1 + 152) = sub_1000313A4;
  *(void *)(a1 + 160) = sub_100031594;
  *(void *)(a1 + 192) = e1000_setup_link_generic;
  *(void *)(a1 + 200) = sub_100031770;
  *(void *)(a1 + 72) = sub_100031870;
  *(void *)(a1 + 120) = sub_100031918;
  *(void *)(a1 + 144) = e1000_update_mc_addr_list_generic;
  *(void *)(a1 + 216) = e1000_write_vfta_generic;
  *(void *)(a1 + 96) = e1000_clear_vfta_generic;
  *(void *)(a1 + 48) = e1000_id_led_init_generic;
  *(void *)(a1 + 208) = sub_1000319E4;
  *(void *)(a1 + 80) = sub_100031A58;
  *(void *)(a1 + 128) = e1000_led_on_generic;
  *(void *)(a1 + 136) = e1000_led_off_generic;
  *(void *)(a1 + 88) = sub_100031AB0;
  return 0;
}

uint64_t sub_100030BE8(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x10uLL, &readData);
  __dmb(1u);
  __int16 v2 = readData;
  __int16 v3 = 1024;
  switch(*(_DWORD *)(a1 + 1220))
  {
    case 1:
      __int16 v3 = 0;
      goto LABEL_3;
    case 2:
LABEL_3:
      *(_DWORD *)(a1 + 1216) = 2;
      __int16 v2 = v3;
      goto LABEL_4;
    case 3:
      *(_DWORD *)(a1 + 1216) = 3;
      v2 &= ~0x200u;
      goto LABEL_20;
    case 4:
      *(_DWORD *)(a1 + 1216) = 3;
      v2 |= 0x200u;
      goto LABEL_20;
    default:
      if ((readData & 0x2000) != 0) {
        int v9 = 2;
      }
      else {
        int v9 = 3;
      }
      *(_DWORD *)(a1 + 1216) = v9;
      if ((v2 & 0x2000) != 0)
      {
LABEL_4:
        unsigned __int16 v13 = 0;
        BOOL v4 = (v2 & 0x400) == 0;
        if ((v2 & 0x400) != 0) {
          __int16 v5 = 16;
        }
        else {
          __int16 v5 = 8;
        }
        *(_WORD *)(a1 + 1236) = v5;
        *(_WORD *)(a1 + 1238) = 8;
        if (v4) {
          __int16 v6 = 8;
        }
        else {
          __int16 v6 = 32;
        }
        *(_WORD *)(a1 + 1240) = v6;
        *(void *)(a1 + 1152) = e1000_acquire_nvm_generic;
        *(void *)(a1 + 1160) = e1000_read_nvm_spi;
        *(void *)(a1 + 1168) = e1000_release_nvm_generic;
        *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
        *(void *)(a1 + 1192) = e1000_valid_led_default_generic;
        *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
        *(void *)(a1 + 1208) = e1000_write_nvm_spi;
        *(_DWORD *)(a1 + 1232) = 65600;
        uint64_t result = e1000_read_nvm_spi(a1, 0x12u, 1, &v13);
        if (!result)
        {
          uint64_t result = 0;
          int v8 = (v13 >> 10) & 7;
          if (v8) {
            *(_WORD *)(a1 + 1232) = 128 << v8;
          }
        }
      }
      else
      {
LABEL_20:
        uint64_t result = 0;
        BOOL v10 = (v2 & 0x400) == 0;
        if ((v2 & 0x400) != 0) {
          __int16 v11 = 8;
        }
        else {
          __int16 v11 = 6;
        }
        *(_WORD *)(a1 + 1236) = v11;
        *(_WORD *)(a1 + 1234) = 50;
        *(_WORD *)(a1 + 1238) = 3;
        if (v10) {
          __int16 v12 = 64;
        }
        else {
          __int16 v12 = 256;
        }
        *(_WORD *)(a1 + 1232) = v12;
        *(void *)(a1 + 1152) = e1000_acquire_nvm_generic;
        *(void *)(a1 + 1160) = e1000_read_nvm_microwire;
        *(void *)(a1 + 1168) = e1000_release_nvm_generic;
        *(void *)(a1 + 1184) = e1000_update_nvm_checksum_generic;
        *(void *)(a1 + 1192) = e1000_valid_led_default_generic;
        *(void *)(a1 + 1200) = e1000_validate_nvm_checksum_generic;
        *(void *)(a1 + 1208) = e1000_write_nvm_microwire;
      }
      return result;
  }
}

uint64_t sub_100030E74(uint64_t a1)
{
  *(_DWORD *)(a1 + 1100) = 1;
  *(_WORD *)(a1 + 1122) = 47;
  *(_DWORD *)(a1 + 1108) = 10000;
  *(_DWORD *)(a1 + 1072) = 3;
  *(void *)(a1 + 912) = e1000_check_polarity_igp;
  *(void *)(a1 + 936) = e1000_phy_force_speed_duplex_igp;
  *(void *)(a1 + 952) = sub_10003236C;
  *(void *)(a1 + 944) = e1000_get_cfg_done_generic;
  *(void *)(a1 + 960) = e1000_get_phy_info_igp;
  *(void *)(a1 + 976) = e1000_read_phy_reg_igp;
  *(void *)(a1 + 1008) = sub_100032478;
  *(void *)(a1 + 1024) = sub_10003250C;
  *(void *)(a1 + 1032) = e1000_write_phy_reg_igp;
  *(void *)(a1 + 1056) = e1000_power_up_phy_copper;
  *(void *)(a1 + 1064) = sub_100032688;
  uint64_t result = e1000_get_phy_id(a1);
  if (!result)
  {
    if (*(_DWORD *)(a1 + 1104) == 44565376) {
      return 0;
    }
    else {
      return 4294967294;
    }
  }
  return result;
}

uint64_t e1000_init_script_state_82541(uint64_t result, char a2)
{
  if (*(_DWORD *)(result + 1072) == 3) {
    *(unsigned char *)(result + 1400) = a2;
  }
  return result;
}

uint64_t e1000_fifo_workaround_82547(uint64_t a1, __int16 a2)
{
  if (*(_DWORD *)(a1 + 284) != 11
    || ((a2 + 31) & 0xFFF0u) < 0x3F1
    || *(_DWORD *)(a1 + 1384) + ((a2 + 31) & 0xFFF0u) < *(_DWORD *)(a1 + 1392) + 992)
  {
    return 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3818uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  uint32_t readData = 0;
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v5 = 1072;
  }
  else {
    uint64_t v5 = 14352;
  }
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v5, &readData);
  __dmb(1u);
  if (v4 != readData) {
    return 4294967288;
  }
  uint32_t readData = 0;
  uint64_t v6 = *(int *)(a1 + 284) <= 1 ? 32792 : 13336;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v6, &readData);
  __dmb(1u);
  uint32_t v7 = readData;
  uint32_t readData = 0;
  uint64_t v8 = *(int *)(a1 + 284) <= 1 ? 32784 : 13328;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, v8, &readData);
  __dmb(1u);
  if (v7 != readData) {
    return 4294967288;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3428uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3420uLL, &readData);
  __dmb(1u);
  if (v9 != readData) {
    return 4294967288;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, &readData);
  __dmb(1u);
  uint32_t v10 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v10 & 0xFFFFFFFD);
  __dmb(2u);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v11 = 32792;
  }
  else {
    uint64_t v11 = 13336;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v11, *(_DWORD *)(a1 + 1388));
  __dmb(2u);
  if (*(int *)(a1 + 284) <= 1) {
    uint64_t v12 = 32784;
  }
  else {
    uint64_t v12 = 13328;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v12, *(_DWORD *)(a1 + 1388));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3428uLL, *(_DWORD *)(a1 + 1388));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3420uLL, *(_DWORD *)(a1 + 1388));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, v10);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  *(_DWORD *)(a1 + 1384) = 0;
  return result;
}

_DWORD *e1000_update_tx_fifo_head_82547(_DWORD *result, int a2)
{
  if (result[71] == 11)
  {
    unsigned int v2 = result[346] + ((a2 + 31) & 0xFFFFFFF0);
    result[346] = v2;
    unsigned int v3 = result[348];
    BOOL v4 = v2 >= v3;
    unsigned int v5 = v2 - v3;
    if (v5 != 0 && v4) {
      result[346] = v5;
    }
  }
  return result;
}

uint64_t e1000_set_ttl_workaround_state_82541(uint64_t result, char a2)
{
  if ((*(_DWORD *)(result + 284) | 2) == 0xB) {
    *(unsigned char *)(result + 1401) = a2;
  }
  return result;
}

BOOL e1000_ttl_workaround_enabled_82541(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 284) | 2) == 0xB && *(unsigned char *)(a1 + 1401) != 0;
}

uint64_t e1000_igp_ttl_workaround_82547(uint64_t a1)
{
  __int16 v7 = 0;
  if ((*(_DWORD *)(a1 + 284) | 2) != 0xB || !*(unsigned char *)(a1 + 1401)) {
    return 0;
  }
  BOOL v6 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v6);
  if (result) {
    return result;
  }
  unsigned __int16 v3 = *(_WORD *)(a1 + 1396);
  if (v6)
  {
    __int16 v4 = 0;
    uint64_t v5 = 0;
    if (!*(_WORD *)(a1 + 1396)) {
      return 0;
    }
    goto LABEL_16;
  }
  if (*(_WORD *)(a1 + 1396))
  {
LABEL_9:
    if (v3 <= 0xAu)
    {
      if (!v3)
      {
        uint64_t v5 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7987, v5);
      }
      uint64_t v5 = 2 * (v3 & 1u);
      __int16 v4 = v3 + 1;
    }
    else
    {
      __int16 v4 = 0;
      uint64_t v5 = 0;
    }
LABEL_16:
    *(_WORD *)(a1 + 1396) = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7987, v5);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6, &v7);
  if (!result)
  {
    if ((v7 & 0x10) == 0) {
      return 0;
    }
    unsigned __int16 v3 = *(_WORD *)(a1 + 1396) + 1;
    *(_WORD *)(a1 + 1396) = v3;
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_1000313A4(uint64_t a1)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x100uLL, 0);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x400uLL, 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
  __dmb(1u);
  *(_DWORD *)(a1 + 1384) = 0;
  IODelay(0x2710uLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if ((*(_DWORD *)(a1 + 284) | 2) == 0xB)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x80000000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x1388uLL);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2 | 0x4000000);
  IODelay(0x4E20uLL);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData & 0xFFFFDFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, v3);
  if ((*(_DWORD *)(a1 + 284) | 2) == 0xB)
  {
    sub_100031D28(a1);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData & 0xF8FFF0FF | 0x7000300;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, v4);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xD8uLL, 0xFFFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xC0uLL, &readData);
  __dmb(1u);
  return 0;
}

uint64_t sub_100031594(uint64_t a1)
{
  (*(void (**)(void))(a1 + 48))();
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 976))(a1, 20, a1 + 1398);
  if (!v2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x1000uLL, &readData);
    __dmb(1u);
    uint32_t v3 = readData;
    *(_DWORD *)(a1 + 1388) = (unsigned __int16)readData << 7;
    *(_DWORD *)(a1 + 1392) = (v3 >> 6) & 0x3FFFC00;
    (*(void (**)(uint64_t))(a1 + 96))(a1);
    e1000_init_rx_addrs_generic(a1, *(unsigned __int16 *)(a1 + 844));
    if (*(_WORD *)(a1 + 326))
    {
      int v4 = 0;
      unsigned int v5 = 0;
      do
      {
        __dmb(2u);
        if (v4 == 512)
        {
          if (*(int *)(a1 + 284) <= 1) {
            unsigned int v6 = 64;
          }
          else {
            unsigned int v6 = 21504;
          }
        }
        else if (v4)
        {
          if (v4 == 1024)
          {
            if (*(int *)(a1 + 284) <= 1) {
              unsigned int v6 = 1536;
            }
            else {
              unsigned int v6 = 22016;
            }
          }
          else
          {
            unsigned int v6 = v4 + 20992;
          }
        }
        else if (*(int *)(a1 + 284) <= 1)
        {
          unsigned int v6 = 512;
        }
        else
        {
          unsigned int v6 = 20992;
        }
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, v6, 0);
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 8uLL, &v10);
        __dmb(1u);
        ++v5;
        v4 += 4;
      }
      while (v5 < *(unsigned __int16 *)(a1 + 326));
    }
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 192))(a1);
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, &v9);
    __dmb(1u);
    uint32_t v7 = v9 & 0xFEC0FFFF | 0x1010000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0x3828uLL, v7);
    sub_100031AB0(a1);
  }
  return v2;
}

uint64_t sub_100031770(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFE7BF | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0, v2);
  *(unsigned char *)(a1 + 1134) = 0;
  if ((*(_DWORD *)(a1 + 284) | 2) == 0xB)
  {
    *(_DWORD *)(a1 + 1376) = 0;
    *(unsigned char *)(a1 + 1130) = 1;
  }
  else
  {
    *(_DWORD *)(a1 + 1376) = 1;
  }
  uint64_t result = e1000_copper_link_setup_igp(a1);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 851))
    {
      if (*(_DWORD *)(a1 + 1380) == 1) {
        *(_DWORD *)(a1 + 1380) = 0;
      }
    }
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &v5);
    __dmb(1u);
    uint32_t v4 = v5 & 0xF8FFF0FF | 0x7000300;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, v4);
    return e1000_setup_copper_link_generic(a1);
  }
  return result;
}

uint64_t sub_100031870(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 853)) {
    return 0;
  }
  BOOL v3 = 0;
  uint64_t result = e1000_phy_has_link_generic(a1, 1u, 0, &v3);
  if (!result)
  {
    if (v3)
    {
      *(unsigned char *)(a1 + 853) = 0;
      e1000_check_downshift_generic(a1);
      if (*(unsigned char *)(a1 + 851))
      {
        sub_100031FD8(a1, 1);
        (*(void (**)(uint64_t))(a1 + 224))(a1);
        return e1000_config_fc_after_link_up_generic(a1);
      }
      else
      {
        return 4294967293;
      }
    }
    else
    {
      return sub_100031FD8(a1, 0);
    }
  }
  return result;
}

uint64_t sub_100031918(uint64_t a1, __int16 *a2, __int16 *a3)
{
  uint64_t result = e1000_get_speed_and_duplex_copper_generic(a1, a2, a3);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 1135))
    {
      __int16 v8 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 6, &v8);
      if (result) {
        return result;
      }
      if ((v8 & 1) == 0)
      {
LABEL_6:
        uint64_t result = 0;
        *a3 = 1;
        return result;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 5, &v8);
      if (result) {
        return result;
      }
      int v7 = (unsigned __int16)*a2;
      if (v7 == 10)
      {
        if ((v8 & 0x40) == 0) {
          goto LABEL_6;
        }
      }
      else if (v7 == 100 && (v8 & 0x100) == 0)
      {
        goto LABEL_6;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000319E4(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 976))(a1, 20, a1 + 1398);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 20, *(_WORD *)(a1 + 1398) & 0xFFDF);
    if (!result)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, *(_DWORD *)(a1 + 296));
      return 0;
    }
  }
  return result;
}

uint64_t sub_100031A58(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 20, *(unsigned __int16 *)(a1 + 1398));
  if (!v2)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, *(_DWORD *)(a1 + 292));
  }
  return v2;
}

void sub_100031AB0(uint64_t a1)
{
  e1000_clear_hw_cntrs_base_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x400CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x403CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40F8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40FCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x40BCuLL, &readData);
  __dmb(1u);
}

uint64_t sub_100031D28(uint64_t result)
{
  if (*(unsigned char *)(result + 1400))
  {
    uint64_t v1 = result;
    unsigned __int16 v6 = 0;
    IODelay(0x4E20uLL);
    (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(v1 + 976))(v1, 12123, &v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 12123, 3);
    IODelay(0x4E20uLL);
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 1032))(v1, 0, 320);
    IODelay(0x1388uLL);
    switch(*(_DWORD *)(v1 + 284))
    {
      case 9:
      case 0xB:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8085, 1);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8049, 48417);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8057, 24);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 7984, 5632);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 7985, 20);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 7986, 5660);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8084, 3);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8086, 63);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8208, 8);
        break;
      case 0xA:
      case 0xC:
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8051, 153);
        break;
      default:
        break;
    }
    (*(void (**)(uint64_t, void, uint64_t))(v1 + 1032))(v1, 0, 13056);
    IODelay(0x4E20uLL);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 1032))(v1, 12123, v6);
    if (*(_DWORD *)(v1 + 284) == 11)
    {
      __int16 v5 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(v1 + 976))(v1, 8401, &v5);
      if ((v5 & 0x100) == 0)
      {
        (*(void (**)(uint64_t, uint64_t, __int16 *))(v1 + 976))(v1, 8400, &v5);
        unsigned int v2 = v5 & 0x70;
        __int16 v3 = (v5 & 0xF80) - 1280;
        if (v2 != 64) {
          __int16 v3 = v5 & 0xF80;
        }
        __int16 v4 = (v5 & 0xF80) - 128;
        if (v2 >= 0x41) {
          LOWORD(v2) = ((_BYTE)v5 + 112) & 0x70;
        }
        else {
          __int16 v4 = v3;
        }
        __int16 v5 = v4 & 0xF80 | v5 & 0xF000 | v2;
        (*(void (**)(uint64_t, uint64_t))(v1 + 1032))(v1, 8412);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1032))(v1, 8414, 2);
      }
    }
  }
  return result;
}

uint64_t sub_100031FD8(uint64_t a1, int a2)
{
  int v11 = 0;
  int v12 = 0;
  if (a2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, int *))(a1 + 120))(a1, (char *)&v11 + 2, &v11);
    if (result) {
      return result;
    }
    if (HIWORD(v11) == 1000)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 952))(a1);
      if (result) {
        return result;
      }
      if (*(_DWORD *)(a1 + 1376) == 1 && *(unsigned __int16 *)(a1 + 1128) >= 0x32u)
      {
        uint64_t v4 = 0;
        while (1)
        {
          uint64_t v5 = (unsigned __int16)word_1000341B0[v4];
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, v5, (char *)&v12 + 2);
          if (result) {
            return result;
          }
          HIWORD(v12) &= 0x3FFFu;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, v5);
          if (result) {
            return result;
          }
          if (++v4 == 4)
          {
            *(_DWORD *)(a1 + 1376) = 2;
            break;
          }
        }
      }
      if (!*(_DWORD *)(a1 + 1380) && *(unsigned __int16 *)(a1 + 1128) <= 0x31u)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 10, (char *)&v12 + 2);
        if (!result)
        {
          int v6 = 0;
          unsigned int v7 = 0;
          unsigned __int16 v8 = 20;
          while (1)
          {
            IODelay(0x3E8uLL);
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, 10, (char *)&v12 + 2);
            if (result) {
              break;
            }
            v7 += BYTE2(v12);
            if (v7 >= 6)
            {
              *(_DWORD *)(a1 + 1380) = 1;
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7989, 105);
            }
            uint64_t result = 0;
            if (v7) {
              unsigned __int16 v8 = 100;
            }
            if ((unsigned __int16)++v6 >= v8) {
              return result;
            }
          }
        }
        return result;
      }
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 1376) != 2)
  {
LABEL_33:
    if (*(_DWORD *)(a1 + 1380) == 1)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 12123, &v12);
      if (!result)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 12123, 3);
        if (!result)
        {
          IODelay(0x4E20uLL);
          uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 320);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 7989, 42);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 13056);
              if (!result)
              {
                IODelay(0x4E20uLL);
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 12123, (unsigned __int16)v12);
                if (!result) {
                  *(_DWORD *)(a1 + 1380) = 0;
                }
              }
            }
          }
        }
      }
      return result;
    }
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 976))(a1, 12123, &v12);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1032))(a1, 12123, 3);
    if (!result)
    {
      IODelay(0x4E20uLL);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 320);
      if (!result)
      {
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v10 = (unsigned __int16)word_1000341B0[v9];
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 976))(a1, v10, (char *)&v12 + 2);
          if (result) {
            break;
          }
          HIWORD(v12) = HIWORD(v12) & 0x3FFF | 0x8000;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, v10, HIWORD(v12));
          if (result) {
            break;
          }
          if (++v9 == 4)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 1032))(a1, 0, 13056);
            if (!result)
            {
              IODelay(0x4E20uLL);
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1032))(a1, 12123, (unsigned __int16)v12);
              if (!result)
              {
                *(_DWORD *)(a1 + 1376) = 1;
                goto LABEL_33;
              }
            }
            return result;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10003236C(uint64_t a1)
{
  uint64_t v2 = 0;
  unsigned __int16 v3 = 0;
  unsigned __int16 v12 = 0;
  unsigned __int16 v4 = 128;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 976))(a1, (unsigned __int16)word_1000341B8[v2], &v12);
    if (result) {
      break;
    }
    if (((unsigned __int16)(v12 - 16256) >> 8) < 0xC1u) {
      return 4294967294;
    }
    ++v2;
    unsigned int v6 = v12 >> 7;
    v3 += v6;
    if (v4 >= v6) {
      unsigned __int16 v4 = v6;
    }
    if (v2 == 4)
    {
      uint64_t result = 0;
      LODWORD(v7) = (unsigned __int16)(v3 - v4) / 3u;
      if (v3 <= 0xC7u) {
        uint64_t v7 = v7;
      }
      else {
        uint64_t v7 = v3 >> 2;
      }
      unint64_t v8 = v7 - 24;
      __int16 v9 = word_1000341C0[v7];
      unsigned __int16 v10 = v9 - 10;
      if (v8 >= 0x68) {
        unsigned __int16 v10 = 0;
      }
      *(_WORD *)(a1 + 1128) = v10;
      unsigned __int16 v11 = v9 + 10;
      *(_WORD *)(a1 + 1126) = v11;
      *(_WORD *)(a1 + 1124) = (v11 + v10) >> 1;
      return result;
    }
  }
  return result;
}

uint64_t sub_100032478(uint64_t a1)
{
  uint64_t v2 = e1000_phy_hw_reset_generic(a1);
  if (!v2)
  {
    sub_100031D28(a1);
    if ((*(_DWORD *)(a1 + 284) | 2) == 0xB)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, &readData);
      __dmb(1u);
      uint32_t v3 = readData & 0xF8FFF0FF | 0x7000300;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)(a1 + 16), 0, 0xE00uLL, v3);
    }
  }
  return v2;
}

uint64_t sub_10003250C(uint64_t a1, char a2)
{
  int v4 = *(_DWORD *)(a1 + 284);
  if (v4 == 10 || v4 == 12)
  {
    __int16 v13 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 20, &v13);
    if (result) {
      return result;
    }
    if (a2)
    {
      unsigned int v7 = *(unsigned __int16 *)(a1 + 1120);
      BOOL v8 = v7 > 0x2F;
      uint64_t v9 = (1 << v7) & 0x800000008008;
      if (!v8 && v9 != 0)
      {
        v13 |= 0x10u;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 20);
        if (result) {
          return result;
        }
LABEL_23:
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v13);
        if (result) {
          return result;
        }
        __int16 v12 = v13 & 0xFF7F;
LABEL_25:
        __int16 v13 = v12;
        return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 16);
      }
    }
    else
    {
      v13 &= ~0x10u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1032))(a1, 20);
      if (result) {
        return result;
      }
      int v11 = *(_DWORD *)(a1 + 1096);
      if (v11 == 2) {
        goto LABEL_23;
      }
      if (v11 == 1)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 976))(a1, 16, &v13);
        if (result) {
          return result;
        }
        __int16 v12 = v13 | 0x80;
        goto LABEL_25;
      }
    }
    return 0;
  }
  return e1000_set_d3_lplu_state_generic(a1, a2);
}

void sub_100032688(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)(a1 + 16), 0, 0x5820uLL, &readData);
  __dmb(1u);
  if ((readData & 1) == 0) {
    e1000_power_down_phy_copper(a1);
  }
}

uint64_t sub_1000326DC(void *a1)
{
  *a1 = off_100039288;
  return 0;
}

uint64_t DriverKit_AppleEthernetE1000MetaClass::New(DriverKit_AppleEthernetE1000MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000392C8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100039458;
  *(void *)&a2[1].refcount = &off_100039478;
  return 0;
}

uint64_t DriverKit_AppleEthernetE1000::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetE1000::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetE1000::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > (uint64_t)0xE77A9AA5DB9C706BLL)
  {
    if (msgid > 0x3B4A8720C78B90F2)
    {
      if (msgid != 0x3B4A8720C78B90F3)
      {
        if (msgid == 0x7E0BF833F9FED020)
        {
          if (OSMetaClassBase::IsRemote(this))
          {
            IORPC invoke = *a2;
            p_IORPC invoke = &invoke;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          IORPC v38 = *a2;
          int v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetE1000_TxSubmitMetaClass;
          __int16 v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetE1000::TxSubmit_Impl;
          __int16 v13 = &v38;
        }
        else
        {
          if (msgid != 0x3F8B9F1D6BFC5179) {
            goto LABEL_37;
          }
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v42 = *(_OWORD *)&a2->message;
            uint64_t v43 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v42;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v40 = *(_OWORD *)&a2->message;
          uint64_t v41 = *(void *)&a2->sendSize;
          int v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetE1000_RxSubmitMetaClass;
          __int16 v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetE1000::RxSubmit_Impl;
          __int16 v13 = (IORPC *)&v40;
        }
        return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v32 = *(_OWORD *)&a2->message;
        uint64_t v33 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v32;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      IORPC v31 = *a2;
      BOOL v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetE1000_InterruptOccurredMetaClass;
      uint64_t v9 = DriverKit_AppleEthernetE1000::InterruptOccurred_Impl;
      unsigned __int16 v10 = &v31;
    }
    else
    {
      if (msgid == 0xE77A9AA5DB9C706CLL)
      {
        IORPC v15 = *a2;
        return IOUserNetworkEthernet::GetHardwareAssists_Invoke(&v15, this, (IOUserNetworkEthernet::GetHardwareAssists_Handler)DriverKit_AppleEthernetE1000::GetHardwareAssists_Impl);
      }
      if (msgid == 0xF421A9D80F9A1FDALL)
      {
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v27 = *(_OWORD *)&a2->message;
          uint64_t v28 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v27;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v26 = *a2;
        return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(&v26, this, (IOUserNetworkEthernet::SetInterfaceEnable_Handler)DriverKit_AppleEthernetE1000::SetInterfaceEnable_Impl);
      }
      if (msgid != 0x1AB3CFD93F46F73BLL) {
        goto LABEL_37;
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v36 = *(_OWORD *)&a2->message;
        uint64_t v37 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v36;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      long long v34 = *(_OWORD *)&a2->message;
      uint64_t v35 = *(void *)&a2->sendSize;
      BOOL v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurredMetaClass;
      uint64_t v9 = DriverKit_AppleEthernetE1000::QueueInterruptOccurred_Impl;
      unsigned __int16 v10 = (IORPC *)&v34;
    }
    return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, (IOInterruptDispatchSource::InterruptOccurred_Handler)v9, v8);
  }
  if (msgid <= (uint64_t)0xC3E63AC546EBD1FDLL)
  {
    switch(msgid)
    {
      case 0x98E715041C459FA5:
        IORPC v29 = *a2;
        return IOService::Stop_Invoke(&v29, this, (IOService::Stop_Handler)DriverKit_AppleEthernetE1000::Stop_Impl);
      case 0xA49568F23EE8EFD5:
        IORPC v16 = *a2;
        return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(&v16, this, (IOUserNetworkEthernet::GetMaxTransferUnit_Handler)DriverKit_AppleEthernetE1000::GetMaxTransferUnit_Impl);
      case 0xAB6F76DDE6D693F2:
        IORPC rpc = *a2;
        return IOService::Start_Invoke(&rpc, this, (IOService::Start_Handler)DriverKit_AppleEthernetE1000::Start_Impl);
    }
    goto LABEL_37;
  }
  if (msgid == 0xC3E63AC546EBD1FELL)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v18 = *(_OWORD *)&a2->message;
      uint64_t v19 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v18;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v17 = *a2;
    return IOUserNetworkEthernet::SelectMediaType_Invoke(&v17, this, (IOUserNetworkEthernet::SelectMediaType_Handler)DriverKit_AppleEthernetE1000::SelectMediaType_Impl);
  }
  if (msgid == 0xE042A87972611225)
  {
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v21 = *(_OWORD *)&a2->message;
      uint64_t v22 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v21;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v20 = *a2;
    return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(&v20, this, (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)DriverKit_AppleEthernetE1000::SetAllMulticastModeEnable_Impl);
  }
  if (msgid != 0xE072FCC26CF639ACLL)
  {
LABEL_37:
    IORPC v14 = *a2;
    return IOUserNetworkEthernet::_Dispatch(this, &v14);
  }
  if (OSMetaClassBase::IsRemote(this))
  {
    long long v24 = *(_OWORD *)&a2->message;
    uint64_t v25 = *(void *)&a2->sendSize;
    p_IORPC invoke = (IORPC *)&v24;
    return OSMetaClassBase::Dispatch(this, p_invoke);
  }
  IORPC v23 = *a2;
  return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(&v23, this, (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)DriverKit_AppleEthernetE1000::SetPromiscuousModeEnable_Impl);
}

uint64_t DriverKit_AppleEthernetE1000MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetE1000::CreateActionRxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  unsigned int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetE1000_RxSubmit");
  if (!v6) {
    return 3758097085;
  }
  unsigned int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x3F8B9F1D6BFC5179uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetE1000::CreateActionTxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  unsigned int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetE1000_TxSubmit");
  if (!v6) {
    return 3758097085;
  }
  unsigned int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x7E0BF833F9FED020uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetE1000::CreateActionQueueInterruptOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  unsigned int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurred");
  if (!v6) {
    return 3758097085;
  }
  unsigned int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x1AB3CFD93F46F73BuLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetE1000::CreateActionInterruptOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  unsigned int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetE1000_InterruptOccurred");
  if (!v6) {
    return 3758097085;
  }
  unsigned int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x3B4A8720C78B90F3uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_10003302C(void *a1)
{
  *a1 = off_1000395D0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_RxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetE1000_RxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100039610;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100039658;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_RxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_RxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_RxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10003318C(void *a1)
{
  *a1 = off_100039678;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_TxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetE1000_TxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000396B8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100039700;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_TxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_TxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_TxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000332EC(void *a1)
{
  *a1 = off_100039720;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurredMetaClass::New(OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100039760;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000397A8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10003344C(void *a1)
{
  *a1 = off_1000397C8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_InterruptOccurredMetaClass::New(OSAction_DriverKit_AppleEthernetE1000_InterruptOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100039808;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100039850;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_InterruptOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_InterruptOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetE1000_InterruptOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000335AC()
{
  return gOSAction_DriverKit_AppleEthernetE1000_RxSubmitMetaClass;
}

uint64_t sub_1000335B8()
{
  return gOSAction_DriverKit_AppleEthernetE1000_TxSubmitMetaClass;
}

uint64_t sub_1000335C4()
{
  return gOSAction_DriverKit_AppleEthernetE1000_QueueInterruptOccurredMetaClass;
}

uint64_t sub_1000335D0()
{
  return gOSAction_DriverKit_AppleEthernetE1000_InterruptOccurredMetaClass;
}

void sub_1000335DC()
{
}

void sub_100033608()
{
}

void sub_100033634()
{
}

void sub_100033660()
{
}

void sub_10003368C()
{
}

void sub_1000336B8()
{
}

void sub_1000336E4()
{
}

void sub_100033710()
{
}

void sub_10003373C()
{
}

void sub_100033768()
{
}

void sub_100033794()
{
}

void sub_1000337C0()
{
}

void sub_1000337EC()
{
}

void sub_100033818()
{
}

void sub_100033844()
{
}

void sub_100033870()
{
}

void sub_10003389C()
{
}

void sub_1000338C8()
{
}

void sub_1000338F4()
{
}

void IODelay(uint64_t us)
{
}

void IOFree(void *address, size_t length)
{
}

uint64_t IOMallocZeroTyped()
{
  return _IOMallocZeroTyped();
}

BOOL IOParseBootArgNumber(const char *arg_string, void *arg_ptr, int max_len)
{
  return _IOParseBootArgNumber(arg_string, arg_ptr, max_len);
}

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  return _IORPCMessageFromMach(msg, reply);
}

OSDictionaryPtr OSDictionaryCreate(void)
{
  return _OSDictionaryCreate();
}

void OSDictionarySetStringValue(OSDictionaryPtr obj, const char *key, const char *value)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void IOPCIDevice::MemoryRead32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t *readData)
{
}

void IOPCIDevice::MemoryWrite32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t data)
{
}

kern_return_t IOPCIDevice::FindPCICapability(IOPCIDevice *this, uint32_t capabilityID, uint64_t searchOffset, uint64_t *foundCapabilityOffset, OSDispatchMethod supermethod)
{
  return IOPCIDevice::FindPCICapability(this, capabilityID, searchOffset, foundCapabilityOffset, supermethod);
}

void IOPCIDevice::ConfigurationRead8(IOPCIDevice *this, uint64_t offset, uint8_t *readData)
{
}

void IOPCIDevice::ConfigurationRead16(IOPCIDevice *this, uint64_t offset, uint16_t *readData)
{
}

void IOPCIDevice::ConfigurationWrite8(IOPCIDevice *this, uint64_t offset, uint8_t data)
{
}

uint64_t IOPCIDevice::ConfigureInterrupts(IOPCIDevice *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, int (*a6)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOPCIDevice::ConfigureInterrupts(this, a2, a3, a4, a5, a6);
}

void IOPCIDevice::ConfigurationWrite16(IOPCIDevice *this, uint64_t offset, uint16_t data)
{
}

kern_return_t IOPCIDevice::GetBusDeviceFunction(IOPCIDevice *this, uint8_t *returnBusNumber, uint8_t *returnDeviceNumber, uint8_t *returnFunctionNumber, OSDispatchMethod supermethod)
{
  return IOPCIDevice::GetBusDeviceFunction(this, returnBusNumber, returnDeviceNumber, returnFunctionNumber, supermethod);
}

kern_return_t IOPCIDevice::Open(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
  return IOPCIDevice::Open(this, forClient, options);
}

void IOPCIDevice::Close(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
}

kern_return_t IODMACommand::CompleteDMA(IODMACommand *this, uint64_t options, OSDispatchMethod supermethod)
{
  return IODMACommand::CompleteDMA(this, options, supermethod);
}

kern_return_t IODMACommand::PrepareForDMA(IODMACommand *this, uint64_t options, IOMemoryDescriptor *memory, uint64_t offset, uint64_t length, uint64_t *flags, uint32_t *segmentsCount, IOAddressSegment *segments, OSDispatchMethod supermethod)
{
  return IODMACommand::PrepareForDMA(this, options, memory, offset, length, flags, segmentsCount, segments, supermethod);
}

kern_return_t IODMACommand::Create(IOService *device, uint64_t options, const IODMACommandSpecification *specification, IODMACommand **command)
{
  return IODMACommand::Create(device, options, specification, command);
}

void IODispatchQueue::DispatchSync(IODispatchQueue *this, IODispatchBlock block)
{
}

kern_return_t IODispatchQueue::Create(const IODispatchQueueName name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  return IODispatchQueue::Create(name, options, priority, queue);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

kern_return_t OSMetaClassBase::Dispatch(OSMetaClassBase *this, IORPC *invoke)
{
  return OSMetaClassBase::Dispatch(this, invoke);
}

BOOL OSMetaClassBase::IsRemote(OSMetaClassBase *this)
{
  return OSMetaClassBase::IsRemote(this);
}

kern_return_t IODispatchSource::Cancel(IODispatchSource *this, IODispatchSourceCancelHandler handler, OSDispatchMethod supermethod)
{
  return IODispatchSource::Cancel(this, handler, supermethod);
}

kern_return_t IODispatchSource::SetEnable(IODispatchSource *this, BOOL enable, OSDispatchMethod supermethod)
{
  return IODispatchSource::SetEnable(this, enable, supermethod);
}

kern_return_t IOUserNetworkEthernet::ReportNicProxyLimits(IOUserNetworkEthernet *this, nicproxy_limits_info_s nicproxy_limits_info, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::ReportNicProxyLimits(this, nicproxy_limits_info, supermethod);
}

kern_return_t IOUserNetworkEthernet::SelectMediaType_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SelectMediaType_Handler func)
{
  return IOUserNetworkEthernet::SelectMediaType_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetHardwareAssists_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetHardwareAssists_Handler func)
{
  return IOUserNetworkEthernet::GetHardwareAssists_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetMaxTransferUnit_Handler func)
{
  return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetInterfaceEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetInterfaceEnable_Handler func)
{
  return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler func)
{
  return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(rpc, target, func);
}

void IOUserNetworkEthernet::free(IOUserNetworkEthernet *this)
{
}

BOOL IOUserNetworkEthernet::init(IOUserNetworkEthernet *this)
{
  return IOUserNetworkEthernet::init(this);
}

kern_return_t IOUserNetworkEthernet::_Dispatch(IOUserNetworkEthernet *self, const IORPC *rpc)
{
  return IOUserNetworkEthernet::_Dispatch(self, rpc);
}

kern_return_t IOBufferMemoryDescriptor::GetAddressRange(IOBufferMemoryDescriptor *this, IOAddressSegment *range)
{
  return IOBufferMemoryDescriptor::GetAddressRange(this, range);
}

kern_return_t IOBufferMemoryDescriptor::Create(uint64_t options, uint64_t capacity, uint64_t alignment, IOBufferMemoryDescriptor **memory)
{
  return IOBufferMemoryDescriptor::Create(options, capacity, alignment, memory);
}

kern_return_t IOUserNetworkPacketQueue::SetEnable(IOUserNetworkPacketQueue *this, BOOL isEnable, OSDispatchMethod supermethod)
{
  return IOUserNetworkPacketQueue::SetEnable(this, isEnable, supermethod);
}

void IODataQueueDispatchSource::SendDataAvailable(IODataQueueDispatchSource *this)
{
}

kern_return_t IODataQueueDispatchSource::EnqueueWithCoalesce(IODataQueueDispatchSource *this, uint32_t dataSize, BOOL *sendDataAvailable, IODataQueueClientEnqueueEntryBlock callback)
{
  return IODataQueueDispatchSource::EnqueueWithCoalesce(this, dataSize, sendDataAvailable, callback);
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func, const OSMetaClass *targetActionClass)
{
  return IODataQueueDispatchSource::DataAvailable_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IODataQueueDispatchSource::SetDataAvailableHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::SetHandler(IOInterruptDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IOInterruptDispatchSource::SetHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::GetInterruptType(IOService *provider, uint32_t index, uint64_t *interruptType)
{
  return IOInterruptDispatchSource::GetInterruptType(provider, index, interruptType);
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::InterruptOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  return IOInterruptDispatchSource::InterruptOccurred_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOInterruptDispatchSource::Create(IOService *provider, uint32_t index, IODispatchQueue *queue, IOInterruptDispatchSource **source)
{
  return IOInterruptDispatchSource::Create(provider, index, queue, source);
}

kern_return_t IOUserNetworkPacketBufferPool::CreateWithOptions(IOService *device, const char *name, const IOUserNetworkPacketBufferPoolOptions *options, IOUserNetworkPacketBufferPool **pool)
{
  return IOUserNetworkPacketBufferPool::CreateWithOptions(device, name, options, pool);
}

kern_return_t IOUserNetworkRxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxCompletionQueue **queue)
{
  return IOUserNetworkRxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkRxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkRxSubmissionQueue **queue)
{
  return IOUserNetworkRxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxCompletionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxCompletionQueue **queue)
{
  return IOUserNetworkTxCompletionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t IOUserNetworkTxSubmissionQueue::Create(IOUserNetworkPacketBufferPool *pool, OSObject *owner, uint32_t capacity, uint32_t queueId, IODispatchQueue *dispatchQueue, IOUserNetworkTxSubmissionQueue **queue)
{
  return IOUserNetworkTxSubmissionQueue::Create(pool, owner, capacity, queueId, dispatchQueue, queue);
}

kern_return_t OSAction::CreateWithTypeName(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  return OSAction::CreateWithTypeName(target, targetmsgid, msgid, referenceSize, typeName, action);
}

kern_return_t OSAction::_Dispatch(OSAction *self, const IORPC *rpc)
{
  return OSAction::_Dispatch(self, rpc);
}

kern_return_t OSObject::SetDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue *queue, OSDispatchMethod supermethod)
{
  return OSObject::SetDispatchQueue(this, name, queue, supermethod);
}

kern_return_t OSObject::CopyDispatchQueue(OSObject *this, const IODispatchQueueName name, IODispatchQueue **queue, OSDispatchMethod supermethod)
{
  return OSObject::CopyDispatchQueue(this, name, queue, supermethod);
}

OSStringPtr OSString::withCString(const char *cString)
{
  return OSString::withCString(cString);
}

kern_return_t IOService::Stop_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_Handler func)
{
  return IOService::Stop_Invoke(rpc, target, func);
}

kern_return_t IOService::Start_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Start_Handler func)
{
  return IOService::Start_Invoke(rpc, target, func);
}

kern_return_t IOService::SetProperties(IOService *this, OSDictionary *properties, OSDispatchMethod supermethod)
{
  return IOService::SetProperties(this, properties, supermethod);
}

kern_return_t IOService::CopyProperties(IOService *this, OSDictionary **properties, OSDispatchMethod supermethod)
{
  return IOService::CopyProperties(this, properties, supermethod);
}

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  return IOService::RegisterService(this, supermethod);
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Start(this, provider, supermethod);
}

OSObject *__cdecl OSDictionary::getObject(const OSDictionary *this, const char *aKey)
{
  return OSDictionary::getObject(this, aKey);
}

const void *__cdecl OSData::getBytesNoCopy(const OSData *this)
{
  return OSData::getBytesNoCopy(this);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}