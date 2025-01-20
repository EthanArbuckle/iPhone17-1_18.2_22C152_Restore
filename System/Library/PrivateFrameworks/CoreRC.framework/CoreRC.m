void sub_24C4AD3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_24C4AD6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreRCCommandIsBasicButton(unint64_t a1)
{
  return (a1 < 0x10) & (0x803Eu >> a1);
}

BOOL CoreRCCommandIsMenuButton(uint64_t a1)
{
  return a1 == 15;
}

BOOL CoreRCCommandIsLeftButton(uint64_t a1)
{
  return a1 == 4;
}

BOOL CoreRCCommandIsRightButton(uint64_t a1)
{
  return a1 == 5;
}

BOOL CoreRCCommandIsPlayOrPauseButton(uint64_t a1)
{
  return a1 == 67 || a1 == 47;
}

uint64_t CoreRCCommandToHIDUsage(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3 = a1 - 1;
  uint64_t v4 = 0xC00000041;
  uint64_t result = 1;
  switch(v3)
  {
    case 0:
      break;
    case 1:
      uint64_t v4 = 0xC00000042;
      break;
    case 2:
      uint64_t v4 = 0xC00000043;
      break;
    case 3:
      uint64_t v4 = 0xC00000044;
      break;
    case 4:
      uint64_t v4 = 0xC00000045;
      break;
    case 9:
      uint64_t v4 = 0x100000085;
      break;
    case 10:
      uint64_t v4 = 0xC0000019FLL;
      break;
    case 11:
      uint64_t v4 = 0xC000001C0;
      break;
    case 12:
      uint64_t v4 = 0xC0000022ALL;
      break;
    case 13:
      uint64_t v4 = 0xC00000046;
      break;
    case 14:
      uint64_t v4 = 0x100000086;
      break;
    case 15:
      uint64_t v4 = 0x100000084;
      break;
    case 19:
      uint64_t v4 = 0x700000062;
      break;
    case 20:
      uint64_t v4 = 0x700000059;
      break;
    case 21:
      uint64_t v4 = 0x70000005ALL;
      break;
    case 22:
      uint64_t v4 = 0x70000005BLL;
      break;
    case 23:
      uint64_t v4 = 0x70000005CLL;
      break;
    case 24:
      uint64_t v4 = 0x70000005DLL;
      break;
    case 25:
      uint64_t v4 = 0x70000005ELL;
      break;
    case 26:
      uint64_t v4 = 0x70000005FLL;
      break;
    case 27:
      uint64_t v4 = 0x700000060;
      break;
    case 28:
      uint64_t v4 = 0x700000061;
      break;
    case 29:
      uint64_t v4 = 0x700000037;
      break;
    case 30:
      uint64_t v4 = 0x700000058;
      break;
    case 31:
      uint64_t v4 = 0x70000009CLL;
      break;
    case 33:
      uint64_t v4 = 0xC0000009CLL;
      break;
    case 34:
      uint64_t v4 = 0xC0000009DLL;
      break;
    case 35:
      uint64_t v4 = 0xC00000083;
      break;
    case 36:
      uint64_t v4 = 0xC00000173;
      break;
    case 39:
      uint64_t v4 = 0xC00000095;
      break;
    case 40:
      uint64_t v4 = 0x70000004BLL;
      break;
    case 41:
      uint64_t v4 = 0x70000004ELL;
      break;
    case 42:
      uint64_t v4 = 0xC000000E9;
      break;
    case 43:
      uint64_t v4 = 0xC000000EALL;
      break;
    case 44:
      uint64_t v4 = 0xC000000E2;
      break;
    case 45:
      uint64_t v4 = 0xC000000CDLL;
      break;
    case 46:
      uint64_t v4 = 0xC000000B1;
      break;
    case 47:
      uint64_t v4 = 0xC000000B4;
      break;
    case 48:
      uint64_t v4 = 0xC000000B3;
      break;
    case 49:
      uint64_t v4 = 0xC000000B8;
      break;
    case 50:
      uint64_t v4 = 0xC000000C6;
      break;
    case 51:
      uint64_t v4 = 0xC000000C7;
      break;
    case 54:
      uint64_t v4 = 0xC00000061;
      break;
    case 55:
      uint64_t v4 = 0xC00000064;
      break;
    case 56:
      uint64_t v4 = 0xC000000E6;
      break;
    case 57:
      uint64_t v4 = 0xC00000152;
      break;
    case 59:
      uint64_t v4 = 0xC00000153;
      break;
    case 60:
      uint64_t v4 = 0xC00000154;
      break;
    case 62:
      uint64_t v4 = 0xC00000155;
      break;
    case 63:
      uint64_t v4 = 0xFF0100000043;
      break;
    case 64:
      uint64_t v4 = 0xC00000196;
      break;
    case 66:
      uint64_t v4 = 0xC000000B0;
      break;
    case 67:
      uint64_t v4 = 0xC00000066;
      break;
    case 69:
      uint64_t v4 = 0xC000000B2;
      break;
    case 71:
      uint64_t v4 = 0xC000000B7;
      break;
    case 72:
      uint64_t v4 = 0xC00000030;
      break;
    case 73:
      uint64_t v4 = 0x100000082;
      break;
    case 74:
      uint64_t v4 = 0x100000083;
      break;
    case 75:
      uint64_t v4 = 0xC0000006BLL;
      break;
    case 76:
      uint64_t v4 = 0xC00000069;
      break;
    case 77:
      uint64_t v4 = 0xC0000006ALL;
      break;
    case 78:
      uint64_t v4 = 0xC0000006CLL;
      break;
    case 79:
      uint64_t v6 = 0x700000037;
      goto LABEL_66;
    case 80:
      uint64_t v6 = 0x100000082;
LABEL_66:
      uint64_t v4 = v6 + 7;
      break;
    case 81:
      uint64_t v4 = 0xC000000B6;
      break;
    case 82:
      uint64_t v4 = 0xC000000B5;
      break;
    case 83:
      uint64_t v4 = 0xC00000060;
      break;
    case 84:
      uint64_t v4 = 0xFF0100000004;
      break;
    case 89:
      uint64_t v4 = 0xC0000008DLL;
      break;
    case 90:
      uint64_t v4 = 0xFF0100000044;
      break;
    case 91:
      uint64_t v7 = 65;
      goto LABEL_100;
    case 92:
      uint64_t v7 = 66;
      goto LABEL_100;
    case 93:
      uint64_t v7 = 67;
      goto LABEL_100;
    case 94:
      uint64_t v4 = 0xFF0100000048;
      break;
    case 95:
      uint64_t v4 = 0xFF0100000049;
      break;
    case 96:
      uint64_t v4 = 0xFF010000004ALL;
      break;
    case 97:
      uint64_t v4 = 0xFF010000004BLL;
      break;
    case 98:
      uint64_t v7 = 72;
      goto LABEL_100;
    case 99:
      uint64_t v7 = 73;
      goto LABEL_100;
    case 100:
      uint64_t v7 = 74;
      goto LABEL_100;
    case 101:
      uint64_t v7 = 75;
      goto LABEL_100;
    case 102:
      uint64_t v4 = 0xFF0100000050;
      break;
    case 103:
      uint64_t v4 = 0xFF0100000051;
      break;
    case 104:
      uint64_t v4 = 0xFF0100000052;
      break;
    case 105:
      uint64_t v4 = 0xFF0100000053;
      break;
    case 106:
      uint64_t v7 = 80;
      goto LABEL_100;
    case 107:
      uint64_t v7 = 81;
      goto LABEL_100;
    case 108:
      uint64_t v7 = 82;
      goto LABEL_100;
    case 109:
      uint64_t v7 = 83;
      goto LABEL_100;
    case 110:
      uint64_t v4 = 0xFF0100000058;
      break;
    case 111:
      uint64_t v4 = 0xFF0100000059;
      break;
    case 112:
      uint64_t v4 = 0xFF010000005ALL;
      break;
    case 113:
      uint64_t v4 = 0xFF010000005BLL;
      break;
    case 114:
      uint64_t v7 = 88;
      goto LABEL_100;
    case 115:
      uint64_t v7 = 89;
      goto LABEL_100;
    case 116:
      uint64_t v7 = 90;
      goto LABEL_100;
    case 117:
      uint64_t v7 = 91;
LABEL_100:
      uint64_t v4 = v7 | 0xFF0100000004;
      break;
    default:
      uint64_t v4 = 0;
      uint64_t result = 0;
      break;
  }
  *a2 = HIDWORD(v4);
  *a3 = v4;
  return result;
}

