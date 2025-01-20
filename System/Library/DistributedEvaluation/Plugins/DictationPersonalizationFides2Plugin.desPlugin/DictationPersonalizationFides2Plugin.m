void sub_3E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,long long buf)
{
  id v33;
  NSObject *v34;

  if (a2 == 1)
  {
    v33 = objc_begin_catch(a1);
    v34 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "-[FidesSelfHelper _decodingMetricsFromMetricsDict:]";
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = a11;
      _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "%s Fides SELF: Encountered malformed string during SELF logging for interpolation weights in speech results from recognizer. String: %@", (uint8_t *)&buf, 0x16u);
      v34 = AFSiriLogContextFides;
    }
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[FidesSelfHelper _decodingMetricsFromMetricsDict:]";
      _os_log_error_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "%s Fides SELF: Expected interpolation weight sets separated by delimter ';' - starting with a set of weights del"
        "imited by ',' and ending the with start/end times delimited by ':'. Ex: '0.999646,0.000354:0:4280;0.947514,0.000158:0:3859'",
        (uint8_t *)&buf,
        0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x3D8CLL);
  }
  _Unwind_Resume(a1);
}

void sub_3F10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPreprocessingEntityCategoryCounts:v8];
}

void sub_3FB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = objc_alloc_init((Class)DODMLASRSchemaDODMLASREntityCategoryCount);
  [v8 setEntityCategory:v6];

  id v7 = [v5 unsignedLongValue];
  [v8 setCount:v7];
  [*(id *)(a1 + 32) addPostprocessingEntityCategoryCounts:v8];
}

void sub_6198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x608CLL);
  }
  _Unwind_Resume(exception_object);
}

id sub_6264(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 57) && *(unsigned char *)(a1 + 58))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_UNKNOWN ***)(a1 + 40);
  }
  else
  {
    [*(id *)(a1 + 48) logDictationPersonalizationExperimentEndedAndTier1WithResultsDict:*(void *)(a1 + 40)];
    if (!*(unsigned char *)(a1 + 59))
    {
      v4 = +[AFAnalytics sharedAnalytics];
      [v4 logEventWithType:2221 context:*(void *)(a1 + 40)];
    }
    v2 = *(void **)(a1 + 32);
    v3 = &off_116F8;
  }

  return [v2 completeWithJSONResult:v3 binaryResult:0 completionHandler:0];
}

void sub_62FC(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_should_defer(v3))
  {
    id v5 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[DictationPersonalizationFidesPlugin performEvaluation:]_block_invoke";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s PLM: eligibilityHandler deferred", (uint8_t *)&v6, 0xCu);
    }
    [WeakRetained _invalidate];
  }
}

id sub_63E4()
{
  v0 = AFLibraryDirectoryWithSubPath();
  v1 = [v0 stringByAppendingPathComponent:@"SpeechPersonalizedLM_Fides"];

  return v1;
}

void sub_7644(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    _Block_object_dispose(&STACK[0x350], 8);
    objc_begin_catch(a1);
    JUMPOUT(0x7510);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_7750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7760(uint64_t a1)
{
}

id sub_7768(uint64_t a1)
{
  [*(id *)(a1 + 32) logUserEditExperimentEndedAndTier1WithResultsDict:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  if (*(unsigned char *)(a1 + 56))
  {
    v2 = +[AFAnalytics sharedAnalytics];
    [v2 logEventWithType:2221 context:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  v3 = *(void **)(a1 + 40);

  return [v3 completeWithJSONResult:&off_116D0 binaryResult:0 completionHandler:0];
}

uint64_t sub_77F4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    *(void *)(*(void *)(result + 32) + 32) = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    return _objc_release_x1();
  }
  return result;
}

void sub_7864(uint64_t a1, void *a2)
{
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_should_defer(v3))
  {
    id v5 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]_block_invoke_2";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s SEE: eligibilityHandler deferred", (uint8_t *)&v6, 0xCu);
    }
    [WeakRetained _invalidate];
  }
}

