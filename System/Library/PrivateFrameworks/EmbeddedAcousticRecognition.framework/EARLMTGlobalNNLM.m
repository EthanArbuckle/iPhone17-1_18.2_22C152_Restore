@interface EARLMTGlobalNNLM
@end

@implementation EARLMTGlobalNNLM

uint64_t __44___EARLMTGlobalNNLM_attachmentURL_withName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 lastPathComponent];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __31___EARLMTGlobalNNLM_loadWeight__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (([v16 isEqualToString:&stru_1F0A64AB0] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v4 = [v16 componentsSeparatedByCharactersInSet:v3];

    v5 = [v4 objectAtIndex:0];
    v6 = [v4 objectAtIndex:1];
    v7 = [v4 objectAtIndex:2];
    v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];

    if (!v8)
    {
      v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v10 = objc_opt_new();
      [v9 setValue:v10 forKey:v5];
    }
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
    [v11 setValue:v7 forKey:v6];

    if ((unint64_t)[v4 count] >= 4)
    {
      v12 = [v4 objectAtIndex:3];
      v13 = [v4 objectAtIndex:4];
      v14 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
      [v14 setValue:v12 forKey:@"nB"];

      v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
      [v15 setValue:v13 forKey:@"nC"];
    }
  }
}

void __32___EARLMTGlobalNNLM_saveWeight___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (([v16 isEqualToString:&stru_1F0A64AB0] & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v4 = [v16 componentsSeparatedByCharactersInSet:v3];

    v5 = [v4 objectAtIndex:0];
    v6 = [v4 objectAtIndex:1];
    v7 = [v4 objectAtIndex:2];
    v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];

    if (!v8)
    {
      v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v10 = objc_opt_new();
      [v9 setValue:v10 forKey:v5];
    }
    v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
    [v11 setValue:v7 forKey:v6];

    if ((unint64_t)[v4 count] >= 4)
    {
      v12 = [v4 objectAtIndex:3];
      v13 = [v4 objectAtIndex:4];
      v14 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
      [v14 setValue:v12 forKey:@"nB"];

      v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v5];
      [v15 setValue:v13 forKey:@"nC"];
    }
  }
}

uint64_t __26___EARLMTGlobalNNLM_setup__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 96) addTokenizedText:a2 length:*(void *)(a1 + 40)];
}

void __60___EARLMTGlobalNNLM_findTensorsIndicesByKeyWord_tensorInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 containsString:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

uint64_t __26___EARLMTGlobalNNLM_train__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  unint64_t v38 = a2;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  for (unint64_t i = 0; i < objc_msgSend(v6, "numberOfDataPoints", v38); ++i)
  {
    id v46 = 0;
    id v8 = [v6 dataPointAtIndex:i error:&v46];
    id v9 = v46;
    if (v9)
    {
      id v31 = v9;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
        __26___EARLMTGlobalNNLM_train__block_invoke_cold_1();
      }
LABEL_39:

      uint64_t v35 = 0;
      goto LABEL_40;
    }
    v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    v11 = [v8 objectForKeyedSubscript:v10];
    v12 = (float *)[v11 dataPointer];

    v13 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      double v15 = *v12;
      *(_DWORD *)buf = 134218240;
      unint64_t v49 = i;
      __int16 v50 = 2048;
      double v51 = v15;
      _os_log_impl(&dword_1B1A86000, v13, OS_LOG_TYPE_INFO, "Cost for batch %lu = %f", buf, 0x16u);
    }
    id v16 = *(void **)(a1 + 40);
    *(float *)&double v14 = *v12;
    v17 = [NSNumber numberWithFloat:v14];
    [v16 addObject:v17];
  }
  v18 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v49 = v38;
    __int16 v50 = 2112;
    double v51 = *(double *)&v6;
    _os_log_impl(&dword_1B1A86000, v18, OS_LOG_TYPE_INFO, "Espresso training iteration=%lu result=%@", buf, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 48) + 96) shuffleSamples];
  [*(id *)(*(void *)(a1 + 48) + 104) setVectorsWithProcessor:*(void *)(*(void *)(a1 + 48) + 96)];
  v19 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v49 = v38;
    _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, "Finish running train epoch number %lu", buf, 0xCu);
  }
  float v20 = *(float *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v20 > 0.0)
  {
    multiply(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 1.0 / v20);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      float v21 = l2norm(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      float v22 = *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      if (v21 > v22) {
        multiply(*(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v22 / v21);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    goto LABEL_31;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 48) + 152);
  uint64_t v23 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v23) {
    goto LABEL_30;
  }
  uint64_t v40 = *(void *)v43;
  while (2)
  {
    for (uint64_t j = 0; j != v23; ++j)
    {
      if (*(void *)v43 != v40) {
        objc_enumerationMutation(v8);
      }
      uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * j);
      uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKey:v25];
      v27 = (void *)v26;
      if (v20 > 0.0 && v26 != 0)
      {
        v29 = [*(id *)(*(void *)(a1 + 48) + 152) objectForKeyedSubscript:v25];
        id v41 = 0;
        LODWORD(v30) = 1.0;
        [v27 applyToTensor:v29 scale:&v41 error:v30];
        id v31 = v41;

        if (v31)
        {
          v36 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
            __26___EARLMTGlobalNNLM_train__block_invoke_cold_3(v36);
          }
        }
        else
        {
          v32 = [v39 getTensorNamed:v25 directBind:1];
          v33 = [*(id *)(*(void *)(a1 + 48) + 152) objectForKeyedSubscript:v25];
          _copy(v32, v33);
          id v31 = (id)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            [v27 reset];
            goto LABEL_28;
          }
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
            __26___EARLMTGlobalNNLM_train__block_invoke_cold_2();
          }
        }

        goto LABEL_39;
      }
