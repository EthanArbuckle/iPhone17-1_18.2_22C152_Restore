const char *IOReturnName(int a1)
{
  const char *result;

  switch(a1)
  {
    case -536870212:
      result = "kIOReturnError";
      break;
    case -536870211:
    case -536870210:
    case -536870209:
    case -536870208:
    case -536870205:
    case -536870204:
    case -536870202:
    case -536870200:
      goto LABEL_6;
    case -536870207:
      result = "kIOReturnNotPrivileged";
      break;
    case -536870206:
      result = "kIOReturnBadArgument";
      break;
    case -536870203:
      result = "kIOReturnExclusiveAccess";
      break;
    case -536870201:
      result = "kIOReturnUnsupported";
      break;
    case -536870199:
      result = "kIOReturnInternalError";
      break;
    case -536870198:
      result = "kIOReturnIOError";
      break;
    default:
      if (a1 == -536870174)
      {
        result = "kIOReturnNotPermitted";
      }
      else if (a1)
      {
LABEL_6:
        result = "unknown error";
      }
      else
      {
        result = "kIOReturnSuccess";
      }
      break;
  }
  return result;
}

uint64_t callIOFunction(int a1, mach_port_t a2, const void *a3, void *a4)
{
  v8 = DiagnosticLogHandleForCategory(6);
  v9 = v8;
  if (a1 == 2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction kSMCHandleYPCEvent command", (uint8_t *)v13, 2u);
    }

    v13[0] = 168;
    uint64_t v10 = IOConnectCallStructMethod(a2, 2u, a3, 0xA8uLL, a4, v13);
    v11 = DiagnosticLogHandleForCategory(6);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "SMC::callIOFunction IOConnectCallStructMethod result = %d", buf, 8u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      callIOFunction_cold_1(a1, v9);
    }

    return 3758097084;
  }
  return v10;
}

uint64_t smckSMCMakeUInt32Key(const char *a1)
{
  size_t v2 = strlen(a1);
  size_t v3 = 0;
  LODWORD(result) = 0;
  int v5 = 24;
  do
  {
    if (v2 <= v3) {
      int v6 = 32;
    }
    else {
      int v6 = a1[v3];
    }
    uint64_t result = (v6 << v5) | result;
    ++v3;
    v5 -= 8;
  }
  while (v3 != 4);
  return result;
}

