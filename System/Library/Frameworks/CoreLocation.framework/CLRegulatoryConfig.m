@interface CLRegulatoryConfig
- (BOOL)addConfigForIsoList:(id)a3 config:(id)a4 error:(id *)a5;
- (BOOL)addConfigForRegionList:(id)a3 config:(id)a4 error:(id *)a5;
- (BOOL)setExtendedBorderDetection:(BOOL)a3 withExtendedDistance:(int)a4;
- (CLRegulatoryConfig)initWithQueue:(id)a3 defaultConfig:(id)a4;
- (id).cxx_construct;
- (void)fetchConfigForLocation:(id)a3 withReply:(id)a4;
- (void)fetchInfoForLocation:(id)a3 withReply:(id)a4;
@end

@implementation CLRegulatoryConfig

- (CLRegulatoryConfig)initWithQueue:(id)a3 defaultConfig:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CLRegulatoryConfig;
  if ([(CLRegulatoryConfig *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (BOOL)addConfigForIsoList:(id)a3 config:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  if (a3)
  {
    uint64_t v7 = (uint64_t)a3;
    uint64_t v9 = [a3 count];
    if (a4)
    {
      if (v9)
      {
        value = self->_config.__ptr_.__value_;
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 1uLL);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v12 = [(id)v7 countByEnumeratingWithState:&v68 objects:v72 count:16];
        if (!v12) {
          return 1;
        }
        v61 = (unsigned __int8 **)((char *)value + 16);
        v13 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
        v14 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
        uint64_t v63 = *(void *)v69;
        v60 = DeepCopy;
        while (1)
        {
          uint64_t v15 = 0;
          uint64_t v62 = v12;
          do
          {
            if (*(void *)v69 != v63) {
              objc_enumerationMutation((id)v7);
            }
            v16 = *(void **)(*((void *)&v68 + 1) + 8 * v15);
            if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (*((void *)v13 + 198) != -1) {
                dispatch_once(&qword_1E929F630, &unk_1EE006180);
              }
              v17 = *((void *)v14 + 199);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForIsoList,invalidArgs,ignoring", buf, 2u);
              }
              if (sub_1906CB57C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (*((void *)v13 + 198) != -1) {
                  dispatch_once(&qword_1E929F630, &unk_1EE006180);
                }
                LOWORD(__src[0]) = 0;
                v18 = (char *)_os_log_send_and_compose_impl();
                sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIsoList(CLRegulatoryIsoList, NSDictionary *)", "CoreLocation: %s\n", v18);
                if (v18 != (char *)buf) {
                  free(v18);
                }
              }
              goto LABEL_121;
            }
            sub_1906D5C70(__src, (char *)[v16 UTF8String]);
            if (SHIBYTE(v67) < 0)
            {
              if (!__src[1])
              {
LABEL_35:
                if (*((void *)v13 + 198) != -1) {
                  dispatch_once(&qword_1E929F630, &unk_1EE006180);
                }
                v28 = *((void *)v14 + 199);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906B8000, v28, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForIsoList,emptyIso,ignoring", buf, 2u);
                }
                if (sub_1906CB57C(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (*((void *)v13 + 198) != -1) {
                    dispatch_once(&qword_1E929F630, &unk_1EE006180);
                  }
                  LOWORD(v73) = 0;
                  v29 = (char *)_os_log_send_and_compose_impl();
                  sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIsoList(CLRegulatoryIsoList, NSDictionary *)", "CoreLocation: %s\n", v29);
                  if (v29 != (char *)buf) {
                    free(v29);
                  }
                }
                goto LABEL_119;
              }
              sub_1906C00FC(__p, __src[0], (unint64_t)__src[1]);
            }
            else
            {
              if (!HIBYTE(v67)) {
                goto LABEL_35;
              }
              *(_OWORD *)__p = *(_OWORD *)__src;
              uint64_t v65 = v67;
            }
            if (qword_1EB2713E8 != -1) {
              dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
            }
            v19 = qword_1EB2713E0;
            if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
            {
              v20 = __p;
              if (v65 < 0) {
                v20 = (void **)__p[0];
              }
              *(_DWORD *)buf = 136315138;
              v76 = v20;
              _os_log_impl(&dword_1906B8000, v19, OS_LOG_TYPE_DEFAULT, "#clreg,addConfigForIso,%s", buf, 0xCu);
            }
            uint64_t v21 = v7;
            if (sub_1906CB57C(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1EB2713E8 != -1) {
                dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
              }
              v55 = __p;
              if (v65 < 0) {
                v55 = (void **)__p[0];
              }
              int v73 = 136315138;
              v74 = v55;
              v56 = (char *)_os_log_send_and_compose_impl();
              sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForIso(std::string, NSDictionary *)", "CoreLocation: %s\n", v56);
              if (v56 != (char *)buf) {
                free(v56);
              }
            }
            id v22 = DeepCopy;
            unint64_t v23 = sub_190768DA0((uint64_t)__p);
            unint64_t v24 = v23;
            unint64_t v25 = *((void *)value + 1);
            if (!v25) {
              goto LABEL_58;
            }
            uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v25);
            v26.i16[0] = vaddlv_u8(v26);
            unint64_t v27 = v26.u32[0];
            if (v26.u32[0] > 1uLL)
            {
              uint64_t v7 = v23;
              if (v23 >= v25) {
                uint64_t v7 = v23 % v25;
              }
            }
            else
            {
              uint64_t v7 = (v25 - 1) & v23;
            }
            v30 = *(unsigned __int8 ***)(*(void *)value + 8 * v7);
            if (!v30 || (v31 = *v30) == 0)
            {
LABEL_58:
              v33 = (unsigned __int8 *)operator new(0x30uLL);
              v31 = v33;
              *(void *)v33 = 0;
              *((void *)v33 + 1) = v24;
              if (SHIBYTE(v65) < 0)
              {
                sub_1906C00FC(v33 + 16, __p[0], (unint64_t)__p[1]);
              }
              else
              {
                *((_OWORD *)v33 + 1) = *(_OWORD *)__p;
                *((void *)v33 + 4) = v65;
              }
              *((void *)v31 + 5) = 0;
              float v34 = (float)(unint64_t)(*((void *)value + 3) + 1);
              float v35 = *((float *)value + 8);
              if (!v25 || (float)(v35 * (float)v25) < v34)
              {
                BOOL v36 = (v25 & (v25 - 1)) != 0;
                if (v25 < 3) {
                  BOOL v36 = 1;
                }
                unint64_t v37 = v36 | (2 * v25);
                unint64_t v38 = vcvtps_u32_f32(v34 / v35);
                if (v37 <= v38) {
                  int8x8_t prime = (int8x8_t)v38;
                }
                else {
                  int8x8_t prime = (int8x8_t)v37;
                }
                if (*(void *)&prime == 1)
                {
                  int8x8_t prime = (int8x8_t)2;
                }
                else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                }
                unint64_t v25 = *((void *)value + 1);
                if (*(void *)&prime <= v25)
                {
                  if (*(void *)&prime < v25)
                  {
                    unint64_t v46 = vcvtps_u32_f32((float)*((unint64_t *)value + 3) / *((float *)value + 8));
                    if (v25 < 3
                      || (uint8x8_t v47 = (uint8x8_t)vcnt_s8((int8x8_t)v25), v47.i16[0] = vaddlv_u8(v47), v47.u32[0] > 1uLL))
                    {
                      unint64_t v46 = std::__next_prime(v46);
                    }
                    else
                    {
                      uint64_t v48 = 1 << -(char)__clz(v46 - 1);
                      if (v46 >= 2) {
                        unint64_t v46 = v48;
                      }
                    }
                    if (*(void *)&prime <= v46) {
                      int8x8_t prime = (int8x8_t)v46;
                    }
                    if (*(void *)&prime >= v25)
                    {
                      unint64_t v25 = *((void *)value + 1);
                    }
                    else
                    {
                      if (prime) {
                        goto LABEL_73;
                      }
                      v54 = *(void **)value;
                      *(void *)value = 0;
                      if (v54) {
                        operator delete(v54);
                      }
                      unint64_t v25 = 0;
                      *((void *)value + 1) = 0;
                    }
                  }
                }
                else
                {
LABEL_73:
                  if (*(void *)&prime >> 61) {
                    sub_190718124();
                  }
                  v40 = operator new(8 * *(void *)&prime);
                  v41 = *(void **)value;
                  *(void *)value = v40;
                  if (v41) {
                    operator delete(v41);
                  }
                  uint64_t v42 = 0;
                  *((int8x8_t *)value + 1) = prime;
                  do
                    *(void *)(*(void *)value + 8 * v42++) = 0;
                  while (*(void *)&prime != v42);
                  v43 = *v61;
                  if (*v61)
                  {
                    unint64_t v44 = *((void *)v43 + 1);
                    uint8x8_t v45 = (uint8x8_t)vcnt_s8(prime);
                    v45.i16[0] = vaddlv_u8(v45);
                    if (v45.u32[0] > 1uLL)
                    {
                      if (v44 >= *(void *)&prime) {
                        v44 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v44 &= *(void *)&prime - 1;
                    }
                    *(void *)(*(void *)value + 8 * v44) = v61;
                    v49 = *(unsigned __int8 **)v43;
                    if (*(void *)v43)
                    {
                      do
                      {
                        unint64_t v50 = *((void *)v49 + 1);
                        if (v45.u32[0] > 1uLL)
                        {
                          if (v50 >= *(void *)&prime) {
                            v50 %= *(void *)&prime;
                          }
                        }
                        else
                        {
                          v50 &= *(void *)&prime - 1;
                        }
                        if (v50 != v44)
                        {
                          if (!*(void *)(*(void *)value + 8 * v50))
                          {
                            *(void *)(*(void *)value + 8 * v50) = v43;
                            goto LABEL_98;
                          }
                          *(void *)v43 = *(void *)v49;
                          *(void *)v49 = **(void **)(*(void *)value + 8 * v50);
                          **(void **)(*(void *)value + 8 * v50) = v49;
                          v49 = v43;
                        }
                        unint64_t v50 = v44;
LABEL_98:
                        v43 = v49;
                        v49 = *(unsigned __int8 **)v49;
                        unint64_t v44 = v50;
                      }
                      while (v49);
                    }
                  }
                  unint64_t v25 = (unint64_t)prime;
                }
                if ((v25 & (v25 - 1)) != 0)
                {
                  if (v24 >= v25) {
                    uint64_t v7 = v24 % v25;
                  }
                  else {
                    uint64_t v7 = v24;
                  }
                }
                else
                {
                  uint64_t v7 = (v25 - 1) & v24;
                }
              }
              v51 = *(void **)value;
              v52 = *(unsigned __int8 ***)(*(void *)value + 8 * v7);
              if (v52)
              {
                *(void *)v31 = *v52;
                uint64_t v7 = v21;
                uint64_t v12 = v62;
                v13 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
                v14 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
                goto LABEL_115;
              }
              *(void *)v31 = *v61;
              *v61 = v31;
              v51[v7] = v61;
              uint64_t v7 = v21;
              uint64_t v12 = v62;
              v13 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
              v14 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
              if (*(void *)v31)
              {
                unint64_t v53 = *(void *)(*(void *)v31 + 8);
                if ((v25 & (v25 - 1)) != 0)
                {
                  if (v53 >= v25) {
                    v53 %= v25;
                  }
                }
                else
                {
                  v53 &= v25 - 1;
                }
                v52 = (unsigned __int8 **)(*(void *)value + 8 * v53);
LABEL_115:
                *v52 = v31;
              }
              ++*((void *)value + 3);
              goto LABEL_117;
            }
            while (1)
            {
              unint64_t v32 = *((void *)v31 + 1);
              if (v32 == v24) {
                break;
              }
              if (v27 > 1)
              {
                if (v32 >= v25) {
                  v32 %= v25;
                }
              }
              else
              {
                v32 &= v25 - 1;
              }
              if (v32 != v7)
              {
LABEL_57:
                DeepCopy = v60;
                goto LABEL_58;
              }
LABEL_56:
              v31 = *(unsigned __int8 **)v31;
              if (!v31) {
                goto LABEL_57;
              }
            }
            if (!sub_1907691F0(v31 + 16, (unsigned __int8 *)__p)) {
              goto LABEL_56;
            }
            uint64_t v7 = v21;
            DeepCopy = v60;
            uint64_t v12 = v62;
            v13 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
            v14 = &OBJC_IVAR___CLServiceSession__authorizationRequirement;
LABEL_117:
            *((void *)v31 + 5) = v22;
            if (SHIBYTE(v65) < 0) {
              operator delete(__p[0]);
            }
LABEL_119:
            if (SHIBYTE(v67) < 0) {
              operator delete(__src[0]);
            }
LABEL_121:
            ++v15;
          }
          while (v15 != v12);
          uint64_t v57 = [(id)v7 countByEnumeratingWithState:&v68 objects:v72 count:16];
          uint64_t v12 = v57;
          if (!v57) {
            return 1;
          }
        }
      }
    }
  }
  id v59 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kCLErrorDomainPrivate" code:7 userInfo:0];
  BOOL result = 0;
  *a5 = v59;
  return result;
}

