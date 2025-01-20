void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ATXHeroDataXPCInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C636438];
  v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_donateHeroAppPredictions_completion_ argumentIndex:0 ofReply:0];

  return v0;
}

uint64_t ATXPBHeroAppPredictionReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 116) |= 2u;
          uint64_t v18 = *v3;
          unint64_t v19 = *(void *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v19);
            *(void *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v66 = 16;
          goto LABEL_107;
        case 2u:
          *(_WORD *)(a1 + 116) |= 8u;
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v66 = 32;
          goto LABEL_107;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_68;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
          while (2)
          {
            uint64_t v29 = *v3;
            uint64_t v30 = *(void *)(a2 + v29);
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v30);
              *(void *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                BOOL v15 = v27++ >= 9;
                if (v15)
                {
                  uint64_t v28 = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v28 = 0;
          }
LABEL_79:
          *(unsigned char *)(a1 + 112) = v28 != 0;
          continue;
        case 5u:
          *(_WORD *)(a1 + 116) |= 0x100u;
          uint64_t v33 = *v3;
          unint64_t v34 = *(void *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v34);
            *(void *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v66 = 72;
          goto LABEL_107;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_68;
        case 7u:
          uint64_t v24 = PBReaderReadData();
          uint64_t v25 = 88;
          goto LABEL_68;
        case 8u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
          while (2)
          {
            uint64_t v38 = *v3;
            uint64_t v39 = *(void *)(a2 + v38);
            unint64_t v40 = v39 + 1;
            if (v39 == -1 || v40 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                BOOL v15 = v36++ >= 9;
                if (v15)
                {
                  uint64_t v37 = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v37 = 0;
          }
LABEL_83:
          uint64_t v65 = 8;
          goto LABEL_96;
        case 9u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
          while (2)
          {
            uint64_t v44 = *v3;
            uint64_t v45 = *(void *)(a2 + v44);
            unint64_t v46 = v45 + 1;
            if (v45 == -1 || v46 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v45);
              *(void *)(a2 + v44) = v46;
              v37 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                BOOL v15 = v43++ >= 9;
                if (v15)
                {
                  uint64_t v37 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v37 = 0;
          }
LABEL_87:
          uint64_t v65 = 64;
          goto LABEL_96;
        case 0xAu:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
          while (2)
          {
            uint64_t v50 = *v3;
            uint64_t v51 = *(void *)(a2 + v50);
            unint64_t v52 = v51 + 1;
            if (v51 == -1 || v52 > *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v51);
              *(void *)(a2 + v50) = v52;
              v37 |= (unint64_t)(v53 & 0x7F) << v48;
              if (v53 < 0)
              {
                v48 += 7;
                BOOL v15 = v49++ >= 9;
                if (v15)
                {
                  uint64_t v37 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v37 = 0;
          }
LABEL_91:
          uint64_t v65 = 56;
          goto LABEL_96;
        case 0xBu:
          *(_WORD *)(a1 + 116) |= 4u;
          uint64_t v54 = *v3;
          unint64_t v55 = *(void *)(a2 + v54);
          if (v55 <= 0xFFFFFFFFFFFFFFF7 && v55 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v55);
            *(void *)(a2 + v54) = v55 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v66 = 24;
          goto LABEL_107;
        case 0xCu:
          *(_WORD *)(a1 + 116) |= 0x10u;
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v20 = *(void *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v57 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v20 = 0;
          }
          uint64_t v66 = 40;
LABEL_107:
          *(void *)(a1 + v66) = v20;
          continue;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
LABEL_68:
          v58 = *(void **)(a1 + v25);
          *(void *)(a1 + v25) = v24;

          continue;
        case 0xEu:
          char v59 = 0;
          unsigned int v60 = 0;
          uint64_t v37 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v61 = *v3;
        uint64_t v62 = *(void *)(a2 + v61);
        unint64_t v63 = v62 + 1;
        if (v62 == -1 || v63 > *(void *)(a2 + *v4)) {
          break;
        }
        char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v62);
        *(void *)(a2 + v61) = v63;
        v37 |= (unint64_t)(v64 & 0x7F) << v59;
        if ((v64 & 0x80) == 0) {
          goto LABEL_93;
        }
        v59 += 7;
        BOOL v15 = v60++ >= 9;
        if (v15)
        {
          uint64_t v37 = 0;
          goto LABEL_95;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_93:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v37 = 0;
      }
LABEL_95:
      uint64_t v65 = 48;
LABEL_96:
      *(void *)(a1 + v65) = v37;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}