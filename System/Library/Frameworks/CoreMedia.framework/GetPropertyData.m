@interface GetPropertyData
@end

@implementation GetPropertyData

CFIndex __brokeredPlugin_GetPropertyData_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 40));
  unint64_t v3 = *(unsigned int *)(a1 + 56);
  if (result >= (uint64_t)(v3 >> 2)) {
    unint64_t v4 = v3 >> 2;
  }
  else {
    unint64_t v4 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 1)
  {
    CFIndex v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 40), v5);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = *(uint64_t (**)(const void *))(v8 + 8);
      if (v9) {
        CFIndex result = v9(ValueAtIndex);
      }
      else {
        CFIndex result = 0;
      }
      *(_DWORD *)(*(void *)(a1 + 48) + 4 * v5++) = result;
    }
    while (v5 < *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __brokeredPlugin_GetPropertyData_block_invoke_2(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 40));
  if (Count < 1) {
    goto LABEL_18;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  CFIndex v5 = **(const void ***)(a1 + 40);
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 40), v4);
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 24);
    uint64_t v8 = v7 ? v7 : 0;
    v9 = *(uint64_t (**)(const void *))(v8 + 8);
    if (v9)
    {
      v10 = (const void *)v9(ValueAtIndex);
      int v11 = FigCFEqual(v5, v10);
      if (v10) {
        CFRelease(v10);
      }
    }
    else
    {
      int v11 = FigCFEqual(v5, 0);
    }
    if (v11) {
      break;
    }
    if (v3 == ++v4) {
      goto LABEL_18;
    }
  }
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16);
  uint64_t v13 = v12 ? v12 : 0;
  v14 = *(uint64_t (**)(const void *))(v13 + 8);
  if (v14) {
    uint64_t result = v14(ValueAtIndex);
  }
  else {
LABEL_18:
  }
    uint64_t result = 0;
  **(_DWORD **)(a1 + 48) = result;
  return result;
}

CFIndex __plugin_GetPropertyData_block_invoke(uint64_t a1)
{
  CFIndex result = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 24));
  unint64_t v3 = *(unsigned int *)(a1 + 56);
  if (result >= (uint64_t)(v3 >> 2)) {
    unint64_t v4 = v3 >> 2;
  }
  else {
    unint64_t v4 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 1)
  {
    CFIndex v5 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 40) + 24), v5);
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      v9 = *(uint64_t (**)(const void *))(v8 + 8);
      if (v9) {
        CFIndex result = v9(ValueAtIndex);
      }
      else {
        CFIndex result = 0;
      }
      *(_DWORD *)(*(void *)(a1 + 48) + 4 * v5++) = result;
    }
    while (v5 < *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  return result;
}

uint64_t __plugin_GetPropertyData_block_invoke_2(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 32) + 24));
  if (Count < 1) {
    goto LABEL_18;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  CFIndex v5 = **(const void ***)(a1 + 40);
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(void *)(a1 + 32) + 24), v4);
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 24);
    uint64_t v8 = v7 ? v7 : 0;
    v9 = *(uint64_t (**)(const void *))(v8 + 8);
    if (v9)
    {
      v10 = (const void *)v9(ValueAtIndex);
      int v11 = FigCFEqual(v5, v10);
      if (v10) {
        CFRelease(v10);
      }
    }
    else
    {
      int v11 = FigCFEqual(v5, 0);
    }
    if (v11) {
      break;
    }
    if (v3 == ++v4) {
      goto LABEL_18;
    }
  }
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable((uint64_t)ValueAtIndex) + 16);
  uint64_t v13 = v12 ? v12 : 0;
  v14 = *(uint64_t (**)(const void *))(v13 + 8);
  if (v14) {
    uint64_t result = v14(ValueAtIndex);
  }
  else {
LABEL_18:
  }
    uint64_t result = 0;
  **(_DWORD **)(a1 + 48) = result;
  return result;
}