- (BOOL)addConfigForRegionList:(id)a3 config:(id)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  if (a3)
  {
    uint64_t v9 = [a3 count];
    if (a4)
    {
      if (v9)
      {
        value = self->_config.__ptr_.__value_;
        DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 1uLL);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v11 = [a3 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (!v11) {
          return 1;
        }
        uint64_t v12 = *(void *)v56;
        while (1)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v56 != v12) {
              objc_enumerationMutation(a3);
            }
            v14 = *(void **)(*((void *)&v55 + 1) + 8 * v13);
            if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              [v14 radius];
              if (v15 > 0.0)
              {
                if (qword_1EB2713E8 != -1) {
                  dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
                }
                v16 = qword_1EB2713E0;
                if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
                {
                  [v14 center];
                  uint64_t v18 = v17;
                  [v14 center];
                  uint64_t v20 = v19;
                  [v14 radius];
                  *(_DWORD *)buf = 134218496;
                  uint64_t v67 = v18;
                  __int16 v68 = 2048;
                  uint64_t v69 = v20;
                  __int16 v70 = 2048;
                  uint64_t v71 = v21;
                  _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "#clreg,addConfigForCircularRegion,%.6f,%.6f,%.2f", buf, 0x20u);
                }
                if (sub_1906CB57C(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1EB2713E8 != -1) {
                    dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
                  }
                  [v14 center];
                  uint64_t v46 = v45;
                  [v14 center];
                  uint64_t v48 = v47;
                  [v14 radius];
                  int v60 = 134218496;
                  uint64_t v61 = v46;
                  __int16 v62 = 2048;
                  uint64_t v63 = v48;
                  __int16 v64 = 2048;
                  uint64_t v65 = v49;
                  unint64_t v50 = (char *)_os_log_send_and_compose_impl();
                  sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForCircularRegion(CLCircularRegion *, NSDictionary *)", "CoreLocation: %s\n", v50);
                  if (v50 != (char *)buf) {
                    free(v50);
                  }
                }
                [v14 center];
                uint64_t v23 = v22;
                [v14 center];
                uint64_t v25 = v24;
                [v14 radius];
                uint64_t v27 = v26;
                id v28 = DeepCopy;
                id v29 = v28;
                v31 = (char *)*((void *)value + 6);
                unint64_t v30 = *((void *)value + 7);
                if ((unint64_t)v31 >= v30)
                {
                  float v35 = (char *)*((void *)value + 5);
                  uint64_t v36 = (v31 - v35) >> 5;
                  unint64_t v37 = v36 + 1;
                  if ((unint64_t)(v36 + 1) >> 59) {
                    sub_190718FD4();
                  }
                  uint64_t v38 = v30 - (void)v35;
                  if (v38 >> 4 > v37) {
                    unint64_t v37 = v38 >> 4;
                  }
                  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0) {
                    unint64_t v39 = 0x7FFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v39 = v37;
                  }
                  if (v39)
                  {
                    if (v39 >> 59) {
                      sub_190718124();
                    }
                    v40 = (char *)operator new(32 * v39);
                  }
                  else
                  {
                    v40 = 0;
                  }
                  v41 = &v40[32 * v36];
                  *(void *)v41 = v23;
                  *((void *)v41 + 1) = v25;
                  *((void *)v41 + 2) = v27;
                  *((void *)v41 + 3) = v29;
                  uint64_t v42 = v41;
                  if (v31 != v35)
                  {
                    do
                    {
                      long long v43 = *((_OWORD *)v31 - 1);
                      *((_OWORD *)v42 - 2) = *((_OWORD *)v31 - 2);
                      *((_OWORD *)v42 - 1) = v43;
                      v42 -= 32;
                      v31 -= 32;
                    }
                    while (v31 != v35);
                    v31 = (char *)*((void *)value + 5);
                  }
                  unint64_t v32 = v41 + 32;
                  *((void *)value + 5) = v42;
                  *((void *)value + 6) = v41 + 32;
                  *((void *)value + 7) = &v40[32 * v39];
                  if (v31) {
                    operator delete(v31);
                  }
                }
                else
                {
                  *(void *)v31 = v23;
                  *((void *)v31 + 1) = v25;
                  *((void *)v31 + 2) = v27;
                  unint64_t v32 = v31 + 32;
                  *((void *)v31 + 3) = v28;
                }
                *((void *)value + 6) = v32;
                goto LABEL_24;
              }
              if (qword_1E929F630 != -1) {
                dispatch_once(&qword_1E929F630, &unk_1EE006180);
              }
              float v34 = qword_1E929F638;
              if (os_log_type_enabled((os_log_t)qword_1E929F638, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v34, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForCircularRegionList,invalidRadius,ignoring", buf, 2u);
              }
              if (sub_1906CB57C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F630 == -1)
                {
LABEL_50:
                  LOWORD(v60) = 0;
                  unint64_t v44 = (char *)_os_log_send_and_compose_impl();
                  sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::addConfigForCircularRegionList(CLRegulatoryCircularRegionList, NSDictionary *)", "CoreLocation: %s\n", v44);
                  if (v44 != (char *)buf) {
                    free(v44);
                  }
                  goto LABEL_24;
                }
LABEL_56:
                dispatch_once(&qword_1E929F630, &unk_1EE006180);
                goto LABEL_50;
              }
            }
            else
            {
              if (qword_1E929F630 != -1) {
                dispatch_once(&qword_1E929F630, &unk_1EE006180);
              }
              v33 = qword_1E929F638;
              if (os_log_type_enabled((os_log_t)qword_1E929F638, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906B8000, v33, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,addConfigForCircularRegionList,invalidArgs,ignoring", buf, 2u);
              }
              if (sub_1906CB57C(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1E929F630 == -1) {
                  goto LABEL_50;
                }
                goto LABEL_56;
              }
            }
LABEL_24:
            ++v13;
          }
          while (v13 != v11);
          uint64_t v51 = [a3 countByEnumeratingWithState:&v55 objects:v59 count:16];
          uint64_t v11 = v51;
          if (!v51) {
            return 1;
          }
        }
      }
    }
  }
  id v53 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"kCLErrorDomainPrivate" code:7 userInfo:0];
  BOOL result = 0;
  *a5 = v53;
  return result;
}

