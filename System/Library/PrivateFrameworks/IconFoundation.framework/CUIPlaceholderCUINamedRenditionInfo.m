@interface CUIPlaceholderCUINamedRenditionInfo
+ (int)subtypeFromIndexWithPlatform:(int64_t)a3 andIndex:(unsigned __int16)a4;
+ (int)subtypeToIndexWithPlatform:(int64_t)a3 andInput:(unsigned __int16)a4;
- (BOOL)containsVectorGlyphInterpolationSources;
- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- (BOOL)contentEqualForAttribute:(int)a3 withRenditionInfo:(id)a4;
- (BOOL)contentPresentForAttribute:(int)a3;
- (BOOL)diverseContentPresentForAttribute:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedRenditionInfo:(id)a3;
- (CUIPlaceholderCUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5;
- (CUIPlaceholderCUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4;
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
- (void)_initWithKeyFormat:(uint64_t)a3 bitmap:(uint64_t)a4 andPlatform:;
- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4;
- (void)dealloc;
- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4;
- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5;
- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4;
@end

@implementation CUIPlaceholderCUINamedRenditionInfo

- (CUIPlaceholderCUINamedRenditionInfo)initWithData:(id)a3 keyFormat:(const _renditionkeyfmt *)a4 andPlatform:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  v8 = [(CUIPlaceholderCUINamedRenditionInfo *)&v11 init];
  v8->_keyFormat = a4;
  v8->_platform = a5;
  v9 = (_DWORD *)[a3 bytes];
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

- (CUIPlaceholderCUINamedRenditionInfo)initWithKeyFormat:(const _renditionkeyfmt *)a3 andPlatform:(int64_t)a4
{
  v18.receiver = self;
  v18.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  id v6 = [(CUIPlaceholderCUINamedRenditionInfo *)&v18 init];
  *((void *)v6 + 1) = CUIBitVectorCreate(32 * a3->var2);
  *((void *)v6 + 2) = a3;
  *((void *)v6 + 3) = a4;
  unsigned int var2 = a3->var2;
  if (var2)
  {
    for (unint64_t i = 0; i < var2; ++i)
    {
      unsigned int v9 = a3->var3[i];
      if (*((void *)v6 + 3) == -1 && v9 == 16)
      {
        if (var2 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = var2;
        }
        var3 = a3->var3;
        while (1)
        {
          int v16 = *var3++;
          if (v16 == 16) {
            break;
          }
          if (!--v14) {
            goto LABEL_23;
          }
        }
      }
      if (v9 > 0x1C || ((1 << v9) & 0x100600E6) == 0)
      {
        uint64_t v12 = 0;
        int v13 = var2;
        if (var2 <= 1uLL) {
          int v13 = 1;
        }
        while (a3->var3[v12] != v9)
        {
          if (v13 == ++v12) {
            goto LABEL_23;
          }
        }
        if ((int)v12 < 33) {
          continue;
        }
        _CUILog();
      }
LABEL_23:
      if ((CUIBitVectorSetBitRange(*((os_unfair_lock_s **)v6 + 1), 32 * (int)i, 32 * (int)i + 32) & 0x80000000) != 0) {
        -[CUIPlaceholderCUINamedRenditionInfo initWithKeyFormat:andPlatform:]();
      }
      unsigned int var2 = a3->var2;
    }
  }
  return (CUIPlaceholderCUINamedRenditionInfo *)v6;
}

- (void)_initWithKeyFormat:(uint64_t)a3 bitmap:(uint64_t)a4 andPlatform:
{
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    result = objc_msgSendSuper2(&v7, sel_init);
    result[1] = a3;
    result[2] = a2;
    result[3] = a4;
  }
  return result;
}

- (void)dealloc
{
  CUIBitVectorDestroy((os_unfair_lock_s *)self->_bitmap);
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
  [(CUIPlaceholderCUINamedRenditionInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = CUIBitVectorCopy((unsigned int *)self->_bitmap);
  id result = +[CUIPlaceholderCUINamedRenditionInfo allocWithZone:a3];
  if (result)
  {
    keyFormat = self->_keyFormat;
    int64_t platform = self->_platform;
    v9.receiver = result;
    v9.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    id result = [(CUIPlaceholderCUINamedRenditionInfo *)&v9 init];
    *((void *)result + 1) = v5;
    *((void *)result + 2) = keyFormat;
    *((void *)result + 3) = platform;
  }
  return result;
}

- (id)archivedData
{
  size_t v5 = 0;
  v2 = CUIBitVectorToData((os_unfair_lock_s *)self->_bitmap, &v5);
  uint64_t v6 = 1;
  int v7 = v5;
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA58] data];
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
        int v8 = -[CUIPlaceholderCUINamedRenditionInfo contentPresentForAttribute:](self, "contentPresentForAttribute:");
        if (v8 != [a3 contentPresentForAttribute:*(unsigned int *)(*((void *)a3 + 2) + 4 * v7 + 12)])break; {
        int v9 = [(CUIPlaceholderCUINamedRenditionInfo *)self diverseContentPresentForAttribute:self->_keyFormat->var3[v7]];
        }
        if (v9 != [a3 diverseContentPresentForAttribute:*(unsigned int *)(*((void *)a3 + 2) + 4 * v7 + 12)])break; {
        if ([(CUIPlaceholderCUINamedRenditionInfo *)self contentPresentForAttribute:self->_keyFormat->var3[v7]])
        }
        {
          v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
          objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
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
                objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17));
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
                objc_msgSend(v11, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v24));
              }
              uint64_t v23 = (v23 + 1);
            }
            while (v23 != 32);
          }
          int v26 = [v10 isEqualToArray:v11];

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

  return [(CUIPlaceholderCUINamedRenditionInfo *)self isEqualToNamedRenditionInfo:a3];
}

- (id)description
{
  objc_super v3 = CUIBitVectorToString((os_unfair_lock_s *)self->_bitmap);
  v4 = NSString;
  size_t v5 = (objc_class *)objc_opt_class();
  unsigned int v6 = (void *)[v4 stringWithFormat:@"<%@: %p %s>", NSStringFromClass(v5), self, v3];
  free(v3);
  return v6;
}

- (id)debugDescription
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  bzero(__str, 0x800uLL);
  keyFormat = self->_keyFormat;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  objc_msgSend(v4, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", "| Index |            Attribute             | Is Content Present | Is Diverse Content Present |            Values          |"));
  unsigned int v21 = v4;
  objc_msgSend(v4, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", "|-------|----------------------------------|--------------------|----------------------------|----------------------------|"));
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
      BOOL v8 = [(CUIPlaceholderCUINamedRenditionInfo *)self contentPresentForAttribute:v7];
      BOOL v9 = [(CUIPlaceholderCUINamedRenditionInfo *)self diverseContentPresentForAttribute:v7];
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
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
            objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16));
          }
          uint64_t v15 = (v15 + 1);
        }
        while (v15 != 32);
      }
      snprintf(__str, 0x800uLL, "| %-5d | %-32s | %-18d | %-26d | %-26s |", v5, v22, v8, v9, (const char *)objc_msgSend((id)objc_msgSend(v10, "componentsJoinedByString:", @","), "UTF8String"));
      objc_msgSend(v21, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", __str));

      ++v5;
      keyFormat = v20;
    }
    while (v5 < v20->var2);
  }
  int v18 = (void *)[v21 componentsJoinedByString:@"\n"];

  return v18;
}