LABEL_28:
    }
    uint64_t v23 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_30:

  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_31:
  id v34 = _fetchTensors(*(void **)(*(void *)(a1 + 48) + 168), *(void **)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 128));
  uint64_t v35 = 1;
LABEL_40:

  return v35;
}

uint64_t __26___EARLMTGlobalNNLM_train__block_invoke_307(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v55 = a4;
  id v68 = 0;
  unint64_t v49 = (void *)a2;
  __int16 v50 = v7;
  double v51 = [v7 dataPointAtIndex:a2 error:&v68];
  id v8 = v68;
  if (v8)
  {
    id v9 = v8;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_4();
    }
    goto LABEL_51;
  }
  v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  uint64_t v56 = a1;
  v11 = [v51 objectForKeyedSubscript:v10];

  float v12 = *(float *)[v11 dataPointer];
  uint64_t v13 = a1;
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12
                                                             + *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v14 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
  {
    __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_3(v14, v12);
    uint64_t v13 = a1;
  }
  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v64 = 0u;
  obuint64_t j = *(id *)(*(void *)(v13 + 40) + 152);
  uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v15)
  {
    id v53 = *(id *)v65;
    *(void *)&long long v16 = 138412546;
    long long v48 = v16;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(id *)v65 != v53) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(*(void *)(v56 + 56) + 8) + 40), "objectForKey:", v18, v48);
        v19 = (GradientBuffer *)objc_claimAutoreleasedReturnValue();
        float v20 = (void *)MEMORY[0x1B3EA9930]();
        float v21 = [v55 getTensorNamed:v18 directBind:1];
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(v56 + 64) + 8) + 40) containsObject:v18];
        if (v19)
        {
          uint64_t v23 = [*(id *)(*(void *)(v56 + 40) + 152) objectForKeyedSubscript:v18];
          id v62 = 0;
          *(float *)&double v24 = v12;
          [(GradientBuffer *)v19 accumulateDifferenceBetweenTensorBefore:v23 andTensorAfter:v21 withScale:&v62 error:v24];
          id v9 = v62;
        }
        else
        {
          uint64_t v25 = [GradientBuffer alloc];
          uint64_t v26 = [*(id *)(*(void *)(v56 + 40) + 152) objectForKeyedSubscript:v18];
          id v63 = 0;
          *(float *)&double v27 = v12;
          v19 = [(GradientBuffer *)v25 initWithTensorBefore:v26 tensorAfter:v21 withScale:v22 shouldSparsify:&v63 error:v27];
          id v9 = v63;

          [*(id *)(*(void *)(*(void *)(v56 + 56) + 8) + 40) setObject:v19 forKeyedSubscript:v18];
        }
        if (v9)
        {
          v28 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v71 = v49;
            __int16 v72 = 2112;
            v73 = v18;
            _os_log_error_impl(&dword_1B1A86000, v28, OS_LOG_TYPE_ERROR, "Unable to accumulate gradient of batch %lu for %@", buf, 0x16u);
          }
        }
        else if (v22)
        {
          v29 = (id)sLog;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            double v30 = [(GradientBuffer *)v19 description];
            *(_DWORD *)buf = v48;
            v71 = v18;
            __int16 v72 = 2112;
            v73 = v30;
            _os_log_debug_impl(&dword_1B1A86000, v29, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
          }
        }

        if (v9)
        {

LABEL_51:
          uint64_t v44 = 0;
          goto LABEL_52;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v15);
  }

  id v31 = (void *)v56;
  unint64_t v32 = ((unint64_t)v49 + 1) % *(int *)(v56 + 96);
  if (!v32)
  {
    multiply(*(void **)(*(void *)(*(void *)(v56 + 56) + 8) + 40), 1.0 / *(float *)(*(void *)(*(void *)(v56 + 48) + 8) + 24));
    if (*(unsigned char *)(*(void *)(*(void *)(v56 + 72) + 8) + 24))
    {
      float v45 = l2norm(*(void **)(*(void *)(*(void *)(v56 + 56) + 8) + 40));
      float v46 = *(float *)(*(void *)(*(void *)(v56 + 80) + 8) + 24);
      if (v45 > v46) {
        multiply(*(void **)(*(void *)(*(void *)(v56 + 56) + 8) + 40), v46 / v45);
      }
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v54 = *(id *)(*(void *)(v56 + 40) + 152);
  uint64_t v33 = [v54 countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (!v33) {
    goto LABEL_39;
  }
  uint64_t v34 = *(void *)v59;
  while (2)
  {
    for (uint64_t j = 0; j != v33; ++j)
    {
      if (*(void *)v59 != v34) {
        objc_enumerationMutation(v54);
      }
      v36 = *(void **)(*((void *)&v58 + 1) + 8 * j);
      uint64_t v37 = [*(id *)(*(void *)(v31[7] + 8) + 40) objectForKeyedSubscript:v36];
      unint64_t v38 = (void *)v37;
      if (*(unsigned char *)(*(void *)(v31[11] + 8) + 24))
      {
        if (!v32 && v37)
        {
          id v39 = [*(id *)(v31[5] + 152) objectForKeyedSubscript:v36];
          id v57 = 0;
          LODWORD(v40) = 1.0;
          [v38 applyToTensor:v39 scale:&v57 error:v40];
          id v9 = v57;

          if (v9)
          {
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
              __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_2();
            }
            goto LABEL_50;
          }
          [v38 reset];
          id v31 = (void *)v56;
          id v41 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v36;
            _os_log_debug_impl(&dword_1B1A86000, v41, OS_LOG_TYPE_DEBUG, "Applied gradient on %@", buf, 0xCu);
          }
        }
        long long v42 = [v55 getTensorNamed:v36 directBind:1];
        long long v43 = [*(id *)(v31[5] + 152) objectForKeyedSubscript:v36];
        _copy(v42, v43);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!v9) {
          goto LABEL_37;
        }
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
          __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_1();
        }
LABEL_50:

        goto LABEL_51;
      }
LABEL_37:

      id v31 = (void *)v56;
    }
    uint64_t v33 = [v54 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v33) {
      continue;
    }
    break;
  }
LABEL_39:

  id v9 = 0;
  if (!v32) {
    *(_DWORD *)(*(void *)(*(void *)(v56 + 48) + 8) + 24) = 0;
  }
  uint64_t v44 = 1;
LABEL_52:

  return v44;
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "epochCallback is unable to retrieve output of iteration %lu", v2, v3, v4, v5, v6);
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_2(&dword_1B1A86000, v0, v1, "Unable to set %@ after epoch %lu");
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Unable to apply gradient", v1, 2u);
}

void __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_2(&dword_1B1A86000, v0, v1, "Unable to set %@ after batch %lu");
}

void __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Unable to apply gradient for %@", v2, v3, v4, v5, v6);
}

void __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_3(os_log_t log, float a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = (int)a2;
  _os_log_debug_impl(&dword_1B1A86000, log, OS_LOG_TYPE_DEBUG, "batchSize == %d", (uint8_t *)v2, 8u);
}

void __26___EARLMTGlobalNNLM_train__block_invoke_307_cold_4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "batchCallback is unable to retrieve outputs for batch %lu", v2, v3, v4, v5, v6);
}

@end