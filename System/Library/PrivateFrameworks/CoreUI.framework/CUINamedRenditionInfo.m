@interface CUINamedRenditionInfo
+ (int)subtypeFromIndexWithPlatform:(int64_t)a3 andIndex:(unsigned __int16)a4;
+ (int)subtypeToIndexWithPlatform:(int64_t)a3 andInput:(unsigned __int16)a4;
- (BOOL)containsVectorGlyphInterpolationSources;
- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- (BOOL)contentEqualForAttribute:(int)a3 withRenditionInfo:(id)a4;
- (BOOL)contentPresentForAttribute:(int)a3;
- (BOOL)diverseContentPresentForAttribute:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedRenditionInfo:(id)a3;
- (CUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5;
- (CUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4;
- (id)archivedData;
- (id)bitwiseAndWith:(id)a3;
- (id)bitwiseOrWith:(id)a3 forAttribute:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int)attributePresent:(int)a3 withValue:(unsigned __int16)a4;
- (unint64_t)numberOfBitsSet;
- (unsigned)getClosestValueOfAttribute:(int)a3 withValue:(unsigned __int16)a4;
- (unsigned)getValueOfAttribute:(int)a3;
- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4;
- (void)dealloc;
- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4;
- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5;
- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4;
@end

@implementation CUINamedRenditionInfo

- (BOOL)diverseContentPresentForAttribute:(int)a3
{
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return 0;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v12 = *var3++;
      if (v12 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if (a3 - 1) < 0x1C && ((0x8030073u >> (a3 - 1))) {
    return 0;
  }
  unsigned int v13 = keyFormat->var2;
  if (!v13) {
    return 0;
  }
  unsigned int v14 = 0;
  uint64_t v15 = 0;
  v16 = keyFormat->var3;
  while (v16[v15] != a3)
  {
    ++v15;
    v14 += 32;
    if (v13 == v15) {
      return 0;
    }
  }
  if ((int)v15 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
    return 0;
  }
  return (v15 & 0x80000000) == 0
      && (CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v14) != 1
       || CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v14) != 1);
}

- (int)attributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v8 = *(void *)&a3;
  keyFormat = self->_keyFormat;
  unint64_t platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return -1;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v14 = *var3++;
      if (v14 == 16) {
        break;
      }
      if (!--var2) {
        return -1;
      }
    }
  }
  if (a3 <= 0x1C)
  {
    if (((1 << a3) & 0x100600E6) != 0) {
      return -1;
    }
    if (a3 == 13)
    {
      *(void *)&a4 = a4 != 0;
      goto LABEL_21;
    }
    if (a3 != 16) {
      goto LABEL_21;
    }
    if (platform != -1)
    {
      if (!a4) {
        goto LABEL_21;
      }
      switch(platform)
      {
        case 0uLL:
          if ((int)a4 <= 1963)
          {
            if (a4 != 1665)
            {
              if (a4 != 1864) {
                goto LABEL_178;
              }
              goto LABEL_74;
            }
            goto LABEL_86;
          }
          if (a4 == 1964) {
            goto LABEL_126;
          }
          if (a4 != 2234) {
            goto LABEL_178;
          }
          goto LABEL_111;
        case 3uLL:
          if (a4 == 3840) {
            goto LABEL_169;
          }
          if (a4 == 1088) {
            goto LABEL_91;
          }
          if (a4 != 720) {
            goto LABEL_178;
          }
          goto LABEL_176;
        case 4uLL:
          if ((int)a4 > 429)
          {
            if ((int)a4 > 483)
            {
              if (a4 != 484)
              {
                if (a4 != 496)
                {
                  if (a4 != 502) {
                    goto LABEL_178;
                  }
                  goto LABEL_72;
                }
                goto LABEL_139;
              }
LABEL_120:
              *(void *)&a4 = 24;
              goto LABEL_21;
            }
            if (a4 != 430)
            {
              if (a4 != 446) {
                goto LABEL_178;
              }
              goto LABEL_143;
            }
            goto LABEL_144;
          }
          if ((int)a4 <= 383)
          {
            if (a4 != 320)
            {
              if (a4 != 340) {
                goto LABEL_178;
              }
              goto LABEL_164;
            }
LABEL_140:
            *(void *)&a4 = 8;
            goto LABEL_21;
          }
          if (a4 == 384) {
            goto LABEL_148;
          }
          if (a4 != 390) {
LABEL_178:
          }
            -[CUINamedRenditionInfo attributePresent:withValue:](a4, platform);
          goto LABEL_177;
        case 5uLL:
          if (a4 == 3648) {
            goto LABEL_74;
          }
          goto LABEL_178;
        default:
          if (platform > 2) {
            goto LABEL_178;
          }
          if ((int)a4 <= 2435)
          {
            if ((int)a4 <= 2223)
            {
              if ((int)a4 <= 569)
              {
                if (a4 != 163)
                {
                  if (a4 != 568)
                  {
                    if (a4 != 569) {
                      goto LABEL_178;
                    }
                    goto LABEL_150;
                  }
LABEL_74:
                  *(void *)&a4 = 1;
                  goto LABEL_21;
                }
LABEL_91:
                *(void *)&a4 = 5;
                goto LABEL_21;
              }
              if (a4 != 570)
              {
                if (a4 != 1792)
                {
                  if (a4 != 2160) {
                    goto LABEL_178;
                  }
                  goto LABEL_157;
                }
LABEL_159:
                *(void *)&a4 = 16;
                goto LABEL_21;
              }
LABEL_158:
              *(void *)&a4 = 3;
              goto LABEL_21;
            }
            if ((int)a4 <= 2359)
            {
              if (a4 != 2224)
              {
                if (a4 != 2266)
                {
                  if (a4 != 2340) {
                    goto LABEL_178;
                  }
                  goto LABEL_134;
                }
LABEL_152:
                *(void *)&a4 = 25;
                goto LABEL_21;
              }
LABEL_151:
              *(void *)&a4 = 10;
              goto LABEL_21;
            }
            if (a4 != 2360)
            {
              if (a4 != 2388)
              {
                if (a4 != 2420) {
                  goto LABEL_178;
                }
                goto LABEL_169;
              }
              goto LABEL_171;
            }
LABEL_170:
            *(void *)&a4 = 20;
            goto LABEL_21;
          }
          if ((int)a4 <= 2751)
          {
            if ((int)a4 <= 2621)
            {
              if (a4 != 2436)
              {
                if (a4 != 2532)
                {
                  if (a4 != 2556) {
                    goto LABEL_178;
                  }
LABEL_143:
                  *(void *)&a4 = 29;
                  goto LABEL_21;
                }
LABEL_149:
                *(void *)&a4 = 22;
                goto LABEL_21;
              }
LABEL_123:
              *(void *)&a4 = 11;
              goto LABEL_21;
            }
            if (a4 != 2622)
            {
              if (a4 != 2688)
              {
                if (a4 != 2732) {
                  goto LABEL_178;
                }
                goto LABEL_163;
              }
LABEL_165:
              *(void *)&a4 = 12;
              goto LABEL_21;
            }
LABEL_164:
            *(void *)&a4 = 13;
            goto LABEL_21;
          }
          if ((int)a4 <= 2867)
          {
            if (a4 == 2752) {
              goto LABEL_140;
            }
            if (a4 != 2778)
            {
              if (a4 != 2796) {
                goto LABEL_178;
              }
              goto LABEL_139;
            }
LABEL_153:
            *(void *)&a4 = 19;
            goto LABEL_21;
          }
          if (a4 == 2868) {
            goto LABEL_177;
          }
          if (a4 == 3024) {
            goto LABEL_176;
          }
          if (a4 != 32401) {
            goto LABEL_178;
          }
          break;
      }
      goto LABEL_175;
    }
    if ((int)a4 > 2159)
    {
      if ((int)a4 > 2531)
      {
        if ((int)a4 > 2777)
        {
          if ((int)a4 > 3839)
          {
            if (a4 == 3840)
            {
LABEL_169:
              *(void *)&a4 = 7;
              goto LABEL_21;
            }
            if (a4 == 32401)
            {
LABEL_175:
              *(void *)&a4 = 17;
              goto LABEL_21;
            }
          }
          else
          {
            if (a4 == 2778) {
              goto LABEL_153;
            }
            if (a4 == 2796)
            {
LABEL_139:
              *(void *)&a4 = 30;
              goto LABEL_21;
            }
          }
        }
        else if ((int)a4 > 2687)
        {
          if (a4 == 2688) {
            goto LABEL_165;
          }
          if (a4 == 2732)
          {
LABEL_163:
            *(void *)&a4 = 4;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2532) {
            goto LABEL_149;
          }
          if (a4 == 2556) {
            goto LABEL_143;
          }
        }
      }
      else if ((int)a4 > 2339)
      {
        if ((int)a4 > 2387)
        {
          if (a4 == 2388)
          {
LABEL_171:
            *(void *)&a4 = 15;
            goto LABEL_21;
          }
          if (a4 == 2436) {
            goto LABEL_123;
          }
        }
        else
        {
          if (a4 == 2340)
          {
LABEL_134:
            *(void *)&a4 = 18;
            goto LABEL_21;
          }
          if (a4 == 2360) {
            goto LABEL_170;
          }
        }
      }
      else if ((int)a4 > 2233)
      {
        if (a4 == 2234)
        {
LABEL_111:
          *(void *)&a4 = 27;
          goto LABEL_21;
        }
        if (a4 == 2266) {
          goto LABEL_152;
        }
      }
      else
      {
        if (a4 == 2160)
        {
LABEL_157:
          *(void *)&a4 = 21;
          goto LABEL_21;
        }
        if (a4 == 2224) {
          goto LABEL_151;
        }
      }
      goto LABEL_129;
    }
    if ((int)a4 > 501)
    {
      if ((int)a4 <= 719)
      {
        if ((int)a4 > 568)
        {
          if (a4 == 569)
          {
LABEL_150:
            *(void *)&a4 = 2;
            goto LABEL_21;
          }
          if (a4 == 570) {
            goto LABEL_158;
          }
        }
        else
        {
          if (a4 == 502)
          {
LABEL_72:
            *(void *)&a4 = 28;
            goto LABEL_21;
          }
          if (a4 == 568) {
            goto LABEL_74;
          }
        }
        goto LABEL_129;
      }
      if ((int)a4 > 1791)
      {
        if (a4 == 1792) {
          goto LABEL_159;
        }
        if (a4 == 1964)
        {
LABEL_126:
          *(void *)&a4 = 26;
          goto LABEL_21;
        }
        goto LABEL_129;
      }
      if (a4 != 720)
      {
        if (a4 == 1665)
        {
LABEL_86:
          *(void *)&a4 = 31;
          goto LABEL_21;
        }
        goto LABEL_129;
      }
LABEL_176:
      *(void *)&a4 = 6;
    }
    else
    {
      if ((int)a4 <= 383)
      {
        if ((int)a4 > 319)
        {
          if (a4 == 320) {
            goto LABEL_140;
          }
          if (a4 == 340) {
            goto LABEL_164;
          }
        }
        else
        {
          if (!a4) {
            goto LABEL_21;
          }
          if (a4 == 163) {
            goto LABEL_91;
          }
        }
        goto LABEL_129;
      }
      if ((int)a4 > 429)
      {
        if (a4 == 430)
        {
LABEL_144:
          *(void *)&a4 = 23;
          goto LABEL_21;
        }
        if (a4 == 484) {
          goto LABEL_120;
        }
        goto LABEL_129;
      }
      if (a4 == 384)
      {
LABEL_148:
        *(void *)&a4 = 9;
        goto LABEL_21;
      }
      if (a4 != 390)
      {
LABEL_129:
        _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", *(uint64_t *)&a3, a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
        *(void *)&a4 = 0xFFFFLL;
        goto LABEL_21;
      }
LABEL_177:
      *(void *)&a4 = 14;
    }
  }
LABEL_21:
  unsigned int v16 = keyFormat->var2;
  if (!v16) {
    return -1;
  }
  uint64_t v17 = 0;
  unsigned int v18 = a4;
  while (keyFormat->var3[v17] != v8)
  {
    ++v17;
    v18 += 32;
    if (v16 == v17) {
      return -1;
    }
  }
  if ((int)v17 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, v8);
    return -1;
  }
  if ((v18 & 0x80000000) != 0) {
    return -1;
  }
  bitmap = (os_unfair_lock_s *)self->_bitmap;
  return CUIBitVectorIsBitSet(bitmap, v18);
}

- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4
{
  uint64_t v8 = *(void *)&a4;
  int64_t v11 = *a3;
  keyFormat = self->_keyFormat;
  unint64_t platform = self->_platform;
  if (a4 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v16 = *var3++;
      if (v16 == 16) {
        break;
      }
      if (!--var2) {
        return;
      }
    }
  }
  if (a4 <= 0x1C)
  {
    if (((1 << a4) & 0x100600E6) != 0) {
      return;
    }
    if (a4 == 13)
    {
      LOWORD(v11) = (unsigned __int16)*a3 != 0;
    }
    else if (a4 == 16)
    {
      if (platform == -1)
      {
        unsigned int v29 = (unsigned __int16)*a3;
        if (v29 > 0x86F)
        {
          if ((unsigned __int16)*a3 > 0x9E3u)
          {
            if ((unsigned __int16)*a3 > 0xAD9u)
            {
              if ((unsigned __int16)*a3 > 0xEFFu)
              {
                if (v29 == 3840)
                {
LABEL_345:
                  LOWORD(v11) = 7;
                  goto LABEL_21;
                }
                if (v29 == 32401) {
                  goto LABEL_351;
                }
              }
              else
              {
                if (v29 == 2778) {
                  goto LABEL_329;
                }
                if (v29 == 2796) {
                  goto LABEL_315;
                }
              }
            }
            else if ((unsigned __int16)*a3 > 0xA7Fu)
            {
              if (v29 == 2688) {
                goto LABEL_341;
              }
              if (v29 == 2732)
              {
LABEL_339:
                LOWORD(v11) = 4;
                goto LABEL_21;
              }
            }
            else
            {
              if (v29 == 2532) {
                goto LABEL_325;
              }
              if (v29 == 2556) {
                goto LABEL_319;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x923u)
          {
            if ((unsigned __int16)*a3 > 0x953u)
            {
              if (v29 == 2388) {
                goto LABEL_347;
              }
              if (v29 == 2436) {
                goto LABEL_299;
              }
            }
            else
            {
              if (v29 == 2340)
              {
LABEL_310:
                LOWORD(v11) = 18;
                goto LABEL_21;
              }
              if (v29 == 2360) {
                goto LABEL_346;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x8B9u)
          {
            if (v29 == 2234)
            {
LABEL_287:
              LOWORD(v11) = 27;
              goto LABEL_21;
            }
            if (v29 == 2266) {
              goto LABEL_328;
            }
          }
          else
          {
            if (v29 == 2160)
            {
LABEL_333:
              LOWORD(v11) = 21;
              goto LABEL_21;
            }
            if (v29 == 2224) {
              goto LABEL_327;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x1F5u)
        {
          if ((unsigned __int16)*a3 > 0x2CFu)
          {
            if ((unsigned __int16)*a3 > 0x6FFu)
            {
              if (v29 == 1792) {
                goto LABEL_335;
              }
              if (v29 == 1964)
              {
LABEL_302:
                LOWORD(v11) = 26;
                goto LABEL_21;
              }
            }
            else
            {
              if (v29 == 720)
              {
LABEL_352:
                LOWORD(v11) = 6;
                goto LABEL_21;
              }
              if (v29 == 1665)
              {
LABEL_262:
                LOWORD(v11) = 31;
                goto LABEL_21;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x238u)
          {
            if (v29 == 569) {
              goto LABEL_326;
            }
            if (v29 == 570) {
              goto LABEL_334;
            }
          }
          else
          {
            if (v29 == 502)
            {
LABEL_240:
              LOWORD(v11) = 28;
              goto LABEL_21;
            }
            if (v29 == 568) {
              goto LABEL_242;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x17Fu)
        {
          if ((unsigned __int16)*a3 > 0x1ADu)
          {
            if (v29 == 430) {
              goto LABEL_320;
            }
            if (v29 == 484) {
              goto LABEL_296;
            }
          }
          else
          {
            if (v29 == 384)
            {
LABEL_324:
              LOWORD(v11) = 9;
              goto LABEL_21;
            }
            if (v29 == 390)
            {
LABEL_353:
              LOWORD(v11) = 14;
              goto LABEL_21;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x13Fu)
        {
          if (v29 == 320) {
            goto LABEL_316;
          }
          if (v29 == 340) {
            goto LABEL_340;
          }
        }
        else
        {
          if (!(unsigned __int16)*a3) {
            goto LABEL_21;
          }
          if (v29 == 163) {
            goto LABEL_267;
          }
        }
        _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
        LOWORD(v11) = -1;
        goto LABEL_21;
      }
      if ((unsigned __int16)*a3)
      {
        switch(platform)
        {
          case 0uLL:
            unsigned int v17 = (unsigned __int16)*a3;
            if (v17 <= 0x7AB)
            {
              if (v17 == 1665) {
                goto LABEL_262;
              }
              if (v17 != 1864) {
                goto LABEL_270;
              }
              goto LABEL_242;
            }
            if (v17 == 1964) {
              goto LABEL_302;
            }
            if (v17 != 2234) {
              goto LABEL_270;
            }
            goto LABEL_287;
          case 3uLL:
            int v30 = (unsigned __int16)*a3;
            if (v30 == 3840) {
              goto LABEL_345;
            }
            if (v30 == 1088) {
              goto LABEL_267;
            }
            if (v30 != 720) {
              goto LABEL_270;
            }
            goto LABEL_352;
          case 4uLL:
            unsigned int v31 = (unsigned __int16)*a3;
            if (v31 > 0x1AD)
            {
              if ((unsigned __int16)*a3 > 0x1E3u)
              {
                if (v31 != 484)
                {
                  if (v31 != 496)
                  {
                    if (v31 != 502) {
                      goto LABEL_270;
                    }
                    goto LABEL_240;
                  }
LABEL_315:
                  LOWORD(v11) = 30;
                  goto LABEL_21;
                }
LABEL_296:
                LOWORD(v11) = 24;
                goto LABEL_21;
              }
              if (v31 != 430)
              {
                if (v31 != 446) {
                  goto LABEL_270;
                }
                goto LABEL_319;
              }
LABEL_320:
              LOWORD(v11) = 23;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0x17Fu)
            {
              if (v31 != 320)
              {
                if (v31 != 340) {
                  goto LABEL_270;
                }
LABEL_340:
                LOWORD(v11) = 13;
                goto LABEL_21;
              }
LABEL_316:
              LOWORD(v11) = 8;
              goto LABEL_21;
            }
            if (v31 == 384) {
              goto LABEL_324;
            }
            if (v31 != 390) {
LABEL_270:
            }
              -[CUINamedRenditionInfo decrementValue:forAttribute:](v11, platform);
            goto LABEL_353;
          case 5uLL:
            if ((unsigned __int16)*a3 == 3648) {
              goto LABEL_242;
            }
            goto LABEL_270;
          default:
            if (platform > 2) {
              goto LABEL_270;
            }
            unsigned int v32 = (unsigned __int16)*a3;
            if (v32 <= 0x983)
            {
              if ((unsigned __int16)*a3 <= 0x8AFu)
              {
                if ((unsigned __int16)*a3 <= 0x239u)
                {
                  if (v32 != 163)
                  {
                    if (v32 != 568)
                    {
                      if (v32 != 569) {
                        goto LABEL_270;
                      }
LABEL_326:
                      LOWORD(v11) = 2;
                      goto LABEL_21;
                    }
LABEL_242:
                    LOWORD(v11) = 1;
                    goto LABEL_21;
                  }
LABEL_267:
                  LOWORD(v11) = 5;
                  goto LABEL_21;
                }
                if (v32 != 570)
                {
                  if (v32 != 1792)
                  {
                    if (v32 != 2160) {
                      goto LABEL_270;
                    }
                    goto LABEL_333;
                  }
LABEL_335:
                  LOWORD(v11) = 16;
                  goto LABEL_21;
                }
LABEL_334:
                LOWORD(v11) = 3;
                goto LABEL_21;
              }
              if ((unsigned __int16)*a3 <= 0x937u)
              {
                if (v32 != 2224)
                {
                  if (v32 != 2266)
                  {
                    if (v32 != 2340) {
                      goto LABEL_270;
                    }
                    goto LABEL_310;
                  }
LABEL_328:
                  LOWORD(v11) = 25;
                  goto LABEL_21;
                }
LABEL_327:
                LOWORD(v11) = 10;
                goto LABEL_21;
              }
              if (v32 != 2360)
              {
                if (v32 != 2388)
                {
                  if (v32 != 2420) {
                    goto LABEL_270;
                  }
                  goto LABEL_345;
                }
LABEL_347:
                LOWORD(v11) = 15;
                goto LABEL_21;
              }
LABEL_346:
              LOWORD(v11) = 20;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0xABFu)
            {
              if ((unsigned __int16)*a3 <= 0xA3Du)
              {
                if (v32 != 2436)
                {
                  if (v32 != 2532)
                  {
                    if (v32 != 2556) {
                      goto LABEL_270;
                    }
LABEL_319:
                    LOWORD(v11) = 29;
                    goto LABEL_21;
                  }
LABEL_325:
                  LOWORD(v11) = 22;
                  goto LABEL_21;
                }
LABEL_299:
                LOWORD(v11) = 11;
                goto LABEL_21;
              }
              if (v32 == 2622) {
                goto LABEL_340;
              }
              if (v32 != 2688)
              {
                if (v32 != 2732) {
                  goto LABEL_270;
                }
                goto LABEL_339;
              }
LABEL_341:
              LOWORD(v11) = 12;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0xB33u)
            {
              if (v32 == 2752) {
                goto LABEL_316;
              }
              if (v32 != 2778)
              {
                if (v32 != 2796) {
                  goto LABEL_270;
                }
                goto LABEL_315;
              }
LABEL_329:
              LOWORD(v11) = 19;
              goto LABEL_21;
            }
            if (v32 == 2868) {
              goto LABEL_353;
            }
            if (v32 == 3024) {
              goto LABEL_352;
            }
            if (v32 != 32401) {
              goto LABEL_270;
            }
            break;
        }
LABEL_351:
        LOWORD(v11) = 17;
        goto LABEL_21;
      }
      LOWORD(v11) = 0;
    }
  }
LABEL_21:
  unsigned int v18 = keyFormat->var2;
  if (v18)
  {
    uint64_t v19 = 0;
    unsigned int v20 = (unsigned __int16)v11;
    while (keyFormat->var3[v19] != v8)
    {
      ++v19;
      v20 += 32;
      if (v18 == v19) {
        return;
      }
    }
    if ((int)v19 > 32)
    {
LABEL_27:
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, v8);
      return;
    }
    if ((v20 & 0x80000000) == 0 && *a3)
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v20)) {
          return;
        }
        int64_t v21 = *a3 - 1;
        *a3 = v21;
        v23 = self->_keyFormat;
        unint64_t v22 = self->_platform;
        if (v8 == 16 && v22 == -1)
        {
          uint64_t v24 = v23->var2;
          if (!v24) {
            return;
          }
          v25 = v23->var3;
          while (1)
          {
            int v26 = *v25++;
            if (v26 == 16) {
              break;
            }
            if (!--v24) {
              return;
            }
          }
        }
        if (v8 <= 0x1C)
        {
          if (v8 == 13)
          {
            LOWORD(v21) = (unsigned __int16)v21 != 0;
            goto LABEL_198;
          }
          if (v8 == 16)
          {
            if (v22 != -1)
            {
              if (!(_WORD)v21)
              {
                LOWORD(v21) = 0;
                goto LABEL_198;
              }
              switch(v22)
              {
                case 0uLL:
                  if ((unsigned __int16)v21 <= 0x7ABu)
                  {
                    if ((unsigned __int16)v21 == 1665) {
                      goto LABEL_106;
                    }
                    if ((unsigned __int16)v21 != 1864) {
                      goto LABEL_354;
                    }
                    goto LABEL_94;
                  }
                  if ((unsigned __int16)v21 == 1964) {
                    goto LABEL_146;
                  }
                  if ((unsigned __int16)v21 != 2234) {
                    goto LABEL_354;
                  }
                  goto LABEL_131;
                case 3uLL:
                  if ((unsigned __int16)v21 == 3840) {
                    goto LABEL_189;
                  }
                  if ((unsigned __int16)v21 == 1088) {
                    goto LABEL_111;
                  }
                  if ((unsigned __int16)v21 != 720) {
                    goto LABEL_354;
                  }
                  break;
                case 4uLL:
                  if ((unsigned __int16)v21 <= 0x1ADu)
                  {
                    if ((unsigned __int16)v21 <= 0x17Fu)
                    {
                      if ((unsigned __int16)v21 == 320) {
                        goto LABEL_160;
                      }
                      if ((unsigned __int16)v21 != 340) {
                        goto LABEL_354;
                      }
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v21 == 384) {
                      goto LABEL_168;
                    }
                    if ((unsigned __int16)v21 != 390) {
                      goto LABEL_354;
                    }
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v21 <= 0x1E3u)
                  {
                    if ((unsigned __int16)v21 == 430) {
                      goto LABEL_164;
                    }
                    if ((unsigned __int16)v21 != 446) {
                      goto LABEL_354;
                    }
                    goto LABEL_163;
                  }
                  if ((unsigned __int16)v21 == 484) {
                    goto LABEL_140;
                  }
                  if ((unsigned __int16)v21 != 496)
                  {
                    if ((unsigned __int16)v21 != 502) {
                      goto LABEL_354;
                    }
                    goto LABEL_92;
                  }
                  goto LABEL_159;
                case 5uLL:
                  if ((unsigned __int16)v21 == 3648) {
                    goto LABEL_94;
                  }
                  goto LABEL_354;
                default:
                  if (v22 > 2) {
                    goto LABEL_354;
                  }
                  if ((unsigned __int16)v21 <= 0x983u)
                  {
                    if ((unsigned __int16)v21 <= 0x8AFu)
                    {
                      if ((unsigned __int16)v21 <= 0x239u)
                      {
                        if ((unsigned __int16)v21 == 163) {
                          goto LABEL_111;
                        }
                        if ((unsigned __int16)v21 != 568)
                        {
                          if ((unsigned __int16)v21 != 569) {
                            goto LABEL_354;
                          }
                          goto LABEL_170;
                        }
                        goto LABEL_94;
                      }
                      if ((unsigned __int16)v21 == 570) {
                        goto LABEL_178;
                      }
                      if ((unsigned __int16)v21 != 1792)
                      {
                        if ((unsigned __int16)v21 != 2160) {
                          goto LABEL_354;
                        }
                        goto LABEL_177;
                      }
                      goto LABEL_179;
                    }
                    if ((unsigned __int16)v21 <= 0x937u)
                    {
                      if ((unsigned __int16)v21 == 2224) {
                        goto LABEL_171;
                      }
                      if ((unsigned __int16)v21 != 2266)
                      {
                        if ((unsigned __int16)v21 != 2340) {
                          goto LABEL_354;
                        }
                        goto LABEL_154;
                      }
                      goto LABEL_172;
                    }
                    if ((unsigned __int16)v21 == 2360) {
                      goto LABEL_190;
                    }
                    if ((unsigned __int16)v21 != 2388)
                    {
                      if ((unsigned __int16)v21 != 2420) {
                        goto LABEL_354;
                      }
                      goto LABEL_189;
                    }
                    goto LABEL_191;
                  }
                  if ((unsigned __int16)v21 <= 0xABFu)
                  {
                    if ((unsigned __int16)v21 <= 0xA3Du)
                    {
                      if ((unsigned __int16)v21 == 2436) {
                        goto LABEL_143;
                      }
                      if ((unsigned __int16)v21 != 2532)
                      {
                        if ((unsigned __int16)v21 != 2556) {
                          goto LABEL_354;
                        }
                        goto LABEL_163;
                      }
                      goto LABEL_169;
                    }
                    if ((unsigned __int16)v21 == 2622) {
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v21 != 2688)
                    {
                      if ((unsigned __int16)v21 != 2732) {
                        goto LABEL_354;
                      }
                      goto LABEL_183;
                    }
                    goto LABEL_185;
                  }
                  if ((unsigned __int16)v21 <= 0xB33u)
                  {
                    if ((unsigned __int16)v21 == 2752) {
                      goto LABEL_160;
                    }
                    if ((unsigned __int16)v21 != 2778)
                    {
                      if ((unsigned __int16)v21 != 2796) {
                        goto LABEL_354;
                      }
                      goto LABEL_159;
                    }
                    goto LABEL_173;
                  }
                  if ((unsigned __int16)v21 == 2868) {
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v21 != 3024)
                  {
                    if ((unsigned __int16)v21 != 32401) {
LABEL_354:
                    }
                      -[CUINamedRenditionInfo decrementValue:forAttribute:](v21, v22);
                    goto LABEL_195;
                  }
                  return;
              }
LABEL_196:
              LOWORD(v21) = 6;
              goto LABEL_198;
            }
            if ((unsigned __int16)v21 > 0x86Fu)
            {
              if ((unsigned __int16)v21 > 0x9E3u)
              {
                if ((unsigned __int16)v21 > 0xAD9u)
                {
                  if ((unsigned __int16)v21 > 0xEFFu)
                  {
                    if ((unsigned __int16)v21 == 3840)
                    {
LABEL_189:
                      LOWORD(v21) = 7;
                    }
                    else
                    {
                      if ((unsigned __int16)v21 != 32401) {
                        goto LABEL_149;
                      }
LABEL_195:
                      LOWORD(v21) = 17;
                    }
                  }
                  else if ((unsigned __int16)v21 == 2778)
                  {
LABEL_173:
                    LOWORD(v21) = 19;
                  }
                  else
                  {
                    if ((unsigned __int16)v21 != 2796) {
                      goto LABEL_149;
                    }
LABEL_159:
                    LOWORD(v21) = 30;
                  }
                }
                else if ((unsigned __int16)v21 > 0xA7Fu)
                {
                  if ((unsigned __int16)v21 == 2688)
                  {
LABEL_185:
                    LOWORD(v21) = 12;
                  }
                  else
                  {
                    if ((unsigned __int16)v21 != 2732) {
                      goto LABEL_149;
                    }
LABEL_183:
                    LOWORD(v21) = 4;
                  }
                }
                else if ((unsigned __int16)v21 == 2532)
                {
LABEL_169:
                  LOWORD(v21) = 22;
                }
                else
                {
                  if ((unsigned __int16)v21 != 2556) {
                    goto LABEL_149;
                  }
LABEL_163:
                  LOWORD(v21) = 29;
                }
              }
              else if ((unsigned __int16)v21 > 0x923u)
              {
                if ((unsigned __int16)v21 > 0x953u)
                {
                  if ((unsigned __int16)v21 != 2388)
                  {
                    if ((unsigned __int16)v21 == 2436)
                    {
LABEL_143:
                      LOWORD(v21) = 11;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
LABEL_191:
                  LOWORD(v21) = 15;
                }
                else if ((unsigned __int16)v21 == 2340)
                {
LABEL_154:
                  LOWORD(v21) = 18;
                }
                else
                {
                  if ((unsigned __int16)v21 != 2360) {
                    goto LABEL_149;
                  }
LABEL_190:
                  LOWORD(v21) = 20;
                }
              }
              else if ((unsigned __int16)v21 > 0x8B9u)
              {
                if ((unsigned __int16)v21 == 2234)
                {
LABEL_131:
                  LOWORD(v21) = 27;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v21 != 2266) {
                  goto LABEL_149;
                }
LABEL_172:
                LOWORD(v21) = 25;
              }
              else if ((unsigned __int16)v21 == 2160)
              {
LABEL_177:
                LOWORD(v21) = 21;
              }
              else
              {
                if ((unsigned __int16)v21 != 2224) {
                  goto LABEL_149;
                }
LABEL_171:
                LOWORD(v21) = 10;
              }
            }
            else if ((unsigned __int16)v21 > 0x1F5u)
            {
              if ((unsigned __int16)v21 > 0x2CFu)
              {
                if ((unsigned __int16)v21 <= 0x6FFu)
                {
                  if ((unsigned __int16)v21 != 720)
                  {
                    if ((unsigned __int16)v21 == 1665)
                    {
LABEL_106:
                      LOWORD(v21) = 31;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
                  goto LABEL_196;
                }
                if ((unsigned __int16)v21 != 1792)
                {
                  if ((unsigned __int16)v21 == 1964)
                  {
LABEL_146:
                    LOWORD(v21) = 26;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_179:
                LOWORD(v21) = 16;
              }
              else
              {
                if ((unsigned __int16)v21 <= 0x238u)
                {
                  if ((unsigned __int16)v21 == 502)
                  {
LABEL_92:
                    LOWORD(v21) = 28;
                    goto LABEL_198;
                  }
                  if ((unsigned __int16)v21 == 568)
                  {
LABEL_94:
                    LOWORD(v21) = 1;
                    goto LABEL_198;
                  }
LABEL_149:
                  _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
                  LOWORD(v21) = -1;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v21 == 569)
                {
LABEL_170:
                  LOWORD(v21) = 2;
                }
                else
                {
                  if ((unsigned __int16)v21 != 570) {
                    goto LABEL_149;
                  }
LABEL_178:
                  LOWORD(v21) = 3;
                }
              }
            }
            else if ((unsigned __int16)v21 > 0x17Fu)
            {
              if ((unsigned __int16)v21 > 0x1ADu)
              {
                if ((unsigned __int16)v21 != 430)
                {
                  if ((unsigned __int16)v21 == 484)
                  {
LABEL_140:
                    LOWORD(v21) = 24;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_164:
                LOWORD(v21) = 23;
              }
              else if ((unsigned __int16)v21 == 384)
              {
LABEL_168:
                LOWORD(v21) = 9;
              }
              else
              {
                if ((unsigned __int16)v21 != 390) {
                  goto LABEL_149;
                }
LABEL_197:
                LOWORD(v21) = 14;
              }
            }
            else
            {
              if ((unsigned __int16)v21 <= 0x13Fu)
              {
                if (!(_WORD)v21) {
                  goto LABEL_198;
                }
                if ((unsigned __int16)v21 == 163)
                {
LABEL_111:
                  LOWORD(v21) = 5;
                  goto LABEL_198;
                }
                goto LABEL_149;
              }
              if ((unsigned __int16)v21 == 320)
              {
LABEL_160:
                LOWORD(v21) = 8;
              }
              else
              {
                if ((unsigned __int16)v21 != 340) {
                  goto LABEL_149;
                }
LABEL_184:
                LOWORD(v21) = 13;
              }
            }
          }
          else if (((1 << v8) & 0x100600E6) != 0)
          {
            return;
          }
        }
LABEL_198:
        unsigned int v27 = v23->var2;
        if (!v27) {
          return;
        }
        uint64_t v28 = 0;
        unsigned int v20 = (unsigned __int16)v21;
        while (v23->var3[v28] != v8)
        {
          v20 += 32;
          if (v27 == ++v28) {
            return;
          }
        }
        if ((int)v28 > 32) {
          goto LABEL_27;
        }
      }
      while (*a3 && (v20 & 0x80000000) == 0);
    }
  }
}

- (CUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CUINamedRenditionInfo;
  uint64_t v8 = [(CUINamedRenditionInfo *)&v11 init];
  v8->_keyFormat = a4;
  v8->_unint64_t platform = a5;
  v9 = [a3 bytes];
  if (*v9 == 1)
  {
    v8->_bitmap = CUIBitVectorFromData(v9 + 3, v9[2]);
  }
  else
  {

    return 0;
  }
  return v8;
}

- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  unsigned __int16 v4 = a4;
  return [(CUINamedRenditionInfo *)self attributePresent:26 withValue:(unsigned __int16)a3] >= 1&& [(CUINamedRenditionInfo *)self attributePresent:27 withValue:v4] > 0;
}

- (BOOL)containsVectorGlyphInterpolationSources
{
  if (![(CUINamedRenditionInfo *)self containsVectorGlyphWithWeight:1 size:1]|| ![(CUINamedRenditionInfo *)self containsVectorGlyphWithWeight:4 size:1])
  {
    return 0;
  }
  return [(CUINamedRenditionInfo *)self containsVectorGlyphWithWeight:9 size:1];
}

- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v8 = *(void *)&a3;
  keyFormat = self->_keyFormat;
  unint64_t platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v14 = *var3++;
      if (v14 == 16) {
        break;
      }
      if (!--var2) {
        return;
      }
    }
  }
  if (a3 > 0x1C) {
    goto LABEL_21;
  }
  if (((1 << a3) & 0x100600E6) != 0) {
    return;
  }
  if (a3 == 13)
  {
    *(void *)&a4 = a4 != 0;
    goto LABEL_21;
  }
  if (a3 != 16) {
    goto LABEL_21;
  }
  if (platform != -1)
  {
    if (!a4) {
      goto LABEL_21;
    }
    switch(platform)
    {
      case 0uLL:
        if ((int)a4 <= 1963)
        {
          if (a4 != 1665)
          {
            if (a4 != 1864) {
              goto LABEL_178;
            }
            goto LABEL_74;
          }
          goto LABEL_86;
        }
        if (a4 == 1964) {
          goto LABEL_126;
        }
        if (a4 != 2234) {
          goto LABEL_178;
        }
        goto LABEL_111;
      case 3uLL:
        if (a4 == 3840) {
          goto LABEL_169;
        }
        if (a4 == 1088) {
          goto LABEL_91;
        }
        if (a4 != 720) {
          goto LABEL_178;
        }
        goto LABEL_176;
      case 4uLL:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502) {
                  goto LABEL_178;
                }
                goto LABEL_72;
              }
              goto LABEL_139;
            }
LABEL_120:
            *(void *)&a4 = 24;
            goto LABEL_21;
          }
          if (a4 != 430)
          {
            if (a4 != 446) {
              goto LABEL_178;
            }
            goto LABEL_143;
          }
          goto LABEL_144;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340) {
              goto LABEL_178;
            }
            goto LABEL_164;
          }
LABEL_140:
          *(void *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384) {
          goto LABEL_148;
        }
        if (a4 != 390) {
LABEL_178:
        }
          -[CUINamedRenditionInfo attributePresent:withValue:](a4, platform);
        goto LABEL_177;
      case 5uLL:
        if (a4 == 3648) {
          goto LABEL_74;
        }
        goto LABEL_178;
      default:
        if (platform > 2) {
          goto LABEL_178;
        }
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569) {
                    goto LABEL_178;
                  }
                  goto LABEL_150;
                }
LABEL_74:
                *(void *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_91:
              *(void *)&a4 = 5;
              goto LABEL_21;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160) {
                  goto LABEL_178;
                }
                goto LABEL_157;
              }
LABEL_159:
              *(void *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_158:
            *(void *)&a4 = 3;
            goto LABEL_21;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340) {
                  goto LABEL_178;
                }
                goto LABEL_134;
              }
LABEL_152:
              *(void *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_151:
            *(void *)&a4 = 10;
            goto LABEL_21;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420) {
                goto LABEL_178;
              }
              goto LABEL_169;
            }
            goto LABEL_171;
          }
LABEL_170:
          *(void *)&a4 = 20;
          goto LABEL_21;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556) {
                  goto LABEL_178;
                }
