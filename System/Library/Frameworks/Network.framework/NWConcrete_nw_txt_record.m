@interface NWConcrete_nw_txt_record
- (NSString)description;
- (NWConcrete_nw_txt_record)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_txt_record

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  return self;
}

- (NSString)description
{
  uint64_t v3 = *((void *)self + 2);
  size_t v4 = v3 + 2;
  if (v3 == -2)
  {
    v30 = __nwlog_obj();
    os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    int v64 = 12;
    v31 = (void *)_os_log_send_and_compose_impl();

    result = (NSString *)__nwlog_abort((uint64_t)v31);
    if (result) {
      goto LABEL_71;
    }
    free(v31);
  }
  v5 = (char *)malloc_type_malloc(v4, 0xF2B69DE5uLL);
  if (!v5)
  {
    v33 = __nwlog_obj();
    os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    int v64 = 22;
    v34 = (void *)_os_log_send_and_compose_impl();

    result = (NSString *)__nwlog_abort((uint64_t)v34);
    if (!result)
    {
      free(v34);
      if ((*((unsigned char *)self + 36) & 1) == 0)
      {
LABEL_4:
        uint64_t v6 = *((void *)self + 2);
        if (v6 < 1)
        {
LABEL_26:
          uint64_t v29 = v6 + 1;
          goto LABEL_66;
        }
        v7 = (int8x16_t *)*((void *)self + 1);
        v8 = &v7->i8[v6];
        if (&v7->i8[v6] <= &v7->i8[1]) {
          v8 = &v7->i8[1];
        }
        unint64_t v9 = v8 - (__int8 *)v7;
        if (v9 < 8)
        {
          v10 = (unsigned __int8 *)*((void *)self + 1);
          v11 = v5;
          goto LABEL_21;
        }
        v10 = (unsigned __int8 *)*((void *)self + 1);
        v11 = v5;
        if ((unint64_t)(v5 - (char *)v7 + 1) >= 0x20)
        {
          if (v9 < 0x20)
          {
            unint64_t v12 = 0;
            goto LABEL_16;
          }
          unint64_t v12 = v9 & 0xFFFFFFFFFFFFFFE0;
          v13 = (int8x16_t *)(v5 + 17);
          v14 = v7 + 1;
          v15.i64[0] = 0x8181818181818181;
          v15.i64[1] = 0x8181818181818181;
          v16.i64[0] = 0xA1A1A1A1A1A1A1A1;
          v16.i64[1] = 0xA1A1A1A1A1A1A1A1;
          v17.i64[0] = 0x2E2E2E2E2E2E2E2ELL;
          v17.i64[1] = 0x2E2E2E2E2E2E2E2ELL;
          unint64_t v18 = v9 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            int8x16_t v19 = vbslq_s8((int8x16_t)vcgtq_u8(v16, (uint8x16_t)vaddq_s8(*v14, v15)), v17, *v14);
            v13[-1] = vbslq_s8((int8x16_t)vcgtq_u8(v16, (uint8x16_t)vaddq_s8(v14[-1], v15)), v17, v14[-1]);
            int8x16_t *v13 = v19;
            v13 += 2;
            v14 += 2;
            v18 -= 32;
          }
          while (v18);
          if (v9 == v12) {
            goto LABEL_25;
          }
          if ((v9 & 0x18) != 0)
          {
LABEL_16:
            unint64_t v20 = v9 & 0xFFFFFFFFFFFFFFF8;
            v10 = &v7->u8[v9 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v21 = v12 - (v9 & 0xFFFFFFFFFFFFFFF8);
            v22 = (int8x8_t *)&v5[v12 + 1];
            v23 = (int8x8_t *)&v7->i8[v12];
            do
            {
              int8x8_t v24 = *v23++;
              *v22++ = vbsl_s8((int8x8_t)vcgt_u8((uint8x8_t)0xA1A1A1A1A1A1A1A1, (uint8x8_t)vadd_s8(v24, (int8x8_t)0x8181818181818181)), (int8x8_t)0x2E2E2E2E2E2E2E2ELL, v24);
              v21 += 8;
            }
            while (v21);
            if (v9 != v20)
            {
              v11 = &v5[v20];
              goto LABEL_21;
            }
LABEL_25:
            uint64_t v6 = *((void *)self + 2);
            goto LABEL_26;
          }
          v11 = &v5[v12];
          v10 = &v7->u8[v12];
        }
LABEL_21:
        unint64_t v25 = (unint64_t)v7->u64 + v6;
        v26 = v11 + 1;
        do
        {
          int v28 = *v10++;
          char v27 = v28;
          if ((v28 - 127) < 0xFFFFFFA1) {
            char v27 = 46;
          }
          *v26++ = v27;
        }
        while ((unint64_t)v10 < v25);
        goto LABEL_25;
      }
      goto LABEL_31;
    }
LABEL_71:
    __break(1u);
    return result;
  }
  if ((*((unsigned char *)self + 36) & 1) == 0) {
    goto LABEL_4;
  }
LABEL_31:
  uint64_t v29 = *((void *)self + 2);
  if (v29 == 1)
  {
    v35 = &stru_1ECF695B0;
    if (v5) {
      goto LABEL_67;
    }
    goto LABEL_68;
  }
  if (v29 < 1) {
    goto LABEL_66;
  }
  v36 = (unsigned __int8 *)*((void *)self + 1);
  v37 = &v36[v29];
  v38.i64[0] = 0x8181818181818181;
  v38.i64[1] = 0x8181818181818181;
  v39.i64[0] = 0xA1A1A1A1A1A1A1A1;
  v39.i64[1] = 0xA1A1A1A1A1A1A1A1;
  v40.i64[0] = 0x2E2E2E2E2E2E2E2ELL;
  v40.i64[1] = 0x2E2E2E2E2E2E2E2ELL;
  v41 = v5;
  do
  {
    char *v41 = 10;
    uint64_t v43 = *v36;
    if (!*v36)
    {
      uint64_t v42 = 1;
      goto LABEL_37;
    }
    uint64_t v42 = v43 + 1;
    if (v43 < 8 || (unint64_t)(v41 - (char *)v36) <= 0x1F)
    {
      uint64_t v45 = 1;
      goto LABEL_60;
    }
    if (v43 < 0x20)
    {
      uint64_t v46 = 0;
LABEL_55:
      uint64_t v54 = v43 & 0xF8;
      uint64_t v55 = v46 - v54;
      v56 = (int8x8_t *)&v41[v46 + 1];
      v57 = (int8x8_t *)&v36[v46 + 1];
      do
      {
        int8x8_t v58 = *v57++;
        *v56++ = vbsl_s8((int8x8_t)vcgt_u8((uint8x8_t)0xA1A1A1A1A1A1A1A1, (uint8x8_t)vadd_s8(v58, (int8x8_t)0x8181818181818181)), (int8x8_t)0x2E2E2E2E2E2E2E2ELL, v58);
        v55 += 8;
      }
      while (v55);
      if (v54 == v43) {
        goto LABEL_37;
      }
      uint64_t v45 = v54 | 1;
      goto LABEL_60;
    }
    uint64_t v46 = v43 & 0xE0;
    int8x16_t v47 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 17), v38)), v40, *(int8x16_t *)(v36 + 17));
    *(int8x16_t *)(v41 + 1) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 1), v38)), v40, *(int8x16_t *)(v36 + 1));
    *(int8x16_t *)(v41 + 17) = v47;
    if (v46 != 32)
    {
      int8x16_t v48 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 49), v38)), v40, *(int8x16_t *)(v36 + 49));
      *(int8x16_t *)(v41 + 33) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 33), v38)), v40, *(int8x16_t *)(v36 + 33));
      *(int8x16_t *)(v41 + 49) = v48;
      if (v46 != 64)
      {
        int8x16_t v49 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 81), v38)), v40, *(int8x16_t *)(v36 + 81));
        *(int8x16_t *)(v41 + 65) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 65), v38)), v40, *(int8x16_t *)(v36 + 65));
        *(int8x16_t *)(v41 + 81) = v49;
        if (v46 != 96)
        {
          int8x16_t v50 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 113), v38)), v40, *(int8x16_t *)(v36 + 113));
          *(int8x16_t *)(v41 + 97) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 97), v38)), v40, *(int8x16_t *)(v36 + 97));
          *(int8x16_t *)(v41 + 113) = v50;
          if (v46 != 128)
          {
            int8x16_t v51 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 145), v38)), v40, *(int8x16_t *)(v36 + 145));
            *(int8x16_t *)(v41 + 129) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 129), v38)), v40, *(int8x16_t *)(v36 + 129));
            *(int8x16_t *)(v41 + 145) = v51;
            if (v46 != 160)
            {
              int8x16_t v52 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 177), v38)), v40, *(int8x16_t *)(v36 + 177));
              *(int8x16_t *)(v41 + 161) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 161), v38)), v40, *(int8x16_t *)(v36 + 161));
              *(int8x16_t *)(v41 + 177) = v52;
              if (v46 != 192)
              {
                int8x16_t v53 = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 209), v38)), v40, *(int8x16_t *)(v36 + 209));
                *(int8x16_t *)(v41 + 193) = vbslq_s8((int8x16_t)vcgtq_u8(v39, (uint8x16_t)vaddq_s8(*(int8x16_t *)(v36 + 193), v38)), v40, *(int8x16_t *)(v36 + 193));
                *(int8x16_t *)(v41 + 209) = v53;
              }
            }
          }
        }
      }
    }
    if (v46 != v43)
    {
      if ((v43 & 0x18) != 0) {
        goto LABEL_55;
      }
      uint64_t v45 = v46 | 1;
LABEL_60:
      uint64_t v59 = v43 - v45 + 1;
      v60 = &v41[v45];
      v61 = &v36[v45];
      do
      {
        int v63 = *v61++;
        char v62 = v63;
        if ((v63 - 127) < 0xFFFFFFA1) {
          char v62 = 46;
        }
        *v60++ = v62;
        --v59;
      }
      while (v59);
    }