void sub_794C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v6 && [v6 count])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    id v8 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s Failed to generate TTS audio, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void sub_7A54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]_block_invoke";
      __int16 v55 = 2112;
      id v56 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "%s Error running evaluation %@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v9 = [v5 objectForKeyedSubscript:@"modelVersion"];
    [v8 setValue:v9 forKey:@"modelVersion"];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v41 = v5;
    id obj = [v5 objectForKeyedSubscript:@"results"];
    id v10 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v45 = *(void *)v49;
      do
      {
        id v12 = 0;
        id v42 = v11;
        do
        {
          if (*(void *)v49 != v45) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v12);
          v47 = objc_opt_new();
          v14 = [v13 objectForKeyedSubscript:@"correctedOutput"];
          v15 = [v13 objectForKeyedSubscript:@"recognizedOutput"];
          if (v14)
          {
            v46 = v12;
            if (*(unsigned char *)(a1 + 64)
              && ([v13 objectForKeyedSubscript:@"editDistanceRecognizedTTSASR"],
                  v16 = objc_claimAutoreleasedReturnValue(),
                  id v17 = [v16 integerValue],
                  v16,
                  v17))
            {
              v18 = AFSiriLogContextFides;
              if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v54 = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]_block_invoke";
                _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "%s Recognized text and TTS ASR output did not match but was required to match, continuing", buf, 0xCu);
              }
              v19 = v47;
              [v47 setValue:&off_11680 forKey:@"errorCode"];
              [*(id *)(a1 + 32) addObject:v47];
            }
            else
            {
              [v47 setValue:&off_11698 forKey:@"errorCode"];
              v20 = [v13 objectForKeyedSubscript:@"timestamp"];
              [v47 setValue:v20 forKey:@"timestamp"];

              v21 = [v13 objectForKeyedSubscript:@"interactionId"];
              [v47 setValue:v21 forKey:@"interactionId"];

              v22 = v13;
              v19 = v47;
              v23 = [v22 objectForKeyedSubscript:@"asrSelfComponentIdentifier"];
              [v47 setValue:v23 forKey:@"asrSelfComponentIdentifier"];

              v24 = (char *)[v14 count];
              id v25 = [v47 mutableCopy];
              if ((uint64_t)v24 >= 1)
              {
                v26 = 0;
                do
                {
                  id v44 = v25;
                  uint64_t v27 = (uint64_t)(v26 + 1);
                  while (1)
                  {
                    v28 = [v14 objectAtIndexedSubscript:v26];
                    v29 = [v15 objectAtIndexedSubscript:v26];
                    char v30 = sub_8050(v28, v29, *(unsigned __int8 *)(a1 + 65));

                    if ((v30 & 1) == 0) {
                      break;
                    }
                    ++v26;
                    ++v27;
                    if ((uint64_t)v26 >= (uint64_t)v24)
                    {
                      id v25 = v44;
                      goto LABEL_31;
                    }
                  }
                  do
                  {
                    uint64_t v31 = v27;
                    if (v27 >= (uint64_t)v24) {
                      break;
                    }
                    v32 = [v14 objectAtIndexedSubscript:v27];
                    v33 = [v15 objectAtIndexedSubscript:v27];
                    int v34 = sub_8050(v32, v33, *(unsigned __int8 *)(a1 + 65));

                    ++v27;
                  }
                  while (!v34);
                  uint64_t v35 = (uint64_t)&v26[-*(void *)(a1 + 48)];
                  uint64_t v36 = v35 & ~(v35 >> 63);
                  uint64_t v37 = *(void *)(a1 + 56) + v31;
                  if ((uint64_t)v24 >= v37) {
                    v26 = (char *)v37;
                  }
                  else {
                    v26 = v24;
                  }
                  v38 = objc_msgSend(v14, "subarrayWithRange:", v35 & ~(v35 >> 63), &v26[-v36]);
                  [v44 setValue:v38 forKey:@"correctedPair"];

                  v39 = objc_msgSend(v15, "subarrayWithRange:", v36, &v26[-v36]);
                  [v44 setValue:v39 forKey:@"recognizedPair"];

                  [*(id *)(a1 + 32) addObject:v44];
                  v19 = v47;
                  id v25 = [v47 mutableCopy];
                }
                while ((uint64_t)v24 > v37);
              }
LABEL_31:

              id v11 = v42;
            }
            id v12 = v46;
          }
          else
          {
            v40 = AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v54 = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]_block_invoke";
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "%s ASR failure when performing systematic error evaluation, continuing", buf, 0xCu);
            }
            v19 = v47;
            [v47 setValue:&off_11668 forKey:@"errorCode"];
            [*(id *)(a1 + 32) addObject:v47];
          }

          id v12 = (char *)v12 + 1;
        }
        while (v12 != v11);
        id v11 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v11);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:*(void *)(a1 + 32) forKey:@"confusionPairs"];
    id v6 = 0;
    id v5 = v41;
  }
}