uint64_t CoreRCCommandFromHIDUsage(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 | (unint64_t)(a2 << 32);
  if (v4 > 0xC000000E1)
  {
    if (v4 <= 0xC00000229)
    {
      if (v4 <= 0xC00000172)
      {
        switch(v4)
        {
          case 0xC000000E2:
            uint64_t v3 = 45;
            goto LABEL_125;
          case 0xC000000E3:
          case 0xC000000E4:
          case 0xC000000E5:
          case 0xC000000E7:
          case 0xC000000E8:
            return v3;
          case 0xC000000E6:
            uint64_t v3 = 57;
            goto LABEL_125;
          case 0xC000000E9:
            uint64_t v3 = 43;
            goto LABEL_125;
          case 0xC000000EALL:
            uint64_t v3 = 44;
            goto LABEL_125;
          default:
            JUMPOUT(0);
        }
      }
      if (v4 > 0xC0000019ELL)
      {
        if (v4 == 0xC0000019FLL)
        {
          uint64_t v3 = 11;
        }
        else
        {
          if (v4 != 0xC000001C0) {
            return v3;
          }
          uint64_t v3 = 12;
        }
      }
      else if (v4 == 0xC00000173)
      {
        uint64_t v3 = 37;
      }
      else
      {
        if (v4 != 0xC00000196) {
          return v3;
        }
        uint64_t v3 = 65;
      }
    }
    else
    {
      switch(v4)
      {
        case 0xFF0100000043:
          uint64_t v3 = 64;
          goto LABEL_125;
        case 0xFF0100000044:
          uint64_t v3 = 91;
          goto LABEL_125;
        case 0xFF0100000045:
          uint64_t v3 = 92;
          goto LABEL_125;
        case 0xFF0100000046:
          uint64_t v3 = 93;
          goto LABEL_125;
        case 0xFF0100000047:
          uint64_t v3 = 94;
          goto LABEL_125;
        case 0xFF0100000048:
          uint64_t v3 = 95;
          goto LABEL_125;
        case 0xFF0100000049:
          uint64_t v3 = 96;
          goto LABEL_125;
        case 0xFF010000004ALL:
          uint64_t v3 = 97;
          goto LABEL_125;
        case 0xFF010000004BLL:
          uint64_t v3 = 98;
          goto LABEL_125;
        case 0xFF010000004CLL:
          uint64_t v3 = 99;
          goto LABEL_125;
        case 0xFF010000004DLL:
          uint64_t v3 = 100;
          goto LABEL_125;
        case 0xFF010000004ELL:
          uint64_t v3 = 101;
          goto LABEL_125;
        case 0xFF010000004FLL:
          uint64_t v3 = 102;
          goto LABEL_125;
        case 0xFF0100000050:
          uint64_t v3 = 103;
          goto LABEL_125;
        case 0xFF0100000051:
          uint64_t v3 = 104;
          goto LABEL_125;
        case 0xFF0100000052:
          uint64_t v3 = 105;
          goto LABEL_125;
        case 0xFF0100000053:
          uint64_t v3 = 106;
          goto LABEL_125;
        case 0xFF0100000054:
          uint64_t v3 = 107;
          goto LABEL_125;
        case 0xFF0100000055:
          uint64_t v3 = 108;
          goto LABEL_125;
        case 0xFF0100000056:
          uint64_t v3 = 109;
          goto LABEL_125;
        case 0xFF0100000057:
          uint64_t v3 = 110;
          goto LABEL_125;
        case 0xFF0100000058:
          uint64_t v3 = 111;
          goto LABEL_125;
        case 0xFF0100000059:
          uint64_t v3 = 112;
          goto LABEL_125;
        case 0xFF010000005ALL:
          uint64_t v3 = 113;
          goto LABEL_125;
        case 0xFF010000005BLL:
          uint64_t v3 = 114;
          goto LABEL_125;
        case 0xFF010000005CLL:
          uint64_t v3 = 115;
          goto LABEL_125;
        case 0xFF010000005DLL:
          uint64_t v3 = 116;
          goto LABEL_125;
        case 0xFF010000005ELL:
          uint64_t v3 = 117;
          goto LABEL_125;
        case 0xFF010000005FLL:
          uint64_t v3 = 118;
          goto LABEL_125;
        default:
          if (v4 == 0xC0000022ALL)
          {
            uint64_t v3 = 13;
          }
          else
          {
            if (v4 != 0xFF0100000004) {
              return v3;
            }
            uint64_t v3 = 85;
          }
          break;
      }
    }
    goto LABEL_125;
  }
  if (v4 <= 0xC0000005FLL)
  {
    if (v4 <= 0x70000004ALL)
    {
      switch(v4)
      {
        case 0x100000082:
          uint64_t v3 = 74;
          break;
        case 0x100000083:
          uint64_t v3 = 75;
          break;
        case 0x100000084:
          uint64_t v3 = 16;
          break;
        case 0x100000085:
          uint64_t v3 = 10;
          break;
        case 0x100000086:
          uint64_t v3 = 15;
          break;
        case 0x100000087:
        case 0x100000088:
          return v3;
        case 0x100000089:
          uint64_t v3 = 81;
          break;
        default:
          if (v4 == 0x700000037)
          {
            uint64_t v3 = 30;
          }
          else
          {
            if (v4 != 0x70000003ELL) {
              return v3;
            }
            uint64_t v3 = 80;
          }
          break;
      }
    }
    else
    {
      if (v4 <= 0x70000009BLL)
      {
        switch(v4)
        {
          case 0x70000004BLL:
            uint64_t v3 = 41;
            goto LABEL_125;
          case 0x70000004ELL:
            uint64_t v3 = 42;
            goto LABEL_125;
          case 0x700000058:
            uint64_t v3 = 31;
            goto LABEL_125;
          case 0x700000059:
            uint64_t v3 = 21;
            goto LABEL_125;
          case 0x70000005ALL:
            uint64_t v3 = 22;
            goto LABEL_125;
          case 0x70000005BLL:
            uint64_t v3 = 23;
            goto LABEL_125;
          case 0x70000005CLL:
            uint64_t v3 = 24;
            goto LABEL_125;
          case 0x70000005DLL:
            uint64_t v3 = 25;
            goto LABEL_125;
          case 0x70000005ELL:
            uint64_t v3 = 26;
            goto LABEL_125;
          case 0x70000005FLL:
            uint64_t v3 = 27;
            goto LABEL_125;
          case 0x700000060:
            uint64_t v3 = 28;
            goto LABEL_125;
          case 0x700000061:
            uint64_t v3 = 29;
            goto LABEL_125;
          case 0x700000062:
            uint64_t v3 = 20;
            goto LABEL_125;
          default:
            return v3;
        }
        return v3;
      }
      uint64_t v3 = 1;
      switch(v4)
      {
        case 0xC00000041:
          break;
        case 0xC00000042:
          uint64_t v3 = 2;
          break;
        case 0xC00000043:
          uint64_t v3 = 3;
          break;
        case 0xC00000044:
          uint64_t v3 = 4;
          break;
        case 0xC00000045:
          uint64_t v3 = 5;
          break;
        case 0xC00000046:
          uint64_t v3 = 14;
          break;
        default:
          if (v4 == 0x70000009CLL)
          {
            uint64_t v3 = 32;
          }
          else
          {
            if (v4 != 0xC00000030) {
              return v3;
            }
            uint64_t v3 = 73;
          }
          break;
      }
    }
LABEL_125:
    *a1 = v3;
    return 1;
  }
  if (v4 > 0xC0000009BLL)
  {
    switch(v4)
    {
      case 0xC000000B0:
        uint64_t v3 = 67;
        goto LABEL_125;
      case 0xC000000B1:
        uint64_t v3 = 47;
        goto LABEL_125;
      case 0xC000000B2:
        uint64_t v3 = 70;
        goto LABEL_125;
      case 0xC000000B3:
        uint64_t v3 = 49;
        goto LABEL_125;
      case 0xC000000B4:
        uint64_t v3 = 48;
        goto LABEL_125;
      case 0xC000000B5:
        uint64_t v3 = 83;
        goto LABEL_125;
      case 0xC000000B6:
        uint64_t v3 = 82;
        goto LABEL_125;
      case 0xC000000B7:
        uint64_t v3 = 72;
        goto LABEL_125;
      case 0xC000000B8:
        uint64_t v3 = 50;
        goto LABEL_125;
      case 0xC000000B9:
      case 0xC000000BALL:
      case 0xC000000BBLL:
      case 0xC000000BCLL:
      case 0xC000000BDLL:
      case 0xC000000BELL:
      case 0xC000000BFLL:
      case 0xC000000C0:
      case 0xC000000C1:
      case 0xC000000C2:
      case 0xC000000C3:
      case 0xC000000C4:
      case 0xC000000C5:
      case 0xC000000C8:
      case 0xC000000C9:
      case 0xC000000CALL:
      case 0xC000000CBLL:
      case 0xC000000CCLL:
        return v3;
      case 0xC000000C6:
        uint64_t v3 = 51;
        goto LABEL_125;
      case 0xC000000C7:
        uint64_t v3 = 52;
        goto LABEL_125;
      case 0xC000000CDLL:
        uint64_t v3 = 46;
        goto LABEL_125;
      default:
        if (v4 == 0xC0000009CLL)
        {
          uint64_t v3 = 34;
        }
        else
        {
          if (v4 != 0xC0000009DLL) {
            return v3;
          }
          uint64_t v3 = 35;
        }
        break;
    }
    goto LABEL_125;
  }
  if (v4 > 0xC00000082)
  {
    switch(v4)
    {
      case 0xC00000083:
        uint64_t v3 = 36;
        break;
      case 0xC0000008DLL:
        uint64_t v3 = 90;
        break;
      case 0xC00000095:
        uint64_t v3 = 40;
        break;
      default:
        return v3;
    }
    goto LABEL_125;
  }
  switch(v4)
  {
    case 0xC00000060:
      uint64_t v3 = 84;
      goto LABEL_125;
    case 0xC00000061:
      uint64_t v3 = 55;
      goto LABEL_125;
    case 0xC00000064:
      uint64_t v3 = 56;
      goto LABEL_125;
    case 0xC00000066:
      uint64_t v3 = 68;
      goto LABEL_125;
    case 0xC00000069:
      uint64_t v3 = 77;
      goto LABEL_125;
    case 0xC0000006ALL:
      uint64_t v3 = 78;
      goto LABEL_125;
    case 0xC0000006BLL:
      uint64_t v3 = 76;
      goto LABEL_125;
    case 0xC0000006CLL:
      uint64_t v3 = 79;
      goto LABEL_125;
    default:
      return v3;
  }
  return v3;
}