- (id)bitwiseAndWith:(id)a3
{
  v4 = CUIBitVectorBitAnd((os_unfair_lock_s *)self->_bitmap, *((os_unfair_lock_s **)a3 + 1));
  unint64_t v5 = [CUIPlaceholderCUINamedRenditionInfo alloc];
  if (v5)
  {
    keyFormat = self->_keyFormat;
    int64_t platform = self->_platform;
    v9.receiver = v5;
    v9.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    unint64_t v5 = [(CUIPlaceholderCUINamedRenditionInfo *)&v9 init];
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
  v10 = v9;
  objc_super v11 = [CUIPlaceholderCUINamedRenditionInfo alloc];
  if (v11)
  {
    unsigned int v13 = self->_keyFormat;
    int64_t platform = self->_platform;
    v15.receiver = v11;
    v15.super_class = (Class)CUIPlaceholderCUINamedRenditionInfo;
    objc_super v11 = [(CUIPlaceholderCUINamedRenditionInfo *)&v15 init];
    v11->_bitmap = v10;
    v11->_keyFormat = v13;
    v11->_int64_t platform = platform;
  }
  return v11;
}

- (int)attributePresent:(int)a3 withValue:(unsigned __int16)a4
{
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
      int v10 = *var3++;
      if (v10 == 16) {
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
      *(_DWORD *)&a4 = a4 != 0;
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
              *(_DWORD *)&a4 = 24;
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
            *(_DWORD *)&a4 = 8;
            goto LABEL_21;
          }
          if (a4 == 384) {
            goto LABEL_148;
          }
          if (a4 != 390) {
LABEL_178:
          }
            -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](a4, platform);
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
                  *(_DWORD *)&a4 = 1;
                  goto LABEL_21;
                }
LABEL_91:
                *(_DWORD *)&a4 = 5;
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
                *(_DWORD *)&a4 = 16;
                goto LABEL_21;
              }
LABEL_158:
              *(_DWORD *)&a4 = 3;
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
                *(_DWORD *)&a4 = 25;
                goto LABEL_21;
              }
LABEL_151:
              *(_DWORD *)&a4 = 10;
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
            *(_DWORD *)&a4 = 20;
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
                  *(_DWORD *)&a4 = 29;
                  goto LABEL_21;
                }
LABEL_149:
                *(_DWORD *)&a4 = 22;
                goto LABEL_21;
              }
LABEL_123:
              *(_DWORD *)&a4 = 11;
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
              *(_DWORD *)&a4 = 12;
              goto LABEL_21;
            }
LABEL_164:
            *(_DWORD *)&a4 = 13;
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
            *(_DWORD *)&a4 = 19;
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
              *(_DWORD *)&a4 = 7;
              goto LABEL_21;
            }
            if (a4 == 32401)
            {
LABEL_175:
              *(_DWORD *)&a4 = 17;
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
              *(_DWORD *)&a4 = 30;
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
            *(_DWORD *)&a4 = 4;
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
            *(_DWORD *)&a4 = 15;
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
            *(_DWORD *)&a4 = 18;
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
          *(_DWORD *)&a4 = 27;
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
          *(_DWORD *)&a4 = 21;
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
            *(_DWORD *)&a4 = 2;
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
            *(_DWORD *)&a4 = 28;
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
          *(_DWORD *)&a4 = 26;
          goto LABEL_21;
        }
        goto LABEL_129;
      }
      if (a4 != 720)
      {
        if (a4 == 1665)
        {
LABEL_86:
          *(_DWORD *)&a4 = 31;
          goto LABEL_21;
        }
        goto LABEL_129;
      }
LABEL_176:
      *(_DWORD *)&a4 = 6;
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
          *(_DWORD *)&a4 = 23;
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
        *(_DWORD *)&a4 = 9;
        goto LABEL_21;
      }
      if (a4 != 390)
      {
LABEL_129:
        _CUILog();
        *(_DWORD *)&a4 = 0xFFFF;
        goto LABEL_21;
      }
LABEL_177:
      *(_DWORD *)&a4 = 14;
    }
  }
LABEL_21:
  unsigned int v12 = keyFormat->var2;
  if (!v12) {
    return -1;
  }
  uint64_t v13 = 0;
  unsigned int v14 = a4;
  while (keyFormat->var3[v13] != a3)
  {
    ++v13;
    v14 += 32;
    if (v12 == v13) {
      return -1;
    }
  }
  if ((int)v13 >= 33)
  {
    _CUILog();
    return -1;
  }
  if ((v14 & 0x80000000) != 0) {
    return -1;
  }
  bitmap = (os_unfair_lock_s *)self->_bitmap;

  return CUIBitVectorIsBitSet(bitmap, v14);
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
      int v8 = *var3++;
      if (v8 == 16) {
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
  unsigned int v10 = keyFormat->var2;
  if (!v10) {
    goto LABEL_10;
  }
  unsigned int v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = keyFormat->var3;
  while (v13[v12] != a3)
  {
    unsigned __int16 result = 0;
    ++v12;
    v11 += 32;
    if (v10 == v12) {
      goto LABEL_11;
    }
  }
  if ((int)v12 >= 33)
  {
    _CUILog();
LABEL_10:
    unsigned __int16 result = 0;
    goto LABEL_11;
  }
  if ((v12 & 0x80000000) != 0) {
    goto LABEL_10;
  }
  unsigned int v14 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v11);
  int v15 = 0;
  while (((v14 >> v15) & 1) == 0)
  {
    unsigned __int16 result = 0;
    if (++v15 == 32) {
      goto LABEL_11;
    }
  }
  unsigned __int16 result = v15;
LABEL_11:
  if (a3 == 16) {
    return __CUISubtypeFromIndex(self->_platform, result);
  }
  return result;
}

- (unsigned)getClosestValueOfAttribute:(int)a3 withValue:(unsigned __int16)a4
{
  int v4 = a4;
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
      int v8 = *var3++;
      if (v8 == 16) {
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
  unsigned int v11 = keyFormat->var2;
  if (!v11) {
    return 0;
  }
  unsigned int v12 = 0;
  uint64_t v13 = 0;
  unsigned int v14 = keyFormat->var3;
  while (v14[v13] != a3)
  {
    unsigned __int16 v9 = 0;
    ++v13;
    v12 += 32;
    if (v11 == v13) {
      return v9;
    }
  }
  if ((int)v13 >= 33)
  {
    _CUILog();
    return 0;
  }
  if ((v13 & 0x80000000) != 0) {
    return 0;
  }
  unsigned int v15 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v12);
  while (((v15 >> v4) & 1) == 0)
  {
    unsigned __int16 v9 = 0;
    BOOL v16 = __OFSUB__(v4--, 1);
    if (v4 < 0 != v16) {
      return v9;
    }
  }
  return v4;
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
      int v6 = *var3++;
      if (v6 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    unsigned int v7 = keyFormat->var2;
    if (v7)
    {
      unsigned int v8 = 0;
      uint64_t v9 = 0;
      unsigned int v10 = keyFormat->var3;
      while (v10[v9] != a3)
      {
        ++v9;
        v8 += 32;
        if (v7 == v9) {
          return 0;
        }
      }
      if ((int)v9 < 33)
      {
        if ((v9 & 0x80000000) == 0 && (int)CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v8) > 0) {
          return 1;
        }
      }
      else
      {
        _CUILog();
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
      int v8 = *var3++;
      if (v8 == 16) {
        break;
      }
      if (!--var2) {
        return 0;
      }
    }
  }
  if ((a3 - 1) >= 0x1C || ((0x8030073u >> (a3 - 1)) & 1) == 0)
  {
    unsigned int v9 = keyFormat->var2;
    if (v9)
    {
      unsigned int v10 = 0;
      uint64_t v11 = 0;
      unsigned int v12 = keyFormat->var3;
      while (v12[v11] != a3)
      {
        ++v11;
        v10 += 32;
        if (v9 == v11) {
          return 0;
        }
      }
      if ((int)v11 < 33)
      {
        if ((v11 & 0x80000000) == 0)
        {
          int v13 = CUIBitVectorBucketValue((os_unfair_lock_s *)self->_bitmap, v10);
          return v13 == CUIBitVectorBucketValue(*((os_unfair_lock_s **)a4 + 1), v10);
        }
      }
      else
      {
        _CUILog();
      }
    }
  }
  return 0;
}

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
      int v7 = *var3++;
      if (v7 == 16) {
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
  unsigned int v8 = keyFormat->var2;
  if (!v8) {
    return 0;
  }
  unsigned int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = keyFormat->var3;
  while (v11[v10] != a3)
  {
    ++v10;
    v9 += 32;
    if (v8 == v10) {
      return 0;
    }
  }
  if ((int)v10 >= 33)
  {
    _CUILog();
    return 0;
  }
  return (v10 & 0x80000000) == 0
      && (CUIBitVectorNumberOfBitsSetInBucket((uint64_t)self->_bitmap, v9) != 1
       || CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v9) != 1);
}