unint64_t sub_8050(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  unint64_t v8 = 0;
  if (v5 && v6)
  {
    if (a3) {
      unint64_t v8 = (unint64_t)[v5 isEqualToString:v6];
    }
    else {
      unint64_t v8 = [v5 caseInsensitiveCompare:v6] == 0;
    }
  }

  return v8;
}

void sub_8830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_8884(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    *(void *)(*(void *)(result + 32) + 32) = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    return _objc_release_x1();
  }
  return result;
}

void sub_88F4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  id v7 = [v5 objectForKeyedSubscript:@"results"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
        v13 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
        [v12 addObject:v13];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  id v14 = [v5 mutableCopy];
  [v14 setObject:0 forKeyedSubscript:@"results"];
  if ([v14 count])
  {
    [v14 setObject:a1[4] forKeyedSubscript:@"language"];
    [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v14];
  }
}

void sub_8AAC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  id v7 = [v5 objectForKeyedSubscript:@"results"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
        v13 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
        [v12 addObject:v13];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  id v14 = [v5 mutableCopy];
  [v14 setObject:0 forKeyedSubscript:@"results"];
  if ([v14 count])
  {
    [v14 setObject:a1[4] forKeyedSubscript:@"language"];
    [*(id *)(*(void *)(a1[7] + 8) + 40) addObject:v14];
  }
}

void sub_98DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_9934(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_9994(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    *(void *)(*(void *)(result + 32) + 24) = objc_alloc_init((Class)SpeechModelTrainingClient);
    return _objc_release_x1();
  }
  return result;
}

void sub_99F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainingAssetOut:resultOut:err"
          "or:]_block_invoke_2";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%s PLM: Client finished training", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

uint64_t sub_A14C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

id sub_A1F8(uint64_t a1)
{
  v2 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[DictationPersonalizationFidesPlugin _invalidate]_block_invoke";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s PLM: Invalidating", (uint8_t *)&v4, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  return [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
}

uint64_t AFIsInternalInstall()
{
  return _AFIsInternalInstall();
}

uint64_t AFLibraryDirectoryWithSubPath()
{
  return _AFLibraryDirectoryWithSubPath();
}

uint64_t AFOfflineDictationLanguageForKeyboardLanguage()
{
  return _AFOfflineDictationLanguageForKeyboardLanguage();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return _AFOfflineDictationStatusStringIsInstalled();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return _xpc_activity_add_eligibility_changed_handler();
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return _xpc_activity_remove_eligibility_changed_handler();
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__invalidated(void *a1, const char *a2, ...)
{
  return [a1 _invalidated];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_correctedText(void *a1, const char *a2, ...)
{
  return [a1 correctedText];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dictationIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 dictationIsEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_logDictationPersonalizationExperimentStartedOrChanged(void *a1, const char *a2, ...)
{
  return [a1 logDictationPersonalizationExperimentStartedOrChanged];
}

id objc_msgSend_logUserEditExperimentStartedOrChanged(void *a1, const char *a2, ...)
{
  return [a1 logUserEditExperimentStartedOrChanged];
}

id objc_msgSend_matchingRecordSet(void *a1, const char *a2, ...)
{
  return [a1 matchingRecordSet];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return [a1 modelVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nativeRecordInfo(void *a1, const char *a2, ...)
{
  return [a1 nativeRecordInfo];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_samplingRate(void *a1, const char *a2, ...)
{
  return [a1 samplingRate];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalytics];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedStream(void *a1, const char *a2, ...)
{
  return [a1 sharedStream];
}

id objc_msgSend_siriDataSharingOptInStatus(void *a1, const char *a2, ...)
{
  return [a1 siriDataSharingOptInStatus];
}

id objc_msgSend_thermalState(void *a1, const char *a2, ...)
{
  return [a1 thermalState];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}