uint64_t IRDecoder_Decode(uint64_t a1, int a2, _DWORD *a3, unsigned char *a4, void *a5, unsigned char *a6)
{
  if (gDecoderInitOnce != -1) {
    dispatch_once_f(&gDecoderInitOnce, 0, (dispatch_function_t)_IRDecoder_Initialize);
  }
  if (a2 <= 1)
  {
    if (gLogCategory_IRDecoder <= 40 && (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return 4294960546;
  }
  v98 = a5;
  v99 = a3;
  v97 = a4;
  v100 = a6;
  uint64_t v12 = 0;
  unsigned int v13 = 0;
  gDecoderContext[0] = a1;
  dword_2697EC4E8 = a2;
  unk_2697EC4EC = (a2 & 1) + (a2 >> 1);
  unsigned int v102 = unk_2697EC4EC;
  int v101 = 10 * unk_2697EC4EC;
  unsigned int v14 = -1;
  do
  {
    v15 = &gDecoderContext[5 * v12];
    uint64_t v18 = v15[2];
    v17 = v15 + 2;
    uint64_t v16 = v18;
    *((_DWORD *)v17 + 4) = 0;
    v19 = v17 + 2;
    *((_WORD *)v17 + 10) = 0;
    v17[3] = 0;
    v20 = (unint64_t *)(v17 + 3);
    *((_DWORD *)v17 + 8) = 0;
    v21 = (int *)(v17 + 4);
    uint64_t v22 = v17[1];
    v23 = *(unsigned int **)v22;
    unsigned int v24 = **(_DWORD **)v22;
    int v25 = *(unsigned __int16 *)(v18 + 12);
    int v26 = *(unsigned __int16 *)(v18 + 14);
    if (v24 < 0x7D0)
    {
      LODWORD(v34) = 0;
      if (v25) {
        int v35 = 0;
      }
      else {
        int v35 = 500;
      }
      if (v26) {
        int v33 = v35;
      }
      else {
        int v33 = v35 + 500;
      }
    }
    else
    {
      unsigned int v27 = v23[1];
      unint64_t v28 = (429496730 * (unint64_t)(3 * v25)) >> 32;
      if (v24 <= (int)v28 + v25 && v24 >= v25 - (int)v28) {
        int v30 = 500;
      }
      else {
        int v30 = 0;
      }
      unint64_t v31 = (429496730 * (unint64_t)(3 * v26)) >> 32;
      if (v27 <= (int)v31 + v26 && v27 >= v26 - (int)v31) {
        int v33 = v30 + 500;
      }
      else {
        int v33 = v30;
      }
      LODWORD(v34) = 2;
    }
    uint64_t v36 = *(int *)(v22 + 8);
    uint64_t v37 = *(unsigned int *)(v22 + 8);
    int v38 = *(_DWORD *)(v16 + 64);
    if ((v38 & 4) != 0)
    {
      if ((int)v37 <= (int)v34) {
        goto LABEL_94;
      }
      int v49 = *(unsigned __int16 *)(v16 + 16);
      unsigned int v50 = *(unsigned __int16 *)(v16 + 22);
      int v51 = v50 - v49;
      unsigned int v52 = v23[v34];
      if ((v38 & 0x10) == 0)
      {
        int v40 = 0;
        int v53 = 0;
        int v54 = 0;
        BOOL v55 = 1;
        goto LABEL_97;
      }
      int v40 = 1;
      if (v52 >= v49 - v51 && v52 <= v50)
      {
        BOOL v55 = 0;
        int v54 = 1;
LABEL_96:
        int *v21 = 1;
        int v53 = 10;
LABEL_97:
        unint64_t v39 = 0;
        unsigned int v41 = v53 - 10 * v40 + 640;
        do
        {
          if (v40 == 4)
          {
            if (*(_DWORD *)(v16 + 8) == 8) {
              int v57 = 2;
            }
            else {
              int v57 = 1;
            }
          }
          else
          {
            int v57 = 1;
          }
          int v58 = v34 + 1;
          if (v54)
          {
            if (v58 >= (int)v37) {
              goto LABEL_143;
            }
            LODWORD(v34) = v34 + 2;
            unsigned int v52 = v23[v58];
          }
          else
          {
            LODWORD(v34) = v34 + 1;
          }
          int v59 = v57 * v49;
          unsigned int v60 = v59 + v51;
          BOOL v61 = v52 < v59 - v51 || v52 > v60;
          if (v61 || (v53 += 10, v39 = v55 | (2 * v39), unint64_t *v20 = v39, ++v40, *v21 = v40, (int)v34 >= (int)v36))
          {
LABEL_143:
            unsigned int v41 = v53;
            if ((v38 & 0x100) != 0) {
              goto LABEL_120;
            }
            goto LABEL_121;
          }
          unsigned int v52 = v23[(int)v34];
          if (v52 < v59 - v51 || v52 > v60)
          {
            if (v52 <= v60) {
              goto LABEL_143;
            }
            int v54 = 0;
            BOOL v55 = !v55;
            v52 -= v59;
          }
          else
          {
            int v54 = 1;
          }
        }
        while (v40 != 64);
        int v40 = 64;
LABEL_119:
        if ((v38 & 0x100) == 0) {
          goto LABEL_121;
        }
LABEL_120:
        unint64_t v39 = ~((-1 << v40) | v39);
        unint64_t *v20 = v39;
        goto LABEL_121;
      }
      if (v52 > v50)
      {
        int v54 = 0;
        v52 -= v49;
        BOOL v55 = 1;
        goto LABEL_96;
      }
    }
    else if ((int)v34 < (int)v37)
    {
      unint64_t v39 = 0;
      int v40 = 0;
      unsigned int v41 = 0;
      int v42 = *(_DWORD *)(v16 + 64) & 1;
      unsigned int v43 = *(unsigned __int16 *)(v16 + 20);
      uint64_t v34 = v34;
      while (1)
      {
        if (v34 + 1 >= v36) {
          unsigned int v44 = 0;
        }
        else {
          unsigned int v44 = v23[v34 + 1];
        }
        unsigned int v45 = v23[v34];
        if ((v38 & 8) == 0)
        {
          if (v45 >= v43 && v45 <= *(unsigned __int16 *)(v16 + 22))
          {
            if (v44 >= *(unsigned __int16 *)(v16 + 24))
            {
              if (!(v44 | v42) || v44 <= *(unsigned __int16 *)(v16 + 26))
              {
LABEL_68:
                v39 *= 2;
                unint64_t *v20 = v39;
                int *v21 = ++v40;
                if (v45 >= *(unsigned __int16 *)(v16 + 28))
                {
                  if (v45 > *(unsigned __int16 *)(v16 + 30)) {
                    int v46 = 10;
                  }
                  else {
                    int v46 = 11;
                  }
                }
                else
                {
                  int v46 = 10;
                }
                unsigned int v47 = *(unsigned __int16 *)(v16 + 32);
                v48 = (unsigned __int16 *)(v16 + 34);
                goto LABEL_80;
              }
            }
            else if (!(v44 | v42))
            {
              goto LABEL_68;
            }
          }
          if (v45 >= *(unsigned __int16 *)(v16 + 40) && v45 <= *(unsigned __int16 *)(v16 + 42))
          {
            if (v44 >= *(unsigned __int16 *)(v16 + 44))
            {
              if (!(v44 | v42) || v44 <= *(unsigned __int16 *)(v16 + 46))
              {
LABEL_70:
                unint64_t v39 = (2 * v39) | 1;
                unint64_t *v20 = v39;
                int *v21 = ++v40;
                if (v45 >= *(unsigned __int16 *)(v16 + 48))
                {
                  if (v45 > *(unsigned __int16 *)(v16 + 50)) {
                    int v46 = 10;
                  }
                  else {
                    int v46 = 11;
                  }
                }
                else
                {
                  int v46 = 10;
                }
                unsigned int v47 = *(unsigned __int16 *)(v16 + 52);
                v48 = (unsigned __int16 *)(v16 + 54);
LABEL_80:
                if (v44 >= v47 && v44 <= *v48) {
                  ++v46;
                }
                goto LABEL_65;
              }
            }
            else if (!(v44 | v42))
            {
              goto LABEL_70;
            }
          }
          int v46 = 0;
          goto LABEL_65;
        }
        if (v45 >= v43 && v45 <= *(unsigned __int16 *)(v16 + 22))
        {
          v39 *= 2;
        }
        else
        {
          if (v45 < *(unsigned __int16 *)(v16 + 40) || v45 > *(unsigned __int16 *)(v16 + 42))
          {
            int v46 = 0;
            goto LABEL_48;
          }
          unint64_t v39 = (2 * v39) | 1;
        }
        unint64_t *v20 = v39;
        int *v21 = ++v40;
        int v46 = 5;
LABEL_48:
        if (v44 >= *(unsigned __int16 *)(v16 + 24) && v44 <= *(unsigned __int16 *)(v16 + 26))
        {
          v39 *= 2;
        }
        else
        {
          if (v44 < *(unsigned __int16 *)(v16 + 44) || v44 > *(unsigned __int16 *)(v16 + 46)) {
            goto LABEL_65;
          }
          unint64_t v39 = (2 * v39) | 1;
        }
        unint64_t *v20 = v39;
        v46 += 5;
        int *v21 = ++v40;
LABEL_65:
        v41 += v46;
        if (v40 <= 63)
        {
          v34 += 2;
          if (v34 < v36) {
            continue;
          }
        }
        goto LABEL_119;
      }
    }
LABEL_94:
    int v40 = 0;
    unint64_t v39 = 0;
    unsigned int v41 = 0;
    if ((v38 & 0x100) != 0) {
      goto LABEL_120;
    }
LABEL_121:
    int v62 = *(_DWORD *)(v16 + 8);
    if (v62 == 7)
    {
      uint64_t v63 = -2049;
      goto LABEL_125;
    }
    if (v62 == 8)
    {
      uint64_t v63 = -65537;
LABEL_125:
      v39 &= v63;
      unint64_t *v20 = v39;
    }
    unsigned int v64 = v41 + v33;
    uint64_t v65 = *(unsigned __int8 *)(v16 + 56);
    if (!*(unsigned char *)(v16 + 56))
    {
      int v71 = 0;
LABEL_164:
      if ((v38 & 0x80) != 0 && v71 != 1000)
      {
        if (v33 == 1000)
        {
          v74 = &OBJC_IVAR___CECRouterInterface__router;
          goto LABEL_168;
        }
        if ((int)v37 < 2)
        {
          int v77 = 0;
LABEL_190:
          _DWORD *v19 = v77;
        }
        else
        {
          uint64_t v75 = 0;
          unsigned int v76 = 0;
          int v77 = 0;
          int v78 = v36 - 1;
          unint64_t v79 = (429496730 * (unint64_t)(3 * v25)) >> 32;
          unsigned int v80 = v25 - v79;
          unsigned int v81 = v79 + v25;
          unint64_t v82 = (429496730 * (unint64_t)(3 * v26)) >> 32;
          unsigned int v83 = v26 - v82;
          unsigned int v84 = v82 + v26;
          while (1)
          {
            if (v75 + 1 < v37) {
              unsigned int v76 = v23[v75 + 1];
            }
            unsigned int v85 = v23[v75];
            ++v77;
            BOOL v86 = v85 >= 0x7D0 && v85 >= v80;
            BOOL v87 = !v86 || v85 > v81;
            BOOL v88 = !v87 && v76 >= v83;
            if (v88 && v76 <= v84) {
              break;
            }
            v75 += 2;
            if (v78 <= (int)v75) {
              goto LABEL_190;
            }
          }
          _DWORD *v19 = v77;
          v64 += 3000;
        }
      }
LABEL_191:
      v74 = &OBJC_IVAR___CECRouterInterface__router;
      goto LABEL_192;
    }
    int v66 = 0;
    uint64_t v67 = 0;
    int v68 = *(_DWORD *)(v22 + 12);
    if (*v23 <= 0x7D0) {
      int v69 = v40;
    }
    else {
      int v69 = v40 + 1;
    }
    while (1)
    {
      int v70 = *(unsigned __int8 *)(v16 + 57 + v67);
      if ((v38 & 4) != 0)
      {
        if (v69 == v70) {
          goto LABEL_145;
        }
        goto LABEL_140;
      }
      if ((v38 & 8) == 0) {
        break;
      }
      if (v68 == v70)
      {
LABEL_145:
        int v71 = 1000;
        goto LABEL_149;
      }
LABEL_140:
      if (v65 == ++v67)
      {
        int v71 = 0;
        goto LABEL_150;
      }
    }
    if ((v38 & 0x40) != 0 && v68 > v70)
    {
      int v66 = 1;
      *((unsigned char *)v17 + 21) = 1;
    }
    if (v68 != v70) {
      goto LABEL_140;
    }
    if (v36 == 2 * v68 - 1) {
      int v71 = 1000;
    }
    else {
      int v71 = 500;
    }
LABEL_149:
    *((unsigned char *)v17 + 20) = v67;
LABEL_150:
    v64 += v71;
    if (!v66 || v33 != 1000 || v41 < 0x140 || (v39 & 0xFFF0000) != 0x7E10000) {
      goto LABEL_164;
    }
    if (v40 >= 64) {
      int v72 = 64;
    }
    else {
      int v72 = v40;
    }
    if (v72 <= 32) {
      LOBYTE(v72) = 32;
    }
    char v73 = v72 - 32;
    if (v40 <= 32) {
      char v73 = 0;
    }
    unint64_t *v20 = v39 >> v73;
    v64 += 2000;
    if ((v38 & 0x80) == 0) {
      goto LABEL_191;
    }
    v74 = &OBJC_IVAR___CECRouterInterface__router;
    if (v71 == 1000) {
      goto LABEL_192;
    }
LABEL_168:
    v64 += 2000;
LABEL_192:
    int v90 = v74[414];
    if (v90 <= 10 && (v90 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v64 > v13)
    {
      unsigned int v13 = v64;
      unsigned int v14 = v12;
    }
    ++v12;
  }
  while (v12 != 21);
  if (v102 <= 3) {
    unsigned int v91 = 2000;
  }
  else {
    unsigned int v91 = v101 + 1960;
  }
  if (v13 >= v91)
  {
    if ((v14 & 0x80000000) != 0) {
      return 4294960548;
    }
    v92 = &gDecoderContext[5 * v14];
    uint64_t v94 = v92[2];
    v93 = v92 + 2;
    int v95 = (*(_DWORD *)(v94 + 64) >> 1) & 1;
    if (gLogCategory_IRDecoder <= 40 && (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v99) {
      _DWORD *v99 = *(_DWORD *)(*v93 + 8);
    }
    if (v98) {
      void *v98 = gDecoderContext[5 * v14 + 5];
    }
    if (v99) {
      unsigned char *v97 = BYTE4(gDecoderContext[5 * v14 + 4]);
    }
    uint64_t result = 0;
    if (v100) {
      unsigned char *v100 = v95;
    }
  }
  else
  {
    if (gLogCategory_IRDecoder <= 40 && (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return 4294960548;
  }
  return result;
}

void _IRDecoder_Initialize()
{
  uint64_t v0 = 0;
  v1 = &unk_2697EC4F8;
  do
  {
    v2 = &(&kIRProtocols)[v0];
    unsigned int v3 = LOWORD((&kIRProtocols)[v0 + 2]);
    *((_WORD *)v2 + 10) = LOWORD((&kIRProtocols)[v0 + 2]) - (LOWORD((&kIRProtocols)[v0 + 2]) >> 1);
    *((_WORD *)v2 + 11) = v3 + (v3 >> 1);
    *((_WORD *)v2 + 14) = v3 - (unsigned __int16)v3 / 5u;
    *((_WORD *)v2 + 15) = v3 + (unsigned __int16)v3 / 5u;
    unsigned int v4 = *((unsigned __int16 *)&kIRProtocols + 4 * v0 + 9);
    *((_WORD *)v2 + 12) = *((_WORD *)&kIRProtocols + 4 * v0 + 9) - (*((_WORD *)&kIRProtocols + 4 * v0 + 9) >> 1);
    *((_WORD *)v2 + 13) = v4 + (v4 >> 1);
    *((_WORD *)v2 + 16) = v4 - (unsigned __int16)v4 / 5u;
    *((_WORD *)v2 + 17) = v4 + (unsigned __int16)v4 / 5u;
    unsigned int v5 = *((unsigned __int16 *)&kIRProtocols + 4 * v0 + 18);
    *((_WORD *)v2 + 20) = *((_WORD *)&kIRProtocols + 4 * v0 + 18) - (*((_WORD *)&kIRProtocols + 4 * v0 + 18) >> 1);
    *((_WORD *)v2 + 21) = v5 + (v5 >> 1);
    *((_WORD *)v2 + 24) = v5 - (unsigned __int16)v5 / 5u;
    *((_WORD *)v2 + 25) = v5 + (unsigned __int16)v5 / 5u;
    unsigned int v6 = *((unsigned __int16 *)&kIRProtocols + 4 * v0 + 19);
    *((_WORD *)v2 + 22) = *((_WORD *)&kIRProtocols + 4 * v0 + 19) - (*((_WORD *)&kIRProtocols + 4 * v0 + 19) >> 1);
    *((_WORD *)v2 + 23) = v6 + (v6 >> 1);
    *((_WORD *)v2 + 26) = v6 - (unsigned __int16)v6 / 5u;
    *((_WORD *)v2 + 27) = v6 + (unsigned __int16)v6 / 5u;
    *(v1 - 1) = &(&kIRProtocols)[v0];
    void *v1 = &gDecoderContext;
    if (!(v0 * 8))
    {
      if (gLogCategory_IRDecoder > 40) {
        goto LABEL_10;
      }
      if (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
    }
    if (gLogCategory_IRDecoder <= 40 && (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
LABEL_10:
    v0 += 9;
    v1 += 5;
  }
  while (v0 != 189);
  if (gLogCategory_IRDecoder <= 40 && (gLogCategory_IRDecoder != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t CoreRCWaitForAsyncOperation(void *a1, uint64_t a2)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  uint64_t v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  if (!v4)
  {
    unsigned int v6 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6728 userInfo:0];
LABEL_9:
    v13[5] = (uint64_t)v6;
    goto LABEL_4;
  }
  unsigned int v5 = v4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __CoreRCWaitForAsyncOperation_block_invoke;
  v11[3] = &unk_2652E39F8;
  v11[5] = &v18;
  v11[6] = &v12;
  v11[4] = v4;
  (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
  unsigned int v6 = (void *)v13[5];
  if (!*((unsigned char *)v19 + 24) && !v6)
  {
    id v10 = objc_alloc(MEMORY[0x263F087E8]);
    unsigned int v6 = (void *)[v10 initWithDomain:*MEMORY[0x263F08410] code:-6736 userInfo:0];
    goto LABEL_9;
  }
LABEL_4:
  id v7 = v6;
  if (a1) {
    *a1 = v13[5];
  }
  uint64_t v8 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void sub_24C4C2B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

intptr_t __CoreRCWaitForAsyncOperation_block_invoke(void *a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2 == 0;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *(void *)(*(void *)(a1[6] + 8) + 40) = [a2 copy];
  }
  unsigned int v3 = a1[4];
  return dispatch_semaphore_signal(v3);
}

uint64_t CECAddressPreferredForDevice(uint64_t a1, int a2, int a3)
{
  uint64_t result = 14;
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 2;
      break;
    case 2:
      uint64_t result = 9;
      break;
    case 3:
      uint64_t result = 6;
      break;
    case 4:
      uint64_t result = 8;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 7;
      break;
    case 7:
      uint64_t result = 10;
      break;
    case 8:
      uint64_t result = 11;
      break;
    case 9:
    case 10:
    case 11:
      uint64_t result = 12;
      break;
    case 12:
      uint64_t result = 13;
      break;
    case 13:
    case 14:
    case 15:
      uint64_t result = a1;
      switch((int)a1)
      {
        case 0:
          if (a2) {
            uint64_t result = 14;
          }
          else {
            uint64_t result = 0;
          }
          break;
        case 1:
        case 3:
        case 4:
        case 5:
          return result;
        case 7:
          uint64_t result = 14;
          break;
        default:
          goto LABEL_4;
      }
      break;
    default:
LABEL_4:
      uint64_t result = 15;
      break;
  }
  return result;
}

BOOL CECPhysicalAddressIsValid(unsigned int a1)
{
  if (!a1 || a1 >= 0x1000 && (a1 & 0xFFF) == 0) {
    return 1;
  }
  if ((_BYTE)a1) {
    BOOL v2 = (a1 & 0xF0) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  return !v2 && (a1 & 0xF00) != 0 && a1 > 0xFFF;
}

uint64_t CECPhysicalAddressStringWithAddress(unsigned int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *(void *)__str = 0;
  int v1 = snprintf(__str, 8uLL, "%X.%X.%X.%X", a1 >> 12, (a1 >> 8) & 0xF, a1 >> 4, a1 & 0xF);
  if (v1 <= 0) {
    CECPhysicalAddressStringWithAddress_cold_1();
  }
  if (v1 >= 8) {
    CECPhysicalAddressStringWithAddress_cold_2();
  }
  return *(void *)__str;
}

uint64_t CECVendorIDStringWithID(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  char v4 = 0;
  *(void *)__str = 0;
  int v1 = snprintf(__str, 9uLL, "%02X-%02X-%02X", BYTE2(a1), BYTE1(a1), a1);
  if (v1 <= 0) {
    CECVendorIDStringWithID_cold_1();
  }
  if (v1 >= 9) {
    CECVendorIDStringWithID_cold_2();
  }
  return *(void *)__str;
}

const char *CECDeviceTypeString(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return CECDeviceTypeString_deviceTypes[a1];
  }
}

const char *CECPowerStatusString(unsigned int a1)
{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return CECPowerStatusString_powerStatuses[a1];
  }
}

const char *CECVersionString(unsigned int a1)
{
  if (a1 > 6) {
    return "Unknown";
  }
  else {
    return off_2652E3B68[(char)a1];
  }
}

const char *CECAddressString(unsigned int a1, int a2)
{
  if (a1 <= 0xE) {
    return CECAddressString_names[a1];
  }
  unsigned int v3 = "Broadcast";
  if (a2) {
    unsigned int v3 = "Unregistered";
  }
  if (a1 == 15) {
    return v3;
  }
  else {
    return "Unknown";
  }
}

const char *CECAbortReasonString(unsigned int a1)
{
  if (a1 > 5) {
    return "Unknown";
  }
  else {
    return CECAbortReasonString_reasons[a1];
  }
}

const char *CECMessageTypeString(int a1)
{
  if (a1 <= 191)
  {
    switch(a1)
    {
      case 50:
        uint64_t result = "<Set Menu Language>";
        break;
      case 51:
        uint64_t result = "<Clear Analogue Timer>";
        break;
      case 52:
        uint64_t result = "<Set Analogue Timer>";
        break;
      case 53:
        uint64_t result = "<Timer Status>";
        break;
      case 54:
        uint64_t result = "<Standby>";
        break;
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 101:
      case 102:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 123:
      case 124:
      case 127:
      case 136:
      case 148:
      case 149:
      case 150:
      case 152:
      case 155:
      case 156:
LABEL_17:
        uint64_t result = "Unknown";
        break;
      case 65:
        uint64_t result = "<Play>";
        break;
      case 66:
        uint64_t result = "<Deck Control>";
        break;
      case 67:
        uint64_t result = "<Timer Cleared Status>";
        break;
      case 68:
        uint64_t result = "<User Control Pressed>";
        break;
      case 69:
        uint64_t result = "<User Control Released>";
        break;
      case 70:
        uint64_t result = "<Give OSD Name>";
        break;
      case 71:
        uint64_t result = "<Set OSD Name>";
        break;
      case 100:
        uint64_t result = "<Set OSD String>";
        break;
      case 103:
        uint64_t result = "<Timer Program Title>";
        break;
      case 112:
        uint64_t result = "<System Audio Mode Request>";
        break;
      case 113:
        uint64_t result = "<Give Audio Status>";
        break;
      case 114:
        uint64_t result = "<Set System Audio Mode>";
        break;
      case 115:
        uint64_t result = "<Set Audio Volume Level>";
        break;
      case 122:
        uint64_t result = "<Report Audio Status>";
        break;
      case 125:
        uint64_t result = "<Give System Audio Mode Status>";
        break;
      case 126:
        uint64_t result = "<System Audio Mode Status>";
        break;
      case 128:
        uint64_t result = "<Routing Change>";
        break;
      case 129:
        uint64_t result = "<Routing Information>";
        break;
      case 130:
        uint64_t result = "<Active Source>";
        break;
      case 131:
        uint64_t result = "<Give Physical Address>";
        break;
      case 132:
        uint64_t result = "<Report Physical Address>";
        break;
      case 133:
        uint64_t result = "<Request Active Source>";
        break;
      case 134:
        uint64_t result = "<Set Stream Path>";
        break;
      case 135:
        uint64_t result = "<Device Vendor ID>";
        break;
      case 137:
        uint64_t result = "<Vendor Command>";
        break;
      case 138:
        uint64_t result = "<Vendor Remote Button Down>";
        break;
      case 139:
        uint64_t result = "<Vendor Remote Button Up>";
        break;
      case 140:
        uint64_t result = "<Give Device Vendor ID>";
        break;
      case 141:
        uint64_t result = "<Menu Request>";
        break;
      case 142:
        uint64_t result = "<Menu Status>";
        break;
      case 143:
        uint64_t result = "<Give Device Power Status>";
        break;
      case 144:
        uint64_t result = "<Report Power Status>";
        break;
      case 145:
        uint64_t result = "<Get Menu Language>";
        break;
      case 146:
        uint64_t result = "<Select Analogue Service>";
        break;
      case 147:
        uint64_t result = "<Select Digital Service>";
        break;
      case 151:
        uint64_t result = "<Set Digital Timer>";
        break;
      case 153:
        uint64_t result = "<Clear Digital Timer>";
        break;
      case 154:
        uint64_t result = "<Set Audio Rate>";
        break;
      case 157:
        uint64_t result = "<Inactive Source>";
        break;
      case 158:
        uint64_t result = "<CEC Version>";
        break;
      case 159:
        uint64_t result = "<Get CEC Version>";
        break;
      case 160:
        uint64_t result = "<Vendor Command with ID>";
        break;
      case 161:
        uint64_t result = "<Clear External Timer>";
        break;
      case 162:
        uint64_t result = "<Set External Timer>";
        break;
      case 163:
        uint64_t result = "<Report Short Audio Descriptor>";
        break;
      case 164:
        uint64_t result = "<Request Short Audio Descriptor>";
        break;
      case 165:
        uint64_t result = "<Give Features>";
        break;
      case 166:
        uint64_t result = "<Report Features>";
        break;
      default:
        int v2 = a1 + 1;
        uint64_t result = "<Polling Message>";
        switch(v2)
        {
          case 0:
            return result;
          case 1:
            uint64_t result = "<Feature Abort>";
            break;
          case 5:
            uint64_t result = "<Image View On>";
            break;
          case 6:
            uint64_t result = "<Tuner Step Increment>";
            break;
          case 7:
            uint64_t result = "<Tuner Step Decrement>";
            break;
          case 8:
            uint64_t result = "<Tuner Device Status>";
            break;
          case 9:
            uint64_t result = "<Give Tuner Device Status>";
            break;
          case 10:
            uint64_t result = "<Record On>";
            break;
          case 11:
            uint64_t result = "<Record Status>";
            break;
          case 12:
            uint64_t result = "<Record Off>";
            break;
          case 14:
            uint64_t result = "<Text View On>";
            break;
          case 16:
            uint64_t result = "<Record TV Screen>";
            break;
          case 27:
            uint64_t result = "<Give Deck Status>";
            break;
          case 28:
            uint64_t result = "<Deck Status>";
            break;
          default:
            goto LABEL_17;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 192:
        uint64_t result = "<Initiate ARC>";
        break;
      case 193:
        uint64_t result = "<Report ARC Initiated>";
        break;
      case 194:
        uint64_t result = "<Report ARC Terminated>";
        break;
      case 195:
        uint64_t result = "<Request ARC Initiation>";
        break;
      case 196:
        uint64_t result = "<Request ARC Termination>";
        break;
      case 197:
        uint64_t result = "<Terminate ARC>";
        break;
      default:
        if (a1 == 248)
        {
          uint64_t result = "<CDC Message>";
        }
        else
        {
          if (a1 != 255) {
            goto LABEL_17;
          }
          uint64_t result = "<Abort>";
        }
        break;
    }
  }
  return result;
}

const char *CECUserControlString(uint64_t a1)
{
  char v1 = BYTE4(a1);
  int v2 = a1;
  uint64_t result = "Select";
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "Up";
      break;
    case 2:
      uint64_t result = "Down";
      break;
    case 3:
      uint64_t result = "Left";
      break;
    case 4:
      uint64_t result = "Right";
      break;
    case 5:
      uint64_t result = "RightUp";
      break;
    case 6:
      uint64_t result = "RightDown";
      break;
    case 7:
      uint64_t result = "LeftUp";
      break;
    case 8:
      uint64_t result = "LeftDown";
      break;
    case 9:
      uint64_t result = "RootMenu";
      break;
    case 10:
      uint64_t result = "SetupMenu";
      break;
    case 11:
      uint64_t result = "ContentsMenu";
      break;
    case 12:
      uint64_t result = "FavoriteMenu";
      break;
    case 13:
      uint64_t result = "Exit";
      break;
    case 16:
      uint64_t result = "MediaTopMenu";
      break;
    case 17:
      uint64_t result = "MediaContextSensitiveMenu";
      break;
    case 29:
      uint64_t result = "NumberEntryMode";
      break;
    case 30:
      uint64_t result = "Number11";
      break;
    case 31:
      uint64_t result = "Number12";
      break;
    case 32:
      uint64_t result = "Number0or10";
      break;
    case 33:
      uint64_t result = "Number1";
      break;
    case 34:
      uint64_t result = "Number2";
      break;
    case 35:
      uint64_t result = "Number3";
      break;
    case 36:
      uint64_t result = "Number4";
      break;
    case 37:
      uint64_t result = "Number5";
      break;
    case 38:
      uint64_t result = "Number6";
      break;
    case 39:
      uint64_t result = "Number7";
      break;
    case 40:
      uint64_t result = "Number8";
      break;
    case 41:
      uint64_t result = "Number9";
      break;
    case 42:
      uint64_t result = "Dot";
      break;
    case 43:
      uint64_t result = "Enter";
      break;
    case 44:
      uint64_t result = "Clear";
      break;
    case 47:
      uint64_t result = "NextFavorite";
      break;
    case 48:
      uint64_t result = "ChannelUp";
      break;
    case 49:
      uint64_t result = "ChannelDown";
      break;
    case 50:
      uint64_t result = "PreviousChannel";
      break;
    case 51:
      uint64_t result = "SoundSelect";
      break;
    case 52:
      uint64_t result = "InputSelect";
      break;
    case 53:
      uint64_t result = "DisplayInformation";
      break;
    case 54:
      uint64_t result = "Help";
      break;
    case 55:
      uint64_t result = "PageUp";
      break;
    case 56:
      uint64_t result = "PageDown";
      break;
    case 64:
      uint64_t result = "Power";
      break;
    case 65:
      uint64_t result = "VolumeUp";
      break;
    case 66:
      uint64_t result = "VolumeDown";
      break;
    case 67:
      uint64_t result = "Mute";
      break;
    case 68:
      uint64_t result = "Play";
      break;
    case 69:
      uint64_t result = "Stop";
      break;
    case 70:
      uint64_t result = "Pause";
      break;
    case 71:
      uint64_t result = "Record";
      break;
    case 72:
      uint64_t result = "Rewind";
      break;
    case 73:
      uint64_t result = "FastForward";
      break;
    case 74:
      uint64_t result = "Eject";
      break;
    case 75:
      uint64_t result = "Forward";
      break;
    case 76:
      uint64_t result = "Backward";
      break;
    case 77:
      uint64_t result = "StopRecord";
      break;
    case 78:
      uint64_t result = "PauseRecord";
      break;
    case 79:
      uint64_t result = "Reserved";
      break;
    case 80:
      uint64_t result = "Angle";
      break;
    case 81:
      uint64_t result = "SubPicture";
      break;
    case 82:
      uint64_t result = "VideoOnDemand";
      break;
    case 83:
      uint64_t result = "ElectronicProgramGuide";
      break;
    case 84:
      uint64_t result = "TimerProgramming";
      break;
    case 85:
      uint64_t result = "InitialConfiguration";
      break;
    case 86:
      uint64_t result = "SelectBroadcastType";
      break;
    case 87:
      uint64_t result = "SelectSoundPresentation";
      break;
    case 96:
      if ((v1 - 5) >= 0x21u) {
        uint64_t result = "PlayFunction[Unknown Operand]";
      }
      else {
        uint64_t result = off_2652E3BA0[(char)(v1 - 5)];
      }
      break;
    case 97:
      uint64_t result = "PausePlayFunction";
      break;
    case 98:
      uint64_t result = "RecordFunction";
      break;
    case 99:
      uint64_t result = "PauseRecordFunction";
      break;
    case 100:
      uint64_t result = "StopFunction";
      break;
    case 101:
      uint64_t result = "MuteFunction";
      break;
    case 102:
      uint64_t result = "RestoreVolumeFunction";
      break;
    case 103:
      uint64_t result = "TuneFunction[Channel ID]";
      break;
    case 104:
      uint64_t result = "SelectMediaFunction[Media Number]";
      break;
    case 105:
      uint64_t result = "SelectAVInputFunction[A/V Input Number]";
      break;
    case 106:
      uint64_t result = "SelectAudioInputFunction[Audio Input Number]";
      break;
    case 107:
      uint64_t result = "PowerToggleFunction";
      break;
    case 108:
      uint64_t result = "PowerOffFunction";
      break;
    case 109:
      uint64_t result = "PowerOnFunction";
      break;
    case 113:
      uint64_t result = "F1";
      break;
    case 114:
      uint64_t result = "F2";
      break;
    case 115:
      uint64_t result = "F3";
      break;
    case 116:
      uint64_t result = "F4";
      break;
    case 117:
      uint64_t result = "F5";
      break;
    case 118:
      uint64_t result = "Data";
      break;
    default:
      uint64_t result = "Unknown";
      break;
  }
  return result;
}

uint64_t CECUserControlEquals(unint64_t a1, uint64_t a2)
{
  if (a2 != a1) {
    return 0;
  }
  unint64_t v3 = HIDWORD(a1);
  int v4 = a1;
  uint64_t result = 1;
  switch(v4)
  {
    case 'h':
    case 'i':
    case 'j':
      uint64_t result = (BYTE4(a2) ^ v3) == 0;
      break;
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
      return result;
    case 'g':
      unsigned int v7 = HIDWORD(a2) ^ v3;
      BOOL v9 = (v7 & 0xFFC0) == 0 && v7 < 0x10000;
      uint64_t result = (v7 & 0x3F) == 0 && v9;
      break;
    default:
      BOOL v5 = BYTE4(a2) == v3;
      BOOL v6 = (BYTE4(a2) ^ v3) == 0;
      if (v4 != 86) {
        BOOL v6 = 1;
      }
      if (v4 == 87) {
        uint64_t result = v5;
      }
      else {
        uint64_t result = v6;
      }
      break;
  }
  return result;
}

const char *CECDeckControlModeString(char a1)
{
  if ((a1 - 1) > 3u) {
    return "Unknown";
  }
  else {
    return off_2652E3CA8[(char)(a1 - 1)];
  }
}

const char *CECPlayModeString(int a1)
{
  if ((a1 - 5) > 0x20) {
    return "Unknown";
  }
  else {
    return off_2652E3CC8[(char)(a1 - 5)];
  }
}

uint64_t CECUserControlForCoreRCCommand(char *a1, uint64_t a2)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 1:
      *a1 = 0;
      goto LABEL_85;
    case 2:
      uint64_t result = 1;
      *a1 = 1;
      return result;
    case 3:
      char v4 = 2;
      goto LABEL_84;
    case 4:
      char v4 = 3;
      goto LABEL_84;
    case 5:
      char v4 = 4;
      goto LABEL_84;
    case 6:
      char v4 = 5;
      goto LABEL_84;
    case 7:
      char v4 = 6;
      goto LABEL_84;
    case 8:
      char v4 = 7;
      goto LABEL_84;
    case 9:
      char v4 = 8;
      goto LABEL_84;
    case 10:
      char v4 = 9;
      goto LABEL_84;
    case 11:
      char v4 = 10;
      goto LABEL_84;
    case 12:
      char v4 = 11;
      goto LABEL_84;
    case 13:
      char v4 = 12;
      goto LABEL_84;
    case 14:
      char v4 = 13;
      goto LABEL_84;
    case 16:
      char v4 = 17;
      goto LABEL_84;
    case 17:
      char v4 = 29;
      goto LABEL_84;
    case 18:
      char v4 = 30;
      goto LABEL_84;
    case 19:
      char v4 = 31;
      goto LABEL_84;
    case 20:
      char v4 = 32;
      goto LABEL_84;
    case 21:
      char v4 = 33;
      goto LABEL_84;
    case 22:
      char v4 = 34;
      goto LABEL_84;
    case 23:
      char v4 = 35;
      goto LABEL_84;
    case 24:
      char v4 = 36;
      goto LABEL_84;
    case 25:
      char v4 = 37;
      goto LABEL_84;
    case 26:
      char v4 = 38;
      goto LABEL_84;
    case 27:
      char v4 = 39;
      goto LABEL_84;
    case 28:
      char v4 = 40;
      goto LABEL_84;
    case 29:
      char v4 = 41;
      goto LABEL_84;
    case 30:
      char v4 = 42;
      goto LABEL_84;
    case 31:
      char v4 = 43;
      goto LABEL_84;
    case 32:
      char v4 = 44;
      goto LABEL_84;
    case 33:
      char v4 = 47;
      goto LABEL_84;
    case 34:
      char v4 = 48;
      goto LABEL_84;
    case 35:
      char v4 = 49;
      goto LABEL_84;
    case 36:
      char v4 = 50;
      goto LABEL_84;
    case 37:
      char v4 = 51;
      goto LABEL_84;
    case 38:
      char v4 = 52;
      goto LABEL_84;
    case 39:
      char v4 = 53;
      goto LABEL_84;
    case 40:
      char v4 = 54;
      goto LABEL_84;
    case 41:
      char v4 = 55;
      goto LABEL_84;
    case 42:
      char v4 = 56;
      goto LABEL_84;
    case 43:
      char v4 = 65;
      goto LABEL_84;
    case 44:
      char v4 = 66;
      goto LABEL_84;
    case 45:
      char v4 = 67;
      goto LABEL_84;
    case 46:
      char v4 = 68;
      goto LABEL_84;
    case 47:
      char v4 = 70;
      goto LABEL_84;
    case 48:
      char v4 = 72;
      goto LABEL_84;
    case 49:
      char v4 = 73;
      goto LABEL_84;
    case 50:
      char v4 = 74;
      goto LABEL_84;
    case 51:
      char v4 = 75;
      goto LABEL_84;
    case 52:
      char v4 = 76;
      goto LABEL_84;
    case 53:
      char v4 = 77;
      goto LABEL_84;
    case 54:
      char v4 = 80;
      goto LABEL_84;
    case 55:
      char v4 = 81;
      goto LABEL_84;
    case 56:
      *a1 = 86;
      a1[4] = 0;
      goto LABEL_85;
    case 57:
      *a1 = 87;
      char v5 = 0x80;
      goto LABEL_69;
    case 58:
      *a1 = 87;
      char v5 = -79;
      goto LABEL_69;
    case 59:
      *a1 = 87;
      char v5 = -78;
      goto LABEL_69;
    case 60:
      *a1 = 87;
      char v5 = -77;
      goto LABEL_69;
    case 61:
      *a1 = 87;
      char v5 = -63;
      goto LABEL_69;
    case 62:
      *a1 = 87;
      char v5 = -62;
      goto LABEL_69;
    case 63:
      *a1 = 87;
      char v5 = -61;
      goto LABEL_69;
    case 64:
      char v4 = 88;
      goto LABEL_84;
    case 65:
      char v4 = 89;
      goto LABEL_84;
    case 66:
      char v4 = 90;
      goto LABEL_84;
    case 67:
      *a1 = 96;
      char v5 = 36;
      goto LABEL_69;
    case 68:
      *a1 = 96;
      char v5 = 37;
LABEL_69:
      a1[4] = v5;
      goto LABEL_85;
    case 69:
      char v4 = 97;
      goto LABEL_84;
    case 70:
      char v4 = 98;
      goto LABEL_84;
    case 71:
      char v4 = 99;
      goto LABEL_84;
    case 72:
      char v4 = 100;
      goto LABEL_84;
    case 73:
      char v4 = 107;
      goto LABEL_84;
    case 74:
      char v4 = 108;
      goto LABEL_84;
    case 75:
      char v4 = 109;
      goto LABEL_84;
    case 76:
      char v4 = 113;
      goto LABEL_84;
    case 77:
      char v4 = 114;
      goto LABEL_84;
    case 78:
      char v4 = 115;
      goto LABEL_84;
    case 79:
      char v4 = 116;
      goto LABEL_84;
    case 80:
      char v4 = 117;
      goto LABEL_84;
    case 84:
      char v4 = 16;
      goto LABEL_84;
    case 90:
      char v4 = 83;
LABEL_84:
      *a1 = v4;
LABEL_85:
      uint64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t CoreRCCommandForCECUserControl(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 1;
  switch((char)a2)
  {
    case 0:
      goto LABEL_93;
    case 1:
      uint64_t v3 = 2;
      goto LABEL_93;
    case 2:
      uint64_t v3 = 3;
      goto LABEL_93;
    case 3:
      uint64_t v3 = 4;
      goto LABEL_93;
    case 4:
      uint64_t v3 = 5;
      goto LABEL_93;
    case 5:
      uint64_t v3 = 6;
      goto LABEL_93;
    case 6:
      uint64_t v3 = 7;
      goto LABEL_93;
    case 7:
      uint64_t v3 = 8;
      goto LABEL_93;
    case 8:
      uint64_t v3 = 9;
      goto LABEL_93;
    case 9:
      uint64_t v3 = 10;
      goto LABEL_93;
    case 10:
      uint64_t v3 = 11;
      goto LABEL_93;
    case 11:
      uint64_t v3 = 12;
      goto LABEL_93;
    case 12:
      uint64_t v3 = 13;
      goto LABEL_93;
    case 13:
      uint64_t v3 = 14;
      goto LABEL_93;
    case 16:
      uint64_t v3 = 84;
      goto LABEL_93;
    case 17:
      uint64_t v3 = 16;
      goto LABEL_93;
    case 29:
      uint64_t v3 = 17;
      goto LABEL_93;
    case 30:
      uint64_t v3 = 18;
      goto LABEL_93;
    case 31:
      uint64_t v3 = 19;
      goto LABEL_93;
    case 32:
      uint64_t v3 = 20;
      goto LABEL_93;
    case 33:
      uint64_t v3 = 21;
      goto LABEL_93;
    case 34:
      uint64_t v3 = 22;
      goto LABEL_93;
    case 35:
      uint64_t v3 = 23;
      goto LABEL_93;
    case 36:
      uint64_t v3 = 24;
      goto LABEL_93;
    case 37:
      uint64_t v3 = 25;
      goto LABEL_93;
    case 38:
      uint64_t v3 = 26;
      goto LABEL_93;
    case 39:
      uint64_t v3 = 27;
      goto LABEL_93;
    case 40:
      uint64_t v3 = 28;
      goto LABEL_93;
    case 41:
      uint64_t v3 = 29;
      goto LABEL_93;
    case 42:
      uint64_t v3 = 30;
      goto LABEL_93;
    case 43:
      uint64_t v3 = 31;
      goto LABEL_93;
    case 44:
      uint64_t v3 = 32;
      goto LABEL_93;
    case 47:
      uint64_t v3 = 33;
      goto LABEL_93;
    case 48:
      uint64_t v3 = 34;
      goto LABEL_93;
    case 49:
      uint64_t v3 = 35;
      goto LABEL_93;
    case 50:
      uint64_t v3 = 36;
      goto LABEL_93;
    case 51:
      uint64_t v3 = 37;
      goto LABEL_93;
    case 52:
      uint64_t v3 = 38;
      goto LABEL_93;
    case 53:
      uint64_t v3 = 39;
      goto LABEL_93;
    case 54:
      uint64_t v3 = 40;
      goto LABEL_93;
    case 55:
      uint64_t v3 = 41;
      goto LABEL_93;
    case 56:
      uint64_t v3 = 42;
      goto LABEL_93;
    case 64:
    case 107:
      uint64_t v3 = 73;
      goto LABEL_93;
    case 65:
      uint64_t v3 = 43;
      goto LABEL_93;
    case 66:
      uint64_t v3 = 44;
      goto LABEL_93;
    case 67:
      uint64_t v3 = 45;
      goto LABEL_93;
    case 68:
      uint64_t v3 = 46;
      goto LABEL_93;
    case 69:
    case 77:
    case 100:
      uint64_t v3 = 72;
      goto LABEL_93;
    case 70:
      uint64_t v3 = 47;
      goto LABEL_93;
    case 71:
    case 98:
      uint64_t v3 = 70;
      goto LABEL_93;
    case 72:
      uint64_t v3 = 48;
      goto LABEL_93;
    case 73:
      uint64_t v3 = 49;
      goto LABEL_93;
    case 74:
      uint64_t v3 = 50;
      goto LABEL_93;
    case 75:
      uint64_t v3 = 51;
      goto LABEL_93;
    case 76:
      uint64_t v3 = 52;
      goto LABEL_93;
    case 78:
      uint64_t v3 = 71;
      goto LABEL_93;
    case 80:
      uint64_t v3 = 54;
      goto LABEL_93;
    case 81:
      uint64_t v3 = 55;
      goto LABEL_93;
    case 83:
      uint64_t v3 = 90;
      goto LABEL_93;
    case 86:
      if ((a2 & 0xFF00000000) != 0) {
        return 0;
      }
      uint64_t v3 = 56;
      goto LABEL_93;
    case 87:
      uint64_t v2 = 0;
      if (BYTE4(a2) <= 0xB2u)
      {
        switch(BYTE4(a2))
        {
          case 0x80u:
            uint64_t v3 = 57;
            break;
          case 0xB1u:
            uint64_t v3 = 58;
            break;
          case 0xB2u:
            uint64_t v3 = 59;
            break;
          default:
            return v2;
        }
      }
      else if (BYTE4(a2) > 0xC1u)
      {
        if (BYTE4(a2) == 194)
        {
          uint64_t v3 = 62;
        }
        else
        {
          if (BYTE4(a2) != 195) {
            return v2;
          }
          uint64_t v3 = 63;
        }
      }
      else if (BYTE4(a2) == 179)
      {
        uint64_t v3 = 60;
      }
      else
      {
        if (BYTE4(a2) != 193) {
          return v2;
        }
        uint64_t v3 = 61;
      }
      goto LABEL_93;
    case 88:
      uint64_t v3 = 64;
      goto LABEL_93;
    case 89:
      uint64_t v3 = 65;
      goto LABEL_93;
    case 90:
      uint64_t v3 = 66;
      goto LABEL_93;
    case 96:
      if (BYTE4(a2) == 36)
      {
        uint64_t v3 = 67;
      }
      else
      {
        if (BYTE4(a2) != 37) {
          return 0;
        }
        uint64_t v3 = 68;
      }
LABEL_93:
      *a1 = v3;
      return 1;
    case 108:
      uint64_t v3 = 74;
      goto LABEL_93;
    case 109:
      uint64_t v3 = 75;
      goto LABEL_93;
    case 113:
      uint64_t v3 = 76;
      goto LABEL_93;
    case 114:
      uint64_t v3 = 77;
      goto LABEL_93;
    case 115:
      uint64_t v3 = 78;
      goto LABEL_93;
    case 116:
      uint64_t v3 = 79;
      goto LABEL_93;
    case 117:
      uint64_t v3 = 80;
      goto LABEL_93;
    default:
      return v2;
  }
}

BOOL CoreRCCommandForCECDeckControlMode(void *a1, char a2)
{
  unsigned int v2 = (a2 - 1);
  if (v2 <= 3) {
    *a1 = qword_24C4F7520[(char)(a2 - 1)];
  }
  return v2 < 4;
}

uint64_t CoreRCCommandForCECPlayMode(uint64_t *a1, int a2)
{
  if (a2 == 7)
  {
    uint64_t v2 = 67;
    goto LABEL_5;
  }
  if (a2 == 9)
  {
    uint64_t v2 = 68;
LABEL_5:
    *a1 = v2;
    return 1;
  }
  return 0;
}

uint64_t CoreRCCommandFromLegacyHIDUsage(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 | (unint64_t)(a2 << 32);
  if (v4 <= 0xC000000AFLL)
  {
    uint64_t v6 = v4 - 0x100000086;
    uint64_t v5 = 1;
    switch(v6)
    {
      case 0:
        uint64_t v5 = 15;
        goto LABEL_20;
      case 3:
        goto LABEL_20;
      case 4:
        uint64_t v5 = 5;
        goto LABEL_20;
      case 5:
        uint64_t v5 = 4;
        goto LABEL_20;
      case 6:
        uint64_t v5 = 2;
        goto LABEL_20;
      case 7:
        uint64_t v5 = 3;
        goto LABEL_20;
      default:
        return v3;
    }
  }
  else
  {
    switch(v4)
    {
      case 0xC000000B0:
        uint64_t v5 = 67;
        break;
      case 0xC000000B1:
        uint64_t v5 = 47;
        break;
      case 0xC000000B2:
        return v3;
      case 0xC000000B3:
        uint64_t v5 = 49;
        break;
      case 0xC000000B4:
        uint64_t v5 = 48;
        break;
      case 0xC000000B5:
        uint64_t v5 = 83;
        break;
      case 0xC000000B6:
        uint64_t v5 = 82;
        break;
      case 0xC000000B7:
        uint64_t v5 = 72;
        break;
      default:
        if (v4 == 0xC000000C6)
        {
          uint64_t v5 = 51;
        }
        else
        {
          if (v4 != 0xC000000C7) {
            return v3;
          }
          uint64_t v5 = 52;
        }
        break;
    }
LABEL_20:
    *a1 = v5;
    return 1;
  }
}

void sub_24C4C64B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t CoreCECAddressString(unsigned int a1)
{
  char v1 = NSString;
  uint64_t v2 = CECAddressString(a1, 1);
  return [v1 stringWithUTF8String:v2];
}

uint64_t CoreCECPhysicalAddressString(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  unsigned __int16 v5 = 0;
  BOOL v2 = PackedPhysicalAddressForCoreCECPhysicalAddress(&v5, a1);
  uint64_t v3 = NSString;
  if (!v2) {
    return objc_msgSend(NSString, "stringWithFormat:", @"<invalid address: %08x>", a1);
  }
  v6[0] = CECPhysicalAddressStringWithAddress(v5);
  return [v3 stringWithUTF8String:v6];
}

uint64_t CoreCECDeviceTypeString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForDeviceType:a1];
}

__CFString *CoreCECVendorIDString(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 == -1) {
    return @"Unknown";
  }
  char v1 = NSString;
  uint64_t v4 = CECVendorIDStringWithID(a1);
  char v5 = v2;
  return (__CFString *)[v1 stringWithUTF8String:&v4];
}

__CFString *CoreCECVersionString(uint64_t a1)
{
  if (a1 == -1) {
    return @"Unknown";
  }
  char v2 = (char *)CECVersionString(a1);
  uint64_t v3 = NSString;
  if (v2 == "Unknown") {
    return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Other (%u)", a1);
  }
  return (__CFString *)objc_msgSend(v3, "stringWithUTF8String:");
}

__CFString *CoreCECPowerStatusString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4) {
    char v1 = kCoreCECGenericStringUnknown;
  }
  else {
    char v1 = &off_2652E3E98[a1 - 1];
  }
  return *v1;
}

uint64_t CoreCECDeckInfoString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForDeckInfo:a1];
}

uint64_t CoreCECDeckControlModeString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForDeckControlMode:a1];
}