LABEL_143:
                *(void *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_149:
              *(void *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_123:
            *(void *)&a4 = 11;
            goto LABEL_21;
          }
          if (a4 != 2622)
          {
            if (a4 != 2688)
            {
              if (a4 != 2732) {
                goto LABEL_178;
              }
              goto LABEL_163;
            }
LABEL_165:
            *(void *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_164:
          *(void *)&a4 = 13;
          goto LABEL_21;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752) {
            goto LABEL_140;
          }
          if (a4 != 2778)
          {
            if (a4 != 2796) {
              goto LABEL_178;
            }
            goto LABEL_139;
          }
LABEL_153:
          *(void *)&a4 = 19;
          goto LABEL_21;
        }
        if (a4 == 2868) {
          goto LABEL_177;
        }
        if (a4 == 3024) {
          goto LABEL_176;
        }
        if (a4 != 32401) {
          goto LABEL_178;
        }
        break;
    }
    goto LABEL_175;
  }
  if ((int)a4 > 2159)
  {
    if ((int)a4 > 2531)
    {
      if ((int)a4 > 2777)
      {
        if ((int)a4 > 3839)
        {
          if (a4 == 3840)
          {
LABEL_169:
            *(void *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_175:
            *(void *)&a4 = 17;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2778) {
            goto LABEL_153;
          }
          if (a4 == 2796)
          {
LABEL_139:
            *(void *)&a4 = 30;
            goto LABEL_21;
          }
        }
      }
      else if ((int)a4 > 2687)
      {
        if (a4 == 2688) {
          goto LABEL_165;
        }
        if (a4 == 2732)
        {
LABEL_163:
          *(void *)&a4 = 4;
          goto LABEL_21;
        }
      }
      else
      {
        if (a4 == 2532) {
          goto LABEL_149;
        }
        if (a4 == 2556) {
          goto LABEL_143;
        }
      }
    }
    else if ((int)a4 > 2339)
    {
      if ((int)a4 > 2387)
      {
        if (a4 == 2388)
        {
LABEL_171:
          *(void *)&a4 = 15;
          goto LABEL_21;
        }
        if (a4 == 2436) {
          goto LABEL_123;
        }
      }
      else
      {
        if (a4 == 2340)
        {
LABEL_134:
          *(void *)&a4 = 18;
          goto LABEL_21;
        }
        if (a4 == 2360) {
          goto LABEL_170;
        }
      }
    }
    else if ((int)a4 > 2233)
    {
      if (a4 == 2234)
      {
LABEL_111:
        *(void *)&a4 = 27;
        goto LABEL_21;
      }
      if (a4 == 2266) {
        goto LABEL_152;
      }
    }
    else
    {
      if (a4 == 2160)
      {
LABEL_157:
        *(void *)&a4 = 21;
        goto LABEL_21;
      }
      if (a4 == 2224) {
        goto LABEL_151;
      }
    }
    goto LABEL_129;
  }
  if ((int)a4 > 501)
  {
    if ((int)a4 <= 719)
    {
      if ((int)a4 > 568)
      {
        if (a4 == 569)
        {
LABEL_150:
          *(void *)&a4 = 2;
          goto LABEL_21;
        }
        if (a4 == 570) {
          goto LABEL_158;
        }
      }
      else
      {
        if (a4 == 502)
        {
LABEL_72:
          *(void *)&a4 = 28;
          goto LABEL_21;
        }
        if (a4 == 568) {
          goto LABEL_74;
        }
      }
      goto LABEL_129;
    }
    if ((int)a4 > 1791)
    {
      if (a4 == 1792) {
        goto LABEL_159;
      }
      if (a4 == 1964)
      {
LABEL_126:
        *(void *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_86:
        *(void *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
LABEL_176:
    *(void *)&a4 = 6;
  }
  else
  {
    if ((int)a4 <= 383)
    {
      if ((int)a4 > 319)
      {
        if (a4 == 320) {
          goto LABEL_140;
        }
        if (a4 == 340) {
          goto LABEL_164;
        }
      }
      else
      {
        if (!a4) {
          goto LABEL_21;
        }
        if (a4 == 163) {
          goto LABEL_91;
        }
      }
      goto LABEL_129;
    }
    if ((int)a4 > 429)
    {
      if (a4 == 430)
      {
LABEL_144:
        *(void *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484) {
        goto LABEL_120;
      }
      goto LABEL_129;
    }
    if (a4 == 384)
    {
LABEL_148:
      *(void *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
    {
LABEL_129:
      _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", *(uint64_t *)&a3, a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
      *(void *)&a4 = 0xFFFFLL;
      goto LABEL_21;
    }
LABEL_177:
    *(void *)&a4 = 14;
  }
LABEL_21:
  unsigned int v15 = keyFormat->var2;
  if (v15)
  {
    uint64_t v16 = 0;
    unsigned int v17 = a4;
    while (keyFormat->var3[v16] != v8)
    {
      ++v16;
      v17 += 32;
      if (v15 == v16) {
        return;
      }
    }
    if ((int)v16 < 33)
    {
      if ((v17 & 0x80000000) == 0)
      {
        bitmap = (os_unfair_lock_s *)self->_bitmap;
        CUIBitVectorSetBit(bitmap, v17);
      }
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, v8);
    }
  }
}

- (CUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)CUINamedRenditionInfo;
  id v6 = [(CUINamedRenditionInfo *)&v26 init];
  *((void *)v6 + 1) = CUIBitVectorCreate(32 * a3->var2);
  *((void *)v6 + 2) = a3;
  *((void *)v6 + 3) = a4;
  unsigned int var2 = a3->var2;
  if (var2)
  {
    for (unint64_t i = 0; i < var2; ++i)
    {
      unsigned int v15 = a3->var3[i];
      if (*((void *)v6 + 3) == -1 && v15 == 16)
      {
        if (var2 <= 1) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = var2;
        }
        var3 = a3->var3;
        while (1)
        {
          int v22 = *var3++;
          if (v22 == 16) {
            break;
          }
          if (!--v20) {
            goto LABEL_23;
          }
        }
      }
      if (v15 > 0x1C || ((1 << v15) & 0x100600E6) == 0)
      {
        uint64_t v18 = 0;
        int v19 = var2;
        if (var2 <= 1uLL) {
          int v19 = 1;
        }
        while (a3->var3[v18] != v15)
        {
          if (v19 == ++v18) {
            goto LABEL_23;
          }
        }
        if ((int)v18 < 33) {
          continue;
        }
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", v7, v8, v9, v10, v11, v12, a3->var3[i]);
      }
LABEL_23:
      uint64_t v23 = CUIBitVectorSetBitRange(*((os_unfair_lock_s **)v6 + 1), 32 * (int)i, 32 * (int)i + 32);
      if ((v23 & 0x80000000) != 0) {
        -[CUINamedRenditionInfo initWithKeyFormat:andPlatform:](v23, v24, v7, v8, v9, v10, v11, v12);
      }
      unsigned int var2 = a3->var2;
    }
  }
  return (CUINamedRenditionInfo *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  id result = +[CUINamedRenditionInfo allocWithZone:a3];
  if (result)
  {
    keyFormat = self->_keyFormat;
    int64_t platform = self->_platform;
    v9.receiver = result;
    v9.super_class = (Class)CUINamedRenditionInfo;
    id result = [(CUINamedRenditionInfo *)&v9 init];
    *((void *)result + 1) = v5;
    *((void *)result + 2) = keyFormat;
    *((void *)result + 3) = platform;
  }
  return result;
}

- (void)dealloc
{
  CUIBitVectorDestroy((os_unfair_lock_s *)self->_bitmap);
  v3.receiver = self;
  v3.super_class = (Class)CUINamedRenditionInfo;
  [(CUINamedRenditionInfo *)&v3 dealloc];
}

- (id)archivedData
{
  size_t v5 = 0;
  v2 = CUIBitVectorToData((os_unfair_lock_s *)self->_bitmap, &v5);
  uint64_t v6 = 1;
  int v7 = v5;
  id v3 = +[NSMutableData data];
  [v3 appendBytes:&v6 length:12];
  [v3 appendBytes:v2 length:v5];
  free(v2);
  return v3;
}

- (BOOL)isEqualToNamedRenditionInfo:(id)a3
{
  if (*((void *)a3 + 3) != self->_platform || *(_DWORD *)(*((void *)a3 + 2) + 8) != self->_keyFormat->var2) {
    return 0;
  }
  if (!CUIBitVectorEqual((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1)))
  {
    keyFormat = self->_keyFormat;
    if (keyFormat->var2)
    {
      unsigned int v6 = 0;
      while (keyFormat->var3[v6] == *(_DWORD *)(*((void *)a3 + 2) + 4 * v6 + 12))
      {
        uint64_t v7 = v6;
        unsigned int v8 = -[CUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:");
        if (v8 != [a3 contentPresentForAttribute:*(unsigned int *)(*((void *)a3 + 2) + 4 * v7 + 12)])break; {
        unsigned int v9 = [(CUINamedRenditionInfo *)self diverseContentPresentForAttribute:self->_keyFormat->var3[v7]];
        }
        if (v9 != [a3 diverseContentPresentForAttribute:*(unsigned int *)(*((void *)a3 + 2) + 4 * v7 + 12)])break; {
        if ([(CUINamedRenditionInfo *)self contentPresentForAttribute:self->_keyFormat->var3[v7]])
        }
        {
          id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
          id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
          unint64_t platform = self->_platform;
          unsigned int v13 = self->_keyFormat->var3[v7];
          unsigned int v14 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, 32 * (int)v7);
          if (v14 == -1)
          {
            [v10 addObject:@"<all>"];
          }
          else
          {
            unsigned int v15 = v14;
            uint64_t v16 = 0;
            do
            {
              if ((v15 >> v16))
              {
                uint64_t v17 = v16;
                if (v13 == 16)
                {
                  int v18 = __CUISubtypeFromIndex(platform, v16);
                  if (v18 >= 0) {
                    uint64_t v17 = v18;
                  }
                  else {
                    uint64_t v17 = v16;
                  }
                }
                objc_msgSend(v10, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
              }
              uint64_t v16 = (v16 + 1);
            }
            while (v16 != 32);
          }
          unint64_t v19 = *((void *)a3 + 3);
          int v20 = *(_DWORD *)(*((void *)a3 + 2) + 4 * v7 + 12);
          unsigned int v21 = CUIBitVectorBucketValue(*((os_unfair_lock_s **)a3 + 1), 32 * (int)v7);
          if (v21 == -1)
          {
            [v11 addObject:@"<all>"];
          }
          else
          {
            unsigned int v22 = v21;
            uint64_t v23 = 0;
            do
            {
              if ((v22 >> v23))
              {
                uint64_t v24 = v23;
                if (v20 == 16)
                {
                  int v25 = __CUISubtypeFromIndex(v19, v23);
                  if (v25 >= 0) {
                    uint64_t v24 = v25;
                  }
                  else {
                    uint64_t v24 = v23;
                  }
                }
                objc_msgSend(v11, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v24));
              }
              uint64_t v23 = (v23 + 1);
            }
            while (v23 != 32);
          }
          unsigned int v26 = [v10 isEqualToArray:v11];

          if (!v26) {
            break;
          }
        }
        unsigned int v6 = v7 + 1;
        keyFormat = self->_keyFormat;
        BOOL result = 1;
        if ((v7 + 1) >= keyFormat->var2) {
          return result;
        }
      }
      return 0;
    }
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(CUINamedRenditionInfo *)self isEqualToNamedRenditionInfo:a3];
}

- (id)description
{
  id v3 = CUIBitVectorToString((os_unfair_lock_s *)self->_bitmap);
  uint64_t v4 = (objc_class *)objc_opt_class();
  size_t v5 = +[NSString stringWithFormat:@"<%@: %p %s>", NSStringFromClass(v4), self, v3];
  free(v3);
  return v5;
}

- (id)debugDescription
{
  bzero(__str, 0x800uLL);
  keyFormat = self->_keyFormat;
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:32];
  objc_msgSend(v4, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "| Index |            Attribute             | Is Content Present | Is Diverse Content Present |            Values          |"));
  unsigned int v21 = v4;
  objc_msgSend(v4, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "|-------|----------------------------------|--------------------|----------------------------|----------------------------|"));
  if (keyFormat->var2)
  {
    unint64_t v5 = 0;
    int v20 = keyFormat;
    do
    {
      unsigned int v6 = &keyFormat->var0 + v5;
      uint64_t v7 = v6[3];
      unsigned int v22 = CUIThemeAttributeNameToString(v6[3]);
      bzero(__str, 0x800uLL);
      unsigned int v8 = [(CUINamedRenditionInfo *)self contentPresentForAttribute:v7];
      unsigned int v9 = [(CUINamedRenditionInfo *)self diverseContentPresentForAttribute:v7];
      id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
      unint64_t platform = self->_platform;
      unsigned int v12 = v6[3];
      unsigned int v13 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, 32 * (int)v5);
      if (v13 == -1)
      {
        [v10 addObject:@"<all>"];
      }
      else
      {
        unsigned int v14 = v13;
        uint64_t v15 = 0;
        do
        {
          if ((v14 >> v15))
          {
            uint64_t v16 = v15;
            if (v12 == 16)
            {
              int v17 = __CUISubtypeFromIndex(platform, v15);
              if (v17 >= 0) {
                uint64_t v16 = v17;
              }
              else {
                uint64_t v16 = v15;
              }
            }
            objc_msgSend(v10, "addObject:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16));
          }
          uint64_t v15 = (v15 + 1);
        }
        while (v15 != 32);
      }
      snprintf(__str, 0x800uLL, "| %-5d | %-32s | %-18d | %-26d | %-26s |", v5, v22, v8, v9, (const char *)objc_msgSend(objc_msgSend(v10, "componentsJoinedByString:", @","), "UTF8String"));
      objc_msgSend(v21, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));

      ++v5;
      keyFormat = v20;
    }
    while (v5 < v20->var2);
  }
  id v18 = [v21 componentsJoinedByString:@"\n"];

  return v18;
}

- (id)bitwiseAndWith:(id)a3
{
  id v4 = CUIBitVectorBitAnd((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1));
  unint64_t v5 = [CUINamedRenditionInfo alloc];
  if (v5)
  {
    keyFormat = self->_keyFormat;
    int64_t platform = self->_platform;
    v9.receiver = v5;
    v9.super_class = (Class)CUINamedRenditionInfo;
    unint64_t v5 = [(CUINamedRenditionInfo *)&v9 init];
    v5->_bitmap = v4;
    v5->_keyFormat = keyFormat;
    v5->_int64_t platform = platform;
  }
  return v5;
}

- (id)bitwiseOrWith:(id)a3 forAttribute:(int)a4
{
  keyFormat = self->_keyFormat;
  unsigned int var2 = keyFormat->var2;
  if (!var2) {
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  var3 = keyFormat->var3;
  while (var3[v7] != a4)
  {
    if (var2 == ++v7) {
      goto LABEL_8;
    }
  }
  if ((v7 & 0x80000000) != 0) {
LABEL_8:
  }
    objc_super v9 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  else {
    objc_super v9 = CUIBitVectorBitOrForBucket((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1), v7);
  }
  id v10 = v9;
  id v11 = [CUINamedRenditionInfo alloc];
  if (v11)
  {
    unsigned int v13 = self->_keyFormat;
    int64_t platform = self->_platform;
    v15.receiver = v11;
    v15.super_class = (Class)CUINamedRenditionInfo;
    id v11 = [(CUINamedRenditionInfo *)&v15 init];
    v11->_bitmap = v10;
    v11->_keyFormat = v13;
    v11->_int64_t platform = platform;
  }
  return v11;
}

- (unsigned)getValueOfAttribute:(int)a3
{
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2)
    {
      unsigned __int16 result = 0;
      return __CUISubtypeFromIndex(self->_platform, result);
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v13 = *var3++;
      if (v13 == 16) {
        break;
      }
      if (!--var2) {
        goto LABEL_10;
      }
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0) {
    goto LABEL_10;
  }
  unsigned int v15 = keyFormat->var2;
  if (!v15) {
    goto LABEL_10;
  }
  unsigned int v16 = 0;
  uint64_t v17 = 0;
  id v18 = keyFormat->var3;
  while (v18[v17] != a3)
  {
    unsigned __int16 result = 0;
    ++v17;
    v16 += 32;
    if (v15 == v17) {
      goto LABEL_11;
    }
  }
  if ((int)v17 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
LABEL_10:
    unsigned __int16 result = 0;
    goto LABEL_11;
  }
  if ((v17 & 0x80000000) != 0) {
    goto LABEL_10;
  }
  unsigned int v19 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v16);
  int v20 = 0;
  while (((v19 >> v20) & 1) == 0)
  {
    unsigned __int16 result = 0;
    if (++v20 == 32) {
      goto LABEL_11;
    }
  }
  unsigned __int16 result = v20;
LABEL_11:
  if (a3 == 16) {
    return __CUISubtypeFromIndex(self->_platform, result);
  }
  return result;
}