- (void)setAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
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
      int v10 = *var3++;
      if (v10 == 16) {
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
    *(_DWORD *)&a4 = a4 != 0;
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
            *(_DWORD *)&a4 = 24;
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
          *(_DWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384) {
          goto LABEL_148;
        }
        if (a4 != 390) {
LABEL_178:
        }
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](a4, platform);
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
                *(_DWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_91:
              *(_DWORD *)&a4 = 5;
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
              *(_DWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_158:
            *(_DWORD *)&a4 = 3;
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
              *(_DWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_151:
            *(_DWORD *)&a4 = 10;
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
          *(_DWORD *)&a4 = 20;
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
                *(_DWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_149:
              *(_DWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_123:
            *(_DWORD *)&a4 = 11;
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
            *(_DWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_164:
          *(_DWORD *)&a4 = 13;
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
          *(_DWORD *)&a4 = 19;
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
            *(_DWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_175:
            *(_DWORD *)&a4 = 17;
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
            *(_DWORD *)&a4 = 30;
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
          *(_DWORD *)&a4 = 4;
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
          *(_DWORD *)&a4 = 15;
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
          *(_DWORD *)&a4 = 18;
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
        *(_DWORD *)&a4 = 27;
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
        *(_DWORD *)&a4 = 21;
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
          *(_DWORD *)&a4 = 2;
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
          *(_DWORD *)&a4 = 28;
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
        *(_DWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_86:
        *(_DWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
LABEL_176:
    *(_DWORD *)&a4 = 6;
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
        *(_DWORD *)&a4 = 23;
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
      *(_DWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
    {
LABEL_129:
      _CUILog();
      *(_DWORD *)&a4 = 0xFFFF;
      goto LABEL_21;
    }
LABEL_177:
    *(_DWORD *)&a4 = 14;
  }
LABEL_21:
  unsigned int v11 = keyFormat->var2;
  if (v11)
  {
    uint64_t v12 = 0;
    unsigned int v13 = a4;
    while (keyFormat->var3[v12] != a3)
    {
      ++v12;
      v13 += 32;
      if (v11 == v12) {
        return;
      }
    }
    if ((int)v12 < 33)
    {
      if ((v13 & 0x80000000) == 0)
      {
        bitmap = (os_unfair_lock_s *)self->_bitmap;
        CUIBitVectorSetBit(bitmap, v13);
      }
    }
    else
    {
      _CUILog();
    }
  }
}

- (void)clearAttributePresent:(int)a3 withValue:(unsigned __int16)a4
{
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
      int v10 = *var3++;
      if (v10 == 16) {
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
    *(_DWORD *)&a4 = a4 != 0;
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
            *(_DWORD *)&a4 = 24;
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
          *(_DWORD *)&a4 = 8;
          goto LABEL_21;
        }
        if (a4 == 384) {
          goto LABEL_148;
        }
        if (a4 != 390) {
LABEL_178:
        }
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](a4, platform);
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
                *(_DWORD *)&a4 = 1;
                goto LABEL_21;
              }
LABEL_91:
              *(_DWORD *)&a4 = 5;
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
              *(_DWORD *)&a4 = 16;
              goto LABEL_21;
            }
LABEL_158:
            *(_DWORD *)&a4 = 3;
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
              *(_DWORD *)&a4 = 25;
              goto LABEL_21;
            }
LABEL_151:
            *(_DWORD *)&a4 = 10;
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
          *(_DWORD *)&a4 = 20;
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
                *(_DWORD *)&a4 = 29;
                goto LABEL_21;
              }
LABEL_149:
              *(_DWORD *)&a4 = 22;
              goto LABEL_21;
            }
LABEL_123:
            *(_DWORD *)&a4 = 11;
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
            *(_DWORD *)&a4 = 12;
            goto LABEL_21;
          }
LABEL_164:
          *(_DWORD *)&a4 = 13;
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
          *(_DWORD *)&a4 = 19;
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
            *(_DWORD *)&a4 = 7;
            goto LABEL_21;
          }
          if (a4 == 32401)
          {
LABEL_175:
            *(_DWORD *)&a4 = 17;
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
            *(_DWORD *)&a4 = 30;
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
          *(_DWORD *)&a4 = 4;
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
          *(_DWORD *)&a4 = 15;
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
          *(_DWORD *)&a4 = 18;
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
        *(_DWORD *)&a4 = 27;
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
        *(_DWORD *)&a4 = 21;
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
          *(_DWORD *)&a4 = 2;
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
          *(_DWORD *)&a4 = 28;
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
        *(_DWORD *)&a4 = 26;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
    if (a4 != 720)
    {
      if (a4 == 1665)
      {
LABEL_86:
        *(_DWORD *)&a4 = 31;
        goto LABEL_21;
      }
      goto LABEL_129;
    }
LABEL_176:
    *(_DWORD *)&a4 = 6;
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
        *(_DWORD *)&a4 = 23;
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
      *(_DWORD *)&a4 = 9;
      goto LABEL_21;
    }
    if (a4 != 390)
    {
LABEL_129:
      _CUILog();
      *(_DWORD *)&a4 = 0xFFFF;
      goto LABEL_21;
    }
LABEL_177:
    *(_DWORD *)&a4 = 14;
  }
LABEL_21:
  unsigned int v11 = keyFormat->var2;
  if (v11)
  {
    uint64_t v12 = 0;
    unsigned int v13 = a4;
    while (keyFormat->var3[v12] != a3)
    {
      ++v12;
      v13 += 32;
      if (v11 == v12) {
        return;
      }
    }
    if ((int)v12 < 33)
    {
      if ((v13 & 0x80000000) == 0)
      {
        bitmap = (os_unfair_lock_s *)self->_bitmap;
        CUIBitVectorUnSetBit(bitmap, v13);
      }
    }
    else
    {
      _CUILog();
    }
  }
}

- (unint64_t)numberOfBitsSet
{
  return (int)CUIBitVectorNumberOfBitsSet((os_unfair_lock_s *)self->_bitmap);
}