uint64_t CoreCECPlayModeString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForPlayMode:a1];
}

uint64_t CoreCECStatusRequestTypeString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForRequestType:a1];
}

uint64_t CoreCECSystemAudioModeStatusString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForSystemAudioStatus:a1];
}

uint64_t CoreCECActivationStatusString(uint64_t a1)
{
  id v2 = +[CoreCECTypesInternal defaultTypes];
  return [v2 stringForActivationStatus:a1];
}

__CFString *CoreCECRCProfileString(void *a1)
{
  __int16 v3 = 0;
  if (!a1) {
    return @"None";
  }
  if (!CECRCProfileForCoreCECRCProfile(&v3, a1)) {
    return (__CFString *)[NSString stringWithFormat:@"<invalid profile: %@>", a1];
  }
  if ((_BYTE)v3)
  {
    if (v3 == 1) {
      return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Source(0x%02X)", HIBYTE(v3));
    }
    return (__CFString *)[NSString stringWithFormat:@"<invalid profile: %@>", a1];
  }
  return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"TV(%u)", HIBYTE(v3));
}

uint64_t CoreCECDeviceSourceRCProfileWithSupportedMenuCommands(uint64_t *a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  for (i = (void *)[MEMORY[0x263EFF980] array]; a2; --a2)
  {
    uint64_t v5 = *a1++;
    objc_msgSend(i, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v5));
  }
  unsigned int v7 = @"kCoreCECDeviceRCProfileKeySource";
  v8[0] = [MEMORY[0x263EFFA08] setWithArray:i];
  return [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
}