- (void)fetchConfigForLocation:(id)a3 withReply:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  value = self->_config.__ptr_.__value_;
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    uint64_t v17 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v17, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,#warning,location is nil", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      *(_WORD *)long long v56 = 0;
      unint64_t v50 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v50);
      if (v50 != buf) {
        free(v50);
      }
    }
    double v15 = *((void *)value + 8);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    v16 = sub_190764A44;
    goto LABEL_20;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
  }
  uint64_t v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a3 horizontalAccuracy];
    *(_DWORD *)buf = 134284033;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2049;
    uint64_t v61 = v12;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,%{private}.6f,%{private}.6f,%{private}.2f", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    [a3 coordinate];
    uint64_t v45 = v44;
    [a3 coordinate];
    uint64_t v47 = v46;
    [a3 horizontalAccuracy];
    *(_DWORD *)long long v56 = 134284033;
    *(void *)&v56[4] = v45;
    *(_WORD *)&v56[12] = 2049;
    *(void *)&v56[14] = v47;
    *(_WORD *)&v56[22] = 2049;
    long long v57 = v48;
    uint64_t v49 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v49);
    if (v49 != buf) {
      free(v49);
    }
  }
  [a3 horizontalAccuracy];
  if (v13 < 0.0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "#clreg,fetchConfigForLocation,#warning,invalidAccuracy", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      *(_WORD *)long long v56 = 0;
      uint64_t v51 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchConfigForLocation(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v51);
      if (v51 != buf) {
        free(v51);
      }
    }
    double v15 = *((void *)value + 8);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    v16 = sub_190764A58;