void __endpointCentricPlugin_GetPropertyData_block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (*(void *)(v3 + 64)) {
    ++v5;
  }
  *(void *)(v4 + 24) = v5;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 72));
  v6 = malloc_type_calloc(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 8uLL, 0x2004093837F09uLL);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 64);
  if (v9)
  {
    void *v6 = v9;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = 1;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v8 + 72), 0, (const void **)&v6[v9]);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v11 = *(void *)(v10 + 24);
  if (v11 >= (unint64_t)*(unsigned int *)(a1 + 72) >> 2) {
    unint64_t v11 = (unint64_t)*(unsigned int *)(a1 + 72) >> 2;
  }
  *(void *)(v10 + 24) = v11;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v12 >= 1)
  {
    for (uint64_t i = 0; i < v12; ++i)
    {
      uint64_t v14 = v7[i];
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable(v14) + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      v17 = *(uint64_t (**)(uint64_t))(v16 + 8);
      if (v17) {
        uint64_t v18 = v17(v14);
      }
      else {
        uint64_t v18 = 0;
      }
      *(_DWORD *)(*(void *)(a1 + 48) + 4 * i) = v18;
      CFStringAppendFormat(Mutable, 0, @" %u", v18);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
  **(_DWORD **)(a1 + 56) = 4 * v12;
  v42[0] = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v42, &type);
  int v20 = v42[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
    unsigned int v22 = v20;
  }
  else {
    unsigned int v22 = v20 & 0xFFFFFFFE;
  }
  if (v22)
  {
    unint64_t v23 = **(unsigned int **)(a1 + 64);
    unint64_t v24 = v23 >> 24;
    uint64_t v25 = MEMORY[0x1E4F14390];
    if ((v23 & 0x80000000) != 0)
    {
      int v26 = __maskrune(HIBYTE(**(_DWORD **)(a1 + 64)), 0x40000uLL);
      LODWORD(v23) = **(_DWORD **)(a1 + 64);
    }
    else
    {
      int v26 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v24 + 60) & 0x40000;
    }
    if (v26) {
      int v28 = v24;
    }
    else {
      int v28 = 46;
    }
    int v40 = v28;
    int v29 = BYTE2(v23);
    if (BYTE2(v23) > 0x7Fu)
    {
      int v30 = __maskrune(BYTE2(v23), 0x40000uLL);
      LODWORD(v23) = **(_DWORD **)(a1 + 64);
    }
    else
    {
      int v30 = *(_DWORD *)(v25 + 4 * BYTE2(v23) + 60) & 0x40000;
    }
    if (v30) {
      int v31 = v29;
    }
    else {
      int v31 = 46;
    }
    int v32 = BYTE1(v23);
    uint64_t v33 = v25;
    if (BYTE1(v23) > 0x7Fu)
    {
      int v34 = __maskrune(BYTE1(v23), 0x40000uLL);
      LOBYTE(v23) = **(unsigned char **)(a1 + 64);
    }
    else
    {
      int v34 = *(_DWORD *)(v25 + 4 * BYTE1(v23) + 60) & 0x40000;
    }
    if (v34) {
      int v35 = v32;
    }
    else {
      int v35 = 46;
    }
    int v36 = v23;
    if (v23 > 0x7Fu) {
      int v37 = __maskrune(v23, 0x40000uLL);
    }
    else {
      int v37 = *(_DWORD *)(v33 + 4 * v23 + 60) & 0x40000;
    }
    if (v37) {
      int v38 = v36;
    }
    else {
      int v38 = 46;
    }
    uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v42[1] = 136316674;
    v43 = "endpointCentricPlugin_GetPropertyData_block_invoke";
    __int16 v44 = 1024;
    int v45 = v40;
    __int16 v46 = 1024;
    int v47 = v31;
    __int16 v48 = 1024;
    int v49 = v35;
    __int16 v50 = 1024;
    int v51 = v38;
    __int16 v52 = 2048;
    uint64_t v53 = v39;
    __int16 v54 = 2112;
    v55 = Mutable;
    v27 = (char *)_os_log_send_and_compose_impl();
    LOBYTE(v20) = v42[0];
  }
  else
  {
    v27 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v27, v27 != &v56, v20, 0, v21);
  CFRelease(Mutable);
  free(v7);
}

void __endpointCentricPlugin_GetPropertyData_block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 64);
  CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v2 + 72));
  if (v3) {
    int64_t v5 = Count + 1;
  }
  else {
    int64_t v5 = Count;
  }
  v6 = malloc_type_calloc(v5, 8uLL, 0x2004093837F09uLL);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 64);
  if (v9)
  {
    void *v6 = v9;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = 1;
  }
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v8 + 72), 0, (const void **)&v6[v9]);
  if (v5 >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = v7[v10];
      uint64_t v12 = *(void *)(CMBaseObjectGetVTable(v11) + 24);
      uint64_t v13 = v12 ? v12 : 0;
      uint64_t v14 = *(uint64_t (**)(uint64_t))(v13 + 8);
      uint64_t v15 = v14 ? (const void *)v14(v11) : 0;
      if (!FigCFEqual(**(CFTypeRef **)(a1 + 48), v15)) {
        break;
      }
      uint64_t v16 = v7[v10];
      uint64_t v17 = *(void *)(CMBaseObjectGetVTable(v16) + 16);
      uint64_t v18 = v17 ? v17 : 0;
      v19 = *(uint64_t (**)(uint64_t))(v18 + 8);
      if (!v19) {
        break;
      }
      int v20 = v19(v16);
      if (v15) {
        goto LABEL_22;
      }
LABEL_23:
      if (++v10 >= v5 || v20) {
        goto LABEL_27;
      }
    }
    int v20 = 0;
    if (!v15) {
      goto LABEL_23;
    }
LABEL_22:
    CFRelease(v15);
    goto LABEL_23;
  }
  int v20 = 0;
LABEL_27:
  unsigned int v21 = *(_DWORD *)(a1 + 72);
  **(_DWORD **)(a1 + 56) = 4;
  if (v21 < 4)
  {
    int v22 = 561211770;
  }
  else
  {
    int v22 = 0;
    **(_DWORD **)(a1 + 64) = v20;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v22;

  free(v7);
}

@end