uint64_t CoreCECDeviceTVRCProfileWithID(uint64_t a1)
{
  v3[1] = *MEMORY[0x263EF8340];
  id v2 = @"kCoreCECDeviceRCProfileKeyTV";
  v3[0] = [NSNumber numberWithUnsignedInteger:a1];
  return [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
}

void sub_24C4CBF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_24C4CC1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24C4CC484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24C4D09E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

__CFString *CoreRCCommandString(unint64_t a1)
{
  if (a1 > 0x76) {
    return 0;
  }
  else {
    return off_2652E47F0[a1];
  }
}

uint64_t CoreRCCommandForString(void *a1)
{
  uint64_t result = [a1 UTF8String];
  if (result)
  {
    id v2 = (const char *)result;
    uint64_t v3 = 0;
    while (strcasecmp((const char *)CoreRCCommandForString_table[v3 + 1], v2))
    {
      v3 += 2;
      if (v3 == 236) {
        return 0;
      }
    }
    return CoreRCCommandForString_table[v3];
  }
  return result;
}

void *CoreRCXPCServiceInterface()
{
  uint64_t v0 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FEE7A28];
  char v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0), sel_queryBusesAsync_, 0, 1);
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_changeButtonCombinationAsync_delay_enabled_forDevice_reply_, 0, 0);
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), sel_setCommandAsync_target_source_forButtonCombination_delay_reply_, 3, 0);
  return v0;
}