- (unsigned)getClosestValueOfAttribute:(int)a3 withValue:(unsigned __int16)a4
{
  int v8 = a4;
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return 0;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v12 = *var3++;
      if (v12 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if (a3 <= 0x1C && ((1 << a3) & 0x100600E6) != 0) {
    return 0;
  }
  unsigned int v15 = keyFormat->var2;
  if (!v15) {
    return 0;
  }
  unsigned int v16 = 0;
  uint64_t v17 = 0;
  id v18 = keyFormat->var3;
  while (v18[v17] != a3)
  {
    unsigned __int16 v13 = 0;
    ++v17;
    v16 += 32;
    if (v15 == v17) {
      return v13;
    }
  }
  if ((int)v17 >= 33)
  {
    _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, *(uint64_t *)&a3);
    return 0;
  }
  if ((v17 & 0x80000000) != 0) {
    return 0;
  }
  unsigned int v19 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v16);
  while (((v19 >> v8) & 1) == 0)
  {
    unsigned __int16 v13 = 0;
    BOOL v20 = __OFSUB__(v8--, 1);
    if (v8 < 0 != v20) {
      return v13;
    }
  }
  return v8;
}

- (BOOL)contentPresentForAttribute:(int)a3
{
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return 0;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v11 = *var3++;
      if (v11 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    unsigned int v12 = keyFormat->var2;
    if (v12)
    {
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      unsigned int v15 = keyFormat->var3;
      while (v15[v14] != a3)
      {
        ++v14;
        v13 += 32;
        if (v12 == v14) {
          return 0;
        }
      }
      if ((int)v14 < 33)
      {
        if ((v14 & 0x80000000) == 0 && (int)CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v13) > 0) {
          return 1;
        }
      }
      else
      {
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, v3, v4, v5, v6, v7, *(uint64_t *)&a3);
      }
    }
  }
  return 0;
}