uint64_t returnEnumForDataTypeStr(int a1)
{
  uint64_t v2 = 5;
  if (a1 > 1936734262)
  {
    if (a1 <= 1936747106)
    {
      if (a1 <= 1936745321)
      {
        if (a1 <= 1936744756)
        {
          if (a1 > 1936734517)
          {
            if (a1 != 1936734518)
            {
              if (a1 == 1936734573)
              {
                uint64_t v2 = 62;
                goto LABEL_182;
              }
              goto LABEL_141;
            }
            uint64_t v2 = 46;
          }
          else
          {
            if (a1 != 1936734263)
            {
              if (a1 == 1936734318)
              {
                uint64_t v2 = 61;
                goto LABEL_182;
              }
              goto LABEL_141;
            }
            uint64_t v2 = 45;
          }
        }
        else if (a1 <= 1936745011)
        {
          if (a1 != 1936744757)
          {
            if (a1 == 1936744812)
            {
              uint64_t v2 = 63;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 47;
        }
        else
        {
          switch(a1)
          {
            case 1936745012:
              uint64_t v2 = 48;
              break;
            case 1936745067:
              uint64_t v2 = 64;
              break;
            case 1936745267:
              uint64_t v2 = 49;
              goto LABEL_182;
            default:
              goto LABEL_141;
          }
        }
      }
      else if (a1 > 1936746031)
      {
        if (a1 <= 1936746341)
        {
          if (a1 != 1936746032)
          {
            if (a1 == 1936746087)
            {
              uint64_t v2 = 68;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 52;
        }
        else
        {
          switch(a1)
          {
            case 1936746342:
              uint64_t v2 = 69;
              break;
            case 1936746597:
              uint64_t v2 = 70;
              break;
            case 1936746852:
              uint64_t v2 = 71;
              goto LABEL_182;
            default:
              goto LABEL_141;
          }
        }
      }
      else if (a1 <= 1936745576)
      {
        if (a1 != 1936745322)
        {
          if (a1 == 1936745522)
          {
            uint64_t v2 = 50;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 65;
      }
      else
      {
        switch(a1)
        {
          case 1936745577:
            uint64_t v2 = 66;
            break;
          case 1936745777:
            uint64_t v2 = 51;
            break;
          case 1936745832:
            uint64_t v2 = 67;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1936749362)
    {
      if (a1 <= 1936748087)
      {
        if (a1 > 1936747616)
        {
          if (a1 != 1936747617)
          {
            if (a1 == 1936747833)
            {
              uint64_t v2 = 75;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 74;
        }
        else
        {
          if (a1 != 1936747107)
          {
            if (a1 == 1936747362)
            {
              uint64_t v2 = 73;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 72;
        }
      }
      else if (a1 <= 1936748597)
      {
        if (a1 != 1936748088)
        {
          if (a1 == 1936748343)
          {
            uint64_t v2 = 78;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 76;
      }
      else
      {
        switch(a1)
        {
          case 1936748598:
            uint64_t v2 = 79;
            break;
          case 1936748853:
            uint64_t v2 = 80;
            break;
          case 1936749108:
            uint64_t v2 = 81;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1969828657)
    {
      if (a1 <= 1936749872)
      {
        if (a1 != 1936749363)
        {
          if (a1 == 1936749618)
          {
            uint64_t v2 = 83;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 82;
      }
      else
      {
        switch(a1)
        {
          case 1936749873:
            uint64_t v2 = 84;
            break;
          case 1936750128:
            uint64_t v2 = 85;
            break;
          case 1969828150:
            uint64_t v2 = 3;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 <= 1969829887)
    {
      if (a1 != 1969828658)
      {
        if (a1 == 1969829428)
        {
          uint64_t v2 = 102;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      uint64_t v2 = 31;
      goto LABEL_182;
    }
    if (a1 == 1969829888 || a1 == 1969829920) {
      goto LABEL_182;
    }
    int v3 = 2071094646;
    goto LABEL_78;
  }
  if (a1 > 1936274225)
  {
    if (a1 <= 1936733026)
    {
      if (a1 <= 1936732277)
      {
        if (a1 > 1936275487)
        {
          if (a1 != 1936275488)
          {
            if (a1 == 1936732262)
            {
              uint64_t v2 = 37;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 6;
        }
        else
        {
          if (a1 != 1936274226)
          {
            if (a1 == 1936274996)
            {
              uint64_t v2 = 101;
              goto LABEL_182;
            }
            goto LABEL_141;
          }
          uint64_t v2 = 100;
        }
      }
      else if (a1 <= 1936732532)
      {
        if (a1 != 1936732278)
        {
          if (a1 == 1936732517)
          {
            uint64_t v2 = 38;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 53;
      }
      else
      {
        switch(a1)
        {
          case 1936732533:
            uint64_t v2 = 54;
            break;
          case 1936732772:
            uint64_t v2 = 39;
            break;
          case 1936732788:
            uint64_t v2 = 55;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
    }
    else if (a1 > 1936733552)
    {
      if (a1 <= 1936733807)
      {
        if (a1 != 1936733553)
        {
          if (a1 == 1936733753)
          {
            uint64_t v2 = 43;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 58;
      }
      else
      {
        switch(a1)
        {
          case 1936733808:
            uint64_t v2 = 59;
            break;
          case 1936734008:
            uint64_t v2 = 9;
            break;
          case 1936734063:
            uint64_t v2 = 60;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
    }
    else if (a1 <= 1936733281)
    {
      if (a1 != 1936733027)
      {
        if (a1 == 1936733043)
        {
          uint64_t v2 = 56;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      uint64_t v2 = 40;
    }
    else
    {
      switch(a1)
      {
        case 1936733282:
          uint64_t v2 = 41;
          break;
        case 1936733298:
          uint64_t v2 = 57;
          break;
        case 1936733537:
          uint64_t v2 = 42;
          goto LABEL_182;
        default:
          goto LABEL_141;
      }
    }
    goto LABEL_182;
  }
  if (a1 <= 1718629729)
  {
    if (a1 > 1718383647)
    {
      if (a1 <= 1718628964)
      {
        if (a1 != 1718383648)
        {
          if (a1 == 1718628710)
          {
            uint64_t v2 = 13;
            goto LABEL_182;
          }
          goto LABEL_141;
        }
        uint64_t v2 = 91;
      }
      else
      {
        switch(a1)
        {
          case 1718628965:
            uint64_t v2 = 14;
            break;
          case 1718629220:
            uint64_t v2 = 15;
            break;
          case 1718629475:
            uint64_t v2 = 18;
            goto LABEL_182;
          default:
            goto LABEL_141;
        }
      }
      goto LABEL_182;
    }
    if (a1 > 1667785073)
    {
      if (a1 != 1667785074)
      {
        if (a1 == 1718378855) {
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      goto LABEL_131;
    }
    if (a1 == 1651076703)
    {
      uint64_t v2 = 89;
      goto LABEL_182;
    }
    int v3 = 1667774506;
LABEL_78:
    if (a1 != v3) {
      goto LABEL_141;
    }
LABEL_131:
    uint64_t v2 = 88;
    goto LABEL_182;
  }
  if (a1 > 1718641459)
  {
    if (a1 <= 1751480414)
    {
      if (a1 != 1718641460)
      {
        if (a1 == 1718641970)
        {
          uint64_t v2 = 19;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      uint64_t v2 = 90;
      goto LABEL_182;
    }
    if (a1 != 1751480415)
    {
      if (a1 != 1768908404)
      {
        if (a1 == 1936273718)
        {
          uint64_t v2 = 29;
          goto LABEL_182;
        }
        goto LABEL_141;
      }
      uint64_t v2 = 103;
      goto LABEL_182;
    }
LABEL_141:
    uint64_t v2 = 87;
    goto LABEL_182;
  }
  if (a1 <= 1718630200)
  {
    if (a1 != 1718629730)
    {
      if (a1 == 1718629985)
      {
        uint64_t v2 = 12;
        goto LABEL_182;
      }
      goto LABEL_141;
    }
    uint64_t v2 = 16;
  }
  else
  {
    switch(a1)
    {
      case 1718630201:
        uint64_t v2 = 17;
        break;
      case 1718630456:
        uint64_t v2 = 7;
        break;
      case 1718640950:
        uint64_t v2 = 33;
        break;
      default:
        goto LABEL_141;
    }
  }
LABEL_182:
  v4 = DiagnosticLogHandleForCategory(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109632;
    v6[1] = a1;
    __int16 v7 = 1024;
    int v8 = v2;
    __int16 v9 = 1024;
    int v10 = 38;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "SMC::convertValue value %u result %d %d", (uint8_t *)v6, 0x14u);
  }

  return v2;
}

double convertKeyToValueMiniT(int a1, size_t __n, void *__src, double a4)
{
  __dst[1] = 0;
  double v4 = -1.0;
  if (__n <= 8)
  {
    int v5 = __n;
    __dst[0] = 0;
    if (__n) {
      memcpy(__dst, __src, __n);
    }
    switch(a1)
    {
      case 2:
        return 0.0;
      case 3:
      case 23:
LABEL_5:
        LOWORD(a4) = __dst[0];
        return (double)*(unint64_t *)&a4;
      case 5:
LABEL_111:
        LOBYTE(a4) = __dst[0];
        return (double)*(unint64_t *)&a4;
      case 6:
        return (double)SLOBYTE(__dst[0]);
      case 7:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_92;
      case 9:
      case 44:
        int v7 = SLOWORD(__dst[0]);
        goto LABEL_91;
      case 11:
        *(float *)&a4 = (float)SLOWORD(__dst[0]);
        goto LABEL_28;
      case 12:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_86;
      case 13:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_71;
      case 14:
      case 22:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_74;
      case 15:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_77;
      case 16:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_83;
      case 17:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_89;
      case 18:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_80;
      case 19:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_106;
      case 20:
        LOWORD(a4) = __dst[0];
        a4 = (double)*(unint64_t *)&a4;
        double v10 = 0.25;
        goto LABEL_25;
      case 21:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (double)*(unint64_t *)&a4 * 0.25;
        goto LABEL_28;
      case 24:
        LOWORD(a4) = __dst[0];
        a4 = (double)*(unint64_t *)&a4;
        double v10 = 0.00390625;
LABEL_25:
        *(float *)&a4 = a4 * v10;
        goto LABEL_30;
      case 25:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
        float v11 = 10000.0;
        goto LABEL_32;
      case 26:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
LABEL_28:
        int v12 = 1148846080;
        goto LABEL_31;
      case 27:
        LOWORD(a4) = __dst[0];
        *(float *)&a4 = (float)LODWORD(a4);
LABEL_30:
        int v12 = 1120403456;
LABEL_31:
        float v11 = *(float *)&v12;
LABEL_32:
        float v13 = *(float *)&a4 / v11;
        goto LABEL_122;
      case 29:
      case 52:
        return (double)SLOWORD(__dst[0]);
      case 31:
      case 102:
LABEL_110:
        a4 = *(double *)__dst;
        return (double)*(unint64_t *)&a4;
      case 33:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
        goto LABEL_97;
      case 36:
        v14 = DiagnosticLogHandleForCategory(6);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 67110912;
          int v35 = LOBYTE(__dst[0]);
          __int16 v36 = 1024;
          int v37 = BYTE1(__dst[0]);
          __int16 v38 = 1024;
          int v39 = BYTE2(__dst[0]);
          __int16 v40 = 1024;
          int v41 = BYTE3(__dst[0]);
          __int16 v42 = 1024;
          int v43 = BYTE4(__dst[0]);
          __int16 v44 = 1024;
          int v45 = BYTE5(__dst[0]);
          __int16 v46 = 1024;
          int v47 = BYTE6(__dst[0]);
          __int16 v48 = 1024;
          int v49 = HIBYTE(__dst[0]);
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Value = %c%c%c%c%c%c%c%c\n", (uint8_t *)&v34, 0x32u);
        }

        int v15 = DiagnosticLogHandleForCategory(6);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 67109120;
          int v35 = LOBYTE(__dst[0]);
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Value2 = %c\n", (uint8_t *)&v34, 8u);
        }

        return v4;
      case 37:
        int v16 = SLOWORD(__dst[0]);
        goto LABEL_70;
      case 38:
        int v17 = SLOWORD(__dst[0]);
        goto LABEL_73;
      case 39:
        int v18 = SLOWORD(__dst[0]);
        goto LABEL_76;
      case 40:
        int v19 = SLOWORD(__dst[0]);
        goto LABEL_79;
      case 41:
        int v20 = SLOWORD(__dst[0]);
        goto LABEL_82;
      case 42:
        int v21 = SLOWORD(__dst[0]);
        goto LABEL_85;
      case 43:
        int v22 = SLOWORD(__dst[0]);
        goto LABEL_88;
      case 45:
        int v23 = SLOWORD(__dst[0]);
        goto LABEL_94;
      case 46:
        int v24 = SLOWORD(__dst[0]);
        goto LABEL_96;
      case 47:
        int v25 = SLOWORD(__dst[0]);
        goto LABEL_99;
      case 48:
        int v26 = SLOWORD(__dst[0]);
        goto LABEL_101;
      case 49:
        int v27 = SLOWORD(__dst[0]);
        goto LABEL_103;
      case 50:
        int v28 = SLOWORD(__dst[0]);
        goto LABEL_105;
      case 51:
        int v29 = SLOWORD(__dst[0]);
        goto LABEL_108;
      case 53:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E00000000000000;
        goto LABEL_119;
      case 54:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E10000000000000;
        goto LABEL_119;
      case 55:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E20000000000000;
        goto LABEL_119;
      case 56:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E30000000000000;
        goto LABEL_119;
      case 57:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E40000000000000;
        goto LABEL_119;
      case 58:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E50000000000000;
        goto LABEL_119;
      case 59:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E60000000000000;
        goto LABEL_119;
      case 60:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E70000000000000;
        goto LABEL_119;
      case 61:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E80000000000000;
        goto LABEL_119;
      case 62:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3E90000000000000;
        goto LABEL_119;
      case 63:
        double v31 = (double)SLODWORD(__dst[0]) / 2097408.0;
        goto LABEL_121;
      case 64:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3EB0000000000000;
        goto LABEL_119;
      case 65:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3EC0000000000000;
        goto LABEL_119;
      case 66:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3ED0000000000000;
        goto LABEL_119;
      case 67:
        double v8 = (double)SLODWORD(__dst[0]);
        uint64_t v30 = 0x3EE0000000000000;
        goto LABEL_119;
      case 68:
        double v8 = (double)SLODWORD(__dst[0]);
        goto LABEL_118;
      case 69:
        int v16 = __dst[0];
LABEL_70:
        double v8 = (double)v16;
LABEL_71:
        uint64_t v30 = 0x3F00000000000000;
        goto LABEL_119;
      case 70:
        int v17 = __dst[0];
LABEL_73:
        double v8 = (double)v17;
LABEL_74:
        uint64_t v30 = 0x3F10000000000000;
        goto LABEL_119;
      case 71:
        int v18 = __dst[0];
LABEL_76:
        double v8 = (double)v18;
LABEL_77:
        uint64_t v30 = 0x3F20000000000000;
        goto LABEL_119;
      case 72:
        int v19 = __dst[0];
LABEL_79:
        double v8 = (double)v19;
LABEL_80:
        uint64_t v30 = 0x3F30000000000000;
        goto LABEL_119;
      case 73:
        int v20 = __dst[0];
LABEL_82:
        double v8 = (double)v20;
LABEL_83:
        uint64_t v30 = 0x3F40000000000000;
        goto LABEL_119;
      case 74:
        int v21 = __dst[0];
LABEL_85:
        double v8 = (double)v21;
LABEL_86:
        uint64_t v30 = 0x3F50000000000000;
        goto LABEL_119;
      case 75:
        int v22 = __dst[0];
LABEL_88:
        double v8 = (double)v22;
LABEL_89:
        uint64_t v30 = 0x3F60000000000000;
        goto LABEL_119;
      case 76:
        int v7 = __dst[0];
LABEL_91:
        double v8 = (double)v7;
LABEL_92:
        uint64_t v30 = 0x3F70000000000000;
        goto LABEL_119;
      case 78:
        int v23 = __dst[0];
LABEL_94:
        double v8 = (double)v23;
        uint64_t v30 = 0x3F80000000000000;
        goto LABEL_119;
      case 79:
        int v24 = __dst[0];
LABEL_96:
        double v8 = (double)v24;
LABEL_97:
        uint64_t v30 = 0x3F90000000000000;
        goto LABEL_119;
      case 80:
        int v25 = __dst[0];
LABEL_99:
        double v8 = (double)v25;
        uint64_t v30 = 0x3FA0000000000000;
        goto LABEL_119;
      case 81:
        int v26 = __dst[0];
LABEL_101:
        double v8 = (double)v26;
        goto LABEL_114;
      case 82:
        int v27 = __dst[0];
LABEL_103:
        double v8 = (double)v27;
        double v32 = 0.125;
        goto LABEL_120;
      case 83:
        int v28 = __dst[0];
LABEL_105:
        double v8 = (double)v28;
LABEL_106:
        double v32 = 0.25;
        goto LABEL_120;
      case 84:
        int v29 = __dst[0];
LABEL_108:
        double v8 = (double)v29;
        double v32 = 0.5;
        goto LABEL_120;
      case 85:
      case 100:
        return (double)SLODWORD(__dst[0]);
      case 87:
        switch(v5)
        {
          case 1:
            goto LABEL_111;
          case 2:
            goto LABEL_5;
          case 4:
          case 8:
            goto LABEL_110;
          default:
            return v4;
        }
        return v4;
      case 90:
        LOWORD(a4) = __dst[0];
        double v8 = (double)*(unint64_t *)&a4;
LABEL_114:
        uint64_t v30 = 0x3FB0000000000000;
        goto LABEL_119;
      case 91:
        float v13 = *(float *)__dst;
        goto LABEL_122;
      case 101:
        return (double)__dst[0];
      case 103:
        double v8 = (double)__dst[0];
LABEL_118:
        uint64_t v30 = 0x3EF0000000000000;
LABEL_119:
        double v32 = *(double *)&v30;
LABEL_120:
        double v31 = v8 * v32;
LABEL_121:
        float v13 = v31;
LABEL_122:
        double v4 = v13;
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t translateFloatToFixed(uint64_t result, char *__dst, size_t a3, float a4)
{
  __src[0] = 0;
  __src[1] = 0;
  switch((int)result)
  {
    case 1:
      return result;
    case 3:
    case 29:
      int v7 = (int)a4;
      int v8 = (int)a4 + 255;
      if ((int)a4 >= 0) {
        BYTE1(v8) = (unsigned __int16)(int)a4 >> 8;
      }
      __dst[1] = BYTE1(v8);
      goto LABEL_23;
    case 5:
    case 6:
      __dst[3] = 0;
      *(_WORD *)(__dst + 1) = 0;
      int v7 = (int)a4;
LABEL_23:
      *__dst = v7;
      goto LABEL_29;
    case 7:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 33:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 90:
    case 94:
    case 95:
    case 97:
    case 99:
      long double v5 = 0.0;
      switch((int)result)
      {
        case 7:
        case 9:
        case 44:
          long double v5 = 8.0;
          break;
        case 8:
        case 10:
        case 11:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 34:
        case 35:
        case 36:
          break;
        case 12:
        case 42:
          long double v5 = 10.0;
          break;
        case 13:
        case 37:
          long double v5 = 15.0;
          break;
        case 14:
        case 38:
          long double v5 = 14.0;
          break;
        case 15:
        case 39:
          long double v5 = 13.0;
          break;
        case 16:
        case 41:
          long double v5 = 11.0;
          break;
        case 17:
        case 43:
          long double v5 = 9.0;
          break;
        case 18:
        case 40:
          long double v5 = 12.0;
          break;
        case 19:
        case 50:
          long double v5 = 2.0;
          break;
        case 33:
        case 46:
          long double v5 = 6.0;
          break;
        case 45:
LABEL_27:
          long double v5 = 7.0;
          break;
        case 47:
LABEL_26:
          long double v5 = 5.0;
          break;
        case 48:
LABEL_9:
          long double v5 = 4.0;
          break;
        case 49:
LABEL_25:
          long double v5 = 3.0;
          break;
        case 51:
LABEL_24:
          long double v5 = 1.0;
          break;
        default:
          switch((int)result)
          {
            case 'Z':
              goto LABEL_9;
            case '^':
              goto LABEL_24;
            case '_':
              goto LABEL_25;
            case 'a':
              goto LABEL_26;
            case 'c':
              goto LABEL_27;
            default:
              goto LABEL_28;
          }
      }
LABEL_28:
      float v9 = exp2(v5) * a4;
      __src[0] = (int)v9;
      *(_WORD *)__dst = (int)v9;
      goto LABEL_29;
    case 31:
    case 100:
      goto LABEL_7;
    case 53:
    case 54:
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
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
      long double v6 = 0.0;
      if ((result - 53) <= 0x1F) {
        long double v6 = dbl_11470[(int)result - 53];
      }
      a4 = exp2(v6) * a4;
LABEL_7:
      __src[0] = (int)a4;
      *(_DWORD *)__dst = (int)a4;
      goto LABEL_29;
    case 87:
      __src[0] = (int)a4;
      if ((int)a3 >= 1)
      {
        if ((int)a3 >= 8) {
          a3 = 8;
        }
        else {
          a3 = a3;
        }
        memcpy(__dst, __src, a3);
      }
      goto LABEL_29;
    case 91:
      *(float *)__dst = a4;
LABEL_29:
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

id DiagnosticLogHandleForCategory(uint64_t a1)
{
  if (DiagnosticLogHandleForCategory_onceToken != -1) {
    dispatch_once(&DiagnosticLogHandleForCategory_onceToken, &__block_literal_global);
  }
  if (DiagnosticLogHandleForCategory_logHandles[a1]) {
    uint64_t v2 = (void *)DiagnosticLogHandleForCategory_logHandles[a1];
  }
  else {
    uint64_t v2 = &_os_log_disabled;
  }

  return v2;
}

void sub_3D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_5810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_5AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_6014(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id buttonHIDEventFilterCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  long double v6 = DiagnosticLogHandleForCategory(3);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    buttonHIDEventFilterCallback_cold_1(a4, v6);
  }

  id v7 = a2;
  int v8 = v7;
  if (!v7 || ![v7 allowEvents]) {
    goto LABEL_38;
  }
  if (IOHIDEventGetType() != 3)
  {
    if (IOHIDEventGetType() == 29)
    {
      int v24 = [v8 _handlersForEvent:0x400000];
      if ([v24 count])
      {
        int v25 = v8;
        int v26 = v24;
        uint64_t v27 = 0x400000;
LABEL_37:
        id v34 = [v25 _triggerHandlers:v26 event:v27];
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (IOHIDEventGetType() == 32)
    {
      int v24 = [v8 _handlersForEvent:0x800000];
      if ([v24 count])
      {
        int v25 = v8;
        int v26 = v24;
        uint64_t v27 = 0x800000;
        goto LABEL_37;
      }
LABEL_39:
      id v34 = 0;
      goto LABEL_40;
    }
LABEL_38:
    int v24 = 0;
    goto LABEL_39;
  }
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v10 = IOHIDEventGetIntegerValue();
  uint64_t v11 = IOHIDEventGetIntegerValue();
  uint64_t v12 = IOHIDEventGetIntegerValue();
  char Phase = IOHIDEventGetPhase();
  int v14 = v10 | (IntegerValue << 16);
  uint64_t v15 = 1;
  if (v14 > 786527)
  {
    if (v14 <= 786665)
    {
      uint64_t v28 = 0x10000;
      if (!v11) {
        uint64_t v28 = 0x20000;
      }
      uint64_t v29 = 4096;
      if (!v11) {
        uint64_t v29 = 0x2000;
      }
      uint64_t v30 = 64;
      if (!v11) {
        uint64_t v30 = 128;
      }
      if (v14 == 786665)
      {
        uint64_t v15 = v30;
        int v31 = 1;
      }
      else
      {
        int v31 = 0;
      }
      if (v14 == 786581)
      {
        uint64_t v15 = v29;
        int v31 = 1;
      }
      if (v14 == 786528) {
        uint64_t v32 = v28;
      }
      else {
        uint64_t v32 = v15;
      }
      if (v14 == 786528) {
        int v33 = 1;
      }
      else {
        int v33 = v31;
      }
      goto LABEL_68;
    }
    int v16 = 786666;
    uint64_t v17 = 256;
    if (!v11) {
      uint64_t v17 = 512;
    }
    int v18 = 786979;
    uint64_t v19 = 0x100000;
    if (!v11) {
      uint64_t v19 = 0x200000;
    }
    int v20 = 9437217;
    BOOL v21 = v11 == 0;
    uint64_t v22 = 0x1000000;
    uint64_t v23 = 0x2000000;
  }
  else
  {
    if (v14 > 786435)
    {
      int v16 = 786436;
      uint64_t v17 = 0x40000;
      if (!v11) {
        uint64_t v17 = 0x80000;
      }
      int v18 = 786480;
      uint64_t v19 = 16;
      if (v11)
      {
        uint64_t v36 = 1;
      }
      else
      {
        uint64_t v19 = 32;
        uint64_t v36 = 2;
      }
      if (v14 == 786496)
      {
        uint64_t v15 = v36;
        int v37 = 1;
      }
      else
      {
        int v37 = 0;
      }
      goto LABEL_59;
    }
    int v16 = 65670;
    uint64_t v17 = 0x4000;
    if (!v11) {
      uint64_t v17 = 0x8000;
    }
    int v18 = 720941;
    uint64_t v19 = 0x10000000;
    if (!v11) {
      uint64_t v19 = 0x20000000;
    }
    int v20 = 720942;
    BOOL v21 = v11 == 0;
    uint64_t v22 = 4;
    uint64_t v23 = 8;
  }
  if (v21) {
    uint64_t v22 = v23;
  }
  if (v14 == v20)
  {
    uint64_t v15 = v22;
    int v37 = 1;
  }
  else
  {
    int v37 = 0;
  }
LABEL_59:
  if (v14 == v18)
  {
    uint64_t v15 = v19;
    int v38 = 1;
  }
  else
  {
    int v38 = v37;
  }
  if (v14 == v16) {
    uint64_t v32 = v17;
  }
  else {
    uint64_t v32 = v15;
  }
  if (v14 == v16) {
    int v33 = 1;
  }
  else {
    int v33 = v38;
  }
LABEL_68:
  int v39 = [v8 _handlersForEvent:v32];
  int v24 = v39;
  if (v33)
  {
    id v34 = 0;
    if ([v39 count] && !v12 && (Phase & 4) == 0) {
      id v34 = [v8 _triggerHandlers:v24 event:v32];
    }
  }
  else
  {
    id v34 = 0;
  }
  __int16 v40 = [v8 testAutomation];
  unsigned int v41 = v33 & [v40 testAutomationEnabled];

  if (v41 == 1 && v34 && !v11)
  {
    UIAccessibilityPostNotification(0xFA2u, &off_1EF70);
    id v34 = &dword_0 + 1;
  }
LABEL_40:

  return v34;
}

void sub_66C0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_906C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_964C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_A47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t DSArchiveOpen()
{
  return 0;
}

uint64_t DSArchiveClose()
{
  return 0;
}

uint64_t DSArchiveWrite(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  long double v6 = [a2 dataBuffer];
  [v6 appendBytes:a3 length:a4];

  return a4;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void callIOFunction_cold_1(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "SMC::callIOFunction unrecognized index: %d", (uint8_t *)v2, 8u);
}

void buttonHIDEventFilterCallback_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[HID Event] %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceClose(device, options);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return _IOHIDDeviceGetProperty(device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return _IOHIDDeviceGetReport(device, reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceOpen(device, options);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetPhase()
{
  return _IOHIDEventGetPhase();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority()
{
  return _IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return _IOHIDEventSystemClientScheduleWithDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return _IOHIDEventSystemClientSetMatchingMultiple();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterCallback()
{
  return _IOHIDEventSystemClientUnregisterEventFilterCallback();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return _IOHIDEventSystemClientUnscheduleFromDispatchQueue();
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerClose(manager, options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return _IOHIDManagerCopyDevices(manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return _IOHIDManagerCreate(allocator, options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return _IOHIDManagerOpen(manager, options);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return _IOPSCopyPowerSourcesByTypePrecise();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
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

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
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

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_pathname()
{
  return _archive_entry_pathname();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_read_close()
{
  return _archive_read_close();
}

uint64_t archive_read_data_block()
{
  return _archive_read_data_block();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_read_new()
{
  return _archive_read_new();
}

uint64_t archive_read_next_header()
{
  return _archive_read_next_header();
}

uint64_t archive_read_open_filename()
{
  return _archive_read_open_filename();
}

uint64_t archive_read_support_filter_all()
{
  return _archive_read_support_filter_all();
}

uint64_t archive_read_support_format_all()
{
  return _archive_read_support_format_all();
}

uint64_t archive_write_add_filter_compress()
{
  return _archive_write_add_filter_compress();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_close()
{
  return _archive_write_close();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_data_block()
{
  return _archive_write_data_block();
}

uint64_t archive_write_disk_new()
{
  return _archive_write_disk_new();
}

uint64_t archive_write_disk_set_options()
{
  return _archive_write_disk_set_options();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return _archive_write_disk_set_standard_lookup();
}

uint64_t archive_write_finish_entry()
{
  return _archive_write_finish_entry();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open()
{
  return _archive_write_open();
}

uint64_t archive_write_open_fd()
{
  return _archive_write_open_fd();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkstemps(char *a1, int a2)
{
  return _mkstemps(a1, a2);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return _xpc_copy_entitlement_for_self();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__resetAccumulator(void *a1, const char *a2, ...)
{
  return [a1 _resetAccumulator];
}

id objc_msgSend__sharedSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 _sharedSerialQueue];
}

id objc_msgSend_accessoryCapabilities(void *a1, const char *a2, ...)
{
  return [a1 accessoryCapabilities];
}

id objc_msgSend_accessoryModel(void *a1, const char *a2, ...)
{
  return [a1 accessoryModel];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowEvents(void *a1, const char *a2, ...)
{
  return [a1 allowEvents];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return [a1 bufferSize];
}

id objc_msgSend_buttonEventHandlers(void *a1, const char *a2, ...)
{
  return [a1 buttonEventHandlers];
}

id objc_msgSend_callLog(void *a1, const char *a2, ...)
{
  return [a1 callLog];
}

id objc_msgSend_closeAppleSMC(void *a1, const char *a2, ...)
{
  return [a1 closeAppleSMC];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return [a1 connectionID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLineIndex(void *a1, const char *a2, ...)
{
  return [a1 currentLineIndex];
}

id objc_msgSend_currentOffset(void *a1, const char *a2, ...)
{
  return [a1 currentOffset];
}

id objc_msgSend_dataBuffer(void *a1, const char *a2, ...)
{
  return [a1 dataBuffer];
}

id objc_msgSend_dataPort(void *a1, const char *a2, ...)
{
  return [a1 dataPort];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateFormatters(void *a1, const char *a2, ...)
{
  return [a1 dateFormatters];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
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

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_eventHandlerChangeLock(void *a1, const char *a2, ...)
{
  return [a1 eventHandlerChangeLock];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_exception(void *a1, const char *a2, ...)
{
  return [a1 exception];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return [a1 fileHandle];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firmwareRevision(void *a1, const char *a2, ...)
{
  return [a1 firmwareRevision];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_futureDateDetected(void *a1, const char *a2, ...)
{
  return [a1 futureDateDetected];
}

id objc_msgSend_generationComplete(void *a1, const char *a2, ...)
{
  return [a1 generationComplete];
}

id objc_msgSend_generationLock(void *a1, const char *a2, ...)
{
  return [a1 generationLock];
}

id objc_msgSend_getLogFiles(void *a1, const char *a2, ...)
{
  return [a1 getLogFiles];
}

id objc_msgSend_hardwareRevision(void *a1, const char *a2, ...)
{
  return [a1 hardwareRevision];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isConnectionOpen(void *a1, const char *a2, ...)
{
  return [a1 isConnectionOpen];
}

id objc_msgSend_isEnumerating(void *a1, const char *a2, ...)
{
  return [a1 isEnumerating];
}

id objc_msgSend_isTrapEvent(void *a1, const char *a2, ...)
{
  return [a1 isTrapEvent];
}

id objc_msgSend_isUsable(void *a1, const char *a2, ...)
{
  return [a1 isUsable];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineBreak(void *a1, const char *a2, ...)
{
  return [a1 lineBreak];
}

id objc_msgSend_linePositions(void *a1, const char *a2, ...)
{
  return [a1 linePositions];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_logFiles(void *a1, const char *a2, ...)
{
  return [a1 logFiles];
}

id objc_msgSend_logIDs(void *a1, const char *a2, ...)
{
  return [a1 logIDs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return [a1 macAddress];
}

id objc_msgSend_missingDaysRemaining(void *a1, const char *a2, ...)
{
  return [a1 missingDaysRemaining];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_outOfOrderDateDetected(void *a1, const char *a2, ...)
{
  return [a1 outOfOrderDateDetected];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_preventPropagation(void *a1, const char *a2, ...)
{
  return [a1 preventPropagation];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_referenceDate(void *a1, const char *a2, ...)
{
  return [a1 referenceDate];
}

id objc_msgSend_resetEnumerator(void *a1, const char *a2, ...)
{
  return [a1 resetEnumerator];
}

id objc_msgSend_root(void *a1, const char *a2, ...)
{
  return [a1 root];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return [a1 sharedFormatter];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_skipCount(void *a1, const char *a2, ...)
{
  return [a1 skipCount];
}

id objc_msgSend_sourceUrl(void *a1, const char *a2, ...)
{
  return [a1 sourceUrl];
}

id objc_msgSend_systemClientCreationQueue(void *a1, const char *a2, ...)
{
  return [a1 systemClientCreationQueue];
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return [a1 systemLocale];
}

id objc_msgSend_tableOfContents(void *a1, const char *a2, ...)
{
  return [a1 tableOfContents];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return [a1 targetQueue];
}

id objc_msgSend_testAutomation(void *a1, const char *a2, ...)
{
  return [a1 testAutomation];
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return [a1 testAutomationEnabled];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_usagePage(void *a1, const char *a2, ...)
{
  return [a1 usagePage];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}