uint64_t CoreRCXPCClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FEE7A88];
}

void sub_24C4E2F90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CoreCECStatusRequestForCECStatusRequest(void *a1, int a2)
{
  if ((a2 - 1) <= 2) {
    *a1 = qword_24C4F75C8[(char)(a2 - 1)];
  }
  return (a2 - 1) < 3u;
}

BOOL CECStatusRequestForCoreCECStatusRequest(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 2) {
    *a1 = 0x30102u >> (8 * v2);
  }
  return v2 < 3;
}

uint64_t CoreCECSystemAudioModeStatusForCECSystemAudioModeStatus(uint64_t *a1, int a2)
{
  if (!a2)
  {
    uint64_t v2 = 1;
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    uint64_t v2 = 2;
LABEL_5:
    *a1 = v2;
    return 1;
  }
  return 0;
}

uint64_t CECSystemAudioModeStatusForCoreCECSystemAudioModeStatus(char *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    char v3 = 0;
    goto LABEL_5;
  }
  uint64_t v2 = 0;
  if (a2 == 2)
  {
    char v3 = 1;
LABEL_5:
    *a1 = v3;
    return 1;
  }
  return v2;
}

BOOL CECDeckControlModeForCoreCECDeckControlMode(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 3) {
    *a1 = 0x3020104u >> (8 * v2);
  }
  return v2 < 4;
}