LABEL_20:
    *(void *)&buf[16] = v16;
    uint64_t v61 = &unk_1E5697770;
    *((void *)&v62 + 1) = value;
LABEL_21:
    *(void *)&long long v62 = a4;
    uint64_t v18 = buf;
LABEL_22:
    dispatch_async(v15, v18);
    return;
  }
  long long v55 = value;
  uint64_t v20 = (double *)*((void *)value + 5);
  uint64_t v19 = (double *)*((void *)value + 6);
  if (v20 != v19)
  {
    while (1)
    {
      [a3 coordinate];
      double v22 = v21;
      [a3 coordinate];
      double v24 = sub_1906D7AA4(v22, v23, *v20, v20[1]);
      double v25 = v20[2];
      [a3 horizontalAccuracy];
      if (v24 < v25 + v26) {
        break;
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      uint64_t v27 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        double v28 = *v20;
        uint64_t v29 = *((void *)v20 + 1);
        unint64_t v30 = (void *)*((void *)v20 + 2);
        *(_DWORD *)buf = 134284289;
        *(double *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2049;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2049;
        uint64_t v61 = v30;
        LOWORD(v62) = 2049;
        *(double *)((char *)&v62 + 2) = v24;
        _os_log_impl(&dword_1906B8000, v27, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,notFound", buf, 0x2Au);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
        }
        v31 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v31);
        if (v31 != buf) {
          free(v31);
        }
      }
      v20 += 4;
      if (v20 == v19) {
        goto LABEL_36;
      }
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    unint64_t v39 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      double v40 = *v20;
      uint64_t v41 = *((void *)v20 + 1);
      uint64_t v42 = (void *)*((void *)v20 + 2);
      *(_DWORD *)buf = 134284289;
      *(double *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2049;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2049;
      uint64_t v61 = v42;
      LOWORD(v62) = 2049;
      *(double *)((char *)&v62 + 2) = v24;
      _os_log_impl(&dword_1906B8000, v39, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,found", buf, 0x2Au);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      id v53 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v53);
      if (v53 != buf) {
        free(v53);
      }
    }
    double v15 = *((void *)v55 + 8);
    *(void *)long long v56 = MEMORY[0x1E4F143A8];
    *(void *)&v56[8] = 3221225472;
    *(void *)&v56[16] = sub_190762BE8;
    long long v57 = &unk_1E5697770;
    id v58 = a4;
    uint64_t v59 = (uint64_t)v20;
    uint64_t v18 = v56;
    goto LABEL_22;
  }
LABEL_36:
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
  }
  unint64_t v32 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v32, OS_LOG_TYPE_DEBUG, "#clreg,fetchRAEConfig,no RAEs matched", buf, 2u);
  }
  uint64_t v33 = (uint64_t)v55;
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    v52 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "BOOL CLRegulatoryConfigInternal::fetchRAEConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v52);
    if (v52 != buf) {
      free(v52);
    }
    uint64_t v33 = (uint64_t)v55;
  }
  id v34 = sub_190762DC0(a3);
  if (!v34)
  {
    if (qword_1E929F630 != -1) {
      dispatch_once(&qword_1E929F630, &unk_1EE006180);
    }
    long long v43 = qword_1E929F638;
    if (os_log_type_enabled((os_log_t)qword_1E929F638, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v43, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,fetchIsoOrDefaultConfig,geoLocationAllocFailed", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F630 != -1) {
        dispatch_once(&qword_1E929F630, &unk_1EE006180);
      }
      *(_WORD *)long long v56 = 0;
      v54 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchIsoOrDefaultConfig(CLLocation *, CLRegulatoryConfigCallback)", "CoreLocation: %s\n", v54);
      if (v54 != buf) {
        free(v54);
      }
      uint64_t v33 = (uint64_t)v55;
    }
    double v15 = *(NSObject **)(v33 + 64);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_190764270;
    uint64_t v61 = &unk_1E5697770;
    *((void *)&v62 + 1) = v33;
    goto LABEL_21;
  }
  float v35 = v34;
  [v34 horizontalAccuracy];
  *(void *)long long v56 = MEMORY[0x1E4F143A8];
  *(void *)&v56[8] = 3221225472;
  *(void *)&v56[16] = sub_190764284;
  long long v57 = &unk_1E56977C0;
  id v58 = a4;
  uint64_t v59 = v33;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_19076449C;
  uint64_t v61 = &unk_1E5697810;
  *((void *)&v62 + 1) = a4;
  uint64_t v63 = v33;
  *(void *)&long long v62 = v35;
  int v64 = (int)v36;
  int v37 = *(_DWORD *)(v33 + 80);
  if (v37 <= (int)v36)
  {
    uint64_t v38 = v56;
  }
  else
  {
    [v35 setHorizontalAccuracy:(double)v37];
    uint64_t v38 = buf;
  }
  sub_190763518(v33, v35, (uint64_t)v38);
}