- (BOOL)contentEqualForAttribute:(int)a3 withRenditionInfo:(id)a4
{
  keyFormat = self->_keyFormat;
  if (a3 == 16 && self->_platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return 0;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v12 = *var3++;
      if (v12 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    unsigned int v13 = keyFormat->var2;
    if (v13)
    {
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      unsigned int v16 = keyFormat->var3;
      while (v16[v15] != a3)
      {
        ++v15;
        v14 += 32;
        if (v13 == v15) {
          return 0;
        }
      }
      if ((int)v15 < 33)
      {
        if ((v15 & 0x80000000) == 0)
        {
          int v17 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v14);
          return v17 == CUIBitVectorBucketValue(*((os_unfair_lock_s **)a4 + 1), v14);
        }
      }
      else
      {
        _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7, *(uint64_t *)&a3);
      }
    }
  }
  return 0;
}

- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
  uint64_t v8 = *(void *)&a3;
  keyFormat = self->_keyFormat;
  unint64_t platform = self->_platform;
  if (a3 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v14 = *var3++;
      if (v14 == 16) {
        break;
      }
      if (!--var2) {
        return;
      }
    }
  }
  if (a3 > 0x1C) {
    goto LABEL_21;
  }
  if (((1 << a3) & 0x100600E6) != 0) {
    return;
  }
  if (a3 == 13)
  {
    *(void *)&a4 = a4 != 0;
    goto LABEL_21;
  }
  if (a3 != 16) {
    goto LABEL_21;
  }
  if (platform != -1)
  {
    if (!a4) {
      goto LABEL_21;
    }
    switch(platform)
    {
      case 0uLL:
        if ((int)a4 <= 1963)
        {
          if (a4 != 1665)
          {
            if (a4 != 1864) {
              goto LABEL_178;
            }
            goto LABEL_74;
          }
          goto LABEL_86;
        }
        if (a4 == 1964) {
          goto LABEL_126;
        }
        if (a4 != 2234) {
          goto LABEL_178;
        }
        goto LABEL_111;
      case 3uLL:
        if (a4 == 3840) {
          goto LABEL_169;
        }
        if (a4 == 1088) {
          goto LABEL_91;
        }
        if (a4 != 720) {
          goto LABEL_178;
        }
        goto LABEL_176;
      case 4uLL:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502) {
                  goto LABEL_178;
                }
                goto LABEL_72;
              }
              goto LABEL_139;
            }
LABEL_120:
            *(void *)&a4 = 24;
            goto LABEL_21;
          }
          if (a4 != 430)
          {
            if (a4 != 446) {
              goto LABEL_178;
            }
            goto LABEL_143;
          }
          goto LABEL_144;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340) {
              goto LABEL_178;
            }
            goto LABEL_164;
          }
LABEL_140:
          *(void *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384) {
          goto LABEL_148;
        }
        if (a4 != 390) {
LABEL_178:
        }
          -[CUINamedRenditionInfo attributePresent:withValue:](a4, platform);
        goto LABEL_177;
      case 5uLL:
        if (a4 == 3648) {
          goto LABEL_74;
        }
        goto LABEL_178;
      default:
        if (platform > 2) {
          goto LABEL_178;
        }
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569) {
                    goto LABEL_178;
                  }
                  goto LABEL_150;
                }
LABEL_74:
                *(void *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_91:
              *(void *)&a4 = 5;
              goto LABEL_21;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160) {
                  goto LABEL_178;
                }
                goto LABEL_157;
              }
LABEL_159:
              *(void *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_158:
            *(void *)&a4 = 3;
            goto LABEL_21;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340) {
                  goto LABEL_178;
                }
                goto LABEL_134;
              }
LABEL_152:
              *(void *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_151:
            *(void *)&a4 = 10;
            goto LABEL_21;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420) {
                goto LABEL_178;
              }
              goto LABEL_169;
            }
            goto LABEL_171;
          }
LABEL_170:
          *(void *)&a4 = 20;
          goto LABEL_21;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556) {
                  goto LABEL_178;
                }