BOOL CoreCECDeckControlModeForCECDeckControlMode(void *a1, char a2)
{
  unsigned int v2 = (a2 - 1);
  if (v2 <= 3) {
    *a1 = qword_24C4F75E0[(char)(a2 - 1)];
  }
  return v2 < 4;
}

BOOL CECDeckInfoForCoreCECDeckInfo(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 0xE) {
    *a1 = byte_24C4F7600[v2];
  }
  return v2 < 0xF;
}

BOOL CoreCECDeckInfoForCECDeckInfo(void *a1, int a2)
{
  if ((a2 - 17) <= 0xE) {
    *a1 = qword_24C4F7610[(char)(a2 - 17)];
  }
  return (a2 - 17) < 0xFu;
}

BOOL CECPlayModeForCoreCECPlayMode(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 0xE) {
    *a1 = byte_24C4F7688[v2];
  }
  return v2 < 0xF;
}

uint64_t CoreCECPlayModeForCECPlayMode(void *a1, int a2)
{
  char v2 = a2 - 5;
  if ((a2 - 5) > 0x20 || ((0x188770077uLL >> v2) & 1) == 0) {
    return 0;
  }
  *a1 = qword_24C4F7698[v2];
  return 1;
}

BOOL CECPowerStatusForCoreCECPowerStatus(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 3) {
    *a1 = v2;
  }
  return v2 < 4;
}