- (void)decrementValue:(int64_t *)a3 forAttribute:(int)a4
{
  int64_t v7 = *a3;
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
      int v12 = *var3++;
      if (v12 == 16) {
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
      LOWORD(v7) = (unsigned __int16)*a3 != 0;
    }
    else if (a4 == 16)
    {
      if (platform == -1)
      {
        unsigned int v25 = (unsigned __int16)*a3;
        if (v25 > 0x86F)
        {
          if ((unsigned __int16)*a3 > 0x9E3u)
          {
            if ((unsigned __int16)*a3 > 0xAD9u)
            {
              if ((unsigned __int16)*a3 > 0xEFFu)
              {
                if (v25 == 3840)
                {
LABEL_345:
                  LOWORD(v7) = 7;
                  goto LABEL_21;
                }
                if (v25 == 32401) {
                  goto LABEL_351;
                }
              }
              else
              {
                if (v25 == 2778) {
                  goto LABEL_329;
                }
                if (v25 == 2796) {
                  goto LABEL_315;
                }
              }
            }
            else if ((unsigned __int16)*a3 > 0xA7Fu)
            {
              if (v25 == 2688) {
                goto LABEL_341;
              }
              if (v25 == 2732)
              {
LABEL_339:
                LOWORD(v7) = 4;
                goto LABEL_21;
              }
            }
            else
            {
              if (v25 == 2532) {
                goto LABEL_325;
              }
              if (v25 == 2556) {
                goto LABEL_319;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x923u)
          {
            if ((unsigned __int16)*a3 > 0x953u)
            {
              if (v25 == 2388) {
                goto LABEL_347;
              }
              if (v25 == 2436) {
                goto LABEL_299;
              }
            }
            else
            {
              if (v25 == 2340)
              {
LABEL_310:
                LOWORD(v7) = 18;
                goto LABEL_21;
              }
              if (v25 == 2360) {
                goto LABEL_346;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x8B9u)
          {
            if (v25 == 2234)
            {
LABEL_287:
              LOWORD(v7) = 27;
              goto LABEL_21;
            }
            if (v25 == 2266) {
              goto LABEL_328;
            }
          }
          else
          {
            if (v25 == 2160)
            {
LABEL_333:
              LOWORD(v7) = 21;
              goto LABEL_21;
            }
            if (v25 == 2224) {
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
              if (v25 == 1792) {
                goto LABEL_335;
              }
              if (v25 == 1964)
              {
LABEL_302:
                LOWORD(v7) = 26;
                goto LABEL_21;
              }
            }
            else
            {
              if (v25 == 720)
              {
LABEL_352:
                LOWORD(v7) = 6;
                goto LABEL_21;
              }
              if (v25 == 1665)
              {
LABEL_262:
                LOWORD(v7) = 31;
                goto LABEL_21;
              }
            }
          }
          else if ((unsigned __int16)*a3 > 0x238u)
          {
            if (v25 == 569) {
              goto LABEL_326;
            }
            if (v25 == 570) {
              goto LABEL_334;
            }
          }
          else
          {
            if (v25 == 502)
            {
LABEL_240:
              LOWORD(v7) = 28;
              goto LABEL_21;
            }
            if (v25 == 568) {
              goto LABEL_242;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x17Fu)
        {
          if ((unsigned __int16)*a3 > 0x1ADu)
          {
            if (v25 == 430) {
              goto LABEL_320;
            }
            if (v25 == 484) {
              goto LABEL_296;
            }
          }
          else
          {
            if (v25 == 384)
            {
LABEL_324:
              LOWORD(v7) = 9;
              goto LABEL_21;
            }
            if (v25 == 390)
            {
LABEL_353:
              LOWORD(v7) = 14;
              goto LABEL_21;
            }
          }
        }
        else if ((unsigned __int16)*a3 > 0x13Fu)
        {
          if (v25 == 320) {
            goto LABEL_316;
          }
          if (v25 == 340) {
            goto LABEL_340;
          }
        }
        else
        {
          if (!(unsigned __int16)*a3) {
            goto LABEL_21;
          }
          if (v25 == 163) {
            goto LABEL_267;
          }
        }
        _CUILog();
        LOWORD(v7) = -1;
        goto LABEL_21;
      }
      if ((unsigned __int16)*a3)
      {
        switch(platform)
        {
          case 0uLL:
            unsigned int v13 = (unsigned __int16)*a3;
            if (v13 <= 0x7AB)
            {
              if (v13 == 1665) {
                goto LABEL_262;
              }
              if (v13 != 1864) {
                goto LABEL_270;
              }
              goto LABEL_242;
            }
            if (v13 == 1964) {
              goto LABEL_302;
            }
            if (v13 != 2234) {
              goto LABEL_270;
            }
            goto LABEL_287;
          case 3uLL:
            int v26 = (unsigned __int16)*a3;
            if (v26 == 3840) {
              goto LABEL_345;
            }
            if (v26 == 1088) {
              goto LABEL_267;
            }
            if (v26 != 720) {
              goto LABEL_270;
            }
            goto LABEL_352;
          case 4uLL:
            unsigned int v27 = (unsigned __int16)*a3;
            if (v27 > 0x1AD)
            {
              if ((unsigned __int16)*a3 > 0x1E3u)
              {
                if (v27 != 484)
                {
                  if (v27 != 496)
                  {
                    if (v27 != 502) {
                      goto LABEL_270;
                    }
                    goto LABEL_240;
                  }
LABEL_315:
                  LOWORD(v7) = 30;
                  goto LABEL_21;
                }
LABEL_296:
                LOWORD(v7) = 24;
                goto LABEL_21;
              }
              if (v27 != 430)
              {
                if (v27 != 446) {
                  goto LABEL_270;
                }
                goto LABEL_319;
              }
LABEL_320:
              LOWORD(v7) = 23;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0x17Fu)
            {
              if (v27 != 320)
              {
                if (v27 != 340) {
                  goto LABEL_270;
                }
LABEL_340:
                LOWORD(v7) = 13;
                goto LABEL_21;
              }
LABEL_316:
              LOWORD(v7) = 8;
              goto LABEL_21;
            }
            if (v27 == 384) {
              goto LABEL_324;
            }
            if (v27 != 390) {
LABEL_270:
            }
              -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:](v7, platform);
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
            unsigned int v28 = (unsigned __int16)*a3;
            if (v28 <= 0x983)
            {
              if ((unsigned __int16)*a3 <= 0x8AFu)
              {
                if ((unsigned __int16)*a3 <= 0x239u)
                {
                  if (v28 != 163)
                  {
                    if (v28 != 568)
                    {
                      if (v28 != 569) {
                        goto LABEL_270;
                      }
LABEL_326:
                      LOWORD(v7) = 2;
                      goto LABEL_21;
                    }
LABEL_242:
                    LOWORD(v7) = 1;
                    goto LABEL_21;
                  }
LABEL_267:
                  LOWORD(v7) = 5;
                  goto LABEL_21;
                }
                if (v28 != 570)
                {
                  if (v28 != 1792)
                  {
                    if (v28 != 2160) {
                      goto LABEL_270;
                    }
                    goto LABEL_333;
                  }
LABEL_335:
                  LOWORD(v7) = 16;
                  goto LABEL_21;
                }
LABEL_334:
                LOWORD(v7) = 3;
                goto LABEL_21;
              }
              if ((unsigned __int16)*a3 <= 0x937u)
              {
                if (v28 != 2224)
                {
                  if (v28 != 2266)
                  {
                    if (v28 != 2340) {
                      goto LABEL_270;
                    }
                    goto LABEL_310;
                  }
LABEL_328:
                  LOWORD(v7) = 25;
                  goto LABEL_21;
                }
LABEL_327:
                LOWORD(v7) = 10;
                goto LABEL_21;
              }
              if (v28 != 2360)
              {
                if (v28 != 2388)
                {
                  if (v28 != 2420) {
                    goto LABEL_270;
                  }
                  goto LABEL_345;
                }
LABEL_347:
                LOWORD(v7) = 15;
                goto LABEL_21;
              }
LABEL_346:
              LOWORD(v7) = 20;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0xABFu)
            {
              if ((unsigned __int16)*a3 <= 0xA3Du)
              {
                if (v28 != 2436)
                {
                  if (v28 != 2532)
                  {
                    if (v28 != 2556) {
                      goto LABEL_270;
                    }
LABEL_319:
                    LOWORD(v7) = 29;
                    goto LABEL_21;
                  }
LABEL_325:
                  LOWORD(v7) = 22;
                  goto LABEL_21;
                }
LABEL_299:
                LOWORD(v7) = 11;
                goto LABEL_21;
              }
              if (v28 == 2622) {
                goto LABEL_340;
              }
              if (v28 != 2688)
              {
                if (v28 != 2732) {
                  goto LABEL_270;
                }
                goto LABEL_339;
              }
LABEL_341:
              LOWORD(v7) = 12;
              goto LABEL_21;
            }
            if ((unsigned __int16)*a3 <= 0xB33u)
            {
              if (v28 == 2752) {
                goto LABEL_316;
              }
              if (v28 != 2778)
              {
                if (v28 != 2796) {
                  goto LABEL_270;
                }
                goto LABEL_315;
              }
LABEL_329:
              LOWORD(v7) = 19;
              goto LABEL_21;
            }
            if (v28 == 2868) {
              goto LABEL_353;
            }
            if (v28 == 3024) {
              goto LABEL_352;
            }
            if (v28 != 32401) {
              goto LABEL_270;
            }
            break;
        }
LABEL_351:
        LOWORD(v7) = 17;
        goto LABEL_21;
      }
      LOWORD(v7) = 0;
    }
  }
LABEL_21:
  unsigned int v14 = keyFormat->var2;
  if (v14)
  {
    uint64_t v15 = 0;
    unsigned int v16 = (unsigned __int16)v7;
    while (keyFormat->var3[v15] != a4)
    {
      ++v15;
      v16 += 32;
      if (v14 == v15) {
        return;
      }
    }
    if ((int)v15 > 32)
    {
LABEL_27:
      _CUILog();
      return;
    }
    if ((v16 & 0x80000000) == 0 && *a3)
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v16)) {
          return;
        }
        int64_t v17 = *a3 - 1;
        *a3 = v17;
        unint64_t v19 = self->_keyFormat;
        unint64_t v18 = self->_platform;
        if (a4 == 16 && v18 == -1)
        {
          uint64_t v20 = v19->var2;
          if (!v20) {
            return;
          }
          unsigned int v21 = v19->var3;
          while (1)
          {
            int v22 = *v21++;
            if (v22 == 16) {
              break;
            }
            if (!--v20) {
              return;
            }
          }
        }
        if (a4 <= 0x1C)
        {
          if (a4 == 13)
          {
            LOWORD(v17) = (unsigned __int16)v17 != 0;
            goto LABEL_198;
          }
          if (a4 == 16)
          {
            if (v18 != -1)
            {
              if (!(_WORD)v17)
              {
                LOWORD(v17) = 0;
                goto LABEL_198;
              }
              switch(v18)
              {
                case 0uLL:
                  if ((unsigned __int16)v17 <= 0x7ABu)
                  {
                    if ((unsigned __int16)v17 == 1665) {
                      goto LABEL_106;
                    }
                    if ((unsigned __int16)v17 != 1864) {
                      goto LABEL_354;
                    }
                    goto LABEL_94;
                  }
                  if ((unsigned __int16)v17 == 1964) {
                    goto LABEL_146;
                  }
                  if ((unsigned __int16)v17 != 2234) {
                    goto LABEL_354;
                  }
                  goto LABEL_131;
                case 3uLL:
                  if ((unsigned __int16)v17 == 3840) {
                    goto LABEL_189;
                  }
                  if ((unsigned __int16)v17 == 1088) {
                    goto LABEL_111;
                  }
                  if ((unsigned __int16)v17 != 720) {
                    goto LABEL_354;
                  }
                  break;
                case 4uLL:
                  if ((unsigned __int16)v17 <= 0x1ADu)
                  {
                    if ((unsigned __int16)v17 <= 0x17Fu)
                    {
                      if ((unsigned __int16)v17 == 320) {
                        goto LABEL_160;
                      }
                      if ((unsigned __int16)v17 != 340) {
                        goto LABEL_354;
                      }
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v17 == 384) {
                      goto LABEL_168;
                    }
                    if ((unsigned __int16)v17 != 390) {
                      goto LABEL_354;
                    }
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v17 <= 0x1E3u)
                  {
                    if ((unsigned __int16)v17 == 430) {
                      goto LABEL_164;
                    }
                    if ((unsigned __int16)v17 != 446) {
                      goto LABEL_354;
                    }
                    goto LABEL_163;
                  }
                  if ((unsigned __int16)v17 == 484) {
                    goto LABEL_140;
                  }
                  if ((unsigned __int16)v17 != 496)
                  {
                    if ((unsigned __int16)v17 != 502) {
                      goto LABEL_354;
                    }
                    goto LABEL_92;
                  }
                  goto LABEL_159;
                case 5uLL:
                  if ((unsigned __int16)v17 == 3648) {
                    goto LABEL_94;
                  }
                  goto LABEL_354;
                default:
                  if (v18 > 2) {
                    goto LABEL_354;
                  }
                  if ((unsigned __int16)v17 <= 0x983u)
                  {
                    if ((unsigned __int16)v17 <= 0x8AFu)
                    {
                      if ((unsigned __int16)v17 <= 0x239u)
                      {
                        if ((unsigned __int16)v17 == 163) {
                          goto LABEL_111;
                        }
                        if ((unsigned __int16)v17 != 568)
                        {
                          if ((unsigned __int16)v17 != 569) {
                            goto LABEL_354;
                          }
                          goto LABEL_170;
                        }
                        goto LABEL_94;
                      }
                      if ((unsigned __int16)v17 == 570) {
                        goto LABEL_178;
                      }
                      if ((unsigned __int16)v17 != 1792)
                      {
                        if ((unsigned __int16)v17 != 2160) {
                          goto LABEL_354;
                        }
                        goto LABEL_177;
                      }
                      goto LABEL_179;
                    }
                    if ((unsigned __int16)v17 <= 0x937u)
                    {
                      if ((unsigned __int16)v17 == 2224) {
                        goto LABEL_171;
                      }
                      if ((unsigned __int16)v17 != 2266)
                      {
                        if ((unsigned __int16)v17 != 2340) {
                          goto LABEL_354;
                        }
                        goto LABEL_154;
                      }
                      goto LABEL_172;
                    }
                    if ((unsigned __int16)v17 == 2360) {
                      goto LABEL_190;
                    }
                    if ((unsigned __int16)v17 != 2388)
                    {
                      if ((unsigned __int16)v17 != 2420) {
                        goto LABEL_354;
                      }
                      goto LABEL_189;
                    }
                    goto LABEL_191;
                  }
                  if ((unsigned __int16)v17 <= 0xABFu)
                  {
                    if ((unsigned __int16)v17 <= 0xA3Du)
                    {
                      if ((unsigned __int16)v17 == 2436) {
                        goto LABEL_143;
                      }
                      if ((unsigned __int16)v17 != 2532)
                      {
                        if ((unsigned __int16)v17 != 2556) {
                          goto LABEL_354;
                        }
                        goto LABEL_163;
                      }
                      goto LABEL_169;
                    }
                    if ((unsigned __int16)v17 == 2622) {
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v17 != 2688)
                    {
                      if ((unsigned __int16)v17 != 2732) {
                        goto LABEL_354;
                      }
                      goto LABEL_183;
                    }
                    goto LABEL_185;
                  }
                  if ((unsigned __int16)v17 <= 0xB33u)
                  {
                    if ((unsigned __int16)v17 == 2752) {
                      goto LABEL_160;
                    }
                    if ((unsigned __int16)v17 != 2778)
                    {
                      if ((unsigned __int16)v17 != 2796) {
                        goto LABEL_354;
                      }
                      goto LABEL_159;
                    }
                    goto LABEL_173;
                  }
                  if ((unsigned __int16)v17 == 2868) {
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v17 != 3024)
                  {
                    if ((unsigned __int16)v17 != 32401) {
LABEL_354:
                    }
                      -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:](v17, v18);
                    goto LABEL_195;
                  }
                  return;
              }
LABEL_196:
              LOWORD(v17) = 6;
              goto LABEL_198;
            }
            if ((unsigned __int16)v17 > 0x86Fu)
            {
              if ((unsigned __int16)v17 > 0x9E3u)
              {
                if ((unsigned __int16)v17 > 0xAD9u)
                {
                  if ((unsigned __int16)v17 > 0xEFFu)
                  {
                    if ((unsigned __int16)v17 == 3840)
                    {
LABEL_189:
                      LOWORD(v17) = 7;
                    }
                    else
                    {
                      if ((unsigned __int16)v17 != 32401) {
                        goto LABEL_149;
                      }
LABEL_195:
                      LOWORD(v17) = 17;
                    }
                  }
                  else if ((unsigned __int16)v17 == 2778)
                  {
LABEL_173:
                    LOWORD(v17) = 19;
                  }
                  else
                  {
                    if ((unsigned __int16)v17 != 2796) {
                      goto LABEL_149;
                    }
LABEL_159:
                    LOWORD(v17) = 30;
                  }
                }
                else if ((unsigned __int16)v17 > 0xA7Fu)
                {
                  if ((unsigned __int16)v17 == 2688)
                  {
LABEL_185:
                    LOWORD(v17) = 12;
                  }
                  else
                  {
                    if ((unsigned __int16)v17 != 2732) {
                      goto LABEL_149;
                    }
LABEL_183:
                    LOWORD(v17) = 4;
                  }
                }
                else if ((unsigned __int16)v17 == 2532)
                {
LABEL_169:
                  LOWORD(v17) = 22;
                }
                else
                {
                  if ((unsigned __int16)v17 != 2556) {
                    goto LABEL_149;
                  }
LABEL_163:
                  LOWORD(v17) = 29;
                }
              }
              else if ((unsigned __int16)v17 > 0x923u)
              {
                if ((unsigned __int16)v17 > 0x953u)
                {
                  if ((unsigned __int16)v17 != 2388)
                  {
                    if ((unsigned __int16)v17 == 2436)
                    {
LABEL_143:
                      LOWORD(v17) = 11;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
LABEL_191:
                  LOWORD(v17) = 15;
                }
                else if ((unsigned __int16)v17 == 2340)
                {
LABEL_154:
                  LOWORD(v17) = 18;
                }
                else
                {
                  if ((unsigned __int16)v17 != 2360) {
                    goto LABEL_149;
                  }
LABEL_190:
                  LOWORD(v17) = 20;
                }
              }
              else if ((unsigned __int16)v17 > 0x8B9u)
              {
                if ((unsigned __int16)v17 == 2234)
                {
LABEL_131:
                  LOWORD(v17) = 27;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v17 != 2266) {
                  goto LABEL_149;
                }
LABEL_172:
                LOWORD(v17) = 25;
              }
              else if ((unsigned __int16)v17 == 2160)
              {
LABEL_177:
                LOWORD(v17) = 21;
              }
              else
              {
                if ((unsigned __int16)v17 != 2224) {
                  goto LABEL_149;
                }
LABEL_171:
                LOWORD(v17) = 10;
              }
            }
            else if ((unsigned __int16)v17 > 0x1F5u)
            {
              if ((unsigned __int16)v17 > 0x2CFu)
              {
                if ((unsigned __int16)v17 <= 0x6FFu)
                {
                  if ((unsigned __int16)v17 != 720)
                  {
                    if ((unsigned __int16)v17 == 1665)
                    {
LABEL_106:
                      LOWORD(v17) = 31;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
                  goto LABEL_196;
                }
                if ((unsigned __int16)v17 != 1792)
                {
                  if ((unsigned __int16)v17 == 1964)
                  {
LABEL_146:
                    LOWORD(v17) = 26;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_179:
                LOWORD(v17) = 16;
              }
              else
              {
                if ((unsigned __int16)v17 <= 0x238u)
                {
                  if ((unsigned __int16)v17 == 502)
                  {
LABEL_92:
                    LOWORD(v17) = 28;
                    goto LABEL_198;
                  }
                  if ((unsigned __int16)v17 == 568)
                  {
LABEL_94:
                    LOWORD(v17) = 1;
                    goto LABEL_198;
                  }
LABEL_149:
                  _CUILog();
                  LOWORD(v17) = -1;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v17 == 569)
                {
LABEL_170:
                  LOWORD(v17) = 2;
                }
                else
                {
                  if ((unsigned __int16)v17 != 570) {
                    goto LABEL_149;
                  }
LABEL_178:
                  LOWORD(v17) = 3;
                }
              }
            }
            else if ((unsigned __int16)v17 > 0x17Fu)
            {
              if ((unsigned __int16)v17 > 0x1ADu)
              {
                if ((unsigned __int16)v17 != 430)
                {
                  if ((unsigned __int16)v17 == 484)
                  {
LABEL_140:
                    LOWORD(v17) = 24;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_164:
                LOWORD(v17) = 23;
              }
              else if ((unsigned __int16)v17 == 384)
              {
LABEL_168:
                LOWORD(v17) = 9;
              }
              else
              {
                if ((unsigned __int16)v17 != 390) {
                  goto LABEL_149;
                }
LABEL_197:
                LOWORD(v17) = 14;
              }
            }
            else
            {
              if ((unsigned __int16)v17 <= 0x13Fu)
              {
                if (!(_WORD)v17) {
                  goto LABEL_198;
                }
                if ((unsigned __int16)v17 == 163)
                {
LABEL_111:
                  LOWORD(v17) = 5;
                  goto LABEL_198;
                }
                goto LABEL_149;
              }
              if ((unsigned __int16)v17 == 320)
              {
LABEL_160:
                LOWORD(v17) = 8;
              }
              else
              {
                if ((unsigned __int16)v17 != 340) {
                  goto LABEL_149;
                }
LABEL_184:
                LOWORD(v17) = 13;
              }
            }
          }
          else if (((1 << a4) & 0x100600E6) != 0)
          {
            return;
          }
        }
LABEL_198:
        unsigned int v23 = v19->var2;
        if (!v23) {
          return;
        }
        uint64_t v24 = 0;
        unsigned int v16 = (unsigned __int16)v17;
        while (v19->var3[v24] != a4)
        {
          v16 += 32;
          if (v23 == ++v24) {
            return;
          }
        }
        if ((int)v24 > 32) {
          goto LABEL_27;
        }
      }
      while (*a3 && (v16 & 0x80000000) == 0);
    }
  }
}

- (void)incrementIndex:(unint64_t *)a3 inValues:(id)a4 forAttribute:(int)a5
{
  uint64_t v9 = [a4 count];
  unint64_t platform = self->_platform;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", *a3), "integerValue");
  keyFormat = self->_keyFormat;
  if (a5 == 16 && platform == -1)
  {
    uint64_t var2 = keyFormat->var2;
    if (!var2) {
      return;
    }
    var3 = keyFormat->var3;
    while (1)
    {
      int v15 = *var3++;
      if (v15 == 16) {
        break;
      }
      if (!--var2) {
        return;
      }
    }
  }
  if (a5 <= 0x1C)
  {
    if (((1 << a5) & 0x100600E6) != 0) {
      return;
    }
    if (a5 == 13)
    {
      LOWORD(v11) = (unsigned __int16)v11 != 0;
    }
    else if (a5 == 16)
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
        _CUILog();
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
              -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:](v11, platform);
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
  unsigned int v16 = keyFormat->var2;
  if (v16)
  {
    uint64_t v17 = 0;
    unsigned int v18 = (unsigned __int16)v11;
    while (keyFormat->var3[v17] != a5)
    {
      ++v17;
      v18 += 32;
      if (v16 == v17) {
        return;
      }
    }
    if ((int)v17 > 32)
    {
LABEL_27:
      _CUILog();
      return;
    }
    if ((v18 & 0x80000000) == 0 && *a3 < v9 - 1)
    {
      do
      {
        if (CUIBitVectorIsBitSet((os_unfair_lock_s *)self->_bitmap, v18)) {
          return;
        }
        ++*a3;
        unint64_t v19 = self->_platform;
        uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:"), "integerValue");
        unsigned int v21 = self->_keyFormat;
        if (a5 == 16 && v19 == -1)
        {
          uint64_t v22 = v21->var2;
          if (!v22) {
            return;
          }
          unsigned int v23 = v21->var3;
          while (1)
          {
            int v24 = *v23++;
            if (v24 == 16) {
              break;
            }
            if (!--v22) {
              return;
            }
          }
        }
        if (a5 <= 0x1C)
        {
          if (a5 == 13)
          {
            LOWORD(v20) = (unsigned __int16)v20 != 0;
            goto LABEL_198;
          }
          if (a5 == 16)
          {
            if (v19 != -1)
            {
              if (!(_WORD)v20)
              {
                LOWORD(v20) = 0;
                goto LABEL_198;
              }
              switch(v19)
              {
                case 0uLL:
                  if ((unsigned __int16)v20 <= 0x7ABu)
                  {
                    if ((unsigned __int16)v20 == 1665) {
                      goto LABEL_106;
                    }
                    if ((unsigned __int16)v20 != 1864) {
                      goto LABEL_354;
                    }
                    goto LABEL_94;
                  }
                  if ((unsigned __int16)v20 == 1964) {
                    goto LABEL_146;
                  }
                  if ((unsigned __int16)v20 != 2234) {
                    goto LABEL_354;
                  }
                  goto LABEL_131;
                case 3uLL:
                  if ((unsigned __int16)v20 == 3840) {
                    goto LABEL_189;
                  }
                  if ((unsigned __int16)v20 == 1088) {
                    goto LABEL_111;
                  }
                  if ((unsigned __int16)v20 != 720) {
                    goto LABEL_354;
                  }
                  break;
                case 4uLL:
                  if ((unsigned __int16)v20 <= 0x1ADu)
                  {
                    if ((unsigned __int16)v20 <= 0x17Fu)
                    {
                      if ((unsigned __int16)v20 == 320) {
                        goto LABEL_160;
                      }
                      if ((unsigned __int16)v20 != 340) {
                        goto LABEL_354;
                      }
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v20 == 384) {
                      goto LABEL_168;
                    }
                    if ((unsigned __int16)v20 != 390) {
                      goto LABEL_354;
                    }
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v20 <= 0x1E3u)
                  {
                    if ((unsigned __int16)v20 == 430) {
                      goto LABEL_164;
                    }
                    if ((unsigned __int16)v20 != 446) {
                      goto LABEL_354;
                    }
                    goto LABEL_163;
                  }
                  if ((unsigned __int16)v20 == 484) {
                    goto LABEL_140;
                  }
                  if ((unsigned __int16)v20 != 496)
                  {
                    if ((unsigned __int16)v20 != 502) {
                      goto LABEL_354;
                    }
                    goto LABEL_92;
                  }
                  goto LABEL_159;
                case 5uLL:
                  if ((unsigned __int16)v20 == 3648) {
                    goto LABEL_94;
                  }
                  goto LABEL_354;
                default:
                  if (v19 > 2) {
                    goto LABEL_354;
                  }
                  if ((unsigned __int16)v20 <= 0x983u)
                  {
                    if ((unsigned __int16)v20 <= 0x8AFu)
                    {
                      if ((unsigned __int16)v20 <= 0x239u)
                      {
                        if ((unsigned __int16)v20 == 163) {
                          goto LABEL_111;
                        }
                        if ((unsigned __int16)v20 != 568)
                        {
                          if ((unsigned __int16)v20 != 569) {
                            goto LABEL_354;
                          }
                          goto LABEL_170;
                        }
                        goto LABEL_94;
                      }
                      if ((unsigned __int16)v20 == 570) {
                        goto LABEL_178;
                      }
                      if ((unsigned __int16)v20 != 1792)
                      {
                        if ((unsigned __int16)v20 != 2160) {
                          goto LABEL_354;
                        }
                        goto LABEL_177;
                      }
                      goto LABEL_179;
                    }
                    if ((unsigned __int16)v20 <= 0x937u)
                    {
                      if ((unsigned __int16)v20 == 2224) {
                        goto LABEL_171;
                      }
                      if ((unsigned __int16)v20 != 2266)
                      {
                        if ((unsigned __int16)v20 != 2340) {
                          goto LABEL_354;
                        }
                        goto LABEL_154;
                      }
                      goto LABEL_172;
                    }
                    if ((unsigned __int16)v20 == 2360) {
                      goto LABEL_190;
                    }
                    if ((unsigned __int16)v20 != 2388)
                    {
                      if ((unsigned __int16)v20 != 2420) {
                        goto LABEL_354;
                      }
                      goto LABEL_189;
                    }
                    goto LABEL_191;
                  }
                  if ((unsigned __int16)v20 <= 0xABFu)
                  {
                    if ((unsigned __int16)v20 <= 0xA3Du)
                    {
                      if ((unsigned __int16)v20 == 2436) {
                        goto LABEL_143;
                      }
                      if ((unsigned __int16)v20 != 2532)
                      {
                        if ((unsigned __int16)v20 != 2556) {
                          goto LABEL_354;
                        }
                        goto LABEL_163;
                      }
                      goto LABEL_169;
                    }
                    if ((unsigned __int16)v20 == 2622) {
                      goto LABEL_184;
                    }
                    if ((unsigned __int16)v20 != 2688)
                    {
                      if ((unsigned __int16)v20 != 2732) {
                        goto LABEL_354;
                      }
                      goto LABEL_183;
                    }
                    goto LABEL_185;
                  }
                  if ((unsigned __int16)v20 <= 0xB33u)
                  {
                    if ((unsigned __int16)v20 == 2752) {
                      goto LABEL_160;
                    }
                    if ((unsigned __int16)v20 != 2778)
                    {
                      if ((unsigned __int16)v20 != 2796) {
                        goto LABEL_354;
                      }
                      goto LABEL_159;
                    }
                    goto LABEL_173;
                  }
                  if ((unsigned __int16)v20 == 2868) {
                    goto LABEL_197;
                  }
                  if ((unsigned __int16)v20 != 3024)
                  {
                    if ((unsigned __int16)v20 != 32401) {
LABEL_354:
                    }
                      -[CUIPlaceholderCUINamedRenditionInfo decrementValue:forAttribute:](v20, v19);
                    goto LABEL_195;
                  }
                  return;
              }
LABEL_196:
              LOWORD(v20) = 6;
              goto LABEL_198;
            }
            if ((unsigned __int16)v20 > 0x86Fu)
            {
              if ((unsigned __int16)v20 > 0x9E3u)
              {
                if ((unsigned __int16)v20 > 0xAD9u)
                {
                  if ((unsigned __int16)v20 > 0xEFFu)
                  {
                    if ((unsigned __int16)v20 == 3840)
                    {
LABEL_189:
                      LOWORD(v20) = 7;
                    }
                    else
                    {
                      if ((unsigned __int16)v20 != 32401) {
                        goto LABEL_149;
                      }
LABEL_195:
                      LOWORD(v20) = 17;
                    }
                  }
                  else if ((unsigned __int16)v20 == 2778)
                  {
LABEL_173:
                    LOWORD(v20) = 19;
                  }
                  else
                  {
                    if ((unsigned __int16)v20 != 2796) {
                      goto LABEL_149;
                    }
LABEL_159:
                    LOWORD(v20) = 30;
                  }
                }
                else if ((unsigned __int16)v20 > 0xA7Fu)
                {
                  if ((unsigned __int16)v20 == 2688)
                  {
LABEL_185:
                    LOWORD(v20) = 12;
                  }
                  else
                  {
                    if ((unsigned __int16)v20 != 2732) {
                      goto LABEL_149;
                    }
LABEL_183:
                    LOWORD(v20) = 4;
                  }
                }
                else if ((unsigned __int16)v20 == 2532)
                {
LABEL_169:
                  LOWORD(v20) = 22;
                }
                else
                {
                  if ((unsigned __int16)v20 != 2556) {
                    goto LABEL_149;
                  }
LABEL_163:
                  LOWORD(v20) = 29;
                }
              }
              else if ((unsigned __int16)v20 > 0x923u)
              {
                if ((unsigned __int16)v20 > 0x953u)
                {
                  if ((unsigned __int16)v20 != 2388)
                  {
                    if ((unsigned __int16)v20 == 2436)
                    {
LABEL_143:
                      LOWORD(v20) = 11;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
LABEL_191:
                  LOWORD(v20) = 15;
                }
                else if ((unsigned __int16)v20 == 2340)
                {
LABEL_154:
                  LOWORD(v20) = 18;
                }
                else
                {
                  if ((unsigned __int16)v20 != 2360) {
                    goto LABEL_149;
                  }
LABEL_190:
                  LOWORD(v20) = 20;
                }
              }
              else if ((unsigned __int16)v20 > 0x8B9u)
              {
                if ((unsigned __int16)v20 == 2234)
                {
LABEL_131:
                  LOWORD(v20) = 27;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v20 != 2266) {
                  goto LABEL_149;
                }
LABEL_172:
                LOWORD(v20) = 25;
              }
              else if ((unsigned __int16)v20 == 2160)
              {
LABEL_177:
                LOWORD(v20) = 21;
              }
              else
              {
                if ((unsigned __int16)v20 != 2224) {
                  goto LABEL_149;
                }
LABEL_171:
                LOWORD(v20) = 10;
              }
            }
            else if ((unsigned __int16)v20 > 0x1F5u)
            {
              if ((unsigned __int16)v20 > 0x2CFu)
              {
                if ((unsigned __int16)v20 <= 0x6FFu)
                {
                  if ((unsigned __int16)v20 != 720)
                  {
                    if ((unsigned __int16)v20 == 1665)
                    {
LABEL_106:
                      LOWORD(v20) = 31;
                      goto LABEL_198;
                    }
                    goto LABEL_149;
                  }
                  goto LABEL_196;
                }
                if ((unsigned __int16)v20 != 1792)
                {
                  if ((unsigned __int16)v20 == 1964)
                  {
LABEL_146:
                    LOWORD(v20) = 26;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_179:
                LOWORD(v20) = 16;
              }
              else
              {
                if ((unsigned __int16)v20 <= 0x238u)
                {
                  if ((unsigned __int16)v20 == 502)
                  {
LABEL_92:
                    LOWORD(v20) = 28;
                    goto LABEL_198;
                  }
                  if ((unsigned __int16)v20 == 568)
                  {
LABEL_94:
                    LOWORD(v20) = 1;
                    goto LABEL_198;
                  }
LABEL_149:
                  _CUILog();
                  LOWORD(v20) = -1;
                  goto LABEL_198;
                }
                if ((unsigned __int16)v20 == 569)
                {
LABEL_170:
                  LOWORD(v20) = 2;
                }
                else
                {
                  if ((unsigned __int16)v20 != 570) {
                    goto LABEL_149;
                  }
LABEL_178:
                  LOWORD(v20) = 3;
                }
              }
            }
            else if ((unsigned __int16)v20 > 0x17Fu)
            {
              if ((unsigned __int16)v20 > 0x1ADu)
              {
                if ((unsigned __int16)v20 != 430)
                {
                  if ((unsigned __int16)v20 == 484)
                  {
LABEL_140:
                    LOWORD(v20) = 24;
                    goto LABEL_198;
                  }
                  goto LABEL_149;
                }
LABEL_164:
                LOWORD(v20) = 23;
              }
              else if ((unsigned __int16)v20 == 384)
              {
LABEL_168:
                LOWORD(v20) = 9;
              }
              else
              {
                if ((unsigned __int16)v20 != 390) {
                  goto LABEL_149;
                }
LABEL_197:
                LOWORD(v20) = 14;
              }
            }
            else
            {
              if ((unsigned __int16)v20 <= 0x13Fu)
              {
                if (!(_WORD)v20) {
                  goto LABEL_198;
                }
                if ((unsigned __int16)v20 == 163)
                {
LABEL_111:
                  LOWORD(v20) = 5;
                  goto LABEL_198;
                }
                goto LABEL_149;
              }
              if ((unsigned __int16)v20 == 320)
              {
LABEL_160:
                LOWORD(v20) = 8;
              }
              else
              {
                if ((unsigned __int16)v20 != 340) {
                  goto LABEL_149;
                }
LABEL_184:
                LOWORD(v20) = 13;
              }
            }
          }
          else if (((1 << a5) & 0x100600E6) != 0)
          {
            return;
          }
        }
LABEL_198:
        unsigned int v25 = v21->var2;
        if (!v25) {
          return;
        }
        uint64_t v26 = 0;
        unsigned int v18 = (unsigned __int16)v20;
        while (v21->var3[v26] != a5)
        {
          v18 += 32;
          if (v25 == ++v26) {
            return;
          }
        }
        if ((int)v26 > 32) {
          goto LABEL_27;
        }
      }
      while (*a3 < v9 - 1 && (v18 & 0x80000000) == 0);
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
    _CUILog();
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
          -[CUIPlaceholderCUINamedRenditionInfo attributePresent:withValue:](a4, a3);
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

- (BOOL)containsVectorGlyphInterpolationSources
{
  if (![(CUIPlaceholderCUINamedRenditionInfo *)self containsVectorGlyphWithWeight:1 size:1]|| ![(CUIPlaceholderCUINamedRenditionInfo *)self containsVectorGlyphWithWeight:4 size:1])
  {
    return 0;
  }

  return [(CUIPlaceholderCUINamedRenditionInfo *)self containsVectorGlyphWithWeight:9 size:1];
}

- (BOOL)containsVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  unsigned __int16 v4 = a4;
  return [(CUIPlaceholderCUINamedRenditionInfo *)self attributePresent:26 withValue:(unsigned __int16)a3] >= 1&& [(CUIPlaceholderCUINamedRenditionInfo *)self attributePresent:27 withValue:v4] > 0;
}

- (void)initWithKeyFormat:andPlatform:.cold.1()
{
}

- (void)attributePresent:(uint64_t)a1 withValue:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
}

- (void)decrementValue:(uint64_t)a1 forAttribute:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
}

@end