LABEL_143:
                *(void *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_149:
              *(void *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_123:
            *(void *)&a4 = 11;
            goto LABEL_21;
          }
          if (a4 != 2622)
          {
            if (a4 != 2688)
            {
              if (a4 != 2732) {
                goto LABEL_178;
              }
              goto LABEL_163;
            }
LABEL_165:
            *(void *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_164:
          *(void *)&a4 = 13;
          goto LABEL_21;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752) {
            goto LABEL_140;
          }
          if (a4 != 2778)
          {
            if (a4 != 2796) {
              goto LABEL_178;
            }
            goto LABEL_139;
          }
LABEL_153:
          *(void *)&a4 = 19;
          goto LABEL_21;
        }
        if (a4 == 2868) {
          goto LABEL_177;
        }
        if (a4 == 3024) {
          goto LABEL_176;
        }
        if (a4 != 32401) {
          goto LABEL_178;
        }
        break;
    }
    goto LABEL_175;
  }
  if ((int)a4 > 2159)
  {
    if ((int)a4 > 2531)
    {
      if ((int)a4 > 2777)
      {
        if ((int)a4 > 3839)
        {
          if (a4 == 3840)
          {
LABEL_169:
            *(void *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_175:
            *(void *)&a4 = 17;
            goto LABEL_21;
          }
        }
        else
        {
          if (a4 == 2778) {
            goto LABEL_153;
          }
          if (a4 == 2796)
          {
LABEL_139:
            *(void *)&a4 = 30;
            goto LABEL_21;
          }
        }
      }
      else if ((int)a4 > 2687)
      {
        if (a4 == 2688) {
          goto LABEL_165;
        }
        if (a4 == 2732)
        {
LABEL_163:
          *(void *)&a4 = 4;
          goto LABEL_21;
        }
      }
      else
      {
        if (a4 == 2532) {
          goto LABEL_149;
        }
        if (a4 == 2556) {
          goto LABEL_143;
        }
      }
    }
    else if ((int)a4 > 2339)
    {
      if ((int)a4 > 2387)
      {
        if (a4 == 2388)
        {
LABEL_171:
          *(void *)&a4 = 15;
          goto LABEL_21;
        }
        if (a4 == 2436) {
          goto LABEL_123;
        }
      }
      else
      {
        if (a4 == 2340)
        {
LABEL_134:
          *(void *)&a4 = 18;
          goto LABEL_21;
        }
        if (a4 == 2360) {
          goto LABEL_170;
        }
      }
    }
    else if ((int)a4 > 2233)
    {
      if (a4 == 2234)
      {
LABEL_111:
        *(void *)&a4 = 27;
        goto LABEL_21;
      }
      if (a4 == 2266) {
        goto LABEL_152;
      }
    }
    else
    {
      if (a4 == 2160)
      {
LABEL_157:
        *(void *)&a4 = 21;
        goto LABEL_21;
      }
      if (a4 == 2224) {
        goto LABEL_151;
      }
    }
    goto LABEL_129;
  }
  if ((int)a4 > 501)
  {
    if ((int)a4 <= 719)
    {
      if ((int)a4 > 568)
      {
        if (a4 == 569)
        {
LABEL_150:
          *(void *)&a4 = 2;
          goto LABEL_21;
        }
        if (a4 == 570) {
          goto LABEL_158;
        }
      }
      else
      {
        if (a4 == 502)
        {
LABEL_72:
          *(void *)&a4 = 28;
          goto LABEL_21;
        }
        if (a4 == 568) {
          goto LABEL_74;
        }
      }
      goto LABEL_129;
    }
    if ((int)a4 > 1791)
    {
      if (a4 == 1792) {
        goto LABEL_159;
      }
      if (a4 == 1964)
      {
LABEL_126:
        *(void *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_86:
        *(void *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
LABEL_176:
    *(void *)&a4 = 6;
  }
  else
  {
    if ((int)a4 <= 383)
    {
      if ((int)a4 > 319)
      {
        if (a4 == 320) {
          goto LABEL_140;
        }
        if (a4 == 340) {
          goto LABEL_164;
        }
      }
      else
      {
        if (!a4) {
          goto LABEL_21;
        }
        if (a4 == 163) {
          goto LABEL_91;
        }
      }
      goto LABEL_129;
    }
    if ((int)a4 > 429)
    {
      if (a4 == 430)
      {
LABEL_144:
        *(void *)&a4 = 23;
        goto LABEL_21;
      }
      if (a4 == 484) {
        goto LABEL_120;
      }
      goto LABEL_129;
    }
    if (a4 == 384)
    {
LABEL_148:
      *(void *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
    {
LABEL_129:
      _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", *(uint64_t *)&a3, a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
      *(void *)&a4 = 0xFFFFLL;
      goto LABEL_21;
    }
LABEL_177:
    *(void *)&a4 = 14;
  }
LABEL_21:
  unsigned int v15 = keyFormat->var2;
  if (v15)
  {
    uint64_t v16 = 0;
    unsigned int v17 = a4;
    while (keyFormat->var3[v16] != v8)
    {
      ++v16;
      v17 += 32;
      if (v15 == v16) {
        return;
      }
    }
    if ((int)v16 < 33)
    {
      if ((v17 & 0x80000000) == 0)
      {
        bitmap = (os_unfair_lock_s *)self->_bitmap;
        CUIBitVectorUnSetBit(bitmap, v17);
      }
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", *(uint64_t *)&a3, a4, v4, v5, v6, v7, v8);
    }
  }
}

- (unint64_t)numberOfBitsSet
{
  return (int)CUIBitVectorNumberOfBitsSet((os_unfair_lock_s *)self->_bitmap);
}

- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_super v9 = (char *)[a4 count];
  unint64_t platform = self->_platform;
  id v11 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:", *a3), "integerValue");
  keyFormat = self->_keyFormat;
  if (v5 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v21 = *var3++;
      if (v21 == 16) {
        break;
      }
      if (!--var2) {
        return;
      }
    }
  }
  if (v5 <= 0x1C)
  {
    if (((1 << v5) & 0x100600E6) != 0) {
      return;
    }
    if (v5 == 13)
    {
      LOWORD(v11) = (unsigned __int16)v11 != 0;
    }
    else if (v5 == 16)
    {
      if (platform == -1)
      {
        if ((unsigned __int16)v11 > 0x86Fu)
        {
          if ((unsigned __int16)v11 > 0x9E3u)
          {
            if ((unsigned __int16)v11 > 0xAD9u)
            {
              if ((unsigned __int16)v11 > 0xEFFu)
              {
                if ((unsigned __int16)v11 == 3840)
                {
LABEL_345:
                  LOWORD(v11) = 7;
                  goto LABEL_21;
                }
                if ((unsigned __int16)v11 == 32401) {
                  goto LABEL_351;
                }
              }
              else
              {
                if ((unsigned __int16)v11 == 2778) {
                  goto LABEL_329;
                }
                if ((unsigned __int16)v11 == 2796) {
                  goto LABEL_315;
                }
              }
            }
            else if ((unsigned __int16)v11 > 0xA7Fu)
            {
              if ((unsigned __int16)v11 == 2688) {
                goto LABEL_341;
              }
              if ((unsigned __int16)v11 == 2732)
              {
LABEL_339:
                LOWORD(v11) = 4;
                goto LABEL_21;
              }
            }
            else
            {
              if ((unsigned __int16)v11 == 2532) {
                goto LABEL_325;
              }
              if ((unsigned __int16)v11 == 2556) {
                goto LABEL_319;
              }
            }
          }
          else if ((unsigned __int16)v11 > 0x923u)
          {
            if ((unsigned __int16)v11 > 0x953u)
            {
              if ((unsigned __int16)v11 == 2388) {
                goto LABEL_347;
              }
              if ((unsigned __int16)v11 == 2436) {
                goto LABEL_299;
              }
            }
            else
            {
              if ((unsigned __int16)v11 == 2340)
              {
LABEL_310:
                LOWORD(v11) = 18;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 2360) {
                goto LABEL_346;
              }
            }
          }
          else if ((unsigned __int16)v11 > 0x8B9u)
          {
            if ((unsigned __int16)v11 == 2234)
            {
LABEL_287:
              LOWORD(v11) = 27;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2266) {
              goto LABEL_328;
            }
          }
          else
          {
            if ((unsigned __int16)v11 == 2160)
            {
LABEL_333:
              LOWORD(v11) = 21;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2224) {
              goto LABEL_327;
            }
          }
        }
        else if ((unsigned __int16)v11 > 0x1F5u)
        {
          if ((unsigned __int16)v11 > 0x2CFu)
          {
            if ((unsigned __int16)v11 > 0x6FFu)
            {
              if ((unsigned __int16)v11 == 1792) {
                goto LABEL_335;
              }
              if ((unsigned __int16)v11 == 1964)
              {
LABEL_302:
                LOWORD(v11) = 26;
                goto LABEL_21;
              }
            }
            else
            {
              if ((unsigned __int16)v11 == 720)
              {
LABEL_352:
                LOWORD(v11) = 6;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 1665)
              {
LABEL_262:
                LOWORD(v11) = 31;
                goto LABEL_21;
              }
            }
          }
          else if ((unsigned __int16)v11 > 0x238u)
          {
            if ((unsigned __int16)v11 == 569) {
              goto LABEL_326;
            }
            if ((unsigned __int16)v11 == 570) {
              goto LABEL_334;
            }
          }
          else
          {
            if ((unsigned __int16)v11 == 502)
            {
LABEL_248:
              LOWORD(v11) = 28;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 568) {
              goto LABEL_250;
            }
          }
        }
        else if ((unsigned __int16)v11 > 0x17Fu)
        {
          if ((unsigned __int16)v11 > 0x1ADu)
          {
            if ((unsigned __int16)v11 == 430) {
              goto LABEL_320;
            }
            if ((unsigned __int16)v11 == 484) {
              goto LABEL_296;
            }
          }
          else
          {
            if ((unsigned __int16)v11 == 384)
            {
LABEL_324:
              LOWORD(v11) = 9;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 390)
            {
LABEL_353:
              LOWORD(v11) = 14;
              goto LABEL_21;
            }
          }
        }
        else if ((unsigned __int16)v11 > 0x13Fu)
        {
          if ((unsigned __int16)v11 == 320) {
            goto LABEL_316;
          }
          if ((unsigned __int16)v11 == 340) {
            goto LABEL_340;
          }
        }
        else
        {
          if (!(_WORD)v11) {
            goto LABEL_21;
          }
          if ((unsigned __int16)v11 == 163) {
            goto LABEL_267;
          }
        }
        _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", v12, v13, v14, v15, v16, v17, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
        LOWORD(v11) = -1;
        goto LABEL_21;
      }
      if ((_WORD)v11)
      {
        switch(platform)
        {
          case 0uLL:
            if ((unsigned __int16)v11 <= 0x7ABu)
            {
              if ((unsigned __int16)v11 == 1665) {
                goto LABEL_262;
              }
              if ((unsigned __int16)v11 != 1864) {
                goto LABEL_270;
              }
              goto LABEL_250;
            }
            if ((unsigned __int16)v11 == 1964) {
              goto LABEL_302;
            }
            if ((unsigned __int16)v11 != 2234) {
              goto LABEL_270;
            }
            goto LABEL_287;
          case 3uLL:
            if ((unsigned __int16)v11 == 3840) {
              goto LABEL_345;
            }
            if ((unsigned __int16)v11 == 1088) {
              goto LABEL_267;
            }
            if ((unsigned __int16)v11 != 720) {
              goto LABEL_270;
            }
            goto LABEL_352;
          case 4uLL:
            if ((unsigned __int16)v11 > 0x1ADu)
            {
              if ((unsigned __int16)v11 > 0x1E3u)
              {
                if ((unsigned __int16)v11 != 484)
                {
                  if ((unsigned __int16)v11 != 496)
                  {
                    if ((unsigned __int16)v11 != 502) {
                      goto LABEL_270;
                    }
                    goto LABEL_248;
                  }
LABEL_315:
                  LOWORD(v11) = 30;
                  goto LABEL_21;
                }
LABEL_296:
                LOWORD(v11) = 24;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 != 430)
              {
                if ((unsigned __int16)v11 != 446) {
                  goto LABEL_270;
                }
                goto LABEL_319;
              }
LABEL_320:
              LOWORD(v11) = 23;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0x17Fu)
            {
              if ((unsigned __int16)v11 != 320)
              {
                if ((unsigned __int16)v11 != 340) {
                  goto LABEL_270;
                }
LABEL_340:
                LOWORD(v11) = 13;
                goto LABEL_21;
              }
LABEL_316:
              LOWORD(v11) = 8;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 384) {
              goto LABEL_324;
            }
            if ((unsigned __int16)v11 != 390) {
LABEL_270:
            }
              -[CUINamedRenditionInfo decrementValue:forAttribute:]((uint64_t)v11, platform);
            goto LABEL_353;
          case 5uLL:
            if ((unsigned __int16)v11 == 3648) {
              goto LABEL_250;
            }
            goto LABEL_270;
          default:
            if (platform > 2) {
              goto LABEL_270;
            }
            if ((unsigned __int16)v11 <= 0x983u)
            {
              if ((unsigned __int16)v11 <= 0x8AFu)
              {
                if ((unsigned __int16)v11 <= 0x239u)
                {
                  if ((unsigned __int16)v11 != 163)
                  {
                    if ((unsigned __int16)v11 != 568)
                    {
                      if ((unsigned __int16)v11 != 569) {
                        goto LABEL_270;
                      }
LABEL_326:
                      LOWORD(v11) = 2;
                      goto LABEL_21;
                    }
LABEL_250:
                    LOWORD(v11) = 1;
                    goto LABEL_21;
                  }
LABEL_267:
                  LOWORD(v11) = 5;
                  goto LABEL_21;
                }
                if ((unsigned __int16)v11 != 570)
                {
                  if ((unsigned __int16)v11 != 1792)
                  {
                    if ((unsigned __int16)v11 != 2160) {
                      goto LABEL_270;
                    }
                    goto LABEL_333;
                  }
LABEL_335:
                  LOWORD(v11) = 16;
                  goto LABEL_21;
                }
LABEL_334:
                LOWORD(v11) = 3;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 <= 0x937u)
              {
                if ((unsigned __int16)v11 != 2224)
                {
                  if ((unsigned __int16)v11 != 2266)
                  {
                    if ((unsigned __int16)v11 != 2340) {
                      goto LABEL_270;
                    }
                    goto LABEL_310;
                  }
LABEL_328:
                  LOWORD(v11) = 25;
                  goto LABEL_21;
                }
LABEL_327:
                LOWORD(v11) = 10;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 != 2360)
              {
                if ((unsigned __int16)v11 != 2388)
                {
                  if ((unsigned __int16)v11 != 2420) {
                    goto LABEL_270;
                  }
                  goto LABEL_345;
                }
LABEL_347:
                LOWORD(v11) = 15;
                goto LABEL_21;
              }
LABEL_346:
              LOWORD(v11) = 20;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0xABFu)
            {
              if ((unsigned __int16)v11 <= 0xA3Du)
              {
                if ((unsigned __int16)v11 != 2436)
                {
                  if ((unsigned __int16)v11 != 2532)
                  {
                    if ((unsigned __int16)v11 != 2556) {
                      goto LABEL_270;
                    }
LABEL_319:
                    LOWORD(v11) = 29;
                    goto LABEL_21;
                  }
LABEL_325:
                  LOWORD(v11) = 22;
                  goto LABEL_21;
                }
LABEL_299:
                LOWORD(v11) = 11;
                goto LABEL_21;
              }
              if ((unsigned __int16)v11 == 2622) {
                goto LABEL_340;
              }
              if ((unsigned __int16)v11 != 2688)
              {
                if ((unsigned __int16)v11 != 2732) {
                  goto LABEL_270;
                }
                goto LABEL_339;
              }
LABEL_341:
              LOWORD(v11) = 12;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 <= 0xB33u)
            {
              if ((unsigned __int16)v11 == 2752) {
                goto LABEL_316;
              }
              if ((unsigned __int16)v11 != 2778)
              {
                if ((unsigned __int16)v11 != 2796) {
                  goto LABEL_270;
                }
                goto LABEL_315;
              }
LABEL_329:
              LOWORD(v11) = 19;
              goto LABEL_21;
            }
            if ((unsigned __int16)v11 == 2868) {
              goto LABEL_353;
            }
            if ((unsigned __int16)v11 == 3024) {
              goto LABEL_352;
            }
            if ((unsigned __int16)v11 != 32401) {
              goto LABEL_270;
            }
            break;
        }
LABEL_351:
        LOWORD(v11) = 17;
        goto LABEL_21;
      }
      LOWORD(v11) = 0;
    }
  }
LABEL_21:
  unsigned int v22 = keyFormat->var2;
  if (v22)
  {
    uint64_t v23 = 0;
    unsigned int v24 = (unsigned __int16)v11;
    while (keyFormat->var3[v23] != v5)
    {
      ++v23;
      v24 += 32;
      if (v22 == v23) {
        return;
      }
    }
    if ((int)v23 > 32)
    {
LABEL_27:
      _CUILog(4, (uint64_t)"CoreUI: attribute %d > 32 bits its value is %d **************************************************", v12, v13, v14, v15, v16, v17, v5);
      return;
    }
    if ((v24 & 0x80000000) == 0 && *a3 < (unint64_t)(v9 - 1))
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v24)) {
          return;
        }
        ++*a3;
        unint64_t v25 = self->_platform;
        id v26 = objc_msgSend(objc_msgSend(a4, "objectAtIndex:"), "integerValue");
        unsigned int v27 = self->_keyFormat;
        if (v5 == 16 && v25 == -1)
        {
          uint64_t v28 = v27->var2;
          if (!v28) {
            return;
          }
          unsigned int v29 = v27->var3;
          while (1)
          {
            int v30 = *v29++;
            if (v30 == 16) {
              break;
            }
            if (!--v28) {
              return;
            }
          }
        }
        if (v5 <= 0x1C)
        {
          if (v5 == 13)
          {
            LOWORD(v26) = (unsigned __int16)v26 != 0;
            goto LABEL_198;
          }
          if (v5 == 16)
          {
            if (v25 != -1)
            {
              if (!(_WORD)v26)
              {
                LOWORD(v26) = 0;
                goto LABEL_198;
              }
              switch(v25)
              {
                case 0uLL:
                  if ((unsigned __int16)v26 <= 0x7ABu)
                  {
                    if ((unsigned __int16)v26 == 1665) {
                      goto LABEL_106;
                    }
                    if ((unsigned __int16)v26 != 1864) {
                      goto LABEL_354;
                    }
                    goto LABEL_94;
                  }
                  if ((unsigned __int16)v26 == 1964) {
                    goto LABEL_146;
                  }
                  if ((unsigned __int16)v26 != 2234) {
                    goto LABEL_354;
                  }
                  goto LABEL_131;
                case 3uLL:
                  if ((unsigned __int16)v26 == 3840) {
                    goto LABEL_189;
                  }
                  if ((unsigned __int16)v26 == 1088) {
                    goto LABEL_111;
                  }
                  if ((unsigned __int16)v26 != 720) {
                    goto LABEL_354;
                  }
                  break;
                case 4uLL:
                  if ((unsigned __int16)v26 <= 0x1ADu)
                  {
                    if ((unsigned __int16)v26 <= 0x17Fu)
                    {
                      if ((unsigned __int16)v26 == 320) {
                        goto LABEL_160;
                      }
                      if ((unsigned __int16)v26 != 340) {
                        goto LABEL_354;
                      }
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v26 == 384) {
                      goto LABEL_168;
                    }
                    if ((unsigned __int16)v26 != 390) {
                      goto LABEL_354;
                    }
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v26 <= 0x1E3u)
                  {
                    if ((unsigned __int16)v26 == 430) {
                      goto LABEL_164;
                    }
                    if ((unsigned __int16)v26 != 446) {
                      goto LABEL_354;
                    }
                    goto LABEL_163;
                  }
                  if ((unsigned __int16)v26 == 484) {
                    goto LABEL_140;
                  }
                  if ((unsigned __int16)v26 != 496)
                  {
                    if ((unsigned __int16)v26 != 502) {
                      goto LABEL_354;
                    }
                    goto LABEL_92;
                  }
                  goto LABEL_159;
                case 5uLL:
                  if ((unsigned __int16)v26 == 3648) {
                    goto LABEL_94;
                  }
                  goto LABEL_354;
                default:
                  if (v25 > 2) {
                    goto LABEL_354;
                  }
                  if ((unsigned __int16)v26 <= 0x983u)
                  {
                    if ((unsigned __int16)v26 <= 0x8AFu)
                    {
                      if ((unsigned __int16)v26 <= 0x239u)
                      {
                        if ((unsigned __int16)v26 == 163) {
                          goto LABEL_111;
                        }
                        if ((unsigned __int16)v26 != 568)
                        {
                          if ((unsigned __int16)v26 != 569) {
                            goto LABEL_354;
                          }
                          goto LABEL_170;
                        }
                        goto LABEL_94;
                      }
                      if ((unsigned __int16)v26 == 570) {
                        goto LABEL_178;
                      }
                      if ((unsigned __int16)v26 != 1792)
                      {
                        if ((unsigned __int16)v26 != 2160) {
                          goto LABEL_354;
                        }
                        goto LABEL_177;
                      }
                      goto LABEL_179;
                    }
                    if ((unsigned __int16)v26 <= 0x937u)
                    {
                      if ((unsigned __int16)v26 == 2224) {
                        goto LABEL_171;
                      }
                      if ((unsigned __int16)v26 != 2266)
                      {
                        if ((unsigned __int16)v26 != 2340) {
                          goto LABEL_354;
                        }
                        goto LABEL_154;
                      }
                      goto LABEL_172;
                    }
                    if ((unsigned __int16)v26 == 2360) {
                      goto LABEL_190;
                    }
                    if ((unsigned __int16)v26 != 2388)
                    {
                      if ((unsigned __int16)v26 != 2420) {
                        goto LABEL_354;
                      }
                      goto LABEL_189;
                    }
                    goto LABEL_191;
                  }
                  if ((unsigned __int16)v26 <= 0xABFu)
                  {
                    if ((unsigned __int16)v26 <= 0xA3Du)
                    {
                      if ((unsigned __int16)v26 == 2436) {
                        goto LABEL_143;
                      }
                      if ((unsigned __int16)v26 != 2532)
                      {
                        if ((unsigned __int16)v26 != 2556) {
                          goto LABEL_354;
                        }
                        goto LABEL_163;
                      }
                      goto LABEL_169;
                    }
                    if ((unsigned __int16)v26 == 2622) {
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v26 != 2688)
                    {
                      if ((unsigned __int16)v26 != 2732) {
                        goto LABEL_354;
                      }
                      goto LABEL_183;
                    }
                    goto LABEL_185;
                  }
                  if ((unsigned __int16)v26 <= 0xB33u)
                  {
                    if ((unsigned __int16)v26 == 2752) {
                      goto LABEL_160;
                    }
                    if ((unsigned __int16)v26 != 2778)
                    {
                      if ((unsigned __int16)v26 != 2796) {
                        goto LABEL_354;
                      }
                      goto LABEL_159;
                    }
                    goto LABEL_173;
                  }
                  if ((unsigned __int16)v26 == 2868) {
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v26 != 3024)
                  {
                    if ((unsigned __int16)v26 != 32401) {
LABEL_354:
                    }
                      -[CUINamedRenditionInfo decrementValue:forAttribute:]((uint64_t)v26, v25);
                    goto LABEL_195;
                  }
                  return;
              }
LABEL_196:
              LOWORD(v26) = 6;
              goto LABEL_198;
            }
            if ((unsigned __int16)v26 > 0x86Fu)
            {
              if ((unsigned __int16)v26 > 0x9E3u)
              {
                if ((unsigned __int16)v26 > 0xAD9u)
                {
                  if ((unsigned __int16)v26 > 0xEFFu)
                  {
                    if ((unsigned __int16)v26 == 3840)
                    {
LABEL_189:
                      LOWORD(v26) = 7;
                    }
                    else
                    {
                      if ((unsigned __int16)v26 != 32401) {
                        goto LABEL_149;
                      }
LABEL_195:
                      LOWORD(v26) = 17;
                    }
                  }
                  else if ((unsigned __int16)v26 == 2778)
                  {
LABEL_173:
                    LOWORD(v26) = 19;
                  }
                  else
                  {
                    if ((unsigned __int16)v26 != 2796) {
                      goto LABEL_149;
                    }
LABEL_159:
                    LOWORD(v26) = 30;
                  }
                }
                else if ((unsigned __int16)v26 > 0xA7Fu)
                {
                  if ((unsigned __int16)v26 == 2688)
                  {
LABEL_185:
                    LOWORD(v26) = 12;
                  }
                  else
                  {
                    if ((unsigned __int16)v26 != 2732) {
                      goto LABEL_149;
                    }
LABEL_183:
                    LOWORD(v26) = 4;
                  }
                }
                else if ((unsigned __int16)v26 == 2532)
                {
LABEL_169:
                  LOWORD(v26) = 22;
                }
                else
                {
                  if ((unsigned __int16)v26 != 2556) {
                    goto LABEL_149;
                  }
LABEL_163:
                  LOWORD(v26) = 29;
                }
              }
              else if ((unsigned __int16)v26 > 0x923u)
              {
                if ((unsigned __int16)v26 > 0x953u)
                {
                  if ((unsigned __int16)v26 != 2388)
                  {
                    if ((unsigned __int16)v26 == 2436)
                    {
LABEL_143:
                      LOWORD(v26) = 11;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
LABEL_191:
                  LOWORD(v26) = 15;
                }
                else if ((unsigned __int16)v26 == 2340)
                {
LABEL_154:
                  LOWORD(v26) = 18;
                }
                else
                {
                  if ((unsigned __int16)v26 != 2360) {
                    goto LABEL_149;
                  }
LABEL_190:
                  LOWORD(v26) = 20;
                }
              }
              else if ((unsigned __int16)v26 > 0x8B9u)
              {
                if ((unsigned __int16)v26 == 2234)
                {
LABEL_131:
                  LOWORD(v26) = 27;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v26 != 2266) {
                  goto LABEL_149;
                }
LABEL_172:
                LOWORD(v26) = 25;
              }
              else if ((unsigned __int16)v26 == 2160)
              {
LABEL_177:
                LOWORD(v26) = 21;
              }
              else
              {
                if ((unsigned __int16)v26 != 2224) {
                  goto LABEL_149;
                }
LABEL_171:
                LOWORD(v26) = 10;
              }
            }
            else if ((unsigned __int16)v26 > 0x1F5u)
            {
              if ((unsigned __int16)v26 > 0x2CFu)
              {
                if ((unsigned __int16)v26 <= 0x6FFu)
                {
                  if ((unsigned __int16)v26 != 720)
                  {
                    if ((unsigned __int16)v26 == 1665)
                    {
LABEL_106:
                      LOWORD(v26) = 31;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
                  goto LABEL_196;
                }
                if ((unsigned __int16)v26 != 1792)
                {
                  if ((unsigned __int16)v26 == 1964)
                  {
LABEL_146:
                    LOWORD(v26) = 26;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_179:
                LOWORD(v26) = 16;
              }
              else
              {
                if ((unsigned __int16)v26 <= 0x238u)
                {
                  if ((unsigned __int16)v26 == 502)
                  {
LABEL_92:
                    LOWORD(v26) = 28;
                    goto LABEL_198;
                  }
                  if ((unsigned __int16)v26 == 568)
                  {
LABEL_94:
                    LOWORD(v26) = 1;
                    goto LABEL_198;
                  }
LABEL_149:
                  _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", v12, v13, v14, v15, v16, v17, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
                  LOWORD(v26) = -1;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v26 == 569)
                {
LABEL_170:
                  LOWORD(v26) = 2;
                }
                else
                {
                  if ((unsigned __int16)v26 != 570) {
                    goto LABEL_149;
                  }
LABEL_178:
                  LOWORD(v26) = 3;
                }
              }
            }
            else if ((unsigned __int16)v26 > 0x17Fu)
            {
              if ((unsigned __int16)v26 > 0x1ADu)
              {
                if ((unsigned __int16)v26 != 430)
                {
                  if ((unsigned __int16)v26 == 484)
                  {
LABEL_140:
                    LOWORD(v26) = 24;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_164:
                LOWORD(v26) = 23;
              }
              else if ((unsigned __int16)v26 == 384)
              {
LABEL_168:
                LOWORD(v26) = 9;
              }
              else
              {
                if ((unsigned __int16)v26 != 390) {
                  goto LABEL_149;
                }
LABEL_197:
                LOWORD(v26) = 14;
              }
            }
            else
            {
              if ((unsigned __int16)v26 <= 0x13Fu)
              {
                if (!(_WORD)v26) {
                  goto LABEL_198;
                }
                if ((unsigned __int16)v26 == 163)
                {
LABEL_111:
                  LOWORD(v26) = 5;
                  goto LABEL_198;
                }
                goto LABEL_149;
              }
              if ((unsigned __int16)v26 == 320)
              {
LABEL_160:
                LOWORD(v26) = 8;
              }
              else
              {
                if ((unsigned __int16)v26 != 340) {
                  goto LABEL_149;
                }
LABEL_184:
                LOWORD(v26) = 13;
              }
            }
          }
          else if (((1 << v5) & 0x100600E6) != 0)
          {
            return;
          }
        }
LABEL_198:
        unsigned int v31 = v27->var2;
        if (!v31) {
          return;
        }
        uint64_t v32 = 0;
        unsigned int v24 = (unsigned __int16)v26;
        while (v27->var3[v32] != v5)
        {
          v24 += 32;
          if (v31 == ++v32) {
            return;
          }
        }
        if ((int)v32 > 32) {
          goto LABEL_27;
        }
      }
      while (*a3 < (unint64_t)(v9 - 1) && (v24 & 0x80000000) == 0);
    }
  }
}

+ (int)subtypeToIndexWithPlatform:(int64_t)a3 andInput:(unsigned __int16)a4
{
  if (a3 == -1)
  {
    if ((int)a4 > 2159)
    {
      if ((int)a4 > 2531)
      {
        if ((int)a4 > 2777)
        {
          if ((int)a4 > 3839)
          {
            if (a4 == 3840)
            {
LABEL_145:
              *(_DWORD *)&a4 = 7;
              return a4;
            }
            if (a4 == 32401) {
              goto LABEL_151;
            }
          }
          else
          {
            if (a4 == 2778) {
              goto LABEL_129;
            }
            if (a4 == 2796) {
              goto LABEL_115;
            }
          }
        }
        else if ((int)a4 > 2687)
        {
          if (a4 == 2688) {
            goto LABEL_141;
          }
          if (a4 == 2732)
          {
LABEL_139:
            *(_DWORD *)&a4 = 4;
            return a4;
          }
        }
        else
        {
          if (a4 == 2532) {
            goto LABEL_125;
          }
          if (a4 == 2556) {
            goto LABEL_119;
          }
        }
      }
      else if ((int)a4 > 2339)
      {
        if ((int)a4 > 2387)
        {
          if (a4 == 2388) {
            goto LABEL_147;
          }
          if (a4 == 2436) {
            goto LABEL_99;
          }
        }
        else
        {
          if (a4 == 2340)
          {
LABEL_110:
            *(_DWORD *)&a4 = 18;
            return a4;
          }
          if (a4 == 2360) {
            goto LABEL_146;
          }
        }
      }
      else if ((int)a4 > 2233)
      {
        if (a4 == 2234)
        {
LABEL_87:
          *(_DWORD *)&a4 = 27;
          return a4;
        }
        if (a4 == 2266) {
          goto LABEL_128;
        }
      }
      else
      {
        if (a4 == 2160)
        {
LABEL_133:
          *(_DWORD *)&a4 = 21;
          return a4;
        }
        if (a4 == 2224) {
          goto LABEL_127;
        }
      }
    }
    else if ((int)a4 > 501)
    {
      if ((int)a4 > 719)
      {
        if ((int)a4 > 1791)
        {
          if (a4 == 1792) {
            goto LABEL_135;
          }
          if (a4 == 1964)
          {
LABEL_102:
            *(_DWORD *)&a4 = 26;
            return a4;
          }
        }
        else
        {
          if (a4 == 720)
          {
LABEL_152:
            *(_DWORD *)&a4 = 6;
            return a4;
          }
          if (a4 == 1665) {
            goto LABEL_62;
          }
        }
      }
      else if ((int)a4 > 568)
      {
        if (a4 == 569) {
          goto LABEL_126;
        }
        if (a4 == 570) {
          goto LABEL_134;
        }
      }
      else
      {
        if (a4 == 502)
        {
LABEL_48:
          *(_DWORD *)&a4 = 28;
          return a4;
        }
        if (a4 == 568) {
          goto LABEL_50;
        }
      }
    }
    else if ((int)a4 > 383)
    {
      if ((int)a4 > 429)
      {
        if (a4 == 430) {
          goto LABEL_120;
        }
        if (a4 == 484) {
          goto LABEL_96;
        }
      }
      else
      {
        if (a4 == 384)
        {
LABEL_124:
          *(_DWORD *)&a4 = 9;
          return a4;
        }
        if (a4 == 390)
        {
LABEL_153:
          *(_DWORD *)&a4 = 14;
          return a4;
        }
      }
    }
    else if ((int)a4 > 319)
    {
      if (a4 == 320) {
        goto LABEL_116;
      }
      if (a4 == 340) {
        goto LABEL_140;
      }
    }
    else
    {
      if (!a4) {
        return a4;
      }
      if (a4 == 163) {
        goto LABEL_67;
      }
    }
    _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype that it doesn't know about %d in unknown platform", -1, a4, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
    *(_DWORD *)&a4 = -1;
    return a4;
  }
  if (a4)
  {
    switch(a3)
    {
      case 0:
        if ((int)a4 <= 1963)
        {
          if (a4 != 1665)
          {
            if (a4 != 1864) {
              goto LABEL_155;
            }
            goto LABEL_50;
          }
LABEL_62:
          *(_DWORD *)&a4 = 31;
          return a4;
        }
        if (a4 == 1964) {
          goto LABEL_102;
        }
        if (a4 != 2234) {
          goto LABEL_155;
        }
        goto LABEL_87;
      case 3:
        if (a4 == 3840) {
          goto LABEL_145;
        }
        if (a4 == 1088) {
          goto LABEL_67;
        }
        if (a4 != 720) {
          goto LABEL_155;
        }
        goto LABEL_152;
      case 4:
        if ((int)a4 > 429)
        {
          if ((int)a4 > 483)
          {
            if (a4 != 484)
            {
              if (a4 != 496)
              {
                if (a4 != 502) {
                  goto LABEL_155;
                }
                goto LABEL_48;
              }
LABEL_115:
              *(_DWORD *)&a4 = 30;
              return a4;
            }
LABEL_96:
            *(_DWORD *)&a4 = 24;
            return a4;
          }
          if (a4 != 430)
          {
            if (a4 != 446) {
              goto LABEL_155;
            }
            goto LABEL_119;
          }
LABEL_120:
          *(_DWORD *)&a4 = 23;
          return a4;
        }
        if ((int)a4 <= 383)
        {
          if (a4 != 320)
          {
            if (a4 != 340) {
              goto LABEL_155;
            }
LABEL_140:
            *(_DWORD *)&a4 = 13;
            return a4;
          }
LABEL_116:
          *(_DWORD *)&a4 = 8;
          return a4;
        }
        if (a4 == 384) {
          goto LABEL_124;
        }
        if (a4 != 390) {
LABEL_155:
        }
          -[CUINamedRenditionInfo attributePresent:withValue:](a4, a3);
        goto LABEL_153;
      case 5:
        if (a4 == 3648) {
          goto LABEL_50;
        }
        goto LABEL_155;
      default:
        if ((unint64_t)a3 > 2) {
          goto LABEL_155;
        }
        if ((int)a4 <= 2435)
        {
          if ((int)a4 <= 2223)
          {
            if ((int)a4 <= 569)
            {
              if (a4 != 163)
              {
                if (a4 != 568)
                {
                  if (a4 != 569) {
                    goto LABEL_155;
                  }
LABEL_126:
                  *(_DWORD *)&a4 = 2;
                  return a4;
                }
LABEL_50:
                *(_DWORD *)&a4 = 1;
                return a4;
              }
LABEL_67:
              *(_DWORD *)&a4 = 5;
              return a4;
            }
            if (a4 != 570)
            {
              if (a4 != 1792)
              {
                if (a4 != 2160) {
                  goto LABEL_155;
                }
                goto LABEL_133;
              }
LABEL_135:
              *(_DWORD *)&a4 = 16;
              return a4;
            }
LABEL_134:
            *(_DWORD *)&a4 = 3;
            return a4;
          }
          if ((int)a4 <= 2359)
          {
            if (a4 != 2224)
            {
              if (a4 != 2266)
              {
                if (a4 != 2340) {
                  goto LABEL_155;
                }
                goto LABEL_110;
              }
LABEL_128:
              *(_DWORD *)&a4 = 25;
              return a4;
            }
LABEL_127:
            *(_DWORD *)&a4 = 10;
            return a4;
          }
          if (a4 != 2360)
          {
            if (a4 != 2388)
            {
              if (a4 != 2420) {
                goto LABEL_155;
              }
              goto LABEL_145;
            }
LABEL_147:
            *(_DWORD *)&a4 = 15;
            return a4;
          }
LABEL_146:
          *(_DWORD *)&a4 = 20;
          return a4;
        }
        if ((int)a4 <= 2751)
        {
          if ((int)a4 <= 2621)
          {
            if (a4 != 2436)
            {
              if (a4 != 2532)
              {
                if (a4 != 2556) {
                  goto LABEL_155;
                }
LABEL_119:
                *(_DWORD *)&a4 = 29;
                return a4;
              }
LABEL_125:
              *(_DWORD *)&a4 = 22;
              return a4;
            }
LABEL_99:
            *(_DWORD *)&a4 = 11;
            return a4;
          }
          if (a4 == 2622) {
            goto LABEL_140;
          }
          if (a4 != 2688)
          {
            if (a4 != 2732) {
              goto LABEL_155;
            }
            goto LABEL_139;
          }
LABEL_141:
          *(_DWORD *)&a4 = 12;
          return a4;
        }
        if ((int)a4 <= 2867)
        {
          if (a4 == 2752) {
            goto LABEL_116;
          }
          if (a4 != 2778)
          {
            if (a4 != 2796) {
              goto LABEL_155;
            }
            goto LABEL_115;
          }
LABEL_129:
          *(_DWORD *)&a4 = 19;
          return a4;
        }
        if (a4 == 2868) {
          goto LABEL_153;
        }
        if (a4 == 3024) {
          goto LABEL_152;
        }
        if (a4 != 32401) {
          goto LABEL_155;
        }
        break;
    }
LABEL_151:
    *(_DWORD *)&a4 = 17;
  }
  return a4;
}

+ (int)subtypeFromIndexWithPlatform:(int64_t)a3 andIndex:(unsigned __int16)a4
{
  return __CUISubtypeFromIndex(a3, a4);
}

- (void)initWithKeyFormat:(uint64_t)a3 andPlatform:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)attributePresent:(uint64_t)a1 withValue:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype %d is unknown for the platform %d:'%@'", v2, v3, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

- (void)decrementValue:(uint64_t)a1 forAttribute:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  _CUILog(4, (uint64_t)"CoreUI: %s got a device subtype %d is unknown for the platform %d:'%@'", v2, v3, v4, v5, v6, v7, (uint64_t)"int __CUISubtypeToIndex(CUIThemeSchemaPlatform, CUIRenditionKeyUInteger)");
  abort();
}

@end