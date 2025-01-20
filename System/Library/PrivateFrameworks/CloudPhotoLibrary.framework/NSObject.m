@interface NSObject
@end

@implementation NSObject

void __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  uint64_t v8 = a1[6];
  if (!v8
    || ((*(uint64_t (**)(uint64_t, void, void, id, uint64_t, uint64_t))(v8 + 16))(v8, a1[4], a1[5], v5, [v6 propertySetter], objc_msgSend(v6, "propertyGetter")) & 1) == 0)
  {
    __darwin_ct_rune_t v9 = __tolower([v7 propertyType]);
    if (v9 <= 97)
    {
      if (v9 == 35)
      {
        uint64_t v10 = ((uint64_t (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
        uint64_t v11 = [v7 propertySetter];
        if (v11) {
LABEL_41:
        }
          ((void (*)(void, uint64_t, uint64_t))[v7 propertySetterIMP])(a1[4], v11, v10);
        else {
          [v7 setIvarValue:v10 forObject:a1[4]];
        }
      }
      else if (v9 == 64)
      {
        v13 = ((void (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
        v14 = (void *)[v13 cplDeepCopy];
        uint64_t v15 = [v7 propertySetter];
        if (v15) {
          ((void (*)(void, uint64_t, void *))[v7 propertySetterIMP])(a1[4], v15, v14);
        }
        else {
          [v7 setIvarValue:v14 forObject:a1[4]];
        }

LABEL_44:
      }
      else
      {
LABEL_23:
        if (!_CPLSilentLogging)
        {
          v21 = __CPLCodingOSLogDomain();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v41 = 138412546;
            id v42 = v5;
            __int16 v43 = 1024;
            LODWORD(v44) = [v7 propertyType];
            _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v41, 0x12u);
          }
        }
      }
    }
    else
    {
      switch(v9)
      {
        case 'b':
        case 'c':
          uint64_t v10 = ((uint64_t (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ([v7 isReadOnly]) {
            break;
          }
          uint64_t v11 = [v7 propertySetter];
          if (v11) {
            goto LABEL_41;
          }
          v12 = (unsigned char *)[v7 ivarAddrForObject:a1[4]];
          if (v12) {
            unsigned char *v12 = v10;
          }
          break;
        case 'd':
          double v22 = ((double (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if (([v7 isReadOnly] & 1) == 0)
          {
            uint64_t v23 = [v7 propertySetter];
            if (v23)
            {
              ((void (*)(void, uint64_t, double))[v7 propertySetterIMP])(a1[4], v23, v22);
            }
            else
            {
              v35 = (double *)[v7 ivarAddrForObject:a1[4]];
              if (v35) {
                double *v35 = v22;
              }
            }
          }
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_23;
        case 'f':
          float v24 = ((float (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if (([v7 isReadOnly] & 1) == 0)
          {
            uint64_t v25 = [v7 propertySetter];
            if (v25)
            {
              ((void (*)(void, uint64_t, float))[v7 propertySetterIMP])(a1[4], v25, v24);
            }
            else
            {
              v36 = (float *)[v7 ivarAddrForObject:a1[4]];
              if (v36) {
                float *v36 = v24;
              }
            }
          }
          break;
        case 'i':
          uint64_t v10 = ((uint64_t (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ([v7 isReadOnly]) {
            break;
          }
          uint64_t v11 = [v7 propertySetter];
          if (v11) {
            goto LABEL_41;
          }
          v26 = (_DWORD *)[v7 ivarAddrForObject:a1[4]];
          if (v26) {
            _DWORD *v26 = v10;
          }
          break;
        case 'l':
        case 'q':
          uint64_t v10 = ((uint64_t (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ([v7 isReadOnly]) {
            break;
          }
          uint64_t v11 = [v7 propertySetter];
          if (v11) {
            goto LABEL_41;
          }
          v16 = (uint64_t *)[v7 ivarAddrForObject:a1[4]];
          if (v16) {
            uint64_t *v16 = v10;
          }
          break;
        case 's':
          uint64_t v10 = ((uint64_t (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ([v7 isReadOnly]) {
            break;
          }
          uint64_t v11 = [v7 propertySetter];
          if (v11) {
            goto LABEL_41;
          }
          v37 = (_WORD *)[v7 ivarAddrForObject:a1[4]];
          if (v37) {
            _WORD *v37 = v10;
          }
          break;
        default:
          if (v9 != 123) {
            goto LABEL_23;
          }
          v13 = [v7 structName];
          if (([v13 isEqualToString:@"CGSize"] & 1) != 0
            || [v13 isEqualToString:@"NSSize"])
          {
            goto LABEL_20;
          }
          if (([v13 isEqualToString:@"CGRect"] & 1) != 0
            || [v13 isEqualToString:@"NSRect"])
          {
            double v27 = ((double (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
            double v29 = v28;
            double v31 = v30;
            double v33 = v32;
            if (([v7 isReadOnly] & 1) == 0)
            {
              uint64_t v34 = [v7 propertySetter];
              if (v34)
              {
                ((void (*)(void, uint64_t, double, double, double, double))[v7 propertySetterIMP])(a1[4], v34, v27, v29, v31, v33);
              }
              else
              {
                v40 = (double *)[v7 ivarAddrForObject:a1[4]];
                if (v40)
                {
                  double *v40 = v27;
                  v40[1] = v29;
                  v40[2] = v31;
                  v40[3] = v33;
                }
              }
            }
          }
          else if (([v13 isEqualToString:@"CGPoint"] & 1) != 0 {
                 || [v13 isEqualToString:@"NSPoint"])
          }
          {
LABEL_20:
            double v17 = ((double (*)(void, uint64_t))[v7 propertyGetterIMP])(a1[5], objc_msgSend(v7, "propertyGetter"));
            double v19 = v18;
            if (([v7 isReadOnly] & 1) == 0)
            {
              uint64_t v20 = [v7 propertySetter];
              if (v20)
              {
                ((void (*)(void, uint64_t, double, double))[v7 propertySetterIMP])(a1[4], v20, v17, v19);
              }
              else
              {
                v38 = (double *)[v7 ivarAddrForObject:a1[4]];
                if (v38)
                {
                  double *v38 = v17;
                  v38[1] = v19;
                }
              }
            }
          }
          else if (!_CPLSilentLogging)
          {
            v39 = __CPLCodingOSLogDomain();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              int v41 = 138412546;
              id v42 = v5;
              __int16 v43 = 2112;
              v44 = v13;
              _os_log_impl(&dword_1B4CAC000, v39, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v41, 0x16u);
            }
          }
          goto LABEL_44;
      }
    }
  }
}

uint64_t __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  if ((void *)a1[4] != a2)
  {
    id v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = a2;
    id v7 = [v5 objectAtIndex:a3];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

void __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __darwin_ct_rune_t v7 = __tolower([v6 propertyType]);
  if (v7 <= 97)
  {
    if (v7 == 35 || v7 == 64)
    {
      uint64_t v8 = [v6 propertySetter];
      if (v8) {
LABEL_13:
      }
        ((void (*)(void, uint64_t, void))[v6 propertySetterIMP])(*(void *)(a1 + 32), v8, 0);
      else {
        [v6 setIvarValue:0 forObject:*(void *)(a1 + 32)];
      }
    }
    else
    {
LABEL_20:
      if (!_CPLSilentLogging)
      {
        v14 = __CPLCodingOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v30 = 138412546;
          id v31 = v5;
          __int16 v32 = 1024;
          LODWORD(v33) = [v6 propertyType];
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v30, 0x12u);
        }
      }
    }
  }
  else
  {
    switch(v7)
    {
      case 'b':
      case 'c':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v8 = [v6 propertySetter];
        if (v8) {
          goto LABEL_13;
        }
        __darwin_ct_rune_t v9 = (unsigned char *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
        if (v9) {
          *__darwin_ct_rune_t v9 = 0;
        }
        break;
      case 'd':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v15 = [v6 propertySetter];
        if (v15) {
          goto LABEL_26;
        }
        goto LABEL_37;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_20;
      case 'f':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v15 = [v6 propertySetter];
        if (!v15) {
          goto LABEL_32;
        }
LABEL_26:
        ((void (*)(void, uint64_t, double))[v6 propertySetterIMP])(*(void *)(a1 + 32), v15, 0.0);
        break;
      case 'i':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v8 = [v6 propertySetter];
        if (v8) {
          goto LABEL_13;
        }
LABEL_32:
        v16 = (_DWORD *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
        if (v16) {
          _DWORD *v16 = 0;
        }
        break;
      case 'l':
      case 'q':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v8 = [v6 propertySetter];
        if (v8) {
          goto LABEL_13;
        }
LABEL_37:
        double v17 = (void *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
        if (v17) {
          *double v17 = 0;
        }
        break;
      case 's':
        if ([v6 isReadOnly]) {
          break;
        }
        uint64_t v8 = [v6 propertySetter];
        if (v8) {
          goto LABEL_13;
        }
        v21 = (_WORD *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
        if (v21) {
          _WORD *v21 = 0;
        }
        break;
      default:
        if (v7 != 123) {
          goto LABEL_20;
        }
        uint64_t v10 = [v6 structName];
        if (([v10 isEqualToString:@"CGSize"] & 1) != 0
          || [v10 isEqualToString:@"NSSize"])
        {
          if ([v6 isReadOnly]) {
            goto LABEL_60;
          }
          uint64_t v11 = [v6 propertySetter];
          if (v11)
          {
            uint64_t v12 = v11;
            v13 = (void (*)(void, uint64_t, double, double))[v6 propertySetterIMP];
            v13(*(void *)(a1 + 32), v12, *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8));
            goto LABEL_60;
          }
          double v22 = (_OWORD *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
          if (v22)
          {
            uint64_t v23 = (_OWORD *)MEMORY[0x1E4F28AE0];
LABEL_48:
            *double v22 = *v23;
          }
        }
        else if (([v10 isEqualToString:@"CGRect"] & 1) != 0 {
               || [v10 isEqualToString:@"NSRect"])
        }
        {
          if (([v6 isReadOnly] & 1) == 0)
          {
            uint64_t v18 = [v6 propertySetter];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = (void (*)(void, uint64_t, double, double, double, double))[v6 propertySetterIMP];
              v20(*(void *)(a1 + 32), v19, *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
            }
            else
            {
              double v27 = (_OWORD *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
              if (v27)
              {
                long long v28 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
                *double v27 = *MEMORY[0x1E4F28AD8];
                v27[1] = v28;
              }
            }
          }
        }
        else if (([v10 isEqualToString:@"CGPoint"] & 1) != 0 {
               || [v10 isEqualToString:@"NSPoint"])
        }
        {
          if (([v6 isReadOnly] & 1) == 0)
          {
            uint64_t v24 = [v6 propertySetter];
            if (v24)
            {
              uint64_t v25 = v24;
              v26 = (void (*)(void, uint64_t, double, double))[v6 propertySetterIMP];
              v26(*(void *)(a1 + 32), v25, *MEMORY[0x1E4F28AD0], *(double *)(MEMORY[0x1E4F28AD0] + 8));
            }
            else
            {
              double v22 = (_OWORD *)[v6 ivarAddrForObject:*(void *)(a1 + 32)];
              if (v22)
              {
                uint64_t v23 = (_OWORD *)MEMORY[0x1E4F28AD0];
                goto LABEL_48;
              }
            }
          }
        }
        else if (!_CPLSilentLogging)
        {
          double v29 = __CPLCodingOSLogDomain();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            int v30 = 138412546;
            id v31 = v5;
            __int16 v32 = 2112;
            double v33 = v10;
            _os_log_impl(&dword_1B4CAC000, v29, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v30, 0x16u);
          }
        }
LABEL_60:

        break;
    }
  }
}

uint64_t __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  if ((void *)a1[4] != a2)
  {
    id v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = a2;
    id v7 = [v5 objectAtIndex:a3];
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
  }
}

void __35__NSObject_CPLCodingProxy__cplHash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 48) cplShouldIgnorePropertyForEquality:v5] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1BA993DF0]();
    __darwin_ct_rune_t v8 = __tolower([v6 propertyType]);
    if (v8 <= 97)
    {
      if (v8 != 35)
      {
        if (v8 == 64)
        {
          v13 = ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v13 cplSpecialHash] ^ v14;
        }
        else
        {
LABEL_10:
          if (!_CPLSilentLogging)
          {
            double v17 = __CPLCodingOSLogDomain();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              int v21 = 138412546;
              id v22 = v5;
              __int16 v23 = 1024;
              int v24 = [v6 propertyType];
              _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v21, 0x12u);
            }
          }
        }
      }
    }
    else
    {
      switch(v8)
      {
        case 'b':
          unsigned int v18 = ((uint64_t (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v11 = *(void *)(v10 + 24);
          unint64_t v12 = v18;
          goto LABEL_17;
        case 'c':
        case 'i':
        case 's':
          int v9 = ((uint64_t (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v11 = *(void *)(v10 + 24);
          unint64_t v12 = v9;
          goto LABEL_17;
        case 'd':
          double v19 = ((double (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v11 = *(void *)(v10 + 24);
          unint64_t v12 = (unint64_t)(v19 * 1000.0);
          goto LABEL_17;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_10;
        case 'f':
          float v20 = ((float (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v11 = *(void *)(v10 + 24);
          unint64_t v12 = (unint64_t)(float)(v20 * 1000.0);
LABEL_17:
          unint64_t v16 = v11 ^ v12;
          goto LABEL_18;
        case 'l':
        case 'q':
          uint64_t v15 = ((uint64_t (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
          unint64_t v16 = *(void *)(v10 + 24) ^ v15;
LABEL_18:
          *(void *)(v10 + 24) = v16;
          break;
        default:
          if (v8 != 123) {
            goto LABEL_10;
          }
          break;
      }
    }
  }
}

void __95__NSObject_CPLCodingProxy__cplProperties_areEqualToPropertiesOf_diffTracker_withEqualityBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = *(void **)(a1 + 32);
  if ((!v9 || [v9 containsObject:v7])
    && ([*(id *)(a1 + 80) cplShouldIgnorePropertyForEquality:v7] & 1) == 0)
  {
    uint64_t v10 = *(void *)(a1 + 64);
    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, void, void, id, uint64_t))(v10 + 16))(v10, *(void *)(a1 + 40), *(void *)(a1 + 48), v7, [v8 propertyGetter]);
    if (v11 == 1)
    {
LABEL_38:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      [*(id *)(a1 + 56) noteObjectsDifferOnProperty:v7];
      *a4 = *(unsigned char *)(a1 + 88);
      goto LABEL_39;
    }
    if (!v11)
    {
LABEL_7:
      __darwin_ct_rune_t v12 = __tolower([v8 propertyType]);
      if (v12 > 97)
      {
        switch(v12)
        {
          case 'b':
          case 'c':
          case 'i':
          case 's':
            int v13 = ((uint64_t (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v13 != ((unsigned int (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38; {
            goto LABEL_39;
            }
          case 'd':
            double v25 = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v25 != ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38; {
            goto LABEL_39;
            }
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_23;
          case 'f':
            float v26 = ((float (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v26 != ((float (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38; {
            goto LABEL_39;
            }
          case 'l':
          case 'q':
            goto LABEL_17;
          default:
            if (v12 != 123) {
              goto LABEL_23;
            }
            uint64_t v14 = [v8 structName];
            if (([v14 isEqualToString:@"CGSize"] & 1) != 0
              || [v14 isEqualToString:@"NSSize"])
            {
              CGFloat v19 = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              CGFloat v21 = v20;
              v50.width = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v50.height = v22;
              v48.width = v19;
              v48.height = v21;
              BOOL v23 = NSEqualSizes(v48, v50);
            }
            else if (([v14 isEqualToString:@"CGRect"] & 1) != 0 {
                   || [v14 isEqualToString:@"NSRect"])
            }
            {
              CGFloat v27 = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              CGFloat v29 = v28;
              CGFloat v31 = v30;
              CGFloat v33 = v32;
              v53.origin.x = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v53.origin.y = v34;
              v53.size.width = v35;
              v53.size.height = v36;
              v52.origin.x = v27;
              v52.origin.y = v29;
              v52.size.width = v31;
              v52.size.height = v33;
              BOOL v23 = NSEqualRects(v52, v53);
            }
            else
            {
              if (([v14 isEqualToString:@"CGPoint"] & 1) == 0
                && ([v14 isEqualToString:@"NSPoint"] & 1) == 0)
              {
                if (!_CPLSilentLogging)
                {
                  id v42 = __CPLCodingOSLogDomain();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    int v43 = 138412546;
                    id v44 = v7;
                    __int16 v45 = 2112;
                    v46 = v14;
                    _os_log_impl(&dword_1B4CAC000, v42, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v43, 0x16u);
                  }
                }
                goto LABEL_32;
              }
              CGFloat v38 = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              CGFloat v40 = v39;
              v51.x = ((double (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v51.y = v41;
              v49.x = v38;
              v49.y = v40;
              BOOL v23 = NSEqualPoints(v49, v51);
            }
            BOOL v37 = v23;

            if (v37) {
              goto LABEL_39;
            }
            break;
        }
        goto LABEL_38;
      }
      if (v12 == 35)
      {
LABEL_17:
        uint64_t v18 = ((uint64_t (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
        if (v18 == ((uint64_t (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_39; {
        goto LABEL_38;
        }
      }
      if (v12 == 64)
      {
        uint64_t v14 = ((void (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
        uint64_t v15 = ((void (*)(void, uint64_t))[v8 propertyGetterIMP])(*(void *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
        if (v14 != (void *)v15)
        {
          unint64_t v16 = (void *)v15;
          if (v15)
          {
            char v17 = [v14 cplSpecialIsEqual:v15];

            if (v17) {
              goto LABEL_39;
            }
          }
          else
          {
          }
          goto LABEL_38;
        }

LABEL_32:
      }
      else
      {
LABEL_23:
        if (!_CPLSilentLogging)
        {
          int v24 = __CPLCodingOSLogDomain();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            int v43 = 138412546;
            id v44 = v7;
            __int16 v45 = 1024;
            LODWORD(v46) = [v8 propertyType];
            _os_log_impl(&dword_1B4CAC000, v24, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v43, 0x12u);
          }
        }
      }
    }
  }
LABEL_39:
}

void __57__NSObject_CPLCodingProxy__cplDecodePropertiesFromCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1BA993DF0]();
  __darwin_ct_rune_t v8 = __tolower([v6 propertyType]);
  if (v8 > 97)
  {
    switch(v8)
    {
      case 'b':
        uint64_t v20 = [*(id *)(a1 + 32) cplDecodeBoolForKey:v5];
        goto LABEL_23;
      case 'c':
        uint64_t v20 = [*(id *)(a1 + 32) cplDecodeCharForKey:v5];
LABEL_23:
        uint64_t v9 = v20;
        if ([v6 isReadOnly]) {
          goto LABEL_57;
        }
        uint64_t v10 = [v6 propertySetter];
        if (v10) {
          goto LABEL_5;
        }
        CGFloat v21 = (unsigned char *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
        if (v21) {
          unsigned char *v21 = v9;
        }
        goto LABEL_57;
      case 'd':
        [*(id *)(a1 + 32) decodeDoubleForKey:v5];
        double v23 = v22;
        if (([v6 isReadOnly] & 1) == 0)
        {
          uint64_t v24 = [v6 propertySetter];
          if (v24)
          {
            ((void (*)(void, uint64_t, double))[v6 propertySetterIMP])(*(void *)(a1 + 40), v24, v23);
          }
          else
          {
            v46 = (double *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
            if (v46) {
              double *v46 = v23;
            }
          }
        }
        goto LABEL_57;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_17;
      case 'f':
        [*(id *)(a1 + 32) decodeFloatForKey:v5];
        float v26 = v25;
        if (([v6 isReadOnly] & 1) == 0)
        {
          uint64_t v27 = [v6 propertySetter];
          if (v27)
          {
            ((void (*)(void, uint64_t, float))[v6 propertySetterIMP])(*(void *)(a1 + 40), v27, v26);
          }
          else
          {
            uint64_t v47 = (float *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
            if (v47) {
              *uint64_t v47 = v26;
            }
          }
        }
        goto LABEL_57;
      case 'i':
        uint64_t v9 = [*(id *)(a1 + 32) decodeInt32ForKey:v5];
        if ([v6 isReadOnly]) {
          goto LABEL_57;
        }
        uint64_t v10 = [v6 propertySetter];
        if (v10) {
          goto LABEL_5;
        }
        NSSize v48 = (_DWORD *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
        if (v48) {
          *NSSize v48 = v9;
        }
        goto LABEL_57;
      case 'l':
      case 'q':
        uint64_t v9 = [*(id *)(a1 + 32) decodeInt64ForKey:v5];
        if ([v6 isReadOnly]) {
          goto LABEL_57;
        }
        uint64_t v10 = [v6 propertySetter];
        if (v10)
        {
LABEL_5:
          ((void (*)(void, uint64_t, uint64_t))[v6 propertySetterIMP])(*(void *)(a1 + 40), v10, v9);
        }
        else
        {
          CGFloat v34 = (uint64_t *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
          if (v34) {
            *CGFloat v34 = v9;
          }
        }
        goto LABEL_57;
      case 's':
        __int16 v28 = [*(id *)(a1 + 32) decodeInt32ForKey:v5];
        if (([v6 isReadOnly] & 1) == 0)
        {
          uint64_t v29 = [v6 propertySetter];
          if (v29)
          {
            ((void (*)(void, uint64_t, void))[v6 propertySetterIMP])(*(void *)(a1 + 40), v29, v28);
          }
          else
          {
            NSPoint v49 = (_WORD *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
            if (v49) {
              *NSPoint v49 = v28;
            }
          }
        }
        goto LABEL_57;
      default:
        if (v8 != 123) {
          goto LABEL_17;
        }
        int v13 = [v6 structName];
        if (([v13 isEqualToString:@"CGSize"] & 1) != 0
          || [v13 isEqualToString:@"NSSize"])
        {
          [*(id *)(a1 + 32) decodeSizeForKey:v5];
          goto LABEL_14;
        }
        if (([v13 isEqualToString:@"CGRect"] & 1) != 0
          || [v13 isEqualToString:@"NSRect"])
        {
          [*(id *)(a1 + 32) decodeRectForKey:v5];
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          double v44 = v43;
          if (([v6 isReadOnly] & 1) == 0)
          {
            uint64_t v45 = [v6 propertySetter];
            if (v45)
            {
              ((void (*)(void, uint64_t, double, double, double, double))[v6 propertySetterIMP])(*(void *)(a1 + 40), v45, v38, v40, v42, v44);
            }
            else
            {
              NSPoint v51 = (double *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
              if (v51)
              {
                *NSPoint v51 = v38;
                v51[1] = v40;
                v51[2] = v42;
                v51[3] = v44;
              }
            }
          }
        }
        else
        {
          if (([v13 isEqualToString:@"CGPoint"] & 1) != 0
            || [v13 isEqualToString:@"NSPoint"])
          {
            [*(id *)(a1 + 32) decodePointForKey:v5];
LABEL_14:
            double v16 = v14;
            double v17 = v15;
            if (([v6 isReadOnly] & 1) == 0)
            {
              uint64_t v18 = [v6 propertySetter];
              if (v18)
              {
                ((void (*)(void, uint64_t, double, double))[v6 propertySetterIMP])(*(void *)(a1 + 40), v18, v16, v17);
              }
              else
              {
                NSSize v50 = (double *)[v6 ivarAddrForObject:*(void *)(a1 + 40)];
                if (v50)
                {
                  *NSSize v50 = v16;
                  v50[1] = v17;
                }
              }
            }
            goto LABEL_54;
          }
          if (!_CPLSilentLogging)
          {
            NSRect v52 = __CPLCodingOSLogDomain();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              int v53 = 138412546;
              id v54 = v5;
              __int16 v55 = 2112;
              id v56 = v13;
              _os_log_impl(&dword_1B4CAC000, v52, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v53, 0x16u);
            }
          }
        }
        break;
    }
    goto LABEL_54;
  }
  if (v8 == 35)
  {
    double v30 = [*(id *)(a1 + 32) decodeObjectForKey:v5];
    int v13 = v30;
    if (v30)
    {
      Class v31 = NSClassFromString(v30);
      if (v31) {
        goto LABEL_46;
      }
      if (!_CPLSilentLogging)
      {
        double v32 = __CPLCodingOSLogDomain();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v53 = 138412546;
          id v54 = v13;
          __int16 v55 = 2112;
          id v56 = v5;
          _os_log_impl(&dword_1B4CAC000, v32, OS_LOG_TYPE_ERROR, "Unable to find class %@ for %@", (uint8_t *)&v53, 0x16u);
        }
      }
    }
    Class v31 = 0;
LABEL_46:
    uint64_t v33 = [v6 propertySetter];
    if (v33) {
      ((void (*)(void, uint64_t, Class))[v6 propertySetterIMP])(*(void *)(a1 + 40), v33, v31);
    }
    else {
      [v6 setIvarValue:v31 forObject:*(void *)(a1 + 40)];
    }
LABEL_54:

    goto LABEL_57;
  }
  if (v8 == 64)
  {
    uint64_t v11 = [v6 propertyClasses];
    __darwin_ct_rune_t v12 = *(void **)(a1 + 32);
    if (v11) {
      [v12 decodeObjectOfClasses:v11 forKey:v5];
    }
    else {
    CGFloat v35 = [v12 decodeObjectForKey:v5];
    }
    uint64_t v36 = [v6 propertySetter];
    if (v36) {
      ((void (*)(void, uint64_t, void *))[v6 propertySetterIMP])(*(void *)(a1 + 40), v36, v35);
    }
    else {
      [v6 setIvarValue:v35 forObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
LABEL_17:
    if (!_CPLSilentLogging)
    {
      CGFloat v19 = __CPLCodingOSLogDomain();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v53 = 138412546;
        id v54 = v5;
        __int16 v55 = 1024;
        LODWORD(v56) = [v6 propertyType];
        _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v53, 0x12u);
      }
    }
  }
LABEL_57:
}

void __57__NSObject_CPLCodingProxy__cplEncodePropertiesWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1BA993DF0]();
  __darwin_ct_rune_t v8 = __tolower([v6 propertyType]);
  if (v8 > 97)
  {
    switch(v8)
    {
      case 'b':
        objc_msgSend(*(id *)(a1 + 40), "encodeBool:forKey:", ((uint64_t (*)(void, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'c':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt:forKey:", ((uint64_t (*)(void, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'd':
        ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
        objc_msgSend(*(id *)(a1 + 40), "encodeDouble:forKey:", v5);
        goto LABEL_24;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_13;
      case 'f':
        ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
        objc_msgSend(*(id *)(a1 + 40), "encodeFloat:forKey:", v5);
        goto LABEL_24;
      case 'i':
      case 's':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt32:forKey:", ((uint64_t (*)(void, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'l':
      case 'q':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt64:forKey:", ((uint64_t (*)(void, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      default:
        if (v8 != 123) {
          goto LABEL_13;
        }
        uint64_t v9 = [v6 structName];
        if (([v9 isEqualToString:@"CGSize"] & 1) != 0
          || [v9 isEqualToString:@"NSSize"])
        {
          ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodeSize:forKey:", v5);
        }
        else if (([v9 isEqualToString:@"CGRect"] & 1) != 0 {
               || [v9 isEqualToString:@"NSRect"])
        }
        {
          ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodeRect:forKey:", v5);
        }
        else if (([v9 isEqualToString:@"CGPoint"] & 1) != 0 {
               || [v9 isEqualToString:@"NSPoint"])
        }
        {
          ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodePoint:forKey:", v5);
        }
        else if (!_CPLSilentLogging)
        {
          double v14 = __CPLCodingOSLogDomain();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v15 = 138412546;
            id v16 = v5;
            __int16 v17 = 2112;
            uint64_t v18 = v9;
            _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v15, 0x16u);
          }
        }
        goto LABEL_23;
    }
  }
  if (v8 == 35)
  {
    __darwin_ct_rune_t v12 = (objc_class *)((uint64_t (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
    int v13 = *(void **)(a1 + 40);
    uint64_t v9 = NSStringFromClass(v12);
    uint64_t v10 = v13;
    goto LABEL_22;
  }
  if (v8 == 64)
  {
    uint64_t v9 = ((void (*)(void, uint64_t))[v6 propertyGetterIMP])(*(void *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
    if (![v9 conformsToProtocol:&unk_1F0D94DE8])
    {
LABEL_23:

      goto LABEL_24;
    }
    uint64_t v10 = *(void **)(a1 + 40);
LABEL_22:
    [v10 encodeObject:v9 forKey:v5];
    goto LABEL_23;
  }
LABEL_13:
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = __CPLCodingOSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412546;
      id v16 = v5;
      __int16 v17 = 1024;
      LODWORD(v18) = [v6 propertyType];
      _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v15, 0x12u);
    }
  }
LABEL_24:
}

void __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)cplAllPropertyNames_propertyNamesPerClass objectForKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v10 = [*(id *)(a1 + 48) _cplPropertyAttributeMap];
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v6 = [v10 allKeys];
    uint64_t v7 = [v5 initWithArray:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [(id)cplAllPropertyNames_propertyNamesPerClass setObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
}

uint64_t __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("cpl.record.coding.properties", 0);
  v1 = (void *)cplAllPropertyNames_lock;
  cplAllPropertyNames_lock = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v3 = cplAllPropertyNames_propertyNamesPerClass;
  cplAllPropertyNames_propertyNamesPerClass = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

void __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)_cplPropertyAttributeMap_propertyMapPerClass objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(a1 + 40) _addPropertyAttributeMapToPropertyMapLocked:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v8 = (void *)_cplPropertyAttributeMap_propertyMapPerClass;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

uint64_t __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("cpl.record.coding", 0);
  v1 = (void *)_cplPropertyAttributeMap_lock;
  _cplPropertyAttributeMap_lock = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v3 = _cplPropertyAttributeMap_propertyMapPerClass;
  _cplPropertyAttributeMap_propertyMapPerClass = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __61__NSObject_CPLCodingProxy__cplShouldIgnorePropertyForCoding___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"description", @"debugDescription", @"hash", @"superclass", 0);
  uint64_t v1 = cplShouldIgnorePropertyForCoding__baseIgnorableProperties;
  cplShouldIgnorePropertyForCoding__baseIgnorableProperties = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end