LABEL_37:
    v36 += v42;
    v41 += v42;
  }
  while (v36 < v37);
  uint64_t v29 = *((void *)self + 2);
LABEL_66:
  v5[v29] = 0;
  v35 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%s", v5 + 1, v64);
LABEL_67:
  free(v5);
LABEL_68:

  return (NSString *)v35;
}

- (void)dealloc
{
  uint64_t v3 = (void *)*((void *)self + 1);
  if (v3)
  {
    free(v3);
    *((void *)self + 1) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NWConcrete_nw_txt_record;
  [(NWConcrete_nw_txt_record *)&v4 dealloc];
}

- (NWConcrete_nw_txt_record)init
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NWConcrete_nw_txt_record;
  v2 = [(NWConcrete_nw_txt_record *)&v16 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_super v4 = v2;
    goto LABEL_3;
  }
  uint64_t v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  unint64_t v18 = "-[NWConcrete_nw_txt_record init]";
  v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v14 = 0;
  if (__nwlog_fault(v7, &type, &v14))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        unint64_t v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v14)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v8 = __nwlog_obj();
      os_log_type_t v11 = type;
      BOOL v12 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v12)
        {
          *(_DWORD *)buf = 136446466;
          unint64_t v18 = "-[NWConcrete_nw_txt_record init]";
          __int16 v19 = 2082;
          unint64_t v20 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_20;
      }
      if (v12)
      {
        *(_DWORD *)buf = 136446210;
        unint64_t v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_1830D4000, v8, v11, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v8 = __nwlog_obj();
      os_log_type_t v13 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        unint64_t v18 = "-[NWConcrete_nw_txt_record init]";
        _os_log_impl(&dword_1830D4000, v8, v13, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
LABEL_3:

  return v3;
}

@end