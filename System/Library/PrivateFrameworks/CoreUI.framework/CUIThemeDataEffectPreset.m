@interface CUIThemeDataEffectPreset
- (CUIThemeDataEffectPreset)initWithEffectData:(const _cuieffectdata *)a3 forScaleFactor:(double)a4;
- (id)description;
@end

@implementation CUIThemeDataEffectPreset

- (CUIThemeDataEffectPreset)initWithEffectData:(const _cuieffectdata *)a3 forScaleFactor:(double)a4
{
  v33.receiver = self;
  v33.super_class = (Class)CUIThemeDataEffectPreset;
  v7 = [(CUIShapeEffectPreset *)&v33 init];
  v14 = v7;
  if (a3 && a3->var0 == 1129596504)
  {
    SEL v32 = a2;
    -[CUIShapeEffectPreset setScaleFactor:]((uint64_t)v7, a4);
    unint64_t var0 = a3->var4.var0;
    if (var0)
    {
      v21 = 0;
      v22 = &a3->var4.var1[var0 + 1];
      do
      {
        uint64_t v23 = a3->var4.var1[(void)v21];
        v24 = (char *)v22 + v23;
        if (*(unsigned int *)((char *)v22 + v23 + 4))
        {
          uint64_t v25 = 0;
          v26 = (float *)((char *)&a3->var4.var1[var0 + 4] + v23);
          while (2)
          {
            uint64_t v27 = *((unsigned int *)v26 - 1);
            switch((int)v27)
            {
              case 0:
              case 1:
                unint64_t v28 = *(unsigned __int16 *)v26 | ((unint64_t)*((unsigned __int8 *)v26 + 2) << 16);
                goto LABEL_14;
              case 2:
              case 3:
                double v29 = *v26;
                goto LABEL_15;
              case 4:
              case 5:
              case 7:
              case 8:
              case 9:
              case 10:
              case 11:
                unint64_t v28 = *(unsigned int *)v26;
                goto LABEL_14;
              case 6:
                unint64_t v28 = *(unsigned __int16 *)v26;
LABEL_14:
                double v29 = *(double *)&v28;
                goto LABEL_15;
              default:
                double v29 = 0.0;
                if (v27 < 0xC) {
LABEL_15:
                }
                  -[CUIShapeEffectPreset addValue:forParameter:withEffectType:atEffectIndex:](v14, "addValue:forParameter:withEffectType:atEffectIndex:", *(void *)&v29);
                else {
                  _CUILog(4, (uint64_t)"Unrecognized effect parameter type %d encountered for effect type %u. Skipping.", v15, v27, v16, v17, v18, v19, *((unsigned int *)v26 - 1));
                }
                v26 += 2;
                if (++v25 >= (unint64_t)*((unsigned int *)v24 + 1)) {
                  break;
                }
                continue;
            }
            break;
          }
        }
        v21 = (char *)v21 + 1;
      }
      while (v21 != (void *)var0);
    }
    if ([(CUIShapeEffectPreset *)v14 effectCount] != var0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:v32 object:v14 file:@"CUIThemeDataEffectPreset.m" lineNumber:175 description:@"Preset effect count does not match serialized effect count"];
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"Invalid effect data signature", v8, v9, v10, v11, v12, v13, v31);

    return 0;
  }
  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@:%p> ", NSStringFromClass(v3), self];
}

@end