- (void)fetchInfoForLocation:(id)a3 withReply:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  value = self->_config.__ptr_.__value_;
  if (!a3)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    double v15 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,#warning,location is nil", buf, 2u);
    }
    if (!sub_1906CB57C(115, 2)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    *(_WORD *)id v58 = 0;
    goto LABEL_69;
  }
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
  }
  uint64_t v7 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a3 horizontalAccuracy];
    *(_DWORD *)buf = 134284033;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2049;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2049;
    long long v62 = v12;
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,%{private}.6f,%{private}.6f,%{private}.2f", buf, 0x20u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    [a3 coordinate];
    uint64_t v47 = v46;
    [a3 coordinate];
    uint64_t v49 = v48;
    [a3 horizontalAccuracy];
    *(_DWORD *)id v58 = 134284033;
    *(void *)&v58[4] = v47;
    *(_WORD *)&v58[12] = 2049;
    *(void *)&v58[14] = v49;
    *(_WORD *)&v58[22] = 2049;
    uint64_t v59 = v50;
    uint64_t v51 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchInfoForLocation(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v51);
    if (v51 != buf) {
      free(v51);
    }
  }
  [a3 horizontalAccuracy];
  if (v13 < 0.0)
  {
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    v14 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v14, OS_LOG_TYPE_DEFAULT, "#clreg,fetchInfoForLocation,#warning,invalidAccuracy", buf, 2u);
    }
    if (!sub_1906CB57C(115, 2)) {
      goto LABEL_21;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    *(_WORD *)id v58 = 0;
LABEL_69:
    v52 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::fetchInfoForLocation(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v52);
    if (v52 != buf) {
      free(v52);
    }
LABEL_21:
    v16 = *((void *)value + 8);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_190764A6C;
    long long v62 = &unk_1E5697770;
    *(void *)&long long v63 = a4;
    *((void *)&v63 + 1) = value;
LABEL_22:
    dispatch_async(v16, buf);
    return;
  }
  uint64_t v18 = *((void *)value + 5);
  uint64_t v17 = *((void *)value + 6);
  if (v18 != v17)
  {
    while (1)
    {
      [a3 coordinate];
      double v20 = v19;
      [a3 coordinate];
      double v22 = sub_1906D7AA4(v20, v21, *(double *)v18, *(double *)(v18 + 8));
      double v23 = *(double *)(v18 + 16);
      [a3 horizontalAccuracy];
      if (v22 < v23 + v24) {
        break;
      }
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      double v25 = qword_1EB2713E0;
      if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
      {
        double v26 = *(double *)v18;
        uint64_t v27 = *(void *)(v18 + 8);
        double v28 = *(void **)(v18 + 16);
        *(_DWORD *)buf = 134284289;
        *(double *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2049;
        *(void *)&buf[14] = v27;
        *(_WORD *)&buf[22] = 2049;
        long long v62 = v28;
        LOWORD(v63) = 2049;
        *(double *)((char *)&v63 + 2) = v22;
        _os_log_impl(&dword_1906B8000, v25, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,notFound", buf, 0x2Au);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EB2713E8 != -1) {
          dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
        }
        double v29 = *(double *)v18;
        uint64_t v30 = *(void *)(v18 + 8);
        v31 = *(void **)(v18 + 16);
        *(_DWORD *)id v58 = 134284289;
        *(double *)&v58[4] = v29;
        *(_WORD *)&v58[12] = 2049;
        *(void *)&v58[14] = v30;
        *(_WORD *)&v58[22] = 2049;
        uint64_t v59 = v31;
        LOWORD(v60) = 2049;
        *(double *)((char *)&v60 + 2) = v22;
        unint64_t v32 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v32);
        if (v32 != buf) {
          free(v32);
        }
      }
      v18 += 32;
      if (v18 == v17) {
        goto LABEL_36;
      }
    }
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    unint64_t v39 = qword_1EB2713E0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
    {
      double v40 = *(double *)v18;
      uint64_t v41 = *(void *)(v18 + 8);
      uint64_t v42 = *(void **)(v18 + 16);
      *(_DWORD *)buf = 134284289;
      *(double *)&uint8_t buf[4] = v40;
      *(_WORD *)&buf[12] = 2049;
      *(void *)&buf[14] = v41;
      *(_WORD *)&buf[22] = 2049;
      long long v62 = v42;
      LOWORD(v63) = 2049;
      *(double *)((char *)&v63 + 2) = v22;
      _os_log_impl(&dword_1906B8000, v39, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,%{private}.6f,%{private}.6f,%{private}.2f,distToLocation,%{private}2.f,result,found", buf, 0x2Au);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713E8 != -1) {
        dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
      }
      double v54 = *(double *)v18;
      uint64_t v55 = *(void *)(v18 + 8);
      long long v56 = *(void **)(v18 + 16);
      *(_DWORD *)id v58 = 134284289;
      *(double *)&v58[4] = v54;
      *(_WORD *)&v58[12] = 2049;
      *(void *)&v58[14] = v55;
      *(_WORD *)&v58[22] = 2049;
      uint64_t v59 = v56;
      LOWORD(v60) = 2049;
      *(double *)((char *)&v60 + 2) = v22;
      long long v57 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v57);
      if (v57 != buf) {
        free(v57);
      }
    }
    uint64_t v43 = *(void *)(v18 + 24);
    v16 = *((void *)value + 8);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_190764A8C;
    long long v62 = &unk_1E5696D30;
    *(void *)&long long v63 = v43;
    *((void *)&v63 + 1) = a4;
    goto LABEL_22;
  }
