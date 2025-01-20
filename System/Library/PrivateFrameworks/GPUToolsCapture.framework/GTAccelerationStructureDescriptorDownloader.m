@interface GTAccelerationStructureDescriptorDownloader
@end

@implementation GTAccelerationStructureDescriptorDownloader

void __GTAccelerationStructureDescriptorDownloader_make_block_invoke(uint64_t a1)
{
}

void __GTAccelerationStructureDescriptorDownloader_postProcess_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v38 = a3;
  id v39 = a2;
  v4 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GTAccelerationStructureDescriptorDownloader_postProcess_event", (const char *)&unk_21C232, buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 56);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = *(id *)(a1 + 32);
  id v6 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v53;
    v9 = &v46;
    s();
    v11 = v10;
    uint64_t v13 = v12 + 43;
    v40 = v10;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(obj);
        }
        v43 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v15 = objc_msgSend(v43, "stateBuffer", v38);
        v44 = v15;
        if (v15)
        {
          v16 = (const float *)((char *)[v15 contents] + 4);
          int32x4_t v17 = (int32x4_t)vld1q_dup_f32(v16);
          int16x4_t v18 = vmovn_s32(vtstq_s32(v17, (int32x4_t)xmmword_1DA270));
        }
        else
        {
          int16x4_t v18 = 0;
        }
        int8x8_t v42 = (int8x8_t)v18;
        uint64_t v19 = *(void *)(a1 + 72);
        uint64_t *v9 = 0;
        v9[1] = 0;
        *(void *)buf = v19;
        uint64_t v48 = (uint64_t)i + v5;
        uint64_t v20 = *v11;
        uint64_t *v11 = (uint64_t)i + v5;
        uint64_t v49 = v20;
        char v50 = *((unsigned char *)v11 + 8);
        __int16 v51 = 16400;
        *(_DWORD *)uint64_t v13 = 0;
        *(unsigned char *)(v13 + 4) = 0;
        GTTraceEncoder_setStream((uint64_t *)buf, (uint64_t)[*(id *)(a1 + 40) traceStream]);
        uint64_t v21 = v47;
        *(_DWORD *)(v47 + 8) = -10158;
        char v22 = v51;
        if (v51 > 0x20uLL)
        {
          uint64_t v24 = *(void *)(v46 + 24);
          uint64_t v25 = v13;
          id v26 = v7;
          uint64_t v27 = a1;
          v28 = v9;
          uint64_t v29 = v8;
          uint64_t v30 = v5;
          uint64_t v31 = HIBYTE(v51);
          ++HIBYTE(v51);
          v23 = (uint32x4_t *)(GTTraceMemPool_allocateBytes(v24, v48, v31 | 0x2000000000) + 16);
          char v22 = v31;
          uint64_t v5 = v30;
          uint64_t v8 = v29;
          v9 = v28;
          a1 = v27;
          id v7 = v26;
          uint64_t v13 = v25;
          v11 = v40;
        }
        else
        {
          v23 = (uint32x4_t *)(v21 + v51);
          LOBYTE(v51) = v51 + 32;
        }
        *(unsigned char *)(v21 + 13) = v22;
        v32 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
        if (v32) {
          uint64_t v33 = *v32;
        }
        else {
          uint64_t v33 = 0;
        }
        v34 = (uint64_t *)[v43 traceStream];
        if (v34) {
          uint64_t v35 = *v34;
        }
        else {
          uint64_t v35 = 0;
        }
        v23->i64[0] = v33;
        v23->i64[1] = v35;
        v23[1] = vmovl_u16((uint16x4_t)vand_s8(v42, (int8x8_t)0x1000100010001));
        uint64_t *v11 = v49;
        *((unsigned char *)v11 + 8) = v50;
        *(unsigned char *)(v47 + 15) |= 8u;
      }
      v5 += (uint64_t)i;
      id v7 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v7);
  }

  [v39 setSignaledValue:v38 + 1];
  v36 = [*(id *)(a1 + 48) dispatchGroup];
  dispatch_group_leave(v36);

  v37 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GTAccelerationStructureDescriptorDownloader_postProcess_event", (const char *)&unk_21C232, buf, 2u);
  }
}

void __GTAccelerationStructureDescriptorDownloader_markChildren_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) device];
  BuildPipelines(v1);
}

void __GTAccelerationStructureDescriptorDownloader_fillChildrenBuffer_block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) device];
  BuildPipelines(v1);
}

@end