BOOL CoreCECPowerStatusForCECPowerStatus(void *a1, unsigned int a2)
{
  if (a2 <= 3) {
    *a1 = a2 + 1;
  }
  return a2 < 4;
}

BOOL CECDeviceTypeForCoreCECDeviceType(unsigned char *a1, uint64_t a2)
{
  unint64_t v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) <= 7) {
    *a1 = 0x700030201060405uLL >> (8 * v2);
  }
  return v2 < 8;
}

BOOL CoreCECDeviceTypeForCECDeviceType(void *a1, unsigned int a2)
{
  if (a2 <= 7) {
    *a1 = qword_24C4F77A0[(char)a2];
  }
  return a2 < 8;
}

BOOL CoreCECPhysicalAddressForPackedPhysicalAddress(void *a1, unsigned int a2)
{
  BOOL result = CECPhysicalAddressIsValid(a2);
  if (result) {
    *a1 = (a2 | (a2 << 8)) & 0xF000F | ((unsigned __int16)a2 >> 12 << 24) | (a2 >> 4 << 8);
  }
  return result;
}

BOOL CoreCECPhysicalAddressIsValid(unsigned int a1)
{
  return PackedPhysicalAddressForCoreCECPhysicalAddress(&v2, a1);
}

BOOL PackedPhysicalAddressForCoreCECPhysicalAddress(_WORD *a1, unsigned int a2)
{
  if ((a2 & 0xF0F0F0F0) != 0) {
    return 0;
  }
  *a1 = a2 & 0xF | ((BYTE2(a2) & 0xF) << 8) | (a2 >> 12) & 0xF000 | (a2 >> 4) & 0xF0;
  return CECPhysicalAddressIsValid(a2 & 0xF | ((HIWORD(a2) & 0xF) << 8) | (a2 >> 12) & 0xF000 | (a2 >> 4) & 0xF0);
}

BOOL CoreCECPhysicalAddressIsOnStreamPath(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a1 & 0xFF000000) != 0)
  {
    unsigned int v3 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 4278190080;
    do
    {
      v4 |= v5;
      if (v3 > 2) {
        break;
      }
      unint64_t v6 = a1 & (v5 >> 8);
      v5 >>= 8;
      ++v3;
    }
    while (v6);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (v4 & a2) == a1;
}

uint64_t CECAllDeviceTypesMaskForCoreCECDeviceTypesMask(unsigned char *a1, char a2)
{
  *a1 = a2 & 0x20 | (4 * ((a2 & 0x84) != 0)) & 0x27 | (8 * (a2 & 3)) & 0x3F | (((a2 & 8) != 0) << 6) & 0x7F | (((a2 & 0x40) != 0) << 7);
  return 1;
}

uint64_t CoreCECDeviceTypesMaskForCECAllDeviceTypesMask(uint64_t *a1, unsigned int a2)
{
  if ((a2 & 0x80u) == 0) {
    uint64_t v2 = (a2 >> 3) & 0xB | a2 & 0x24;
  }
  else {
    uint64_t v2 = (a2 >> 3) & 0xB | a2 & 0x24 | 0x40;
  }
  *a1 = v2;
  return 1;
}

uint64_t CECDeviceFeaturesMaskForCoreCECDeviceFeaturesMask(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (a3 == 1) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if ((*(void *)&a2 & 0x10000) == 0) {
    int v3 = 0;
  }
  unsigned int v4 = v3 & 0xFFFFFFFE | (a2 >> 20) & 1;
  if ((a2 & 0x8248) != 0) {
    LOBYTE(v4) = (a2 >> 12) & 8 | (a2 >> 2) & 0x10 | (a2 >> 4) & 0x20 | (((a2 & 8) != 0) << 6) | v4;
  }
  *a1 = v4;
  return 1;
}

uint64_t CoreCECDeviceFeaturesMaskForCECDeviceFeaturesMask(void *a1, unsigned int a2)
{
  *a1 = (a2 >> 3) & 8 | ((a2 << 15) | (a2 << 14)) & 0x10000 | ((a2 & 1) << 20) | (((a2 >> 3) & 1) << 15) | (((a2 >> 4) & 1) << 6) & 0xFFFFFDFF | (((a2 >> 5) & 1) << 9);
  return 1;
}

uint64_t CoreCECRCProfileIDFromCECRCProfileID(void *a1, int a2)
{
  HIDWORD(v3) = a2;
  LODWORD(v3) = a2;
  unsigned int v2 = v3 >> 1;
  if (v2 > 7 || ((0xABu >> v2) & 1) == 0) {
    return 0;
  }
  *a1 = qword_24C4F77E0[v2];
  return 1;
}

unint64_t CECRCProfileIDFromCoreCECRCProfileID(unint64_t a1)
{
  unint64_t v1 = 0xE0A060200uLL >> (8 * a1);
  if (a1 >= 5) {
    LOBYTE(v1) = 0;
  }
  return v1 & 0xE;
}

uint64_t CECRCProfileForCoreCECRCProfile(unsigned char *a1, void *a2)
{
  unsigned int v4 = (void *)[a2 valueForKey:@"kCoreCECDeviceRCProfileKeySource"];
  uint64_t result = [a2 valueForKey:@"kCoreCECDeviceRCProfileKeyTV"];
  if (v4)
  {
    *a1 = 1;
    if ([v4 containsObject:&unk_26FEDAA38]) {
      a1[1] |= 1u;
    }
    if ([v4 containsObject:&unk_26FEDAA50]) {
      a1[1] |= 2u;
    }
    if ([v4 containsObject:&unk_26FEDAA68]) {
      a1[1] |= 4u;
    }
    if ([v4 containsObject:&unk_26FEDAA80]) {
      a1[1] |= 8u;
    }
    if (![v4 containsObject:&unk_26FEDAA98]) {
      return 1;
    }
    LOBYTE(v6) = a1[1] | 0x10;
  }
  else
  {
    if (!result) {
      return result;
    }
    *a1 = 0;
    unsigned int v7 = [(id)result unsignedIntValue];
    unint64_t v6 = 0xE0A060200uLL >> (8 * v7);
    if (v7 >= 5) {
      LOBYTE(v6) = 0;
    }
  }
  a1[1] = v6;
  return 1;
}

uint64_t CoreCECRCProfileForCECRCProfile(void *a1, unsigned char *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  *a1 = 0;
  if (*a2)
  {
    if (*a2 != 1) {
      return 1;
    }
    unsigned int v4 = (void *)[MEMORY[0x263EFF9C0] set];
    unint64_t v5 = v4;
    char v6 = a2[1];
    if (v6)
    {
      [v4 addObject:&unk_26FEDAA38];
      char v6 = a2[1];
      if ((v6 & 2) == 0)
      {
LABEL_5:
        if ((v6 & 4) == 0) {
          goto LABEL_6;
        }
        goto LABEL_18;
      }
    }
    else if ((a2[1] & 2) == 0)
    {
      goto LABEL_5;
    }
    [v5 addObject:&unk_26FEDAA50];
    char v6 = a2[1];
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v5 addObject:&unk_26FEDAA68];
    char v6 = a2[1];
    if ((v6 & 8) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0)
      {
LABEL_9:
        uint64_t v16 = @"kCoreCECDeviceRCProfileKeySource";
        v17[0] = v5;
        unsigned int v7 = NSDictionary;
        uint64_t v8 = v17;
        uint64_t v9 = &v16;
LABEL_10:
        *a1 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
        return 1;
      }
LABEL_8:
      [v5 addObject:&unk_26FEDAA98];
      goto LABEL_9;
    }
LABEL_19:
    [v5 addObject:&unk_26FEDAA80];
    if ((a2[1] & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  HIDWORD(v12) = a2[1];
  LODWORD(v12) = HIDWORD(v12);
  unsigned int v11 = v12 >> 1;
  if (v11 <= 7 && ((0xABu >> v11) & 1) != 0)
  {
    uint64_t v13 = qword_24C4F77E0[v11];
    uint64_t v14 = @"kCoreCECDeviceRCProfileKeyTV";
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v13];
    unsigned int v7 = NSDictionary;
    uint64_t v8 = &v15;
    uint64_t v9 = &v14;
    goto LABEL_10;
  }
  return 0;
}

void sub_24C4EAE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void CECPhysicalAddressStringWithAddress_cold_1()
{
}

void CECPhysicalAddressStringWithAddress_cold_2()
{
}

void CECVendorIDStringWithID_cold_1()
{
}

void CECVendorIDStringWithID_cold_2()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x270EF4230]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x270EF42F0]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x270EF4300]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t LogControl()
{
  return MEMORY[0x270F243E0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t LogShow()
{
  return MEMORY[0x270F24410]();
}

uint64_t MillisecondsToUpTicks()
{
  return MEMORY[0x270F24448]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x270EF2A30](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t NanosecondsToUpTicks()
{
  return MEMORY[0x270F24500]();
}

uint64_t Parity32()
{
  return MEMORY[0x270F24618]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x270F24808]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270ED8468]();
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

void free_printf_domain(printf_domain_t __domain)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x270EDA700]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

int register_printf_domain_render_std(printf_domain_t __domain, const char *__specs)
{
  return MEMORY[0x270EDB1D0](__domain, __specs);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int sxprintf(char *__str, size_t __size, printf_domain_t __domain, locale_t __loc, const char *__format, ...)
{
  return MEMORY[0x270EDB768](__str, __size, __domain, __loc, __format);
}