LABEL_36:
  if (qword_1EB2713E8 != -1) {
    dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
  }
  uint64_t v33 = qword_1EB2713E0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713E0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v33, OS_LOG_TYPE_DEBUG, "#clreg,findRAEConfig,no RAEs matched", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713E8 != -1) {
      dispatch_once(&qword_1EB2713E8, &unk_1EE005840);
    }
    *(_WORD *)id v58 = 0;
    id v53 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "const CLRegulatoryConfigInternal::CircularZoneConfig *CLRegulatoryConfigInternal::findRAEConfig(CLLocation *)", "CoreLocation: %s\n", v53);
    if (v53 != buf) {
      free(v53);
    }
  }
  id v34 = sub_190762DC0(a3);
  if (!v34)
  {
    if (qword_1E929F630 != -1) {
      dispatch_once(&qword_1E929F630, &unk_1EE006180);
    }
    uint64_t v44 = qword_1E929F638;
    if (os_log_type_enabled((os_log_t)qword_1E929F638, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v44, OS_LOG_TYPE_DEFAULT, "#clreg,#warning,fetchIsoOrDefaultConfig,geoLocationAllocFailed", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F630 != -1) {
        dispatch_once(&qword_1E929F630, &unk_1EE006180);
      }
      *(_WORD *)id v58 = 0;
      uint64_t v45 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "void CLRegulatoryConfigInternal::sendIsoOrDefaultInfo(CLLocation *, CLRegulatoryInfoCallback)", "CoreLocation: %s\n", v45);
      if (v45 != buf) {
        free(v45);
      }
    }
    goto LABEL_21;
  }
  float v35 = v34;
  [v34 horizontalAccuracy];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_190766010;
  long long v62 = &unk_1E56978B0;
  *((void *)&v63 + 1) = a4;
  int v64 = value;
  *(void *)&long long v63 = v35;
  int v65 = (int)v36;
  int v37 = *((_DWORD *)value + 20);
  if (v37 <= (int)v36)
  {
    *(void *)id v58 = MEMORY[0x1E4F143A8];
    *(void *)&v58[8] = 3221225472;
    *(void *)&v58[16] = sub_190766234;
    uint64_t v59 = &unk_1E56978D8;
    *(void *)&long long v60 = a4;
    *((void *)&v60 + 1) = value;
    uint64_t v38 = v58;
  }
  else
  {
    [v35 setHorizontalAccuracy:(double)v37];
    uint64_t v38 = buf;
  }
  sub_19076525C((uint64_t)value, v35, (uint64_t)v38);
}

- (BOOL)setExtendedBorderDetection:(BOOL)a3 withExtendedDistance:(int)a4
{
  if (!a3) {
    a4 = 0;
  }
  *((_DWORD *)self->_config.__ptr_.__value_ + 20) = a4;
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end