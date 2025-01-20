@interface ARNoiseParameters
+ (int)modelIdentifierForDevicePosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4;
@end

@implementation ARNoiseParameters

+ (int)modelIdentifierForDevicePosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4
{
  uint64_t v6 = MGGetProductType();
  if (v6 <= 2458172801)
  {
    if (v6 <= 1373516432)
    {
      if (v6 <= 810906662)
      {
        if (v6 > 330877085)
        {
          if (v6 <= 574536382)
          {
            if (v6 != 330877086)
            {
              if (v6 != 341800273)
              {
                uint64_t v7 = 555503454;
                goto LABEL_130;
              }
LABEL_180:
              if (a3 == 1 && a4 == 1280) {
                return 4;
              }
              if (a3 == 1 && a4 == 1920) {
                return 5;
              }
              if (a3 == 2 && a4 == 1280) {
                return 6;
              }
              if (a3 == 2 && a4 == 1440) {
                return 7;
              }
              return 77;
            }
LABEL_86:
            if (a3 == 1 && a4 == 1280) {
              return 72;
            }
            if (a3 == 1 && a4 == 1920) {
              return 73;
            }
            if (a3 == 1 && a4 == 3840) {
              return 74;
            }
            if (a3 == 2 && a4 == 1280) {
              return 75;
            }
            if (a3 == 2 && a4 == 1440) {
              return 76;
            }
            return 77;
          }
          if (v6 == 574536383) {
            goto LABEL_86;
          }
          if (v6 != 689804742)
          {
            uint64_t v7 = 746003606;
            goto LABEL_130;
          }
LABEL_222:
          if (a3 == 1 && a4 == 1280) {
            return 53;
          }
          if (a3 == 1 && a4 == 1920) {
            return 54;
          }
          if (a3 == 1 && a4 == 3840) {
            return 55;
          }
          if (a3 == 2 && a4 == 1280) {
            return 56;
          }
          if (a3 == 2 && a4 == 1440) {
            return 57;
          }
          return 77;
        }
        if (v6 > 133314239)
        {
          if (v6 == 133314240) {
            goto LABEL_86;
          }
          if (v6 != 157833461)
          {
            uint64_t v11 = 228444038;
            goto LABEL_176;
          }
LABEL_152:
          if (a3 == 1 && a4 == 1280) {
            return 15;
          }
          if (a3 == 1 && a4 == 1440) {
            return 16;
          }
          return 77;
        }
        if (v6 != 79936591)
        {
          uint64_t v8 = 88647037;
          goto LABEL_126;
        }
LABEL_157:
        if (a3 == 1 && a4 == 1280) {
          return 0;
        }
        if (a3 == 1 && a4 == 1920) {
          return 1;
        }
        return 77;
      }
      if (v6 > 1169082143)
      {
        if (v6 <= 1293446024)
        {
          if (v6 != 1169082144)
          {
            if (v6 == 1234705395)
            {
              if (a3 == 1 && a4 == 1280) {
                return 33;
              }
              if (a3 == 1 && a4 == 1920) {
                return 34;
              }
              if (a3 == 2 && a4 == 1280) {
                return 35;
              }
              if (a3 == 2 && a4 == 1440) {
                return 36;
              }
              return 77;
            }
            uint64_t v8 = 1280441783;
LABEL_126:
            if (v6 != v8) {
              return 77;
            }
            goto LABEL_152;
          }
LABEL_121:
          if (a3 == 1 && a4 == 1280) {
            return 43;
          }
          if (a3 == 1 && a4 == 1920) {
            return 44;
          }
          if (a3 == 1 && a4 == 3840) {
            return 45;
          }
          if (a3 == 2 && a4 == 1280) {
            return 46;
          }
          if (a3 == 2 && a4 == 1440) {
            return 47;
          }
          return 77;
        }
        if (v6 != 1293446025)
        {
          if (v6 == 1353145733) {
            goto LABEL_180;
          }
          uint64_t v13 = 1371389549;
          goto LABEL_162;
        }
LABEL_106:
        if (a3 == 1 && a4 == 1280) {
          return 11;
        }
        if (a3 == 1 && a4 == 1920) {
          return 12;
        }
        if (a3 == 2 && a4 == 1280) {
          return 13;
        }
        if (a3 == 2 && a4 == 1440) {
          return 14;
        }
        return 77;
      }
      if (v6 <= 851437780)
      {
        if (v6 == 810906663) {
          goto LABEL_131;
        }
        if (v6 != 820711327) {
          return 77;
        }
        goto LABEL_157;
      }
      if (v6 == 851437781) {
        goto LABEL_86;
      }
      if (v6 != 910181310)
      {
        if (v6 != 1060988941) {
          return 77;
        }
LABEL_219:
        if (a3 == 1 && a4 == 1280) {
          return 48;
        }
        if (a3 == 1 && a4 == 1920) {
          return 49;
        }
        if (a3 == 1 && a4 == 3840) {
          return 50;
        }
        if (a3 == 2 && a4 == 1280) {
          return 51;
        }
        if (a3 == 2 && a4 == 1440) {
          return 52;
        }
        return 77;
      }
LABEL_171:
      if (a3 == 1 && a4 == 1280) {
        return 29;
      }
      if (a3 == 1 && a4 == 1920) {
        return 30;
      }
      if (a3 == 2 && a4 == 1280) {
        return 31;
      }
      if (a3 == 2 && a4 == 1440) {
        return 32;
      }
      return 77;
    }
    if (v6 <= 2032616840)
    {
      if (v6 <= 1868379042)
      {
        if (v6 <= 1434404432)
        {
          if (v6 == 1373516433) {
            goto LABEL_131;
          }
          if (v6 == 1380747801 && a3 == 1 && a4 == 1280) {
            return 37;
          }
          return 77;
        }
        if (v6 != 1434404433)
        {
          if (v6 != 1625227434)
          {
            uint64_t v7 = 1834147427;
            goto LABEL_130;
          }
          goto LABEL_131;
        }
      }
      else
      {
        if (v6 <= 2001966016)
        {
          if (v6 != 1868379043)
          {
            if (v6 != 1878257790)
            {
              uint64_t v7 = 1895344378;
              goto LABEL_130;
            }
            goto LABEL_118;
          }
LABEL_131:
          if (a3 == 1 && a4 == 1280) {
            return 18;
          }
          if (a3 == 1 && a4 == 1920) {
            return 19;
          }
          if (a3 == 1 && a4 == 3840) {
            return 17;
          }
          if (a3 == 2 && a4 == 1280) {
            return 20;
          }
          if (a3 == 2 && a4 == 1440) {
            return 21;
          }
          return 77;
        }
        if (v6 == 2001966017) {
          goto LABEL_180;
        }
        if (v6 != 2021146989)
        {
          uint64_t v7 = 2023824667;
          goto LABEL_130;
        }
      }
      if (a3 == 1 && a4 == 1280) {
        return 62;
      }
      if (a3 == 1 && a4 == 1920) {
        return 63;
      }
      if (a3 == 1 && a4 == 3840) {
        return 64;
      }
      if (a3 == 2 && a4 == 1280) {
        return 65;
      }
      if (a3 == 2 && a4 == 1440) {
        return 66;
      }
      return 77;
    }
    if (v6 > 2158787295)
    {
      if (v6 > 2262113698)
      {
        if (v6 != 2262113699)
        {
          if (v6 == 2309863438) {
            goto LABEL_222;
          }
          uint64_t v11 = 2385671069;
          goto LABEL_176;
        }
        goto LABEL_157;
      }
      if (v6 == 2158787296) {
        goto LABEL_157;
      }
      if (v6 != 2159747553)
      {
        uint64_t v9 = 2236272848;
        goto LABEL_150;
      }
LABEL_168:
      if (a3 == 1 && a4 == 1280) {
        return 58;
      }
      if (a3 == 1 && a4 == 1920) {
        return 59;
      }
      if (a3 == 2 && a4 == 1280) {
        return 60;
      }
      if (a3 == 2 && a4 == 1440) {
        return 61;
      }
      return 77;
    }
    if (v6 <= 2080700390)
    {
      if (v6 == 2032616841) {
        goto LABEL_171;
      }
      if (v6 != 2078329141) {
        return 77;
      }
      goto LABEL_168;
    }
    if (v6 == 2080700391) {
      goto LABEL_163;
    }
    if (v6 == 2089455188) {
      goto LABEL_131;
    }
    uint64_t v10 = 2103978418;
LABEL_101:
    if (v6 != v10) {
      return 77;
    }
    goto LABEL_106;
  }
  if (v6 > 3184375230)
  {
    if (v6 <= 3636345304)
    {
      if (v6 <= 3361025852)
      {
        if (v6 <= 3215673113)
        {
          if (v6 == 3184375231) {
            goto LABEL_152;
          }
          uint64_t v9 = 3196158497;
LABEL_150:
          if (v6 != v9) {
            return 77;
          }
          goto LABEL_180;
        }
        if (v6 != 3215673114)
        {
          if (v6 != 3228373941)
          {
            uint64_t v7 = 3241053352;
            goto LABEL_130;
          }
          goto LABEL_131;
        }
      }
      else
      {
        if (v6 > 3540156651)
        {
          if (v6 == 3540156652) {
            goto LABEL_131;
          }
          if (v6 == 3585085679) {
            goto LABEL_219;
          }
          uint64_t v10 = 3599094683;
          goto LABEL_101;
        }
        if (v6 == 3361025853) {
          goto LABEL_131;
        }
        if (v6 != 3397214291)
        {
          if (v6 != 3455223061) {
            return 77;
          }
          goto LABEL_216;
        }
      }
      if (a3 == 1 && a4 == 1280) {
        return 26;
      }
      if (a3 == 1 && a4 == 1440) {
        return 27;
      }
      if (a3 == 2 && a4 == 1280) {
        return 28;
      }
      return 77;
    }
    if (v6 > 3801472100)
    {
      if (v6 > 3885279869)
      {
        if (v6 == 3885279870 || v6 == 4201643249) {
          goto LABEL_121;
        }
        if (v6 != 4242862982) {
          return 77;
        }
LABEL_118:
        if (a3 == 1 && a4 == 1280) {
          return 22;
        }
        if (a3 == 1 && a4 == 1440) {
          return 23;
        }
        if (a3 == 2 && a4 == 1280) {
          return 24;
        }
        if (a3 == 2 && a4 == 1440) {
          return 25;
        }
        return 77;
      }
      if (v6 == 3801472101) {
        goto LABEL_180;
      }
      if (v6 == 3825599860) {
        goto LABEL_86;
      }
      uint64_t v10 = 3863625342;
      goto LABEL_101;
    }
    if (v6 <= 3677894690)
    {
      if (v6 == 3636345305) {
        goto LABEL_180;
      }
      uint64_t v11 = 3645319985;
      goto LABEL_176;
    }
    if (v6 == 3677894691) {
      goto LABEL_131;
    }
    if (v6 != 3711192744)
    {
      if (v6 != 3743999268) {
        return 77;
      }
      goto LABEL_171;
    }
LABEL_216:
    if (a3 == 1 && a4 == 1280) {
      return 8;
    }
    if (a3 == 1 && a4 == 1920) {
      return 9;
    }
    if (a3 == 2 && a4 == 1280) {
      return 10;
    }
    return 77;
  }
  if (v6 > 2688879998)
  {
    if (v6 <= 2940697644)
    {
      if (v6 > 2793418700)
      {
        if (v6 == 2793418701 || v6 == 2795618603) {
          goto LABEL_86;
        }
        uint64_t v7 = 2903084588;
        goto LABEL_130;
      }
      if (v6 != 2688879999)
      {
        uint64_t v13 = 2722529672;
LABEL_162:
        if (v6 != v13) {
          return 77;
        }
LABEL_163:
        if (a3 == 1 && a4 == 1280) {
          return 38;
        }
        if (a3 == 1 && a4 == 1920) {
          return 39;
        }
        if (a3 == 1 && a4 == 3840) {
          return 40;
        }
        if (a3 == 2 && a4 == 1280) {
          return 41;
        }
        if (a3 == 2 && a4 == 1440) {
          return 42;
        }
        return 77;
      }
    }
    else
    {
      if (v6 > 3001488777)
      {
        if (v6 == 3001488778) {
          goto LABEL_121;
        }
        if (v6 == 3054476161) {
          goto LABEL_131;
        }
        uint64_t v7 = 3101941570;
        goto LABEL_130;
      }
      if (v6 != 2940697645)
      {
        if (v6 == 2941181571) {
          goto LABEL_86;
        }
        uint64_t v7 = 2959111092;
        goto LABEL_130;
      }
    }
    if (a3 == 1 && a4 == 1280) {
      return 67;
    }
    if (a3 == 1 && a4 == 1920) {
      return 68;
    }
    if (a3 == 1 && a4 == 3840) {
      return 69;
    }
    if (a3 == 2 && a4 == 1280) {
      return 70;
    }
    if (a3 == 2 && a4 == 1440) {
      return 71;
    }
    return 77;
  }
  if (v6 > 2619317133)
  {
    if (v6 <= 2634105756)
    {
      if (v6 != 2619317134 && v6 != 2622433984)
      {
        uint64_t v7 = 2628394914;
        goto LABEL_130;
      }
      goto LABEL_131;
    }
    if (v6 == 2634105757 || v6 == 2644487444) {
      goto LABEL_131;
    }
    uint64_t v11 = 2673319456;
    goto LABEL_176;
  }
  if (v6 > 2516717267)
  {
    if (v6 == 2516717268) {
      goto LABEL_177;
    }
    if (v6 == 2566016329) {
      goto LABEL_131;
    }
    uint64_t v11 = 2614323575;
LABEL_176:
    if (v6 != v11) {
      return 77;
    }
LABEL_177:
    if (a3 == 1 && a4 == 1280) {
      return 2;
    }
    if (a3 == 1 && a4 == 1440) {
      return 3;
    }
    return 77;
  }
  if (v6 == 2458172802) {
    goto LABEL_180;
  }
  uint64_t v7 = 2487868872;
LABEL_130:
  if (v6 == v7) {
    goto LABEL_131;
  }
  return 77;
}

@end